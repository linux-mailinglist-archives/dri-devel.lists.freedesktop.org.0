Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFAA98710E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 12:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9F10E30E;
	Thu, 26 Sep 2024 10:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcA+fKz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F110E097;
 Thu, 26 Sep 2024 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727345642; x=1758881642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fNa/A38DWkGMUP2hyy5uy10YSKBJ52bKN1PXHzOycNY=;
 b=jcA+fKz+LEjk/7hDnYzx/bpjLj7tIxj0wNK/9XbfaeaCmSpkPvtXBshl
 cnj/RDKisKHLcVok11GG8vMYuhfrJWpbrip8AIPLK7rwQx8xN8g9rKgm3
 yAliDXlvDFv1IpkNg18W7bTvcKBzfLXXzPq8u0nfA4VGu1nPFqoIxsSE2
 mUqNP+/KB61TnHlidXWFDfsONAUKE/m5UmDAYZXA9/prIJA4LxYk8k6ek
 9TrJaplbltjmVU/ebJNCVT8lyHawg9ugosoqBLZwyN+g/QbVhVMJ5uaRL
 dl9+aLVefWQVfxRZV1y3W1yCt+VrzIlLXndMmw2seiQMquAKkH3SYrDbO w==;
X-CSE-ConnectionGUID: 1bZUPNQpS6qjUZokZo3b1A==
X-CSE-MsgGUID: 8Bw1lWt1QnaqEx14n/okIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26526593"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26526593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:14:02 -0700
X-CSE-ConnectionGUID: SFfUd833TW+vSPH4fUAtgw==
X-CSE-MsgGUID: vUVrWtTxSqyWfItU/7y+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72899503"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:14:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH 1/7] drm/i915/histogram: Define registers for histogram
In-Reply-To: <20240925150754.1876893-2-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
 <20240925150754.1876893-2-arun.r.murthy@intel.com>
Date: Thu, 26 Sep 2024 13:13:56 +0300
Message-ID: <87h6a2204b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Sep 2024, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Add the register/bit definitions for global histogram.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../drm/i915/display/intel_histogram_reg.h    | 54 +++++++++++++++++++

We have 36 files named *_regs.h under display/, and 0 files named
*_reg.h. We should follow the pattern.

>  1 file changed, 54 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_reg.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_reg.h b/drivers=
/gpu/drm/i915/display/intel_histogram_reg.h
> new file mode 100644
> index 000000000000..ed8f22aa8e75
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_HISTOGRAM_REG_H__
> +#define __INTEL_HISTOGRAM_REG_H__
> +
> +#include <linux/types.h>

I don't see this used.

But it's probably prudent to #include "intel_display_reg_defs.h" for
_MMIO_PIPE() etc. like almost all the other _regs.h files do.

> +
> +/* GLOBAL_HIST related registers */
> +#define _DPST_CTL_A					0x490C0
> +#define _DPST_CTL_B					0x491C0
> +#define DPST_CTL(pipe)					_MMIO_PIPE(pipe, _DPST_CTL_A, _DPST_CTL_B)
> +#define DPST_CTL_IE_HIST_EN				REG_BIT(31)
> +#define DPST_CTL_RESTORE				REG_BIT(28)
> +#define DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
> +#define DPST_CTL_HIST_MODE				REG_BIT(24)
> +#define DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
> +#define DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT=
_MODE_MASK, 2)
> +#define DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
> +#define DPST_CTL_BIN_REG_FUNC_SEL			REG_BIT(11)
> +#define DPST_CTL_BIN_REG_FUNC_TC			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_=
SEL, 0)
> +#define DPST_CTL_BIN_REG_FUNC_IE			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_=
SEL, 1)
> +#define DPST_CTL_BIN_REG_MASK				REG_GENMASK(6, 0)
> +#define DPST_CTL_BIN_REG_CLEAR				REG_FIELD_PREP(DPST_CTL_BIN_REG_MASK, =
0)
> +#define DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CT=
L_IE_TABLE_VALUE_FORMAT, 1)
> +#define DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CT=
L_IE_TABLE_VALUE_FORMAT, 0)
> +#define DPST_CTL_HIST_MODE_YUV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 0)
> +#define DPST_CTL_HIST_MODE_HSV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 1)

We've tried to establish a uniform style for defining register macros
since 2017. Just so they're easier for everyone to read. It's documented
in i915_reg.h. Please indent the register *content* macros so they are
easier to distinguish from the actual register.

Ditto below.

> +
> +#define _DPST_GUARD_A					0x490C8
> +#define _DPST_GUARD_B					0x491C8
> +#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_=
B)
> +#define DPST_GUARD_HIST_INT_EN				REG_BIT(31)
> +#define DPST_GUARD_HIST_EVENT_STATUS			REG_BIT(30)
> +#define DPST_GUARD_INTERRUPT_DELAY_MASK			REG_GENMASK(29, 22)
> +#define DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTE=
RRUPT_DELAY_MASK, val)
> +#define DPST_GUARD_THRESHOLD_GB_MASK			REG_GENMASK(21, 0)
> +#define DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHO=
LD_GB_MASK, val)
> +
> +#define _DPST_BIN_A					0x490C4
> +#define _DPST_BIN_B					0x491C4
> +#define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
> +#define DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
> +#define DPST_BIN_BUSY					REG_BIT(31)
> +
> +#define INTEL_HISTOGRAM_PIPEA			0x90000000
> +#define INTEL_HISTOGRAM_PIPEB			0x90000002
> +#define INTEL_HISTOGRAM_EVENT(pipe)		PIPE(pipe, \
> +						     INTEL_HISTOGRAM_PIPEA, \
> +						     INTEL_HISTOGRAM_PIPEB)

This can't be right, but it's unused so wasn't caught.

BR,
Jani.


> +
> +#endif /* __INTEL_HISTOGRAM_REG_H__ */

--=20
Jani Nikula, Intel
