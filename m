Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFA68A091
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4BC10E7E5;
	Fri,  3 Feb 2023 17:43:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E7010E7E5;
 Fri,  3 Feb 2023 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675446231; x=1706982231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aIycYbsTLUlrdEf4F2elxcX8DCGuxHo8DSnp4E5SGfg=;
 b=XniD0WSgwWSzZbVS/hXghCV56JU50irofWrk8AIFt51QmPNrKhbKm1Ko
 oAyvTxF5ukAWQpYDT7+Mp+fpW/vSVoRLRG1C01P81vxdjKJsu2BPTekMY
 NRQOHYtOwACDNRZj72gCLpodDF+sLQGZH0xvNitAbZbnQ0Qh5iKrz/+F5
 wVUdzyGhIoQ9mMdBGFW2SMdNUcHeLWr7Tbxdsv0cYOHZgwtbH9hkAtP9l
 oUm1M6+ujQdLZSNH+P7IjSLWT26pwtvQkEqybZldO7rLBFezSX0n5T42f
 CtHGCge00Lw3oW6ckLqTWJZT32H5vOBi6u76e25SVPzaVLZcFf/tj0qCI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312461386"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312461386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 09:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643334498"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="643334498"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 09:43:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 09:43:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 09:43:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 09:43:49 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 09:43:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhKn+CdJGsU6V5bBrsAibZm6IlFNl9cXbzAU8h9tXav8y56LgnxBXhV7MpCRZtmDsJ3IlrKbZAvxZFFn915eODij7AmaN22Kc40LYBU9JAhjsa9eWhi7EeJoQu1lT03jnQ0CTBjGFPM6ZLTN6i/LJadylxQsAmFaStRCMq/46z9VfV4ETlWI5V+HODwshTE+8ACIgopt77ogV8+f53Oo8lSPrbESUW6t9nTDOH9ryGzyAUR6teQ8dwt7CrG225F5nchXYJPCs9HgHyYReUzlUV6UvoFoFWu1+L1W1SmLZi1Rh+y9xTuai0YZz4sUq1cr891rZo19M6LlHLjSCjGlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2XR8IJDzv0+dDqh+/+7+/zObDxyD2EaW5nK5vhTxRE=;
 b=I2OsUR3Z6asD2i7MxrYFgyOdV7Fxab4BvDcz9DQlflZ7T5LzmDzvemUMvUpxr01LtTG0nOkqXT/BQlixWicf4Cnh6svpfERPuad/wAFDVrAt4cTOymufUTpQKqHhbNURkemdY7tbBCnMweSGofhjonjOOJeflhzzdclITDfPx4PJdRMZXYqhTVuZJR3i8pYmhoDCZ1YFlzQ37EqmI2vWgCGmaO+8ODh3qMxOc5ZitThIPErNbdkjSwOoSB3pxu1bLFO15SDHJ1TL+i697RYnagQzNi7R3aDseN0r3ljxgfeG+g2YJFwjlXSgfbilvcLPbFNL+LvP2OsO6Fvnv4WUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 17:43:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 17:43:44 +0000
Message-ID: <e3923a36-3bc7-848b-def6-c670cb0a7fb5@intel.com>
Date: Fri, 3 Feb 2023 09:43:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/guc: More debug print updates -
 GuC selftests
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-5-John.C.Harrison@Intel.com>
 <2cca4c1d-39c6-7b3a-0207-4541abf5aff3@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2cca4c1d-39c6-7b3a-0207-4541abf5aff3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f29536-e296-4fb9-4212-08db060e31ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dmj425yJFjHQ30w06FgR0WL17C/naxY1WV66rrK0stThhZKsnzO3FTofk7uPqXTIlU3Pgx79MYoCjnVc6M62wHdfBWl6yVFTdrzu/C6QjWgfPqUNIfQ4bL+locAkBE5n6XItcNW+Y/rEfyEM+FhqkqO4s9m7m/OTAt30tG6lwmp3pViFVSZYSkGjEc3Ahiztx/++GvDds7H4IXq8zHFehL3r55J9i3Yzp7nQC4nFtAKfGeozfU1vUd430gNzM50CuQrvpiNnyR1BWLyrc9tMDn94p3ITUY5cYmVa3ohxk8FJgJGW5+x3sfg0j4zZszfY/IG3I2iwVHWV5B2I+9jauCdLPNmUHod+nZd66chW8KM7wi+P3bahGddVDvZtskYuzsfZO3hxUgaWt/vfMf6wE0sqiVKs+KOZa4Nu5S5m/Uh27Buf07OXfszryGn1BQ6zv3KLOPJKI04YZ8WZ8VxvYfs9s9fxoMuTs/rYoL6U0e1CtIIF07Ex65R2xgC03q/w0bMLlnCA+Q5Nv/9xeqfYMrTPtB9VAwxzYWNUT7BwA4V1MxvPvt0KgieDkV67WhJYqTHMD30t7EeKEAISephtslt4FVB3peEl3p6Q3WuwFjaJi7q9CoGBjH7WoHPdTGtKYCpqPTaMBvO+ntz0hE5S/Cgul0GNml18LflBbssSmlC4wxCGyqrimFzVuG8kZHmIjJqkwDwXdNyrGdhmWn0uZ91QH2AO8vvD9KOElG7f4teoF9tjWjRNTFME3dPmWGL6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199018)(86362001)(31696002)(38100700002)(66556008)(66946007)(66476007)(8676002)(36756003)(450100002)(6486002)(316002)(4326008)(41300700001)(5660300002)(2906002)(30864003)(15650500001)(186003)(82960400001)(8936002)(6512007)(6506007)(478600001)(53546011)(83380400001)(2616005)(26005)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnpwMlpWNVRRK0pzbE5qaW90eko2Y0x5Y2h3V09uL0lYcXNSVzFVWjg4aWVy?=
 =?utf-8?B?NkVMWWNmekJzMHU4L2c1VDhjMmdQTDkxRGcwTDI2czd3TjZrR21QcjRvVmZU?=
 =?utf-8?B?ZUU2enlLd0VYNDlSN3I2eFhjZEJmTUZLU05FL3NWbXc5SDJUblpJbDFmNnI4?=
 =?utf-8?B?c2IwN0ZMSzF2cVJLV09ma1lvblE3TllMYlc4RThiS1QvS0ZzQ3NPdjdnVk16?=
 =?utf-8?B?bFpsdjFpMXhhd2xIMmVwZElDZm1TSitWYWlVa2hoT0RlSXdyL2xTR245RHhX?=
 =?utf-8?B?YmRyV3pYNDdVbExKS0dlTDNPSXBiK0YwSTg2UVFTc0g3NDd4NnZjMzMxdTZW?=
 =?utf-8?B?U1F4c2RJME1MaFkwTVg4VHlaeTZkNlBjc1JtRTkxcmVrRTg3SklQNHZmMjdi?=
 =?utf-8?B?TmMzYm5KWElsaTdnSDNna2hlVUliamJQUU1nZWxTckJDK0g4aU5wL0J4TkdV?=
 =?utf-8?B?YnBIcHNQOFQwbXMxSi9qdXJuVnhxR3NjZlZUWE5ZM1U1TWZ1anJGMlpjZXFz?=
 =?utf-8?B?RXRtVmphV0dkeTZvSUVWUmU4MDZGRHBCZXVDajFOQWtFZlM5NU83SHVQS1FC?=
 =?utf-8?B?NWlNdnllSEhVRGpTS3M5cytUcndQTzlSa3BYc2xIT3grVllmSHRBODhpelAy?=
 =?utf-8?B?OWVNNEtnTjJkWG5CZEkxVGxWeUl2N0VMYnQ5Wk1LVVphcytTczZsZG5URTNt?=
 =?utf-8?B?aDlYTzB6eWJWTS9JR1dKZFIzQmt2Y1NnWFBlZXIzeUpRcGwzNmNKbm41WkFD?=
 =?utf-8?B?akt4TDd4aFFhdFdvZ3VyYU5tT0puZFZYZjFtR1JjcU9JRVRjWGNDU0szMVFT?=
 =?utf-8?B?Q0huVmVVc1NNaVJKczJBaW1ML3BnaDhsYWRuZDEvb2VVbTlRN3FTTGErWDZt?=
 =?utf-8?B?N2dCSzdISUowVW9MaGFrOGlpWFZpWWFvUE9aQmxMdVZLRnZqZWwxWG9aMnVK?=
 =?utf-8?B?d0prY2lNTi93T2FkbmhIeVJJaFhIWUlIazI1bll4WDdtbkVBa1pjUGNBMitQ?=
 =?utf-8?B?cUlUSWdLbm9CK3V5a21QTmkzOFRMeEpjeERkTHJoVFhxUVVBVnZEWUJuWkwy?=
 =?utf-8?B?NkNwTFVpd1laSlVRMDVkYTE3MWpQc2ZRNTZ0L2tlQWptVEluOUJrTTZ4YkYw?=
 =?utf-8?B?aEFUMGZDMldwSW1jTStJN0x2cEVvczFqRGNSRVlsZkRaUjhDUTg3NHJ6alE5?=
 =?utf-8?B?Wm4xTHAzTm5BTVRDaDZwVEhqblE2bW4wT1dTY0dmNVV3c2tHcjlKR1dxRHEv?=
 =?utf-8?B?Zml5SEVNajl6U2tMZjRJN1JmME0vQ0hBbUhqNW8vTG1zMG54Z0R1aW1DL1dk?=
 =?utf-8?B?SmNwMHYycjZNR3hTNks5TnRzQkhudmgrYzRqc1ZSdk9xdlBia0wzeURaQlhw?=
 =?utf-8?B?OXNIdlV3UnZXNDJLeTByM1Y1dFNhSVdrQnZ4eFd1RHpMbnZsT0Jpa1JOc2VO?=
 =?utf-8?B?Q3dVNWlaMUN2VFBYVC9zS2FOVkh3RGJhaTNQcTcwYUdnY0JFV2VsWWF0d3E1?=
 =?utf-8?B?anRxV0d2aktCTDNBREp2aDl6US9td3JxTks3K0N3TCthQ3E5VVhiZVlXMTBR?=
 =?utf-8?B?WWNFQk9nTS9xa1U5ZWtLTWZGNXZPeHVxbUpOeTR5QXFXcmJZaUJRWE1jM0tv?=
 =?utf-8?B?elNHMWYrVU8wZlIyTG5mS081cTVSTzZBaERBWlJnWlpMOUVYdGthaVplK1Q4?=
 =?utf-8?B?UUNOTmRFaGJIUDFSVFNGbVdsVEQ5QU5VMFZxQm9MV1A2ZGtHZURtMHhoMnNo?=
 =?utf-8?B?Z0xvRTVDQS9ieUtGajQ5NXNiZzI2VVpXSzZtZWJvVGNJdmRtVWZncmpjazkx?=
 =?utf-8?B?SzFUUUV1VlpTcEpDUnpueTlQeThPTS9rUExxODFPeU1LYWRIS0tmeWRzYlJU?=
 =?utf-8?B?azVOZXRWTWlMODh6NjFkR3luMk8ycjR5dDkwY3RqTmlvQk1HeGJtU0hYYnl1?=
 =?utf-8?B?SzNFYzZtdTk4Ym1ncHFkSXk4SXUzalhkZndybmRCcmJoeFNPdlhWZUxPci8r?=
 =?utf-8?B?TUFmbVhQdE43YXdBeWJtQmE3aGhHRmRFYno3aTRxNnVXTnlsRXIyRVUyV3Rw?=
 =?utf-8?B?Z1Jvcm1GTTQrYmVsdnJ2M01hbDZ5Q0RUUVlFTnJQQzBvSi9HOEwwZm9ONHZj?=
 =?utf-8?B?TEtTY1RQMWxhOWtBa2t6eDViQU80bmtmdjJ2eUc0Nks0TmZoTjhZTTlCMFFX?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f29536-e296-4fb9-4212-08db060e31ce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 17:43:43.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POtEtPXkbahB255GMH14mSZrgvFoakrdihmSb9LQo4iOfNTuNVNzg/EuNDgdFGKGnw4DFJCA21JcIwqCfg0HS2nx6RgEidoT29KfutvrF0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/2023 01:54, Michal Wajdeczko wrote:
> On 03.02.2023 01:11, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Update a bunch more debug prints to use the new GT based scheme.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 35 ++++++++++---------
>>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 23 ++++++------
>>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 11 +++---
>>   3 files changed, 36 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> index e28518fe8b908..6cc1e9c7a47d6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> @@ -3,6 +3,7 @@
>>    * Copyright �� 2021 Intel Corporation
>>    */
>>   
>> +#include "intel_guc_print.h"
> You've included right headers but then you mostly used gt_xxx() macros
> instead of guc_xxx() ones which IMHO are way more appropriate as we are
> in GuC selftests
Yeah, forgot to go back and change the include.

I started with a blanked update to guc_ instead of drm_ but only then 
realised that the tests do not actually do anything so low level as to 
require access the guc object. Which means having to jump through hoops 
to get to a guc object purely for the purpose of using the guc debug 
functions. Yes, it is a GuC specific selftest but there is no GuC 
specific code in the file and that is really the criteria used for the 
debug print decision.

John.

>
> Michal
>
>>   #include "selftests/igt_spinner.h"
>>   #include "selftests/intel_scheduler_helpers.h"
>>   
>> @@ -65,7 +66,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   		ce = intel_context_create(engine);
>>   		if (IS_ERR(ce)) {
>>   			ret = PTR_ERR(ce);
>> -			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
>> +			gt_err(gt, "Failed to create context, %d: %d\n", i, ret);
>>   			goto err;
>>   		}
>>   
>> @@ -86,7 +87,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   
>>   		if (IS_ERR(rq)) {
>>   			ret = PTR_ERR(rq);
>> -			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
>> +			gt_err(gt, "Failed to create request, %d: %d\n", i, ret);
>>   			goto err;
>>   		}
>>   
>> @@ -96,7 +97,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   	for (i = 0; i < 3; ++i) {
>>   		ret = i915_request_wait(last[i], 0, HZ);
>>   		if (ret < 0) {
>> -			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>> +			gt_err(gt, "Last request failed to complete: %d\n", ret);
>>   			goto err;
>>   		}
>>   		i915_request_put(last[i]);
>> @@ -113,7 +114,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   	/* GT will not idle if G2H are lost */
>>   	ret = intel_gt_wait_for_idle(gt, HZ);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +		gt_err(gt, "GT failed to idle: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -153,7 +154,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   
>>   	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
>>   	if (!ce) {
>> -		drm_err(&gt->i915->drm, "Context array allocation failed\n");
>> +		guc_err(guc, "Context array allocation failed\n");
>>   		return -ENOMEM;
>>   	}
>>   
>> @@ -167,24 +168,24 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	if (IS_ERR(ce[context_index])) {
>>   		ret = PTR_ERR(ce[context_index]);
>>   		ce[context_index] = NULL;
>> -		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>> +		guc_err(guc, "Failed to create context: %d\n", ret);
>>   		goto err_wakeref;
>>   	}
>>   	ret = igt_spinner_init(&spin, engine->gt);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
>> +		guc_err(guc, "Failed to create spinner: %d\n", ret);
>>   		goto err_contexts;
>>   	}
>>   	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
>>   					     MI_ARB_CHECK);
>>   	if (IS_ERR(spin_rq)) {
>>   		ret = PTR_ERR(spin_rq);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		guc_err(guc, "Failed to create spinner request: %d\n", ret);
>>   		goto err_contexts;
>>   	}
>>   	ret = request_add_spin(spin_rq, &spin);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
>> +		guc_err(guc, "Failed to add Spinner request: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -194,7 +195,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   		if (IS_ERR(ce[context_index])) {
>>   			ret = PTR_ERR(ce[context_index--]);
>>   			ce[context_index] = NULL;
>> -			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>> +			guc_err(guc, "Failed to create context: %d\n", ret);
>>   			goto err_spin_rq;
>>   		}
>>   
>> @@ -203,7 +204,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   			ret = PTR_ERR(rq);
>>   			rq = NULL;
>>   			if (ret != -EAGAIN) {
>> -				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
>> +				guc_err(guc, "Failed to create request, %d: %d\n",
>>   					context_index, ret);
>>   				goto err_spin_rq;
>>   			}
>> @@ -218,7 +219,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	igt_spinner_end(&spin);
>>   	ret = intel_selftest_wait_for_rq(spin_rq);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
>> +		guc_err(guc, "Spin request failed to complete: %d\n", ret);
>>   		i915_request_put(last);
>>   		goto err_spin_rq;
>>   	}
>> @@ -230,7 +231,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	ret = i915_request_wait(last, 0, HZ * 30);
>>   	i915_request_put(last);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>> +		guc_err(guc, "Last request failed to complete: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -238,7 +239,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	rq = nop_user_request(ce[context_index], NULL);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
>> +		guc_err(guc, "Failed to steal guc_id, %d: %d\n", context_index, ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -246,20 +247,20 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	ret = i915_request_wait(rq, 0, HZ);
>>   	i915_request_put(rq);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
>> +		guc_err(guc, "Request with stolen guc_id failed to complete: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>>   	/* Wait for idle */
>>   	ret = intel_gt_wait_for_idle(gt, HZ * 30);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +		guc_err(guc, "GT failed to idle: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>>   	/* Verify a guc_id was stolen */
>>   	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
>> -		drm_err(&gt->i915->drm, "No guc_id was stolen");
>> +		guc_err(guc, "No guc_id was stolen");
>>   		ret = -EINVAL;
>>   	} else {
>>   		ret = 0;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> index d91b58f704039..fffe95ac15c4e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2022 Intel Corporation
>>    */
>>   
>> +#include "intel_guc_print.h"
>>   #include "selftests/igt_spinner.h"
>>   #include "selftests/igt_reset.h"
>>   #include "selftests/intel_scheduler_helpers.h"
>> @@ -45,7 +46,7 @@ static int intel_hang_guc(void *arg)
>>   
>>   	ctx = kernel_context(gt->i915, NULL);
>>   	if (IS_ERR(ctx)) {
>> -		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
>> +		gt_err(gt, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
>>   		return PTR_ERR(ctx);
>>   	}
>>   
>> @@ -54,7 +55,7 @@ static int intel_hang_guc(void *arg)
>>   	ce = intel_context_create(engine);
>>   	if (IS_ERR(ce)) {
>>   		ret = PTR_ERR(ce);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner request: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -63,13 +64,13 @@ static int intel_hang_guc(void *arg)
>>   	old_beat = engine->props.heartbeat_interval_ms;
>>   	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
>> +		gt_err(gt, "Failed to boost heatbeat interval: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>>   	ret = igt_spinner_init(&spin, engine->gt);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -77,28 +78,28 @@ static int intel_hang_guc(void *arg)
>>   	intel_context_put(ce);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner request: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	ret = request_add_spin(rq, &spin);
>>   	if (ret) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to add Spinner request: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	ret = intel_reset_guc(gt);
>>   	if (ret) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
>> +		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
>>   	if (!(guc_status & GS_MIA_IN_RESET)) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
>> +		gt_err(gt, "Failed to reset GuC: status = 0x%08X\n", guc_status);
>>   		ret = -EIO;
>>   		goto err_spin;
>>   	}
>> @@ -107,12 +108,12 @@ static int intel_hang_guc(void *arg)
>>   	ret = intel_selftest_wait_for_rq(rq);
>>   	i915_request_put(rq);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
>> +		gt_err(gt, "Request failed to complete: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	if (i915_reset_count(global) == reset_count) {
>> -		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
>> +		gt_err(gt, "Failed to record a GPU reset\n");
>>   		ret = -EINVAL;
>>   		goto err_spin;
>>   	}
>> @@ -132,7 +133,7 @@ static int intel_hang_guc(void *arg)
>>   		ret = intel_selftest_wait_for_rq(rq);
>>   		i915_request_put(rq);
>>   		if (ret) {
>> -			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
>> +			gt_err(gt, "No-op failed to complete: %d\n", ret);
>>   			goto err;
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> index d17982c36d256..0e64be0918ae5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> @@ -3,6 +3,7 @@
>>    * Copyright �� 2019 Intel Corporation
>>    */
>>   
>> +#include "intel_guc_print.h"
>>   #include "selftests/igt_spinner.h"
>>   #include "selftests/igt_reset.h"
>>   #include "selftests/intel_scheduler_helpers.h"
>> @@ -115,30 +116,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
>>   
>>   	parent = multi_lrc_create_parent(gt, class, 0);
>>   	if (IS_ERR(parent)) {
>> -		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
>> +		gt_err(gt, "Failed creating contexts: %ld\n", PTR_ERR(parent));
>>   		return PTR_ERR(parent);
>>   	} else if (!parent) {
>> -		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
>> +		gt_dbg(gt, "Not enough engines in class: %d\n", class);
>>   		return 0;
>>   	}
>>   
>>   	rq = multi_lrc_nop_request(parent);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
>> +		gt_err(gt, "Failed creating requests: %d\n", ret);
>>   		goto out;
>>   	}
>>   
>>   	ret = intel_selftest_wait_for_rq(rq);
>>   	if (ret)
>> -		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
>> +		gt_err(gt, "Failed waiting on request: %d\n", ret);
>>   
>>   	i915_request_put(rq);
>>   
>>   	if (ret >= 0) {
>>   		ret = intel_gt_wait_for_idle(gt, HZ * 5);
>>   		if (ret < 0)
>> -			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +			gt_err(gt, "GT failed to idle: %d\n", ret);
>>   	}
>>   
>>   out:

