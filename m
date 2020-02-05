Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF315333D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90956F5D6;
	Wed,  5 Feb 2020 14:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408466E9A9;
 Wed,  5 Feb 2020 14:42:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 06:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; d="scan'208";a="235603307"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 05 Feb 2020 06:42:46 -0800
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 06:42:46 -0800
Received: from bgsmsx152.gar.corp.intel.com (10.224.48.50) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 06:42:45 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX152.gar.corp.intel.com ([169.254.6.38]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 20:12:21 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 01/17] drm: add DP 1.4 VSC SDP Payload related enums
 and a structure
Thread-Topic: [PATCH v3 01/17] drm: add DP 1.4 VSC SDP Payload related enums
 and a structure
Thread-Index: AQHV2uiQsTcPIA4O9UWXtRUV8gw5eKgMqBMw
Date: Wed, 5 Feb 2020 14:42:21 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DCE00@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-2-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-2-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTQxMGYyMTYtMTk2MS00ODNhLWFmYjItYTQ4NWZiODFlNzhkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZWhXcnpqbENiZ3orQ1JTWHMzY1JwVTdEZ2YxcWFBZ3JFUUFEdUpxN2Z2QnowcHZCR1VEd2VyVUxKRHpPQTNzKyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v3 01/17] drm: add DP 1.4 VSC SDP Payload related enums and a
> structure

%s/add/Add/
Also you can rephrase this as " Add DP1.4 VSC SDP Payload related Data Structures"/

> It adds new enumeration definitions for VSC SDP Payload for Pixel
> Encoding/Colorimetry Format.
> And it adds a new drm data structure for DP VSC SDP.
> 
> enum dp_colorspace and enum dp_colorimetry correspond "Pixel Encoding and
> Colorimetry Formats". enum dp_dynamic_range corresponds "Dynamic Range".
> And enum dp_content_type corresponds "Content Type"
> All of them are based on DP 1.4 spec [Table 2-117: VSC SDP Payload for
> DB16 through DB18].
> 
> v3: Add a new drm data structure for DP VSC SDP
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  include/drm/drm_dp_helper.h | 57 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> 262faf9e5e94..c098727681fa 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1209,6 +1209,63 @@ struct dp_sdp {
>  #define EDP_VSC_PSR_UPDATE_RFB		(1<<1)
>  #define EDP_VSC_PSR_CRC_VALUES_VALID	(1<<2)
> 
> +/* Based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
> +DB18] */ enum dp_colorspace {

We should not call this colorspace, rather rename it to dp_pixelformat.
These are not colorspaces.

Also add these to kernel docs as they are standard definitions.

> +	DP_COLORSPACE_RGB = 0,

Make this as DP_PIXELFORMAT_RGB and rename all the below ones as well.

> +	DP_COLORSPACE_YUV444 = 0x1,
> +	DP_COLORSPACE_YUV422 = 0x2,
> +	DP_COLORSPACE_YUV420 = 0x3,
> +	DP_COLORSPACE_Y_ONLY = 0x4,
> +	DP_COLORSPACE_RAW = 0x5,
> +	DP_COLORSPACE_RESERVED = 0x6,
> +};
> +
> +/**
> + * Based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
> +DB18]
> + * and a name of enum member followes DRM_MODE_COLORIMETRY definition.

Typo in follows

> + */
> +enum dp_colorimetry {

You can call this as dp_colorspace (this is actual colorspace), you can stick with colorimetry as well.
Will leave that to you.

> +	DP_COLORIMETRY_DEFAULT = 0, /* sRGB (IEC 61966-2-1) / ITU-R BT.601 */
> +	DP_COLORIMETRY_RGB_WIDE_FIXED = 0x1,
> +	DP_COLORIMETRY_BT709_YCC = 0x1,
> +	DP_COLORIMETRY_RGB_WIDE_FLOAT = 0x2,
> +	DP_COLORIMETRY_XVYCC_601 = 0x2,
> +	DP_COLORIMETRY_OPRGB = 0x3,
> +	DP_COLORIMETRY_XVYCC_709 = 0x3,
> +	DP_COLORIMETRY_DCI_P3_RGB = 0x4,
> +	DP_COLORIMETRY_SYCC_601 = 0x4,
> +	DP_COLORIMETRY_RGB_CUSTOM = 0x5,
> +	DP_COLORIMETRY_OPYCC_601 = 0x5,
> +	DP_COLORIMETRY_BT2020_RGB = 0x6,
> +	DP_COLORIMETRY_BT2020_CYCC = 0x6,
> +	DP_COLORIMETRY_BT2020_YCC = 0x7,
> +};
> +
> +enum dp_dynamic_range {
> +	DP_DYNAMIC_RANGE_VESA = 0,
> +	DP_DYNAMIC_RANGE_CTA = 1,
> +};
> +
> +enum dp_content_type {
> +	DP_CONTENT_TYPE_NOT_DEFINED = 0x00,
> +	DP_CONTENT_TYPE_GRAPHICS = 0x01,
> +	DP_CONTENT_TYPE_PHOTO = 0x02,
> +	DP_CONTENT_TYPE_VIDEO = 0x03,
> +	DP_CONTENT_TYPE_GAME = 0x04,
> +};
> +
> +/* DRM DP VSC SDP as per DP 1.4 spec */ struct drm_dp_vsc_sdp {
> +	unsigned char sdp_type; /* Secondary-data Packet Type */
> +	unsigned char revision; /* Revision Number */

These comments seems self-explanatory, you can probably drop them.

> +	unsigned char length; /* Number of Valid Data Bytes */
> +	enum dp_colorspace colorspace;
> +	enum dp_colorimetry colorimetry;
> +	int bpc; /* bit per color */
> +	enum dp_dynamic_range dynamic_range;
> +	enum dp_content_type content_type;
> +};
> +
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> 
>  static inline int
> --
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
