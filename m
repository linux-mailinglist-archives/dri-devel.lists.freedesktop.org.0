Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B902A9FFB44
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 16:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66C10E73A;
	Thu,  2 Jan 2025 15:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmAm/mTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B06410E0B1;
 Thu,  2 Jan 2025 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735833514; x=1767369514;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=eqtnioo85lhBfbYHl94eYOQzsAfw9kNvGdlIZL6N678=;
 b=mmAm/mTmynkssQGIGaqwBq+z0k0d9YvSbFMPgBSh7AaWhiy0si8xfMq2
 3Jeck7MOeI6D10jU+UnNx+4XxCgjLrXOPWsMiB9/qHihVfNEN+eY7E2rS
 QsGOFCq3mEDd6/DO5IgvzEHSzGRWc0rBheDf7GaM596OgbbCiqsTZK3b6
 s8mQnhX1L2lSMA32ZW5wY1OpSIOYwhQyJvGJ27OdF3HTzt+6jWncZGH9F
 KmTtN1tgIDI/7/TYZcIwVJ9vVSoH0DQSBWSZfDdYGgulbL+boRWxcxW72
 LeHznLGuj0WJSMgZsB/8R6vm+ae56hsgUNGY0JFhemrpP7TteiJRJy/7K g==;
X-CSE-ConnectionGUID: u2FDI6MtSYmoDGvnxBe31A==
X-CSE-MsgGUID: ywHHekNASMW9esHqKBvxcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36189272"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36189272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:58:33 -0800
X-CSE-ConnectionGUID: Fty2iI0+S5OnJaZg0AYENw==
X-CSE-MsgGUID: XclNUsVsQDCYuODqKAeVtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105587486"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:58:31 -0800
Date: Thu, 2 Jan 2025 17:59:17 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/16] drm/i915/ddi: enable ACT handling for 128b/132b
 SST
Message-ID: <Z3a31bg7WYksQpi3@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <90c3402b0b11f13600c700f07c103738413ae6f9.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c3402b0b11f13600c700f07c103738413ae6f9.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:34:01PM +0200, Jani Nikula wrote:
> Add ACT handling for 128b/132b SST.
> 
> This is preparation for enabling 128b/132b SST. This path is not
> reachable yet.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 91e6cd91e91f..7b739b9c5a06 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3486,6 +3486,19 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
>  	/* Enable/Disable DP2.0 SDP split config before transcoder */
>  	intel_audio_sdp_split_update(crtc_state);
>  
> +	/* 128b/132b SST */
> +	if (intel_dp_is_uhbr(crtc_state)) {

Imo, as before the above would also need !hdmi.

> +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> +
> +		intel_ddi_clear_act_sent(encoder, crtc_state);
> +
> +		intel_de_rmw(display, TRANS_DDI_FUNC_CTL(display, cpu_transcoder), 0,
> +			     TRANS_DDI_DP_VC_PAYLOAD_ALLOC);
> +
> +		intel_ddi_wait_for_act_sent(encoder, crtc_state);
> +		drm_dp_dpcd_poll_act_handled(&intel_dp->aux, 0);

The spec requires doing the reverse during disabling - delete the stream
in the payload table, clear the payload alloc flag and wait for both ACT
handled both in DP_TP_STATUS and DPCD, see bspec 68849 / Disable Sequence
steps g/h.

> +	}
> +
>  	intel_enable_transcoder(crtc_state);
>  
>  	intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
> -- 
> 2.39.5
> 
