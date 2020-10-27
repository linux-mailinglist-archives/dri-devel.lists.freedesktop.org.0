Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94729A424
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 06:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1596E195;
	Tue, 27 Oct 2020 05:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694426E195;
 Tue, 27 Oct 2020 05:32:30 +0000 (UTC)
IronPort-SDR: qkOVLIJC82Nnis9SnffudYN99yDdg1Hs4/gpw+W9oeKtaLWf2bu5Mhkokp+PlDCFfqRo/NngRC
 Edo3I/G9EVMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147313248"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="147313248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:32:29 -0700
IronPort-SDR: K4uIjcVay/5fA9H3q0sBP3Qoq4xFjboCTAaml9/VrVlYjDYZ+RgQjYWknj28q07369hOP7ZaRm
 rjbBWr372yQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="303771258"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 26 Oct 2020 22:32:29 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 22:32:28 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 11:02:26 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 11:02:26 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
Thread-Topic: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
Thread-Index: AQHWqTjzqYnZZLC5T0SJFLiEv9USrKmq7n7A
Date: Tue, 27 Oct 2020 05:32:26 +0000
Message-ID: <3aff190f909b4dc290ca1f1d8b47d963@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-2-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-2-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
> 
> When crtc state need_modeset is true it is not necessary it is going to be a real
> modeset, it can turns to be a update_pipe instead of modeset.

I believe you refer fastest here. May be make this a bit clear. 

> This turns content protection property to be DESIRED and hdcp update_pipe left
> with property to be in DESIRED state but actually hdcp->value was ENABLED.
> This caught with DP MST setup, when disabling HDCP on a connector sets the crtc
> state need_modeset to true for all crtc driving the other DP-MST topology
> connectors.

This is a bit ambiguous, you can mention it a bit more clearly. In case of DP MST, how this
affects would help make it clearer.

> 
> v2:
> Fix WARN_ON(connector->base.registration_state ==
> DRM_CONNECTOR_REGISTERED)
> 
> Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal
> state")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b2a4bbcfdcd2..0d9e8d3b5603 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2221,6 +2221,11 @@ void intel_hdcp_update_pipe(struct
> intel_atomic_state *state,
>  		desired_and_not_enabled =
>  			hdcp->value !=
> DRM_MODE_CONTENT_PROTECTION_ENABLED;
>  		mutex_unlock(&hdcp->mutex);
>

Please add a comment explaining the rationale here as well.

> +		if (!desired_and_not_enabled &&
> !content_protection_type_changed) {
> +			drm_connector_get(&connector->base);

Where are we releasing this ref.

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
