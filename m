Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99266A83A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 02:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0B10E222;
	Sat, 14 Jan 2023 01:27:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47710E054;
 Sat, 14 Jan 2023 01:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673659638; x=1705195638;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9OnHRsXLxJgcXnuCIbdficfsGQXeP99v6VWzeDy/9Kw=;
 b=kc5iNWv/mK5sUsg8WNa0G3MUzhtdljqqilG+JLJVd365lhj71jNSdJAR
 vf8lCpkCFIi9ITsS7iN4vRThBDeI/M9xV0UfSc2env846ahTQC+CZITXO
 DuyGCMlT9XSJKnli1Npn0oJb8wGdJaAMQj90D9ugeTsVKlSgsNUepJPYT
 SQW77S5u9I9/6BmeqOCv0uXk977ixkn3GqBEVy52ipfrnHm3+qCIySdvj
 ezHKVkEsMr0jUVOLrcXcSXm9nFQzMFX6c/MhhAJqrYkLj2EaH6SD0i0Uv
 cQuQso3RVlvGnxqWbh3aBOPJm3XkK88uPOIP0zRXISA95DCPfxmWsD0FC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="304528837"
X-IronPort-AV: E=Sophos;i="5.97,215,1669104000"; d="scan'208";a="304528837"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 17:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="635957567"
X-IronPort-AV: E=Sophos;i="5.97,215,1669104000"; d="scan'208";a="635957567"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2023 17:27:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 17:27:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 17:27:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 17:27:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc8Sw2K0AydPmuIQQgbme9GrEtwC9Qoktx+2c3Mbjs21PjCEvLAN+kHPm55SCb3xoZs1NfW7/5+2dp/qJxh2XLhTbps/zlV3xQcxC+4lS893GqrVRxqxrRTzRZOdCvfuQRp7J/RPi/3lN27aAD1fxZukBlahNkwWhiUgpFKMmwwFN3q846ImfV4FVMtGsC+G4wri4XpaPA4az+Z5zz/ptK2flhJETNT2GuzQt8q35OYruu4iHZGN1knzS7JT0xUbY1jk6hTj55fFm+QJUcOxieJ0TznseWunNrusPkc3JwChCj7+ShTzFAhSv1wRqdD0/ADuutgyjJ1Q0QH0FANO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3bO1p4gcgoB/rF+49WvdQkoXimXD/J09JE8vUpMmAc=;
 b=Wa9eqTaGpPIf504dwt+vbPEF/Q1l5e9v6qDx8B3AccMQYN4pMbaLjCpaA0JNcPskoeyCmGYw4oVs9bI0UCb7/9KJ2tt5In5JerP5TkdyRdpgS78YJML7fmqPS3p5Urkj5Trhx+Ui6wh7JQiqfv9uKlBHr+BnKbsxR6ybrjPHVCzwoLSGTRc33xoEh6gxjkkiordx99Euez9YSHAP7xeEwLmi7tcKr7ScXM49pnvxA7LklcFZ0FZRJvbMas+p8YBGlEQgnCiGTrqtZbCz4fkunyL35LGV5zK2dUA9QyyRxjTDYvR/KPCBVZbLGxIitmD3qkoIjLlIJ+SWeOcf/AMG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sat, 14 Jan
 2023 01:27:14 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::2ab4:2e6e:8d24:4d2e]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::2ab4:2e6e:8d24:4d2e%4]) with mapi id 15.20.6002.013; Sat, 14 Jan 2023
 01:27:14 +0000
Message-ID: <f3749fe9-56c9-dcb7-d1bc-bfd57bee668c@intel.com>
Date: Fri, 13 Jan 2023 17:27:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-4-John.C.Harrison@Intel.com>
 <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
 <8531ce98-78af-d818-b5bb-0af753a026d3@intel.com>
 <ed669153-0c07-dfdd-58c9-8146ed966366@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ed669153-0c07-dfdd-58c9-8146ed966366@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a56322-95d9-463c-ac80-08daf5ce7781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGrfSmYfs97IBTC5mj8Ajajv4zh27Xg51KjVvi1v8DwIGzRdxPXUM5Z606MhRpv2TuVOS7/1Pnsv4civFbiFoNiMCjVPV8jzcdin7hOEIWHPW+IaO6LGxcIwV63PQoJHPaI+0O3YIXLglvtBBHvbwMF1nlxBq1kkVgj8ZVk+kZ1swfFUi9sNAnNGBBOEYAF6UxXSNXAuZQD0SO3ZIP2Zl1esuNIZoy75YuF0y/CxdBXGpRMMvpFNycpQvfEiWqfClp6/CZGe0ZAc25INUovS5cBrOKBJivp4aoYAz3cnfNsRqaPTfiX4cUwRfxiW9b3WMKy2DaN5ICL7rBSD2h+lGdwJDH2FKnSUDYyGPmSXhzYbKWDPkm1c/9VjtAHmRUQglhqT17g4b5WO9Sck2egHMLJW2kmJsLGT3dYSEGLyvLFOy+ppNY3Vz5QgWCSbRtrUdBI70v7oqN6HC7M63PJqjTndbZ25fv3JrSo8QP6rQHoCf+hRSFR/zmZkNS6PPCftcIUWMJBcKjCgWSZVa9nJNOiTPCaREmbyKLlw/KRb6XtzZRvirz0Sx9KxANsHjQDfysfmJF08YwAwhhrJLXgstzNUMH6b4O1msFi2+v0QoGk1pOJHLDkh62Owr8j9sziu1vmZPTOSHJG/Vgm67x8Nyz2q+sg3/A8Z9wbFGgzy/4+j9GU5nYD4aWwlwT1aY2YW9svWDoIvzhpfcaMpqW0BQfLQEjPm9dY4RmGuGv10GmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(86362001)(26005)(316002)(6512007)(186003)(478600001)(5660300002)(6486002)(2616005)(41300700001)(31696002)(4326008)(66476007)(66556008)(66946007)(8936002)(36756003)(83380400001)(8676002)(31686004)(6666004)(53546011)(6506007)(38100700002)(82960400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG5PZkNldnAvNkFPSkFjaHY1akl3UjRNV0V0dzJjNndLZjl3OGFSeDhlcEhp?=
 =?utf-8?B?OVNYcUw3NnVJUVhDWkc5SC94OVpuYnUyQ3pYNW1qSGMwZnN2U0p1YWNkSThz?=
 =?utf-8?B?aUM2YjNCd0RmeWNmc0Q1RkMvOFpaWWZDTHlDMzZGRGxTa1AxV0Z6UEtKZDZv?=
 =?utf-8?B?WkZaL05SaDdSRUxvUmJVTDJsa09Kb2RLUFNOSk5wanhqN0tVckRPazNtN1h6?=
 =?utf-8?B?NiszcGV3SGxUV3BUSE83RUhWZWtYcFRBdTc2d2RuYlM5QmR3N2toUmo5b3dT?=
 =?utf-8?B?ZnpESWdLbytMMUFObUU3Vk5uRHovR2JQeXhLdW41RGhTQXdEL2RaS0YrNW5t?=
 =?utf-8?B?OXV1OWk3SDc1aDM0ODlHMURzblFmUGNUTElQWmdDTDIwNHhDK042WmtmMXl3?=
 =?utf-8?B?ZS8xRkpDT0hzeS9ZODZHeXZUbG9oVWhwdER1eGpYRDVQbXdmS2VvUnk0elZu?=
 =?utf-8?B?cjBQeXlsUm1EMlRldTlMcEREYjJqSkppM2F5QkNiZ0E4SGUvOHBITkc2NkU0?=
 =?utf-8?B?NWNoUXY0dFR2eDRQcmcrOUdWRXhRclA1bW5qRXJ0dEhod3FPRXhhNTNkVVZm?=
 =?utf-8?B?VUFQVzh6SlNCaGJGd2lCbjlxWjZQSG5GVUpSSjdTczI3RnlHY1kzdUVpYndU?=
 =?utf-8?B?bVZjYVkybWZmUHRLRzl6UGxOSURONG1vZkNKNjZpMUlaeUcwSDl0ZFQ1T2Iw?=
 =?utf-8?B?SFBxVEhQSGc2SVpnUmtUN0cxb3FBRHRIQ2lrMGNPak0wRCttMW1kbTljdXZI?=
 =?utf-8?B?ODhuYmo5WkE1SkxNT2ZLY3BIR3NWUGVkcWhUWkdLZDJWS1Fic1BCdnNON1FB?=
 =?utf-8?B?NEZ4eS83OE9LY29WMWJzVWdieXMvVVRnVjIxdVZZUTBRQWZVYi9RSVo1b2tt?=
 =?utf-8?B?cEFaUER6SlFZa01tcGkzcnh1ekVtV3VNY3k5Y015YlZheXlERmhJT2d3OWpJ?=
 =?utf-8?B?aWZZdHVRbFRwcHZoTGxqZENkRmhCZlc2ZDFLVEVpcU9iZnFadkYrdTZ0bmtw?=
 =?utf-8?B?Y3JRUmdOeVZTSFNMSlBhUUZpWHRWeTRBS1Y4cmlINlhUSE1zRmh0TENySFgv?=
 =?utf-8?B?bkRjanhVdERjL3VFL0d1MUh5UHhjeFhrS3g1SVlHdURMczQvYTQraHMxaG85?=
 =?utf-8?B?aC81aFlva1dDQVV0RzRBQ1hCbzVIaEwvWUtIbVZ4TmRmSFArc21wUGszOFRB?=
 =?utf-8?B?blhRWHlEMXU1MXJ0OTZjU2oxeHFpbTd0Y0VpNFNBejRwNjdJQnJhUWxaL3NT?=
 =?utf-8?B?K21UdkR2MnlYQUJ3MCsxcmZCMU4wTDEvamQzNHU5WFNBZkVXM2VERkowUkJ5?=
 =?utf-8?B?bW1DZzlyam8xbVNxWE93QmlKVzdkTzNHRDdGMmE3UitsNms3N2VBVExNTHMr?=
 =?utf-8?B?ZmNJZjB0OXlMWW11c2IvM3ErbklXb3BZZkgwMWlDMnplNFdiR3A4NFpXaXFw?=
 =?utf-8?B?d0t4dWdjalVqOXZNMUpjL1FicEFzYUVNb3hDeVFuVFlOZDkxVjVkMmxZSktS?=
 =?utf-8?B?RmdpdGF1MmZXeklOamJ3bnVWMzNhU0NIU3RqZ2l4QXVRT25GeUhWWDNEd2w5?=
 =?utf-8?B?VDNOZHl1amdBa2U2YWgrWnAxV2hock94VTBXcGtSWHNFbnZScEx4SU5aTjQ5?=
 =?utf-8?B?VTRFdEIrMEFtZnJvRXRoKzhHVldJdk1WVUZFMGxvQzBvVm84RXFpUExKcjYr?=
 =?utf-8?B?QnlMcGtKS2RxQ1F3SzIyU1ZBTUY1N29HT1dxNnBGZmU2YTI3QzJvYnQweWpp?=
 =?utf-8?B?Q01tblVmQWtkdDJMMDlvbWEzclJ2bExiVXpOMCt1Q2tHUnJVbHdOMHFYVzdm?=
 =?utf-8?B?QjAxcmRodDVNKzJoa3NBQnhjbXFldHZ1YXEzbmVGaC9DNldXQVZnVnY5MDBo?=
 =?utf-8?B?SGtwZjZXNXJGS3RhOXAxUklsTC9wNXNzMFZmcVI5T1ZVcXNsK3NZQTZGcE9Q?=
 =?utf-8?B?MzJjVzUzWFRaQUNxZEUrTTE3U2JHK2h1eXJkUEt2K1Zaa2JQRm9rMEQwQVZJ?=
 =?utf-8?B?Z1QzZDNpM0Q5bVFnbzhkOWRacjZqbHdLN1JIMWg4VE5TN1l5b0Y0QzROY1FE?=
 =?utf-8?B?cWV1K2k4c3krN2hLSGo3THgwampsU0hkeVAwWUJBZXdEVmR5SGZlVTZJNG5i?=
 =?utf-8?B?U3NWTjFmQjd0cTBWZDArUFNzb2lEVUVQd0lXZU5GSGUxci9TNVlIak00V244?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a56322-95d9-463c-ac80-08daf5ce7781
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 01:27:14.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMx/JMbHXVzEItbadZz95tDnRh1P8uOKy3rkyvmfBqoZvGa0IjZUOEI/RfXVbDxxEdPLECr0HNdInuZ6flk151n7++DkAeuJqSwwFczRGas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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

On 1/13/2023 01:22, Tvrtko Ursulin wrote:
> On 12/01/2023 20:59, John Harrison wrote:
>> On 1/12/2023 02:15, Tvrtko Ursulin wrote:
>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Engine resets are supposed to never fail. But in the case when one
>>>> does (due to unknown reasons that normally come down to a missing
>>>> w/a), it is useful to get as much information out of the system as
>>>> possible. Given that the GuC effectively dies on such a situation, it
>>>> is not possible to get a guilty context notification back. So do a
>>>> manual search instead. Given that GuC is dead, this is safe because
>>>> GuC won't be changing the engine state asynchronously.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 
>>>> +++++++++++++++--
>>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> index b436dd7f12e42..99d09e3394597 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct 
>>>> work_struct *w)
>>>>       guc->submission_state.reset_fail_mask = 0;
>>>> spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>>   -    if (likely(reset_fail_mask))
>>>> +    if (likely(reset_fail_mask)) {
>>>> +        struct intel_engine_cs *engine;
>>>> +        enum intel_engine_id id;
>>>> +
>>>> +        /*
>>>> +         * GuC is toast at this point - it dead loops after 
>>>> sending the failed
>>>> +         * reset notification. So need to manually determine the 
>>>> guilty context.
>>>> +         * Note that it should be safe/reliable to do this here 
>>>> because the GuC
>>>> +         * is toast and will not be scheduling behind the KMD's back.
>>>> +         */
>>>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>>>> +            intel_guc_find_hung_context(engine);
>>>> +
>>>>           intel_gt_handle_error(gt, reset_fail_mask,
>>>>                         I915_ERROR_CAPTURE,
>>>> -                      "GuC failed to reset engine mask=0x%x\n",
>>>> +                      "GuC failed to reset engine mask=0x%x",
>>>>                         reset_fail_mask);
>>>> +    }
>>>>   }
>>>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>>
>>> This one I don't feel "at home" enough to r-b. Just a question - can 
>>> we be sure at this point that GuC is 100% stuck and there isn't a 
>>> chance it somehow comes alive and starts running in parallel (being 
>>> driven in parallel by a different "thread" in i915), interfering 
>>> with the assumption made in the comment?
>> The GuC API definition for the engine reset failure notification is 
>> that GuC will dead loop itself after sending - to quote "This is a 
>> catastrophic failure that requires a full GT reset, or FLR to 
>> recover.". So yes, GuC is 100% stuck and is not going to self 
>> recover. Guaranteed. If that changes in the future then that would be 
>> a backwards breaking API change and would require a corresponding 
>> driver update to go with supporting the new GuC firmware version.
>>
>> There is the potential for a GT reset to maybe occur in parallel and 
>> resurrect the GuC that way. Not sure how that could happen though. 
>> The heartbeat timeout is significantly longer than the GuC's 
>> pre-emption timeout + engine reset timeout. That just leaves manual 
>> resets from the user or maybe from a selftest. If the user is 
>> manually poking reset debugfs files then it is already known that all 
>> bets are off in terms of getting an accurate error capture. And if a 
>> selftest is triggering GT resets in parallel with engine resets then 
>> either it is a broken test or it is attempting to test an evil corner 
>> case in which it is expected that error capture results will be 
>> unreliable. Having said all that, given that the submission_state 
>> lock is held here, such a GT reset would not get very far in bring 
>> the GuC back up anyway. Certainly, it would not be able to get as far 
>> as submitting new work and thus potentially changing the engine state.
>>
>> So yes, if multiple impossible events occur back to back then the 
>> error capture may be wonky. Where wonky means a potentially innocent 
>> context/request gets blamed for breaking the hardware. Oh dear. I can 
>> live with that.
>
> Okay, so I was triggered by the "safe/reliable" qualification from the 
> comment. I agree "reliable" does not have to be and was mostly worried 
> about the "safe" part.
>
> From what you explain if short heartbeat, or manual reset invocation, 
> could actually mess up any of the data structures which added 
> intel_guc_find_hung_context walks and so crash the kernel.
>
> Looking inside, there is some lock dropping going on (and undocumented 
> irqsave games), and walking the list while unlocked. So whether or not 
> that can go bang if a full reset happens in parallel and re-activates 
> the normal driver flows.
There is no walking of unlocked lists. The xa_lock is held whenever it 
looks at the xa structure itself. The release is only while analysing 
the context that was retrieved. And the context retrieval itself starts 
with a kref_get_unless_zero. So everything is only ever accessed while 
locked or reference counted. The unlock of the xa while analysing a 
context is because the xa object can be accessed from interrupt code and 
so we don't want to hold it locked unnecessarily while scanning through 
requests within a context (all code which has no connection to the GuC 
backend at all).

I can drop the word 'safe' if it makes you nervous. That was only meant 
to refer to the possibility of such a scan returning bogus results due 
to contexts switching in/out of the hardware before/during/after the 
scan. There is no way for it to go bang.

John.


>
> Regards,
>
> Tvrtko

