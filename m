Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46509C46768
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635F310E1C1;
	Mon, 10 Nov 2025 12:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTDyDWIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECB610E1C1;
 Mon, 10 Nov 2025 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762776517; x=1794312517;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HDhbD64dhBGTvqTSU04FhkSf6OLQ7/FybQXmL3+DEr0=;
 b=MTDyDWIcLgK4mZ5Yl2ixPTMo6keoPHZrRVUE7DO9+mPG+M6uMQOgFKD8
 xxonuKW1obC4za0aMIoAvsCvR+zlv1IsLBUEGHPz3yGnSaHGUU/XhmdyO
 CP/htYNvt6bErF5FlTDN94kOC3jULErmMXcf3vbP/Rj6+h7GVkYlTa8Jk
 yAZbGKeJKbU9bB2V9ZkTxBYD1DCRI9b58U9vNSZaId7j1WOrtWD5Bv64y
 oNzsNj7YXlBj6m/pciAI0QMkS3n5uI6Y7YAI+doaPv7J/nP1u2fDn6ZfW
 8KXqHUdUNmy8iP2dMtN1HWq5guZ9A3O/fRquWblpoH6qthbT0/YU9HOSv w==;
X-CSE-ConnectionGUID: +9JOjg9lSRmiLPbExxLAhQ==
X-CSE-MsgGUID: ai0X7mJ4QXW7jGM6t+nAhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82451292"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="82451292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:08:36 -0800
X-CSE-ConnectionGUID: wIPX4CMeSM+WCr0LSenHiw==
X-CSE-MsgGUID: ghv5CSV9RSKfSyewEokKtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="193041463"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:08:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v6 14/16] drm/i915/display: Add registers for 3D LUT
In-Reply-To: <20251105123413.2671075-15-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-15-uma.shankar@intel.com>
Date: Mon, 10 Nov 2025 14:08:27 +0200
Message-ID: <f64acba83751cf49663b4f8c6801095b7c17fc9e@intel.com>
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

On Wed, 05 Nov 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add registers needed to program 3D LUT
>
> BSpec: 69378, 69379, 69380
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  .../i915/display/skl_universal_plane_regs.h   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 4d71d07e90ff..88b4c6c57054 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -520,6 +520,32 @@
>  #define	  PLANE_MIN_DBUF_BLOCKS(val)		REG_FIELD_PREP(PLANE_MIN_DBUF_BLOCKS_MASK, (val))
>  #define	  PLANE_INTERIM_DBUF_BLOCKS_MASK	REG_GENMASK(11, 0)
>  #define	  PLANE_INTERIM_DBUF_BLOCKS(val)	REG_FIELD_PREP(PLANE_INTERIM_DBUF_BLOCKS_MASK, (val))
> +/* 3D LUT */
> +#define _LUT_3D_CTL_A		0x490A4
> +#define _LUT_3D_CTL_B		0x491A4
> +#define   LUT_3D_ENABLE			REG_BIT(31)
> +#define   LUT_3D_READY			REG_BIT(30)
> +#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
> +#define   LUT_3D_BIND_PIPE		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
> +#define   LUT_3D_BIND_PLANE_1		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
> +#define   LUT_3D_BIND_PLANE_2		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
> +#define   LUT_3D_BIND_PLANE_3		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
> +#define _LUT_3D_INDEX_A		0x490A8
> +#define _LUT_3D_INDEX_B		0x491A8
> +#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
> +#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
> +#define   LUT_3D_INDEX_VALUE(x)		REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
> +#define _LUT_3D_DATA_A		0x490AC
> +#define _LUT_3D_DATA_B		0x491AC
> +#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
> +#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
> +#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
> +#define   LUT_3D_DATA_RED(x)		REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
> +#define   LUT_3D_DATA_GREEN(x)		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
> +#define   LUT_3D_DATA_BLUE(x)		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
> +#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A, _LUT_3D_CTL_B)
> +#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A, _LUT_3D_INDEX_B)
> +#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A, _LUT_3D_DATA_B)

The regs go before their contents. For the umpteenth time, please read
the big comment near the top of i915_reg.h.


>  
>  /* tgl+ */
>  #define _SEL_FETCH_PLANE_CTL_1_A		0x70890

-- 
Jani Nikula, Intel
