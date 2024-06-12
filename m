Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458F9055B3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169D810E889;
	Wed, 12 Jun 2024 14:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bmCYSDyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B3310E889
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:49:53 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7961fb2d1cfso240756285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718203789; x=1718808589;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaS2PBL4S8jQlK2xlwvpgjVyDocb+xKvGvfIH82q2zM=;
 b=bmCYSDyLeKUewHOm1lsUZTTSRZHhTAu0vCh7rI6EwaAcakIWSWLcWUFNOR5Tx5XEr1
 aNboaLOlNm3EuTNSz5cPBfVpSGac6tRvrXJcxQPl1lNjt4V6FzfMk6sPDk4RLUOqovpA
 omk7TOAmtsZjhxArGyARHNcqi7VqpZ8mBLB+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718203789; x=1718808589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaS2PBL4S8jQlK2xlwvpgjVyDocb+xKvGvfIH82q2zM=;
 b=KIQHrrKgE8JRri8WHazul2WY8pfZIX/3HexssQ4nO+mVimV+cXM8Ua5goNWxQGJWag
 q9jed8vNxBUWIJr5PdFZ4pvnz27CR/q4xPZRjfz6jvPp3J6dhDi7Wt5VsXXgctiO5hOj
 mX/uNGhluGkWZsiEAKOH2S2f3zX0E/67yLyXVDoR03qT02hlELBW/qucNcM7eKyezPha
 PI1Bfza5yZ5GXuOnAk2KgmsJbK8EIiGVXSORWGM4nW4oMI50DeJ6TVkGwIoQ3rpcH4KT
 xnjpJzbXZ9wAM2AhqeMXsfn3sGKEVAWrgD/7zD3XpUKPupufG/unp6lODJwnpjlcBtO2
 RhlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQkwwwp6im7xuIfRsVat5O1O6eZq0QoEJE4DWkLhhETJVS2nBaLWMFS5K8Ed0pziIxMpabWGZ+ptZsgidBaTWTB05Mwz4Hzdt9Q99rJMwo
X-Gm-Message-State: AOJu0YzQm4PAdWGbn5ftW4v56PXj0yEJZv3FLeUooN9iWsU948SsRgie
 bFWtVNxvbnpGYRP2GLFl0/0OY9f6uH0Q1m0B8lVKpLQd/tkET/b3T67aIRaau7J2ApG/QDOHUzw
 =
X-Google-Smtp-Source: AGHT+IFHv+nGC8CNUfaQAblxPVbKQf849QvnxQtOTqh/k6dWScMIsA1U1y2H0zPpS9auzHo0TiKD7w==
X-Received: by 2002:a05:620a:2683:b0:795:533f:452c with SMTP id
 af79cd13be357-797f61f74d3mr230885185a.73.1718203789094; 
 Wed, 12 Jun 2024 07:49:49 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7978863766dsm241119185a.5.2024.06.12.07.49.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:49:48 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-44056f72257so348481cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:49:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcpQHM4iNl4OIdPxr78Ii9mIHNkDc3DpbPpD1w4sfezB/URe/7T9+y+DBEWuDGXE+vWUxdmF9aDS87xXtVyqwq66eVak9LhRKV78dpTxCt
X-Received: by 2002:a05:622a:124b:b0:441:4920:1fc4 with SMTP id
 d75a77b69052e-44158dc2347mr4800881cf.28.1718203787073; Wed, 12 Jun 2024
 07:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
In-Reply-To: <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 07:49:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
Message-ID: <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Jun 12, 2024 at 1:58=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Jun 11, 2024 at 07:48:51AM -0700, Douglas Anderson wrote:
> > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > you'll get these two warnings at shutdown time:
> >
> >   Skipping disable of already disabled panel
> >   Skipping unprepare of already unprepared panel
> >
> > These warnings are ugly and sound concerning, but they're actually a
> > sign of a properly working system. That's not great.
> >
> > It's not easy to get rid of these warnings. Until we know that all DRM
> > modeset drivers used with panel-simple and panel-edp are properly
> > calling drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
> > then the panel drivers _need_ to disable/unprepare themselves in order
> > to power off the panel cleanly. However, there are lots of DRM modeset
> > drivers used with panel-edp and panel-simple and it's hard to know
> > when we've got them all. Since the warning happens only on the drivers
> > that _are_ updated there's nothing to encourage broken DRM modeset
> > drivers to get fixed.
> >
> > In order to flip the warning to the proper place, we need to know
> > which modeset drivers are going to shutdown properly. Though ugly, do
> > this by creating a list of everyone that shuts down properly. This
> > allows us to generate a warning for the correct case and also lets us
> > get rid of the warning for drivers that are shutting down properly.
> >
> > Maintaining this list is ugly, but the idea is that it's only short
> > term. Once everyone is converted we can delete the list and call it
> > done. The list is ugly enough and adding to it is annoying enough that
> > people should push to make this happen.
> >
> > Implement this all in a shared "header" file included by the two panel
> > drivers that need it. This avoids us adding an new exports while still
> > allowing the panel drivers to be modules. The code waste should be
> > small and, as per above, the whole solution is temporary.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I came up with this idea to help us move forward since otherwise I
> > couldn't see how we were ever going to fix panel-simple and panel-edp
> > since they're used by so many DRM Modeset drivers. It's a bit ugly but
> > I don't hate it. What do others think?
>
> I think it's terrible :-)

Well, we're in agreement. It is terrible. However, in my opinion it's
still a reasonable way to move forward.


> Why does something like this now work?
>
> drm_panel_shutdown_fixup(panel)
> {
>         /* if you get warnings here, fix your main drm driver to call
>          * drm_atomic_helper_shutdown()
>          */
>         if (WARN_ON(panel->enabled))
>                 drm_panel_disable(panel);
>
>         if (WARN_ON(panel->prepared))
>                 drm_panel_unprepare(panel);
> }
>
> And then call that little helper in the relevant panel drivers? Also feel
> free to bikeshed the name and maybe put a more lengthly explainer into th=
e
> kerneldoc for that ...
>
> Or am I completely missing the point here?

The problem is that the ordering is wrong, I think. Even if the OS was
calling driver shutdown functions in the perfect order (which I'm not
convinced about since panels aren't always child "struct device"s of
the DRM device), the OS should be calling panel shutdown _before_
shutting down the DRM device. That means that with your suggestion:

1. Shutdown starts and panel is on.

2. OS calls panel shutdown call, which prints warnings because panel
is still on.

3. OS calls DRM driver shutdown call, which prints warnings because
someone else turned the panel off.

:-P

Certainly if I goofed and the above is wrong then let me know--I did
my experiments on this many months ago and didn't try repeating them
again now.

In any case, the only way I could figure out around this was some sort
of list. As mentioned in the commit message, it's super ugly and
intended to be temporary. Once we solve all the current in-tree
drivers, I'd imagine that long term for new DRM drivers this kind of
thing would be discovered during bringup of new boards. Usually during
bringup of new boards EEs measure timing signals and complain if
they're not right. If some EE cared and said we weren't disabling the
panel correctly at shutdown time then we'd know there was a problem.

-Doug
