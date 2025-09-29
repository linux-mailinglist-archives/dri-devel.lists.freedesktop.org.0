Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C3BA912F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 13:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED28610E147;
	Mon, 29 Sep 2025 11:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3jVwiaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4049010E147
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759146004; x=1790682004;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=137britwVvpQbX//XWtXu1cRceB9CzfG7jhKto421XM=;
 b=S3jVwiaVtu0dJAIDNxPNnykIRPjo02QhO3iZxvL2MYsZONODY56bRCly
 wVuJSqJNFnjyac0KEYy1PdvwLsR62PNRt7NFPGCNCG1SVIFiOhPpFSG4a
 DxKKMqLsA5Mpc7u1Lb/7G3LZ2dmZ5+YueMCcxgumL31c/67uwEIjCGN+U
 drHT8zMe91R0B/Zo81UwFtvQW5MgKDD16X6k85zSDHulpBMM57o58jtnB
 S0DRBmSKo8JUtuuoPuj51NPnFv4xMaNQid8raIShbrenzDlq5G08Zb8Ji
 TkyNOmRGK+tYr5P2yMYTnBE6sR3PRE7Tv6pX3+L31PTZHgk2eYUIrgnJg w==;
X-CSE-ConnectionGUID: DI7AH4NNSeKBDTEBLWDYYg==
X-CSE-MsgGUID: 1IUt1XxITUekHQelQSihwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71630305"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71630305"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:40:03 -0700
X-CSE-ConnectionGUID: 9SJ6KRVUR763p5b7qdEZnA==
X-CSE-MsgGUID: tD4r/0coR9aVPQ5IqgsqHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="201891209"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:39:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chu Guangqing <chuguangqing@inspur.com>, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: Re: [PATCH v8 1/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000
 soc chipset
In-Reply-To: <20250929104831.8548-2-chuguangqing@inspur.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250929063103.7375-1-chuguangqing@inspur.com>
 <20250929104831.8548-1-chuguangqing@inspur.com>
 <20250929104831.8548-2-chuguangqing@inspur.com>
Date: Mon, 29 Sep 2025 14:39:56 +0300
Message-ID: <9ab159073b644c83541e4782c30ae9900b0f27d4@intel.com>
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

On Mon, 29 Sep 2025, Chu Guangqing <chuguangqing@inspur.com> wrote:
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> new file mode 100644
> index 000000000000..2e222af29f69
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +static int yhgch_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +	const struct drm_edid *drm_edid;
> +
> +	drm_edid = drm_edid_read(connector);
> +	if (drm_edid) {
> +		drm_edid_connector_update(connector, drm_edid);

You're supposed to do drm_edid_connector_update() even for NULL edid to
reset it.

BR,
Jani.


> +		count =  drm_edid_connector_add_modes(connector);
> +		if (count)
> +			goto out;
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +out:
> +	drm_edid_free(drm_edid);
> +	return count;
> +}

-- 
Jani Nikula, Intel
