Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742C2B8B74
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 07:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727389FE8;
	Thu, 19 Nov 2020 06:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769608996E;
 Thu, 19 Nov 2020 06:15:14 +0000 (UTC)
IronPort-SDR: JwwVFc6tQmdOAOs38VGYBUCbgr9Qd9q+QqYUBfsJBtLbJvZikZApOqshtdBkIrAALC7AKkuzz4
 1CWkc53VH43g==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="255948757"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="255948757"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 22:13:07 -0800
IronPort-SDR: 061jBu5h5/fDq1micz04Lnea3pjoO2bPgoIzaF1SZXQODE8/+IFtC/9TYz70015LUZovdiq1Fi
 ctmHPseS9qYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="363263515"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2020 22:13:07 -0800
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Nov 2020 22:13:06 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 11:43:03 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 11:43:03 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
Thread-Topic: [PATCH v2 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
Thread-Index: AQHWsDexD5osgKcw70mZLtrVvikt0KnPFWSA
Date: Thu, 19 Nov 2020 06:13:03 +0000
Message-ID: <b34f1799141d42fe8df62729450bc87f@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-3-ankit.k.nautiyal@intel.com>
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
> Sent: Sunday, November 1, 2020 3:37 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH v2 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
> 
> From: Swati Sharma <swati2.sharma@intel.com>
> 
> This patch parses MAX_FRL field to get the MAX rate in Gbps that the HDMI 2.1
> panel can support in FRL mode. Source need this field to determine the optimal
> rate between the source and sink during FRL training.
> 
> v2: Fixed minor bugs, and removed extra wrapper function (Uma Shankar)

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 44 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  6 +++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
> 631125b46e04..26797868ea5b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4849,6 +4849,41 @@ static void drm_parse_vcdb(struct drm_connector
> *connector, const u8 *db)
>  		info->rgb_quant_range_selectable = true;  }
> 
> +static
> +void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8
> +*max_rate_per_lane) {
> +	switch (max_frl_rate) {
> +	case 1:
> +		*max_lanes = 3;
> +		*max_rate_per_lane = 3;
> +		break;
> +	case 2:
> +		*max_lanes = 3;
> +		*max_rate_per_lane = 6;
> +		break;
> +	case 3:
> +		*max_lanes = 4;
> +		*max_rate_per_lane = 6;
> +		break;
> +	case 4:
> +		*max_lanes = 4;
> +		*max_rate_per_lane = 8;
> +		break;
> +	case 5:
> +		*max_lanes = 4;
> +		*max_rate_per_lane = 10;
> +		break;
> +	case 6:
> +		*max_lanes = 4;
> +		*max_rate_per_lane = 12;
> +		break;
> +	case 0:
> +	default:
> +		*max_lanes = 0;
> +		*max_rate_per_lane = 0;
> +	}
> +}
> +
>  static void drm_parse_ycbcr420_deep_color_info(struct drm_connector
> *connector,
>  					       const u8 *db)
>  {
> @@ -4902,6 +4937,15 @@ static void drm_parse_hdmi_forum_vsdb(struct
> drm_connector *connector,
>  		}
>  	}
> 
> +	if (hf_vsdb[7]) {
> +		u8 max_frl_rate;
> +
> +		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
> +		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK)
> >> 4;
> +		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
> +				&hdmi->max_frl_rate_per_lane);
> +	}
> +
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);  }
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h index
> 928136556174..f351bf10c076 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -207,6 +207,12 @@ struct drm_hdmi_info {
> 
>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
> +
> +	/** @max_frl_rate_per_lane: support fixed rate link */
> +	u8 max_frl_rate_per_lane;
> +
> +	/** @max_lanes: supported by sink */
> +	u8 max_lanes;
>  };
> 
>  /**
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
