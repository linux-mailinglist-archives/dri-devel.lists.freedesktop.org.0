Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36948690E76
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 17:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759510E22B;
	Thu,  9 Feb 2023 16:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409910E220
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 16:39:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j23so2426591wra.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O8V3N6wSlSENNpeawEJmTyMSuquwbmA5xa/bqwuoK0Y=;
 b=I7Xwb36JOGo7wg9KuYd6h73CYo1jAyipu4Q/20lqr9do+vqgVPYM6ExIDKrMYxm3HJ
 aXUjZFo1CrH9FIHH9Mqo5o82hAvq/1GtJmURXp1u58gyGtX+VQyR5w7R4KH8xiMklDOG
 XriUSGVqbiFGwtP8bvi85ILY+SRaEAOgU8LvgEe9N+VtcoQBGXJvclxmyBE2RU8kfyl1
 uwP5onoXvjwoH0k2KBCjipd+wOx2jbV2ydHe6TdbK0wz7jC0RHZ40BnUniqTcKaA0TuF
 5dzGe1O3KKwc0fwEsjrZkrSA/0uGKIi4vr8Lt+1HBVDWaqti1UVRJQEOwrRtb5dwNLhv
 D43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O8V3N6wSlSENNpeawEJmTyMSuquwbmA5xa/bqwuoK0Y=;
 b=G7Kl8K5v0E73mh4ijrz4b+5CBO8F1ga6Py7zaBDVK0yIAzsGAu8SsAN7xUPV3WQIgy
 0advMZKjzdRUwuxCK/5QvwgyBieUoYMzQHdVw4kSRFW9BQOQA3Q/wwp2EvTO4OqK0Kaf
 5wY419VVmnL8auvOlfUxlLEdkabTB44s8NHf38TIEscDqdG4gBFzmhEdkJNLpAWLPCMT
 6YBPjghnSStzf2efB3SBG4mUz15Rc2dLSt7YB6kOXNTaxsJdxrT15CbNOU0S3J3OR1Gc
 WUL5uj5ELRrUys9C/CLYkb3ntRl07pWEMDEZxrxuybbp9BxU0x3kcsSFoIH8yMTZI4RU
 Wb3A==
X-Gm-Message-State: AO0yUKUfT1DcXHkVPs4Sxyr2h1Pu/Qa6vF7AsuECrM3lCa324g9kH5Nt
 lBJxGoEaEHdCk65SiH65pqWZvg==
X-Google-Smtp-Source: AK7set83R8dvev7zmXdOCujzIkd7Tkf67Oj+b0b06B6eeFjdpoajjBc0HgNCyTCpWvdD/Td4Ps76pA==
X-Received: by 2002:adf:dc04:0:b0:2c3:ea92:3494 with SMTP id
 t4-20020adfdc04000000b002c3ea923494mr10642889wri.55.1675960740789; 
 Thu, 09 Feb 2023 08:39:00 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1609104wrf.98.2023.02.09.08.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 08:39:00 -0800 (PST)
Message-ID: <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
Date: Thu, 9 Feb 2023 16:38:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <20230208113041.70691449@eldfell>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20230208113041.70691449@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/8/23 09:30, Pekka Paalanen wrote:
> On Fri,  3 Feb 2023 02:07:44 +0000
> Joshua Ashton <joshua@froggi.es> wrote:
> 
>> Userspace has no way of controlling or knowing the pixel encoding
>> currently, so there is no way for it to ever get the right values here.
>>
>> When we do add pixel_encoding control from userspace,we can pick the
>> right value for the colorimetry packet based on the
>> pixel_encoding + the colorspace.
>>
>> Let's deprecate these values, and have one BT.2020 colorspace entry
>> that userspace can use.
>>
>> Note: _CYCC was effectively 'removed' by this change, but that was not
>> possible to be taken advantage of anyway, as there is currently no
>> pixel_encoding control so it would not be possible to output
>> linear YCbCr.
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
>>   drivers/gpu/drm/drm_connector.c           | 12 ++++++------
>>   drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
>>   include/drm/drm_connector.h               | 19 ++++++++++---------
>>   4 files changed, 29 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> index 0264abe55278..c85860600395 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>>   #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>>   #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>>   #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
>> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
>> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
>> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
>>   #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>>   #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
>>   
>> @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] = {
>>   	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
>>   	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
>>   	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
>> -	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
>> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
>> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
>> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] = HDMI_COLORIMETRY_BT2020,
>> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] = HDMI_COLORIMETRY_BT2020,
>> +	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
>>   };
>>   
>>   #undef C
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 61c29ce74b03..58699ab15a6a 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>>   	/* Colorimetry based on IEC 61966-2-5 */
>>   	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>   	/* Added as part of Additional Colorimetry Extension in 861.G */
>>   	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>   	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
>> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>   	/* Colorimetry based on SMPTE RP 431-2 */
>>   	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>   	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>>   	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>>   	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
>> @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>   	/* Colorimetry based on IEC 61966-2-5 [33] */
>>   	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>>   	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>>   };
> 
> Hi,
> 
> do these not rename the old uAPI strings?
> 
> Shouldn't the old strings be kept? It's much easier to scream "kernel
> regression" when the expected string is no longer found than a subtle
> change in behaviour that might not even be a change. ;-)
> 
> If there is not going to be a difference in behaviour, the enum could
> expose e.g. all of "BT2020_RGB", "BT2020_CYCC" and "BT2020_YCC" as the
> same integer value. If old userspace exists, it would not notice any
> difference.
> 
> I mean, the *strings* are the uAPI, not the integers, right?

Both are uAPI these days.

I was wrong when I did this commit either way.

- Joshie 🐸✨

> 
> 
> Thanks,
> pq
> 
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index c9be61d2348e..1aa5dedeec7b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>>   	case DRM_MODE_COLORIMETRY_OPYCC_601:
>>   		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
>>   		break;
>> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
>> -		break;
>> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
>> -		break;
>> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
>> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>> +	case DRM_MODE_COLORIMETRY_BT2020:
>> +		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
>> +			? DP_COLORIMETRY_BT2020_RGB
>> +			: DP_COLORIMETRY_BT2020_YCC;
>>   		break;
>>   	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>   	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>> @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>>   	switch (conn_state->colorspace) {
>>   	case DRM_MODE_COLORIMETRY_SYCC_601:
>>   	case DRM_MODE_COLORIMETRY_OPYCC_601:
>> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
>> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>> +	case DRM_MODE_COLORIMETRY_BT2020:
>>   		return true;
>>   	default:
>>   		break;
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index eb4cc9076e16..42a3cf43168c 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
>>    *   opYCC601 colorimetry format
>>    * @DRM_MODE_COLORIMETRY_OPRGB:
>>    *   opRGB colorimetry format
>> - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
>> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
>> - *   ITU-R BT.2020 R' G' B' colorimetry format
>> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
>> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
>> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
>> + * @DRM_MODE_COLORIMETRY_BT2020:
>> + *   ITU-R BT.2020 [R' G' B'] or
>> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
>> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
>> + *   colorimetry format
>>    * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>    *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>>    * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>> @@ -420,9 +421,9 @@ enum drm_colorspace {
>>   	DRM_MODE_COLORIMETRY_SYCC_601,
>>   	DRM_MODE_COLORIMETRY_OPYCC_601,
>>   	DRM_MODE_COLORIMETRY_OPRGB,
>> -	DRM_MODE_COLORIMETRY_BT2020_CYCC,
>> -	DRM_MODE_COLORIMETRY_BT2020_RGB,
>> -	DRM_MODE_COLORIMETRY_BT2020_YCC,
>> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
>> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
>> +	DRM_MODE_COLORIMETRY_BT2020,
>>   	/* Additional Colorimetry extension added as part of CTA 861.G */
>>   	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>>   	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
> 

