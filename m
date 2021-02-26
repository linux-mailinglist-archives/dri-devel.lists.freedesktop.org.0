Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B1325CCD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 06:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0713E6E8E7;
	Fri, 26 Feb 2021 05:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5506E8E7;
 Fri, 26 Feb 2021 05:01:10 +0000 (UTC)
IronPort-SDR: AE7u4uS+DCQYntAJKuCSO+R9mCk4GtYXKS8w9e1OvoSq3wTCSH2ms6OnJR/4qf4YrXZfLlJtPG
 LfJYf0A8CFEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="164993933"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="164993933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 21:01:10 -0800
IronPort-SDR: MwUHK9Y/FNDbll/XnPZ49GjXvdQWmatbO8ziam9+t6CxyKyRwggiv877l1ZAgxmteTO0Igfd2+
 A3yoEK9AEBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="516384038"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 25 Feb 2021 21:01:09 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 21:01:08 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Feb 2021 10:31:06 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2106.002;
 Fri, 26 Feb 2021 10:31:06 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Colin King <colin.king@canonical.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH][next] drm/i915/hdcp: Fix null pointer dereference of
 connector->encoder
Thread-Topic: [PATCH][next] drm/i915/hdcp: Fix null pointer dereference of
 connector->encoder
Thread-Index: AQHXChjJmIv7gDW21UG5hJXtQsGn1Kpp5AuQ
Date: Fri, 26 Feb 2021 05:01:06 +0000
Message-ID: <acbf924a09544030966f95c750b1bfa7@intel.com>
References: <20210223191909.16682-1-colin.king@canonical.com>
In-Reply-To: <20210223191909.16682-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Colin King <colin.king@canonical.com>
> Sent: Wednesday, February 24, 2021 12:49 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; C, Ramalingam
> <ramalingam.c@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drm/i915/hdcp: Fix null pointer dereference of
> connector->encoder
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The recent commit 6c63e6e14da7 ("drm/i915/hdcp: No HDCP when encoder is't
> initialized") added a null pointer check on connector->encoder hence implying
> that it could potentially be null.  This means that the initialization of dig_port via
> the call intel_attached_dig_port may cause a null pointer dereference on
> connector->encoder. Fix this by only assigning dig_port after a null check has
> been performed on connector->encoder.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 36e5e7042b20 ("drm/i915: Don't fully disable HDCP on a port if multiple
> pipes are using it")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index ae1371c36a32..7525ea31766c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2260,7 +2260,7 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  		      const struct intel_crtc_state *pipe_config, u8 content_type)
> {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> -	struct intel_digital_port *dig_port =
> intel_attached_dig_port(connector);
> +	struct intel_digital_port *dig_port;
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
>  	int ret = -EINVAL;
> @@ -2274,6 +2274,7 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  		return -ENODEV;
>  	}
> 
> +	dig_port = intel_attached_dig_port(connector);
>  	mutex_lock(&hdcp->mutex);
>  	mutex_lock(&dig_port->hdcp_mutex);
>  	drm_WARN_ON(&dev_priv->drm,
> --
> 2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
