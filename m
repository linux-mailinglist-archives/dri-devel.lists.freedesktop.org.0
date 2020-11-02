Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681982A2581
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 08:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509B46E39B;
	Mon,  2 Nov 2020 07:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3076E372;
 Mon,  2 Nov 2020 07:45:08 +0000 (UTC)
IronPort-SDR: /sjdp67yU3YlryuNc1tOeFyA96R68JSpZaDBYPRvlSxGU2dm1JO6yu0JZPF3cQOds2/ershUYi
 2RGZKxMhntiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="186677923"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="186677923"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 23:45:07 -0800
IronPort-SDR: Oc7Q1HmUABtMr9yhbk6hxAlNQOxHrlv9wZlz9WHt0Q7JNJMFHytGecb5KY5uf1z6pQAs/M54Nr
 56FRhG+u6WSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="351928181"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 01 Nov 2020 23:45:07 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 1 Nov 2020 23:45:06 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 13:15:04 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 2 Nov 2020 13:15:03 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 01/16] drm/i915/hdcp: Update CP property in update_pipe
Thread-Topic: [PATCH v4 01/16] drm/i915/hdcp: Update CP property in update_pipe
Thread-Index: AQHWrIIOZ3bWs4Tv/kKcY+GJjlJ/JKm0fu3Q
Date: Mon, 2 Nov 2020 07:45:03 +0000
Message-ID: <e662833055df4b8cacf999b2f6ec603b@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-2-anshuman.gupta@intel.com>
In-Reply-To: <20201027164208.10026-2-anshuman.gupta@intel.com>
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
> Sent: Tuesday, October 27, 2020 10:12 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH v4 01/16] drm/i915/hdcp: Update CP property in update_pipe
> 
> When crtc state need_modeset is true it is not necessary it is going to be a real
> modeset, it can turns to be a fastset instead of modeset.
> This turns content protection property to be DESIRED and hdcp update_pipe left
> with property to be in DESIRED state but actual hdcp->value was ENABLED.
> 
> This issue is caught with DP MST setup, where we have multiple connector in
> same DP_MST topology. When disabling HDCP on one of DP MST connector leads
> to set the crtc state need_modeset to true for all other crtc driving the other DP-
> MST topology connectors.
> This turns up other DP MST connectors CP property to be DESIRED despite the
> actual hdcp->value is ENABLED.
> Above scenario fails the DP MST HDCP IGT test, disabling HDCP on one MST
> stream should not cause to disable HDCP on another MST stream on same DP
> MST topology.
> 
> v2:
> Fix WARN_ON(connector->base.registration_state ==
> DRM_CONNECTOR_REGISTERED)
> v3:
> Commit log improvement. [Uma]
> Added a comment before scheduling prop_work. [Uma]

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
 
> Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal
> state")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b2a4bbcfdcd2..eee8263405b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2221,6 +2221,14 @@ void intel_hdcp_update_pipe(struct
> intel_atomic_state *state,
>  		desired_and_not_enabled =
>  			hdcp->value !=
> DRM_MODE_CONTENT_PROTECTION_ENABLED;
>  		mutex_unlock(&hdcp->mutex);
> +		/*
> +		 * If HDCP already ENABLED and CP property is DESIRED, schedule
> +		 * prop_work to update correct CP property to user space.
> +		 */
> +		if (!desired_and_not_enabled &&
> !content_protection_type_changed) {
> +			drm_connector_get(&connector->base);
> +			schedule_work(&hdcp->prop_work);
> +		}
>  	}
> 
>  	if (desired_and_not_enabled || content_protection_type_changed)
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
