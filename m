Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1AABA5DB
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 00:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C675610EB9E;
	Fri, 16 May 2025 22:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8qMxHzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C710E14A;
 Fri, 16 May 2025 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747433971; x=1778969971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pNQgrf3kHx9tBSk5s9dabdfvWxeLz9IouCzZLXtswm8=;
 b=U8qMxHzFhRVn+Ao8ylNAwLBUsqyOwxJq33dfzHAPT7zl4aVFDSI6WDXd
 UDZaThxKPApmWL8hNPT5dmV51C0rUFWM7cz1ASxUERE5+OB6I6Udc6SCk
 OdK7CiM5Hda4nKU8F7v1wVxyvAT5eNMghO69zwdb5YzGcXjvpRkM56cSN
 5rnKSZI/s/sNKdrD07u+JyfTwVl3D9Npfxe60Q/0fZf208/8md0YNB3nK
 FBwBTUTAFrdSl4qCpE1hCTgsmtSj0cAeX9j5/PdJQfDkWl9pD3QXJu+Vw
 6e/gDI07hme6cy2Vik7Z++vELx90Y+Lhu+vJoS9W2kLcWHjhMimTGMbB5 w==;
X-CSE-ConnectionGUID: AMxY/jdxQXSbr21yzrI+tg==
X-CSE-MsgGUID: F+pnEVhHQ/SQP9uRPt7wKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="71922651"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; d="scan'208";a="71922651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 15:19:28 -0700
X-CSE-ConnectionGUID: zhBWBYrtT3y3PomN/O1Ofw==
X-CSE-MsgGUID: Y0x76TZKR5mErtlBiwu4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; d="scan'208";a="175946731"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 15:19:23 -0700
Date: Sat, 17 May 2025 01:19:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v10 01/10] mtd: add driver for intel graphics
 non-volatile memory device
Message-ID: <aCe55yrAsAGsRMM2@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-2-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:36PM +0300, Alexander Usyskin wrote:
> Add auxiliary driver for intel discrete graphics
> non-volatile memory device.

A few nits below but we're good to go.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

...

> +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> +			      const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> +	struct device *device;
> +	struct intel_dg_nvm *nvm;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	int ret;

Reverse xmas order (and same for all other patches for consistency).

...

> diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
> new file mode 100644
> index 000000000000..53193fda55eb
> --- /dev/null
> +++ b/include/linux/intel_dg_nvm_aux.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_DG_NVM_AUX_H__
> +#define __INTEL_DG_NVM_AUX_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/types.h>

Missing ioport.h

> +#define INTEL_DG_NVM_REGIONS 13
> +
> +struct intel_dg_nvm_region {
> +	const char *name;
> +};
> +
> +struct intel_dg_nvm_dev {
> +	struct auxiliary_device aux_dev;
> +	bool writable_override;
> +	struct resource bar;
> +	const struct intel_dg_nvm_region *regions;
> +};
> +
> +#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
> +
> +#endif /* __INTEL_DG_NVM_AUX_H__ */
> -- 
> 2.43.0
> 
