Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A8968CD5F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 04:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817110E1C1;
	Tue,  7 Feb 2023 03:18:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E197A10E1C0;
 Tue,  7 Feb 2023 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675739921; x=1707275921;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LjrMJI7YyGURmLNhytOZvonPcE4z3gvyeA0by3Ok9dg=;
 b=RxcNebxKZa8HoSFGk3VsIWQCTsw4C958EhNb+CrIdfI/gdRqwFbWdl3B
 Y0A01Q+8jeeA407OARFIakRVoN1rvHlY+dsx+AKGFl1hA7tJZcCh71b8B
 /JTwW8TfGKaKGF4NcMSFItYqpE5rBkpxT8bZutXgNIE/8V85mRUgSGlbl
 aWWDB5VEAZYyeXwu+6U4lvrSafaDk08OLOyCUOGIfuRrh3+3nTV+RD8jd
 UAUDXKyiCbFTUWwnqiN23fJbNduv+MKFxcuOmFgwYfjFif9jsoDLd6sCz
 +m7SXYo0D7WJaEkH/XQG4T4IYu08y9JlACG628rvVDoUwf5qUTwqX8U20 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356756983"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="356756983"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 19:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668634584"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="668634584"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 19:18:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 19:18:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 19:18:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 19:18:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnxvS3nty74kKm+XoV64W39msVDR+pMksxWqBexTg4kR5xCtauVU6xbA4+xrYMiIsD640QotM38+ByFwtYMUu03EwBqVr9NhpGGKRRS2pxXE/kFGJktxEeLLOX8T2in26AJjE2sxUpV3gnCPGfOL03j6HcaHzbIUnDAT8jEyXBqbMz7yj0Xxm76vjjptsJHAEaiIr2Dl/D2kwIoNz4uhFskT8ZSiEtaDNBwi9RanaUTAvGATg2XSk5h8zatwdc3RX041cSnxC1PE0u/TCZ4b8PnpwEKzA2IBemxBospbOZvzqKT+jLc5Q3kAExdC9aTKDV1qaH24KSra6WjLlksikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYkt2F7/txYhAuk4xzX4laJGYxoVOIOlj0vUMQXDJrY=;
 b=kcCeYR3VpaqtlGdqKHB/S4fjl1EqTUJZn10iUsbANDDfC1niKizKzC+pIr5d5rKPgqzvGfIHdxNRZNHPvaWTsc2sAH5WEseq4M5+6/lpO5Brmjo8jUV5+irr7ZDRKOeWuyTjJd2ArG97aj9YyjHBgqkR+SWrlIs6ApBcoTlYcdikjdSMOW8QBnYnuEv0oGDOA0VUzn9OKw2ksk5jt8GOITAy59KojXih4faBYh/1SMgU1I8U+c1Nd4SA/OfTHogfgkGE/WfLisWFNdKiEJDQFjhs0scyXU2jx4tPqxEYQc+V6GK4WpcfWZ+FjoP+5mygrylXrvjEK9L8yEqnoqJm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 03:18:37 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 03:18:36 +0000
Message-ID: <e4060930-b631-39dc-d04d-c51a7680d096@intel.com>
Date: Mon, 6 Feb 2023 19:18:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Clean up of register
 capture search
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
 <20230203011043.3427096-3-John.C.Harrison@Intel.com>
 <3b2ef1cbe2eea5c13da72feec8fc2bb9d3cc5ec1.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3b2ef1cbe2eea5c13da72feec8fc2bb9d3cc5ec1.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: bec600d2-93a3-447a-d3ea-08db08ba0046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tmqXBxwjyDnSkj1X4q+s3DoQ1Uo+LsWLCBPLVHHmGdiw5GNyLK9n1hNCJgmQlvLsxYps9qUw0usPjbDtRb21R22Vp11ocMNTq3sLX/ocigglkp0NfY3pO6wOIyCuVgYvWVDjsQDz50lmeMHi+wfdIhbgqZ71TdPFNyuk8ScpnrLq5WchMcwHjSYOi5e0Hbw8x4fvWr7A3j/jAMXe3pm6lN8cN9qroS5PksqYbR3o4lY4ByMr4F4tV170NPaObIofnTTGVGS/yzFDKv9E2GcLLjzoZg1ECWgcXxkfQDz252666MgP0yztucs/ZoJK4BDVfd53mx936chvc/iRYawNlS1+9dwQk3y+M6erfVjtU+8jY2yZ5tnVnrYvTpqeDES53ASc1OvfXQrQNXd5RhcVPm9gGXrBvqi3803kcWkpQQJupFjsZFf8ckvFe40oE1wMWO/q4ev0/9z7z4wBBoQCySHJgloFj6uxsq0YgM7Cj/5NZK9TM4svYWwbsPdCS0XLcjjScP+5HDprAjaowot+y0VBXHAcGjGSX2dfWKxsiRxBJGwcVw8VCbUji2gT5IXM3pnCpXI4YclmLGpcxZK3ccAXEF/m70wmYMjGN+BkYrgjj5V0HLNGvvKMGgMpQY1uujg53SrhJVwMclgvwrUroDas2UttaS/vtcNjEAyFd8RBb5J+h8kd12a6GYw22DgEFB5iZAgYPvaascEINlhsEXKtHSg14gADlNVKdfGJW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199018)(5660300002)(31696002)(31686004)(36756003)(2906002)(41300700001)(8936002)(86362001)(26005)(316002)(110136005)(66556008)(186003)(38100700002)(66476007)(6512007)(66946007)(478600001)(8676002)(82960400001)(450100002)(4326008)(2616005)(6486002)(6666004)(83380400001)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENNNGtlcUl0QmF4MHBYNk9RMGgyV0FpckZ0RUpISkltcmtNL0hoeUR4VHov?=
 =?utf-8?B?VWtIQmJlTnVXMG03enlDaEhjQytOS0g5NTdNM1RiVk1FQVNaWnRXUFAyYzV4?=
 =?utf-8?B?QzdmRCtsL1lxZTFMd282ZEpYamJiek02SFR0QWI4YW8yanVESTU5OGk1bERR?=
 =?utf-8?B?KzI5eTJOLzdhT0l1N2tNQ0V6RUMrV1VHeHg2bFd6L0p1TGlDc3R5REJDOWE0?=
 =?utf-8?B?NXlmTEY2UmxJSFl4OXNnVG0wek83ZHJOOG1oQWNwcUZCYXJJdUVEalJFY2Zn?=
 =?utf-8?B?R1JoWHV6YW1YZGw3UFJjVDJpM0l6d29FZ3p6MHZDZEc1Mk1BL2c2QkV4WXRn?=
 =?utf-8?B?MHJ3YmJGb2Ixc0p5MnIvZVdHcnkrWUZPUHEvSVMxbWFGY2xuTjNlTElGa1Vl?=
 =?utf-8?B?L2FVSEtnL252RzJnSVhRTXU3R1Ivc3RLUlllcWhOREorbXFEdEVsZ2dVVW5R?=
 =?utf-8?B?cmhySXAxT1k1czlHNDNXc3hXRzZhMXN0alpPQUtRcG9JSTNjK1NraU1FNG91?=
 =?utf-8?B?aEZOZDMzYU5wbWE1TWU0d1Rmd2VYNFNQQjVtQ3BzYTlqdEEzQUNhdEY2TFdM?=
 =?utf-8?B?U01VZTVWMStyOHlGTVcxOGpOSHUrb3lSdTNZQjRGQlcrbllhenhFaTRvV3B6?=
 =?utf-8?B?Sm9aWVJkcU1QcElsc003T2VqVDAyMUxtSHNwL0xFS2VGZVdVVk1Cemo4RHFZ?=
 =?utf-8?B?TnZzNDRQc0JyWS8reG5kQzlRek9FVjY4VzllU0I5bEg1TlBsaEhaSmVxOFZF?=
 =?utf-8?B?T1RYUGZOanRlenpPVkF4VmNpa29sZjZHUTNManFrNmdEcUdIYmszWGFLMVRN?=
 =?utf-8?B?WGNBVzd2OVQxdmgxVnB3c2VpeFBxbEQ4SGU5aXRRazJqRStOYnkyWm9uRWow?=
 =?utf-8?B?bG5WN2piQ0wwUkN4dzYwVkhrcnVSaUtWWkhCYkZEenBxZVhPMmh0ak0wQ1VD?=
 =?utf-8?B?SnJqbE1MeDVXeU1Cb04zWWpnQXJxdUJoYUw2OVZCTWkrL2hPdUNURDc1OHNl?=
 =?utf-8?B?WjBtWkNxTlVDTnN2L1RTZ2hNOWlWOVJUcTgzcmVQM1VmelNCN1RWUG1RQjJm?=
 =?utf-8?B?bDdzUU1kMzhYVjVjUkJuQjlpL1Q5a1NOSFdJUlFIV1MxMTJ5ajBZY3pjNFY0?=
 =?utf-8?B?bVRpZk5qY0lJWlp3QVFDdGY1OEwvRDBKem9OWlZ5cTJRNHpSSUx4NmxSeElx?=
 =?utf-8?B?dUR2WFJ4RnN5YW9CSm5MeWNBNHVRSW5EQ1lQbW04bnFKakkvQ29sUm14NGFr?=
 =?utf-8?B?elhMOXRGdEk0aUd1K2liRmhlcEJJeGoyL0R0S2Nmbnpxd2pHWGRRaHhXdXZJ?=
 =?utf-8?B?Q3lhenRTVTBBazFMY2IyQ0w2TEpSMGgzeVVYa3hPbjRyVnc0RTJScVFJcDRR?=
 =?utf-8?B?b0daY3FZVWRvNkVMMU5KTXFEQW15dTJlTjFwY2tVUXFKWUlOalErN29qRVdv?=
 =?utf-8?B?VVB6V3BranBwbUtqSWRWWU9vYmNBM1RleHRmOU8yUUgzeWRvTzZqSWJ4UUZj?=
 =?utf-8?B?TnlRL284a25mNnhONG9YS1J6bnpkQ1FGZ0tTYzU0YU1UZFRvRVhjOW9CdXEz?=
 =?utf-8?B?T3F0MGU1VTYwOFRTS3dBOGNpMlJ5UlM1cldNZUlYNG55OWMzd3lSc1RxeU9t?=
 =?utf-8?B?RGxzZjRqZnBTVmdiZ1lBUUgrWlZlOHdGUldEeDZzSExib0RvaURPRWExRnRG?=
 =?utf-8?B?KytyV2grTTlrUFR1YzVCMHNVUWVWNU5jQW54bEdvYW9BZ3RNMFZ6cGFEdlF1?=
 =?utf-8?B?aSttQWRvd0FQMWFxZUNsb2RBaHlQbE5pWGJlWVNMUXZiZ3Bhd3ptSjFjODd5?=
 =?utf-8?B?RDdqclpzbTVlbzJCbVJoLzBZeS9RZmx5VzMwa3dpVnlrQW1TSkZ3NjlHdXJB?=
 =?utf-8?B?ZWd3alVHVkt4N3I2aGhRU2RDRkE2ZG1JZnpDZVYzU0VUQ0lVN2J6SkhvVjBT?=
 =?utf-8?B?VlQ3eDM0SEJMbE01ZXo5VVhEajJ4ZnU4OGNaQ01Gc1ZzSlMydWgvTFBGRFMr?=
 =?utf-8?B?RWczeVlFb0VvQ0xjL2pnWUE5c0t4Z2p1YkJpbVpid1lnamV2bnJKYjVFTVlT?=
 =?utf-8?B?OEtLUXFEa3c1dmRrWXoweU1MN3hRUmh5YWRvK3llcU0vMG00ck5raFFQaHd0?=
 =?utf-8?B?SVUxYmhPMmk0eWpMY0hqRUVIdzJhVkp4MW8vNk9FM1VJZ002TFZ0VzJQdm5O?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec600d2-93a3-447a-d3ea-08db08ba0046
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 03:18:36.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krA8uAMhn7rKOBBTGoNuZjJ+WL+Ff9uswCAa+pXhjBqmhYqgCKuB2mBSwdXAqmnxJlv9BOa1lL1Bt+kLFtBFwi0DeIYjufVZOc+u2wNK1xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/2023 23:29, Teres Alexis, Alan Previn wrote:
> I see you are inferring that a guc-id of zero can be valid.
> I am guessing that might have contributed to some lost captures?
> Thanks for catching this.
I'm not inferring anything. I might be implying something, though. The 
patch description probably should have mentioned that change. I'll add 
something in.

There is nothing special about id zero. The lower X many ids are 
reserved for multi-LRC use. So you won't see zero being allocated 
normally. But run a multi-LRC app/test and the first context allocated 
should be id zero.

John.

>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Thu, 2023-02-02 at 17:10 -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The comparison in the search for a matching register capture node was
>> not the most readable. So remove two redundant terms and re-format to
>> keep each term on a single line, and only one term per line.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> index 710999d7189ee..87b080dd6bead 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> @@ -1627,9 +1627,8 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>>          list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>>                  if (n->eng_inst == GUC_ID_TO_ENGINE_INSTANCE(ee->engine->guc_id) &&
>>                      n->eng_class == GUC_ID_TO_ENGINE_CLASS(ee->engine->guc_id) &&
>> -                   n->guc_id && n->guc_id == ce->guc_id.id &&
>> -                   (n->lrca & CTX_GTT_ADDRESS_MASK) && (n->lrca & CTX_GTT_ADDRESS_MASK) ==
>> -                   (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
>> +                   n->guc_id == ce->guc_id.id &&
>> +                   (n->lrca & CTX_GTT_ADDRESS_MASK) == (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
>>                          list_del(&n->link);
>>                          ee->guc_capture_node = n;
>>                          ee->guc_capture = guc->capture;

