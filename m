Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF26A7BA34
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641A110E336;
	Fri,  4 Apr 2025 09:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAu+fHB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00AD10E336;
 Fri,  4 Apr 2025 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743759956; x=1775295956;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3EHkBlBR+VVaWteAKErgiCYFCdYinZCNjzsqmWOwHk4=;
 b=ZAu+fHB9IHMgllD6ohQHFzqW3Ze6Dbni0w+jKrpV2f1l4hLXyQdd7/AA
 e3uMsJRJV5PzX+md5+NJMQpAYl0CngzhPf4MFm68esa2mVfGzqEpa6z3d
 E3jibKgQvdrDv2Bw6GSQbycc+b9YHQEZQlpCtvn6lUqZPvt+H00xMh0CI
 fQC5VFMs/ur++qKTmS0AvEGF8hqpHDzARzn1t3hm5s7BL7v7yZ5MiK3yD
 TF7x1ANRoqzAwLgXoMyGae9t8KpWzDWD6FehbmG2DY1zeNjrKGlGaQ57r
 8KqW5sz0mrR5b5VHMlOuSMsXgpvugmsKS/oG3ciDogV98F12EfZ3rUHl6 A==;
X-CSE-ConnectionGUID: EKbM70cxSZmv0rzp+5COjQ==
X-CSE-MsgGUID: GduOYY0aS1i04TfTdrAEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62734708"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="62734708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:45:55 -0700
X-CSE-ConnectionGUID: 3hKarYkhQUWk8Ofui/tBOg==
X-CSE-MsgGUID: im7uxa+sSt6GcQLW198fjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="158239430"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:45:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, shantam.yashashvi@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: drm/i915: Add DSC/FEC support info to debugfs
In-Reply-To: <Z-7ufGS4D2cMDenl@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250403190448.29795-1-shantam.yashashvi@intel.com>
 <Z-7ufGS4D2cMDenl@ideak-desk.fi.intel.com>
Date: Fri, 04 Apr 2025 12:45:50 +0300
Message-ID: <87tt74z2cx.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Apr 2025, Imre Deak <imre.deak@intel.com> wrote:
> On Fri, Apr 04, 2025 at 12:34:48AM +0530, shantam.yashashvi@intel.com wrote:
>> From: Shantam Yashashvi <shantam.yashashvi@intel.com>
>> 
>> Signed-off-by: Shantam Yashashvi <shantam.yashashvi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> index 057a8ce0c2c97..b8d3a438a34d9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -276,6 +276,7 @@ static void intel_connector_info(struct seq_file *m,
>>  	struct intel_encoder *encoder =
>>  		to_intel_encoder(conn_state->best_encoder);
>>  	const struct drm_display_mode *mode;
>> +	struct intel_dp *intel_dp;
>>  
>>  	seq_printf(m, "[CONNECTOR:%d:%s]: status: %s\n",
>>  		   connector->base.id, connector->name,
>> @@ -301,6 +302,16 @@ static void intel_connector_info(struct seq_file *m,
>>  			intel_dp_mst_info(m, intel_connector);
>>  		else
>>  			intel_dp_info(m, intel_connector);
>> +
>> +		/* Add DSC and FEC Support Information for DisplayPort / eDP Connectors */
>> +		intel_dp = intel_attached_dp(intel_connector);
>> +		if (intel_dp){
>> +			seq_printf(m, "\tDSC_Sink_Support: %s\n",
>> +                str_yes_no(drm_dp_sink_supports_dsc(intel_connector->dp.dsc_dpcd)));
>> +			if (!intel_dp_is_edp(intel_dp))
>> +				    seq_printf(m, "\tFEC_Sink_Support: %s\n",
>> +				        str_yes_no(drm_dp_sink_supports_fec(intel_connector->dp.fec_capability)));
>
> Both of the above info is available already in the connector's
> i915_dsc_fec_support debugfs entry. As I understood the aim is having
> each CRTC / connector show its own properties, instead of combinining
> all those into one debugfs entry (as this is done in i915_display_info).
> Based on that I don't think more (duplicated) information should be
> added here.

Agreed. I think the direction should be to reduce stuff from
i915_display_info and put it into per-crtc and per-connector debugfs
instead.

BR,
Jani.



>
> One issue with the i915_dsc_fec_support entry is that it doesn't show
> the sink capabilities if the output isn't enabled on the connector, I
> plan to follow up with a fix for that.
>
>> +		}
>>  		break;
>>  	case DRM_MODE_CONNECTOR_HDMIA:
>>  		if (encoder->type == INTEL_OUTPUT_HDMI ||
>> -- 
>> 2.25.1
>> 

-- 
Jani Nikula, Intel
