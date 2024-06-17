Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EB90B1A4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF33010E3EC;
	Mon, 17 Jun 2024 14:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TyCdwMrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A2310E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:22:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4217ee64ac1so3847235e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718634164; x=1719238964; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dyNt4ZyhZmmJmgmGPprgC4IMzUnvgTuB5J5I9YRI8rk=;
 b=TyCdwMrcv+Ma8oj3H/uA9nwdKVxjj4mQBtF0CkqQaHH1xy5xfDRoEQED92vpM3Ad4s
 J70gEKR5Xb+D96V43e/06jjNhzPQ2bm1VR9QvoQsye/ZErcySuKp5NI7GaeFVbiBqleY
 89zpdZrFA4/bdrl8zlYVKkbBc5479sOIw+kqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718634164; x=1719238964;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dyNt4ZyhZmmJmgmGPprgC4IMzUnvgTuB5J5I9YRI8rk=;
 b=GK5pbvbd9ln4wPpgUYXWC0pimkQ8CUTuike01NAGvP7sspKeukhzBR3A2DcNilhimh
 ZSrin/hRuTPYQRjs1x4rsUAReiZ7zS+I8LVdXcQ/Can2mLEOzRk8jjop6sAWqwNFe4P4
 SxjkIjLG5AgqsDrFmIt8k1JVUG7Cg6aBS946uhr2eQJqk4QGqeP15iahqLxHrqs1Rwoo
 2g6Cf8GJICyq/gHT1+rusnkFif5brr4HYWZSwXu4OYvyQYrERMBXdtLLZoqyllz5bmhO
 LZzj3sxdOIVHKoH1xz53Mm+7cvmksbzGh6x16nUr3PXhDjCjlH8heElxyTGvFAHeUQEr
 oGyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV06BTzoSj7KHgl3qIAAezp5PXY7aZrlId560rG7yRfKSyDMmrs1ApVbmkE8qxqrxYJhvqV4nxVZWee+huleFPPxO4y50czMnP3yi+6ijSV
X-Gm-Message-State: AOJu0YyFL6cCpTvLHXcI4KCUGo5aVIjTdvwfnFAr9862GmmmTNHMZQH9
 3diiKP/1owb8srpqxV5Zo8EhuZrFy4ZDRIHzftNaf/LdDQ9Lz7m9JMQHyKnabt8=
X-Google-Smtp-Source: AGHT+IEGghyzbMHtQycrPx9Dot715eRsnM/fEnwlvPBMUVNpEJWWgqMM/FVX5TMqnsDb0OXky7e3VQ==
X-Received: by 2002:a05:600c:3b9b:b0:421:bb51:d630 with SMTP id
 5b1f17b1804b1-42304843ecemr72345915e9.2.1718634164125; 
 Mon, 17 Jun 2024 07:22:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104b8bsm12028454f8f.105.2024.06.17.07.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:22:43 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:22:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <ZnBGsbeJfvqP7wqI@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
 <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 12, 2024 at 10:22:49AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 9:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Wed, Jun 12, 2024 at 5:11 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Wed, Jun 12, 2024 at 07:49:31AM -0700, Doug Anderson wrote:
> > (...)
> > > > The problem is that the ordering is wrong, I think. Even if the OS was
> > > > calling driver shutdown functions in the perfect order (which I'm not
> > > > convinced about since panels aren't always child "struct device"s of
> > > > the DRM device), the OS should be calling panel shutdown _before_
> > > > shutting down the DRM device. That means that with your suggestion:
> > > >
> > > > 1. Shutdown starts and panel is on.
> > > >
> > > > 2. OS calls panel shutdown call, which prints warnings because panel
> > > > is still on.
> > > >
> > > > 3. OS calls DRM driver shutdown call, which prints warnings because
> > > > someone else turned the panel off.
> > >
> > > Uh, that's a _much_ more fundamental issue.
> > >
> > > The fix for that is telling the driver core about this dependency with
> > > device_link_add. Unfortuantely, despite years of me trying to push for
> > > this, drm_bridge and drm_panel still don't automatically add these,
> > > because the situation is a really complex mess.
> > >
> > > Probably need to read dri-devel archives for all the past attempts around
> > > device_link_add.
> >
> > I think involving Saravana Kannan in the discussions around this
> > is the right thing to do, because he knows how to get devicelinks
> > to do the right thing.
> >
> > If we can describe what devicelink needs to do to get this ordering
> > right, I'm pretty sure Saravana can tell us how to do it.
> 
> I'm really not convinced that hacking with device links in order to
> get the shutdown notification in the right order is correct, though.
> The idea is that after we're confident that all DRM modeset drivers
> are calling shutdown properly that we should _remove_ any code
> handling shutdown from panel-edp and panel-simple. They should just
> get disabled as part of DRM's shutdown. That means that if we messed
> with devicelinks just to get a different shutdown order that it was
> just for a short term thing.

The device links would allow us to add consistency checks to the panel
code to make sure that the shutdown has already happened.

And we do kinda need the device ordering still, because if they're shut
down in the wrong order the panel might lose it's power already, before
the drm driver had a chance to have the last chat with it. Only relevant
for non-dumb panels like dsi, but there's cases.

> That being said, one could argue that having device links between the
> DRM device and the panel is the right thing long term anyway and that
> may well be. I guess the issue is that it's not necessarily obvious
> how the "parent/child" or "supplier/consumer" relationship works w/
> DRM devices, especially panels. My instinct says that the panel
> logically is a "child" or "consumer" of the DRM device and thus
> inserting the correct long term device link would mean we'd get
> shutdown notification in the wrong order. It would be hard to argue
> that the panel is the "parent" of a DRM device, but I guess you could
> call it a "supplier"? ...but it's also a "consumer" of some other
> stuff, like the pixels being output and also (perhaps) the DP AUX bus.
> All this complexity is why the DRM framework tends to use its own
> logic for things like prepare/enable instead of using what Linux gives
> you. I'm sure Saravanah can also tell you about all the crazy device
> link circular dependencies that DRM has thrown him through...

The panel driver provides the panel, the drm device driver consumes it.
I'm not really clear why you want to structure this the other way round, I
can't come up with another way that makes sense from a device driver
model. And it's device driver model stuff here, not what's really going on
at the hardware level when everything is set up.

> In any case, I guess I'll continue asserting that I'm not going to try
> to solve this problem. If folks don't like my patch and there's no
> suggestion other than solving years-old problems then I'm happy to
> live with the way things are and hope that someone eventually comes
> along and solves it.

See my other reply, I do think there's an intermediate solution, without
the maintenance headache of a "these drivers work for this extremely
narrow special case" list. And without having to step into the device_link
complexity.

But also I think we've piled up years of hacks by now because people don't
want to solve the fundamental problem here, which device links are meant
to be the solution for. But I guess we can do another few years of
papering over the fundamental crack, *shrugs*

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
