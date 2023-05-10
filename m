Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E596FE053
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18210E4B7;
	Wed, 10 May 2023 14:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19910E4B5;
 Wed, 10 May 2023 14:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPq/sucpk6caTyQfWY7MIUxxARmssn4+4TzI6fhSddQ6bTYyOiVOvD1exFiNy1Xlzk2TKWjTo50Qq3Don7GFhp/ZSYTeV4EfzLUWv1Ke7VcJgtu04nGgGS2mdMWmlMPGijEaW4rDC1UnevI6ocLgeVtd08pqIcyDQ5T95JLhFHB5js9/Yu6jXnT+BN3HQRaPHAtvqaFFRqQjKoerZtwlxNF37nV/kmBFC8SbEHgRKAcvlnI9dw55Ro7Zle4UXRNUfjehDy1LXIvMmP4I3LWrjk2IFl3x6KSsOLkVuph+pix8yXC5ZCw6hplE3Wh6K/YPjr7VwimQMJJS+0Zzh1Xaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGiQRfSmUunaPBScpm5fpnE6tnQLVEd/POz9GgQkumI=;
 b=cQztkga5OSZR+MeqgRdLkVKlbaMxvsqknNx9MyFBfWQHT0eJNIwSI6XIjL84P7cdNc538EDIE9GE+/ykwlFtaKX7mcQV124MtxvX38j/Xq4N2yvPzPj95RB6/vB49Mj370rbfXyshGJbsA+T1G7gpaJSOIlc7KKwb2QerAfWeXYTR/yqZLWvyu56LKQa6PJUJRup6UjTH/eRoTnnnIEkAqcEgRm1H0kXhYqQMvo8nHUVvUyvQqowrSJdOLTe3HDKpkY1aaaDM7nqVgMKIhLpD2/2wWjUyOgzHiJ2mfOTg8L3YFekqTJDgxbvt2voMjmBG9oyv2nYyMik+1M4oUDvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGiQRfSmUunaPBScpm5fpnE6tnQLVEd/POz9GgQkumI=;
 b=DHcTrKgJ+Y6h/owijX/fWxVH+LkL01I8jqMRN5hQdogJmAjSR3t+jtCdfs05t5RYyAdR4Tu8pWziuUIx0ciM/o7f5Cj9oecb5J3XAa5qwSCb/GXZCN3ZtpBgqmn2cBjGbyBGhdnVOzOiQCRlB3JyRTPX4C7OEdRC7qJdnPUJKDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Wed, 10 May 2023 14:31:40 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e%6]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 14:31:40 +0000
Message-ID: <9e01ebd6-b86e-aaab-93b6-3136f2ce3757@amd.com>
Date: Wed, 10 May 2023 10:31:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: vitaly prosyak <vprosyak@amd.com>, vitaly.prosyak@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com
References: <20230510135111.58631-1-vitaly.prosyak@amd.com>
 <6e1930e0-1a52-6499-0ebb-998aa7e82c8f@amd.com>
 <b43e25d5-8ce4-a1f7-cd46-fbc76a9d7aac@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/sched: Check scheduler work queue before calling
 timeout handling
In-Reply-To: <b43e25d5-8ce4-a1f7-cd46-fbc76a9d7aac@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b73ed4-38f6-45f2-c8d6-08db516344d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAgxbhf3s+2BZmHKClnA6hrG+q4aJMvTFol8ZSXqC6gTDgBy30r3ffDfyKEzey/iDVQFdXvhOwTwbo3sG5WHxy+sRpKj63dRKhyXrmVhoKd3lq8b4pLo/+Rk6N2739clIlVSODMyS6Otzf6h6zioz9WJywvEVbpcvyzJ51ctTRotvtbN3LwM3Ue0X/nHEGc4EBF3pON5xsZhbXFKLEBtkN/wxYHz19XOnbb31dLPhsr6+7HVPN+cqMDXCfDFHYGg62JQrC06EGttpM1xYUP9OueON7RNgJbTBR3iPYojkRqpz6UWAw3TOi+Qbe7JpcvrhPv+A1+xSDa7NdZm4WTRrcaRPB7NHImNQKsCyYVSPOwr3UBv/d1pv6LDQAOTDwzniAV5MA3SbSIPaWalE+u1Y597J0la5HjgTVAjdjR2vtd20B0XiDSqUXa5XtX3SajaUbVXDOwxHyO07Er8CXTh2MsMtAXOSghj3uaG2RZf3x2lJsvykbCFihhEMwv6ehkM+h0T21J6CFqywM/R2aqr9z0OdQLf/Z8w7jEKfkEIVubS0XtLVQ8oPLTJSXOuJTvhB/KQGnHD0Xsut4XPxkZKon9aCf7SP8F/GvD4Gi9qd2qRcF+eGpJzr6c6P4edEVXmIzoVjnaUiia0VNIVJRRTig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(6486002)(44832011)(6666004)(38100700002)(5660300002)(8936002)(8676002)(478600001)(316002)(6636002)(36756003)(66556008)(450100002)(66946007)(66476007)(2616005)(86362001)(2906002)(186003)(83380400001)(31686004)(31696002)(41300700001)(26005)(6512007)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHB6MkEwYVdRS3JZc0NtVyt4Tzkybkh2OVNJS1N0TkhlZkVXcjd2V1d1Qno0?=
 =?utf-8?B?Z2E4VHJGVTI5aVViRGFDd2tNUmEyR2xBZXh1aE95ZzhsODJSdTl1SnMzRlI3?=
 =?utf-8?B?VnA4eTJuVVVrT0U0Z3l6U2Vybk5oUHFseHl2YTlnalNMdGo0bkxhaE0zRk1W?=
 =?utf-8?B?TWpnc29kb0JRKyt3SFJ5MFZ4TzFyUTQvZUo3bUdtTEplcnR3SXE2WWZKTHV2?=
 =?utf-8?B?Yy8rYXBhL1psYm5Zc2NkSjJTZXU4Y1JhK0cydUYyOHdibllvUm9lZW5RMWZX?=
 =?utf-8?B?UDZsQkV2SHVxUkpaTDBualFWcFlpUHBqaG12TWNKUVc5M0hXT0h3RFVFMi9h?=
 =?utf-8?B?amQ4SWxBakM5TXBXblZ4ekRsQnVrUERrOWJjYUVsYkpVUmh6SHVBVFBBaklI?=
 =?utf-8?B?UDVJL2hxQkR3ckhMOXcrMS95REFXMUIraGFRZUxKck1FMUgxa1BGSFFnSHA3?=
 =?utf-8?B?VXBwblZUYktCNDNDTXRLUE5WbTJnMDhQMElzSFViaklrZEUwcVY4Ui84YWlx?=
 =?utf-8?B?NG1RWWlVM0U4T3pseERpMWFveWNJRDJaby9oKy9nTzRjU29ZYXFaa1VSRmpL?=
 =?utf-8?B?VWdOV2NITENxRlYxQUVSRldMUkdnQk9MbXlHNGFZbUF1YzZlU01zOS80eVNS?=
 =?utf-8?B?SGoxSUJHVkpmQjBmS2x4U3FnZWF4ZTIrWHhsUWlHYkgwOENVMU5yMFNKelox?=
 =?utf-8?B?T1Q2bGE4S1BhdnBvelNmZll6YkZBWm5ab3pKazV0ZjBDcWV1Skxob2pLUWxV?=
 =?utf-8?B?TmdQT2RPa0dycklXYjloSS9LVzhFNDc3OXRVVmVHaVhTWnhxWGFxRWkzeFRY?=
 =?utf-8?B?djhqa2Y0dU9DcWpyS3I5WkFTMzFmN0FQUXdRY3lnbUNVMnkvY2pDc1F5dExr?=
 =?utf-8?B?S0NEM3ExSS9aZE9yd1JKNUMxS25hclhVSytxQ2I5Rm5tMFh2ZkNlTmhyY0cv?=
 =?utf-8?B?K1IwWThodGdzTldTVGFDK3ZZMExOb0NybHRDUDRUNE5HUVRqT3dRc2hiWXFJ?=
 =?utf-8?B?dzFXMEplbjA0THErTEU5L3NEM1h2cGNEcFdnTGZMZk9BU3R4emlVV1ExamRV?=
 =?utf-8?B?OGM5Z1FGd0JhMWNTVWk3ZytXRmxpVCtZeEMvNjN5Z0g3REVETktEbFlMZGxu?=
 =?utf-8?B?MzRZU3Q0c1plaWp2aWZoMWMxVVVvM3cxa0NudFN1YjRuREQxK2NYWG1ZRTFQ?=
 =?utf-8?B?ZjE3dEplRERxRUZ1UVlIS1hKQks5Y3ZqSmFJWGt0dHhFcVBaSmNKUXJqSFFQ?=
 =?utf-8?B?MkI0bFZRZTFNdlBlbXpodFhJNnJyMmlkdlZTRTRsTTVud21pWGl0d21TdVpn?=
 =?utf-8?B?VFhTRXQzTVIxcHdGSUUyS3FBSlg1dlpwOXJONXoxTGRvTFB1cU5veDgwWE1V?=
 =?utf-8?B?T0JpZXEzQTdZN1NFYjY4SlowK1V4SmhNblN6MS9LR0NWZUhtK3QvRUZ5a09F?=
 =?utf-8?B?b1NBcDNUY2c5N2I5N0FKaWt2Yk5xVHR5dWorUHJzT011UGY3WFMvdkt3M2x5?=
 =?utf-8?B?VU5pdE50L3E4VzRwK1pBTHRCUWIxajdoaVl1ZXY4TWtEb0k1SHdWS21qWVVV?=
 =?utf-8?B?VFZ1bVZpbmc3NGVXamhwSXQraXVENHV1ZWhSSDEyR0NnYjV3TWx4NFVWcUIw?=
 =?utf-8?B?Rm5welJReE11R0NwU3duMkZFaitJUVROUEh3MmFWNHlwRm5XaXdIcktIOTFT?=
 =?utf-8?B?dENJajlYZ0s5N2thNzlHTU5yMVI5ZEVPdGlYM1lLZE9KOTFqRm94OTBPaE8y?=
 =?utf-8?B?Uk9TZFc4OWxKeDBtT2dnQVh0d0NHRXU4bzUvcFc2ZFRSaTgyQ21Leng2a0Ju?=
 =?utf-8?B?WDZ1cmZINE8zODlieGZDZFJKYjZTTUFadzExS2xCc2Myb3FuRlZjL1ZMN25z?=
 =?utf-8?B?UjJCVDc4VEVnNlYySjhlb1VVUHQ0NXluMUh3QVRlZ2NVSkdxSEc2aXJYTEhh?=
 =?utf-8?B?Z1NuN3BGWUpzUTRaN2FOckkzWmg2dnJHYjN3TGtpYUtBeFBpcTNNNms3Wkdk?=
 =?utf-8?B?cjZJQ3JrSjRLRmlzdDJwZU9BOEVmVjlyWG5qRnFFbU50YU0wZFBGOHlxRUNo?=
 =?utf-8?B?SEppeFgvS05FdkdrSFNUSWtCRVQzK3Bkb2FFMHFXQ21Vd0Fpbi8yRmZUM0h3?=
 =?utf-8?Q?zvFOGeODJ1DgHcTXeXA86aij5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b73ed4-38f6-45f2-c8d6-08db516344d8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:31:40.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jZlQ1tQPrtqjQO7F38yhO03QnWGTx+qH3jBhDXvuxJCqzyycZrk/uahWSFJBqRD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

On 2023-05-10 10:24, vitaly prosyak wrote:
> 
> On 2023-05-10 10:19, Luben Tuikov wrote:
>> On 2023-05-10 09:51, vitaly.prosyak@amd.com wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> During an IGT GPU reset test we see again oops despite of
>>> commit 0c8c901aaaebc9 (drm/sched: Check scheduler ready before calling
>>> timeout handling).
>>>
>>> It uses ready condition whether to call drm_sched_fault which unwind
>>> the TDR leads to GPU reset.
>>> However it looks the ready condition is overloaded with other meanings,
>>> for example, for the following stack is related GPU reset :
>>>
>>> 0  gfx_v9_0_cp_gfx_start
>>> 1  gfx_v9_0_cp_gfx_resume
>>> 2  gfx_v9_0_cp_resume
>>> 3  gfx_v9_0_hw_init
>>> 4  gfx_v9_0_resume
>>> 5  amdgpu_device_ip_resume_phase2
>>>
>>> does the following:
>>> 	/* start the ring */
>>> 	gfx_v9_0_cp_gfx_start(adev);
>>> 	ring->sched.ready = true;
>>>
>>> The same approach is for other ASICs as well :
>>> gfx_v8_0_cp_gfx_resume
>>> gfx_v10_0_kiq_resume, etc...
>>>
>>> As a result, our GPU reset test causes GPU fault which calls unconditionally gfx_v9_0_fault
>>> and then drm_sched_fault. However now it depends on whether the interrupt service routine
>>> drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed which sets the ready
>>> field of the scheduler to true even  for uninitialized schedulers and causes oops vs
>>> no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx_start and
>>> NULL pointer dereference does not occur.
>>>
>>> Use the field timeout_wq  to prevent oops for uninitialized schedulers.
>>> The field could be initialized by the work queue of resetting the domain.
>>>
>>> Fixes: 0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")
>>>
>>> v1: Corrections to commit message (Luben)
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>> I didn't give my RB to this patch so I'm not sure what it is doing here.
> I removed your rb, also if you do not know what is doing here why do you want to push this to amd-staging-drm-next and to  drm-misc-fixed?

I'll add my RB as I push it to those two branches.
I'll also add a Link tag and fix the commit SHA for the Fixes tag to
one which is found in drm-misc-fixes.

Thanks for the patch fixing this long-standing bug.

Regards,
Luben


>>
>> The fixes tag should be before the SOB tag, and the v1 line should be separated
>> by a line before the Git tags.
>>
>> Since this is a good patch and I want it in both drm-misc-fixed and amd-staging-drm-next,
>> I'll submit it to drm-misc-fixed with a Link: and RB/SOB tag there and then cherry-pick
>> that into amd-staging-drm-next.
>>
>> Don't push it to amd-staging-drm-next.
>>
>> I'll fix this and submit to amd-staging-drm-next and to drm-misc-fixed with
>> a Link: tag.
>>
>> Regards,
>> Luben
>>
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 649fac2e1ccb..670b7997f389 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>>>   */
>>>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>>>  {
>>> -	if (sched->ready)
>>> +	if (sched->timeout_wq)
>>>  		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_fault);

