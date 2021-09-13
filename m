Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E034083D2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 07:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7B089D00;
	Mon, 13 Sep 2021 05:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5CC89CD3;
 Mon, 13 Sep 2021 05:31:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221240747"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="221240747"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 22:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="451433212"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2021 22:31:52 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 06:31:51 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:01:50 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 1/6] drm/displayid: re-align data block macros
Thread-Topic: [PATCH v2 1/6] drm/displayid: re-align data block macros
Thread-Index: AQHXnnMAa5BQecbV1Eqpk4y2zQAWGquhhC2w
Date: Mon, 13 Sep 2021 05:31:49 +0000
Message-ID: <1e6e31e240cd48888c3fcd08db20c523@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <b73d3ff2d5e4b23834ed0005186c5cf3a9de5c9e.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <b73d3ff2d5e4b23834ed0005186c5cf3a9de5c9e.1630419362.git.jani.nikula@intel.com>
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: Tuesday, August 31, 2021 7:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikul=
a, Jani
> <jani.nikula@intel.com>
> Subject: [PATCH v2 1/6] drm/displayid: re-align data block macros
>=20
> Make the values easier to read. Also add DisplayID Structure version and =
revision
> information (this is different from the spec version).

Looks ok to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_displayid.h | 57 +++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>=20
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h in=
dex
> ec64d141f578..0ed9445b5482 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -26,35 +26,36 @@
>=20
>  struct edid;
>=20
> -#define DATA_BLOCK_PRODUCT_ID 0x00
> -#define DATA_BLOCK_DISPLAY_PARAMETERS 0x01 -#define
> DATA_BLOCK_COLOR_CHARACTERISTICS 0x02 -#define
> DATA_BLOCK_TYPE_1_DETAILED_TIMING 0x03 -#define
> DATA_BLOCK_TYPE_2_DETAILED_TIMING 0x04 -#define
> DATA_BLOCK_TYPE_3_SHORT_TIMING 0x05 -#define
> DATA_BLOCK_TYPE_4_DMT_TIMING 0x06 -#define DATA_BLOCK_VESA_TIMING
> 0x07 -#define DATA_BLOCK_CEA_TIMING 0x08 -#define
> DATA_BLOCK_VIDEO_TIMING_RANGE 0x09 -#define
> DATA_BLOCK_PRODUCT_SERIAL_NUMBER 0x0a -#define
> DATA_BLOCK_GP_ASCII_STRING 0x0b -#define
> DATA_BLOCK_DISPLAY_DEVICE_DATA 0x0c -#define
> DATA_BLOCK_INTERFACE_POWER_SEQUENCING 0x0d -#define
> DATA_BLOCK_TRANSFER_CHARACTERISTICS 0x0e -#define
> DATA_BLOCK_DISPLAY_INTERFACE 0x0f -#define
> DATA_BLOCK_STEREO_DISPLAY_INTERFACE 0x10 -#define
> DATA_BLOCK_TILED_DISPLAY 0x12 -#define DATA_BLOCK_CTA 0x81
> +/* DisplayID Structure v1r2 Data Blocks */
> +#define DATA_BLOCK_PRODUCT_ID			0x00
> +#define DATA_BLOCK_DISPLAY_PARAMETERS		0x01
> +#define DATA_BLOCK_COLOR_CHARACTERISTICS	0x02
> +#define DATA_BLOCK_TYPE_1_DETAILED_TIMING	0x03
> +#define DATA_BLOCK_TYPE_2_DETAILED_TIMING	0x04
> +#define DATA_BLOCK_TYPE_3_SHORT_TIMING		0x05
> +#define DATA_BLOCK_TYPE_4_DMT_TIMING		0x06
> +#define DATA_BLOCK_VESA_TIMING			0x07
> +#define DATA_BLOCK_CEA_TIMING			0x08
> +#define DATA_BLOCK_VIDEO_TIMING_RANGE		0x09
> +#define DATA_BLOCK_PRODUCT_SERIAL_NUMBER	0x0a
> +#define DATA_BLOCK_GP_ASCII_STRING		0x0b
> +#define DATA_BLOCK_DISPLAY_DEVICE_DATA		0x0c
> +#define DATA_BLOCK_INTERFACE_POWER_SEQUENCING	0x0d
> +#define DATA_BLOCK_TRANSFER_CHARACTERISTICS	0x0e
> +#define DATA_BLOCK_DISPLAY_INTERFACE		0x0f
> +#define DATA_BLOCK_STEREO_DISPLAY_INTERFACE	0x10
> +#define DATA_BLOCK_TILED_DISPLAY		0x12
> +#define DATA_BLOCK_VENDOR_SPECIFIC		0x7f
> +#define DATA_BLOCK_CTA				0x81
>=20
> -#define DATA_BLOCK_VENDOR_SPECIFIC 0x7f
> -
> -#define PRODUCT_TYPE_EXTENSION 0
> -#define PRODUCT_TYPE_TEST 1
> -#define PRODUCT_TYPE_PANEL 2
> -#define PRODUCT_TYPE_MONITOR 3
> -#define PRODUCT_TYPE_TV 4
> -#define PRODUCT_TYPE_REPEATER 5
> -#define PRODUCT_TYPE_DIRECT_DRIVE 6
> +/* DisplayID Structure v1r2 Product Type */
> +#define PRODUCT_TYPE_EXTENSION			0
> +#define PRODUCT_TYPE_TEST			1
> +#define PRODUCT_TYPE_PANEL			2
> +#define PRODUCT_TYPE_MONITOR			3
> +#define PRODUCT_TYPE_TV				4
> +#define PRODUCT_TYPE_REPEATER			5
> +#define PRODUCT_TYPE_DIRECT_DRIVE		6
>=20
>  struct displayid_header {
>  	u8 rev;
> --
> 2.30.2

