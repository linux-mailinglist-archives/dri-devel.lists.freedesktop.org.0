Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C06C0CA3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 09:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438810E291;
	Mon, 20 Mar 2023 08:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB4A10E291;
 Mon, 20 Mar 2023 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679302765; x=1710838765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i2POnaXGxQMvzGKGVzQkwhkewNHUSHwd0R2/OIXfZLA=;
 b=i972FL3vnwjR6K8hcmjMyuGxhnoDVBnkzvGs3Pn+CwqOes/WJv7P/31X
 GJvHI/ESbgik08FgGGj9UH8tTQvho8n1eSCjvoGUPP4lge1lEnOrQUIuo
 Dy18ipieLRYNNe3BnGMOz77B6NXnWRsMMOYXgV0Y+upzR3zdH/v8G4kiQ
 6VKfPOrgS8D0AqqobblPws53j4hrdFp5Sjbou5pvRY0Fcf82fzzrdSMUa
 Q8pNr9cWMEeG91xHZs2vnMWCcAh9MZetN9jD6VcSKCVKB9aWF5FSqRjCp
 rCF6fd2Rx08cTSyLL5dp0aUMh4ZjhBZnXpqSCS5rZV/uHhkkOeT+sZy3Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="424886787"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="424886787"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926894084"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="926894084"
Received: from mseifert-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.180])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:59:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/7] drm/dp_helper: Add helper to check DSC support
 with given o/p format
In-Reply-To: <20230309062855.393087-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
 <20230309062855.393087-2-suraj.kandpal@intel.com>
Date: Mon, 20 Mar 2023 10:59:15 +0200
Message-ID: <87h6ufajdo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Thomas, Maxime, Maarten, ack for merging this one via drm-intel?

BR,
Jani.



On Thu, 09 Mar 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> Add helper to check if the DP sink supports DSC with the given
> o/p format.
>
> v2: Add documentation for the helper. (Uma Shankar)
>
> v3: /** instead of  /* (Uma Shankar)
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  include/drm/display/drm_dp_helper.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index ab55453f2d2c..533d3ee7fe05 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -194,6 +194,19 @@ drm_dp_dsc_sink_max_slice_width(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>  		DP_DSC_SLICE_WIDTH_MULTIPLIER;
>  }
>  
> +/**
> + * drm_dp_dsc_sink_supports_format() - check if sink supports DSC with given output format
> + * @dsc_dpcd : DSC-capability DPCDs of the sink
> + * @output_format: output_format which is to be checked
> + *
> + * Returns true if the sink supports DSC with the given output_format, false otherwise.
> + */
> +static inline bool
> +drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
> +{
> +	return dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & output_format;
> +}
> +
>  /* Forward Error Correction Support on DP 1.4 */
>  static inline bool
>  drm_dp_sink_supports_fec(const u8 fec_capable)

-- 
Jani Nikula, Intel Open Source Graphics Center
