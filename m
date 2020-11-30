Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A422B2C8F9B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 22:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121B06E841;
	Mon, 30 Nov 2020 21:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246216E841
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 21:06:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v14so1023326wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 13:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OT7uPFeQMsAOh9Sd//UU7R2KkQGwvueFKx1XYJ4p2Yg=;
 b=LSlo/fVYM5h4ECABLCXa0dD+Q/XxoscjrHpe4ddnaxDmRGpH/PzcrB5bS0fzzUuc0P
 Iu0vMD21RP0OpgBu2BM5grfhbppcx0FbcKadAhKd8zpUoTZ5dd47YzEU/tbFe1AzLNWS
 q/+/kKM3uOdO6LkDmjoEtz+mIJrLxHIUzGlLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OT7uPFeQMsAOh9Sd//UU7R2KkQGwvueFKx1XYJ4p2Yg=;
 b=rT8vqjTJiI1F+fl2y408o2XvHE9QvqRPWQxip01UZ/cuCwhZnv01AE/7PFK25h4rRK
 kx+AB5Eyycp9bEfmIHYDn31oY5FNphPWCO2lOTNJ3fImJX5NJTcxPcicm2SZFs/1a83D
 aPqAnUaJgghoZM2mpzMpvAI41/AL9uiuBf+OYT/7/yEMYQluw7Uk4dUMzbNCrtzBa18/
 5ax0ZSYk2JaIAupQft6Y35u6bGmoQZQwRTwEjL1plZ9yEGck3RhPQVgnjX8slTq0Fgvs
 MjC9OkJyKGht28mUJNvgGnvvgsBqW3yu7w318gPYAVytqL5clv3WA+x3Tg075wC25cb9
 OTfQ==
X-Gm-Message-State: AOAM531JQy6b9i54Z0IF9GZbXH3jS73xZgj87QzOrEJfUe/EuLNcAtHc
 CclEyNiSmtjEDDQYGZZeH6PcAw==
X-Google-Smtp-Source: ABdhPJy23PBUPd4raJiEfRyGjC2Eq9Gqvqz2JKpb4jnGq5ksSVVgLRxlDrW19AsWsJJ6USmdjJ8i+Q==
X-Received: by 2002:a1c:b402:: with SMTP id d2mr808911wmf.38.1606770392851;
 Mon, 30 Nov 2020 13:06:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i11sm30197597wrm.1.2020.11.30.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 13:06:31 -0800 (PST)
Date: Mon, 30 Nov 2020 22:06:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
Message-ID: <20201130210629.GY401619@phenom.ffwll.local>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 01:39:17PM -0500, Mikulas Patocka wrote:
> 
> 
> On Mon, 30 Nov 2020, Daniel Vetter wrote:
> 
> > On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
> > > 
> > > The framebuffer driver supports programs running full-screen directly on 
> > > the framebuffer console, such as web browser "links -g", image viewer 
> > > "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl", 
> > > movie player "mplayer -vo fbdev". The DRM driver doesn't run them.
> > 
> > Hm this should in general work on drm drivers. Without that it's clear the
> > switch-over isn't really ready yet.
> 
> I fixed it with this patch two years ago: 
> https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.html
> 
> But the patch never went through and the fb_defio feature was removed in 
> the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).

The generic fbdev emulation still has a defio implementation. We could try
to make it more efficient maybe, but it should be all there. The module
option disappeared since you now should always get it by default.

> Without fb_defio, the only other possibility how to update the screen is 
> the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master mode, so 
> user programs like "links -g" can't issue it.

Now I'm confused, I thought you wanted to use fbdev /dev/fb* nodes? Those
should support defio. And if you want your applications to use drm
modesetting natively, they have to be drm master anyway. You can't use the
DIRTYFB ioctl to upload fbdev contents. So I'm a bit confused.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
