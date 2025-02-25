Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A67A44511
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10AE10E71B;
	Tue, 25 Feb 2025 15:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqQshK25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859B10E731;
 Tue, 25 Feb 2025 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740498959; x=1772034959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lUmgfpSHD+QRa3iLG6Ueu1mvvaKggu850lorVuo3O60=;
 b=mqQshK25vcXw89ptyfuVB2nhvQEur3YLGdrq76ocVg0QkRFiWf344ts9
 pm4WZiDMoV8olz74fJu84uf8sLOGeC0IPBkWFD6pmHD7FLSLTvY7Dacmz
 tXAWXPVBHPsxg3bZnbS2pKR65gVjdlHBahuGuA/FJvJeCSKDqxtggQpCT
 AXxpmZJQyr4AvI+LC9ZJfC54weyiaMYZj4vPGnHCWcCuXfKKXH9+2NfVq
 Q1IhyvYbJsdlJPmujiJuczZFiOQn/z0/9KLNro0Yo65SjUSXXK6t2KBzT
 U2ixudq64kKaPDIivncZWAAnUqg4R39pSP+Qb5trgnnFKaDZImPv43Jso A==;
X-CSE-ConnectionGUID: f9qDXSRoRyC87EOC7DnHsw==
X-CSE-MsgGUID: yoPjZdkmQh+OVz5YQJ62nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41329467"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41329467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:55:59 -0800
X-CSE-ConnectionGUID: 7ibKE6YNR9GR3h4YaZTg7w==
X-CSE-MsgGUID: E79kmrgaSxauXGI/sVPHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121517015"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:55:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/dp: Add definitions for POST_LT_ADJ training
 sequence
In-Reply-To: <20250224172645.15763-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
 <20250224172645.15763-2-ville.syrjala@linux.intel.com>
Date: Tue, 25 Feb 2025 17:55:53 +0200
Message-ID: <87ikoy588m.fsf@intel.com>
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

On Mon, 24 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Add the bit definitions needed for POST_LT_ADJ sequence.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index c413ef68f9a3..260948a8f550 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -115,6 +115,7 @@
>=20=20
>  #define DP_MAX_LANE_COUNT                   0x002
>  # define DP_MAX_LANE_COUNT_MASK		    0x1f
> +# define DP_POST_LT_ADJ_REQ_SUPPORTED	    (1 << 5) /* 1.3 */
>  # define DP_TPS3_SUPPORTED		    (1 << 6) /* 1.2 */
>  # define DP_ENHANCED_FRAME_CAP		    (1 << 7)
>=20=20
> @@ -571,6 +572,7 @@
>=20=20
>  #define DP_LANE_COUNT_SET	            0x101
>  # define DP_LANE_COUNT_MASK		    0x0f
> +# define DP_POST_LT_ADJ_REQ_GRANTED         (1 << 5) /* 1.3 */
>  # define DP_LANE_COUNT_ENHANCED_FRAME_EN    (1 << 7)
>=20=20
>  #define DP_TRAINING_PATTERN_SET	            0x102
> @@ -791,6 +793,7 @@
>  #define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 =
E11 */
>  #define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 =
E11 */
>  #define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 =
E11 */
> +#define  DP_POST_LT_ADJ_REQ_IN_PROGRESS                 (1 << 5) /* 1.3 =
*/

Should be bit 1. Bit 5 is reserved.

BR,
Jani.


>  #define  DP_DOWNSTREAM_PORT_STATUS_CHANGED              (1 << 6)
>  #define  DP_LINK_STATUS_UPDATED                         (1 << 7)

--=20
Jani Nikula, Intel
