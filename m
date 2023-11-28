Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E870C7FB2B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 08:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5C10E432;
	Tue, 28 Nov 2023 07:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Tue, 28 Nov 2023 07:28:31 UTC
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2FF10E432
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:28:31 +0000 (UTC)
Date: Tue, 28 Nov 2023 15:19:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701155958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8uqJSYQwjFCUay41Ix8e7EVNe5lKSgbz8vntysNfGs=;
 b=eqISXMNY5sRQ6TCaHK/RJ9QeGTChM9TJ+coBuLYWGjnrICGfyKt4T0KDWdxlfrbf1rGxT4
 0KPunZldfaj/Dsray/xZR30B1ahE5dyIuSDWUM9jNOrUMGT5uTUuagqahAdHKctz39d4vY
 Ny0CVMfwlwBYGmvRRlxWj0ZtjHCZugA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/14] arch/powerpc: Remove legacy DRM drivers from
 default configs
Message-ID: <ZWWUcRWemEFmJbmS@chq-MS-7D45>
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122122449.11588-2-tzimmermann@suse.de>
X-Migadu-Flow: FLOW_OUT
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
 mripard@kernel.org, Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22 11月 23 13:09:30, Thomas Zimmermann wrote:
> DRM drivers for user-space modesetting have been removed. Do not
> select the respective options in the default configs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a276afc19eec ("drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128, sis, via)")

Reviewed-by: Cai Huoqing <cai.huoqing@linux.dev>

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
> ---
>  arch/powerpc/configs/pmac32_defconfig | 2 --
>  arch/powerpc/configs/ppc6xx_defconfig | 7 -------
>  2 files changed, 9 deletions(-)
> 
> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
> index 57ded82c28409..e41e7affd2482 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -188,8 +188,6 @@ CONFIG_AGP=m
>  CONFIG_AGP_UNINORTH=m
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
> -CONFIG_DRM_LEGACY=y
> -CONFIG_DRM_R128=m
>  CONFIG_FB=y
>  CONFIG_FB_OF=y
>  CONFIG_FB_CONTROL=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index f279703425d45..e680cd086f0e8 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -678,13 +678,6 @@ CONFIG_AGP=y
>  CONFIG_AGP_UNINORTH=y
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
> -CONFIG_DRM_LEGACY=y
> -CONFIG_DRM_TDFX=m
> -CONFIG_DRM_R128=m
> -CONFIG_DRM_MGA=m
> -CONFIG_DRM_SIS=m
> -CONFIG_DRM_VIA=m
> -CONFIG_DRM_SAVAGE=m
>  CONFIG_FB=y
>  CONFIG_FB_CIRRUS=m
>  CONFIG_FB_OF=y
> -- 
> 2.42.1
> 
