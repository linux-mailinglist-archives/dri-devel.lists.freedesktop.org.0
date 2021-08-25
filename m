Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B83F6D12
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53876E0FB;
	Wed, 25 Aug 2021 01:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3196E0FB;
 Wed, 25 Aug 2021 01:22:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217460641"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="217460641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="507833519"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 24 Aug 2021 18:22:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 24 Aug 2021 18:22:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:22:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 18:22:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 18:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaarKGdHLXmBJ8FDcVjUQn3WYrLIpswck46AEwi6ZYXBAYEC8Aemt/9Nsd4TJhJEGymA2j9hXl318dhf+WSoXysqjR5RPFOiP8vmUI5ab68nWZQHj8YgWcrOTCpEAZGLHJNVZjI5lZzbWN18ADGl+QzOd7FJilX+XmmUZQwjVAI6hbty/4HDd4F+6Gr5S1m2ZbY32EjY5bvxR54x/7SH10GNSw8OgAI5MektQvvEDvRubi+Y6y6gMABVov2Ri0L6oosqPV0DGG0hKQ+eovEBMCYm9tY+P2qFwW6clyvuBVnGbih3b8hk4BDMUdlGbdBnm2tMaE9Mihri3N1UFa2+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kfS17iwTZUTuMQw0JR6MUN3U2ph2vydIeCttC/mGJQ=;
 b=kO/+c2SNIsCzctLHCUy8lb9kib209nJdgkgHO4FZ9Dg0LImAj4D2AMCzY/HMjZHQdXzHX5WhoRQe1IDgQOqxnS8JTNt2p3NAC08v5+snXiHaFK91aOZDkLx/4dD0VnIuUbn8G7CGzGQJUjn1xhBeUK6FeK3tSnlz1OodnRZ3SZ1JQ5+jHTZb2TYzleo+8VUDcy5Crkmnm1TpCe+IL/Qir2fRO5NkjBNZMxY9EbxlLEHk1vJUAbf83lUDrjIo1MfxjGmwi8jzQFz/JDvQmQCecCAdIbEUfpBVEi/T1c3aEes1v2eIhuxDZSU6w1JmtEktTVFgup82H3XPpXJ3bHJPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kfS17iwTZUTuMQw0JR6MUN3U2ph2vydIeCttC/mGJQ=;
 b=iRmHGXXmZV0zzPZHmxLMgM2m4MuX0rpTKttrUmyKBwz4JKMkuZYSD1EOO96jkRxqPQw7IhysL91PESVaNv0L98/6EQpibmjCnOaVMmY1b8KHZ5AuvxsUGNBny/++iaTmpGPqZ1Oocc7++whhGn2jcPfpYK2b/BmXkiUlIOILhzM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 01:22:29 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 01:22:29 +0000
Subject: Re: [PATCH 17/27] drm/i915/guc: Flush G2H work queue during reset
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-18-matthew.brost@intel.com>
 <f57ccb87-c6d7-1510-d43d-090490fd902a@intel.com>
 <20210824154422.GA9697@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <a2c44913-bc9b-2e70-3ab2-c27ebfe616d2@intel.com>
Date: Tue, 24 Aug 2021 18:22:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210824154422.GA9697@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:a03:2ef::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 01:22:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84fffece-a805-4851-d9f3-08d96766cde8
X-MS-TrafficTypeDiagnostic: CH0PR11MB5234:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB5234B2CAD49FDA5D9BDAAD9CF4C69@CH0PR11MB5234.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+87IEVmdhRXhlm+xNOlGhpiiYrzcyGcbll7RJsF/YMlhVOZS1Ocm7KsyG65PpgP23VQJP0iEfZuHmhnVwdV3QHewmN2G9bpaKH6XL8CYwGHqu4vXva93aTcYjg21btW6F/hnm/g7UqbNq/jQ5/y/22EkLlVnpEM7GpTQnyvkD3sh0HlVUZkLv6NHU/YOXoPCPcwd7q3dz9m0No5wBGmWHuwVSwq2e9E4/poOcptjjmuORpZNneLaX955hFsmCO3WbR94mIzERoy2+K7F1aQM8tFy07uIdG6R+SeCPEZ+2GbmpJHx0fjfUm5NRseRRIKfviibmN6WtcIE+YAK3E+3P55S8ahphiUK0zS9MQjtRtisHVmpQk6zmS8Ss0uKCq6ba57zOwR4eadCfDWho9YarKQalmz9LrA1x8Qwc+PT3NYqR7HAmztpEHb4yQb26hWLiZ2ohJSpC31xQt2G6tSpNhvYbg+ZdWC1d4pYssMkJ+roxsv/iKrt4WtWk1PQrax7rVm+BQ9Edu7WYAz27GzlXhjRCFw0ud5AWuS1RgmlHg3gmhdYwKjz//YuzomK3aqBwndS18SGIpBgIzsKJaOGsPDipHi1iP7+xCbMmBWtAN2TdPO/Ixy6f5syFXH+fZdOavyrnoo0h+9+f5g2p16LFC7WPDv7RT4G9h/Da3JF2xknd4BQiDWicJ67EqRNFSC3Qocqth2OUJDfrXoFb8DjfI1+ZfmURknJmxwhPsrQqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(956004)(8676002)(31696002)(6862004)(6636002)(4326008)(36756003)(86362001)(2616005)(83380400001)(478600001)(38100700002)(37006003)(8936002)(31686004)(66556008)(66476007)(26005)(316002)(5660300002)(16576012)(2906002)(186003)(6486002)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUplQUdJMjIrbmJsd3h0MStDNG1TYnRiRDFkRzFGd0RMS1Z1WjZNNjNSNmRQ?=
 =?utf-8?B?MDRKSmJWY0pOcUU1WjliKzUxUDR4MDhSczdGaFk0SlNESEJKa3k1K0prcEU3?=
 =?utf-8?B?bVhaM0hhTVFrTDZlZ1BKREoxTGd6c0I1Sm4zRFFpb0FFYzRNdkNnVEFrVEx6?=
 =?utf-8?B?TzljYXc0aXpva1hQS01kUzl1VndGZUM4MmdEOUVQaG9ONDc5eE9uOU1TRnUw?=
 =?utf-8?B?dHpyc3lhMzlQR2JyajBFUUl1WGZIK0U5cUxtWlArN01QZWR2UUxmOXlHRnBz?=
 =?utf-8?B?QWh5VjFJNDlwS3Rub1RLMlZCaitWejRDNVY3RHVrWjVhRGVSOFcrcEczYXNK?=
 =?utf-8?B?amhqQ1FPTXY5cDkraktQYlJzUlh6NGxsS29hdmpuTjN6NVEyd2xaS01PWXV2?=
 =?utf-8?B?Qm5RTWI3bzdWdCtYNUNlRFFGT1dMeGYvQ2VSYUNIYjdrRW5LTmlEcWtsellF?=
 =?utf-8?B?a1JWSVRVNHJlTEN6WldmaEphSlFLSXdkRW53VWRGdnk4WGUxdVd0NXlXcVlM?=
 =?utf-8?B?dVg0bTJIcTJCaVBVR05QeFIweDIvVzFOaG9yVkUyTVlabG45eVJJTGkrVi84?=
 =?utf-8?B?TGl1TVBqWS9SK2dheW9mNXdPTzdnMGFhcUFGTWt6bjgydTVUcWNuV1duNi96?=
 =?utf-8?B?RVdDQ3piRjVyUHVUTjVjaHI4OTdhRUVWUXQwdFN0bDBtMExqOTBxTkdDWGRM?=
 =?utf-8?B?Y29sTVgxZmdabXJiSUlteEFINUU0SlpadEhBNm81azROTW9jc2hIeHd2Vldx?=
 =?utf-8?B?cWV2NVZuTmRXUmRhOUlhZW45ekltdzNTR2lJZ0tFa2VibVREWkVUZFh1TnNx?=
 =?utf-8?B?VkQyOS9Xa09YMDQ0cC9rQmh3UTc4cDlwbG9qbTcyZUJpVCtUTWJkVXJNUHZT?=
 =?utf-8?B?VkFiWCtwT3VoMzd3Z1ludGdBZ0dob2xQc09WWTJlVVFCd09vWXowZ2Fjekli?=
 =?utf-8?B?UWNRR2lQcm9ncU5FNk5tdExVZG0rM3Z4Y3d4OHlUb2pjeExlcUpTUkNzRFlL?=
 =?utf-8?B?VzBFaWNVYVV1dEFDL0U2bko4TEpLUVN4a2RsVzNMcXBjUm02elVVZkZsb21s?=
 =?utf-8?B?dFNHem53OEVNTEJHc0I4YytzOW0zbTUydkJWY1dqdEFXbE9xazQwUXh5UEdm?=
 =?utf-8?B?NmZ2blNxUVU3UFZFdUNxTGtxY2dtdHVLUDdJZDBvS1QwamlOdm1MekxGQmNC?=
 =?utf-8?B?VGZjeElncWZSWGJZemZkbWErZTFMNnNIWkE5VkZHU2tCTTlRVllBWHZ3UEla?=
 =?utf-8?B?N3o1QTFCK1BMNm9Eb3creVBySmNnWkhwOHR3UitOdm9pcmwxaEZYNTkyY2NP?=
 =?utf-8?B?emZHT1NuTklEV0NQQ3E0b2VNUVprOUFyZ1NjeE9scnJyR3cwZklyUmROM25M?=
 =?utf-8?B?ZGdSN2VOeHhTeDA4Rkxmb1hXZ3ZDcksvRStta2F5ZnhOcWM5MkJTM1lTbE5S?=
 =?utf-8?B?M0d2VVZjeXNWMkt6aXdaZVpGTEhDTnkveXBOalBPZiszbEtycE50U2hsL3o4?=
 =?utf-8?B?dnBtSG95c0FmM21ENlh2RVpVdlpPYWhjWG01YStHT280MGtmbzN1YWRENC8x?=
 =?utf-8?B?MmdBUFRER3Y3K2drQXJFVGwvVThMR1R5cmdOMmlyS1NTV3dpTHFuV1FUNUd5?=
 =?utf-8?B?WGNXMXBJOEVydXdiWFpMY1JFSlZaUmZnUmpNcmNpTlIzOXhuUTk1clVLYXh4?=
 =?utf-8?B?YVQ2OWNmZTVrbEZ5WWVPdHpJd0VXaS9TcEdpN1p2a2xsVDhXNXZFOC9hS2Nu?=
 =?utf-8?Q?9u17TGal8/ixPq34naITnqB6eXITb/AydsWQsoq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fffece-a805-4851-d9f3-08d96766cde8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 01:22:28.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yLMKdtBthuquefcbcYaL3UXbv05WOuW3TptocefL4C/yNqOQlyfku760uz9GCEPkKEKV7arspfC4zN0oofS9hBo0zGm7XsQM9RZe3lxmkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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



On 8/24/2021 8:44 AM, Matthew Brost wrote:
> On Fri, Aug 20, 2021 at 05:25:41PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/18/2021 11:16 PM, Matthew Brost wrote:
>>> It isn't safe to scrub for missing G2H or continue with the reset until
>>> all G2H processing is complete. Flush the G2H work queue during reset to
>>> ensure it is done running.
>> Might be worth moving this patch closer to "drm/i915/guc: Process all G2H
>> message at once in work queue".
>>
> Sure.
>
>>> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 ++----------------
>>>    1 file changed, 2 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 4cf5a565f08e..9a53bae367b1 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -714,8 +714,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
>>>    void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>>>    {
>>> -	int i;
>>> -
>>>    	if (unlikely(!guc_submission_initialized(guc))) {
>>>    		/* Reset called during driver load? GuC not yet initialised! */
>>>    		return;
>>> @@ -731,20 +729,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>>>    	guc_flush_submissions(guc);
>>> -	/*
>>> -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
>>> -	 * each pass as interrupt have been disabled. We always scrub for
>>> -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
>>> -	 * be incremented after the context state update.
>>> -	 */
>>> -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
>>> -		intel_guc_to_host_event_handler(guc);
>>> -#define wait_for_reset(guc, wait_var) \
>>> -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
>>> -		do {
>>> -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
>>> -		} while (!list_empty(&guc->ct.requests.incoming));
>>> -	}
>>> +	flush_work(&guc->ct.requests.worker);
>>> +
>> We're now not waiting in the requests anymore, just ensuring that the
>> processing of the ones we already received is done. Is this intended? We do
>> still handle the remaining oustanding submission in the scrub so it's
>> functionally correct, but the commit message doesn't state the change in
>> waiting behavior, so wanted to double check it was planned.
>>
> Yes, it is planned as scrub code should be able to cope with any missing
> G2H. Will update the commit message to reflect that.

With the updated commit msg:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Matt
>
>> Daniele
>>
>>>    	scrub_guc_desc_for_outstanding_g2h(guc);
>>>    }

