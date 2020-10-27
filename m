Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A629A54C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 08:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0AE6EB1B;
	Tue, 27 Oct 2020 07:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9E26E34B;
 Tue, 27 Oct 2020 07:11:49 +0000 (UTC)
IronPort-SDR: EKOsXpgzCl9/UCPz7Kk2YnjZh33DBkfb7vQtTzrO3yzPoCF1vxix3zH7UMZ+ShUw03g3VJpb/Z
 +qC2acAvwZKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="232224407"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="232224407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 00:11:46 -0700
IronPort-SDR: OKzSraS3vyd9TW5vXRQVMDGuLA+3COnBMJdaoM1B49cUnVR/G5BiFCYP8Jkp+qSgB52EC3Ifym
 /mAeO0gvdI4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="334305215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Oct 2020 00:11:45 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 00:11:43 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:41:41 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:41:41 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Thread-Topic: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Thread-Index: AQHWqTkItgbYgdwjiEOXz7Jf5LPbkKmrClsQ
Date: Tue, 27 Oct 2020 07:11:41 +0000
Message-ID: <3b7df974286b4497ba31ad4a554062e0@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-15-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-15-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
> 
> Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS
> and HDCP2_AUTH_STREAM register in i915_reg header.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 86a9a5145e47..cb6ec2c241f2 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9882,6 +9882,7 @@ enum skl_power_gate {
>  					  _PORTD_HDCP2_BASE, \
>  					  _PORTE_HDCP2_BASE, \
>  					  _PORTF_HDCP2_BASE) + (x))
> +
>  #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
>  #define _TRANSA_HDCP2_AUTH		0x66498
>  #define _TRANSB_HDCP2_AUTH		0x66598
> @@ -9921,6 +9922,35 @@ enum skl_power_gate {
>  					 TRANS_HDCP2_STATUS(trans) : \
>  					 PORT_HDCP2_STATUS(port))
> 
> +#define PORT_HDCP2_STREAM_STATUS(port)		_PORT_HDCP2_BASE(port,
> 0xC0)
> +#define _TRANSA_HDCP2_STREAM_STATUS		0x664C0
> +#define _TRANSB_HDCP2_STREAM_STATUS		0x665C0
> +#define TRANS_HDCP2_STREAM_STATUS(trans)	_MMIO_TRANS(trans, \
> +
> _TRANSA_HDCP2_STREAM_STATUS, \
> +
> _TRANSB_HDCP2_STREAM_STATUS)
> +#define   STREAM_ENCRYPTION_STATUS	BIT(31)
> +#define   STREAM_TYPE_STATUS		BIT(30)
> +#define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
> +					(INTEL_GEN(dev_priv) >= 12 ? \
> +					 TRANS_HDCP2_STREAM_STATUS(trans) :
> \
> +					 PORT_HDCP2_STREAM_STATUS(port))
> +
> +#define _PORTA_HDCP2_AUTH_STREAM		0x66F00
> +#define _PORTB_HDCP2_AUTH_STREAM		0x66F04
> +#define PORT_HDCP2_AUTH_STREAM(port)	_MMIO_PORT(port, \
> +
> _PORTA_HDCP2_AUTH_STREAM, \
> +
> _PORTB_HDCP2_AUTH_STREAM)

Should it also not be defined as the other counterparts for pre Gen12.

> +#define _TRANSA_HDCP2_AUTH_STREAM		0x66F00
> +#define _TRANSB_HDCP2_AUTH_STREAM		0x66F04
> +#define TRANS_HDCP2_AUTH_STREAM(trans)	_MMIO_TRANS(trans, \
> +
> _TRANSA_HDCP2_AUTH_STREAM, \
> +
> _TRANSB_HDCP2_AUTH_STREAM)
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
