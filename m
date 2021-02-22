Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56105321067
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 06:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DBD6E4B1;
	Mon, 22 Feb 2021 05:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B714F6E217;
 Mon, 22 Feb 2021 05:25:18 +0000 (UTC)
IronPort-SDR: 1gRJWvq6GdBwMFGZ3lRgZLLd0Vma0VlS93Wx+nA2UgtFi9KbQds61WIi3gKXaexQLwlphE7OOA
 bHn9rcuSYTMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="164172919"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="164172919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2021 21:25:17 -0800
IronPort-SDR: bVqfifGhYkeQ18joug9BWJjX7t6xJF5QvBNlCKbFUq5XEcAZsfkNqaia9a8+x90edmppVwbwLw
 NeBCgNDhQvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="402408673"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga008.jf.intel.com with ESMTP; 21 Feb 2021 21:25:17 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 05:25:15 +0000
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2106.002;
 Mon, 22 Feb 2021 10:55:14 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 1/9] drm/dp: add MSO related DPCD registers
Thread-Topic: [Intel-gfx] [PATCH v3 1/9] drm/dp: add MSO related DPCD registers
Thread-Index: AQHXAIWQbDOalFaDC0C8hFyf9u6x7apjs7lA
Date: Mon, 22 Feb 2021 05:25:13 +0000
Message-ID: <654da974ec114977895af83eafed811f@intel.com>
References: <cover.1613054234.git.jani.nikula@intel.com>
 <ab57627f373ec4a80494bb51ea51080810d9bfb0.1613054234.git.jani.nikula@intel.com>
In-Reply-To: <ab57627f373ec4a80494bb51ea51080810d9bfb0.1613054234.git.jani.nikula@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Varide,
 Nischal" <nischal.varide@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani Nikula
> Sent: Thursday, February 11, 2021 8:22 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Varide, Nischal
> <nischal.varide@intel.com>; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v3 1/9] drm/dp: add MSO related DPCD registers
> 
> Add DPCD register definitions for eDP 1.4 Multi-SST Operation.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Nischal Varide <nischal.varide@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_dp_helper.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> edffd1dcca3e..632ad7faa006 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1016,6 +1016,11 @@ struct drm_device;
>  #define DP_EDP_REGIONAL_BACKLIGHT_BASE      0x740    /* eDP 1.4 */
>  #define DP_EDP_REGIONAL_BACKLIGHT_0	    0x741    /* eDP 1.4 */
> 
> +#define DP_EDP_MSO_LINK_CAPABILITIES        0x7a4    /* eDP 1.4 */
> +# define DP_EDP_MSO_NUMBER_OF_LINKS_MASK    (7 << 0)
> +# define DP_EDP_MSO_NUMBER_OF_LINKS_SHIFT   0
> +# define DP_EDP_MSO_INDEPENDENT_LINK_BIT    (1 << 3)
> +
>  /* Sideband MSG Buffers */
>  #define DP_SIDEBAND_MSG_DOWN_REQ_BASE	    0x1000   /* 1.2 MST */
>  #define DP_SIDEBAND_MSG_UP_REP_BASE	    0x1200   /* 1.2 MST */
> --
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
