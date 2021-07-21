Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8D3D064F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 03:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39CF6E83B;
	Wed, 21 Jul 2021 01:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3016E839;
 Wed, 21 Jul 2021 01:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209451422"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209451422"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 18:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="454273648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 20 Jul 2021 18:11:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 18:11:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 18:11:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 18:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxaiIOgB0KSO+w4CP86WEMBDWYujfIg+8EYZYHEh6CxsaraFE7XyparQ4clgODhX/z6DEv9Bj6Z5/GS/BkuSodTdqZcX2V/INEp+PTTrl7NYFzmZks3VZgdIVbQ2woWF72joRXsUFeTy1U+XgfFWavPB5kMSlTKNMNoYHQErBMZLXvTu005uI4Go6LSQNzg76oLq9PhfkMyhOt/hmRlwi+s68KtY+QgSNr4J/ue20WuKaVBcQdB0LcW9apfCRynsvOXgqBsdTeur4EIIch0KujLWjIJnVEubuE9DgwG10dR0sjf2WhF+A8L8CHXtJwSfI3xB+AwB6uOZ0Dc6p4j7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4feO5UJS/cbATlEIGCm+w2CvnZ6trez9ylFzmhL81o=;
 b=goWEpSi0Diova3Wm+2PCijEeT20d3IMx2p+x8E5QIuwOWjui/GkBEVRO7hur6b7f7/tvuM0TaP5qSK3iTPipgOG+Gu/GDqntjEIfjCCELBJLNWXlUI83sPTqsXoEPMAlWvtIhy+p6OyaFD6Ft4pCsA/xNQxusGxlQV10cwvkYl5rCDXE53CENQExL5Xe+GqvP/SefEfYTZMRMmLCZErnP6BA51KFiBfBu7H8UXDle74wO9+JFGrl+FgrazknseWYMyVeAgyZdJtdwbQEU1XEhv7DuMMK8vCzYK9WnfJTJeWNwJKEw/appb++L83L0QuJogB1W3L76fU9h8V3ejb8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4feO5UJS/cbATlEIGCm+w2CvnZ6trez9ylFzmhL81o=;
 b=kZm0vpqw6APage4RQ1+oJ8oTszEzB80ELZ6s4MbQ0oHQzlYjmncKz+hqh8EXxqH9MSavm3D60q/uE1cgdRqNLxLlmUB25Sx8FqefK7mZpHuwvGWMVQMxkQzbLmkh3Gzkjz4i+48WYKCrskx/dusTDOO+JldKLhaw/O8oblRKgJc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 01:11:44 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 01:11:44 +0000
Subject: Re: [Intel-gfx] [PATCH 16/16] drm/i915/guc/rc: Setup and enable GUCRC
 feature
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-17-vinay.belgaumkar@intel.com>
 <36320288-c921-007d-20db-c2b29812b968@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <ef0c6519-6492-8163-fab6-de06bfced6ba@intel.com>
Date: Tue, 20 Jul 2021 18:11:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <36320288-c921-007d-20db-c2b29812b968@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 01:11:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 492d77a8-c642-42fb-c495-08d94be48137
X-MS-TrafficTypeDiagnostic: CO6PR11MB5571:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5571F45358B835B8427C258685E39@CO6PR11MB5571.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kuiCKwLcQ+rLvIZwbFYAaduElqIV2zd2RZNLfNJWYyMxaFTotwiQ1JSRx5XUr2dkP4LU4AaIDfKh8HcOOvxH92Be/1Qz0og9bIiFP+Irj+U6RNJyzk3J/aRa3Hxks7LEtCWK99s9OSejS/6KbyX9aijbkV2d3cADRmnvjTuR8/mdLjc3xheemS6BxDrjft5jcgaGG+tTcvDxgXs9QQdjFfTMshq0q+HZltm/4ur4CKB/2jYdPRjyWkcBE0S1eClbiAafmPeV/VxpL0Os+7rFQDac3ioJjL8NgTgqi76PMI02bucZnqNDbjCEoEdHV9D6Kh17Lfdr9kjjQGAYN7bosxYouCB2vmgXTIA4IgTfdDUlgG0E1B8q7660DC52R7PuLg8r8UYAW8btfU0GT7UOtqXXvzN3l5okSFmGGR0sZrnl1FtrytEq1sWLf7ZNuatf10UZQuug7wM7ZEpNd+aPWL4IFUXxmTSy3TNUNWoxWuhmlT3nVAeFM0NIN5UkqBLgRL7pCLiBu9mfgggErTQs3gu3TYMRkrpsERcWpDLc6+CyMmijFEqN9RdTcm2eiHdi8fgM2zod7CfBq8Iqi63+Dby8XO11FrdMjF50JaHLaoM1rJYC+Bd4nwKCX7qqAci0JqdRMUHgn4M7qXbv1HlmV9Jvo+aZPusqKmN7hmJ0z2ETsmBRQTNumpeueeqnaxqAJfdm3G6UoWmkNMv/0HCzfhxXKhjgwzRcxseW8FvRueVNdhE3VPn3JbXOgA1/9T2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(31696002)(478600001)(450100002)(6486002)(83380400001)(53546011)(38100700002)(31686004)(36756003)(26005)(186003)(66476007)(86362001)(2616005)(8936002)(2906002)(5660300002)(8676002)(66946007)(956004)(66556008)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlGZ0h4VjVpTWN2dG9pMkJDTDVLaTNoT2U2L2plazU5SjJzcmhMRzhBN0h3?=
 =?utf-8?B?WVBBbm9haUd1Z1VockhSUmFHRUlUVDZXTkFzblg2TlFvUmR6cE9rUVVUZW9k?=
 =?utf-8?B?NUhEVlF6Ukh6UjA0bnFpaUdlemdqVUhvdVVkd1BZeEJ1S2g2R3NXYndDZDhn?=
 =?utf-8?B?Zms0QlJKMHFvNUp2cGtwTGVySkltM0VubXkvL0p5b3RqTEhJc21lWFV6SnFa?=
 =?utf-8?B?N1NPVElkRW1JWUFiRnZRK3BuaVV0aUg5VTM2V29NM3V4L0o4L1hGZXgrMmpI?=
 =?utf-8?B?NGRybnk4UkRQalNzeDZYKytaU2M3QjM5NDFaTjRISlBHNGJIa2pONDBPQXZG?=
 =?utf-8?B?aXZoKzhIUkdmaUpET01JUnMxR1FHTmRhUlc3czlBclFmTjlCNmJmT3N6TFQ4?=
 =?utf-8?B?Umx6K2RsM1Q0ZXRyenpPcHRrRXJLOVhRRXRlODMzN0xrcFhXazFIRyswWDNV?=
 =?utf-8?B?SlFiQ0JZejB4TGtid2V3N2lCM1hMZHNiYkt6VWcvWFNzb2pGZG16VGNFTFB6?=
 =?utf-8?B?OTBjaVFsbUI1T1UycDZCUmNoTnFhYVh3OHRXRUxxRzJWTkpPVTEzelB4OGxl?=
 =?utf-8?B?NDgwcmhXWVNnNk5RdnJtWW9saU91V1FReVMwK1J3eW91cWVjSGR4N1JRdHVh?=
 =?utf-8?B?YWlWVk03TUlEeWJtVU9LWk5wajhRZEVtR0JpeUlPV2Fiazc3YVF5OUFQNEM4?=
 =?utf-8?B?RVhWUjZ4elFrT0V0Y2ZkbnNQRm4zMldTOW9DRHFOblhrNWw4MU8yMGpyMElm?=
 =?utf-8?B?NjZ5Ym1SSDB2aXphK040UnZsbjYyN2hOV1dWM3A4MWRnbkR6M2JjMG1sdFNn?=
 =?utf-8?B?R3p4NTBxZTA1N0dybEZ2M0t5Q2luVmsvWS9QcFdLSXUxa083RUFJY2swV1lM?=
 =?utf-8?B?dmwwWm05cTg4cElNWmNqRE5Ga05uN0oyV2MwQmtnYWNUN0NpaFpFRVFibXVO?=
 =?utf-8?B?YWJ5a2ZSTlNycjFHRFdLMytKc0tCUUVPdzVtRGtNd0o2Q2ljcWZJQVlkU0Zl?=
 =?utf-8?B?K1FBTk5hSm1EZzE1dlJJd28xaXc5R1RUMm9ZTzRzbDd0U1pSRjZJZlA1VHgy?=
 =?utf-8?B?YmhsY3A5S1oyNDFKbTdYejJKdTZlZ3lEWldtbnQ3UVBTSG4xTnM5NHFKbWRi?=
 =?utf-8?B?M2JSU201Y1VnWDBSTndLakRZQnVqRjZnVHNUaDJKR3VvekJVeldkbm5MdENm?=
 =?utf-8?B?ais5MDFhdkVYNFd4RUtEWmROTEFWdU02c01BKy9xbmszTklTQ0FkRDVMbVJF?=
 =?utf-8?B?WXMyQ3lkZ2ZUTENzR3pqbEJLNjNoZ0FuT1ZDSFJuNjlTWkRsMXRxN2laZGoy?=
 =?utf-8?B?OThoek5Ea1JwQjBIMWpJL3d1ZXBUNlhaOTNKcGk5Qkh5U1BWd0ZvN0hLMXls?=
 =?utf-8?B?T0l3dldrZkxhR3BRVnYwV1B6MThOaEZLQWZ2SWIvbkVlSzgwaDV5KzNtM1Zi?=
 =?utf-8?B?R1VjRXliUnZ2YkpMZWM2RUJOSnEzS2RkOWZ2Q0NtYTVmWTVrdnAzZ25CbTFZ?=
 =?utf-8?B?eU5MNUpDekhaNm9pY2lXU1BBTVdaa3ZNNk4vTC8wOXY1ckpEREZwd1lqMmFI?=
 =?utf-8?B?QVlUQUdJUWt1WjRMNWZadTluNjR4WUgyQ2pLcSt2R3ZIamd6ZnJYQWRTeGpT?=
 =?utf-8?B?bXgxOHlpMFZDRTFDd0I4czB6MlI4QWR4bjlKUjZiZ0xkcHVBRW8yUDc4MEtq?=
 =?utf-8?B?NE0wZklTYWZSM0lkZFpsL1NFRjhlamRyR1ZoM2lrdFJFd0RETDFQa3ZHOVN1?=
 =?utf-8?Q?r8sfyh3+KJeFUEXkXbrQCfw0ACGNuRskUvfj3/L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 492d77a8-c642-42fb-c495-08d94be48137
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 01:11:44.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8fO7jpAcaSW/a7AKaw90Z5pfA1zLI1GEIkOTkYLFHbuBUxDdz2Q+Fmv4MDhZm+8naUzacvixVZFBrzweopo+iFjXx0mH4vg7s7NN+VIyeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2021 11:41 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> This feature hands over the control of HW RC6 to the GUC.
>> GUC decides when to put HW into RC6 based on it's internal
>> busyness algorithms.
>>
>> GUCRC needs GUC submission to be enabled, and only
>> supported on Gen12+ for now.
>>
>> When GUCRC is enabled, do not set HW RC6. Use a H2G message
>> to tell guc to enable GUCRC. When disabling RC6, tell guc to
> 
> s/GUC/GuC
> s/guc/GuC

Done.

> 
>> revert RC6 control back to KMD.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   drivers/gpu/drm/i915/gt/intel_rc6.c           | 22 ++++--
>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  6 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     | 79 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     | 32 ++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
>>   8 files changed, 140 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index d8eac4468df9..3fc17f20d88e 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_guc_fw.o \
>>   	  gt/uc/intel_guc_log.o \
>>   	  gt/uc/intel_guc_log_debugfs.o \
>> +	  gt/uc/intel_guc_rc.o \
>>   	  gt/uc/intel_guc_slpc.o \
>>   	  gt/uc/intel_guc_submission.o \
>>   	  gt/uc/intel_huc.o \
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
>> index 259d7eb4e165..299fcf10b04b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
>> @@ -98,11 +98,19 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
>>   	set(uncore, GEN9_MEDIA_PG_IDLE_HYSTERESIS, 60);
>>   	set(uncore, GEN9_RENDER_PG_IDLE_HYSTERESIS, 60);
>>   
>> -	/* 3a: Enable RC6 */
>> -	rc6->ctl_enable =
>> -		GEN6_RC_CTL_HW_ENABLE |
>> -		GEN6_RC_CTL_RC6_ENABLE |
>> -		GEN6_RC_CTL_EI_MODE(1);
>> +	/* 3a: Enable RC6
>> +	 *
>> +	 * With GUCRC, we do not enable bit 31 of RC_CTL,
>> +	 * thus allowing GuC to control RC6 entry/exit fully instead.
>> +	 * We will not set the HW ENABLE and EI bits
>> +	 */
>> +	if (!intel_guc_rc_enable(&gt->uc.guc))
>> +		rc6->ctl_enable = GEN6_RC_CTL_RC6_ENABLE;
>> +	else
>> +		rc6->ctl_enable =
>> +			GEN6_RC_CTL_HW_ENABLE |
>> +			GEN6_RC_CTL_RC6_ENABLE |
>> +			GEN6_RC_CTL_EI_MODE(1);
>>   
>>   	pg_enable =
>>   		GEN9_RENDER_PG_ENABLE |
>> @@ -513,6 +521,10 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>>   {
>>   	struct drm_i915_private *i915 = rc6_to_i915(rc6);
>>   	struct intel_uncore *uncore = rc6_to_uncore(rc6);
>> +	struct intel_gt *gt = rc6_to_gt(rc6);
>> +
>> +	/* Take control of RC6 back from GuC */
>> +	intel_guc_rc_disable(&gt->uc.guc);
>>   
>>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>   	if (GRAPHICS_VER(i915) >= 9)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> index 596cf4b818e5..2ddb9cdc0a59 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> @@ -136,6 +136,7 @@ enum intel_guc_action {
>>   	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>>   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>>   	INTEL_GUC_ACTION_SLPC_REQUEST = 0x3003,
>> +	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>>   	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>> @@ -146,6 +147,11 @@ enum intel_guc_action {
>>   	INTEL_GUC_ACTION_LIMIT
>>   };
>>   
>> +enum intel_guc_rc_options {
>> +	INTEL_GUCRC_HOST_CONTROL,
>> +	INTEL_GUCRC_FIRMWARE_CONTROL,
>> +};
>> +
>>   enum intel_guc_preempt_options {
>>   	INTEL_GUC_PREEMPT_OPTION_DROP_WORK_Q = 0x4,
>>   	INTEL_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 82863a9bc8e8..0d55b24f7c67 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -158,6 +158,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	intel_guc_log_init_early(&guc->log);
>>   	intel_guc_submission_init_early(guc);
>>   	intel_guc_slpc_init_early(guc);
>> +	intel_guc_rc_init_early(guc);
>>   
>>   	mutex_init(&guc->send_mutex);
>>   	spin_lock_init(&guc->irq_lock);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 0dbbd9cf553f..592d52e5e93c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -59,6 +59,8 @@ struct intel_guc {
>>   
>>   	bool submission_supported;
>>   	bool submission_selected;
>> +	bool rc_supported;
>> +	bool rc_selected;
>>   	bool slpc_supported;
>>   	bool slpc_selected;
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> new file mode 100644
>> index 000000000000..45b61432c56d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -0,0 +1,79 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2020 Intel Corporation
> 
> 2021

Done.
> 
>> +*/
> 
> unaligned *

done.

> 
>> +
>> +#include "intel_guc_rc.h"
>> +#include "gt/intel_gt.h"
>> +#include "i915_drv.h"
>> +
>> +static bool __guc_rc_supported(struct intel_guc *guc)
>> +{
>> +	/* GuC RC is unavailable for pre-Gen12 */
>> +	return guc->submission_supported &&
>> +		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +}
>> +
>> +static bool __guc_rc_selected(struct intel_guc *guc)
>> +{
>> +	if (!intel_guc_rc_is_supported(guc))
>> +		return false;
>> +
>> +	return guc->submission_selected;
>> +}
>> +
>> +void intel_guc_rc_init_early(struct intel_guc *guc)
>> +{
>> +	guc->rc_supported = __guc_rc_supported(guc);
>> +	guc->rc_selected = __guc_rc_selected(guc);
>> +}
>> +
>> +static int guc_action_control_gucrc(struct intel_guc *guc, bool enable)
>> +{
>> +	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
>> +	u32 rc_mode = enable ? INTEL_GUCRC_FIRMWARE_CONTROL :
>> +				INTEL_GUCRC_HOST_CONTROL;
>> +	u32 action[] = {
>> +		INTEL_GUC_ACTION_SETUP_PC_GUCRC,
>> +		rc_mode
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, action, ARRAY_SIZE(action));
>> +	if (ret)
> 
> since intel_guc_send() may return non-zero value from data0 RESPONSE
> field, assuming that this action expects there MBZ this should be:
> 
> 	ret = ret > 0 ? -EPROTO : ret;
> 
> otherwise some static code analyzers might complain
> 
>> +		drm_err(drm, "Failed to set GUCRC mode(%d), err=%d\n",
> 
> you may want to print error with %pe
> and move this message to __guc_rc_control because of the above

Ok, done.

> 
>> +			rc_mode, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __guc_rc_control(struct intel_guc *guc, bool enable)
>> +{
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +	int ret;
>> +
>> +	if (!intel_uc_uses_guc_rc(&gt->uc))
>> +		return -ENOTSUPP;
>> +
>> +	if (!intel_guc_is_ready(guc))
>> +		return -EINVAL;
>> +
>> +	ret = guc_action_control_gucrc(guc, enable);
>> +	if (unlikely(ret))
> 
> 	drm_err(drm, "Failed to %s GuC RC mode (%pe)\n",
> 		enabledisable(enable), ERR_PTR(ret));
> 
>> +		return ret;
>> +
>> +	drm_info(&gt->i915->drm, "GuC RC %s\n",
>> +	         enableddisabled(enable));
>> +
>> +	return 0;
>> +}
>> +
>> +int intel_guc_rc_enable(struct intel_guc *guc)
>> +{
>> +	return __guc_rc_control(guc, true);
>> +}
>> +
>> +int intel_guc_rc_disable(struct intel_guc *guc)
>> +{
>> +	return __guc_rc_control(guc, false);
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
>> new file mode 100644
>> index 000000000000..169e60726e5b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2020 Intel Corporation
> 
> 2021

Done.

> 
>> + */
>> +
>> +#ifndef _INTEL_GUC_RC_H_
>> +#define _INTEL_GUC_RC_H_
>> +
>> +#include <linux/types.h>
> 
> do you need this include here ?

guess not.

Thanks,
Vinay.
> 
> Michal
> 
>> +#include "intel_guc_submission.h"
>> +
>> +void intel_guc_rc_init_early(struct intel_guc *guc);
>> +
>> +static inline bool intel_guc_rc_is_supported(struct intel_guc *guc)
>> +{
>> +	return guc->rc_supported;
>> +}
>> +
>> +static inline bool intel_guc_rc_is_wanted(struct intel_guc *guc)
>> +{
>> +	return guc->submission_selected && intel_guc_rc_is_supported(guc);
>> +}
>> +
>> +static inline bool intel_guc_rc_is_used(struct intel_guc *guc)
>> +{
>> +	return intel_guc_submission_is_used(guc) && intel_guc_rc_is_wanted(guc);
>> +}
>> +
>> +int intel_guc_rc_enable(struct intel_guc *guc);
>> +int intel_guc_rc_disable(struct intel_guc *guc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index 38e465fd8a0c..29d8ad6d9087 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -7,6 +7,7 @@
>>   #define _INTEL_UC_H_
>>   
>>   #include "intel_guc.h"
>> +#include "intel_guc_rc.h"
>>   #include "intel_guc_submission.h"
>>   #include "intel_huc.h"
>>   #include "i915_params.h"
>> @@ -84,6 +85,7 @@ uc_state_checkers(guc, guc);
>>   uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>>   uc_state_checkers(guc, guc_slpc);
>> +uc_state_checkers(guc, guc_rc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>>
