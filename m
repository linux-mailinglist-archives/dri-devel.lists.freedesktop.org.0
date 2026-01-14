Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4ED1EA70
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57CD10E1AA;
	Wed, 14 Jan 2026 12:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnRyAOdH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735C810E1AA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768392546; x=1799928546;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EYswg02gjuvqs73LUDwN0ChfKC/BQKKnQB+oeLlaqiM=;
 b=XnRyAOdHwuvlL8mWfnRyb4Pxnrui2lxSDY5PuU0fEd0WLn0TAf3O/JWF
 s3IOhQNLDeWK+KSC7bT7I2aeH94CQCJHfpcTCQHEl5ajYS4lTuHWs8pLk
 oYGtlDs5oDpEPc1KxsrajXU+Kw31XnMpTmvNg5v/gZfiYNWM4QBA1Ky8b
 xBs46UaU6ZKYUvSmkd7rVWE3wAbHJt36zCfWLyVjNTEFMR2kuDbnKhOFZ
 UNI31YzaFulLhpKHJ86ir62hgq3BtyXNSfLxynkVBaTbKbQuAYdQrlwcz
 EQull3R+1+K0PbzdLPkDKpIdyHEBIIUrnpIs+m2A9wszv/4g6iC2v4oRh Q==;
X-CSE-ConnectionGUID: XKzhziueTuqokB737n9UQw==
X-CSE-MsgGUID: agRFQArRQeyT3E87eTeQjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68697366"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="68697366"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:09:06 -0800
X-CSE-ConnectionGUID: YfId4127RIiRbKbn/2MR/A==
X-CSE-MsgGUID: voMxLI1LSL+SxXySXk3osg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204943430"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:08:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>, Jonathan
 Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>, Chirag
 Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 2/5] accel/thames: Add driver for the C7x DSPs in TI SoCs
In-Reply-To: <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:08:56 +0200
Message-ID: <5d2167dd7c898afdb374429a9dca8d262967d125@intel.com>
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

On Tue, 13 Jan 2026, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> +obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
> \ No newline at end of file

Maybe add the newline while at it.

> diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..92af1d68063116bcfa28a33960cbe829029fc1bf
> --- /dev/null
> +++ b/drivers/accel/thames/thames_core.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#include "linux/remoteproc.h"

Ditto here about <> not "".


-- 
Jani Nikula, Intel
