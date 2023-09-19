Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106B7A65B2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 15:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2052B10E26E;
	Tue, 19 Sep 2023 13:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590010E26E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695131416; x=1726667416;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nrxfqLevEeJuaY8eZFd6cuT9JLqPftER68ypdqQV18A=;
 b=nLioIX3ab2HL0mIcztq7njA40UFZ6fnjaQ3BDNyHET6ZtJ7u30/k70IJ
 u6Wzb84YjSfzOptcmgLkz4BHykM7xYQ9ppqS5uDw9sk8o6tAyI1SHAbKv
 r01a+J+G5S8kk+i4zAEclD8mZfrDwblDNEEp8tlwgMeUodee3EZilKMoT
 p1tAc8K6ONp1GwkODDIJhaeHThoKLfBAErEt9Qv+YITkObGo0lcvdD8ft
 UTHMkh5vXpQRh/tlgtIsRifohbQdO71b58nAeGkrCrD66EK69XXqw5cWH
 IL0K0rAofUr9TzDFrV6xqDm92z0jSeb3tiZHDU4hXpUll+p9JldvgG/j7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360202071"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="360202071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811728232"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="811728232"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:50:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
In-Reply-To: <20230919131235.759959-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230919131235.759959-1-mripard@kernel.org>
Date: Tue, 19 Sep 2023 16:50:11 +0300
Message-ID: <871qeutgq4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
> We've had a number of times when a patch slipped through and we couldn't
> pick them up either because our MAINTAINERS entry only covers the
> framework and thus we weren't Cc'd.
>
> Let's take another approach where we match everything, and remove all
> the drivers that are not maintained through drm-misc.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  MAINTAINERS | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..757d4f33e158 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
>  S:	Maintained
>  W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/
> +F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
> -F:	drivers/gpu/drm/*
> +F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> -F:	include/drm/drm*
> +F:	include/drm/drm
>  F:	include/linux/vga*
> -F:	include/uapi/drm/drm*
> +F:	include/uapi/drm/
> +X:	drivers/gpu/drm/amd/
> +X:	drivers/gpu/drm/armada/
> +X:	drivers/gpu/drm/etnaviv/
> +X:	drivers/gpu/drm/exynos/
> +X:	drivers/gpu/drm/gma500/
> +X:	drivers/gpu/drm/i915/
> +X:	drivers/gpu/drm/imx/
> +X:	drivers/gpu/drm/ingenic/
> +X:	drivers/gpu/drm/kmb/
> +X:	drivers/gpu/drm/mediatek/
> +X:	drivers/gpu/drm/msm/
> +X:	drivers/gpu/drm/nouveau/
> +X:	drivers/gpu/drm/radeon/
> +X:	drivers/gpu/drm/renesas/
> +X:	drivers/gpu/drm/tegra/
>  
>  DRM DRIVERS FOR ALLWINNER A10
>  M:	Maxime Ripard <mripard@kernel.org>

-- 
Jani Nikula, Intel
