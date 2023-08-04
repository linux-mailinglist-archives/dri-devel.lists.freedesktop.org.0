Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD47700D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8599810E6FB;
	Fri,  4 Aug 2023 13:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2B10E6FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:07:30 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a776cf15c8so153285b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691154449; x=1691759249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/yigF2fpJEDnCMVE9c09FwuzpR2+S6iapzBaTvFv5A=;
 b=VKc6oV/RW7zPDTNHZ48iKQLRzTzlxRj54KzrC6OtsJsHsW+LFIGmDl3mkl5vOVCjS5
 556DxYCyryRDMXvZeyl8r90Zig5Sw1zY+yZQoChdvd5+wLloxiC65J8oA1RwcZausrW6
 PUh4M62bnqpMIFPa6HR2WbrTfl+EXVUNEjIDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154449; x=1691759249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/yigF2fpJEDnCMVE9c09FwuzpR2+S6iapzBaTvFv5A=;
 b=RYtsG51MEMDdADT7WLAqESNKfeZ2x8pKA52BPbnBmiLuiO4QOBxVj1sP+d8vhtC0hr
 zLPWZISOhaQx2To8RmQkJSERfJ5lTzuogntBFwX92+bmoY63ydV3CSvuqHeJhR381p7p
 MVFRWnFva8PzeTg0zq9CaX0zcc8O4pgz3IHmSViQf4Gg4Mcp0IDHvuX4ONZ4z5ePEpu3
 dkjcE97uDlFOlBKB5tad+6VIHZdfEKrN+Exi8zqkdIPKfPH0o3z8CDrNsaYmR9FzukoX
 9d19Ngle1Sk/0DZjySsomOxNCnFTeaZDNwVDglu0cpmbphRdMA4D0MWiQ7iO5JR5SaYm
 yEjw==
X-Gm-Message-State: ABy/qLaDDGzy39riiqbwZbXrCtcqCvkkfPsZ3IDFpIpb3CBpIBzJ2oDF
 xm4iaJRI0wVLQcL7i4t2WER8T4RI59p21KHXJ7BJiL+46qvc+gEX
X-Google-Smtp-Source: APBJJlF/EzkMaNQX2p63/4kVk/OEtEEV3E3kIOdMxEM5Wf7EX2fTtw0QjKGuyqON5R2OoE5HPZXiblVHLDX55eUPV0A=
X-Received: by 2002:a05:6808:3616:b0:3a1:d457:83b5 with SMTP id
 ct22-20020a056808361600b003a1d45783b5mr17111363oib.3.1691154449755; Fri, 04
 Aug 2023 06:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230804125156.1387542-1-javierm@redhat.com>
In-Reply-To: <20230804125156.1387542-1-javierm@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Aug 2023 15:07:17 +0200
Message-ID: <CAKMK7uH=7m=2Y0SxPm2Q1J+u2MRWHNQrYy7M5se7Ua9ZA19y=A@mail.gmail.com>
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Aug 2023 at 14:52, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
> to an effective 'select FB_CORE', so any config that previously had DRM=y
> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
>
> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
> as reported by Arthur Grillo, e.g:
>
> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>   Selected by [y]:
>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>
> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
> be to enable DRM fbdev emulation but without a framebuffer console.
>
> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Yeah originally this was just to help people not misconfigure their
kernels and end up with a black screen. But select is really not a
nice way to do that, imo we could drop the FB_CORE select too :-)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima

> ---
>
>  drivers/gpu/drm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b51c6a141dfa..2a44b9419d4d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -135,7 +135,6 @@ config DRM_DEBUG_MODESET_LOCK
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
>         depends on DRM
> -       select FRAMEBUFFER_CONSOLE if !EXPERT
>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>         default y
>         help
> --
> 2.41.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
