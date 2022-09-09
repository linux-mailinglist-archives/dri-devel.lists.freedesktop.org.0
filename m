Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBF5B3593
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEB10E179;
	Fri,  9 Sep 2022 10:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DAE10E179;
 Fri,  9 Sep 2022 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662720680; x=1694256680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zdFvFdOxt+3x4Tn8tqpScL1YJmw8RO+Glks4z5oIMDU=;
 b=aQLshxA2XRbWiz0bkrS6ApgtZYYdKRHLRuZWDsKrqLAY88+CF0fI46kJ
 ILDxaTZvoq2gv7pZHTrRPMSG9ye3SkV/tRYnRPyEW+Aeay96HskqyDk71
 pWefb0Pi40NM8tvjyvZRsceHs9bXq9G8U5G9cq7RpbtrVUEN/cdMnLA2I
 bwh9wLZztpQbX/96ZBHQ9jcKIpVPhTn6iQEoTlKsUDlwRLcsqB8QdMvcb
 3aW8yhDkM90fiww/NO10B2zE0sJI4ZhvVmvb6ViNgUHv/1Fn81JWjUm+N
 HEVZWLueUesUJIoAqaFjB6GRc7/6U00OP8y6uM9Hk/IZzR5D847NkDf5I g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298252166"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="298252166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 03:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="718926640"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2022 03:51:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:51:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:51:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 03:51:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 03:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os99XVDtxu7KNPxl1pw4OLk77Vgl6O/I6vKrSiX56hqj9SWuph5RZYj3m8EQxIAlFIk9I9m0jDJZIlNm7QXsLwJUTSlevGZ4tlPaCe9/h2v1jnrx5nuOn09fNH2tubMbZUBeqTs3S6ZVlbHZ+LDyN7UXoqebIpTff01Ez9NEZfGbDJkD30lrFiYZv/haVk/BTAIYztt3AMNwYb6hIIIfHan1uXDAlJavFQIzOVV7nCbQy1o3DqMjb6IwXjqHolAqic/DUg8yYKsQ/KfcYZycH2SrVwqeuEi1yUSbjIT0pYVuJ0Bxl6xrKkR0SgF28wF4vhOeuZr0jsgGLeOALi15Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLukjVLO5/WGV9z+5Sg3jLH+ffTo+e2KBabmkeHGtHw=;
 b=NQFhDJLJjDiMcVUTg6dBekVptZLF2u2YcfXgWW/SObqHD7MKDKDm5fxczL/NScjRks60MG3m6GIHw8TLCMqEL35gNarxXcqFki7aw1u4VUfqdu3HcO22yK+iamFhuYW0oDsiF9m7P6KxYeo7YjlIUfH+Zgxh0Wf8sxhJDIQ427edP8aFivzLqFVanRPL3zHrERMMilXsW2JXEG5MNUOvYL4Tpqi9R4mdERBZ42XV5YVnjy1PxAEKBmV3koRUx4Zpb59i8Mw1CKUukCQxr2effGMnCo77EyXBKxov5BGQ2E/4vwMuckhZxA4GsJ3LHaWmvfOPQ74lZXcpbjmZON3/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 10:51:15 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%6]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 10:51:15 +0000
Message-ID: <36ae71f0-e259-1aa6-dcce-ff72e8e0709a@intel.com>
Date: Fri, 9 Sep 2022 19:50:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 1/8] overflow: Move and add few utility macros into
 overflow
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
 <20220824084514.2261614-2-gwan-gyeong.mun@intel.com>
 <202208250848.1C77B9C38@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202208250848.1C77B9C38@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: db0a2075-8001-4456-2a6b-08da925137a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUAt5qaS32DizF1t+/ZGS/3w9GVffSsQhPtAhuNr7oT4cW3MZjXwJAydOswr4vuUug5aoNlWtAuvN2CeJ3nEVKy6k5XYTGXFWLm9pe4eaDMpOI6Nn85g2J+co71QUKnwmuAEpJYnZrFUZl2iJ0x+FG8XIT06PJEeB3maN+yhOUatjVaZeFwJLTSonqNigeCbWahR7TFo60qgegPaF28JFUqOodmKiFYjlRMEz5DLewC0scLftEagFhqjdF6Xe3loT+bDFCbVc366MK7T/4vkK3qKUHhHnzecuFJ9RWMofG+mwhn6XFvPdiPTSPDRQBXz/HpMHXMPo4NlZ8/CrblhpPwN2/AlI5oIsNbTJ19C1KYeX4c49lzGHfKvDw0DJY3Fqb4RFZsx7woLdBI+o2UgmBnPd0wrMi8A/kRo5qAxx900mJd6h7q5OjRyAuHRvdCM6wsi2peTf5D7RltCbN+Rgy47NZrltlD5xVJx5PlaXMeYWsBq82XjuNu7Ga2rK7ePW0I5AaoyLphVkET8Vtp1gcOXUOMgA2Tu45UBjx21GjVW5LPj9yZLzr4XR/kBswDcmKEgRBi9WPGsvnc0hw7xHgof1zd7V84orvxQIXO6vDU0mXlFdw1YBHmk9n5+c3or7HIAzyjlwEOM34nzy6sCeEtLnFVVlUAd1wH/q8GBMr75FKU/jGmrQi8EnTGb0jcXMCm1UOGjKunjvWeOy8Cj4jupcpH41pRxnkGvGixvzWEeTWJwpQeYuZp8QAdZYbmq12nPo7zpDiA25SIG5iq43l/GwxBBWMcWR9XKP+xy24vJvee7sWU2yLYy88LLIZZ8BQrb4YgOt5G3sIDEoUrGWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(376002)(366004)(136003)(66946007)(66476007)(6486002)(30864003)(66556008)(31686004)(7416002)(31696002)(86362001)(4326008)(2616005)(8936002)(5660300002)(6916009)(54906003)(316002)(8676002)(2906002)(36756003)(41300700001)(6512007)(26005)(966005)(53546011)(478600001)(6666004)(6506007)(82960400001)(186003)(38100700002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJZd1ZkUUtFVHVBMnM5YkhhUWMxKytvZnhmTFZDNmRUT1Z5ZkFIY2pjN1My?=
 =?utf-8?B?TnhlcVdMd1NLK3JjNER3UkpoWjhxRTFEaS94VFRROVBKcmVKMVdQbHdpWnNU?=
 =?utf-8?B?TEZUQ3cxY2VqajBEamFwa3pMR1pHUnc1ZVp3WHNYaFlnb1YyOVM0SElVeVJ4?=
 =?utf-8?B?MlNNRGtpTGJucmgzeGgzVTdxbkJyZ1g2YUcwZnV3Mzl1QXI3Nmw4RXdGbmh6?=
 =?utf-8?B?U3ZnM3E3bG5FSjRNaXRBOFYrYjkrWm5uSkY3M21mNE5WRW5jL2R5VGVONHc4?=
 =?utf-8?B?RTJDTFo1d21iTmw2N25kNEdkbUFHMlhxbm5GOGViSk9PU2F2NUsyblFRR1R0?=
 =?utf-8?B?aEFCR2dxVlp4eWs2Y3NHWjBtckJlNTF1NTVEaCsvU2VFN1BRczJISEdvNmZn?=
 =?utf-8?B?N3N2dDNDcThqVjc2YWNJek83OFIwVmhhZm94R0U5NmVMNzBQRGh4VEtwaDhz?=
 =?utf-8?B?dmdUdytKYmFzR0xIaFhWanoraVVLaEI2YmJmVzRLU3BGOTBJMWU3YUYwai9T?=
 =?utf-8?B?VXZpaTJsSHNXaUtNSG1LUGI0ZW50ZXJwZUltRENGeDVRVjE5dWpBQ3JCNUF2?=
 =?utf-8?B?RHJUVzVWbHN0bDhzcUJFeW15encxamtoVjBkMk5nT0JDV2ZUTmpRcmhlcXN6?=
 =?utf-8?B?em1MWlZFSTZCMGJxQ2hQc1lkMlB3S0llWHREYXA5YzF1QkpidmhiNFVjSDJT?=
 =?utf-8?B?OGRTRjA3ZFpUcnFEWEo5NktvdDB2bkcrTGVvQ1Vqam9LVmV5SWFJV1poKzE5?=
 =?utf-8?B?SHM0azhxdTZ4aGU5aUErVEZVSVMxUTgwQzNIU0JJcHRNLzBDVVhkTUFBcXU2?=
 =?utf-8?B?RjNBazZ5TDRLSkpQQ1NjT0MzVVBYdjVEMFpuV3JxVWdCOFJ5UXFmajIxWTRz?=
 =?utf-8?B?Q2xWZXBqTVBaWThaNW9abHA0RytJaEZacnNzbUtqaVdUcWhKVjUzY1JyVmUr?=
 =?utf-8?B?RWV5RWpaMTlGcnJlbkorL2RrZU9kN2QrREJLNzNFU3E4UVdLRC9LWVRIRlRv?=
 =?utf-8?B?d1UzTEtxSXhJbzlDaTdjbmhnRUpITnZPUkNNM2hFNGx2SWFpTnRhTmZjT0xa?=
 =?utf-8?B?UGJ6YzB5bFc0Mmd0Q25teEQvdnBwWmRsYndLTUVyT3ZTWnBZdDJheFdZa25j?=
 =?utf-8?B?R1I3eUJ4K2pZUjRCQ1c0VzI4bWg2SUsvVkhBVVQ5VklwOVNnUStlNTRLdi9x?=
 =?utf-8?B?U0UwcHQ5ZFo1MUNRcTBzRExNeTRjc0RxczFScWJzVUp5QVlKd09jQU9nL3NJ?=
 =?utf-8?B?OVI0UVRWcUIzeTRlRkZYWkR3c3pOUmpuaEVWTU9TT1JtNXVFNW9FYjVQT3cw?=
 =?utf-8?B?L29ueWlQTGRUQXZ0S0lWclhnWlE0em9LUUZ0RmhlZ1dtaXdyM2N5RjZ1Ylo4?=
 =?utf-8?B?WFErYWxCVzV4SG5YOUVWRXY5M05qUU4yaXRjWUNCcGZFSnNWZlArSnhSNW5m?=
 =?utf-8?B?SkdTWXFkUHRwWjVwREFaSE5qNkhpSWljMmxxL0N3eW5xbUpaTkpLSERtajZZ?=
 =?utf-8?B?dmt4dlhQTU9HRlFwQzlpV1c4NU1lLzA1cDBzejVYcUQ3M0dYVE4wRUFRdXps?=
 =?utf-8?B?NzdvSVFHeWxVS0NJeGxpRWZNVGxDOW9EbEIzQ3pTMVVnRnR2bUl3aHBReW5M?=
 =?utf-8?B?NUxRci9EWElBZ3hJTTMxR1FCd25oOTFQMTRYeGFyejA0dkVqVUgrV1dvWlJ0?=
 =?utf-8?B?Q2tuK3hBSWtzSjJqaGtaalMzZk9kb2NJdTZOY09qQlZzbzZLOHBsOEh6M2xo?=
 =?utf-8?B?K2QzYWZoQmZqeUFiUE5Kc1I5Vms2TGR1bHpqWndickVqY2JDYmJnT21GNDJr?=
 =?utf-8?B?STJUcER0RnI2Nys3ZzczRWg0RGRsMTAvQUdpcXZxaHZnVU9OQWI2WUJXeU5x?=
 =?utf-8?B?NjhlZjV5WldtN1lSZ1JxVnZ1Z3BVeGF6cmZLWWwyc0JOelRxRFBGdkd5Y2pJ?=
 =?utf-8?B?SXdla3h6YWNkOW5aZkMxZjU1QTVxNjZUV3lNY2dKRFozSDdDZDZqd3l3eUlU?=
 =?utf-8?B?b2dDVWM5WjZFcUFWL3Bkb0hMd2JJbHZab3VhSDdKcEw0QktFUlAzWi9uVGgv?=
 =?utf-8?B?UVJla1Y3d0t6NkdmdEFJR0hkbnZDelRSaTZCbGtRcmxwYkFUVm9YNGlyeHAy?=
 =?utf-8?B?TnVFUDNtYzVyb3NRNy9EbDVTVTFQMU1YVW1ZMFhZMXVlTWgyQXY3ZEVhZDNN?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db0a2075-8001-4456-2a6b-08da925137a5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:51:15.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2E+prLpXKI0lTlZAWoYk0LFNcrPlY6EfuZXFg50CTaa6WUJj30643vDRX8+4/WXADH3MKaSJQgaCsQPPuMDYlDaUzcTyvcrzKFcFuYQkm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com,
 Nick Desaulniers <ndesaulniers@google.com>, intel-gfx@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 intel-gfx-trybot@lists.freedesktop.org, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/26/22 1:47 AM, Kees Cook wrote:
> On Wed, Aug 24, 2022 at 05:45:07PM +0900, Gwan-gyeong Mun wrote:
>> It moves overflows_type utility macro into overflow header from i915_utils
>> header. The overflows_type can be used to catch the truncaion (overflow)
>> between different data types. And it adds check_assign() macro which
>> performs an assigning source value into destination ptr along with an
>> overflow check. overflow_type macro has been improved to handle the signbit
>> by gcc's built-in overflow check function. And it adds overflows_ptr()
>> helper macro for checking the overflows between a value and a pointer
>> type/value.
>>
>> v3: Add is_type_unsigned() macro (Mauro)
>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>      Fix the problem that safe_conversion() macro always returns true
>> v4: Fix kernel-doc markups
>> v6: Move macro addition location so that it can be used by other than drm
>>      subsystem (Jani, Mauro, Andi)
>>      Change is_type_unsigned to is_unsigned_type to have the same name form
>>      as is_signed_type macro
>> v8: Add check_assign() and remove safe_conversion() (Kees)
>>      Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
>>      Add overflows_ptr() to allow overflow checking when assigning a value
>>      into a pointer variable (G.G.)
>> v9: Fix overflows_type() to use __builtin_add_overflow() instead of
>>      __builtin_add_overflow_p() (Andrzej)
>>      Fix overflows_ptr() to use overflows_type() with the unsigned long type
>>      (Andrzej)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>> ---
>>   drivers/gpu/drm/i915/i915_user_extensions.c |  3 +-
>>   drivers/gpu/drm/i915/i915_utils.h           |  5 +-
>>   include/linux/overflow.h                    | 62 +++++++++++++++++++++
>>   3 files changed, 64 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
>> index c822d0aafd2d..6f6b5b910968 100644
>> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
>> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
>> @@ -50,8 +50,7 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
>>   		if (err)
>>   			return err;
>>   
>> -		if (get_user(next, &ext->next_extension) ||
>> -		    overflows_type(next, ext))
>> +		if (get_user(next, &ext->next_extension) || overflows_ptr(next))
>>   			return -EFAULT;
>>   
>>   		ext = u64_to_user_ptr(next);
> 
> I continue to dislike the layers of macros and specialization here.
> This is just a fancy version of check_assign():
> 
> 	if (get_user(next, &ext->next_extension) || check_assign(next, &ext))
> 		return -EFAULT;
> 
> However, the __builtin_*_overflow() family only wants to work on
> integral types, so this needs to be slightly expanded:
> 
> 	uintptr_t kptr;
> 	...
> 	if (get_user(next, &ext->next_extension) || check_assign(next, &kptr))
> 		return -EFAULT;
> 
> 	ext = (void * __user)kptr;
> 
> But, it does seem like the actual problem here is that u64_to_user_ptr()
> is not performing the checking? It's used heavily in the drm code.
> 
> Is a check_assign_user_ptr() needed?
Hi Kees,
Yes, the reason that an additional overflow check is performed when 
assigning a pointer type is that no overflow check is provided when 
using u64_to_user_ptr())
I also agree with the explicit overflow check when assigning to pointer 
type variables.
I'll add check_assign_user_ptr() to the new version of the patch and use it.
> 
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> index c10d68cdc3ca..eb0ded23fa9c 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/sched/clock.h>
>> +#include <linux/overflow.h>
>>   
>>   #ifdef CONFIG_X86
>>   #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>   #define range_overflows_end_t(type, start, size, max) \
>>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>>   
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>   #define ptr_mask_bits(ptr, n) ({					\
>>   	unsigned long __v = (unsigned long)(ptr);			\
>>   	(typeof(ptr))(__v & -BIT(n));					\
>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>> index f1221d11f8e5..6af9df1d67a1 100644
>> --- a/include/linux/overflow.h
>> +++ b/include/linux/overflow.h
>> @@ -52,6 +52,68 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>>   	return unlikely(overflow);
>>   }
>>   
>> +/**
>> + * overflows_type - helper for checking the overflows between data types or
>> + *                  values
>> + *
>> + * @x: Source value or data type for overflow check
>> + * @T: Destination value or data type for overflow check
>> + *
>> + * It compares the values or data type between the first and second argument to
>> + * check whether overflow can occur when assigning the first argument to the
>> + * variable of the second argument. Source and Destination can be singned or
>> + * unsigned data types. Source and Destination can be different data types.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_type(x, T) __must_check_overflow(({	\
>> +	typeof(T) v = 0;				\
>> +	__builtin_add_overflow((x), v, &v);		\
>> +}))
> 
> I'd like to avoid "externalizing" these kinds of checks when the better
> path is to catch the issue at operation type (add, sub, mul, assign).
> Looking at existing users, I see stuff like:
> 
I'll update overflows_type() with updated  check_add_overflow()
( https://lore.kernel.org/all/202208311040.C6CA8253@keescook )
>                  if (overflows_type(item.query_id - 1, unsigned long))
>                          return -EINVAL;
> 
>                  func_idx = item.query_id - 1;
> 
> This requires too much open-coded checking, IMO. It's better as:
> 
> 		if (check_assign(item.query_id - 1, &func_idx))
> 			return -EINVAL;
> 
> or other similar:
> 
>          if (overflows_type(user->slice_mask, context->slice_mask) ||
> 	...
>          context->slice_mask = user->slice_mask;
> 
> and some that don't make sense to me. Why check argument types? Is this
> trying to avoid implicit type conversions?
> 
> So, if it's _really_ needed, I can live with adding overflows_type().
> 
thanks for checking in detail.
Yes, it is thought that the above-mentioned codes can be modified using 
check_assign(). And it seems that it can be applied as an additional 
patch after check_assign() is applied.

And the code in the form below

if (overflows_type(size, obj->base.size))
		return ERR_PTR(-E2BIG);

It seems that it can be fixed by updating type_max/type_min/__type_half_max.

#define __type_half_max(x) (((typeof(x))1) << (BITS_PER_TYPE(x) - 1 - 
is_signed_type(x)))
#define type_max(x) ((typeof(x))((__type_half_max(x) - 1) + 
__type_half_max(x)))
#define type_min(x) ((typeof(x))((typeof(x))-type_max(x)-(typeof(x))1))

   if (size > type_max(obj->base.size))
	return ERR_PTR(-E2BIG);

And when a type is used as an argument, it is used for comparison with 
the size used internally (not directly exposed outside the data 
structure or accessible through pointer referencing in multiple steps). 
It seems that max_type can be used in these cases as well, but when it 
is used to check before calling a function that actually allocates 
memory using overflows_type(), it seems that readability( or intuitively 
understood)can be good.

And in the alloc_table(), the function calls 
"GEM_BUG_ON(overflows_type(count * PAGE_SIZE, sg->length));", it is a 
case of checking and creating while looping. In this case, 
overflows_type() seems convenient.

In all the confirmed cases by me, it is possible to avoid using 
overflows_type() by changing or modifying the code in a different form.

In all the confirmed cases by me, it is possible to avoid using 
overflows_type() by changing or modifying the code in a different form. 
but there are also codes that can be easily or intuitively understood 
when added, so in my opinion, it would be good to add overflows_type() 
macro.
>> +
>> +/**
>> + * overflows_ptr - helper for checking the occurrence of overflows when a value
>> + *                 assigns to  the pointer data type
>> + *
>> + * @x: Source value for overflow check
>> + *
>> + * gcc's built-in overflow check functions don't support checking between the
>> + * pointer type and non-pointer type. And ILP32 and LP64 have the same bit size
>> + * between long and pointer. Therefore it internally compares the source value
>> + * and unsigned long data type for checking overflow.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_ptr(x) __must_check_overflow(overflows_type(x, unsigned long))
> 
> I'd rather not have this -- it's just a specialized use of
> overflows_type(), and only used in 1 place.
> 
okay I'll drop it.
>> +
>> +/**
>> + * check_assign - perform an assigning source value into destination ptr along
>> + *                with an overflow check.
>> + *
>> + * @value: Source value
>> + * @ptr: Destination pointer address, If the pointer type is not used,
>> + *       a warning message is output during build.
>> + *
>> + * It checks internally the ptr is a pointer type. And it uses gcc's built-in
>> + * overflow check function.
>> + * It does not use the check_*() wrapper functions, but directly uses gcc's
>> + * built-in overflow check function so that it can be used even when
>> + * the type of value and the type pointed to by ptr are different without build
>> + * warning messages.
> 
> This is a good point: the check_{add,sub,mul}_overflow() helpers
> currently require all the params be the same type, which rather limits
> their usage. Perhaps this can be weakened now that we're not using[1]
> the fallback logic any more? (Separate patch.)
> 
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns true. If not return
>> + * false. When overflow does not occur, the assigning into ptr from value
>> + * succeeds. It follows the return policy as other check_*_overflow() functions
>> + * return non-zero as a failure.
>> + */
>> +#define check_assign(value, ptr) __must_check_overflow(({	\
>> +	typecheck_pointer(ptr); 		\
>> +	__builtin_add_overflow(0, value, ptr);	\
>> +}))
> 
> But yes, this looks correct. I really like it. :)
> 
>> +
>>   /*
>>    * For simplicity and code hygiene, the fallback code below insists on
>>    * a, b and *d having the same type (similar to the min() and max()
>> -- 
>> 2.37.1
>>
> 
> -Kees
> 
> [1] 4eb6bd55cfb2 ("compiler.h: drop fallback overflow checkers")
> 
