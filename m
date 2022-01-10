Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4C489CFD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1F10E617;
	Mon, 10 Jan 2022 16:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381510E617;
 Mon, 10 Jan 2022 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641830488; x=1673366488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=R4YcoMVKbawRncXGio9V6oC7S0ihXR/H9DT7hf30/2Q=;
 b=Jg1sB/t4YWRSnQn2vPErQqJyZgTNjKs3CWyNStVeV4UGIxKIWv5emII5
 wbGW8Vtn1ALfb6Gb4cVRQ8XSoGMX/CcY0OS1xsG9mQ7eV/Qy5dCd80zZa
 i0O5tmg5HfMBiJBkBaFPJinOrzu9vPKSDUl78PidNDyiDg91/xCLJSIna
 Q8yQXJb6CrSde4gZ/plP0aN6jOmMGR6lKiw7Qel/oJrCKuuflPCi6d16G
 +NpMviq4qU7qUe/blmOX7Ip6bCGpjXmyuT4tfanCOs248vQ7axilb2E7I
 pnXmVK/MMt0bvaf0iaoLmssbpe9gpGG8V7jW5OtsK6onPxk02J3yBNG1J Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243050060"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="243050060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="669488124"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga001.fm.intel.com with SMTP; 10 Jan 2022 08:01:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 18:01:08 +0200
Date: Mon, 10 Jan 2022 18:01:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/dp: note that DPCD 0x2002-0x2003
 match 0x200-0x201
Message-ID: <YdxYRGHhJ8l/5+kx@intel.com>
References: <20220104184857.784563-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220104184857.784563-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 04, 2022 at 08:48:56PM +0200, Jani Nikula wrote:
> DP_SINK_COUNT_ESI and DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 have the same
> contents as DP_SINK_COUNT and DP_DEVICE_SERVICE_IRQ_VECTOR,
> respectively.

IIRC there was an oversight in the earlier spec revisions that
showed bit 7 as reserved for one of the locations. But looks like
that got fixed.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_dp_helper.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..98d020835b49 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1038,11 +1038,8 @@ struct drm_panel;
>  #define DP_SIDEBAND_MSG_UP_REQ_BASE	    0x1600   /* 1.2 MST */
>  
>  /* DPRX Event Status Indicator */
> -#define DP_SINK_COUNT_ESI		    0x2002   /* 1.2 */
> -/* 0-5 sink count */
> -# define DP_SINK_COUNT_CP_READY             (1 << 6)
> -
> -#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* 1.2 */
> +#define DP_SINK_COUNT_ESI                   0x2002   /* same as 0x200 */
> +#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* same as 0x201 */
>  
>  #define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1   0x2004   /* 1.2 */
>  # define DP_RX_GTC_MSTR_REQ_STATUS_CHANGE    (1 << 0)
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
