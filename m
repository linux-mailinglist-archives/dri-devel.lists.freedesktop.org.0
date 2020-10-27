Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6E29A4D0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD226EB0F;
	Tue, 27 Oct 2020 06:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84026EB0F;
 Tue, 27 Oct 2020 06:41:06 +0000 (UTC)
IronPort-SDR: shMCfhBzadv2VBsDtHzlfUcnE4J9Fds+Wt2oMfCE1KzOo/ok3Y5nFWbcTf1AcaeEM5Xkv81we3
 lhJlnU+IXvDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="252733904"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="252733904"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 23:41:05 -0700
IronPort-SDR: dJ2sxjtXW03FXJW4ZvQ5YcJA8rZ6QFiWYHGaiwKFlXTImX29t7oy2+I2EjnZyJnhfUemKCM3PO
 0YsWRuNagNuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="360644583"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2020 23:41:05 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 23:41:04 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:11:02 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:11:02 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/16] drm/hdcp: Max MST content streams
Thread-Topic: [PATCH v3 11/16] drm/hdcp: Max MST content streams
Thread-Index: AQHWqTkEY+aVRDeWaEesgWeBU5KesKmrBKZA
Date: Tue, 27 Oct 2020 06:41:02 +0000
Message-ID: <479559edb3414fa4a88d5c391ba06339@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-12-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-12-anshuman.gupta@intel.com>
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
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Li, Juston" <juston.li@intel.com>
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
> <anshuman.gupta@intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>
> Subject: [PATCH v3 11/16] drm/hdcp: Max MST content streams
> 
> Let's define Maximum MST content streams up to four generically which can be
> supported by modern display controllers.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  include/drm/drm_hdcp.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h index
> fe58dbb46962..ac22c246542a 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -101,11 +101,11 @@
> 
>  /* Following Macros take a byte at a time for bit(s) masking */
>  /*
> - * TODO: This has to be changed for DP MST, as multiple stream on
> - * same port is possible.
> - * For HDCP2.2 on HDMI and DP SST this value is always 1.
> + * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
> + * H/W MST streams capacity.
> + * This required to be moved out to platform specific header.
>   */
> -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
> +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>  #define HDCP_2_2_RXCAPS_LEN			3
>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
