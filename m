Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB055BC62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228F10E48D;
	Mon, 27 Jun 2022 22:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D2010E46F;
 Mon, 27 Jun 2022 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656370355; x=1687906355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWJd6hTLJl88klLdxIEapNiKsF7mLDDWtRLSg2HLOro=;
 b=DOKf6osSvw4ZZ3ftklX9rtg7y5HF+dfYPMp/9ZXzv8L+1ohoxm/IqL+2
 F3gKNmNf4TpYbYdAoYoqcuI+TlFmDVEYslABskqghgrsiHmLDs3TIU5Io
 RhmraUvAExbqyBgIo4nicbdKhZyQoOr7COiokHNsmaPHfpikhUkQdmUue
 nFdH76+AQ7xt8ksqTJIITxilMzJIW1VYzoB3oQfyuC76DcRnNUZPB5mRw
 VY2s5ymza1OV6C2tZte7ZTAjvX87nH/o8X/BXU+CsPYoGUYw0MpHGVl5+
 uWuLTUz1cTSUDCBE8pgfajK4jFxKgD1QytwmzpvB2oVA+KlFF/eh4wgik A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="270326757"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="270326757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 15:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="679780953"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2022 15:52:34 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 15:52:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 15:52:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 15:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc4v7GsjPmK0oYJCu7s7R27GXt33N6ovpt9HkaTaPM00rV1Rap0S7liCba8BoACchheMZPPjVMnu1eL4JXKsnhfbVuV+Txt10i6vuRF6ZAFjFd5+7BEXqNSZGzTY4rdyTefQtIbZovYBg5zwuo1YqWuL2nSwgjpehUwWl8svPIBWWEjQI+RB5k2sQ7HG/4NXnMcJ9SifV9MsZ/l3b8MQjy6cz7oBQbE9XLs4sDk5Rznk/1r/IOrpRJFOwtrT3CDaCrTy7w8BwplYVin5HwjkvLfa/EFOnvC+dGtHUD1FJItkQrWg34QNrmrGPLvLYa/5pomlGA28DqiRBJv3W7RW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XkJdv5ovaWWIv6dYpNZI5gyry1c2DQJnGe3WvUT9dM=;
 b=In/sB1n5MgyJIbJ8/lB1Hlh33p/8qFvIN9CDwVLMD2ShXBGyn0EpjWTl8QWWnIxXk3qf3jZjB/W/LG5N0+YNFi+qghRyZyeZoo2Q3it7l/lCE9uDZURJdzLJ8fzH7htA1kummLO/lwRTGf2jbGCo+U1OZ2INLWw0kfnPBKGOArjSaW3mbvdexw0H2KffiT2cDyLm3P6Pmv5Htcvpo9CbZsgxIuVLdtn/YlvhLxJk39V0DEGa6IzoRTrbjImkCJ46TtqlbD+QqkaHyL1jww/jNumRZWwLsiNHihAJBW7dBk82EM/OcCriKxzoDStNbftV7g05aCAU6xSuiSs7xjqEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Mon, 27 Jun 2022 22:52:32 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 22:52:32 +0000
Message-ID: <4690b155-b10b-e091-b77d-6575ad553cb4@intel.com>
Date: Mon, 27 Jun 2022 15:52:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Add a new SLPC selftest
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220610234712.36849-1-vinay.belgaumkar@intel.com>
 <87leto1lsc.wl-ashutosh.dixit@intel.com>
 <9d734dfa-ce26-465a-d20a-90dcd7355e78@intel.com>
 <87letl8kbw.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87letl8kbw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83bd1ba4-2e06-4201-0a16-08da588fb7ef
X-MS-TrafficTypeDiagnostic: DM6PR11MB4074:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HR5/2WivQZk67HeMLlVGcx3OuzxLqqrU26nuDyLMOE4t3FgZxi2WrhffKoihl5U3DNMnjZc3IqpxVhjxi+0ZaC/27pIsf8BFO+45EAKL2Ucq4W8eTmUezzhNyhoqN3ru0usA8fP3DYJF3q2dLX2HvrKtU7dJt5ojWoLH+My0l2aH8YDw2EnQBkpQbhEXQ3mc+5+wN2yLx1Co5LjI/jqCCRhcrGONVshvU2sQ684vwGl4N8GQAgcscwBd8NYZGaw6EN41bTah6yAOaT9PipzYIXSYhyG0gwCq9yAm+2XoGwPVS6X7oH8LyFxpTK09tgJC7yvjNl8UQQomnAZCxT2ZcCO/47EoSszC4wR7n9pGCaTfQNv+LJgZvD+Ve+l6slCW0JWGRLmhjRA8jr0IJtPDXSvtOcOVHXtZ9CA3gcj7z4KcAfRKwYSw+qzgcs90gORzv3UIgprZkAotNaD+TH1E5p8KT90JbQrZt2xG5f6M0UNW410A4ZMxgHnEI/EtZ7V3V+DcknpVbocLLnlJFygsud/EO1eACz7ecazhzJqhl+0tufySdK1E+qciSSRu83yFsmeD62qZBqirf7hTDtFCIgXtjweniXK1tTWUfD04Vb9/1mTf4T6Tj07zuwzNQrfyAAlvltLRYkuhXiqGVTPhRqwvxw8FiE7RXwMHpu7k3/ld0olVN6ltPhr8tAIm1EtmElQ0Ot2kloSsDgdd3DL+6EGJubjN3jqB+4s856oNOKpweWVV74jXYnhtcR7CpdAqyct+KPPDNkrwBueF3uKbKddHAnLjE2t+nySb5TJnZ65jx+BGVPVvdoTXl3rWhRgLxqUkj7MPjr5gZ2ggr9B3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(396003)(39860400002)(136003)(346002)(6506007)(36756003)(53546011)(82960400001)(86362001)(8936002)(186003)(66556008)(6862004)(5660300002)(26005)(31686004)(6512007)(66476007)(450100002)(38100700002)(30864003)(83380400001)(37006003)(4326008)(6636002)(41300700001)(478600001)(2616005)(66946007)(31696002)(8676002)(2906002)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVQrSTBQZUVyd2ZnaStpNWpZWW8wM1BRVzFzaXprVi9kcGJabUhQdzlXR0Zq?=
 =?utf-8?B?NHRRSS9QVlExMldlNWtLTmQ5L28xSG81ZnFMR1NvMGJXbzNORHhvZEVaSWJB?=
 =?utf-8?B?QWZ4VTFLUHFSeVcyaVRMTWVoTEpVU3RZZitFZUFmZHRRRlNGWkZlR0syQTRN?=
 =?utf-8?B?b1VHdzJuODFCSm1uM054NlJMeEtBR2Y4RHVHK3hLOHJxNGdtYkdNQ2tHb3pU?=
 =?utf-8?B?MEJHeHJXZWVSSjhxaTNNRFNOSDlGZTlSZEgzeHdYeGlQcDhEbERKa21ybWpj?=
 =?utf-8?B?MjhVWnZLSnlWQS9Sa3VTeGhnR2J6dkt6bSs3SHMwRy9RQXBTVDYxdXU2b3o3?=
 =?utf-8?B?L1g0dmoveU5FOWhxYnNPZFI0UVhaczljSHlHc0NSUjlEcHNtemdVVW5CUnZm?=
 =?utf-8?B?dzdHQ0t6WjhES1RsMGpOZmYzOG51a1F3ejE0NUR0OHE1N2JQMGZoZ0JMeWRh?=
 =?utf-8?B?emI3NWpoY3J6eno0dTJzQWkzS2YrenNDaWhDUTRjMk1hT2x6aXRBbWg3eTFN?=
 =?utf-8?B?cXBhRTQzUTM3WC9kYnZmVkxPVXhIUUg3dVk2Y0paSVZzNXV2SU1pT0UzR0l2?=
 =?utf-8?B?d2dUaDdxeno1Qld2T0p1L3ExMEtDd0JEd2JnclIzUXVtMGR5b0lCakJxVEVu?=
 =?utf-8?B?bm95eWdxRFk0d1g1ZUZoWlJRZVluVlV5MmxNTnpkT3h6SHcwbnZIN0llZVl6?=
 =?utf-8?B?cEFQOUltWFdmUHFIcm1NV2tFT0Z4bU9YZ3BvNFpSRDdEZnB6cGZ4MlNCR2Zn?=
 =?utf-8?B?RDB5dERwa3JHUXNBSkF1M0NDejYwWHZOVy9OeGpXcXRSVkNueUxtM3NoZGJy?=
 =?utf-8?B?eVNYUS9XTks5d3I3V0ZING1FWFJCL3BnM3Fjd202UERiekU3Q1gzL3NEdUJu?=
 =?utf-8?B?UWoyY2hlS0Y1TjNEWXAzYVNNdnp4WEtBQ0NVdUl6NlBhRFRhWFArS2N1OFVJ?=
 =?utf-8?B?TWRKTTNRNUZCMFFxeUhWL0NORTlJLzYwa09IMXRoMHJrQVpjYVFPdzA2ZlJn?=
 =?utf-8?B?VE0xWU9wdERWQmIrWDhGSlVCWFVlQTRGUzFtRDlvdFBpNGcrdFhFYlRyTE1x?=
 =?utf-8?B?TDc5bkN5UFIyMUhNRUltczB4Qm9kR0xNRzlVM1NHaFh2bCtXaDNBbkdxMDIv?=
 =?utf-8?B?eXQwVUMyMmU0bVIyU3ZWOW4xdFdGNmJZUlNHQ05GYUhxaVdBVUZOU1diN01m?=
 =?utf-8?B?Zy8vU3hDbUhCdFArYWdVamVCTnpLa2REbjQ0NWs0NkRDRWVBUHdtVll2ektC?=
 =?utf-8?B?aEU0MFNVakJUcTFVSXFPTWV4Slh6c3ZGWWlDUjQ0Ynd3eG1ORXVBekZZVkRW?=
 =?utf-8?B?Z0Q4RHBhVFd3SHliaE5OS0VOMEdOa3hSOFhEUUczUFloQ0YzMzNjN2lNUXB4?=
 =?utf-8?B?TDZaRXkrN2xjWk9OQVVkNzE2VDhsU2NaS2dTMC9xWHVnQ3JQS3dLMGJsWE9O?=
 =?utf-8?B?VjlzTFpWaDdYNW9IVVBueHBubzBoRVF1enN6K2NITERFTjFUWi91K2xqSnJx?=
 =?utf-8?B?SmVxRXJ6ZDZCSGp0SjU5QS94NDJGUUxHSEpOR3YvOCtxQTd0NG9jbXY5b2Iy?=
 =?utf-8?B?a0JLR29pQkd5N3dUQUtYbG9FclhZZXRPTTJ6SG8yNXRFUktDUFJoR0MvZjJN?=
 =?utf-8?B?NURiODYxQVJpeGU3c0M0dGM0WW9DdUJsZ2FKMjJUMzh2ai9kYm1CVDdhSStQ?=
 =?utf-8?B?L2o5RUNoSTV2dnR0ajErdkhQaGV2UDgrYWwxV1Uwa2pMSWhRYis5VzhFMkJt?=
 =?utf-8?B?T2tEVTRUMmRQZmJ1K2l3cGVENXBuSU9aYi9tV2hodTNZZ1pjam03dWoxMnUr?=
 =?utf-8?B?MitaV2l4NmNCN3MwR0RvVzV6WjE2djNKS2RMVkZIM091RDZNWWROREJ5SjhN?=
 =?utf-8?B?MWxSNFQ3bGo1cTFhQjhPQlFBNC9xeC9udmxaSzhZVUVUVFdXTzF6QXYvR3FB?=
 =?utf-8?B?NzhDYUE3a0s4RTJ2RHZ1R2NmYUlkdWF0ZEh6cTI2bnNQOFRMMUk5K1V5Rmx4?=
 =?utf-8?B?c2ZsQkhleTBMZjNxL2IzVGptVHNka09LVmh5dGJ0WUlMd1o5NHlkaHJzOS9O?=
 =?utf-8?B?NjdOS0ZKVGlCUGorMzlpcmxaSTk0UC9Xa3h0Q3BjVTltYVdKcVdLaUVYd3B1?=
 =?utf-8?B?Zkd3STRuVmZWaWQ4Q2oyaWI0TU1BNnorT1R6QTgrNWpUZGZpNmkxb3l3ZUdY?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bd1ba4-2e06-4201-0a16-08da588fb7ef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 22:52:31.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCysTgCBtv60OnQQkSWt0NlBxC2Ylb0KPZVS6/U6Emb29YscJGG6Jmq64bkCdrjMPAB2jKRHZev/h2s4SgU8DrGPDvKqfSVkBqLG/8k+kkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4074
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


On 6/24/2022 8:59 PM, Dixit, Ashutosh wrote:
> On Thu, 23 Jun 2022 16:21:46 -0700, Belgaumkar, Vinay wrote:
>> On 6/22/2022 1:32 PM, Dixit, Ashutosh wrote:
>>> On Fri, 10 Jun 2022 16:47:12 -0700, Vinay Belgaumkar wrote:
>>>> This test will validate we can achieve actual frequency of RP0. Pcode
>>>> grants frequencies based on what GuC is requesting. However, thermal
>>>> throttling can limit what is being granted. Add a test to request for
>>>> max, but don't fail the test if RP0 is not granted due to throttle
>>>> reasons.
>>>>
>>>> Also optimize the selftest by using a common run_test function to avoid
>>>> code duplication.
>>> The refactoring does change the order of operations (changing the freq vs
>>> spawning the spinner) but should be fine I think.
>> Yes, we now start the spinner outside the for loop, so that freq changes
>> occur quickly. This ensures we don't mess with SLPC algorithm's history by
>> frequently restarting the WL in the for loop.
>>>> Rename the "clamp" tests to vary_max_freq and vary_min_freq.
>>> Either is ok, but maybe "clamp" names were ok I think since they verify req
>>> freq is clamped at min/max.
>> True, though clamp usually is associated with limiting, whereas we actually
>> increase the min.
>>>> v2: Fix compile warning
>>>>
>>>> Fixes 8ee2c227822e ("drm/i915/guc/slpc: Add SLPC selftest")
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/selftest_slpc.c | 323 ++++++++++++------------
>>>>    1 file changed, 158 insertions(+), 165 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> index b768cea5943d..099129aae9a5 100644
>>>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> @@ -8,6 +8,11 @@
>>>>    #define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
>>>>    #define FREQUENCY_REQ_UNIT	DIV_ROUND_CLOSEST(GT_FREQUENCY_MULTIPLIER, \
>>>> 						  GEN9_FREQ_SCALER)
>>>> +enum test_type {
>>>> +	VARY_MIN,
>>>> +	VARY_MAX,
>>>> +	MAX_GRANTED
>>>> +};
>>>>
>>>>    static int slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>>>    {
>>>> @@ -36,147 +41,120 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
>>>> 	return ret;
>>>>    }
>>>>
>>>> -static int live_slpc_clamp_min(void *arg)
>>>> +static int vary_max_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>>>> +		  u32 *max_act_freq)
>>> Please run checkpatch, indentation seems off.
>> I had run it. Not sure why this wasn't caught.
> Need to use 'checkpatch --strict'.
ok.
>
>>>>    {
>>>> -	struct drm_i915_private *i915 = arg;
>>>> -	struct intel_gt *gt = to_gt(i915);
>>>> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>>>> -	struct intel_rps *rps = &gt->rps;
>>>> -	struct intel_engine_cs *engine;
>>>> -	enum intel_engine_id id;
>>>> -	struct igt_spinner spin;
>>>> +	u32 step, max_freq, req_freq;
>>>> +	u32 act_freq;
>>>> 	u32 slpc_min_freq, slpc_max_freq;
>>>> 	int err = 0;
>>>>
>>>> -	if (!intel_uc_uses_guc_slpc(&gt->uc))
>>>> -		return 0;
>>>> -
>>>> -	if (igt_spinner_init(&spin, gt))
>>>> -		return -ENOMEM;
>>>> +	slpc_min_freq = slpc->min_freq;
>>>> +	slpc_max_freq = slpc->rp0_freq;
>>> nit but we don't really need such variables since we don't change their
>>> values, we should just use slpc->min_freq, slpc->rp0_freq directly. I'd
>>> change this in all places in this patch.
>> I will remove it from the sub-functions, but will need to keep the one in
>> the main run_test(). We should query SLPC's min and max and then restore
>> that at the end of the test. It is possible that SLPC's min is different
>> from platform min for certain skus.
> Sorry, I am not following. The tests are varying freq between platform min
> to platform max correct? And platform min can be different from slpc min?
> So why don't the tests start at slpc min rather than platform min? Can't
> this return error?
Will start the tests from platform min -> platform max, that way we 
remain consistent.
>
> And shouldn't slpc->min set to the real slpc min rather than to the
> platform min when slpc initializes (in intel_guc_slpc_enable() or
> slpc_get_rp_values())? (I am assuming the issue is only for the min and not
> the max but not sure).
Certain conditions may result in SLPC setting the min to a different 
value. We can worry about that in a different patch.
>
> So I'd expect everywhere a consistent set of freq's be used, in run_test()
> and the actual vary_min/max_freq tests and also in the main driver.
Agree.
>
>>>> -	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>>>> -		pr_err("Could not get SLPC max freq\n");
>>>> -		return -EIO;
>>>> -	}
>>>> -
>>>> -	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>>>> -		pr_err("Could not get SLPC min freq\n");
>>>> -		return -EIO;
>>> Why do we need these two function calls? Can't we just use slpc->rp0_freq
>>> and slpc->min_freq as we are doing in the vary_min/max_freq() functions
>>> above?
>> Same as above.
>>> Also, as mentioned below I think here we should just do:
>>>
>>>           slpc_set_max_freq(slpc, slpc->rp0_freq);
>>>           slpc_set_min_freq(slpc, slpc->min_freq);
>>>
>>> to restore freq to a known state before starting the test (just in case a
>>> previous test changed the values).
>> Any test that changes the frequencies should restore them as well.
> I was saying restore the freq's *before* starting the tests as well to
> start from a known state.

Ok, so 2 things here-

- A test should not alter the state of the system - we need to save the 
slpc_min and slpc_max at the beginning and restore them at the end.

- A test should start from a known state -We can set min/max to RPn/RP0. 
Also, what if RPn = RP0? This could be a bug in the fuse registers, so 
we need to flag an error.

>
>>>> -	}
>>>> -
>>>> -	if (slpc_min_freq == slpc_max_freq) {
>>>> -		pr_err("Min/Max are fused to the same value\n");
>>>> -		return -EINVAL;
>>> What if they are actually equal? I think basically the max/min freq test
>>> loops will just not be entered (so effectively the tests will just
>>> skip). The granted freq test will be fine. So I think we can just delete
>>> this if statement?
>>>
>>> (It is showing deleted above in the patch but is in the new code somewhere
>>> too).
>> Actually, we should set it to min/rp0 if this is the case. That change will
>> be in a separate patch. This is needed for certain cases.
> I don't see why it's needed as I said, can you explain? Set what to min/rp0?
Above discussion should resolve this as well.
>
>>>> -	}
>>>> -
>>>> -	intel_gt_pm_wait_for_idle(gt);
>>>> -	intel_gt_pm_get(gt);
>>>> -	for_each_engine(engine, gt, id) {
>>>> -		struct i915_request *rq;
>>>> -		u32 step, min_freq, req_freq;
>>>> -		u32 act_freq, max_act_freq;
>>>> -
>>>> -		if (!intel_engine_can_store_dword(engine))
>>>> -			continue;
>>>> +	/* Go from max to min in 5 steps */
>>>> +	step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>>>> +	*max_act_freq = slpc_min_freq;
>>>> +	for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>>>> +				max_freq -= step) {
>>>> +		err = slpc_set_max_freq(slpc, max_freq);
>>>> +		if (err)
>>>> +			break;
>>>>
>>>> -		/* Go from min to max in 5 steps */
>>>> -		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>>>> -		max_act_freq = slpc_min_freq;
>>>> -		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>>>> -					min_freq += step) {
>>>> -			err = slpc_set_min_freq(slpc, min_freq);
>>>> -			if (err)
>>>> -				break;
>>>> -
>>>> -			st_engine_heartbeat_disable(engine);
>>>> -
>>>> -			rq = igt_spinner_create_request(&spin,
>>>> -							engine->kernel_context,
>>>> -							MI_NOOP);
>>>> -			if (IS_ERR(rq)) {
>>>> -				err = PTR_ERR(rq);
>>>> -				st_engine_heartbeat_enable(engine);
>>>> -				break;
>>>> -			}
>>>> +		req_freq = intel_rps_read_punit_req_frequency(rps);
>>>>
>>>> -			i915_request_add(rq);
>>>> +		/* GuC requests freq in multiples of 50/3 MHz */
>>>> +		if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
>>>> +			pr_err("SWReq is %d, should be at most %d\n", req_freq,
>>>> +				max_freq + FREQUENCY_REQ_UNIT);
>>>> +			err = -EINVAL;
>>> Probably a nit but check can be (so should we be checking both high and low
>>> limits?):
>>> 		if (req_freq > (max_freq + FREQUENCY_REQ_UNIT) ||
>>> 		    req_freq < (slpc_min_freq - FREQUENCY_REQ_UNIT))
>>>
>>> Though if we do this we'd need to change the pr_err() or have two separate
>>> if statements. Not sure if it's worth it but thought I'll mention it.
>> We are looking to validate it does not cross the upper limit.
> OK.
>
>>>> +static int vary_min_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>>>> +		  u32 *max_act_freq)
>>>> +{
>>>> +	u32 step, min_freq, req_freq;
>>>> +	u32 act_freq;
>>>> +	u32 slpc_min_freq, slpc_max_freq;
>>>> +	int err = 0;
>>>>
>>>> -			act_freq =  intel_rps_read_actual_frequency(rps);
>>>> -			if (act_freq > max_act_freq)
>>>> -				max_act_freq = act_freq;
>>>> +	slpc_min_freq = slpc->min_freq;
>>>> +	slpc_max_freq = slpc->rp0_freq;
>>>>
>>>> -			igt_spinner_end(&spin);
>>>> -			st_engine_heartbeat_enable(engine);
>>>> -		}
>>>> +	/* Go from min to max in 5 steps */
>>>> +	step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>>>> +	*max_act_freq = slpc_min_freq;
>>>> +	for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>>>> +				min_freq += step) {
>>>> +		err = slpc_set_min_freq(slpc, min_freq);
>>>> +		if (err)
>>>> +			break;
>>>>
>>>> -		pr_info("Max actual frequency for %s was %d\n",
>>>> -			engine->name, max_act_freq);
>>>> +		req_freq = intel_rps_read_punit_req_frequency(rps);
>>>>
>>>> -		/* Actual frequency should rise above min */
>>>> -		if (max_act_freq == slpc_min_freq) {
>>> Nit again. This check is somewhere in the new code but I think a better
>>> check is
>>>
>>> 		if (max_act_freq <= slpc_min_freq)
>>>
>>> just in case the act freq for whatever reason falls below
>>> slpc_min_freq. Even if we know this is impossible (bugs make the impossible
>>> possible).
>> sure.
>>>> -			pr_err("Actual freq did not rise above min\n");
>>>> +		/* GuC requests freq in multiples of 50/3 MHz */
>>>> +		if (req_freq < (min_freq - FREQUENCY_REQ_UNIT)) {
>>>> +			pr_err("SWReq is %d, should be at least %d\n", req_freq,
>>>> +				min_freq - FREQUENCY_REQ_UNIT);
>>>> 			err = -EINVAL;
>>> Again nit as above, but check can be:
>>> 		if (req_freq < (min_freq - FREQUENCY_REQ_UNIT) ||
>>> 		    req_freq > (slpc_max_freq + FREQUENCY_REQ_UNIT)) {
>> It can be higher, we want to validate lower range.
> OK.
>
>>>> 		}
>>>>
>>>> +		act_freq =  intel_rps_read_actual_frequency(rps);
>>>> +		if (act_freq > *max_act_freq)
>>>> +			*max_act_freq = act_freq;
>>>> +
>>>> 		if (err)
>>>> 			break;
>>>> 	}
>>>>
>>>> -	/* Restore min/max frequencies */
>>>> -	slpc_set_max_freq(slpc, slpc_max_freq);
>>>> -	slpc_set_min_freq(slpc, slpc_min_freq);
>>>> +	return err;
>>>> +}
>>>>
>>>> -	if (igt_flush_test(gt->i915))
>>>> -		err = -EIO;
>>>> +static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps, u32 *max_act_freq)
>>>> +{
>>>> +	struct intel_gt *gt = rps_to_gt(rps);
>>>> +	u32 perf_limit_reasons;
>>>> +	int err = 0;
>>>>
>>>> -	intel_gt_pm_put(gt);
>>>> -	igt_spinner_fini(&spin);
>>>> -	intel_gt_pm_wait_for_idle(gt);
>>>> +	err = slpc_set_min_freq(slpc, slpc->rp0_freq);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	*max_act_freq =  intel_rps_read_actual_frequency(rps);
>>>> +	if (!(*max_act_freq == slpc->rp0_freq)) {
>>>> +		/* Check if there was some throttling by pcode */
>>>> +		perf_limit_reasons = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
>>>> +
>>>> +		/* If not, this is an error */
>>>> +		if (perf_limit_reasons && GT0_PERF_LIMIT_REASONS_MASK) {
>>>> +			pr_err("Pcode did not grant max freq\n");
>>>> +			err = -EINVAL;
>>> Looks incorrect, probably something like:
>>> 		if (!(perf_limit_reasons & GT0_PERF_LIMIT_REASONS_MASK))
>> Hmm, good catch. We should flag error iff there is no throttling and act
>> freq does not go to max.
>>>> +		}
>>>> +	}
>>>>
>>>> 	return err;
>>>>    }
>>>>
>>>> -static int live_slpc_clamp_max(void *arg)
>>>> +static int run_test(struct intel_gt *gt, int test_type)
>>>>    {
>>>> -	struct drm_i915_private *i915 = arg;
>>>> -	struct intel_gt *gt = to_gt(i915);
>>>> -	struct intel_guc_slpc *slpc;
>>>> -	struct intel_rps *rps;
>>>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>>>> +	struct intel_rps *rps = &gt->rps;
>>>> 	struct intel_engine_cs *engine;
>>>> 	enum intel_engine_id id;
>>>> 	struct igt_spinner spin;
>>>> -	int err = 0;
>>>> 	u32 slpc_min_freq, slpc_max_freq;
>>>> -
>>>> -	slpc = &gt->uc.guc.slpc;
>>>> -	rps = &gt->rps;
>>>> +	int err = 0;
>>>>
>>>> 	if (!intel_uc_uses_guc_slpc(&gt->uc))
>>>> 		return 0;
>>>> @@ -203,69 +181,56 @@ static int live_slpc_clamp_max(void *arg)
>>>> 	intel_gt_pm_get(gt);
>>>> 	for_each_engine(engine, gt, id) {
>>>> 		struct i915_request *rq;
>>>> -		u32 max_freq, req_freq;
>>>> -		u32 act_freq, max_act_freq;
>>>> -		u32 step;
>>>> +		u32 max_act_freq;
>>>>
>>>> 		if (!intel_engine_can_store_dword(engine))
>>>> 			continue;
>>>>
>>>> -		/* Go from max to min in 5 steps */
>>>> -		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>>>> -		max_act_freq = slpc_min_freq;
>>>> -		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>>>> -					max_freq -= step) {
>>>> -			err = slpc_set_max_freq(slpc, max_freq);
>>>> -			if (err)
>>>> -				break;
>>>> -
>>>> -			st_engine_heartbeat_disable(engine);
>>>> -
>>>> -			rq = igt_spinner_create_request(&spin,
>>>> -							engine->kernel_context,
>>>> -							MI_NOOP);
>>>> -			if (IS_ERR(rq)) {
>>>> -				st_engine_heartbeat_enable(engine);
>>>> -				err = PTR_ERR(rq);
>>>> -				break;
>>>> -			}
>>>> +		st_engine_heartbeat_disable(engine);
>>>>
>>>> -			i915_request_add(rq);
>>>> +		rq = igt_spinner_create_request(&spin,
>>>> +						engine->kernel_context,
>>>> +						MI_NOOP);
>>>> +		if (IS_ERR(rq)) {
>>>> +			err = PTR_ERR(rq);
>>>> +			st_engine_heartbeat_enable(engine);
>>>> +			break;
>>>> +		}
>>>>
>>>> -			if (!igt_wait_for_spinner(&spin, rq)) {
>>>> -				pr_err("%s: SLPC spinner did not start\n",
>>>> -				       engine->name);
>>>> -				igt_spinner_end(&spin);
>>>> -				st_engine_heartbeat_enable(engine);
>>>> -				intel_gt_set_wedged(engine->gt);
>>>> -				err = -EIO;
>>>> -				break;
>>>> -			}
>>>> +		i915_request_add(rq);
>>>> +
>>>> +		if (!igt_wait_for_spinner(&spin, rq)) {
>>>> +			pr_err("%s: Spinner did not start\n",
>>>> +			       engine->name);
>>>> +			igt_spinner_end(&spin);
>>>> +			st_engine_heartbeat_enable(engine);
>>>> +			intel_gt_set_wedged(engine->gt);
>>>> +			err = -EIO;
>>>> +			break;
>>>> +		}
>>>>
>>>> -			delay_for_h2g();
>>>> +		switch (test_type) {
>>>>
>>>> -			/* Verify that SWREQ indeed was set to specific value */
>>>> -			req_freq = intel_rps_read_punit_req_frequency(rps);
>>>> +		case VARY_MIN:
>>>> +			err = vary_min_freq(slpc, rps, &max_act_freq);
>>>> +			break;
>>>> +
>>>> +		case VARY_MAX:
>>>> +			err = vary_max_freq(slpc, rps, &max_act_freq);
>>>> +			break;
>>>>
>>>> -			/* GuC requests freq in multiples of 50/3 MHz */
>>>> -			if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
>>>> -				pr_err("SWReq is %d, should be at most %d\n", req_freq,
>>>> -				       max_freq + FREQUENCY_REQ_UNIT);
>>>> +		case MAX_GRANTED:
>>>> +			/* Media engines have a different RP0 */
>>>> +			if ((engine->class == VIDEO_DECODE_CLASS) ||
>>>> +			    (engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>>>> 				igt_spinner_end(&spin);
>>>> 				st_engine_heartbeat_enable(engine);
>>>> -				err = -EINVAL;
>>>> -				break;
>>>> +				err = 0;
>>>> +				continue;
>>> I think it's preferable to move this media engine code out of the main loop
>>> into max_granted_freq() function if possible (maybe by faking max_act_freq
>>> if needed)?
>> All the engine related info is here. I will need to pass it to the
>> max_granted_freq() function.  Also, faking the act_freq probably
>> overkill. I can add a fixme here instead to update when we have a
>> reliable way to obtain media RP0 instead.
> OK let's leave as is, no need for FIXME, just leave the comment as before.
ok.
>
>>>> 			}
>>>>
>>>> -			act_freq =  intel_rps_read_actual_frequency(rps);
>>>> -			if (act_freq > max_act_freq)
>>>> -				max_act_freq = act_freq;
>>>> -
>>>> -			st_engine_heartbeat_enable(engine);
>>>> -			igt_spinner_end(&spin);
>>>> -
>>>> -			if (err)
>>>> -				break;
>>>> +			err = max_granted_freq(slpc, rps, &max_act_freq);
>>>> +			break;
>>>> 		}
>>>>
>>>> 		pr_info("Max actual frequency for %s was %d\n",
>>>> @@ -277,31 +242,59 @@ static int live_slpc_clamp_max(void *arg)
>>>> 			err = -EINVAL;
>>>> 		}
>>>>
>>>> -		if (igt_flush_test(gt->i915)) {
>>>> -			err = -EIO;
>>>> -			break;
>>>> -		}
>>>> +		igt_spinner_end(&spin);
>>>> +		st_engine_heartbeat_enable(engine);
>>>>
>>>> 		if (err)
>>>> 			break;
>>>> 	}
>>>>
>>>> -	/* Restore min/max freq */
>>>> +	/* Restore min/max frequencies */
>>>> 	slpc_set_max_freq(slpc, slpc_max_freq);
>>>> 	slpc_set_min_freq(slpc, slpc_min_freq);
>>> As mentioned above maybe we should restore at the beginning of the test too
>>> (before the for_each_engine() loop) to start from a known state?
>>>
>>> Anyway here maybe get rid of the variables and:
>> This is restoring whatever frequencies SLPC was running with
>> initially. Regarding resetting the frequencies to min for every engine loop
>> iteration, we are already iterating from min->max inside the for loop, so
>> will be duplication.
> I didn't say reset frequencies to min for every engine loop iteration, I
> said "before the for_each_engine() loop". Same as above: "I was saying
> restore the freq's *before* starting the tests as well to start from a
> known state".

Every test will work off a known state - from RPn->RP0

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
