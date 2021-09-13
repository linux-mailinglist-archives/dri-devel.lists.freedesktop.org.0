Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C534083D4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 07:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3716E0D8;
	Mon, 13 Sep 2021 05:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E444D89CD3;
 Mon, 13 Sep 2021 05:33:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="201750969"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="201750969"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 22:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="696524740"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2021 22:33:10 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 06:33:09 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:03:08 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [Intel-gfx] [PATCH v2 2/6] drm/displayid: add DisplayID v2.0 data
 blocks and primary use cases
Thread-Topic: [Intel-gfx] [PATCH v2 2/6] drm/displayid: add DisplayID v2.0
 data blocks and primary use cases
Thread-Index: AQHXnnMBiMXTUxHpzU+trdVompxVW6uhhK7w
Date: Mon, 13 Sep 2021 05:33:07 +0000
Message-ID: <13762ce10fb84a82bd3ee44dd842e353@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <5a5c7e4477782c174f494947e2a2ea618b2b1ef2.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <5a5c7e4477782c174f494947e2a2ea618b2b1ef2.1630419362.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: Tuesday, August 31, 2021 7:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikul=
a, Jani
> <jani.nikula@intel.com>
> Subject: [Intel-gfx] [PATCH v2 2/6] drm/displayid: add DisplayID v2.0 dat=
a blocks and
> primary use cases
>=20
> DisplayID v2.0 changes the data block identifiers and product types (now =
called
> primary use cases).

Looks ok to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_displayid.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h in=
dex
> 0ed9445b5482..79771091771a 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -26,6 +26,10 @@
>=20
>  struct edid;
>=20
> +/* DisplayID Structure versions */
> +#define DISPLAY_ID_STRUCTURE_VER_12		0x12
> +#define DISPLAY_ID_STRUCTURE_VER_20		0x20
> +
>  /* DisplayID Structure v1r2 Data Blocks */
>  #define DATA_BLOCK_PRODUCT_ID			0x00
>  #define DATA_BLOCK_DISPLAY_PARAMETERS		0x01
> @@ -48,6 +52,20 @@ struct edid;
>  #define DATA_BLOCK_VENDOR_SPECIFIC		0x7f
>  #define DATA_BLOCK_CTA				0x81
>=20
> +/* DisplayID Structure v2r0 Data Blocks */
> +#define DATA_BLOCK_2_PRODUCT_ID			0x20
> +#define DATA_BLOCK_2_DISPLAY_PARAMETERS		0x21
> +#define DATA_BLOCK_2_TYPE_7_DETAILED_TIMING	0x22
> +#define DATA_BLOCK_2_TYPE_8_ENUMERATED_TIMING	0x23
> +#define DATA_BLOCK_2_TYPE_9_FORMULA_TIMING	0x24
> +#define DATA_BLOCK_2_DYNAMIC_VIDEO_TIMING	0x25
> +#define DATA_BLOCK_2_DISPLAY_INTERFACE_FEATURES	0x26
> +#define DATA_BLOCK_2_STEREO_DISPLAY_INTERFACE	0x27
> +#define DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY	0x28
> +#define DATA_BLOCK_2_CONTAINER_ID		0x29
> +#define DATA_BLOCK_2_VENDOR_SPECIFIC		0x7e
> +#define DATA_BLOCK_2_CTA_DISPLAY_ID		0x81
> +
>  /* DisplayID Structure v1r2 Product Type */
>  #define PRODUCT_TYPE_EXTENSION			0
>  #define PRODUCT_TYPE_TEST			1
> @@ -57,6 +75,17 @@ struct edid;
>  #define PRODUCT_TYPE_REPEATER			5
>  #define PRODUCT_TYPE_DIRECT_DRIVE		6
>=20
> +/* DisplayID Structure v2r0 Display Product Primary Use Case (~Product T=
ype) */
> +#define PRIMARY_USE_EXTENSION			0
> +#define PRIMARY_USE_TEST			1
> +#define PRIMARY_USE_GENERIC			2
> +#define PRIMARY_USE_TV				3
> +#define PRIMARY_USE_DESKTOP_PRODUCTIVITY	4
> +#define PRIMARY_USE_DESKTOP_GAMING		5
> +#define PRIMARY_USE_PRESENTATION		6
> +#define PRIMARY_USE_HEAD_MOUNTED_VR		7
> +#define PRIMARY_USE_HEAD_MOUNTED_AR		8
> +
>  struct displayid_header {
>  	u8 rev;
>  	u8 bytes;
> --
> 2.30.2

