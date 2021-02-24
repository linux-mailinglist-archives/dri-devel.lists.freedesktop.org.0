Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037F323F51
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 15:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D706E042;
	Wed, 24 Feb 2021 14:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C549B6E042
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 14:58:13 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id x20so2620524oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbU3IwxCR0mtqbhNfEFbj9D+PW+MeORgC6CdErr7nBw=;
 b=aP8fFHE/1ypcctQDrQ66JN4WfZzCZCWyk5DsEmODx6RbyZHbXmS+gDZCxdIiBpS7ae
 JqQgicjks45SjWq8Mac/w6Sj28if3/2cyau2VhN3qtbyxQKsjfftuq4mcNl3QW4/ZNVP
 DJIBV9jOs9trgr0yv0VtGwbv4OV1ESHoUKf3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbU3IwxCR0mtqbhNfEFbj9D+PW+MeORgC6CdErr7nBw=;
 b=qb6TuthNq7ehXDNcu1Ezs56WYgQ0x47h8wVx3w8BsgdMYtx2fV/qFNQCpqqI8E7Amo
 A3YMNdlrZ7iKOgSf9o5xucJYuAGUlffRstn7DDR8W6pvcoN39/PFxTJ1KiM6hF5JOEAX
 iInzMIDbuXHDvl1vX2yZ5CyVfsh1Rtn5Ygzyi6tBsVedS8n1CjZ+vxwmOSjUCffYATtq
 Boh/YATrYZurgXi5y5D9fIhjTlZjHa5b5u5VgJrBajP41LOL5gQJTUvvnNHHYmoNiYwK
 wjeurO058h0nu0tA+mwcqgnjqVgnpipTLHbVgj5JyDegDiR6UyEwYLnEyWKBaJqgE8h3
 dF+A==
X-Gm-Message-State: AOAM531DgCiSfS8ZhweUUT9+FBBg71e1p6xVKG9/3t8YUllLvfYPBZr0
 KxSliL81E3C39kepZ267VNIGpp/f4AGFkAqWbeu8Cw==
X-Google-Smtp-Source: ABdhPJzJDOBbeNCNg40mB6I5gWO0MUt3jWsrMLPQKLNLiFPv/fG0zUjoIfpU83KjB12h43GZOU9O0WTDiIBwqklWw1E=
X-Received: by 2002:a05:6808:aa6:: with SMTP id
 r6mr2960078oij.128.1614178693009; 
 Wed, 24 Feb 2021 06:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
 <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
 <YDU2+A0MNJnrWxPs@maud>
 <20210223183404.jmdw5rojy4s64xfd@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rOVTd7YhbPoYyxhDD1+S7xG23L2v8Hujdh6tGFBq+n+Hg@mail.gmail.com>
In-Reply-To: <CAPj87rOVTd7YhbPoYyxhDD1+S7xG23L2v8Hujdh6tGFBq+n+Hg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Feb 2021 15:58:01 +0100
Message-ID: <CAKMK7uG+xNt4iQkB2ysbMQPbe_JSPWCq+3VzV+OOAuAhn=9x0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, nd <nd@arm.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 7:50 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Brian,
>
> On Tue, 23 Feb 2021 at 18:34, Brian Starkey <brian.starkey@arm.com> wrote:
> > On Tue, Feb 23, 2021 at 05:10:16PM +0000, Alyssa Rosenzweig wrote:
> > > But it seems to me allowing
> > > both BGR+YTR and RGB+YTR upstream is the better route than simply
> > > preventing hardware from using AFBC at all, and there are natural
> > > encodings for both with fourcc modifiers.
> >
> > Are those the only options? I see XBGR8888, ABGR8888, BGR888 and
> > BGR565 are all handled in vop_convert_afbc_format(), which are all
> > "valid" for use with YTR, and all except XBGR are on the "preferred"
> > AFBC format list in afbc.rst.
>
> The issue is a userspace one though, not a kernel one. Userspace (e.g.
> GNOME Shell, Weston, Xorg) decides ahead of time that it's going to
> use XRGB8888, then use the modifiers available to it for that format.
> There's no logic in those projects to look at the list of 8bpc
> non-alpha formats, examine XRGB vs. XBGR, decide that XBGR is 'better'
> since it has more modifiers available, then go use XBGR.

That sounds a bit like userspace being too simple. Since if they're ok
with dealing with modifiers accessing the raw buffer is out the window
anyway, so bgr vs rgb shouldn't matter.

> So whilst removing XRGB+AFBC wouldn't technically remove the
> possibility to use AFBC, the practical effect is that it wouldn't be
> used.

But also this ofc.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
