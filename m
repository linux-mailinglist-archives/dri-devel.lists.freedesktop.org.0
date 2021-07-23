Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55163D42E6
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 00:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5711E6FD0E;
	Fri, 23 Jul 2021 22:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80F6FD0B;
 Fri, 23 Jul 2021 22:30:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191552199"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191552199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 15:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="578155025"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2021 15:30:01 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 15:30:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Fri, 23 Jul 2021 15:30:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 15:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGrPRvoOOA79iPzi2ix8+0tyQ4PwbEClhaBQKeYeL+zxgtidDBw3TH3sbctSKLdvcgRM20/pZzqpFeHevIOehvIVvpKxSZB6tvOc23hNSMmJDLmNjAxQh1KAMU6y+JKztIJAgankqvSXqmYsKysR8Gmd5L8tiEVDexVHHq9vaugRAR8ivFb6SkuV6aKxPYj9Iu7+fj78lHeO5JUQNYLgSOb2UOkg6xJLCbifxcWzAOdhV/Sp0G8z4EaX2af0wd+ZhX2HQCxHetE35Msjj7SFbgucgFrdZFUfkH/6acMIKWdRedV7gicters57kAySRZAXWD2qw8QCufzDZJPKwD9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiuHzUAtVM0X9ejaK4qjhQEul6EqB7SavELeu1myveY=;
 b=gm0qAXL+QuFXNbEyZs+gNxWXuDj7pu6virRVZdIYGohDrjm8vmV1cV4XpQ611zh08bMvQSj0FZJEpeSS39jbOdAL/qZXPElW+txZqqZSKps8Hi+rlhm0eX22mbxLHbsad6VoTo55biMf20//kv+lBZyWUDut467nXSJv7MTTSeZlxWlOV6Z76hwH99S5z/Z5TMjYLlQ0UVO7zaCXBOS2EvqeXhQsZW4jJCCkkyUEDbnEnuyhbRJz5yRUmJ/uZ0EzOGZxE3lkQlDuqkh85C3gCpuM/nCiywnbyjs9yE1XGds2U3ZctOC+62yTwFAxRSExDiFTxP9AreYJPRJdgPiTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiuHzUAtVM0X9ejaK4qjhQEul6EqB7SavELeu1myveY=;
 b=VdwxMHrXWLQSyJJj8d0Tqu/zut4LBbSRckDfHvZ0pxUuY+Eg1VQFeuKgAcmRp8tmozQgtlWxvEP1K9NYra80sv8IEY0xHD+Gj0N9EtHz+nB9NNOIYV0BtsqSzLmiyUznGZ6DSmP4qTzW8F15Ipqe2vvKEyCisTrazTWvHgbmDo8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 22:29:57 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:29:57 +0000
Subject: Re: [PATCH 14/14] drm/i915/guc/rc: Setup and enable GUCRC feature
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-15-vinay.belgaumkar@intel.com>
 <8f9928cf-2247-1a3a-10d7-c6c35c2f1393@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <4106f430-0df8-c23c-6d85-a5b2ae7e951e@intel.com>
Date: Fri, 23 Jul 2021 15:29:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <8f9928cf-2247-1a3a-10d7-c6c35c2f1393@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:c0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 22:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d277a22-b824-4da5-8f7d-08d94e29668d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5588218BC74AD14AC020E17985E59@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8p8ca15HuR7DcARi3PRhLTK3yaTDtuO4hfNDh3G92Zk+/L6oznyPbjBMenETvcqXbtwuLBXm6kwarM68mbBAUtCLdYdzbdJi0+nCnTzurGRKn30wBVhLYw3z+gZHhFcio+EczcnNzOAX7DcuLU1vcbAULON03TEoivjDTpEsYCAXP2DZBj09E+okfp1jDSUJgJ6EQJB7t1ab8C3piVu4/YxEfcv/MwAMaIhOkB29ZA5q6GG4dBVKeG+GqPgO/nq7aMI8G//tSeASrDdRa8ELBcpl1pLxueOHfm9wRZC1rnvUsSQJQdNh5UohJD+R7lvkL6QMCdf0WtBlVgYkM0epyyh43e0+7YJMxyQHoa1A4scBojFxyXi9Z3oIQfhcdKI98C75GYpIzQRRMI9KABkLRH3lxV1JN6d9smp2RJ+ESfvkWWFqX+dwK6rQfCTuC7kPD+a13vSGoswXa5LU4H6LYgtrernFJ3/U2AfCTHHQQmN0IDE4z3+2anJ1RQYhziZqkZ2+a35FJWvos4FVUX8DCRSTjEclTJkKP6OClQx1x2kRQiGZd87R84SK2M1014Y3+zIk680FaZ3pvPUh92IIA1POy/vlyO+DWNEbXUhrcqDI0Q8BetAiv1tcQiVpScTCt1GpDio8D7gZ66SqxVBkAMIGmEnjZ3iWbJaS0Xk+b7eJpRtt9VCuN/sBlIJiYd3TIsZF+IQwKcj3cwDy2Fr0rbu3kFamF9a9WTfO0susUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(316002)(5660300002)(956004)(36756003)(8936002)(83380400001)(2616005)(31686004)(2906002)(6486002)(31696002)(8676002)(16576012)(66476007)(66556008)(66946007)(26005)(478600001)(450100002)(86362001)(38100700002)(53546011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUdMdkxBMG15NWtlblM4bmRrQUdBOTZDaU5mekdiQmZ3Q3dqVDNKY3ZvR2Zp?=
 =?utf-8?B?bG8weEZKTURyV3dpOVVmd3Jjd29JOUpTbi9aMFVueDhJWSt2R0QxTlR5UHBE?=
 =?utf-8?B?VkpFSjJub2RpamM2Q1FrdUc5aUpyY3g4elQxYmlYajYwdUJTY3ZDWDZMNjJV?=
 =?utf-8?B?MGUwazVBMEJPbjBKNVI2Z0JzQnJid09aakwwWmh0dStKcnJFNHpUVTlJYjFO?=
 =?utf-8?B?U3JSOEVJNDNXa0h2bkRnR3dINm84a0dUVlBLRmt6VndjR1RsdVdIU09oWEV5?=
 =?utf-8?B?dmFBSmRVUWdZQmNxYlJmTTZWWldTYXprSkRTUXpySEh1UnBibXZqMkFZQWtS?=
 =?utf-8?B?RWRjbWUvZ2JGd0N0NklUVmNiS2o2WXNuQmxhVjJNTFptTFp3TWFxNno2Sk1x?=
 =?utf-8?B?aG1pcDh5RGxQSHlVSHJYc01zUnRqQzE4MlV3QTUrN2c4RHd1clJhS3FGMjlH?=
 =?utf-8?B?ZGlOd01LNWVTUGxEWTJkTXlQR2cvVllKOHVUYXFSNmFuODE0TEE5S1EyakFs?=
 =?utf-8?B?Z1pHcEprL2krSTJVMDZ5Zi9TKy9PamZvNnpjRDZZTHJHaStaTVg5TWh6UjJT?=
 =?utf-8?B?aXJXYk1kUnhpUlp4a2lFMlROR0d2TisxemFMSEZQOFBiSzgxVlRVeHV4QW5T?=
 =?utf-8?B?Ylhmc3BOd1hOc3lpYUI0ZmJPcDZDSWU5Ym02ZVUxK1Rwd1hHVnZlcktSZTlY?=
 =?utf-8?B?Qk5aMTludjBoUytxRVAwTXJIcVhnLzFxdmxOalluVWt0RUFwRnJhYTUyNEVm?=
 =?utf-8?B?cGd5L3E0dmZjYktBelM3TXNEeVlYd3pJTnZjMStYRXZkYlFvSFBKMWNITDE0?=
 =?utf-8?B?ZkpmOFdmWnA3eDVLYm1sZlJ0L2oySFU1YXJOT01qUER2eTRSWTFramJNVkZ4?=
 =?utf-8?B?R0FjaHllOGdHWFhCN2wyZENMa1BIRUpCUE14aERFMm9ranFOMlk5L1F2N05J?=
 =?utf-8?B?T0JkRC9uWGlsZkR5amF0QTQwdlBTOW1UVm5jb3lOZGluN3R5cktuZFlBOVE1?=
 =?utf-8?B?VWhxTmwyMWZjMW1ZR2ljM0ZHb1MyT0ZUWmhlR1ZkREVCQ3dBdGdOajRrNHNJ?=
 =?utf-8?B?b3U0Rzc4aVczRUpCaVp2QlYyYWgyVFk1SGxqTjVpOFdYZi9KYTBDMGxVNEc2?=
 =?utf-8?B?QzBnYWVJMXdNVW9hVW9MdVRTcTloaXE3alZlWnQzcGp1TGR3ekhVVXUveVIz?=
 =?utf-8?B?aEh3V0JXamVWTmxZTXVKZGJoYmtkakZmS3hRZGNiMXRnUDFXWm5PT0JVNm12?=
 =?utf-8?B?ajRrR255NDkya1NaUDJkT3ZPZW9RcWVKSzl4OHJodkRpMXZUMVYzZS90NVRP?=
 =?utf-8?B?aXJmNjhyb28rRy9PRHZGRUJYaEpHS0x1TjI3dmZEL2ZjT0xpcDZNVHNvd3VC?=
 =?utf-8?B?eEZzbXRBenhTM3JIVlBGZGZCNlI4aXVnQSt6MzhHeERRc0VEK2UzaCtJSlhT?=
 =?utf-8?B?aGcrWG9FSWtGV0x0UmdKWjNFaEM0Z2RpaUV0RUpSSjZIc09zTWpuNmNZdzdx?=
 =?utf-8?B?cjVsd2R3T1RBaW9VY2FKMFc0VVB0SHJSMlhQaUlQa3NTa0M0ajVWWEVLUHBO?=
 =?utf-8?B?T0Y4NzI0Ym5oc29qWGVFc21tTXdUbHlqUG4wWE5vNjJsdFBXNzZ6OWo0cGNL?=
 =?utf-8?B?c1ZHODNhSmYxNjI2cTcyUkVhV1d1MGErUnlQYWgzaXdCam5xTEpxbXNMVVdq?=
 =?utf-8?B?VDlaUkFZa0ZERnNpQlcwL2lNZ3NueDRsTWdENmZCMHdtWlVFNU1WN2gvZXBh?=
 =?utf-8?Q?QagF/Xn1iBMcZ0l4eoOmNYvtdrqWlqaMpcJYx/W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d277a22-b824-4da5-8f7d-08d94e29668d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 22:29:57.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6UDgO40z1uo6yyUmO0ziLzaNz8H5WVFCj9cPAQxRERKXur6/5idWrycG6gmwDuj7aTXgW9bias6FHMBRP2zSW5++3QT0DnFsDd4msqlLkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
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



On 7/21/2021 11:21 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> This feature hands over the control of HW RC6 to the GuC.
>> GuC decides when to put HW into RC6 based on it's internal
>> busyness algorithms.
>>
>> GUCRC needs GuC submission to be enabled, and only
>> supported on Gen12+ for now.
>>
>> When GUCRC is enabled, do not set HW RC6. Use a H2G message
>> to tell GuC to enable GUCRC. When disabling RC6, tell GuC to
>> revert RC6 control back to KMD.
>>
>> v2: Address comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   drivers/gpu/drm/i915/gt/intel_rc6.c           | 22 +++--
>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  6 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     | 81 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     | 31 +++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
>>   8 files changed, 141 insertions(+), 5 deletions(-)
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
>> index d832c8f11c11..5f1c82f35d97 100644
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
>> index 686cb978662d..e474f554b17a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -159,6 +159,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	intel_guc_log_init_early(&guc->log);
>>   	intel_guc_submission_init_early(guc);
>>   	intel_guc_slpc_init_early(&guc->slpc);
>> +	intel_guc_rc_init_early(guc);
>>   
>>   	mutex_init(&guc->send_mutex);
>>   	spin_lock_init(&guc->irq_lock);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 8cecfad9d7b1..dcac31098687 100644
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
>> index 000000000000..f1970342c0ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -0,0 +1,81 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
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
>> +	u32 rc_mode = enable ? INTEL_GUCRC_FIRMWARE_CONTROL :
>> +				INTEL_GUCRC_HOST_CONTROL;
> 
> nit: likely can be done directly in array initialization
> 
>> +	u32 action[] = {
>> +		INTEL_GUC_ACTION_SETUP_PC_GUCRC,
>> +		rc_mode
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, action, ARRAY_SIZE(action));
>> +	ret = ret > 0 ? -EPROTO : ret;
>> +
>> +	return ret;
>> +}
>> +
>> +static int __guc_rc_control(struct intel_guc *guc, bool enable)
>> +{
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
>> +	int ret;
>> +
>> +	if (!intel_uc_uses_guc_rc(&gt->uc))
>> +		return -ENOTSUPP;
>> +
>> +	if (!intel_guc_is_ready(guc))
>> +		return -EINVAL;
>> +
>> +	ret = guc_action_control_gucrc(guc, enable);
>> +	if (ret) {
>> +		drm_err(drm, "Failed to set GUCRC mode(%d), err=(%pe)\n",
> 
> below you are referring to "GuC RC" so to be consistent:
> 
> 	"Failed to %s GuC RC mode (%pe)\n",
> 	enabledisable(enable), ERR_PTR(err)
> 
> with message fixed,

Done.
Thanks,
Vinay.
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
>> +			enable ? INTEL_GUCRC_FIRMWARE_CONTROL:
>> +			INTEL_GUCRC_HOST_CONTROL, ERR_PTR(ret));
>> +		return ret;
>> +	}
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
>> index 000000000000..57e86c337838
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GUC_RC_H_
>> +#define _INTEL_GUC_RC_H_
>> +
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
>> index 925a58ca6b94..866b462821c0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -7,6 +7,7 @@
>>   #define _INTEL_UC_H_
>>   
>>   #include "intel_guc.h"
>> +#include "intel_guc_rc.h"
>>   #include "intel_guc_submission.h"
>>   #include "intel_guc_slpc.h"
>>   #include "intel_huc.h"
>> @@ -85,6 +86,7 @@ uc_state_checkers(guc, guc);
>>   uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>>   uc_state_checkers(guc, guc_slpc);
>> +uc_state_checkers(guc, guc_rc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>>
