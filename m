Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6724AE186
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 19:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4634B10E6F2;
	Tue,  8 Feb 2022 18:53:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7045F10E6C4;
 Tue,  8 Feb 2022 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644346417; x=1675882417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=duzqX/wZh5jOOp1K2fIBvs/GhUfSS14eGWlH1/sVYm8=;
 b=HoOYieG4CBS+T+d8rdyS1OxFRjA+7S1xT0y/rQxktQvzAWD46J+MMmSq
 F54zl2uAt6GNAvucI65C+e3B/km8QAVRbrefeml9L7fPYCnvuAxwFL1TD
 wW4XNNL3NSh2l7Y9ddGtkilzEfQktnQvfVzwDOmgtG1b3pa94FQHVWpRK
 e00cCqc8xI744Mcq+QkcI6pur7DZ5xrzzW3UEbL5lvzSKpC2KaNCATkvv
 pfk+GX61GpkrKB1L5II55cBNt7ULkgJrCTIhOxiG9EfxK78hg13+IPzDp
 Tb9FCMfTjz6E5D8/88PXImbekLdiMDY4YxTM+38SLTFmSh0F/P0w1Pjej g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="247858418"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="247858418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 10:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="632944695"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 08 Feb 2022 10:53:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 10:53:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 8 Feb 2022 10:53:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 8 Feb 2022 10:53:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvaUoZRjv1TxUAsdsSBHTs9XlXUz/82p+32WyMYqLCXC26GCQUjBeF8LEeLwMJMyoMm3+b2alC9KhmXojaZywiBE26pWihQo/nBqlKfKn3aTlERN31sTAW2TUE9VyrbPX5KlDTeeLPWQNujzm7RDtIj1F2m8aqpBHyS9HMBwalWuIOsK1gQVvWyewBst+niWRiVN6qPMo+Gje6/AxoMIdaPf9pn89bbaRWakmvzdhw0f5SBfBAgvH70p/MvQjKBVTh7E5Da7NVF9xRHpQLniMd4lTMmQ3zdb05lacqfTy/8ot9i5YEBqkz6FPJmrmBzbvKXk9yX6MEb68JQaO/2XBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NMFvRnWrJSK+SwqA9y+81nhoDZaCL3WkyCEBCtLQuY=;
 b=WPNYvBNzdSxfLdnRpLy9lqc7ZShPDpfzxd0ec7IPcOoXPCRojs+JAt+I8GDnso3lK/OYA0PF+UsJvQyo/M9dSX8ags89uQ/xbEHUuFZ297HHMWm8cr/+lHJ7ve3mB2hzx+KDzFqUY3WVO27ttCEj64Nm4CcTGBW9L46Vo8yh8DqqmgjtXV4gQalfviaSTEHpEpXC6E8XvsGjHgJ8bmBI9kxj5SoR75e/JjFzUzJumq+TUtTi9CaRWBWxnbP9Sm+Xu141C8AAjadj+qXwXAsKCoOlW8GMpyIThS4Llyknp2bV0MtrIcERNv3PQwkefo2JNkUm+n82ueZMvXwbAoESPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3751.namprd11.prod.outlook.com (2603:10b6:a03:f8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 18:53:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:53:34 +0000
Message-ID: <eaf8a239-57c6-69e8-a166-987eb6338acb@intel.com>
Date: Tue, 8 Feb 2022 10:53:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix flag query to not modify
 state
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220208020716.2140157-1-John.C.Harrison@Intel.com>
 <ba8ce5c6-ba11-f2af-917c-9e6e14445d43@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ba8ce5c6-ba11-f2af-917c-9e6e14445d43@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:300:95::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0a7386-9883-4c68-7ff7-08d9eb344e80
X-MS-TrafficTypeDiagnostic: BYAPR11MB3751:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB37511690AD8C85B76F09918BBD2D9@BYAPR11MB3751.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BaIToCR6rGnhf5YDrMQjPkgN4kfE/+2hZs4j3u1o69Eus1JBD4UYFm5AXTNYzbsxc7MGTA1PMQeKKAoAOXOsFt69oDtKRlXwSjEDLkH2bDkEcubVKDAOUq3o2Ty1vjMGsNX6sQtF/dXGlbdhQPa+76GO23v7PFNcOxmSKhl2ClOo2Irp7N2BnYQ7lE4d7UtvyQ2yD+GdVxa1ILoiMzIzagjniOuSbLUCJMpwYN8jDu+KOFJYsWa/BJsD0Y2ULxTdgEaVWHLh2tgLGTp+qqGjxdXuTO6bOEnlFgBKF7ExTvIXoTX6Evo7yRNg/9eyzWoCcH0rfyKw4+dLDxaK3MSqWL/N1euCWvhjfJyKochuxh7DxYWK2zHQ7Toa6hj3S5r+veXHpRsGv9vNMOnRWA32qgqVdtg3QtCdbjaIvfjdnDKQSvNWH0rkkWuGYDRbRuE2wNJGt5tdn3Ed4X80Ma4H62NxPBZS2CiQW3sRbl4w6FTNuoQmF50wl42eSQmda8zWm5Pz1UPj3GnEQ9WZEicUANinuWCuOMlvmPJB47ZoPutVseE52knqfNN3unU10seD8Npfd18l1O9AjXLPDRggaWz3nIseBKqCLipCkFLXzPD10ra8jT+JkJz3wiHXbJHEo74zfoM2pcflfJOxgovFeIIuxXeeTm3nx+iRUqeadLyTEGOfLSOurqkuTQrbA0RXiG9z1+e7EnzHPlbQBDon1j8rm3/ZxdSAe0iRGX+H1vB7SmIcAqgyI7dISiSvHcpuh9uvaDuoGw9akXBi3gjLKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(82960400001)(31696002)(31686004)(86362001)(53546011)(38100700002)(508600001)(6506007)(6512007)(6486002)(5660300002)(186003)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(83380400001)(4326008)(8936002)(8676002)(2616005)(6666004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0NpTzdWTzVoNzExZHdaTWVIYk1kZnJYdUlGenorTFJxdFdNTFhvb3NNejJT?=
 =?utf-8?B?eWVHcFpEazZhT3Z5ZXlaNE5YaEpZYytHQXYxMm5ZM3BRb0VyTE1qRDJkUlVy?=
 =?utf-8?B?d2diMnRxVk4wM1JMeXlpR0lBT2tOM2hUQWd6bmxKVXI3UStzRW4rOTZuYmNx?=
 =?utf-8?B?dy8rVTJlWGE1SFVnblNPUDJjOVdrV2RyUkprYks5Z1lhUHJZaUYweW4vaHc1?=
 =?utf-8?B?eE8xMHd6UHdpSkQ4OEtEL0Vma2w3OFlMRWU2U1ljTHFqdlZ5YVg5Q3RZMWNj?=
 =?utf-8?B?dHBrY29aN1pRNjBBc2laVHJpV2FZSHhyNHNCT2xSaElqUTF2QzExdXBkeE9p?=
 =?utf-8?B?L3pub2tWUkJGZ2RDOGFaNlNIMDRXZ0ZLQUt4MFZTZ09mTGVFYjZSWENMVkZ3?=
 =?utf-8?B?bkpuaFRielRoY2puNG9pN2ZKeGc4dDhQVUFidnI3eERWc08wZ1VRS2VVOFRF?=
 =?utf-8?B?Q05SYUZFTU80R1R3R2NVM1FRSzBBQzFyaWhoYmxneGE4WW1ySlJZQWRxWjQx?=
 =?utf-8?B?MTVaZkJPUXVtRTA1TDhrKzFIVkhwd04zM0hIVEkxbmhZVGpNNHpISXBRRk1q?=
 =?utf-8?B?NHF1OFUxNGZoV3BYS0NvL1RreHFjYzhrMGp1NUgyd0tqWGM1djZObnA4ZUdF?=
 =?utf-8?B?am50aW0zZHFPQU52Wm5WeDh0VHF3eFV1UWRVT09CakVJRzFweithNmVvWmZq?=
 =?utf-8?B?QTFNS0k4elRWdHArZ3ZueFVJVE9ycENiZFFCYVF3RHNJOVBUUE9UMzI5T2dK?=
 =?utf-8?B?eVlZOC8zdG5mZUZORVQ4R2FHdlp2eC9FQVNlMENkbUp0MjJPOE5Dems2Q3Yy?=
 =?utf-8?B?dWlKU3ZXazZzYUF5bzk0WW9BSVlqOFNzUnQ4VnFhOFkwYkpHR2xwZDB3RzFZ?=
 =?utf-8?B?SDJxRlljdmdFOURtaFBrR0JIRmJkOC9tdFNrNkFBaWI5dFRFam40WWp6RXRW?=
 =?utf-8?B?cW90OThCQVIvN2ZaWjVaZW45REpjODRtM2o1a05DZDYwd1ExZVU5QWI1amFK?=
 =?utf-8?B?UGVodHdCRUJLNjcrMUlDT3RnV1lFS0kxc2pMWkRiZFZZME1qQUFUU3hMZjd3?=
 =?utf-8?B?SW9yVTlsK01HSFQyeFNSMGlGNXRhUnU5cjVRcEFMaGU1TmhEcURDcGRVRnNp?=
 =?utf-8?B?WHJwWFlDT1dRQmw2UVBJQlZrNUU1UEMyUU5MNU1XVXZjbEd2VE5PODdFaHdy?=
 =?utf-8?B?SDREVXRqeGZXbllaYnhaRTZwVjJTNkFxRU1kVUF1bHdjeE5LNWZsZUNYdlpD?=
 =?utf-8?B?N1owRHJOc0ZsMENDUXhXYXlydTlGY1NBcWh4bEtKbTA0YjJXRjNBamRCVDBs?=
 =?utf-8?B?WHZjM0NZb05XdVFjT3ZGWU1jcFVlOWM3bG9pRGhmKzl3ZUNHbDl3RXpaYTM0?=
 =?utf-8?B?dUsyRzNlcHdqQmY3UGFaRXdrRTcvdnNqQjBrZUNPNDJxWDdrb256VWp2S051?=
 =?utf-8?B?Unk0dUhKd0JpN0IwaVF5d2tabElvbFNNdEk4QzJZMEZMdmNEUzlnMlBYZHZG?=
 =?utf-8?B?cW1xejNjQm42Nmd1cWJ2MS93VndTc05xOVlWdWtOc2kvWGt4WmQ5dFpVS3F2?=
 =?utf-8?B?S0tEVE1IbjZBSFhNOVlCZTJOSGNxMEdJSSticzlqbER0bENQc1Z0VUU3VEtP?=
 =?utf-8?B?b3dQSFZvWTU2eXhkc0Ryd2lQUUJ0bGs0QUxjUUh3Wk1Ia1Y0RWpCR0tad083?=
 =?utf-8?B?Y1RFQVhRQ0UvaEFINjZJbUlld3pPaVI0Wnp6V2RnOFI5YXdabm16Y1pZazlN?=
 =?utf-8?B?cTlhZnJmUlhHR095ZmhGN0lPOGZEL1owZXNiL1IwTDVBSGhVMzNoZTMvdzcr?=
 =?utf-8?B?ajViYU1TLzBHRDlDTEwyOG4xODY2U0hHTU1sdCtGUFdaV3FpOHpGQ0daSmNj?=
 =?utf-8?B?S0M1Y2xuSHRmWHF3eHVXSkwydFBXZEUrRktnUzJ3aXN5T2lTd3d2aVAyc2Fk?=
 =?utf-8?B?elRsVGo2ZGh3Z2JteHhBa2pZZmY2Qm9QRzI1QUQ1K3cvblZBN3hrbDBCb1NQ?=
 =?utf-8?B?Nmprcnh1L3Z4VTRnSWlkN2lBOGg1T0dPVFRxNEtycTJ6V3lrcWhheTJCRUR5?=
 =?utf-8?B?eGZ2T1BjdExHNDFKbDVhcWgxbXQ1b3BRLzYrUEdpT2dKeUJVNUs3SjAra3J4?=
 =?utf-8?B?YzZCNDdjSVFNVGVJNlM2cGc5UEpGbUZGWm9FOHFjWERyamRNZG5ZR0l6OHEy?=
 =?utf-8?B?NWt4dE9TWGxPamVDbW9pMEIvaTZYZVp2eTNkR3Rpa0F2a3pld0t0Q3ArdFpQ?=
 =?utf-8?Q?HZfcy9lnjOitpARmF1nQIZL7ziSNdjsbmY0f7jY9bg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0a7386-9883-4c68-7ff7-08d9eb344e80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 18:53:34.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu3Ts31RfJnYWts6JQPn5fLam5FdFZ7NXEVP4/Y6IdziChOgi4So/k8e01ZOCVYaai+YGypP8uWqWxSat76kGwkcvgqHD83ZSyHDJ9ME8Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3751
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

On 2/8/2022 01:39, Tvrtko Ursulin wrote:
> On 08/02/2022 02:07, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A flag query helper was actually writing to the flags word rather than
>> just reading. Fix that. Also update the function's comment as it was
>> out of date.
>>
>> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
>> Signed-off-by: John Harrison <john.c.harrison@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b3a429a92c0d..d9f4218f5ef4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -174,11 +174,8 @@ static inline void init_sched_state(struct 
>> intel_context *ce)
>>   __maybe_unused
>>   static bool sched_state_is_init(struct intel_context *ce)
>>   {
>> -    /*
>> -     * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED 
>> after
>> -     * suspend.
>> -     */
>> -    return !(ce->guc_state.sched_state &=
>> +    /* Kernel contexts can have SCHED_STATE_REGISTERED after 
>> suspend. */
>> +    return !(ce->guc_state.sched_state &
>>            ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>>   }
>
> Looks important - what are the consequences?
Supposedly nothing.

The test was only ever used inside a BUG_ON during context registration. 
Rather than asserting that the condition was true, it was making the 
condition true. So, in theory, there was no consequence because we 
should never have hit a BUG_ON anyway. Which means the write should 
always have been a no-op.

>
> Needs Cc: stable for 5.16?
Meaning "Cc: <stable@vger.kernel.org>"? Or is there anything required to 
specify 5.16?

John.


>
> Regards,
>
> Tvrtko

