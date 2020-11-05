Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9F2A83DC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847B66EDD1;
	Thu,  5 Nov 2020 16:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895666EDCC;
 Thu,  5 Nov 2020 16:46:54 +0000 (UTC)
IronPort-SDR: iBUsovQtDvSQyooNfprn62s9heU+gyXVppPTMH50qe+JuHoZwE1TYu1eTkawyariArVd7M3T6G
 kXP0A5eW3Txg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="157196978"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="157196978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:46:54 -0800
IronPort-SDR: yLVrxO75Msb2B03iQ1DKOVDppsRQb51XpKnGlh8ITG+fU7KNGFlU4iaG/YWNUgN0P26k5aVdKa
 xkt/kd2GiM9A==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="326086841"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:46:51 -0800
Date: Thu, 5 Nov 2020 22:17:35 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Message-ID: <20201105164735.GN3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-15-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-15-anshuman.gupta@intel.com>
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

On 2020-10-27 at 22:12:06 +0530, Anshuman Gupta wrote:
> Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS
> and HDCP2_AUTH_STREAM register in i915_reg header.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 77461cde6549..c9678c77883d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9894,6 +9894,7 @@ enum skl_power_gate {
>  					  _PORTD_HDCP2_BASE, \
>  					  _PORTE_HDCP2_BASE, \
>  					  _PORTF_HDCP2_BASE) + (x))
> +
>  #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
>  #define _TRANSA_HDCP2_AUTH		0x66498
>  #define _TRANSB_HDCP2_AUTH		0x66598
> @@ -9933,6 +9934,35 @@ enum skl_power_gate {
>  					 TRANS_HDCP2_STATUS(trans) : \
>  					 PORT_HDCP2_STATUS(port))
>  
> +#define PORT_HDCP2_STREAM_STATUS(port)		_PORT_HDCP2_BASE(port, 0xC0)
> +#define _TRANSA_HDCP2_STREAM_STATUS		0x664C0
> +#define _TRANSB_HDCP2_STREAM_STATUS		0x665C0
> +#define TRANS_HDCP2_STREAM_STATUS(trans)	_MMIO_TRANS(trans, \
> +						    _TRANSA_HDCP2_STREAM_STATUS, \
> +						    _TRANSB_HDCP2_STREAM_STATUS)
> +#define   STREAM_ENCRYPTION_STATUS	BIT(31)
> +#define   STREAM_TYPE_STATUS		BIT(30)
> +#define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
> +					(INTEL_GEN(dev_priv) >= 12 ? \
> +					 TRANS_HDCP2_STREAM_STATUS(trans) : \
> +					 PORT_HDCP2_STREAM_STATUS(port))
> +
> +#define _PORTA_HDCP2_AUTH_STREAM		0x66F00
> +#define _PORTB_HDCP2_AUTH_STREAM		0x66F04
> +#define PORT_HDCP2_AUTH_STREAM(port)	_MMIO_PORT(port, \
> +						   _PORTA_HDCP2_AUTH_STREAM, \
> +						   _PORTB_HDCP2_AUTH_STREAM)
> +#define _TRANSA_HDCP2_AUTH_STREAM		0x66F00
> +#define _TRANSB_HDCP2_AUTH_STREAM		0x66F04
> +#define TRANS_HDCP2_AUTH_STREAM(trans)	_MMIO_TRANS(trans, \
> +						    _TRANSA_HDCP2_AUTH_STREAM, \
> +						    _TRANSB_HDCP2_AUTH_STREAM)
> +#define   AUTH_STREAM_TYPE		BIT(31)
> +#define HDCP2_AUTH_STREAM(dev_priv, trans, port) \
> +					(INTEL_GEN(dev_priv) >= 12 ? \
> +					 TRANS_HDCP2_AUTH_STREAM(trans) : \
> +					 PORT_HDCP2_AUTH_STREAM(port))
> +
>  /* Per-pipe DDI Function Control */
>  #define _TRANS_DDI_FUNC_CTL_A		0x60400
>  #define _TRANS_DDI_FUNC_CTL_B		0x61400
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
