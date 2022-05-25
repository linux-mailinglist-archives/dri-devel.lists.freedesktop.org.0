Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76842533DDA
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966A10EE09;
	Wed, 25 May 2022 13:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C384910EE09
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:26:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y24so4735713wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=MpAJjoRKwGLkh3LcW90CCOydeHbiAiNXwW2FaiG7+5Y=;
 b=QQ8HN/d+PVpdcmWvwIk13yOR6arO1frU91StcQ9M/kCJ8FdOEutASVqNnl0oFm/EZH
 tEt0nVXQW764JiFG5GFiAGbr/Es2hBMAJ0BqVNCWdma0pXaFu0SUXYi0eyKowEidI3w3
 7p7kfRhKxEPT55ahiSMGxdfw22s2xnhjVcBrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=MpAJjoRKwGLkh3LcW90CCOydeHbiAiNXwW2FaiG7+5Y=;
 b=6hoRfOhPxgiRyXgaGu4IugM48uuWX18k6o3OPJizrE1BX3rHEp3KKaUUPomOqUpIF1
 tjOuiw9NiIwE+K72IATHN4GnVfTiw8KfEFWn4pmfC3xycNXHf+H2bC4q3evgdy0Me0Gq
 Kag6ATJO6PCBlrLN1eBdbkTbZOW97J11XK0zR/KqgBR03nX2+I4/NSqcDxfF80bi0Op+
 Bg82dYlTddskOEJ852sAyM0TmDb6823pOaDQv1VYR9/KGjJGnk5C8dBOqI/BWLt8vyp5
 edCGLCe82/wSf/HbBDRAJkunwvb+W2ngJxcyV32khCL20bM6YQR4HZW1vYsKLXElbAZe
 w80A==
X-Gm-Message-State: AOAM532qy5XSCNJVhzmtIkJm5gEQqnmIhMCE/PvEDvvGa4McQcRfKbnb
 pGXsoVn3wlSVPDaV1XyKPmwiJw==
X-Google-Smtp-Source: ABdhPJzAkynVKxqfhn4pVC8Fu0ef4gHIkJfVw0FJOU2QlVfLYEJ7eKnSnAbOa7QOcrhCIDLgMvWWWA==
X-Received: by 2002:a05:600c:3b20:b0:397:6311:c0c7 with SMTP id
 m32-20020a05600c3b2000b003976311c0c7mr5836015wms.69.1653485184116; 
 Wed, 25 May 2022 06:26:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a1c7716000000b0039749bab534sm5164109wmi.1.2022.05.25.06.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 06:26:23 -0700 (PDT)
Date: Wed, 25 May 2022 15:26:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
Message-ID: <Yo4ufWm5WiXsnRX8@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
 <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 05:59:02PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi Douglas,
> > >
> > > I understand that you're trying to tell userspace that the modelist has
> > > been made up, but it's not something that should be done via fragile
> > > heuristics IMHO.
> > >
> > > I looked at the Chromium source code that you linked, but I cannot say
> > > whether it's doing the correct thing. It all depends on what your
> > > program needs.
> > >
> > > In that function, you could also search for 'DRM_MODE_TYPE_USERDEF'.
> > > It's the mode that the user specified on the kernel command line. If
> > > Chromium's automatic mode selection fails, you'd give your users direct
> > > control over it.
> >
> > That doesn't really work for Chrome OS. Certainly a kernel hacker
> > could do this, but it's not something I could imagine us exposing to
> > an average user of a Chromebook.
> >
> >
> > > When there's no flagged mode or if
> > > /sys/class/drm/card<...>/status contains "unconnected", you can assume
> > > that the modelist is artificial and try the modes in an appropriate order.
> >
> > So "no flagged" means that nothing is marked as preferred, correct?
> >
> > ...so I guess what you're suggesting is that the order that the kernel
> > is presenting the modes to userspace is not ABI. If there are no
> > preferred modes then userspace shouldn't necessarily assume that the
> > first mode returned is the best mode. Instead it should assume that if
> > there is no preferred mode then the mode list is made up and it should
> > make its own decisions about the best mode to start with. If this is
> > the ABI from the kernel then plausibly I could convince people to
> > change userspace to pick 640x480 first in this case.
> >
> > > If we really want the kernel to give additional guarantees, we should
> > > have a broader discussion about this topic IMHO.
> >
> > Sure. I've added Stéphane Marchesin to this thread in case he wants to
> > chime in about anything.
> >
> > Overall, my take on the matter:
> >
> > * Mostly I got involved because, apparently, a DP compliance test was
> > failing. The compliance test was upset that when it presented us with
> > no EDID that we didn't default to 640x480. There was a push to make a
> > fix for this in the Qualcomm specific driver but that didn't sit right
> > with me.
> >
> > * On all devices I'm currently working with (laptops), the DP is a
> > secondary display. If a user was trying to plug in a display with a
> > bad EDID and the max mode (1024x768) didn't work, they could just use
> > the primary display to choose a different resolution. It seems
> > unlikely a user would truly be upset and would probably be happy they
> > could get their broken display to work at all. Even if this is a
> > primary display, I believe there are documented key combos to change
> > the resolution of the primary display even if you can't see anything.
> >
> > * That all being said, defaulting to 640x480 when there's no EDID made
> > sense to me, especially since it's actually defined in the DP spec. So
> > I'm trying to do the right thing and solve this corner case. That
> > being said, if it's truly controversial I can just drop it.
> >
> >
> > So I guess my plan will be to give Stéphane a little while in case he
> > wants to chime in. If not then I guess I'll try a Chrome patch...
> > ...and if that doesn't work, I'll just drop it.
> 
> OK, this userspace code seems to work:
> 
> https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
> the first mode if no EDID
> 
> ...so we'll see how review of that goes. :-)

Yeah it sucks a bit but I'm mildly afraid that if we muck around with the
absolute fallback mode list in upstream we get whacked by a regression
report :-/

There's the additional fun that on modern displays probably 720p (or maybe
720i) is a lot more likely to work than anything else really, so best we
can do here maybe is to make it an uapi guarantee that if there's no
preferred mode, then most likely the kernel invent random noise out of
thin air, and userspace has to be careful and do its own magic heuristics.
Or maybe we should add a flag for "this stuff is invented, buyer beware".

I think clarifying that would be good. Changing defaults feels a bit too
risky, we had some really hilarious regression reports in the past along
the lines of the infamous xkcd.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
