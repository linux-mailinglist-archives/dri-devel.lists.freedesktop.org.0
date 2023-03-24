Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAD6C81A0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 16:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3710E511;
	Fri, 24 Mar 2023 15:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104F10E511;
 Fri, 24 Mar 2023 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679672577; x=1711208577;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WzE7F2UEYbL0CuJ6OhGLOkCxQTtF/mS+uIl9cyeBVgY=;
 b=DqMZTIjxHVgUzoCwfwZJX5jZNdi2WYtaC6zwNUwW0DNYhbt6WECPPPje
 J8PZlFmli/r/THyEJRDagh/nSQdmweLD6i+00sQjsyqEW04QUHPqEeibF
 RKZJjZzWqMFjgLoq1lQepxs5KxOeAnn1aZ2dQYkj6C/EDSo+RWEolHXft
 noJQY0bR5SKtyeXYj+K60QVQ7sFObuRDSFvCquH7JERhDUv1WQquCXH9N
 htl61oHT8rsp6kU8UG7uu+jM8Gh1m08ZzuqlNlozq/Ufnj5Bxho6rG7ty
 FzHM9kdwRp9T0g8SX1Tuatb29DF4VW6ohtr7AEqZg8pNfXAJti3V5dqU2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338529023"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="338529023"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793481528"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="793481528"
Received: from fdugast-mobl3.ger.corp.intel.com (HELO [10.252.38.170])
 ([10.252.38.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:42:54 -0700
Message-ID: <ce7d6225-bc04-fef7-6a46-a3169fcd3feb@linux.intel.com>
Date: Fri, 24 Mar 2023 16:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/7] drm/dp_helper: Add helper to check DSC support
 with given o/p format
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
 <20230309062855.393087-2-suraj.kandpal@intel.com> <87h6ufajdo.fsf@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87h6ufajdo.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

ack

On 2023-03-20 09:59, Jani Nikula wrote:
> Thomas, Maxime, Maarten, ack for merging this one via drm-intel?
>
> BR,
> Jani.
>
>
>
> On Thu, 09 Mar 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>
>> Add helper to check if the DP sink supports DSC with the given
>> o/p format.
>>
>> v2: Add documentation for the helper. (Uma Shankar)
>>
>> v3: /** instead of  /* (Uma Shankar)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   include/drm/display/drm_dp_helper.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index ab55453f2d2c..533d3ee7fe05 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -194,6 +194,19 @@ drm_dp_dsc_sink_max_slice_width(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>>   		DP_DSC_SLICE_WIDTH_MULTIPLIER;
>>   }
>>   
>> +/**
>> + * drm_dp_dsc_sink_supports_format() - check if sink supports DSC with given output format
>> + * @dsc_dpcd : DSC-capability DPCDs of the sink
>> + * @output_format: output_format which is to be checked
>> + *
>> + * Returns true if the sink supports DSC with the given output_format, false otherwise.
>> + */
>> +static inline bool
>> +drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
>> +{
>> +	return dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & output_format;
>> +}
>> +
>>   /* Forward Error Correction Support on DP 1.4 */
>>   static inline bool
>>   drm_dp_sink_supports_fec(const u8 fec_capable)
