Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC61C7262
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 16:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D262789C1C;
	Wed,  6 May 2020 14:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594D89C1C;
 Wed,  6 May 2020 14:02:24 +0000 (UTC)
IronPort-SDR: Ii4YDgKPwvYAutFciYydHIOCKZtYvwgwEzYk4mcBBM21tevovMdF/i7+72CkMJR4fefM5LryHi
 hTBE5+RmUltQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 07:02:21 -0700
IronPort-SDR: El6wGhhDJiHY+SNSR/D01hxc1kOwTL+wY64WY4oERWXKIEfiBpd+0TQLckku8kAW6I4zIoz01J
 zQ4HKBx3s8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; d="scan'208";a="260113709"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga003.jf.intel.com with ESMTP; 06 May 2020 07:02:16 -0700
Date: Wed, 6 May 2020 19:32:09 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 02/16] drm/i915: Clear the repeater bit on HDCP disable
Message-ID: <20200506140209.GB30925@intel.com>
References: <20200429195502.39919-1-sean@poorly.run>
 <20200429195502.39919-3-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429195502.39919-3-sean@poorly.run>
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 seanpaul@chromium.org, juston.li@intel.com, rodrigo.vivi@intel.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-29 at 15:54:48 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> On HDCP disable, clear the repeater bit. This ensures if we connect a
> non-repeater sink after a repeater, the bit is in the state we expect.
> 
> Fixes: ee5e5e7a5e0f (drm/i915: Add HDCP framework + base implementation)
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.17+
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Just reconfirming my R-b here.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-3-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-3-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-3-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-3-sean@poorly.run #v5
> 
> Changes in v2:
> -Added to the set
> Changes in v3:
> -None
>   I had previously agreed that clearing the rep_ctl bits on enable would
>   also be a good idea. However when I committed that idea to code, it
>   didn't look right. So let's rely on enables and disables being paired
>   and everything outside of that will be considered a bug
> Changes in v4:
> -s/I915_(READ|WRITE)/intel_de_(read|write)/
> Changes in v5:
> -None
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 525658fd201f..20175a53643d 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -795,6 +795,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	enum port port = intel_dig_port->base.port;
>  	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> +	u32 repeater_ctl;
>  	int ret;
>  
>  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
> @@ -810,6 +811,11 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  		return -ETIMEDOUT;
>  	}
>  
> +	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
> +						   port);
> +	intel_de_write(dev_priv, HDCP_REP_CTL,
> +		       intel_de_read(dev_priv, HDCP_REP_CTL) & ~repeater_ctl);
> +
>  	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
>  	if (ret) {
>  		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
