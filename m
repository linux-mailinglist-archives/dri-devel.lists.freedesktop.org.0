Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98865462B5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DB810E28A;
	Fri, 10 Jun 2022 09:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A9910E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:47:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a15so27249729wrh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OPbvFpgsCXrc/RPsUnJXvMubbP17Qr2YxU9/bS1wZjk=;
 b=Sx9VSFOKuSIF/SG/wZmN6t3GEVIdE7lEIrbl9Mm6OhO6ibXPIulugZeY3eOarE4gWg
 Xmxf7UQrHvFKBv/T01+affQqxcOeCFb1i3fIGXdkw5hb2dEDXYgTkvw4vOo6uE4njvOA
 Cr+H0XBeSDbYhAPd/i/bPJeriwwqBIj+qQ0CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=OPbvFpgsCXrc/RPsUnJXvMubbP17Qr2YxU9/bS1wZjk=;
 b=UDAG8wEoKX0WkpGv68uCZAB6q0cN53PBjTYbw/VJ0KOdhsM/mUxV1Yglx4lITai6P2
 a9PUOkoduS0o2tR75AjPl6AiIgCNsqNZDfeLGArerUDebQuXB6fQtwNb1bsAwtPbZJZ+
 uOGW43zMv3mMfRYy+PVGLpoACGhdqR9wwQRAl1J4qm56q/2aSy2oJxd+7aTwF1puOfs0
 oKhbzWt/Xm0fjoDiQzC37h+7/FIdSOW2qCOZNOFZjG+PzvuNV2XDwHx+rbqF0AavvBq8
 fPOGkHxZFcsBQBRARSztUxwBeOkzShpfs6o3mAg/ZXkrLJzMNozLQYbjzaQRarvR2T0i
 0cPQ==
X-Gm-Message-State: AOAM531mvxzM0X5r0HnAa1471bsAzdHBtczcSi2/Da1v/0WLb/LfK/j4
 aqHgiV0uMpUL2oPXdDenesNBFA==
X-Google-Smtp-Source: ABdhPJw/3X2seKC/9g3emEoshWFl3NznfblFRQrKNLuh5mPnwP52ajg48RkiCudO7VotgG18/i6y3Q==
X-Received: by 2002:adf:e4cb:0:b0:219:b63c:d238 with SMTP id
 v11-20020adfe4cb000000b00219b63cd238mr7519156wrm.705.1654854438519; 
 Fri, 10 Jun 2022 02:47:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b0039c50d2d28csm2364864wmq.44.2022.06.10.02.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 02:47:17 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:47:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] Revert "fbdev: vesafb: Allow to be built if COMPILE_TEST
 is enabled"
Message-ID: <YqMTI3yxmWq/f+Gp@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220610085450.1341880-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610085450.1341880-1-javierm@redhat.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 10:54:50AM +0200, Javier Martinez Canillas wrote:
> This reverts commit fa0e256450f27a7d85f65c63f05e6897954a1d53. The kernel
> test robot reported that attempting to build the vesafb driver fails on
> some architectures, because these don't define a `struct screen_info`.
> 
> This leads to linking errors, for example on parisc with allyesconfig:
> 
>   hppa-linux-ld: drivers/video/fbdev/vesafb.o: in function `vesafb_probe':
> >> (.text+0x738): undefined reference to `screen_info'
> >> hppa-linux-ld: (.text+0x73c): undefined reference to `screen_info'
>    hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
> >> (.init.text+0x28): undefined reference to `screen_info'
> >> hppa-linux-ld: (.init.text+0x30): undefined reference to `screen_info'
>    hppa-linux-ld: (.init.text+0x78): undefined reference to `screen_info'
> 
> The goal of commit fa0e256450f2 ("fbdev: vesafb: Allow to be built if
> COMPILE_TEST is enabled") was to have more build coverage for the driver
> but it wrongly assumed that all architectures would define a screen_info.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
>  drivers/video/fbdev/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index bd849013f16f..f2a6b81e45c4 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -616,7 +616,7 @@ config FB_UVESA
>  
>  config FB_VESA
>  	bool "VESA VGA graphics support"
> -	depends on (FB = y) && (X86 || COMPILE_TEST)
> +	depends on (FB = y) && X86
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
