Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727A124CE5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 17:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DF36E8A6;
	Wed, 18 Dec 2019 16:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C4A6E873;
 Wed, 18 Dec 2019 16:14:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 08:13:56 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210132623"
Received: from amanna-mobl1.gar.corp.intel.com (HELO [10.66.117.94])
 ([10.66.117.94])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 18 Dec 2019 08:13:53 -0800
Subject: Re: [PATCH v2 2/9] drm/amd/display: Fix compilation issue.
To: Harry Wentland <hwentlan@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20191218151350.19579-1-animesh.manna@intel.com>
 <20191218151350.19579-3-animesh.manna@intel.com>
 <03119efd-5130-3851-5dec-bd4ef5b8cfd5@amd.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <0a2bc02e-e3fa-b177-0c3b-fe7c323337a0@intel.com>
Date: Wed, 18 Dec 2019 21:43:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <03119efd-5130-3851-5dec-bd4ef5b8cfd5@amd.com>
Content-Language: en-US
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18-12-2019 21:12, Harry Wentland wrote:
> On 2019-12-18 10:13 a.m., Animesh Manna wrote:
>> [Why]:
>> Aligh with DP spec wanted to follow same naming convention.
>>
>> [How]:
>> Changed the macro name of the dpcd address used for getting requested
>> test-pattern.
>>
> Please roll this into your patch that renames the definition. All
> patches should compile on their own.


Thanks Harry for review, wanted to follow similar commit-description 
format followed in amd-driver compare to i915 and created a separate 
patch. Maybe is it good idea to change the patch sequence and make it as 
first patch.

Regards,
Animesh

>
> Thanks,
> Harry
>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> index 42aa889fd0f5..1a6109be2fce 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> @@ -2491,7 +2491,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>>   	/* get phy test pattern and pattern parameters from DP receiver */
>>   	core_link_read_dpcd(
>>   			link,
>> -			DP_TEST_PHY_PATTERN,
>> +			DP_PHY_TEST_PATTERN,
>>   			&dpcd_test_pattern.raw,
>>   			sizeof(dpcd_test_pattern));
>>   	core_link_read_dpcd(
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
