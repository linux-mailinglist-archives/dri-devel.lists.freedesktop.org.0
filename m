Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69A291FFD
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBD96E8A7;
	Sun, 18 Oct 2020 20:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE066E8A5;
 Sun, 18 Oct 2020 20:47:35 +0000 (UTC)
IronPort-SDR: lvrwhV84VwYCPvjwhGMrOSR7PS1JLULRYmsgfbHYx1EeRzXX3AnAh9gpumDxHQKe6RlKqw/4GA
 Iv7CostlicvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="164313800"
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="164313800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 13:47:31 -0700
IronPort-SDR: VJaghAPikIBTW/8hQ0AfdPXJvP/xmZkVPwPcpOwazyFTFXkb5vrYAAlnvpKh8CDmfqKaWBo/JJ
 YVEHwZhSXPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="465296187"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 18 Oct 2020 13:47:31 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Oct 2020 13:47:29 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Oct 2020 02:17:27 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 19 Oct 2020 02:17:27 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [RFC 01/13] drm/edid: Add additional HFVSDB fields for HDMI2.1
Thread-Topic: [RFC 01/13] drm/edid: Add additional HFVSDB fields for HDMI2.1
Thread-Index: AQHWouJZAJK76sJHwUKa0Yk1CIyeV6md1IPw
Date: Sun, 18 Oct 2020 20:47:27 +0000
Message-ID: <7137c1244ee3409da343a6c4a1de38ee@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-2-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201015105259.27934-2-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Thursday, October 15, 2020 4:23 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [RFC 01/13] drm/edid: Add additional HFVSDB fields for HDMI2.1
> 
> From: Swati Sharma <swati2.sharma@intel.com>
> 
> The HDMI2.1 extends HFVSBD (HDMI Forum Vendor Specific Data block) to have

Typo in HFVSDB

> fields related to newly defined methods of FRL (Fixed Rate Link) levels, number
> of lanes supported, DSC Color bit depth, VRR min/max, FVA (Fast Vactive), ALLM
> etc.
> 
> This patch adds the new HFVSDB fields that are required for HDMI2.1.
> 
> Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  include/drm/drm_edid.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h index
> b27a0e2169c8..1cc5c2c73282 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -229,6 +229,36 @@ struct detailed_timing {
>  				    DRM_EDID_YCBCR420_DC_36 | \
>  				    DRM_EDID_YCBCR420_DC_30)
> 
> +/* HDMI 2.1 additional fields */
> +#define DRM_EDID_MAX_FRL_RATE_MASK		0xf0
> +#define DRM_EDID_FAPA_START_LOCATION		(1 << 0)
> +#define DRM_EDID_ALLM				(1 << 1)
> +#define DRM_EDID_FVA				(1 << 2)
> +
> +/* Deep Color specific */
> +#define DRM_EDID_DC_30BIT_420			(1 << 0)
> +#define DRM_EDID_DC_36BIT_420			(1 << 1)
> +#define DRM_EDID_DC_48BIT_420			(1 << 2)
> +
> +/* VRR specific */
> +#define DRM_EDID_CNMVRR				(1 << 3)
> +#define DRM_EDID_CINEMA_VRR			(1 << 4)
> +#define DRM_EDID_MDELTA				(1 << 5)
> +#define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
> +#define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
> +#define DRM_EDID_VRR_MIN_MASK			0x3f
> +
> +/* DSC specific */
> +#define DRM_EDID_DSC_10BPC			(1 << 0)
> +#define DRM_EDID_DSC_12BPC			(1 << 1)
> +#define DRM_EDID_DSC_16BPC			(1 << 2)
> +#define DRM_EDID_DSC_ALL_BPP			(1 << 3)
> +#define DRM_EDID_DSC_NATIVE_420			(1 << 6)
> +#define DRM_EDID_DSC_1P2			(1 << 7)
> +#define DRM_EDID_DSC_MAX_FRL_RATE		0xf

This should be set as mask and made it as 0xf0

> +#define DRM_EDID_DSC_MAX_SLICES			0xf
> +#define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
> +
>  /* ELD Header Block */
>  #define DRM_ELD_HEADER_BLOCK_SIZE	4
> 
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
