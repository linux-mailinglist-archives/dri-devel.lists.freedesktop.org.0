Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC7829A4FC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BDE6E14C;
	Tue, 27 Oct 2020 06:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF70B6EB18;
 Tue, 27 Oct 2020 06:57:13 +0000 (UTC)
IronPort-SDR: gBjF08LEVHT7FvFrVWnxBZW2jnH28q3hXl5hu/jcCLcBENitVLD3UqUiHQyTDNuCEFerogwJYZ
 hj/FtJvGwHeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="167254724"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="167254724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 23:57:12 -0700
IronPort-SDR: Ms5+fGYEMoKravmUiYcOHwCKdaJa0U9j1Rb/g/Ecr3/ldA5mGSHuZIzYJ/5FNZYrKMpeomzL4m
 Ohie7wZTQthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="334300661"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 26 Oct 2020 23:57:12 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 23:57:10 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:27:08 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:27:08 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 13/16] drm/i915/hdcp: Pass connector to check_2_2_link
Thread-Topic: [PATCH v3 13/16] drm/i915/hdcp: Pass connector to check_2_2_link
Thread-Index: AQHWqTkHG93vlhiZEUOLavT0G8hlcamrChkA
Date: Tue, 27 Oct 2020 06:57:08 +0000
Message-ID: <5c10406fdbfb4d779688d9d7999f64dd@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-14-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-14-anshuman.gupta@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li, 
 Juston" <juston.li@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> Sent: Friday, October 23, 2020 5:51 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH v3 13/16] drm/i915/hdcp: Pass connector to check_2_2_link
> 
> This requires for HDCP 2.2 MST check link.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 3 ++-
>  4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 24e0067c2e7c..dfb5be64e03a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -375,7 +375,8 @@ struct intel_hdcp_shim {
>  				  bool is_repeater, u8 type);
> 
>  	/* HDCP2.2 Link Integrity Check */
> -	int (*check_2_2_link)(struct intel_digital_port *dig_port);
> +	int (*check_2_2_link)(struct intel_digital_port *dig_port,
> +			      struct intel_connector *connector);
>  };
> 
>  struct intel_hdcp {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 384e384cb9e2..a0c62e363c39 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -585,7 +585,8 @@ int intel_dp_hdcp2_config_stream_type(struct
> intel_digital_port *dig_port,  }
> 
>  static
> -int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
> +int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port,
> +			      struct intel_connector *connector)
>  {
>  	u8 rx_status;
>  	int ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 41c6892d959a..9dd08e2636e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1945,7 +1945,7 @@ static int intel_hdcp2_check_link(struct
> intel_connector *connector)
>  		goto out;
>  	}
> 
> -	ret = hdcp->shim->check_2_2_link(dig_port);
> +	ret = hdcp->shim->check_2_2_link(dig_port, connector);
>  	if (ret == HDCP_LINK_PROTECTED) {
>  		if (hdcp->value !=
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>  			intel_hdcp_update_value(connector,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 0788de04711b..bd0d91101464 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1734,7 +1734,8 @@ int intel_hdmi_hdcp2_read_msg(struct
> intel_digital_port *dig_port,  }
> 
>  static
> -int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port)
> +int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
> +				struct intel_connector *connector)
>  {
>  	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
>  	int ret;
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
