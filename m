Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC2A2ABB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2910E86F;
	Thu,  6 Feb 2025 14:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fI76wVm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D72010E86F;
 Thu,  6 Feb 2025 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738852874; x=1770388874;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HLlnW3M69YzwxXzo46zZ6yry5KTG3UCpTsImGwgyXNs=;
 b=fI76wVm3pKKF7v+TDFeO2bD7Q7kZdXw2fd7X23Ggu/4UApRfu7PEjtfM
 tn1zZSPME1JwZRAcdZcbgRmb+tPRj0vORrHjfKi4EzK+PLs7sv1PlRE4y
 thKEAdcN1FU36cIml8HhNFOCyNKj8rrebKn2pavSY3PoTQq9/h7wb6Yig
 30aYtAOnbAo5G95mjlCTa8nQT+/TF46eANqC8EzFZFx1C7kAw39Rvqh/G
 wzApj8cwUrbXByk07p4uAHCAFqULMrChLGW7A1KIjVsR5gl6Yiv389Ys6
 BWq9h3XZ7aUvma70f6aGmBugKyVRQKQw/W7fbjXglJBBIXHjw8DVWYu49 w==;
X-CSE-ConnectionGUID: J7uhHldoSEqIAtHIYL9Uog==
X-CSE-MsgGUID: 6AAZnTTVRAOHxjX1xiqoVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39350888"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39350888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 06:41:13 -0800
X-CSE-ConnectionGUID: +UjBaj9bSsORYK7E6SM9Aw==
X-CSE-MsgGUID: 5R8QDCkOTL2nUHKQwaUMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134466505"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.245.221])
 ([10.245.245.221])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 06:41:12 -0800
Message-ID: <13913616-d22f-489b-838e-b879a70f5692@intel.com>
Date: Thu, 6 Feb 2025 15:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/dp: Increase eDP display control capability size
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-3-suraj.kandpal@intel.com>
 <IA0PR11MB73074C21AE5D2F7F1157A88CBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
 <SN7PR11MB675030A5AC6E4F8BDE7679F7E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <SN7PR11MB675030A5AC6E4F8BDE7679F7E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


for both

On 2025-02-06 07:45, Kandpal, Suraj wrote:
>
>> -----Original Message-----
>> From: Murthy, Arun R <arun.r.murthy@intel.com>
>> Sent: Thursday, February 6, 2025 12:13 PM
>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.org;
>> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Shankar, Uma <uma.shankar@intel.com>; Kao, Ben <ben.kao@intel.com>
>> Subject: RE: [PATCH 2/8] drm/dp: Increase eDP display control capability size
>>
>>> Increase the eDP display control capability size to take into account
>>> the general capability register 703 and 704 that have recently been added.
>>>
>>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>> ---
>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>>
>> Thanks and Regards,
>> Arun R Murthy
> Hi Maarten,
>
> can I get an ack to merge this from drm-intel-next
>
> Regards,
> Suraj Kandpal
>
>> --------------------
>>>   include/drm/display/drm_dp.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/display/drm_dp.h
>>> b/include/drm/display/drm_dp.h index 05e16f0144ff..784a32bfbad8
>> 100644
>>> --- a/include/drm/display/drm_dp.h
>>> +++ b/include/drm/display/drm_dp.h
>>> @@ -1670,7 +1670,7 @@ enum drm_dp_phy {
>>>   #define DP_RECEIVER_CAP_SIZE		0xf
>>>   #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60
>>> through 0x6F */
>>>   #define EDP_PSR_RECEIVER_CAP_SIZE	2
>>> -#define EDP_DISPLAY_CTL_CAP_SIZE	3
>>> +#define EDP_DISPLAY_CTL_CAP_SIZE	5
>>>   #define DP_LTTPR_COMMON_CAP_SIZE	8
>>>   #define DP_LTTPR_PHY_CAP_SIZE		3
>>>
>>> --
>>> 2.34.1
