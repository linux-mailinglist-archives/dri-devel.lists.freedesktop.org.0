Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFB8D4D0F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5739C12A4EB;
	Thu, 30 May 2024 13:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlaELCXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354D12A491;
 Thu, 30 May 2024 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076935; x=1748612935;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mE0meffI5WUSNyn4mf7soUBM96k9Zg8P9lQGYLIp4Uk=;
 b=ZlaELCXws837Bcv6a+vk2GVpvrh7WknFL4j8TnXBpy608VWn8SV3/8IC
 jvPURijwsG9OblTUE8owsxvTa4HL1koHYksyrXGEX6X+lRObs9M3QESVT
 g5qmH7V/C62i1QvArYfDNUqOsAiE9yUYeJmTslQyezZ9OUJVTD7eeDrWk
 wRf6EI864rs5mYFTp5kgbV5OpBrBFvoygF4XsMFHcPoKbGFJTPUSNycVn
 Um+pJrmxewAh4VmaAb/G1Zg5P/dGc/hoC4LPa2ZR9HRD0iPoTcSVkgNGc
 cVRQ5O6g6Fy6Pqmx4Jt5VOUHVxL00HzUi3uhbICFbxvHTFZ9GYqDwCoD9 w==;
X-CSE-ConnectionGUID: pUFWMRh/RKy52L3d+0TNKw==
X-CSE-MsgGUID: 4KN0ooiuR9GCH5Yk0GNW0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24683938"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24683938"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:48:55 -0700
X-CSE-ConnectionGUID: PuD68Po6SRqG5BrmDYLuPQ==
X-CSE-MsgGUID: P9TOWsZzT7mhYWPT4N1Hhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40736246"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:48:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH v10 1/8] drm/i915: Separate VRR related register
 definitions
In-Reply-To: <20240530060408.67027-2-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-2-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 30 May 2024 16:48:49 +0300
Message-ID: <87o78nh0la.fsf@intel.com>
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

On Thu, 30 May 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> w=
rote:
> Move VRR related register definitions to a separate file called
> intel_vrr_regs.h.

But this is not just movement... there's a bunch of other (mostly
unwanted?) changes there too.

'git show --color-moved' is a powerful tool for reviewing code
movement. If it's not just movement, you have to fallback to manual
review of the whole thing.

> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c      |   1 +
>  drivers/gpu/drm/i915/display/intel_vrr_regs.h | 117 ++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h               | 100 ---------------
>  3 files changed, 118 insertions(+), 100 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 5f3657aa8313..871e6e6a184a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -9,6 +9,7 @@
>  #include "intel_de.h"
>  #include "intel_display_types.h"
>  #include "intel_vrr.h"
> +#include "intel_vrr_regs.h"
>  #include "intel_dp.h"
>=20=20
>  bool intel_vrr_is_capable(struct intel_connector *connector)
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/=
drm/i915/display/intel_vrr_regs.h
> new file mode 100644
> index 000000000000..c6ad0a88cf88
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> @@ -0,0 +1,117 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_VRR_REG_H__
> +#define __INTEL_VRR_REG_H__

Does not match file name.

BR,
Jani.

> +
> +#include "intel_display_reg_defs.h"
> +
> +/* VRR registers */
> +#define _TRANS_VRR_VSYNC_A                      0x60078
> +#define TRANS_VRR_VSYNC(dev_priv, trans)        _MMIO_TRANS2(dev_priv, t=
rans, \
> +                                                _TRANS_VRR_VSYNC_A)
> +#define VRR_VSYNC_END_MASK                      REG_GENMASK(28, 16)
> +#define VRR_VSYNC_END(vsync_end)                REG_FIELD_PREP(VRR_VSYNC=
_END_MASK, (vsync_end))
> +#define VRR_VSYNC_START_MASK                    REG_GENMASK(12, 0)
> +#define VRR_VSYNC_START(vsync_start)            REG_FIELD_PREP(VRR_VSYNC=
_START_MASK, (vsync_start))
> +
> +#define _TRANS_VRR_CTL_A			0x60420
> +#define _TRANS_VRR_CTL_B			0x61420
> +#define _TRANS_VRR_CTL_C			0x62420
> +#define _TRANS_VRR_CTL_D			0x63420
> +#define TRANS_VRR_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _T=
RANS_VRR_CTL_A)
> +#define VRR_CTL_VRR_ENABLE			REG_BIT(31)
> +#define VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
> +#define VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> +#define VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
> +#define VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_M=
ASK, (x))
> +#define VRR_CTL_PIPELINE_FULL_OVERRIDE		REG_BIT(0)
> +#define XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
> +#define XELPD_VRR_CTL_VRR_GUARDBAND(x)		REG_FIELD_PREP(XELPD_VRR_CTL_VRR=
_GUARDBAND_MASK, \
> +								(x))
> +
> +#define _TRANS_VRR_VMAX_A			0x60424
> +#define _TRANS_VRR_VMAX_B			0x61424
> +#define _TRANS_VRR_VMAX_C			0x62424
> +#define _TRANS_VRR_VMAX_D			0x63424
> +#define TRANS_VRR_VMAX(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _T=
RANS_VRR_VMAX_A)
> +#define VRR_VMAX_MASK				REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_VMAXSHIFT_A			0x60428
> +#define _TRANS_VRR_VMAXSHIFT_B			0x61428
> +#define _TRANS_VRR_VMAXSHIFT_C			0x62428
> +#define _TRANS_VRR_VMAXSHIFT_D			0x63428
> +#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, tran=
s, \
> +						_TRANS_VRR_VMAXSHIFT_A)
> +#define VRR_VMAXSHIFT_DEC_MASK			REG_GENMASK(29, 16)
> +#define VRR_VMAXSHIFT_DEC			REG_BIT(16)
> +#define VRR_VMAXSHIFT_INC_MASK			REG_GENMASK(12, 0)
> +
> +#define _TRANS_VRR_STATUS_A			0x6042C
> +#define _TRANS_VRR_STATUS_B			0x6142C
> +#define _TRANS_VRR_STATUS_C			0x6242C
> +#define _TRANS_VRR_STATUS_D			0x6342C
> +#define TRANS_VRR_STATUS(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
> +						_TRANS_VRR_STATUS_A)
> +#define VRR_STATUS_VMAX_REACHED			REG_BIT(31)
> +#define VRR_STATUS_NOFLIP_TILL_BNDR		REG_BIT(30)
> +#define VRR_STATUS_FLIP_BEF_BNDR		REG_BIT(29)
> +#define VRR_STATUS_NO_FLIP_FRAME		REG_BIT(28)
> +#define VRR_STATUS_VRR_EN_LIVE			REG_BIT(27)
> +#define VRR_STATUS_FLIPS_SERVICED		REG_BIT(26)
> +#define VRR_STATUS_VBLANK_MASK			REG_GENMASK(22, 20)
> +#define STATUS_FSM_IDLE			REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
> +#define STATUS_FSM_WAIT_TILL_FDB		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK,=
 1)
> +#define STATUS_FSM_WAIT_TILL_FS		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, =
2)
> +#define STATUS_FSM_WAIT_TILL_FLIP		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK=
, 3)
> +#define STATUS_FSM_PIPELINE_FILL		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK,=
 4)
> +#define STATUS_FSM_ACTIVE			REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
> +#define STATUS_FSM_LEGACY_VBLANK		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK,=
 6)
> +
> +#define _TRANS_VRR_VMIN_A                       0x60434
> +#define _TRANS_VRR_VMIN_B                       0x61434
> +#define _TRANS_VRR_VMIN_C                       0x62434
> +#define _TRANS_VRR_VMIN_D                       0x63434
> +#define TRANS_VRR_VMIN(dev_priv, trans) _MMIO_TRANS2(dev_priv, trans, _T=
RANS_VRR_VMIN_A)
> +#define VRR_VMIN_MASK                           REG_GENMASK(15, 0)
> +
> +#define _TRANS_VRR_FLIPLINE_A			0x60438
> +#define _TRANS_VRR_FLIPLINE_B			0x61438
> +#define _TRANS_VRR_FLIPLINE_C			0x62438
> +#define _TRANS_VRR_FLIPLINE_D			0x63438
> +#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans=
, \
> +						_TRANS_VRR_FLIPLINE_A)
> +#define VRR_FLIPLINE_MASK			REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_STATUS2_A			0x6043C
> +#define _TRANS_VRR_STATUS2_B			0x6143C
> +#define _TRANS_VRR_STATUS2_C			0x6243C
> +#define _TRANS_VRR_STATUS2_D			0x6343C
> +#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans,=
 \
> +						_TRANS_VRR_STATUS2_A)
> +#define VRR_STATUS2_VERT_LN_CNT_MASK		REG_GENMASK(19, 0)
> +
> +#define _TRANS_VRR_VTOTAL_PREV_A                0x60480
> +#define _TRANS_VRR_VTOTAL_PREV_B                0x61480
> +#define _TRANS_VRR_VTOTAL_PREV_C                0x62480
> +#define _TRANS_VRR_VTOTAL_PREV_D                0x63480
> +#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)  _MMIO_TRANS2(dev_priv, t=
rans, \
> +                                                _TRANS_VRR_VTOTAL_PREV_A)
> +#define VRR_VTOTAL_FLIP_BEFR_BNDR               REG_BIT(31)
> +#define VRR_VTOTAL_FLIP_AFTER_BNDR              REG_BIT(30)
> +#define VRR_VTOTAL_FLIP_AFTER_DBLBUF            REG_BIT(29)
> +#define VRR_VTOTAL_PREV_FRAME_MASK              REG_GENMASK(19, 0)
> +
> +#define _TRANS_PUSH_A				0x60A70
> +#define _TRANS_PUSH_B				0x61A70
> +#define _TRANS_PUSH_C				0x62A70
> +#define _TRANS_PUSH_D				0x63A70
> +#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, \
> +						_TRANS_PUSH_A)
> +#define TRANS_PUSH_EN				REG_BIT(31)
> +#define TRANS_PUSH_SEND			REG_BIT(30)
> +
> +#endif /* __INTEL_VRR_REGS__ */
> +
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index be57812a6b07..a6a8464fcff8 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1228,106 +1228,6 @@
>  #define PIPESRC(pipe)		_MMIO_TRANS2(dev_priv, (pipe), _PIPEASRC)
>  #define TRANS_MULT(trans)	_MMIO_TRANS2(dev_priv, (trans), _TRANS_MULT_A)
>=20=20
> -/* VRR registers */
> -#define _TRANS_VRR_CTL_A		0x60420
> -#define _TRANS_VRR_CTL_B		0x61420
> -#define _TRANS_VRR_CTL_C		0x62420
> -#define _TRANS_VRR_CTL_D		0x63420
> -#define TRANS_VRR_CTL(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _=
TRANS_VRR_CTL_A)
> -#define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
> -#define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
> -#define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> -#define   VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
> -#define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL=
_MASK, (x))
> -#define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
> -#define	  XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
> -#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VR=
R_GUARDBAND_MASK, (x))
> -
> -#define _TRANS_VRR_VMAX_A		0x60424
> -#define _TRANS_VRR_VMAX_B		0x61424
> -#define _TRANS_VRR_VMAX_C		0x62424
> -#define _TRANS_VRR_VMAX_D		0x63424
> -#define TRANS_VRR_VMAX(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _=
TRANS_VRR_VMAX_A)
> -#define   VRR_VMAX_MASK			REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_VMIN_A		0x60434
> -#define _TRANS_VRR_VMIN_B		0x61434
> -#define _TRANS_VRR_VMIN_C		0x62434
> -#define _TRANS_VRR_VMIN_D		0x63434
> -#define TRANS_VRR_VMIN(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _=
TRANS_VRR_VMIN_A)
> -#define   VRR_VMIN_MASK			REG_GENMASK(15, 0)
> -
> -#define _TRANS_VRR_VMAXSHIFT_A		0x60428
> -#define _TRANS_VRR_VMAXSHIFT_B		0x61428
> -#define _TRANS_VRR_VMAXSHIFT_C		0x62428
> -#define _TRANS_VRR_VMAXSHIFT_D		0x63428
> -#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, tran=
s, \
> -					_TRANS_VRR_VMAXSHIFT_A)
> -#define   VRR_VMAXSHIFT_DEC_MASK	REG_GENMASK(29, 16)
> -#define   VRR_VMAXSHIFT_DEC		REG_BIT(16)
> -#define   VRR_VMAXSHIFT_INC_MASK	REG_GENMASK(12, 0)
> -
> -#define _TRANS_VRR_STATUS_A		0x6042C
> -#define _TRANS_VRR_STATUS_B		0x6142C
> -#define _TRANS_VRR_STATUS_C		0x6242C
> -#define _TRANS_VRR_STATUS_D		0x6342C
> -#define TRANS_VRR_STATUS(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans,=
 _TRANS_VRR_STATUS_A)
> -#define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
> -#define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
> -#define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
> -#define   VRR_STATUS_NO_FLIP_FRAME	REG_BIT(28)
> -#define   VRR_STATUS_VRR_EN_LIVE	REG_BIT(27)
> -#define   VRR_STATUS_FLIPS_SERVICED	REG_BIT(26)
> -#define   VRR_STATUS_VBLANK_MASK	REG_GENMASK(22, 20)
> -#define   STATUS_FSM_IDLE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
> -#define   STATUS_FSM_WAIT_TILL_FDB	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK=
, 1)
> -#define   STATUS_FSM_WAIT_TILL_FS	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK,=
 2)
> -#define   STATUS_FSM_WAIT_TILL_FLIP	REG_FIELD_PREP(VRR_STATUS_VBLANK_MAS=
K, 3)
> -#define   STATUS_FSM_PIPELINE_FILL	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK=
, 4)
> -#define   STATUS_FSM_ACTIVE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
> -#define   STATUS_FSM_LEGACY_VBLANK	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK=
, 6)
> -
> -#define _TRANS_VRR_VTOTAL_PREV_A	0x60480
> -#define _TRANS_VRR_VTOTAL_PREV_B	0x61480
> -#define _TRANS_VRR_VTOTAL_PREV_C	0x62480
> -#define _TRANS_VRR_VTOTAL_PREV_D	0x63480
> -#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)	_MMIO_TRANS2(dev_priv, tr=
ans, \
> -					_TRANS_VRR_VTOTAL_PREV_A)
> -#define   VRR_VTOTAL_FLIP_BEFR_BNDR	REG_BIT(31)
> -#define   VRR_VTOTAL_FLIP_AFTER_BNDR	REG_BIT(30)
> -#define   VRR_VTOTAL_FLIP_AFTER_DBLBUF	REG_BIT(29)
> -#define   VRR_VTOTAL_PREV_FRAME_MASK	REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_FLIPLINE_A		0x60438
> -#define _TRANS_VRR_FLIPLINE_B		0x61438
> -#define _TRANS_VRR_FLIPLINE_C		0x62438
> -#define _TRANS_VRR_FLIPLINE_D		0x63438
> -#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans=
, \
> -					_TRANS_VRR_FLIPLINE_A)
> -#define   VRR_FLIPLINE_MASK		REG_GENMASK(19, 0)
> -
> -#define _TRANS_VRR_STATUS2_A		0x6043C
> -#define _TRANS_VRR_STATUS2_B		0x6143C
> -#define _TRANS_VRR_STATUS2_C		0x6243C
> -#define _TRANS_VRR_STATUS2_D		0x6343C
> -#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans,=
 _TRANS_VRR_STATUS2_A)
> -#define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
> -
> -#define _TRANS_PUSH_A			0x60A70
> -#define _TRANS_PUSH_B			0x61A70
> -#define _TRANS_PUSH_C			0x62A70
> -#define _TRANS_PUSH_D			0x63A70
> -#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRAN=
S_PUSH_A)
> -#define   TRANS_PUSH_EN			REG_BIT(31)
> -#define   TRANS_PUSH_SEND		REG_BIT(30)
> -
> -#define _TRANS_VRR_VSYNC_A		0x60078
> -#define TRANS_VRR_VSYNC(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, =
_TRANS_VRR_VSYNC_A)
> -#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> -#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsy=
nc_end))
> -#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> -#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK=
, (vsync_start))
> -
>  /* VGA port control */
>  #define ADPA			_MMIO(0x61100)
>  #define PCH_ADPA                _MMIO(0xe1100)

--=20
Jani Nikula, Intel
