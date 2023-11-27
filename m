Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3E7FAC2B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8010E30D;
	Mon, 27 Nov 2023 21:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AD410E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:03:11 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1fa4b632198so921996fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701118991; x=1701723791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6Ju5m6wUuBuxgz9DC/CfBuuqTJXG8hedvZDwOP6OJ0=;
 b=V2hX30JnI9KmDZzVSBP3WAhBrUqX8Hc+hWpqX74uDa36CVve0weCxntCBk4gXMCCxv
 kmTaCpW2Ykc7bN1IHtVM+UBPvLirdF9zL9zWOqCyrAAvlVhH7pYHL1TkHzH5p7xzV2oX
 nxg8Bv2saijCm7LyB1MWyyJLBcAzYOxB4tXvRIYrjiivVJxMZQdXOT2dBiHD2xv48BBx
 SRhKOf/wGpfQayyWsMGaFTT07UqoNUvZkZUy9w+ihMI2OFZPT8abWq8Q29fd2BwiuWYx
 p/8wRyFougsHcqHCf+QSBMwrSbwGXizKsXnUuUzLIlseWfZeMAh60iiBr0dAeQpzCSzr
 D5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701118991; x=1701723791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6Ju5m6wUuBuxgz9DC/CfBuuqTJXG8hedvZDwOP6OJ0=;
 b=aha0/l2ljWeNTqFXRLxQUoQcgYtEnUH5ON6VteMygcEWa2wVDA6n3TXXnlsAPUsx3E
 w4LI4M4ZICvCVlCPWpORpnqjwAVdFL+D2hoVefpn7Pnt3yqQfg0f69OyWp0FFFUrwMgo
 fo80p3QmZgjGOCLDM+Ghin7OLAEbPPDdPelnW6nYWZCu/abshDw4Dn8yIEIBwbL66UUO
 XfvOK5y8QFZbtyTF3R9cVHDWPWPFYQbOFTLaSOeHY9F/yDMyx26pdR6rJUMO8pZekF/V
 9yAiuW/yIRSOQ9tpdbocAb50RxwMk0/kuSg/XaXAvcc9ZqHAfEAcJZ3hOyan/SL6d+LF
 /0Hw==
X-Gm-Message-State: AOJu0YwKznV36geGMO3ysrhEPoV4Mrz8VGPPmAQ8NYDtrf7HImM2Bu1L
 QIhc1xDRDfafEaIqntP0fGbNt/VVvZWFFk84W58=
X-Google-Smtp-Source: AGHT+IEZOqgZXfteqD1wp78SWIX8v0VHSZLtwlSQslAATW1fONsKWrheYfgoNWM6d/FD9qUrmvV7w126AcR1l6FZO20=
X-Received: by 2002:a05:6870:3c8b:b0:1f9:dc5a:b8fc with SMTP id
 gl11-20020a0568703c8b00b001f9dc5ab8fcmr17797992oab.56.1701118991101; Mon, 27
 Nov 2023 13:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-2-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-2-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:03:00 -0500
Message-ID: <CADnq5_NmFZxD2=EOaLSt2UYeRtBUFhh++Du-M=Sg8ey4N7M3EQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] arch/powerpc: Remove legacy DRM drivers from
 default configs
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, cai.huoqing@linux.dev, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> DRM drivers for user-space modesetting have been removed. Do not
> select the respective options in the default configs.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a276afc19eec ("drm: Remove some obsolete drm pciids(tdfx, mga, i81=
0, savage, r128, sis, via)")
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.3+

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  arch/powerpc/configs/pmac32_defconfig | 2 --
>  arch/powerpc/configs/ppc6xx_defconfig | 7 -------
>  2 files changed, 9 deletions(-)
>
> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs=
/pmac32_defconfig
> index 57ded82c28409..e41e7affd2482 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -188,8 +188,6 @@ CONFIG_AGP=3Dm
>  CONFIG_AGP_UNINORTH=3Dm
>  CONFIG_DRM=3Dm
>  CONFIG_DRM_RADEON=3Dm
> -CONFIG_DRM_LEGACY=3Dy
> -CONFIG_DRM_R128=3Dm
>  CONFIG_FB=3Dy
>  CONFIG_FB_OF=3Dy
>  CONFIG_FB_CONTROL=3Dy
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs=
/ppc6xx_defconfig
> index f279703425d45..e680cd086f0e8 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -678,13 +678,6 @@ CONFIG_AGP=3Dy
>  CONFIG_AGP_UNINORTH=3Dy
>  CONFIG_DRM=3Dm
>  CONFIG_DRM_RADEON=3Dm
> -CONFIG_DRM_LEGACY=3Dy
> -CONFIG_DRM_TDFX=3Dm
> -CONFIG_DRM_R128=3Dm
> -CONFIG_DRM_MGA=3Dm
> -CONFIG_DRM_SIS=3Dm
> -CONFIG_DRM_VIA=3Dm
> -CONFIG_DRM_SAVAGE=3Dm
>  CONFIG_FB=3Dy
>  CONFIG_FB_CIRRUS=3Dm
>  CONFIG_FB_OF=3Dy
> --
> 2.42.1
>
