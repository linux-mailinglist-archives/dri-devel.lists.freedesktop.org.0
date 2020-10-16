Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539E29003C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 10:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81F6EAAE;
	Fri, 16 Oct 2020 08:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9556EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 08:54:14 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id p21so1020775pju.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qlKQpjh6RTs3RwzvTa5iXMFegGmcIdpv9KbiNEX8k94=;
 b=qOpKHelHEA4ybcHdlNVcBL/4CaVjMw6euMsCT/HXdAy9L8iMqKddkGodZSgp35aQzS
 sfElka10ZN5Bh9UFAJu9KegGSEjds70FdeA9+K4PO66M5Y0Yqt0SW3tV7F+mICE0rrRA
 +6sjPIIcYpv+Y3SvUMXTNe30pN5FSur5/tnj7cdwzSMTmAgsiLZHFqHZVa4+jHTRdb50
 HPqCRgh9l3T/eBmi9sVkoXnhuWqnZRSD1AnJZdkalSpmRb3O7shHBcDMrQVEpzQyMrAy
 bmIYPhi4oupWAfr78gTCf4f3VcugwrBfFTT3y0yRaJu11dfj90aPviQxJjGqpdKUsluL
 ypsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qlKQpjh6RTs3RwzvTa5iXMFegGmcIdpv9KbiNEX8k94=;
 b=QzbG8nlWvVO7mPpIfWCt3IuxLuF+VHS3Q9yuBW5CH224zPRfxkkMlQm67Qd+gSMBNn
 uAF2zbtYSbmpkdiGrcf0r5/QztrLeNBPQDCXIzOU1Xep3jS1HlSd5qp3YPY6MJyQTEe0
 /a7nnJfTxwwMzNLtRa8/w1HZ6jiE9QJAjt/4PHMJPb4TQ49U+PVMANB1U5AJXT0H75UV
 nJu3lnKsZnZuENa6f0xQSDN02kYAFzPwn8pR9Sk6bFglelREvXrAgdo3twIAWfb5wUPn
 pBSUPkM6snZTVTiL1n1ImE4sDy53gE/acV3SfWnFxKBRV9ZElt51DxwGUWCS/1BN+aKj
 uk8w==
X-Gm-Message-State: AOAM532eBExh9MFEBA8Ptorw1Blwb2KnLjgwqZ6qezeM+lK3CTMTZhhJ
 2tCCOb440HSggx+X/DBnB4sPMA==
X-Google-Smtp-Source: ABdhPJyIr+iTQFDXJ805fNvtIed3QCl8jfCPFo8IbPdZKHoVu9+yDXSNk+k/k1arSRf/0/L3nqSB5A==
X-Received: by 2002:a17:90b:3658:: with SMTP id
 nh24mr2965528pjb.177.1602838454436; 
 Fri, 16 Oct 2020 01:54:14 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id 190sm2024300pfc.151.2020.10.16.01.54.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 01:54:13 -0700 (PDT)
Date: Fri, 16 Oct 2020 16:54:08 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
Message-ID: <20201016085407.GA5182@dragon>
References: <20201016071254.2681-1-shawn.guo@linaro.org>
 <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 09:58:46AM +0200, Daniel Vetter wrote:
> On Fri, Oct 16, 2020 at 9:13 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
> > WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
> > before a mode has been set on CRTC.  This happens sometimes during the
> > initial mode setting of a CRTC.  It also happens on Android running HWC2
> > backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
> > before the atomic mode setting on CRTC happens.
> >
> > In this case, there is nothing really bad to happen as kernel function
> > returns as no-op.  So using WARN() version might be overkilled,
> > considering some user space crash reporting services may treat kernel
> > WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
> > to drm_warn_once() for warning undefined mode timing.
> 
> This indicates a bug in your driver. Please fix it there, not by
> shutting up the core code complaining about that. Either you're
> getting vblank timestamps when the vblank isn't set up yet
> (drm_crtc_vblank_on/off) or there's some other race going on in your
> driver code resulting in this.

Thanks for the comment, Daniel.

I'm hitting this warning on an Android running drm_hwcomposer.  I'm
indeed getting vblank timestamps request before drm_crtc_vblank_on() is
called.  I'm not sure this is a bug or race condition in the driver
code, as both vblank timestamps and on/off requests are coming from user
space ioctl for my case.  @Sean, that means the problem is in Android
drm_hwcomposer code?

Shawn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
