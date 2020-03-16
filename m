Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC618644C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 06:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C5E6E340;
	Mon, 16 Mar 2020 05:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888C86E33D;
 Mon, 16 Mar 2020 05:03:09 +0000 (UTC)
IronPort-SDR: MIAZt1N9eKP3N6u/6iyF/8+4dRMySJDYPQ3ROpKTmNfs5TTun/KqF0j7OIpb1b99CCSrPxtiKD
 MsjJ8B/H4wng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 22:03:08 -0700
IronPort-SDR: lhuvBZviN35VdEsvvOj/2qWTCRt8udAuVE1rjS5YSbiYAYX5LDmWusE9qEAOAO2VehSOR12MwC
 7rsJEZ/muKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; d="scan'208";a="233059048"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2020 22:03:08 -0700
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 22:03:07 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.111]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.116]) with mapi id 14.03.0439.000;
 Mon, 16 Mar 2020 10:33:05 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 01/18] drm: Add DP1.4 VSC SDP Payload related Data
 Structures
Thread-Topic: [PATCH v7 01/18] drm: Add DP1.4 VSC SDP Payload related Data
 Structures
Thread-Index: AQHV4K97AyUt9viiqE2Ijgjpo3PKW6hK3s1Q
Date: Mon, 16 Mar 2020 05:03:04 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F824324B9@BGSMSX104.gar.corp.intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-2-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200211074657.231405-2-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
> Sent: Tuesday, February 11, 2020 1:17 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v7 01/18] drm: Add DP1.4 VSC SDP Payload related Data Structures
> 
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
> v5: Addressed review comments from Uma
>     - Add kernel docs for added data structures
>     - Rename enum dp_colorspace to dp_pixelformat
>     - Polish commit message
>     - Fix typos
>     - Drop self-explanatory comments

Changes look good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  include/drm/drm_dp_helper.h | 130 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> 262faf9e5e94..e332f54013d7 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1209,6 +1209,136 @@ struct dp_sdp {
>  #define EDP_VSC_PSR_UPDATE_RFB		(1<<1)
>  #define EDP_VSC_PSR_CRC_VALUES_VALID	(1<<2)
> 
> +/**
> + * enum dp_pixelformat - drm DP Pixel encoding formats
> + *
> + * This enum is used to indicate DP VSC SDP Pixel encoding formats.
> + * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16
> +through
> + * DB18]
> + *
> + * @DP_PIXELFORMAT_RGB: RGB pixel encoding format
> + * @DP_PIXELFORMAT_YUV444: YCbCr 4:4:4 pixel encoding format
> + * @DP_PIXELFORMAT_YUV422: YCbCr 4:2:2 pixel encoding format
> + * @DP_PIXELFORMAT_YUV420: YCbCr 4:2:0 pixel encoding format
> + * @DP_PIXELFORMAT_Y_ONLY: Y Only pixel encoding format
> + * @DP_PIXELFORMAT_RAW: RAW pixel encoding format
> + * @DP_PIXELFORMAT_RESERVED: Reserved pixel encoding format  */ enum
> +dp_pixelformat {
> +	DP_PIXELFORMAT_RGB = 0,
> +	DP_PIXELFORMAT_YUV444 = 0x1,
> +	DP_PIXELFORMAT_YUV422 = 0x2,
> +	DP_PIXELFORMAT_YUV420 = 0x3,
> +	DP_PIXELFORMAT_Y_ONLY = 0x4,
> +	DP_PIXELFORMAT_RAW = 0x5,
> +	DP_PIXELFORMAT_RESERVED = 0x6,
> +};
> +
> +/**
> + * enum dp_colorimetry - drm DP Colorimetry formats
> + *
> + * This enum is used to indicate DP VSC SDP Colorimetry formats.
> + * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16
> +through
> + * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY
> definition.
> + *
> + * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
> + *                          ITU-R BT.601 colorimetry format
> + * @DP_COLORIMETRY_RGB_WIDE_FIXED: RGB wide gamut fixed point
> +colorimetry format
> + * @DP_COLORIMETRY_BT709_YCC: ITU-R BT.709 colorimetry format
> + * @DP_COLORIMETRY_RGB_WIDE_FLOAT: RGB wide gamut floating point
> + *                                 (scRGB (IEC 61966-2-2)) colorimetry format
> + * @DP_COLORIMETRY_XVYCC_601: xvYCC601 colorimetry format
> + * @DP_COLORIMETRY_OPRGB: OpRGB colorimetry format
> + * @DP_COLORIMETRY_XVYCC_709: xvYCC709 colorimetry format
> + * @DP_COLORIMETRY_DCI_P3_RGB: DCI-P3 (SMPTE RP 431-2) colorimetry
> +format
> + * @DP_COLORIMETRY_SYCC_601: sYCC601 colorimetry format
> + * @DP_COLORIMETRY_RGB_CUSTOM: RGB Custom Color Profile colorimetry
> +format
> + * @DP_COLORIMETRY_OPYCC_601: opYCC601 colorimetry format
> + * @DP_COLORIMETRY_BT2020_RGB: ITU-R BT.2020 R' G' B' colorimetry
> +format
> + * @DP_COLORIMETRY_BT2020_CYCC: ITU-R BT.2020 Y'c C'bc C'rc colorimetry
> +format
> + * @DP_COLORIMETRY_BT2020_YCC: ITU-R BT.2020 Y' C'b C'r colorimetry
> +format  */ enum dp_colorimetry {
> +	DP_COLORIMETRY_DEFAULT = 0,
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
> +/**
> + * enum dp_dynamic_range - drm DP Dynamic Range
> + *
> + * This enum is used to indicate DP VSC SDP Dynamic Range.
> + * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16
> +through
> + * DB18]
> + *
> + * @DP_DYNAMIC_RANGE_VESA: VESA range
> + * @DP_DYNAMIC_RANGE_CTA: CTA range
> + */
> +enum dp_dynamic_range {
> +	DP_DYNAMIC_RANGE_VESA = 0,
> +	DP_DYNAMIC_RANGE_CTA = 1,
> +};
> +
> +/**
> + * enum dp_content_type - drm DP Content Type
> + *
> + * This enum is used to indicate DP VSC SDP Content Types.
> + * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16
> +through
> + * DB18]
> + * CTA-861-G defines content types and expected processing by a sink
> +device
> + *
> + * @DP_CONTENT_TYPE_NOT_DEFINED: Not defined type
> + * @DP_CONTENT_TYPE_GRAPHICS: Graphics type
> + * @DP_CONTENT_TYPE_PHOTO: Photo type
> + * @DP_CONTENT_TYPE_VIDEO: Video type
> + * @DP_CONTENT_TYPE_GAME: Game type
> + */
> +enum dp_content_type {
> +	DP_CONTENT_TYPE_NOT_DEFINED = 0x00,
> +	DP_CONTENT_TYPE_GRAPHICS = 0x01,
> +	DP_CONTENT_TYPE_PHOTO = 0x02,
> +	DP_CONTENT_TYPE_VIDEO = 0x03,
> +	DP_CONTENT_TYPE_GAME = 0x04,
> +};
> +
> +/**
> + * struct drm_dp_vsc_sdp - drm DP VSC SDP
> + *
> + * This structure represents a DP VSC SDP of drm
> + * It is based on DP 1.4 spec [Table 2-116: VSC SDP Header Bytes] and
> + * [Table 2-117: VSC SDP Payload for DB16 through DB18]
> + *
> + * @sdp_type: secondary-data packet type
> + * @revision: revision number
> + * @length: number of valid data bytes
> + * @pixelformat: pixel encoding format
> + * @colorimetry: colorimetry format
> + * @bpc: bit per color
> + * @dynamic_range: dynamic range information
> + * @content_type: CTA-861-G defines content types and expected
> +processing by a sink device  */ struct drm_dp_vsc_sdp {
> +	unsigned char sdp_type;
> +	unsigned char revision;
> +	unsigned char length;
> +	enum dp_pixelformat pixelformat;
> +	enum dp_colorimetry colorimetry;
> +	int bpc;
> +	enum dp_dynamic_range dynamic_range;
> +	enum dp_content_type content_type;
> +};
> +
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> 
>  static inline int
> --
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
