Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B229A45A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 06:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E396EAD5;
	Tue, 27 Oct 2020 05:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F506EAD5;
 Tue, 27 Oct 2020 05:52:17 +0000 (UTC)
IronPort-SDR: HXrhYReA1asKBEMcZLjOhr7lqqFZPcbyEEJZUFlIlTWoNRzAQ95Jeh1x80JqlRa9N7VOwcmxf1
 iYyWr8u0j3KA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147885603"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="147885603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:52:17 -0700
IronPort-SDR: sjVwdDBXl4Q3bKxbq4ObM47ox0Q0xKCviljTwrK1HvdeDyhClPaaKAnNZu3MZqkpqrUiiwuI78
 UC8/RKtMIqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="318108611"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 26 Oct 2020 22:52:17 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 22:52:16 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 11:22:13 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 11:22:13 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 05/16] drm/i915/hdcp: Move HDCP enc status timeout to
 header
Thread-Topic: [PATCH v3 05/16] drm/i915/hdcp: Move HDCP enc status timeout to
 header
Thread-Index: AQHWqTj5oTwEMB1V3kmkQg3zB7bqOqmq98aw
Date: Tue, 27 Oct 2020 05:52:13 +0000
Message-ID: <80aaa54c474449cf9e4b204e34488493@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-6-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-6-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 05/16] drm/i915/hdcp: Move HDCP enc status timeout to
> header
> 
> DP MST stream encryption status requires time of a link frame in order to change
> its status, but as there were some HDCP encryption timeout observed earlier, it
> is safer to use ENCRYPT_STATUS_CHANGE_TIMEOUT_MS timeout for stream
> status too, it requires to move the macro to a header.
> It will be used by both HDCP{1.x,2.x} stream status timeout.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Related: 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt status change")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 9 ++++-----
> drivers/gpu/drm/i915/display/intel_hdcp.h | 2 ++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index a9b652c6e742..61252d4be3dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -23,7 +23,6 @@
>  #include "intel_connector.h"
> 
>  #define KEY_LOAD_TRIES	5
> -#define ENCRYPT_STATUS_CHANGE_TIMEOUT_MS	50
>  #define HDCP2_LC_RETRY_CNT			3
> 
>  static
> @@ -762,7 +761,7 @@ static int intel_hdcp_auth(struct intel_connector
> *connector)
>  	if (intel_de_wait_for_set(dev_priv,
>  				  HDCP_STATUS(dev_priv, cpu_transcoder, port),
>  				  HDCP_STATUS_ENC,
> -				  ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
> +
> HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
>  		drm_err(&dev_priv->drm, "Timed out waiting for encryption\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -809,7 +808,7 @@ static int _intel_hdcp_disable(struct intel_connector
> *connector)
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
>  	if (intel_de_wait_for_clear(dev_priv,
>  				    HDCP_STATUS(dev_priv, cpu_transcoder, port),
> -				    ~0, ENCRYPT_STATUS_CHANGE_TIMEOUT_MS))
> {
> +				    ~0,
> HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
>  		drm_err(&dev_priv->drm,
>  			"Failed to disable HDCP, timeout clearing status\n");
>  		return -ETIMEDOUT;
> @@ -1641,7 +1640,7 @@ static int hdcp2_enable_encryption(struct
> intel_connector *connector)
>  				    HDCP2_STATUS(dev_priv, cpu_transcoder,
>  						 port),
>  				    LINK_ENCRYPTION_STATUS,
> -				    ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> +
> HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> 
>  	return ret;
>  }
> @@ -1665,7 +1664,7 @@ static int hdcp2_disable_encryption(struct
> intel_connector *connector)
>  				      HDCP2_STATUS(dev_priv, cpu_transcoder,
>  						   port),
>  				      LINK_ENCRYPTION_STATUS,
> -				      ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> +
> HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
>  	if (ret == -ETIMEDOUT)
>  		drm_dbg_kms(&dev_priv->drm, "Disable Encryption Timedout");
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index bc51c1e9b481..b912a3a0f5b8 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -8,6 +8,8 @@
> 
>  #include <linux/types.h>
> 
> +#define HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS	50
> +
>  struct drm_connector;
>  struct drm_connector_state;
>  struct drm_i915_private;
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
