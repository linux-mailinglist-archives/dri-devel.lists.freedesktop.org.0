Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAB9D8061
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384A10E117;
	Mon, 25 Nov 2024 09:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWcKaA79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3D710E117
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732525510; x=1764061510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1HEwJ06OdfnNR7EruhIW+OMlB4IJ53R9E6nB3+JJJdI=;
 b=DWcKaA79Prfj2sB5WBoyVWXhoTbYXvmakQSdePBamx4vg1teNr/nIwEY
 HeSOralMrgRzwsL0eL88hruHP7BJwB5yDejuMOvuzDnGuJANFcR07j5cm
 zimqL/rUGafdjyfj8Lba7OJWIfERPA7geK8ocFkoHRDXfSNKK/lUwW23b
 6BFQLYyOCpH1pODlMhjG4OFATQ2fS31nNOWXomoyj+mpWou6WbA7wXk11
 6NwgVj2mrdL1ufPreYWmr/yI+Nd6R9F/kNXUBtUrgpkvgUzeXPoKaeHoB
 kTYTu5sX59LKdsSDAhHKYYRzt+nJ1SwI5U/iOd6WMVcEl0ZY8xa5gtwNg g==;
X-CSE-ConnectionGUID: NDeSshVhQZajlN1sqpLnlg==
X-CSE-MsgGUID: p02Q5Q9nTr2/Sf+SQiTZSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36400625"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="36400625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:05:09 -0800
X-CSE-ConnectionGUID: R1kbqonqR++M9M/J5KxKdg==
X-CSE-MsgGUID: iccNDivmR82kc2bbOfKeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122049485"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:05:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sasha Finkelstein via B4 Relay
 <devnull+fnkl.kernel.gmail.com@kernel.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha
 Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
In-Reply-To: <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
Date: Mon, 25 Nov 2024 11:04:59 +0200
Message-ID: <8734jfznt0.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Nov 2024, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..36510194e18161ef6514885c764b2e7085c587e5
> --- /dev/null
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -0,0 +1,814 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/file.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include <asm/current.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>

Please only include what you use.

BR,
Jani.


-- 
Jani Nikula, Intel
