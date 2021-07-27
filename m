Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F13D8369
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017CD6EB28;
	Tue, 27 Jul 2021 22:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E46EB23;
 Tue, 27 Jul 2021 22:48:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="199764178"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="199764178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="498980568"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2021 15:48:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 15:48:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 15:48:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 15:48:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N52zMM5qZRRO0fOSOxk9JislJPDcwWXy2Fd6ZBWF83OvfeJYsFO8A4aLHmmsAUX/7PIgp/iB8VJDLEuHW+e0cKLmaDkXMcpMd0R8YsfctLkPJ2uYB+Hre1ZuoQA/y7Bm79h4bjbsT5BrwPwetexIlJsWZpajnW6xeYYgZTqT0c2UV6ye95QMLv9DDRVGy8J3UQ2KSNDNr97ZvhlRprM0Arm0chHzNbjHoIgDHe7bKMF8jOf0NXbaEJnMM58gIM819ievnRJG+rAu0BzZcS72HnX6dI57CxXnqSsX0APM9g2BgSLUQ6A3XTXmXouJrVt29QMdjcv5Mwbo4633p7MdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc1CsrmrL+zj3b5dG6bAAr+fmvwQO0CV3AUu2pXaeGU=;
 b=Vblvh4DOnLm+J1jTlN1Z6jEKvP71BjZPdVp9TXJrelf+AlXwfOXCMsgmsl7vx0A4moSefOvYYysjkls4cebuQghiYObaOApFv0UreOKkOmkDLplwGZw6/MgNobBk+IaNy6PNwjurDQpTcleJVPmYpxv8meSH2z1H2VLmMsQtIKggYK/r5LoXRlSQkoUr/r7R8bnp03uKDMzDV2zMzjkpyUCtdRgvGnMY1T54K9S6okQHPBzqh4H97Y5u1qisIL2aWyrUoTF5JLm5VsnIJVMWs9dPEd+moBO3/49q2yyAP0CEgWA9h6AwgHvP5vM5ePuobO2uLuyPTS4HsIbI+XGnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc1CsrmrL+zj3b5dG6bAAr+fmvwQO0CV3AUu2pXaeGU=;
 b=clRohFDW21sqE3klcSC7MFM4TGdU0QeEq8D57AhIND1p3TiV4QM3DO/HjlPSQ8EW0GKF7pLEF4pmsjjUGzlOchGe7zGHTLfgObqj/QUn4ussaMynxJ9ggH3+/mxY/5JfzfYVJTwGah+Hj8mEEtyCOxDXTycORnUFcszZqE5A5fY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 22:48:26 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 22:48:26 +0000
Subject: Re: [PATCH 03/15] drm/i915/guc/slpc: Gate Host RPS when SLPC is
 enabled
To: Matthew Brost <matthew.brost@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-4-vinay.belgaumkar@intel.com>
 <20210727224402.GA49579@DUT151-ICLU.fm.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <b7a66767-507f-ad40-f58b-c61acb87b0e3@intel.com>
Date: Tue, 27 Jul 2021 15:48:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727224402.GA49579@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Tue, 27 Jul 2021 22:48:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24cde4f1-891f-4e61-4078-08d95150a552
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB563664C827FBAFEEC09D0A9385E99@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/l7irRqU+UcBPEiXjYMYXv17nmGtGYieKPVRn2Qd3aZpI3FdtOfa5W041mrgutOps+OQu/qLjL6sMm/3bdW4hbLUrmTaxAR22x3sit0OtLFD5fRI+KTl1JjodXZQLboIdy6ADQFSdetTi9t1zzcLF7eT9VPSyoJql8CBeZkpxqpGn6iOhlnZjKd/NR1rA6Myu2pHlrTGoThUkKYGIpCmJvht3Y/uahYbUkvrMhCpFCF2pScbe3jxuAUfsnX8HNSd1GyzbdQ7r8dB3E4e7u+dCt6CTKAwQF+S7zr0ANgI9VNBahtS3pACHRz6d+poulA6DfYwFqiyuBnCBOYVueg1IzGovFEUiIb2YocHZcH+qJADD3nW080RICs/JvQI7y9vYZQ4EquFngwxOj23QyTOcBbvUgfdOzjilp97UnQOIkWvv3PRbtMv6DjcsNtQ0keWrRu87AkAv4w2KPv+gauEDPuuHNcTBBybMV1drAUrGp4fv4ybZ49QNBfuzBRJl16UBl9GthhE8wB54aWGj5Gwn+hrdXxJ51D3Ew3RxhS40PxpaBIIkj2LDZL/h5LGZE0CwphFhCKWLnKpz4YnzLYiX3/x88rJURJaZqi54KhBLnBRJo+DS7XumaTjk21vjcViHjmd7DwJLDCdp+Ah1zoWVcBxliM6Rcv9dWF9TBURQs0JlWrF4hpcjDK+ej0Trp0ZvwHqW+XPN57EumiB2u90whEsXaRxFtdS2uuTJuKhf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(31686004)(66476007)(6862004)(86362001)(31696002)(53546011)(8936002)(316002)(26005)(6636002)(66946007)(36756003)(16576012)(450100002)(2906002)(83380400001)(107886003)(5660300002)(38100700002)(186003)(508600001)(4326008)(37006003)(2616005)(956004)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRYNm9lLzI0MWFUbk9ibkFGQ3JQSXRLVndmaFFjTGFTMUVONXRDSXl3a1VO?=
 =?utf-8?B?Yk9PWk9ZMUtHVmNocktraUExTTZ1NzdIMTQ3M0JqaW5OQndqOFFSRytVbGFU?=
 =?utf-8?B?RjBYaTQ2cE9WdUF1Q3VDU20vUEF4RmxHNEdZWEJBUnRneUxHSWl0QmNPQlZk?=
 =?utf-8?B?anRiR2dHUXlGcHpEM2tyY2pZeVdXcVU1ZUhSSkJ5Ti9nc1RXV1N0MmVQcElt?=
 =?utf-8?B?aDdPeGp3eSsxUDVSNXRGa3JLNC9kZ2pRdU5tdXZ1TG5YYUNDTC9WQWJxNWpC?=
 =?utf-8?B?MVkweVRETEllZUhvWnJsNUhKcEtHa2RNeklmdC9HVFdwLzNNUjdBQzlmTXZr?=
 =?utf-8?B?c1c1S1c5TTdYb0UxZFNCV2RtYVkrMW51akd5cWRsaXBZT3V1VTBKZkk3ZFdS?=
 =?utf-8?B?bjhSVndTNFBvdlpLSWl1TkJHOGRXb0xuN0xxbmZvNVFsdjF6TVVaZHh1MzNF?=
 =?utf-8?B?MG9yVTh3RHdtS0ZIa0lYQjkyN3RHTWRhbHZGWTlpZ3RWNFg2QVc0SWREMnl4?=
 =?utf-8?B?dmZuM0FNRmVBOXptV0JsM0puTkRuTXc3MFBzbmk5cGhEc2ZWVm1OZmxQU25X?=
 =?utf-8?B?QU5aQlFIUmp1SUoreVV4OHdXT2w5dTI4dmRmbWlqRURnZ2xVZlNUUEpIYzln?=
 =?utf-8?B?cEZ5bmxzNFA0c0JEQUJSMUpBUEFPaTNDK3hpVUJzdGpTRnlhZXhVc2NsQWpM?=
 =?utf-8?B?WCt2ZEtwcnZkZ2dWblFTTzQ2RldxMGl4WXpVLzd1dHVQemJ6OUY1UnQrK1JU?=
 =?utf-8?B?bHNHNzMyUEdSbkZ6c3JHUWF2Qlc3SmcrT2V4M0NDRFBVM1dqTFhYMmNhVUx6?=
 =?utf-8?B?SzNkYnh6cTlvZUgzbDZTNFpYd1hJTzE1QkliK3Rlazl1eE9FY202SW9WM2dR?=
 =?utf-8?B?aytvUTA4STBXZS9DRnlYUEswdUt0U0VrWkExOTlUK0tjMkpuQ2RUTXEwY0Iw?=
 =?utf-8?B?WnpRMThyT2pJRVlGdDlEZnZXaGdSU2o1VDI4OE12RHliVytpUU5qMTlEaWw3?=
 =?utf-8?B?blZRZ1BqT1grdkYwZGYwMlFQWDZZRjhKcE00eTdPazAyVTFVUTMxeEZON1dI?=
 =?utf-8?B?NWNEcEgrcEN3SnV2WEJYeVAvUTRFNGJnYzZlSXVpSFpNSjFvOHUrR1p0SkYr?=
 =?utf-8?B?RG8vMmV0bGRvU2dOYmJNWE40RlJZc2RUUHArSFlOVGUyTlBmZTY2ZXZZQ1kr?=
 =?utf-8?B?ZGkwMmZXRG5IUFlxRnp0VVpzeEpHSUx1UHZBcWxTZmlCOWpPM1FYQ092cDFr?=
 =?utf-8?B?Qk5ndUFWU2xTallVay9TYzBib2NIdjBUNGpzajVTMzVKVG9YcXZBUlMyeXlI?=
 =?utf-8?B?SkE0dUkzNjZlRU1qTStvRm5YckE5Tm5FM0NoaHhvbUNUNGJGVmFLVjgrNG95?=
 =?utf-8?B?UXFMcDBLN09XTzdIL3Y1azBvMXFjbEhKYzZScERROFF2OTVpZ3BiSFl6cHdu?=
 =?utf-8?B?TlhxODYvaXVtL3ppMHpqNFgxSlBOY2NjZXpQcjVDMGYvWVI2ZWhZVFhhQk5N?=
 =?utf-8?B?S3lZbm9US1dBNzEyWUlzc0djalNuTWhQc2kyVk0vTEd6VEhYQUcwRGJEamU3?=
 =?utf-8?B?aG1WOS8zak5tTllkMkQrWk9ZYTFvU2RhMjJITXZXdDA0VkRmYThYR2plWnMx?=
 =?utf-8?B?SW5UdTBiN1E5WjBmK1pUcS8zdG1RcUxSbnY0bFV1eldMUHM3WnVvNUtsOU0y?=
 =?utf-8?B?SnprQmFSWU9JTWdsL0p3T0JpR3R3R3lFZUswcWNPV1NKLzZqTm1WZmpIa2N0?=
 =?utf-8?Q?AML5e0gQi9SHlurCugJJrNXltEaLDC3CRm7vrVX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cde4f1-891f-4e61-4078-08d95150a552
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 22:48:26.4431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu9Fc87wPUnVyt1GI7vnZOWYWITxI0vsQLjnGPnvVPqh2z2arxexIQjayM4Kde93nxMTjvWGMtAWt1t6DvIrSil6vAfA6zNuLiSGyCn35mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 3:44 PM, Matthew Brost wrote:
> On Mon, Jul 26, 2021 at 12:07:48PM -0700, Vinay Belgaumkar wrote:
>> Also ensure uc_init is called before we initialize RPS so that we
>> can check for SLPC support. We do not need to enable up/down
>> interrupts when SLPC is enabled. However, we still need the ARAT
>> interrupt, which will be enabled separately later.
>>
> 
> Do we not need a check for rps_uses_slpc in intel_rps_enable? I guessing
> there is a reason why we don't but can't seem to figure that out.

Yeah, it's due to this check in there -
if (rps->max_freq <= rps->min_freq)
                 /* leave disabled, no room for dynamic reclocking */;

With slpc, rps->max_freq and rps->min freq remain uninitialized, so the 
if condition just falls through and returns with this-
if (!enabled)
                 return;

Thanks,
Vinay.

> 
> Matt
> 
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c  |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 20 ++++++++++++++++++++
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index a64aa43f7cd9..04dd69bcf6cb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -41,8 +41,8 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>>   	intel_gt_init_timelines(gt);
>>   	intel_gt_pm_init_early(gt);
>>   
>> -	intel_rps_init_early(&gt->rps);
>>   	intel_uc_init_early(&gt->uc);
>> +	intel_rps_init_early(&gt->rps);
>>   }
>>   
>>   int intel_gt_probe_lmem(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 0c8e7f2b06f0..e858eeb2c59d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
>>   	return rps_to_gt(rps)->uncore;
>>   }
>>   
>> +static bool rps_uses_slpc(struct intel_rps *rps)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +
>> +	return intel_uc_uses_guc_slpc(&gt->uc);
>> +}
>> +
>>   static u32 rps_pm_sanitize_mask(struct intel_rps *rps, u32 mask)
>>   {
>>   	return mask & ~rps->pm_intrmsk_mbz;
>> @@ -167,6 +174,8 @@ static void rps_enable_interrupts(struct intel_rps *rps)
>>   {
>>   	struct intel_gt *gt = rps_to_gt(rps);
>>   
>> +	GEM_BUG_ON(rps_uses_slpc(rps));
>> +
>>   	GT_TRACE(gt, "interrupts:on rps->pm_events: %x, rps_pm_mask:%x\n",
>>   		 rps->pm_events, rps_pm_mask(rps, rps->last_freq));
>>   
>> @@ -771,6 +780,8 @@ static int gen6_rps_set(struct intel_rps *rps, u8 val)
>>   	struct drm_i915_private *i915 = rps_to_i915(rps);
>>   	u32 swreq;
>>   
>> +	GEM_BUG_ON(rps_uses_slpc(rps));
>> +
>>   	if (GRAPHICS_VER(i915) >= 9)
>>   		swreq = GEN9_FREQUENCY(val);
>>   	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> @@ -861,6 +872,9 @@ void intel_rps_park(struct intel_rps *rps)
>>   {
>>   	int adj;
>>   
>> +	if (!intel_rps_is_enabled(rps))
>> +		return;
>> +
>>   	GEM_BUG_ON(atomic_read(&rps->num_waiters));
>>   
>>   	if (!intel_rps_clear_active(rps))
>> @@ -1829,6 +1843,9 @@ void intel_rps_init(struct intel_rps *rps)
>>   {
>>   	struct drm_i915_private *i915 = rps_to_i915(rps);
>>   
>> +	if (rps_uses_slpc(rps))
>> +		return;
>> +
>>   	if (IS_CHERRYVIEW(i915))
>>   		chv_rps_init(rps);
>>   	else if (IS_VALLEYVIEW(i915))
>> @@ -1885,6 +1902,9 @@ void intel_rps_init(struct intel_rps *rps)
>>   
>>   void intel_rps_sanitize(struct intel_rps *rps)
>>   {
>> +	if (rps_uses_slpc(rps))
>> +		return;
>> +
>>   	if (GRAPHICS_VER(rps_to_i915(rps)) >= 6)
>>   		rps_disable_interrupts(rps);
>>   }
>> -- 
>> 2.25.0
>>
