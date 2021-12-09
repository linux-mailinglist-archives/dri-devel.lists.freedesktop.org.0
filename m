Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ABB46EFEF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416010E36E;
	Thu,  9 Dec 2021 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C413F10E121;
 Thu,  9 Dec 2021 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639062901; x=1670598901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i4VTU44a7vwNBDgQOwjIJ8qx7a6awh3B2AlbEsl7LaM=;
 b=bB/TFh01e9RaGZ/svyw14gKojT8MfLRjkDKifDNCW+DNOhg59rIl7MIB
 KYb4KrHNMZbVbID055lCMbbi71IdGRFBAy6x4ylJFkG+i+jTSgP7kFF1Q
 zXL+gZdPjQVtQK7etfeIqxsJk8fUI8q5ZrUgoZCGBHmo9YheWtTj8WeLs
 akQAfbgGOJ6b+CA4cctXCDiokFY9h04vC9Oq7RqVI0NNH7weq8yRiZicW
 8vI9pouworYQuUa96iJliaBOwAKvmb9o0QstKHgSscu9mWa8ERBf5f9KL
 xA79eoTcivxDOxxAMZoHdhY9lK3vBLHynmw2O0SQiQNWu3yWDtuBaS7mA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298909088"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298909088"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="680357558"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2021 07:15:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 15:14:58 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.020;
 Thu, 9 Dec 2021 07:14:57 -0800
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
Thread-Topic: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
Thread-Index: AQHX7OohHRHIyXgnbE247GMp18/vBqwqQl1Q
Date: Thu, 9 Dec 2021 15:14:56 +0000
Message-ID: <b4302b4804784f2c9379be244ed4f279@intel.com>
References: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>
> Sent: Thursday, December 9, 2021 5:47 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Lisovskiy, Stanislav
> <stanislav.lisovskiy@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>=
; C,
> Ramalingam <ramalingam.c@intel.com>; ville.syrjala@linux.intel.com; Deak,
> Imre <imre.deak@intel.com>; Chery, Nanley G <nanley.g.chery@intel.com>
> Subject: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
>=20

We want this patch to be 2/2, right? That way, we expose public kernel supp=
ort for the format after the kernel gains internal support for it.=20

With that fixed, this patch is:

Acked-by: Nanley Chery <nanley.g.chery@intel.com>

Alternatively, you could apply the ack to the prior combined patch if you'd=
 like.

-Nanley



> This tiling layout uses 4KB tiles in a row-major layout. It has the same =
shape as
> Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It only d=
iffers from
> Tile Y at the 256B granularity in between. At this granularity, Tile Y ha=
s a shape
> of 16B x 32 rows, but this tiling has a shape of 64B x 8 rows.
>=20
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 7f652c96845b..a146c6df1066 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -565,6 +565,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
> fourcc_mod_code(INTEL, 8)
>=20
> +/*
> + * Intel Tile 4 layout
> + *
> + * This is a tiled layout using 4KB tiles in a row-major layout. It has
> +the same
> + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x
> +4). It
> + * only differs from Tile Y at the 256B granularity in between. At this
> + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling
> +has a shape
> + * of 64B x 8 rows.
> + */
> +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> --
> 2.24.1.485.gad05a3d8e5

