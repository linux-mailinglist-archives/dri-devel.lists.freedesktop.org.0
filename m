Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFED67269F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61110E070;
	Wed, 18 Jan 2023 18:19:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DD510E070;
 Wed, 18 Jan 2023 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674065949; x=1705601949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5SDZRjYlFeAx1lZEeID1bEkXsJ5C9kUoqFKTdBw/zJc=;
 b=KF+uR9v+NTeWdF6YwSXS5RZlIvy/xGXuqSPABjk3K9aXEdOIYHskty0m
 0gL8a2IggS71QKUovuANvvYGCUhBXmHkNCEts7PLsedJ0Lan2mVsGe8c/
 Um1mYJfct4yc82Qev2BROulC1/f5wQHZUnuLB2oIHNO97D6Z4CsB5dSSU
 QwC+6EEjnzXiPjvJtxbLGLXDEWDxzCdFRkUmsLIImxCYJLBu3+RI4z4vT
 E3Cd0uI0DrBVj9YYPkl+3+RGqEAyQR1RlgYusaf5ju3s3Kx8PrkuSkMKI
 P9z8WMwvIjg5Sl3Q+SUKVIgYBq4i8LEYxqnKrUvKsCOSpTU+gsHE6/Gvv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312936965"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="312936965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:19:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690320039"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690320039"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2023 10:19:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 10:19:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 10:19:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 10:19:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFSBZMrunFJ390GMJJFVMJ+eFGNpXhrCaMBfIrz/smdXfky2ECeA9uRSIKC6RAVrgpaU02N3zONySV6hkseDwglBsJeotUvlnHp15PqQMX7f1vQvFwrDSEU/ZgXIDzVBni0jkXnR8MPvwj3g2y5oN7ElAC6Omu7sMNTGnmmErx9Tp3SY7zHofNat0u/Razp/goNX3v2cZMoSBwxSA8CNRSAYgZlKXuH1XsYAv2ahzMhvdmYA8gM+ii+xRMqZX7q34EPOyetgbWiiSZ1s4vdbSHxyimKDYtFMWr8pFrKSz+cOPSeTDMJ3K0UKePJ6u2gJd/n1BCGWNHUWnE/DXsTHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktLAbP5CyYvUcgxN56K3NIKgeroEdao9sdNjsIVqLnA=;
 b=lBROEfETIWMjafzw3ccUtmlA8iEsMORYXa6RNNSjg+XjSKD5VxbUMPA9vTuTFqNsI9gDglBwnL/shh+1UMwO/C8Bmyr7TSVoNrRIA29CFsQI911fW6B4WRrXW7RhaxEOu0lEbun8d17lbQ/W8gfH8coW54FhwQa7h0fBj0wV/Xxe+9tXgP+baaciIloS0QvLmRHxLGCFkalfu4MbxnaEahe95pw15nbIMfKD9hNQOIEtuxyZLPnLl/W2o1cnjVX54D+FrEfu4pB6Q9UY0eeIjXjGX3q670wPhFPQoOmPKf/R+80PC9T6s4gCUM9Wplh3G1+QsBwq5H2HuP2UpnyieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 18:19:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 18:19:01 +0000
Message-ID: <5810e5e4-0b83-64cf-bb06-1ba70486ebdb@intel.com>
Date: Wed, 18 Jan 2023 10:18:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
 <Y8et+QikzQE88t1L@smile.fi.intel.com>
 <8d9b9bdb-7e08-47b5-416c-69e743675e45@intel.com>
 <Y8gyZvVpZ19NkA0d@smile.fi.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y8gyZvVpZ19NkA0d@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: e0584684-3645-4e3c-0c41-08daf980792d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1AZpJOkpugT/AJ4WW/IFziFBfnrharOQ0N1wnOHAZrdcGJvFJWU0PX8Bkfd6/MQql7cnqpXIG19VDdHHhJELjFnoskPTPtRClA4dFIWrKbikxFkh3llSrfmzFL69sp+615Up18SM9Z4i6zjtlROqIJqeSr3OtRrqacQ6CKBmrY6lKKbb64SlgGiMFhLF5PKTXbrXp6tc5xrmE4m2xgnAav1ljN5ah4ohE3wB6Emc9vhA1WZ4EMOovlsN00XQjvQfBCTauuY9ckYqAUpIHAojPPxx8gtrc91cYiuQXy2HdzgAgGdONpHnHyYmz2Lmht4CNreEuwzNdH5xL+4F/P6gYt24Z5sWUq09KKQH4C9PbYD/w/sQ9Wv1r1f/EnRFx/XQFuzoIiTY43T6lP2fT9kXO2DrggyyhQKIReVPOB+eVHwPO0MMr3zIWDWfZVIgVZxCWfdDicr/vZh8ww1FbVGaXuibOAf6CkYkGwM2qxx4GJYsTal8MVbZG/vngRSA51pm9V7+JDE4pliWidBd33tZ6bVYrRM5Mi4NLWsW/Mk2vroSwpSDTbSO+osfd3H39QRs6mINVjIJhc6S0WkZQRWyBRDSni/QDjC5329ECZB0BtiPeXBn59MShC6StIk86ZEgs/z7dB8TwBBabtINnpEw9JaJNHjP0GnubOA3U3f69rCXBpA9mW39qxk/aayT/KJf52BDQrtIJ2JELRZCn5ioQadh9AtHdub9eBNYqq3PIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(31686004)(2616005)(66946007)(66476007)(186003)(8676002)(26005)(6916009)(6512007)(66556008)(4326008)(41300700001)(36756003)(31696002)(86362001)(82960400001)(53546011)(5660300002)(38100700002)(8936002)(478600001)(83380400001)(316002)(6506007)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRrbU5qSkZYUmpsa1FERUVvRXpDOGVFaEttcWxtTTdDcVZiaitHSkhJNHVU?=
 =?utf-8?B?cFR6OXUvdjNvZW9lOGJtemhSdlpOUWt1V3I0Q05jbXE5U2hIZnBWYmVvQ1pw?=
 =?utf-8?B?Qm90MmpiczRXaldHS2FQUTZaUi9wSEM5ZVpvWXRSeG9IbUw5N2FMcVJqb3dv?=
 =?utf-8?B?a2RwU0VlY2laLzY0bTlpZXF0ejZlN2tXckZnbWdhZ05SRllBNklqdVlBTFov?=
 =?utf-8?B?aS9abDMvNXRvM2t6Y1RnL2YxVkdrQWFJVk02bTRhb1pNczNPVXZpdkxNakVL?=
 =?utf-8?B?eGU4NmJBTmhvRmVyUHVvbE1yVG00aWVjNCtKbWR3eXNOcU5GdDB5VDQ0U256?=
 =?utf-8?B?QjVUeXdnNVFOamhrdmZ0T04wNThVYnlvRGU3RmpJcFpaWlp5S25LbmNvbnFt?=
 =?utf-8?B?Z0UrTURSSWpDWGJPb0hTNWQyT01NK1Njd2xGRi9tQi9MbnRvZGY1SHVrVUdj?=
 =?utf-8?B?L0JiL1JIcVVvSGFRRkFUM05UWFNSd2xJSVpDam9sRWZVcFN4T25qUko2Wmdq?=
 =?utf-8?B?Zk9ZNmZKdm9kbzBuVGhjckJMWnV0OVNkSWt4a1V5NHZSM05CdysvaXpMdXVF?=
 =?utf-8?B?Q3Q0TlJxRnovRDg0MWZGYnB1OXAvY2FGTGtZSDVUeGtpekpsM3RtajhuVVNH?=
 =?utf-8?B?TlpEKzJNcDRpdjF1aFlHalBNWEhLSDdyb1VHR25LUGw3eGpxd2tsLzdCY0lW?=
 =?utf-8?B?T1czWXc0elpvVkRWS0daaS9xN1VWUHhMb04vNWtzRDZPbWZka1k3QkptOHcy?=
 =?utf-8?B?QWJLeXorU0Qwb3QvU1pWUkNodG9RclY0bGdqbTdxeW5VS0hTdU1GYVl5NTlr?=
 =?utf-8?B?UVQ2TjVGZDZHbmJPQVFIWGFQcHd1aUZkcHNXMWZHT0ZRRitHUTNDS3YzNGhE?=
 =?utf-8?B?dFRSUVJKWDRnK1FaVS9iVzQrQTZ3SlBhR1hHRkR6aTB1SGtxNkVhN0tJZzc5?=
 =?utf-8?B?RjErTDZVVGJ4NEc2cGFlSGlPcDR4M3ZjYlBBcndmMTVRem51RUU1VlJYcVRw?=
 =?utf-8?B?SURJV2UzQVU4ajlySFdYYS92VTVPYnQwTjZhMnc2eFdIT2V6a0w2REhVeFV1?=
 =?utf-8?B?V3U2Mi9yVXNGcitHWGlKY2hrMWEyeWl0ZlJJdEFjZGErbFR5QnNtVmhZWDZl?=
 =?utf-8?B?WXQ2R2FPeUxSb2wyVmNISkJFcE05a1hNbWt3NGs3bEYwa0djSVhnTTRwUXZH?=
 =?utf-8?B?WXZ2Uk1zdEdpTTQrdEhHQnBYaWFWUnl3QW1lL0hoV0tmKzdtSWxiamhBRjJK?=
 =?utf-8?B?K0o1TXhDaDRacHpZdWdGeFh0TVNWaGxEUUNYaW1KNk10UWhUQllKRTRCcGdq?=
 =?utf-8?B?MnA1akRFbURnNHUzRUMwZzdkT2hFYVRIN0pWNFpFd1lhcVdQRlQzbWNNOFhC?=
 =?utf-8?B?ZElSaGt4MElMSFJkWjBqc3ZvaFVvdFZiVUlhZkNlOEZVeVFjWmFoUGVxTGZ3?=
 =?utf-8?B?ekV0MHBiZjdVUTJFUVBtRGlGazdteFlQOEl6MWFPMVFWblRlMitnK1pCSlVS?=
 =?utf-8?B?Vm5raWdpK0MzQ3VtbmM1K3M0M3I1YTlKZkl0S2R2cG53WXZuWkVyUzFNL1Bl?=
 =?utf-8?B?WXZaYTF2K1ZXNWxPTUNYb2thZ21mY2VFNGZTWnNRaVpoVDBHbXcveVh3QTZV?=
 =?utf-8?B?WVRVMFZOdDBCdk1ybGVCYWJIRlRZWUs1Zysvc3ZPZUJLTjJCSG02LzZOcTdI?=
 =?utf-8?B?a0ZvaENwTkxYbitXcHprMFdpSElaNE5OVGx2bUFxOEwzME44YTdmNTErSVZl?=
 =?utf-8?B?eDAwSGxvOVdIdnBkV1dzT2RZNVczdEhMb0RzOXFHTzRKN2U0UzRwMG54UE8v?=
 =?utf-8?B?T2lpaThDUzVqTTRBUGIralBNRUNCanRYS0daQVN1T0s5cE8zY1h6QWZudnMx?=
 =?utf-8?B?WkRSOXMycTJDQU10T2d4b2s4V0lCWmVRdC94VEtKQmRwcGZ0WkM0WTFEdFBP?=
 =?utf-8?B?b0J2Sk9LRW1SQlozRndZNnZMbkdUd1lnMGcydGpLeCsxVTlUbkxQT08yQzNh?=
 =?utf-8?B?bmsreGg4dEE0ZjFTWk5yWEQzTnJ4S01DSXM1bHVhcWhINGFvTVNpRytoSEhs?=
 =?utf-8?B?Y25aQ1BnRzgvTWJQMjRaeGF3SVYvVmpZTUpJbDZTWXpkN0FkNUhOMXVkRXB0?=
 =?utf-8?B?Slp2SHlGeTJMa3F5NCtPa05VU05tLzBmeEdSeGZ3TTdZbkNQR3g1djc0YzV3?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0584684-3645-4e3c-0c41-08daf980792d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 18:19:01.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McgnuBswA5msum6xGaRmX5W9lfmiy5ll9KZ3Or8uqxy+wrUVz2XOPY2v1npV4LiJs62Z4pKjUFPHowD9kuV2dRZpvKd2CfvgyqZN2NbeJTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/2023 09:54, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 09:34:47AM -0800, John Harrison wrote:
>> On 1/18/2023 00:29, Andy Shevchenko wrote:
>>> On Tue, Jan 17, 2023 at 01:36:26PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> When GuC support was added to error capture, the locking around the
>>>> request object was broken. Fix it up.
>>>>
>>>> The context based search manages the spinlocking around the search
>>>> internally. So it needs to grab the reference count internally as
>>>> well. The execlist only request based search relies on external
>>>> locking, so it needs an external reference count. So no change to that
>>>> code itself but the context version does change.
>>>>
>>>> The only other caller is the code for dumping engine state to debugfs.
>>>> That code wasn't previously getting an explicit reference at all as it
>>>> does everything while holding the execlist specific spinlock. So that
>>>> needs updaing as well as that spinlock doesn't help when using GuC
>>>> submission. Rather than trying to conditionally get/put depending on
>>>> submission model, just change it to always do the get/put.
>>>>
>>>> In addition, intel_guc_find_hung_context() was not acquiring the
>>>> correct spinlock before searching the request list. So fix that up too.
>>>> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
>>>> with GuC")
>>> Must be one line.
>> In my tree it is one line. git itself does the line wrap when creating the
>> email.
> Can you elaborate? I never have had such issue with git send-email (starting
> from v1.6.x of Git for sure).
Hmm. Confused. I think it must have been something accidental in a text 
editor when reviewing the patch. Re-creating the emails now isn't 
wrapping it.

>> I missed that I need to manually unwrap it again before actually
>> sending the email. Although the CI checkpatch also pointed this out in it's
>> own obscure manner.
> ...
>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> Cc: Michael Cheng <michael.cheng@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: Bruce Chang <yu.bruce.chang@intel.com>
>>>> Cc: intel-gfx@lists.freedesktop.org
>>> Is it possible to utilize --to --cc parameters to git send-email instead of
>>> noisy Cc list?
>> This is the list auto-generated by the 'dim fixes' tool. I am told this is
>> the officially correct way to create a fixes patch - copy the output from
>> 'dim fixes' as is into the patch headers.
> Okay, so it may be question to the `dim` tool then...
>
> ...
>
>>> Stray change.
>> Intentional change to improve the readability of a function that is being
>> modified by other changes in this patch.
> But not described in the commit message. That's why "stray".
Didn't seem worth mentioning. I can add a comment about it.

John.

>

