Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096252A8019
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8786ED42;
	Thu,  5 Nov 2020 13:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2B6ED42;
 Thu,  5 Nov 2020 13:56:37 +0000 (UTC)
IronPort-SDR: 6aEwokG0NabbQUEA4mdwf3/L/AUjZMaS1ccr2Hayq3kMMuknueqligHGg5d+hBpQ5+B1vT+iTW
 wxcMiirAGf9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157161920"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="157161920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:56:36 -0800
IronPort-SDR: YwqI5LlUjTm6U06t4vwjrFkP7/mzOe9yR6dhr9JElRnMVhSxZqRXgvsLsrHWAH5ozw36L4czV+
 Z+kxKaxiK14w==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="539409002"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:56:33 -0800
Date: Thu, 5 Nov 2020 19:27:17 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 05/16] drm/i915/hdcp: Move HDCP enc status timeout to
 header
Message-ID: <20201105135717.GF3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-6-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-6-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 22:11:57 +0530, Anshuman Gupta wrote:
> DP MST stream encryption status requires time of a link frame
> in order to change its status, but as there were some HDCP
> encryption timeout observed earlier, it is safer to use
> ENCRYPT_STATUS_CHANGE_TIMEOUT_MS timeout for stream status too,
> it requires to move the macro to a header.
> It will be used by both HDCP{1.x,2.x} stream status timeout.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Related: 'commit 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt
> status change")'
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 9 ++++-----
>  drivers/gpu/drm/i915/display/intel_hdcp.h | 2 ++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index fc5de48456ad..0322a83c151d 100644
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
> @@ -762,7 +761,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
>  	if (intel_de_wait_for_set(dev_priv,
>  				  HDCP_STATUS(dev_priv, cpu_transcoder, port),
>  				  HDCP_STATUS_ENC,
> -				  ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
> +				  HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
>  		drm_err(&dev_priv->drm, "Timed out waiting for encryption\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -809,7 +808,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
>  	if (intel_de_wait_for_clear(dev_priv,
>  				    HDCP_STATUS(dev_priv, cpu_transcoder, port),
> -				    ~0, ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
> +				    ~0, HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
>  		drm_err(&dev_priv->drm,
>  			"Failed to disable HDCP, timeout clearing status\n");
>  		return -ETIMEDOUT;
> @@ -1641,7 +1640,7 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
>  				    HDCP2_STATUS(dev_priv, cpu_transcoder,
>  						 port),
>  				    LINK_ENCRYPTION_STATUS,
> -				    ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> +				    HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
>  
>  	return ret;
>  }
> @@ -1665,7 +1664,7 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
>  				      HDCP2_STATUS(dev_priv, cpu_transcoder,
>  						   port),
>  				      LINK_ENCRYPTION_STATUS,
> -				      ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> +				      HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
>  	if (ret == -ETIMEDOUT)
>  		drm_dbg_kms(&dev_priv->drm, "Disable Encryption Timedout");
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
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
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
