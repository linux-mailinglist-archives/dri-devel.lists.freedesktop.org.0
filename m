Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B225C2A8319
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAC86EDB5;
	Thu,  5 Nov 2020 16:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A076EDB5;
 Thu,  5 Nov 2020 16:09:07 +0000 (UTC)
IronPort-SDR: pSYT/2OX22jXwx+ZHkiGJZ9SWm/7RhRZiyVkOqqYFmyqrV/3WK5KxQdOGxXvy7UiKoW+eAOswA
 mEo0/rG1fLNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="166817103"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="166817103"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:09:07 -0800
IronPort-SDR: 580Ot6emEN0qOejmFNes11EHVqtR4IVv6DjThri/5MiE32SzujW24IqhU5hyTOFApxk9i6JJWJ
 Ms4S9tMuWwCA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="364392699"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:09:04 -0800
Date: Thu, 5 Nov 2020 21:39:48 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 11/16] drm/hdcp: Max MST content streams
Message-ID: <20201105160947.GJ3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-12-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-12-anshuman.gupta@intel.com>
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

On 2020-10-27 at 22:12:03 +0530, Anshuman Gupta wrote:
> Let's define Maximum MST content streams up to four
> generically which can be supported by modern display
> controllers.
> 
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  include/drm/drm_hdcp.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index fe58dbb46962..ac22c246542a 100644
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
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>  #define HDCP_2_2_RXCAPS_LEN			3
>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
