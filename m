Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2106812CC9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F125710E073;
	Thu, 14 Dec 2023 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40DF10E092;
 Thu, 14 Dec 2023 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702549237; x=1734085237;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b+GawpzOptf9ulKKVbcszJCs4QxYuTQEkASOPJrkW80=;
 b=FdXuFw8I9l6P4xXJ9VFxL8Ut8fC08NxcLDMRQpLgUgSuAgoP7s+D6WS1
 aIolY1PnEGUhTsGIFihRLEF0Q2HymMd4nkR/g1Os1WYWDpO/s3xpKa31m
 2K3t/i3/fOh+EG0BLdSC0T84EFZUApptNzb2q8qtIVId1Miz2aQhXZsSL
 YrcUXCkNT0mrN8VidmPEq34ZvqnpD1MPgwayiiVGokG6xbnfvMcZ+doM0
 agPcD2J6sBs2VMR6xKJcGkR4glFr/qmg21qEwAjpDFllFIlQoOPtEyl7B
 pwbYAGbflX7a2L9MbcWdecVJcNpzWhoow5ojuM4Ab8c2iIV5QzJKVJFDx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="380085931"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="380085931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 02:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17712773"
Received: from mdemezzi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 02:20:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/edid: replace __attribute__((packed)) with
 __packed
In-Reply-To: <20231212132557.3777281-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231212132557.3777281-1-jani.nikula@intel.com>
Date: Thu, 14 Dec 2023 12:20:25 +0200
Message-ID: <87ttolulue.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> __packed is preferred over __attribute__((packed)).
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed both to drm-misc-next with Simon's irc r-b.

Thanks,
Jani.


> ---
>  include/drm/drm_edid.h | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 518d1b8106c7..54cc6f04a708 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -46,7 +46,7 @@ struct est_timings {
>  	u8 t1;
>  	u8 t2;
>  	u8 mfg_rsvd;
> -} __attribute__((packed));
> +} __packed;
>  
>  /* 00=16:10, 01=4:3, 10=5:4, 11=16:9 */
>  #define EDID_TIMING_ASPECT_SHIFT 6
> @@ -59,7 +59,7 @@ struct est_timings {
>  struct std_timing {
>  	u8 hsize; /* need to multiply by 8 then add 248 */
>  	u8 vfreq_aspect;
> -} __attribute__((packed));
> +} __packed;
>  
>  #define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
>  #define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
> @@ -85,12 +85,12 @@ struct detailed_pixel_timing {
>  	u8 hborder;
>  	u8 vborder;
>  	u8 misc;
> -} __attribute__((packed));
> +} __packed;
>  
>  /* If it's not pixel timing, it'll be one of the below */
>  struct detailed_data_string {
>  	u8 str[13];
> -} __attribute__((packed));
> +} __packed;
>  
>  #define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0) /* 1.4 */
>  #define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1) /* 1.4 */
> @@ -120,7 +120,7 @@ struct detailed_data_monitor_range {
>  			__le16 m;
>  			u8 k;
>  			u8 j; /* need to divide by 2 */
> -		} __attribute__((packed)) gtf2;
> +		} __packed gtf2;
>  		struct {
>  			u8 version;
>  			u8 data1; /* high 6 bits: extra clock resolution */
> @@ -129,27 +129,27 @@ struct detailed_data_monitor_range {
>  			u8 flags; /* preferred aspect and blanking support */
>  			u8 supported_scalings;
>  			u8 preferred_refresh;
> -		} __attribute__((packed)) cvt;
> -	} __attribute__((packed)) formula;
> -} __attribute__((packed));
> +		} __packed cvt;
> +	} __packed formula;
> +} __packed;
>  
>  struct detailed_data_wpindex {
>  	u8 white_yx_lo; /* Lower 2 bits each */
>  	u8 white_x_hi;
>  	u8 white_y_hi;
>  	u8 gamma; /* need to divide by 100 then add 1 */
> -} __attribute__((packed));
> +} __packed;
>  
>  struct detailed_data_color_point {
>  	u8 windex1;
>  	u8 wpindex1[3];
>  	u8 windex2;
>  	u8 wpindex2[3];
> -} __attribute__((packed));
> +} __packed;
>  
>  struct cvt_timing {
>  	u8 code[3];
> -} __attribute__((packed));
> +} __packed;
>  
>  struct detailed_non_pixel {
>  	u8 pad1;
> @@ -163,8 +163,8 @@ struct detailed_non_pixel {
>  		struct detailed_data_wpindex color;
>  		struct std_timing timings[6];
>  		struct cvt_timing cvt[4];
> -	} __attribute__((packed)) data;
> -} __attribute__((packed));
> +	} __packed data;
> +} __packed;
>  
>  #define EDID_DETAIL_EST_TIMINGS 0xf7
>  #define EDID_DETAIL_CVT_3BYTE 0xf8
> @@ -181,8 +181,8 @@ struct detailed_timing {
>  	union {
>  		struct detailed_pixel_timing pixel_data;
>  		struct detailed_non_pixel other_data;
> -	} __attribute__((packed)) data;
> -} __attribute__((packed));
> +	} __packed data;
> +} __packed;
>  
>  #define DRM_EDID_INPUT_SERRATION_VSYNC (1 << 0)
>  #define DRM_EDID_INPUT_SYNC_ON_GREEN   (1 << 1)
> @@ -307,7 +307,7 @@ struct edid {
>  	u8 extensions;
>  	/* Checksum */
>  	u8 checksum;
> -} __attribute__((packed));
> +} __packed;
>  
>  #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))

-- 
Jani Nikula, Intel
