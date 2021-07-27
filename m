Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0933D7ACB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 18:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBBB6E9E7;
	Tue, 27 Jul 2021 16:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA4C6E9D7;
 Tue, 27 Jul 2021 16:18:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192073777"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="192073777"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 09:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="437372055"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2021 09:18:14 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 09:18:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 09:18:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 09:18:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 09:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9oBLmWjlOq6OzRuW8lw1VuQGDdM2CwMuUvebBhO6f3N/OrP5IFFT2pNgy5YhjB5olzWJhlE3JSCSnKnjcOpBZZ+ahbkZeGcg2HYmyPbVKtDXEwl9OJ4gdTlP+hstaUpKlE5x/VUPHCx5FK8yw9yC6zXJx2uQKJJnRwLXymT/2rHNiHhmNk/SH+IIORQnX+dYTEcyDI2iTm0RrdHJtX9kdlUUQo6+ZygxEaNDdRXw6rEe1eUjZKJK0jHutBBPo8yGNafrZILXpo8ocui6YxGR+3rIjuqzPHA0/sSgp0/QiSGGjjT6SH3p7qZ0aV8prpQvtlfZaYXr5tH6JZkT0jMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlMc0Uuekq3UGmGLFYN4H7MuM+6uM8XfBr4cwwBGrnk=;
 b=hzrzaIhIrV3hYi1xEYiq76Hj+hmUvPVqpaaieoxheymxxhp9Bilqd4p1b32GdJ1fDm4NI9Ds5K2PX7IeNxRa0/SWh6yLQxRsf6JTjaAqtaSAr59OJD/SQtjdy2CiB3I8Am/grGSuWM4V4aB2Jocx4k4N1jgELttzdFMe53Zuq7R/pTzoCXRurlH5JQWLwIGXVPR1oA5w4QskV/OYMRSqjGOaJkJTAmNcM2ewFzAjQpf2KTlqqbFmBUHaQhUQYiHnWLNqmZWNDD+vaO76OjecmmvSkiP/P7cqK1zgJhaXVGtsJpKOaroH/TZEvnhpKoGduxTsdJrzleTL3dBQtlOK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlMc0Uuekq3UGmGLFYN4H7MuM+6uM8XfBr4cwwBGrnk=;
 b=ahl8nVTiq1N/T/Ka0DOg2O31zyFJOL8WqUOKM3Dv67lz5zeTtMwsn9YY98lVyGJtbIyhN3ceQLNtv47v0sMGklHYXTEHYhaFZ+9YSnG+0j1EvAZmGTE6enihobldM6fZs8oeozF8ZN1ZW7wVXfw33cDqPt6eo8Lxen4Y81iAmH4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 16:18:12 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 16:18:12 +0000
Subject: Re: [PATCH 15/15] drm/i915/guc/rc: Setup and enable GUCRC feature
To: Matt Roper <matthew.d.roper@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-16-vinay.belgaumkar@intel.com>
 <20210727153718.GY1556418@mdroper-desk1.amr.corp.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <2fbb9934-22f2-937d-bc84-470dcd82c289@intel.com>
Date: Tue, 27 Jul 2021 09:18:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727153718.GY1556418@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 16:18:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce3af8a2-2691-46ba-98ae-08d9511a2144
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56509AF4A326AA3BD7BC029185E99@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PB3FAQoMIp+hulB6WgqAw2iR+T8P0eLON2b5PQPW8a8nDMY1BIDbZKs0VqWpu+Qu9u5jwySfdYsBZ8G9GBu4gupeMqrKPRZ0tGYw01rBIcaqzRe+NXHSWGLvMoNnw7npYiuokvGtu7e+uRHO65gn6WMYCl36fppp6yKG1HxBgIEqfXMFSH4GpiNjmIYp3BYowTGeGiWL86LDC72HzcUol2gBHBtMPsm8XgrF345Ji5CISvrQ5aO8F6bm/IdXWxbkJwhvbAN0QneA6z5AxbqIvIUpXwJfQpMunHJwLMNuK4ui7jHCI7y2yQaCEJ65SbqgIfJMkqcvB5FLgqOxGcQuF+C3DiF5TyUXdXfdTp3xznXgAW6FZ1zr1/w2d85IwBCTOQurNUYH1Lx7RCuA6R4yvwYoDdYVg9ULOX8voH6+JApCOVsVlqsfBQQoXJZ3VbMgGxdcwRBG2moriorZM4y6gCj8SrEYh8qFZ2B/OjtC7WhaqJbuEtQEaN5zsVRRlQkBFsl6LaRNDGVsbYY8KKPOtrvNik5C+eIuhxKhhLlWE7ce0aV70MQ5f1F/byYmVmc4JHnvqGnHQEGHm8GGVGPPz4EuCtwXG95TBCTXSYBZaDBh7Ux6uWLCcKBUFS+wzub86mtaOwXHXZiVxw9DevPsJ9x/IDt4iRtf3oncj5elo+kAMTRLKnlJWI9x/mden3rnDYHePA19EzbkJ41Xb458Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(2906002)(4326008)(66556008)(26005)(478600001)(31686004)(86362001)(83380400001)(66476007)(66946007)(37006003)(6636002)(53546011)(6666004)(8936002)(31696002)(6862004)(316002)(16576012)(450100002)(6486002)(107886003)(2616005)(8676002)(186003)(30864003)(956004)(5660300002)(36756003)(38100700002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBnN0xlK3FNVlFkWTlZdWxYYVpKZ1gvdGVVdlNicjE4N0NzWTRPcWN0K3JJ?=
 =?utf-8?B?Z01UTDl4MGNWL3RsVi93am5VNEtzY3pHZE1XS1BuWkNZazlHNS9BaktyK2pX?=
 =?utf-8?B?cTRPTHBLeFNWWFZpakk4L09yR2FScE9ZZllYQzJSd0dUaUpPMnh3QVNlSmxH?=
 =?utf-8?B?Y1U1MGsvbEJ5QmdUblg2cGdodWtpSWF2OHlScDlXUlFkSlkyT2VYOE9wQVRw?=
 =?utf-8?B?bW9xOU5XT1YxNUNyUzNsdkVVeFh0aUM0SHdnR2txYkxXQ2FUWDNpNVNvOUND?=
 =?utf-8?B?SUJaUkJ5MGxtZWxuZi9hS3lIZ1oyMVd0c3BmaGFvYmRzdzd4UmxCaFB1Y01q?=
 =?utf-8?B?VzByd01uaVQyQmRLa1JmMldEeHZwbGp6U1NySTJvNlpOK2xNRy9kUStBUFRF?=
 =?utf-8?B?dmlISHFaS3V0RkRqZTRWcDYyaTdIT2VRc1FTeUtIR1J0OVM2SGJSYlpOUWdW?=
 =?utf-8?B?UnY3Y0NCVVNWOWJIQlpGR002VW1LYTQ3TENXSDMrVWI1d0Q0R3ZsbnhXbkR6?=
 =?utf-8?B?bWYxV0gxNkxQV0RFQjFNSUpoWU13REZXSml3TkRtcFlKeForVWtVUXNGZWpV?=
 =?utf-8?B?MnJqTEF4T3hXMUt2WktQYmxzUFJXZjNRZ3pERDlxVXJxM1FRd2ZzUDEveWxz?=
 =?utf-8?B?NXU5WVB2eTFpV25tS2h1YmhPaHNFdWVZWmRSYm1YdlFXY2JzS2VKQlpBeDVk?=
 =?utf-8?B?aFhva1BkeWQzT2pQNEprVkZYcHZubmJNcVBVMTRpbzJhQ2YyTlVjVUV4VXZj?=
 =?utf-8?B?LytXWWoyd1hrZ1h1RnJBdTdFckltQmpNTm1RQitWR3pMQmE0enVTWTJVcmtS?=
 =?utf-8?B?UnBXNTc3cVhpa0tHeDhZbUw1RzdVSlo1dzBXN1pqZ0h4NGhxQ0tNSi9Za3dq?=
 =?utf-8?B?T0xjaXB5aEM5YmkzM3dFUmQxT2FGM0RxSHo1ZXJ3SmJIMmdFWHYreFl0NkIx?=
 =?utf-8?B?bXNmMWNRbFVaYWdwVkZJcE5TdURIQU43dWVxMkk1WWpNYjJHc3RGcEM0Ym1v?=
 =?utf-8?B?cnpFN2Vld2lvaW5RdXVndEcvZW1sQjBtTERIeVpaSWlTVmpzb1krcnJMY0c2?=
 =?utf-8?B?VmNieWI4TklzM2RUTTF6b05zWkxXNnNnNjQyaWcrS0R6RS8vMXVWU1hzanhN?=
 =?utf-8?B?TEFXWGtsL2MvbGRWc3g1WnYxVnNlVEVZZElBUWN5d296UGRFakhMVnBETVNC?=
 =?utf-8?B?bFZsencycVAwWElFVlBzSFkySWxRemdPMkVybnJZY2hzTTZVRTVOaFptbjZT?=
 =?utf-8?B?bnVUQkpNZE9aR1M4dTc0bFh4eVArOG5ueDB5U0NHMUREWGRBSGZSMTNsdFAz?=
 =?utf-8?B?RFVsSmN1QW4yUVo5VlZzQUplVFR5bE5rYy9jcXhkTUZyZXl5cHVNc1NtdkEv?=
 =?utf-8?B?VWxVUEZQc0I1S1Rob3g1NXJZNTVDeGpZODVkRkJLZ1pLZTg4VzhSOUFkTDBG?=
 =?utf-8?B?MWw0cUI3c3J2MFdDaDdmemRnVCttUDVsYndFYWhkUk5xSXgyUE85M0VZRjJQ?=
 =?utf-8?B?TXhwcTE0NU96ZmFWV2pMMG9WUlJXMmU0SkhKWFl6QkhyOHJoOGdwbzZxVW54?=
 =?utf-8?B?WUJZNElPaEFaNmxmOXk0ZjlNYzg2cXdVSkY4WVRwUXdBMHBTZVl5U1BDWWZE?=
 =?utf-8?B?R2RpbzFlSWh5eHJmekpzelBiT2IrRFBYTlJPbVRJeGgxUkJvTkRLRFpYQWtv?=
 =?utf-8?B?cTA1QnJDT2FuY2RSbDhWaEl1NTkyc01zeVBnMzBNUmtEbmRwb1BDR0JJYzJp?=
 =?utf-8?Q?UHvudCvjhKuPZrhkOvxnU8uYinA+pWFTtmNiM2w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3af8a2-2691-46ba-98ae-08d9511a2144
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:18:12.0143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbBh9ovwOT8g3qQQzoosbdkEE0zm5mNLnGB8sr+nTy2/R+F4Ydg3VCahtQvqLfSNvikxYHDmNV5SPCiiAWSNCV7xhgfc0iHP7dI96mYCz9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 8:37 AM, Matt Roper wrote:
> On Mon, Jul 26, 2021 at 12:08:00PM -0700, Vinay Belgaumkar wrote:
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
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   drivers/gpu/drm/i915/gt/intel_rc6.c           | 22 +++--
>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  6 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     | 80 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     | 31 +++++++
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
> 
> Do steps 2b and 2c above this still apply to gucrc?  Are those still
> controlling the behavior of gucrc or does the GuC firmware just
> overwrite them with its own values?  If they're still impacting the
> behavior when gucrc is enabled, is there any updated guidance on how the
> values should be set?  It seems that there isn't any guidance in the
> bspec for the last several platforms, so we've pretty much been re-using
> old values without knowing if there's additional adjustment that should
> be done for the newer platforms.
> 
> If the tuning values the driver sets get ignored/overwritten during GuC
> operation, maybe we should add a new gucrc_rc6_enable() that gets used
> instead of gen11_rc6_enable() and drops the unnecessary steps to help
> clarify what's truly important?

Yeah, 2b does get overwritten by guc, but we still need 2c.

> 
> 
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
> 
> We should probably clarify in the commit message that gucrc doesn't
> cover powergating and leaves that under driver control.  Maybe we should
> even pull this out into its own function rather than leaving it in the
> "rc6 enable" function since it really is its own thing?

I have a note in the summary patch about this, will pull it into this 
patch header as well.

There is already a separate effort underway from Suja to decouple RC6 
and coarse power gate enabling. Might become more streamlined after that.

For now, I can have an if check around 2b so that there is more clarity?

Thanks,
Vinay.
> 
> 
> Matt
> 
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
>> index ca538e5de940..8ff582222aff 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> @@ -135,6 +135,7 @@ enum intel_guc_action {
>>   	INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
>>   	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>>   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>> +	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>>   	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>> @@ -145,6 +146,11 @@ enum intel_guc_action {
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
>> index 13d162353b1a..fbfcae727d7f 100644
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
>> index 15ad2eaee473..08919d1b35dc 100644
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
>> index 000000000000..18e3e05d7b39
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -0,0 +1,80 @@
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
>> +		drm_err(drm, "Failed to %s GuC RC (%pe)\n",
>> +			enabledisable(enable), ERR_PTR(ret));
>> +		return ret;
>> +	}
>> +
>> +	drm_info(&gt->i915->drm, "GuC RC: %s\n",
>> +		enableddisabled(enable));
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
>> -- 
>> 2.25.0
>>
> 
