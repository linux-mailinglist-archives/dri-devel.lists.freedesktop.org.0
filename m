Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCD783428
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 23:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F340210E00B;
	Mon, 21 Aug 2023 21:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71410E00B;
 Mon, 21 Aug 2023 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692651649; x=1724187649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OSyTeOS3ez8DIVkawUU7fua+Y/UHF8ZaZjWMyHVegTM=;
 b=NEnmDF2kEPSKhSUNHB62cVy4r6uQ5N37qWvNMu7hOGk69gXOvRgX7qSL
 jE5HYFXHvwH1dvX2LGK/x3cPGzp+TF12tcnRYQ7uDgIZHeEFOjxBroja9
 Gz0L89B2PUpkpVmoK2bHZ1ESbgHh2s6bbg33tFNrFzcoPhT7OFY2l9xtP
 +bCD+T/dq75YD03csnpBGsxHtxLCkphVyl+2+cd1BZ/XN2c+BGxTyEc9c
 ezB44F6dHrmUkGnX8MXab8SG/ds/CHElN76lqxe4nBuPEUSOafEWKfjUe
 XI8X4C+m9WoZwZ1OkiU8/w9q1177FInkWPr7UOq4J1RYDnQH2l4FQbLdN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353273848"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="353273848"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 14:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="879662978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 14:00:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 14:00:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 14:00:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 14:00:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 14:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkbA4mliDuxZKbZuZ8rjj06Be4kWG6jZ8BD86ego2Acz5j4URnAyQ94GsC48PgCXLqxp4Eg0yMAYUWTWEGTFcOAs5ebyPb0QmkiQt31EsmDYmvxkpnICMuN88Zl+2SZm6dYDc2UFMCUeTPhkmBSfr1IRgFnX9us9PqhU2L9ZW/8XGF3WhKJkdSt9oB+qGptso4rGleRB4c9eI4STKD6kAziKmqTRBocvCe+JAhg9lFf9DtqK4WTb6POptpjW3+iq9m3G8Keu5R8iSMj9IiPPwv/1rQO6JrAFBYepANQWs/gklstoPuBQ+KQfEytW/e8Oo0dGG0BZVP6J+cfIqxlosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJQ24O4cAOYkgiggyfYtR26fs/3aec5mmh0xo+dix2E=;
 b=ShxB6xDyNobsW79Lu2wLU4pShPBiqtWxah4GTzzl/IxvR2CoOvF9UL0vVCNoYlYSh4Mke+sL0YM25OO4VkNtEKltzk2WalMbPpAz6Ict7Yqu46IWX8Xg2EiBV08AP4WJQL/lvJMGzYr2NUqN61yxPnWIQA0Sdd2wry9n2h8UDtinuUBdxIpLWZe7Z3fNJ9A9UvQjJt662aGumT97cLWUURcECD9tsyJVQakrfzRSrThzYTQI6EU8baf2EpWsxDHvH7+BaGr+qLbCGkpYs2zITg9CvrYKrk3YdqZW+i9H4+xxfVpbqYdYVdgdLHrlh1qwM7RW6LqwzlIWEYS3WoJVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 21:00:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 21:00:44 +0000
Message-ID: <61fa76d7-537e-29d0-b9d8-1b19f05d2ffc@intel.com>
Date: Mon, 21 Aug 2023 14:00:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] gpu: drm: i915: fix documentation style
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, "Ricardo B. Marliere"
 <rbmarliere@gmail.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <John.C.Harrison@Intel.com>,
 <alan.previn.teres.alexis@intel.com>, <harshit.m.mogalapalli@oracle.com>,
 <michal.wajdeczko@intel.com>, <gregkh@linuxfoundation.org>
References: <20230821150241.40047-1-rbmarliere@gmail.com>
 <87il9874cz.fsf@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87il9874cz.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 33235a3a-4131-4244-4c61-08dba289af8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVxpTlDwFpY3nW+3q4sI7MNDhLknmMbApckULSmmAOa4ZUTaOk+wCv2nHbfwltNIlNDKws248o8BwU+Y+9jcIiI9DIfZzWQcsmDt4j+5bcuYPKWD0AeML1sdd1nJigTjWPcqtbOxwjGxcZQ00qnz+a0JLSXLhPuHBFnZyn5S4Yv/0lvyp9k/RGDwBvbtGSMMkMJhold7Tv2oQcgEMBtcLsJ32I4jxL5T/l3wr0gCej8YaPCixQOH6+5TLdi/g+jc8YLTk6MIikWwa5xssXEkLz0rkXQLDWLUgQeOoeq2mLLNK/d7cePrIKU+f01Zb6EmMPEI3c0zVpZZ4Rr+Kp+9MtpTznTq3yNCmV7J//Dg502nnDUvj///r4JwYY7cwffYLzAWhO/DFdqA9kinkxXP0SSMrYLxgszH+sQsWx7Di+nXeG9jCajN1MLL2vfFJoX4lsx0s6SnpbqdNNcUK1ENkk/p0OLOheDFoP6XgItksNDdIEmgQADVDJo4Gle1FpkggUz8CAk3BPzJHhoQcuCEHvZR/Noa3kBUFIen+JIoH3ez0nYtGaY0APUZRVozMJlgZhx7o4l3H0gQuBwjqsBDSblanApRSyXtlr9TFAspD7N9gLjRR0iQKkeygHHLlrOLH5xrj2oNXp6zDvhOA2qeJI7YrP1UDK90eysI9FdxhWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(82960400001)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdaUU5RYkVWd3ZZS3J4NUprS29oMURHOU9RVnBQWlRDcDVmMlM0TlhUZnE5?=
 =?utf-8?B?M2laSUZXTXhCSzV6QmVtR1hLYUtkNTh3eGpVbUJNdGpJUFlpTjR2UGxXWnRO?=
 =?utf-8?B?RFlWMWp0QnVtUjlzL2VxYnRJcVUvdGY3cm8wS1hEUFhQdlNKaGpNTzhUTzZl?=
 =?utf-8?B?Nzd4QVBhOHpyRUlDeHNhZG94aUFwVVovenVJWVVSK3doMG1NWGFZb0JrRnN0?=
 =?utf-8?B?V2E5dDNqSzhRbUFiZlVyeVQwbzR4SnArOWpXN2EweHJLNjZobUJualY1a0lp?=
 =?utf-8?B?VWliNGlKZVZvTlRoZUl2T1VKTHMreklCZDU5ZzNOaFVJWTN3eU5SWHQ4RklQ?=
 =?utf-8?B?M3hEcWgwcG42bG1TTDBsWnB4N09aUFlONGQrYkJBWTk3eVYrbU1WRW1rdnQr?=
 =?utf-8?B?QU5ZWXRwclBmRENVaTEvMVRMTUEwSlJhUWl0UWNaWFQ3MzNseFNnRmZheUgr?=
 =?utf-8?B?MGJTK0JiQUp1SUcxYmJLVEFiMi9pVEN0cjdEOExwNUhLSU0wc3piZnlJbFN1?=
 =?utf-8?B?ZWhXYzBqMUZrVWtNNGNTMTJrUFRVdXZhakpPY0pKSktERU9vSkVmUGdYZ2RQ?=
 =?utf-8?B?VmhMWGZvNUM0K3ZFUm9qeDFEK3N2UTdGM0xQbTR2UFkyc2xna0VvL3kzcURo?=
 =?utf-8?B?c09GMDFXcjBKSWdBaXp4L1VaU2htR0VtZ0tSY3F6UEhSeUMwd0JSTVhYMDh0?=
 =?utf-8?B?REx3b3ZlQkVCQTFDSTJyb1JMNTRGcWFpdm9mVjcxUDVWdUFzNmpKOFpHOUtX?=
 =?utf-8?B?c0xheFY5VDJXR2NDb0Nvd08vVUZBSE9QKzJidXpOeGl4MC9nRzUwb0dSQ0I4?=
 =?utf-8?B?dUdGOXhPaGVrbmMxczVpS3BRVEhFN1JMRVUvbjd2b01Wbyt0U1lwaE5BMk1v?=
 =?utf-8?B?ZlZob3JvTG1aTnd4UE1MRGQ1VVJNNkFqV3pJOFBybzNCbXFuSFBMclpzSzdS?=
 =?utf-8?B?c2dsWFdlclpHYzc0ZmpuRTZNaS8rdzM4c1U3N20xci95bkU4M0VlTm4rMWhi?=
 =?utf-8?B?dElIMUpSUzk4R28zYzB5ODFML1pUMWZDRGNDNWtBU0lzbm9pMFdJVEUyZzZB?=
 =?utf-8?B?OHMvYmdXMnhGb281Ni90bGNYT1NTQk0zYWJkOTk4VC9vWjFiRFFnYUpDZ253?=
 =?utf-8?B?dzliUHRLdHR6VzNFZ1BpdWs3aDNiVDhSekF0TGsxbWZnc3JzcTdsM2F3Vkdj?=
 =?utf-8?B?TXVFdm5HdFVmUnIwTTJ3cFhmbmk3ejBVVkczOG5ocmdYTXB1aFZQakNXNmlv?=
 =?utf-8?B?blo4TDJwWklOMncxaWt4QVdNS3BTYzJsb3VWUUlIcjFqamN4a1FsaGZWL2ZT?=
 =?utf-8?B?RzFCM3hmcG1jWDhwY1NwZDJ3aXdxSWZKZGNjSnVtUFZsMkJCUk9lRU9pbHFp?=
 =?utf-8?B?aU9vbHlGTStacUN4TkgzT2pHWGZ5TjV4WDZHNmJBUGVoU1Q5dUZWSGVZMUlK?=
 =?utf-8?B?Z3RyNndRR2l6Tm1Vc3VGNHJLNUl5YW0yOEdaNGxIVFIwd3Z6eWl4N0N4NVNu?=
 =?utf-8?B?WnhtdStZbnpEZzFqbWxPZmxtVElKdGlJWjZZcUJMeHdCNU9Ib1pQbFBNK2pn?=
 =?utf-8?B?WTNnazM0ZFhtUjlaU0M2c0UwUHdROVFhOFJHS1NyVTVwcFFhQ2NMK1NsdjFJ?=
 =?utf-8?B?VDF2NVdobE1OZkRRYWRidkVlcXRicGxDc3IwNVo3aDNrZnZiRWx4RFgzS1Zi?=
 =?utf-8?B?WXdYOWhLYUNTbHpPK0g4R2wvVjVjM0N4TWRoVW5XdVR1a1IzNEhDaVhTUERE?=
 =?utf-8?B?WXhXMzFSaGc5S3Y4emJmZjVTdXFZcGdkUGY5NHRJVGxJekhxdkRlMFBSRTRw?=
 =?utf-8?B?TENaV2g3UXlrR25BQWRqN0hHNGhPNWxnS0tSNWRsZ1RuZGNmNi8weERrRjhq?=
 =?utf-8?B?SDJCeVk3S2p2R2w2T1ovQ2s0L3ZJUnBtRXVlSUR5SW1qNHZPMzNRMG83dkh2?=
 =?utf-8?B?dHdjbW54UE1penl3S3JIbGZEbndnY2t0ZHlqeDhWQ1Q1UzV0R0hUeWd1Vy91?=
 =?utf-8?B?YmpDMlVPRTRQbVUvN2VsdUdYZXcrbE1pcThvamNjbFIxMFRJcFhqVUxQZzRi?=
 =?utf-8?B?dHArdFErc2RBM3NXckc5alVhY1kvSzFwbWZ4MVk0dit5QkVmUDJqVDNhcGJU?=
 =?utf-8?B?WUZHRHViazg4S1ByNUZNRERNTkZBUU9qZTVOaC81ejcyZVNPcUNTWWpCMVFO?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33235a3a-4131-4244-4c61-08dba289af8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 21:00:44.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK0TuBvA7KP4tSc/78xfhdgZbG5tFzRN90yF+8EdMbwSBGzVga6t71VvzQNKu3qDSkg+zE2GgVzvBRxuxYpkfstoQ6psMn5UB+2UzYIqOSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/21/2023 9:22 AM, Jani Nikula wrote:
> On Mon, 21 Aug 2023, "Ricardo B. Marliere" <rbmarliere@gmail.com> wrote:
>> This patch fixes the following sphinx warnings in the htmldocs make target:
>>
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: ERROR: Unexpected indentation.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARNING: Bullet list ends without a blank line; unexpected unindent.
>>
>> Signed-off-by: Ricardo B. Marliere <rbmarliere@gmail.com>
> Already fixed by commit 175b036472f6 ("drm/i915: fix Sphinx indentation
> warning") in drm-next.

Should we send this commit through the -fixes path, so it gets included 
in 6.5?

Daniele

> BR,
> Jani.
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index ddd146265beb..fa70defcb5b2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -26,6 +26,7 @@
>>    * The kernel driver is only responsible for loading the HuC firmware and
>>    * triggering its security authentication. This is done differently depending
>>    * on the platform:
>> + *
>>    * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
>>    *   and the authentication via GuC
>>    * - DG2: load and authentication are both performed via GSC.
>> @@ -33,6 +34,7 @@
>>    *   not-DG2 older platforms), while the authentication is done in 2-steps,
>>    *   a first auth for clear-media workloads via GuC and a second one for all
>>    *   workloads via GSC.
>> + *
>>    * On platforms where the GuC does the authentication, to correctly do so the
>>    * HuC binary must be loaded before the GuC one.
>>    * Loading the HuC is optional; however, not using the HuC might negatively

