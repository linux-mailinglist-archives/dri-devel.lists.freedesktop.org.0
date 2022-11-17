Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019A62D390
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 07:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98D10E544;
	Thu, 17 Nov 2022 06:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D2510E544;
 Thu, 17 Nov 2022 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668667533; x=1700203533;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jTOHuOoOyW6SMgi3Yh56jH5UpXN7qAR6D8IvBKW73Hs=;
 b=FGjC6M1ExzZQy2+6yqhFq2k8cQVKmaZyX2ZlBSwA/v+X4VqCRiL1Y1XI
 RcbeDMK4wt+27paQ/HgqIuERmCVbYs+NBA5yCWqVX9lXcv1qqpk3ifK1s
 pb52Iu+mbGOXrtJPMX/qEpQxCFjdgc+o0fSkhqQFR+RXCNDHZ6+qIyT4d
 f2wNeSH4yJgtK02GH26rnIiASYQW//AAqnPK6DOU+Rt0N2+rJjRFZETVK
 Yl2bfxxuf92hXH3uQrNgV/7guwtXgTaLqlovfxLaabnzx9GNT0o7wAtF4
 ThbtuvwCpJ8nIc+GP44+lQnlDXEzB2L0soSeS+CHpEZ/HJWolBAuQ7CfR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292479464"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="292479464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 22:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="728704635"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="728704635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2022 22:45:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 22:45:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 22:45:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 22:45:32 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 22:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6xZQB92Y3gCTu0G6XTiJcgojCGf7SoCSNEKyyysabaTmylEZJTCoFgBPXb3oxmFVcHxF510wSmlQE9W2UzjFxYkn2gfzqSLJeQVO5LgZNLcujk80bx0RaKOtQs/oWaXdu8ApvdVAY+dH0k0StwJ2sOQ7l476X1sv3q3QSPkoP/zlJtpd6wxhR+MUpJFJ4dxsXWxKOqfOi9C115kEX569SJx8cap3GCtYJme9VvrjYr+uHmZPV68dOIvwNXUpcmf6rU+jYssn8f4COQya8BPKRRHvpuSdkauVLlo+XbgzgFhJWCndrQgC0/sZf5uCH5kHebMug+7TD3KO3y5jUwaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4to2JaTbMdGplp5AQxcLxN4l++lDjEHO6DBYASVY/aY=;
 b=dMLcTDPoFsjqr2I8HYrapta/9nwxk6TpAEnlWZbfEXQi3Ma/0pELCLst4JFKUGaxjj+MdQgQCAcJdnVHwMbkWm8wED/SleRtFyj1iEH7XXmzIcfOXJWhZQ7iyKWWB5algnfhsXLX4qYTvUswmokcTvFABaUFpWJFR5pMTvF3kEThxRID/N5P/6dDWFCcNp4Nh6lB3sJB+zfaGTAFVOO22x2Sino2fIW7q/rMR77+ZOq6WodsQRrLpVQQ5FrGXqagCL0HLNJK4lOBOnRhKcASPQDs+u12np6HRibn2Gntm/MkNUqUu+AcsK84fW1D8HczbeYnehqklyD8JMD1SiE/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 06:45:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf%8]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 06:45:30 +0000
Message-ID: <ec84875d-b1b0-407c-dd71-c7b628095fa7@intel.com>
Date: Thu, 17 Nov 2022 12:15:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
 <Y3Ov2jrHAqnIDGUs@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Y3Ov2jrHAqnIDGUs@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: a8791a93-8ba6-4d0d-3f6f-08dac86750bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVqX9F/z3cyM6Ob6gYfTo3nVI0oAUS2VHriu9MpnDVBDUcSeVugNj/vEyoURY2fDHZDJ3/19WhGdCvy2DrNcnYj51eywN1c95WBviebM0t2JKzqYs+YEBfKF2dpBxrIypxLBzOpcMN6csxj2rt1nKRbQF4t23FzIh3yUUUfBJyprk366n1lobK5sCeYIA7VEoz8j/zWWun1bPM3D9vxfJfFG9n8FfVYiSq8brdCxyUFgB2oxQqrIrJ8mbulXvkUhH7w68jK6trBsoT58HoMnddnXrCUjeKFNiCP3PAFQ6OcT25+H+mCBle/4TB/qs8turUHMd2fhhjwIdgjMKRGwuM9dyTsJICu6RSSIoyqbuupEaJkL2TkB5d6SmCHcWqW6VfteoJrB8oZcNMgI+mduZCSqN7Lvg0yAG17LJQplkl9EKTWcm9LpX4OlBUQ46mg3bmuRat7zBVpT/pi+UcIEeBYRZSvkq2EGShaJDiBl7IZInphOWxbkHxlTcFaQL2H8Vbt3lnqAlihxXew6ADw9/RrcoEVnPqEkNLR9jsl0KIAR0RUhSeBPuaKonyM4C0nligbPvLeriBtn1Rw5Hin3wGbuvh6sj2x9Y7oUl6Oiko2M7xTpKRxfTSiywrrvnr/d7rnpAeaaqlo7cq+Vm5DpGap3s7F1DeXeKW3LtFyhIvgUI4pXaJWXw50pCUqAgEdljkKxQzZc1lzxrNeoZ3GIWKTGw6rRL7vcJM9jwDMFU7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(38100700002)(82960400001)(31686004)(36756003)(6636002)(4326008)(316002)(450100002)(66946007)(37006003)(66476007)(8676002)(41300700001)(6512007)(5660300002)(2906002)(66556008)(8936002)(6862004)(6486002)(86362001)(31696002)(2616005)(26005)(6506007)(83380400001)(6666004)(478600001)(53546011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRaeGQxamdpcXkzZ0dkWFlnNHVpZHdoQzR5by8vTlhVam0vMThNTERtWFI3?=
 =?utf-8?B?TWJtNkc1TXBhTjVkSHkzZWt3KzJ6SS9RamZuNGFzSzJoZ0ZZWlhncmpCY0pp?=
 =?utf-8?B?VGxHTUI3bXNXcGFVS1hPWTZRSExKSHI1Vm5lQzdWVXFZb2tOdUxqRVhwcFlH?=
 =?utf-8?B?M2lmY05ya3F4QkQxbytjdS9oUnVSWTlaME9mYzlvenQzODJjRldQTlJ4RTlW?=
 =?utf-8?B?TUxkSDRwU29PR1VlUlBSNTJocitreS9EdzRJWWRya29aSjczU21HUGlEVUZD?=
 =?utf-8?B?UExKV0Z3UnpuRUFiNjZ1eXN2VWYwaWFrLzRoOXFGeGhEbGNQYnJuNkxWMEo4?=
 =?utf-8?B?L3JZVXVVZi9aYjllNUhvZ2hBOUNEcFAxaVZiUSttbzBRdnNsRys5T0hibE9N?=
 =?utf-8?B?OVRPK1VYcERkU2ZPT0ZEUVgvK3ErREw5SjBpVllqZWJjRVVQUjRSWjRWWHBk?=
 =?utf-8?B?QnlvM3BMc00xalhDR2M5eGY4N0pBN0NhODFIaitPRVh1OG1USzFKcXVqb2JJ?=
 =?utf-8?B?QmFMOWlJODJkTENOVzB4aFlDUGFNM1psQTBlR0YxUmh5Umg0NlhEMXFjeFlX?=
 =?utf-8?B?STZKY1hxRXRaTUJxSS9OTGhCdm5QTGxyUGlVRzdDSy8zMDJtd2pPSCtNZzk2?=
 =?utf-8?B?b0pZanA5NDVKRFVLWEUxWUtva1dSTEduc3VsMktWVEFnZ3dBc0UrR0Z5TDFp?=
 =?utf-8?B?WllkUjRBVnY4dGduNWtMTXBQbzVZZlhxTGV3TGx5Qmp6YVhOd21CR3V5Y1E3?=
 =?utf-8?B?c0oxN3U4UTRuUlNOUVNJVnpVRHR0MXMra01aeVd4QzBJY21obDRQUms3Slcw?=
 =?utf-8?B?Z1NkZWtpNG1mMisvWUd1TkxYbVFmeW1zTHROSzFqNE9iWXNHY3FmOUFKSmg4?=
 =?utf-8?B?ZUZ4ZWFGcXJTTUo3N3E0QmJWcG5seXFGVjVTenFXMWRyUnpyQXVzYmcrOHZx?=
 =?utf-8?B?c1ZtNTNPREhaazNiLzllL0FNajZhcjVlZi9tbW1KN3BkSU4yN1d6eVRTbGY4?=
 =?utf-8?B?dzdMZy9NcUFVWVE0aDRVUlorQ0lBNldaRkZlNlNXeFNpNzhobCtUUFZ0ZGJI?=
 =?utf-8?B?R0JkbE12QkUwQTY1Q28wNER3UmtDWnptT0VsRFNoZ2VOL3ArektJRy9IZWpw?=
 =?utf-8?B?R2p0MWJGZUJvKytWbldHTjN4TlBKclFqak5ucUs4bk92ditMYWgvc1lNUnlT?=
 =?utf-8?B?UXRHdjlPL0xoZG1wRHdDRDNBSlkrNHVDenRPL1I4ZUxBSHhvUVFXcHo3NHor?=
 =?utf-8?B?V3NJR0ErSnlqQ20yNTdUdG5TcG1BR0NMTnpiVjVZWVB5R2JNRWtmRDJsVlY0?=
 =?utf-8?B?UnAxeWk4cnJZQlZKM3BlU0wwRlJmbHFYdDhXU0VzakhkKzlVd3hrbjJlakE5?=
 =?utf-8?B?Mlo1VHpJYTVEVnBLTHV1MnNQSlpNQzBIUmE1U2dyU2xreXBuZlljZE5CQnBX?=
 =?utf-8?B?dHgyVDFycFJIUjJ2TWJjK1pVMUVSb0xMcW1Ocmt3UGtrWkZYVEhDN3g5STJr?=
 =?utf-8?B?ZnprQ21URi9YUmlMdnlFNERWUnM1OWFCUjlyYzBiTWkxMlFmNFVOSkhFOGFN?=
 =?utf-8?B?RE5qU3BpcnZoem0vaHUzMkVJbDNnem9mcllrS01SajYvZW9rcWVpcjNUY0hE?=
 =?utf-8?B?RVpqbEd4QmswVytGM3kxVUVicG0vOWYvSzBaMHRnM3lSZTY5SXJFMFVJbXF5?=
 =?utf-8?B?dFExODc3YkZWK3RDWEF1U1dLVms5NTUrK3h6N2hhM3pHZ1pOWjJmOFNKWkU2?=
 =?utf-8?B?R04wNDhmR05vRVRmNXdodVBJUUJYM1BZdUlkK1BYK2lkcDYzdXJYMC9ZdVhD?=
 =?utf-8?B?Y3FVSHdIV3VVVEdxNm1Hb1NjdFZnRTV0WFpONFgzZU9HcHZLQURtSjY3NEpD?=
 =?utf-8?B?cFNHcVRKRmVISERyZjVNcGRlYWI3MlM2Y3dLUThBQWFDNGNWeG9EY3QyWmYy?=
 =?utf-8?B?NHVzd2QrNDJMaVpYUFlJeHRIRVpJSDhjVWRLUEZvdVFJMzNTdFFtZWx0N2E4?=
 =?utf-8?B?N2Z5N0dIVGQxSm1qRmlza0hUQmpyUlgrUUUxM21sZXRRYVoyQnNjWTNPZDlw?=
 =?utf-8?B?RndVc2E5SlEzWkEwbVpPY3hQNlhHeTNIdW1ITFV2L0xiR2s4bVJEdjZ1RlRm?=
 =?utf-8?B?SUtWUks0cmY0NkZKV2l3MS9Ib0NEM1hiUHN6Y1dLVlo5YzlHdU9teEI2bEFO?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8791a93-8ba6-4d0d-3f6f-08dac86750bf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 06:45:30.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dtjq7RwPE7pIjadmVUOJarVYBbIZyZr2yq7JtZoca/UQslA0IDU+GHWOOJGSqTTuTmu3/ZDs1jULsFj6RMTB/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 15-11-2022 20:57, Rodrigo Vivi wrote:
> On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
>> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
>> entry on media tile idle messaging need to be enabled.
>>
>> v2:
>>   - Fix review comments (Vinay)
>>   - Set GSC idle hysterisis to 5 us (Badal)
> 
> btw, no need for the cover letter in single/standalone patches.
> This history here is enough.
Sure, next revision I will take care of this.
> 
>>
>> Bspec: 71496
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index b0a4a2dbe3ee..5522885b2db0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -15,6 +15,22 @@
>>   #include "intel_rc6.h"
>>   #include "intel_ring.h"
>>   #include "shmem_utils.h"
>> +#include "intel_gt_regs.h"
>> +
>> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
>> +{
>> +	struct drm_i915_private *i915 = engine->i915;
>> +
>> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
>> +		intel_uncore_write(engine->gt->uncore,
>> +				   RC_PSMI_CTRL_GSCCS,
>> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
>> +		/* 5 us hysterisis */
> 
> typo
> 
>> +		intel_uncore_write(engine->gt->uncore,
>> +				   PWRCTX_MAXCNT_GSCCS,
>> +				   0xA);
> 
> you said 5 above, but used 10 here, why?
Bspec:71496 specifies 0xA = 5us.
> 
>> +	}
>> +}
>>   
>>   static void dbg_poison_ce(struct intel_context *ce)
>>   {
>> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>>   
>>   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>>   	intel_engine_init_heartbeat(engine);
>> +
>> +	intel_gsc_idle_msg_enable(engine);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 07031e03f80c..20472eb15364 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -913,6 +913,10 @@
>>   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>>   #define  MSG_IDLE_FW_SHIFT	9
>>   
>> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
>> +#define	  IDLE_MSG_DISABLE	BIT(0)
> 
> REG_BIT should be preferred.
I will take care of this and above comments in next revision.

Regards,
Badal
> 
>> +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
>> +
>>   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>>   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>>   
>> -- 
>> 2.25.1
>>
