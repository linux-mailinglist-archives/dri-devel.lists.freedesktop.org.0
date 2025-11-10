Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4234DC457ED
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F310E313;
	Mon, 10 Nov 2025 09:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcLqfOp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2C10E173;
 Mon, 10 Nov 2025 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762765396; x=1794301396;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yU6LiGee29Hm/OHfAO0x+GuK2AbKddsOz2vgNLRz8eU=;
 b=PcLqfOp3nUs2ppzfCAlWjD1CBGLXxsfdG4cXwvPZnUBbJ5bl7mucccjX
 zwEAFnZrOLvcvBJEj00FA/rf3uzxUmY99CA442iv+FvBnid/EBkOKYuHI
 qA8InLHA0ojoFkHid211wdz7wNVueRBT4mDcvn1JG5oG9lEN91utJHz88
 +kQlRnh12rx0JagChBEtkkbJkE0gDLicN93oTJ1BwWkYRckMpKkDoXn4K
 wQUGMO5eKHWpUiRf7YoVVrB/4AsmHB+7hGKYI6P4OyqRKsBVRlhpTW+Wd
 eu8SVNazejL6WVrHjRGalrgqAFWT/yvBdNDrfz+CI2s7/+CqaiCPz3+wV w==;
X-CSE-ConnectionGUID: hOdjKSqZQgmtpqGtmSsTTQ==
X-CSE-MsgGUID: QOHxCaXYTSO7ARaI9Kmjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68454361"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="68454361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:03:15 -0800
X-CSE-ConnectionGUID: UeyHMpycQFSrVmsJsyJhmQ==
X-CSE-MsgGUID: 5agut2yqTAGPewinEqOeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="193006102"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:03:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH v2 03/10] drm/i915/alpm: Enable debugfs for DP2.1
In-Reply-To: <20251103220957.1229608-4-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-4-animesh.manna@intel.com>
Date: Mon, 10 Nov 2025 11:03:10 +0200
Message-ID: <4288b58364e6fdf88b1132813fdd04430621719a@intel.com>
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

On Tue, 04 Nov 2025, Animesh Manna <animesh.manna@intel.com> wrote:
> Enable AlPM debug info through lobf debug info.
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 639941e332f3..779718d0c8dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -541,9 +541,15 @@ void intel_alpm_lobf_debugfs_add(struct intel_connec=
tor *connector)
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct dentry *root =3D connector->base.debugfs_entry;
>=20=20
> -	if (DISPLAY_VER(display) < 20 ||
> -	    connector->base.connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> +	if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPor=
t) {
> +		if (DISPLAY_VER(display) < 35)
> +			return;
> +	} else if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP=
) {
> +		if (DISPLAY_VER(display) < 20)
> +			return;
> +	} else {
>  		return;
> +	}

These are the same conditions that you're sprinkling all over the place
in the previous patch, and basically boil down to "does the connector
support alpm?"

BR,
Jani.


>=20=20
>  	debugfs_create_file("i915_edp_lobf_debug", 0644, root,
>  			    connector, &i915_edp_lobf_debug_fops);

--=20
Jani Nikula, Intel
