Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC874C4D20
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06610E8D1;
	Fri, 25 Feb 2022 18:01:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5710E8D1;
 Fri, 25 Feb 2022 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645812085; x=1677348085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G7SSyFP42jBFPVZqsrvzwpYL07iiEXN/FkisWU6iRoo=;
 b=bYY8wtfLBYu7EMzCFGRb/y5exrc9ofCjwO6SplqZXUHoWPnWLUk/siN8
 cD1rjkZ9O29ikCiBZSnWkTJp/Y2A9dGJ6lzQQB/jeZVZTBzgfXDtVmZ0o
 PoDe02ZQNdSLwO9JcQiD4yFgbMH6YvlOBwiLcS46iq5avZwgSuSEyYuKU
 P+y6UW0cgjUtMy2kuxwazCxrliR+qrNKqqR9RIPbZGsHwR27NcTBlE53b
 ymIEZkN+P/hugcgAqXKAr0dXlJHIAmJYt91zibQSW00gcX+kEkc4dNq3P
 6FqpbIR54dE1wZafjnQ0YuLAkz9KiXrvwW0vWOe8NBQGgRiJ3voM2BoA8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233172234"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233172234"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="640191263"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga004.jf.intel.com with ESMTP; 25 Feb 2022 10:01:24 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:01:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:01:23 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:01:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVV9NIp9TzV9sZ0vOkBruyHoMJ1QsktzJwlbryfMV2pcjtgovYbUvCbpIl2nmM/+TTvTXzwOzSWh1jaF6x/LPDoBZkJlCb8vkv9JdoXKDqSKoFytu+Dd+bcFrs+ioiDZWgGe+R7ah34NQC9QhsA9H51xuVAt7d1uQCv605mtHh85JssWVo8nuFGLA8G9AQbjdPYN0JBSvOxyVNYZpwTNG2jQUWjWL+YKuzChlJtbomhKtaIoxQEUtlMDy7At4fJTCVwTV1y9FFrAIBYF3uFKwZg/yY+CuC7ebyT9fGjFkKJnK1yYrK+IDJhlmnjkJ/Q1xzEDv6/pZyJNFQhgPpmUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX8uUW1xLdn7gJKnOd6NU7NLnvK5yWyR/m4ZLD4xbgM=;
 b=bRr6UUkZKmgmcs0Djwkx54JV8aoW8fIUKtSfiV9lgZpLuJuiF5QvNfWFgwkYbGl19D9EdfcCdcRTBABLx3I4s9v8Z0zWJyP+OqebTLue95++Nsr6YP7TC+beo1Ac2wjA+knlS9KtrqW76qwl6SAnZ6Q2EpjlXi52VENhgLAifqmxVhIfvLnCm09Lo3Qb5AIUwAZDC5W3PmghFdqloSkyF+YioesEalO8lmXdSK8cCQS8rbVawky5ZFcKn2NlQ5lPCEQV2Q2B8rleoWZplGCVPnkJkwCpka7b6nYjccj7uPP6FmIJZyic/1qEm0Rl17qgnB2owOEYvovBnPXgk8z+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5756.namprd11.prod.outlook.com (2603:10b6:610:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 18:01:21 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 18:01:20 +0000
Message-ID: <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
Date: Fri, 25 Feb 2022 10:01:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
 <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
 <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR12CA0042.namprd12.prod.outlook.com
 (2603:10b6:301:2::28) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec765ac6-5a67-4b1d-68ce-08d9f888d40d
X-MS-TrafficTypeDiagnostic: CH0PR11MB5756:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB575656B78FFCBDCD3DBE87FBBD3E9@CH0PR11MB5756.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8b8Lehf66FyBhBB6pzZHZH1sQxp1ALiJPlnD/ob7aG5/wNyjOR4fukAuBI7qR7iHlVNkVFqQSAtBoa/1/PEsGyVUcMOcAinpRgS3YzRwuAej9t5GwB3IBefeRjnwppP9ns62X2Sqsy8YjGpRJMOCGh3Rz3t1GQ3+T8GV73nXydukIsE7QnTe2PYfwNtWYyuahR/XceJYQQb2azY51PbKELw6OO1eT+LiXwnG8MJ97t/xCHbYOaNN0IdHXhf98wvzmaxv10Jt6h8ABEY0ysS40G7AbDtoncUFNhxkHZ3lbDwNli6Vw9t0zypPNAH339ujDCtHpDFKxMdwc/q6ECtaXrWsAqcRlaZhsFsMu7bpNNEjt7AsNvMH+3gsOoMeaRD2PjRWDIZS5kaNqa1ZSxSzLsN8ygkxBukIC0DLGGrHJD3XKdZoKj0n1ucrWcmeSq+I3WW/GR4KIeNQS4zPBfDZJ2bY5QDWOMXdKX6UMiD+5+kszf1YPG5CP3QRZ16M8m8lZ6OEcqPsN7cjwL8ezmtdQIPxVuYzUt0G+8zRaQnWZtBDvW5wbrHj2bSAhiKRrB5fyClb03kHDGsEudD8hqsqs7ljNnSK6kNCMgs8qZKdZmLc7xUIj1e62AKoO5J3TMTRkKnEJJBzuLwKeKmBfb9qj5CQ3/TAKkNQlqmtDj0xp0mIapQ5ZmVvlVeCoOOgJvdSEqynv92nIqeHiNME8ekVixAyl3ReJOYWKQlRGTcu0H4RBeIKWP8ygzKLeRrV83R4XjAWvCfs82M4hzueo4BPZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(83380400001)(26005)(31696002)(8676002)(66946007)(38100700002)(66476007)(66556008)(82960400001)(8936002)(86362001)(4326008)(31686004)(5660300002)(2616005)(6506007)(36756003)(6486002)(2906002)(53546011)(6666004)(6512007)(508600001)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUlwd2Y4Z2FXazFLa1dDY3VaTFlWVWZxTXRHK0toUm1CU3BLMVdzQWxKT0J3?=
 =?utf-8?B?aktqb2I4ZXJRVWZZSmNjNm45SUY5aHlMR3dKM1lFNXo4Q1NPQlp5ditaWTJx?=
 =?utf-8?B?b3V6OWdidUUvd0hoZjFmdmpjUWZaSEFhNWtuZ0ZEZmc2SjdyOEpidjhQNytm?=
 =?utf-8?B?dHQzMHZmR21WYjA3d0dHV1Y4MnlpS2U1TzlvZkJWa2FXOE44c215b1B3d0Jz?=
 =?utf-8?B?elg5THdSM1hRSFg3ajlDK1BVUjFXVFdiTWZKVytpb2xsQkFPTVJHNlRIRHhL?=
 =?utf-8?B?cm91UGNvUnJmSWhWU21qOE90dzVpd2c2anFWUGFsbU81M2RqNnQvYmtpZHFD?=
 =?utf-8?B?blhCN1c2Ry9JUUZlZXZLL3IwUjBJYU9qWkF1WHVkVkM5dFBIekR1dm9UZlJi?=
 =?utf-8?B?U3IvV0RxQjBEL3lhcHdJSmVtOXl5Qlc2bkZoVjRHbFhPMGpyQXJUWklUQnBM?=
 =?utf-8?B?QXU0VjY5QVEvNC8xR0VqTyt2R3Jmdkdob0sxcWtzT2VEOXpKL2J6ZHFLQTcz?=
 =?utf-8?B?V1lIZzdCclFleS9OT2pBRjA0d05BbEVtVUczdEhHOHc4S3RRUG8vUFk5RHMw?=
 =?utf-8?B?M0NhSHF5VUhKc2ZPK0ZMMFpuVlBMYWRlSlY2YmNWeFpORUxyckFIaWZ4b051?=
 =?utf-8?B?Vm9KendiRTdrY3lPTStTVGFGanJNUzlOTkFSRUVYU2NuOGcvMktiRzU4MUxJ?=
 =?utf-8?B?M0ZZQ2N6VDRnem5jc1Q3ZzRjNk9TaHhQSnRrM0lGenZxSkg4QnB6L3ZuMFJU?=
 =?utf-8?B?OWlaVXZSVHFDSTlIajBQbXU4TzdXbGNoQjlJT2hBeVp6QlZBeG5KR2QwSmlD?=
 =?utf-8?B?NWQyaE0yS2h4M1JRc1ZyMHhZYlFmT2VSdGdYNmswOFJHdXpMRy9nbTg4Y014?=
 =?utf-8?B?UmRoWDNhcDR4TktydXpwNnJXOHNDaHhhTUJLWkwyUnh2ZTdDMm8yMVc4ZjZs?=
 =?utf-8?B?MkowU1QxbEU1TXdZSm9FYkhLejdqM0RJRTlMN2x4ZFp3Ryt0ajVSTkJQTE02?=
 =?utf-8?B?SG1Qdjd1UG5aQWN3VFJaY1lnOWViamtlay9MeGZTSDNLbmJsV2N5cUkxNDhw?=
 =?utf-8?B?aHZOZDcvemdOOVUvZnBOcTAyZXIzUVZYTDhLMll4ZkNpS1J0NlFrZTVXTkUr?=
 =?utf-8?B?LzVlaHpOTFp5ZlM2R3FQU0hpaFljTHhvaVFBamdSVWVMVkI2TmdabDJRUnRP?=
 =?utf-8?B?ckxGajAvRlIzaDVQRlFHcmVoeDB2Y0ZreUk0SERVZ1d2Q1I1cDhIMHZjK01N?=
 =?utf-8?B?LzRxNk95alBuWXFJV24yYlRpalNnR3ovSGoyTDlJTHljM0tWSjVqcW83WDlo?=
 =?utf-8?B?YmFqSXN3NVRRcTdVOGkxZnFPYjFYSE1CRVArM2taQUlwQldyOUp1UGtJUXJM?=
 =?utf-8?B?SjZyc05ObFVLRWVFWlNNVk0rSjE5TFRxeUg2aS9QWjh2dDJuVW5hbjgranRR?=
 =?utf-8?B?NkxKZ3Z4MEVmV25JNGZCQ0d5S1REQllVU1d1Zk9IZE9OS0FieWpxVTlSeFZH?=
 =?utf-8?B?RHd2eUZqZnN6aVFoYnpPL3JHNFJjYlF6WUM3dElhaXlxWkdkKzNCdHkyNS9E?=
 =?utf-8?B?MjZ5azVreUkwZkZjb1Baa2ZwWWUzSkdveXJTVGY4NTBQNnNBbmI1djdUVXUx?=
 =?utf-8?B?Q1k5elE5OE1CWldiWktOL3ZoMjVLRnEvNldMaHJOSHVHbm1sZkh0c0ZaS3JX?=
 =?utf-8?B?STNmNXU4UVJ2MFlSMFVuRk11RlpYbCtDMWFNTlNHUjdxMzFNSFMvaU5PTTlO?=
 =?utf-8?B?V2dULzhKVFV5cHB6NEdwYXRSUHJnUDlGQmUySkdLQ3ptQVlXQ0djRDhXZUZr?=
 =?utf-8?B?M2h3UWRqd2RUanpVVnNNM0R3OUxHaGNkOWI3QjJLajlKSHkrYjJNZnUwR3Jq?=
 =?utf-8?B?U2IxU3h6U0NrRm0zYXQwc0lTVXIxaU5UY0xFcHNYTU5STFpmYXNBYkhzSkM1?=
 =?utf-8?B?WmZoL3lIb1BOOWxDVXB2QlpYN05iSjBqSEhwUHBjMkczblBwNE5zV0VZa05O?=
 =?utf-8?B?VllXYlk0dWVMTWlyT0NZY0x1bjV3R3daZGRsTVpobjBXdWZUQUw4ZTdiaGxU?=
 =?utf-8?B?RzE5d3plYVBTNUtUU0JFSVpydzdKa0dtQ1dJTlZ6YnJpYVlsNXNVUUhiL0Nu?=
 =?utf-8?B?eWJCNlVaQS9QSGJqNVJ5aWlsQTB0NFlPdk5nN01ybm5JM0NBeGM5UWwwZGdD?=
 =?utf-8?B?MVFrREhxcDRLZVFvZ1JTOXV5dFJsTVBWbkVKNEI2WUFyd0g4TWk2RUh0UXNJ?=
 =?utf-8?Q?6FIoUy2zUTE8YqT/wHzAR49orystAC4gdIaep7caH8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec765ac6-5a67-4b1d-68ce-08d9f888d40d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:01:20.8400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVkle9C5KtdeLJ7nuZ/WUYd8TRV/ApRSYuw9NuRSZxFz3alndGb0Q1mA7+fYmTJ2PSfyhp4eyAGSxC+OE2TkXVjAYawnlgTWFS6Mu6ZgGBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5756
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

On 2/25/2022 09:39, Tvrtko Ursulin wrote:
> On 25/02/2022 17:11, John Harrison wrote:
>> On 2/25/2022 08:36, Tvrtko Ursulin wrote:
>>> On 24/02/2022 20:02, John Harrison wrote:
>>>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>>>> On 23/02/2022 02:22, John Harrison wrote:
>>>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> Compute workloads are inherently not pre-emptible on current 
>>>>>>>> hardware.
>>>>>>>> Thus the pre-emption timeout was disabled as a workaround to 
>>>>>>>> prevent
>>>>>>>> unwanted resets. Instead, the hang detection was left to the 
>>>>>>>> heartbeat
>>>>>>>> and its (longer) timeout. This is undesirable with GuC 
>>>>>>>> submission as
>>>>>>>> the heartbeat is a full GT reset rather than a per engine reset 
>>>>>>>> and so
>>>>>>>> is much more destructive. Instead, just bump the pre-emption 
>>>>>>>> timeout
>>>>>>>
>>>>>>> Can we have a feature request to allow asking GuC for an engine 
>>>>>>> reset?
>>>>>> For what purpose?
>>>>>
>>>>> To allow "stopped heartbeat" to reset the engine, however..
>>>>>
>>>>>> GuC manages the scheduling of contexts across engines. With 
>>>>>> virtual engines, the KMD has no knowledge of which engine a 
>>>>>> context might be executing on. Even without virtual engines, the 
>>>>>> KMD still has no knowledge of which context is currently 
>>>>>> executing on any given engine at any given time.
>>>>>>
>>>>>> There is a reason why hang detection should be left to the entity 
>>>>>> that is doing the scheduling. Any other entity is second guessing 
>>>>>> at best.
>>>>>>
>>>>>> The reason for keeping the heartbeat around even when GuC 
>>>>>> submission is enabled is for the case where the KMD/GuC have got 
>>>>>> out of sync with either other somehow or GuC itself has just 
>>>>>> crashed. I.e. when no submission at all is working and we need to 
>>>>>> reset the GuC itself and start over.
>>>>>
>>>>> .. I wasn't really up to speed to know/remember heartbeats are 
>>>>> nerfed already in GuC mode.
>>>> Not sure what you mean by that claim. Engine resets are handled by 
>>>> GuC because GuC handles the scheduling. You can't do the former if 
>>>> you aren't doing the latter. However, the heartbeat is still 
>>>> present and is still the watchdog by which engine resets are 
>>>> triggered. As per the rest of the submission process, the hang 
>>>> detection and recovery is split between i915 and GuC.
>>>
>>> I meant that "stopped heartbeat on engine XXX" can only do a full 
>>> GPU reset on GuC.
>> I mean that there is no 'stopped heartbeat on engine XXX' when i915 
>> is not handling the recovery part of the process.
>
> Hmmmm?
>
> static void
> reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
> {
>     if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>         show_heartbeat(rq, engine);
>
>     if (intel_engine_uses_guc(engine))
>         /*
>          * GuC itself is toast or GuC's hang detection
>          * is disabled. Either way, need to find the
>          * hang culprit manually.
>          */
>         intel_guc_find_hung_context(engine);
>
>     intel_gt_handle_error(engine->gt, engine->mask,
>                   I915_ERROR_CAPTURE,
>                   "stopped heartbeat on %s",
>                   engine->name);
> }
>
> How there is no "stopped hearbeat" in guc mode? From this code it 
> certainly looks there is.
Only when the GuC is toast and it is no longer an engine reset but a 
full GT reset that is required. So technically, it is not a 'stopped 
heartbeat on engine XXX' it is 'stopped heartbeat on GT#'.

>
> You say below heartbeats are going in GuC mode. Now I totally don't 
> understand how they are going but there is allegedly no "stopped 
> hearbeat".
Because if GuC is handling the detection and recovery then i915 will not 
reach that point. GuC will do the engine reset and start scheduling the 
next context before the heartbeat period expires. So the notification 
will be a G2H about a specific context being reset rather than the i915 
notification about a stopped heartbeat.

>
>>>
>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>                   I915_ERROR_CAPTURE,
>>>                   "stopped heartbeat on %s",
>>>                   engine->name);
>>>
>>> intel_gt_handle_error:
>>>
>>>     /*
>>>      * Try engine reset when available. We fall back to full reset if
>>>      * single reset fails.
>>>      */
>>>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>>>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>>>         local_bh_disable();
>>>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>>>
>>> You said "However, the heartbeat is still present and is still the 
>>> watchdog by which engine resets are triggered", now I don't know 
>>> what you meant by this. It actually triggers a single engine reset 
>>> in GuC mode? Where in code does that happen if this block above 
>>> shows it not taking the engine reset path?
>> i915 sends down the per engine pulse.
>> GuC schedules the pulse
>> GuC attempts to pre-empt the currently active context
>> GuC detects the pre-emption timeout
>> GuC resets the engine
>>
>> The fundamental process is exactly the same as in execlist mode. It's 
>> just that the above blocks of code (calls to intel_gt_handle_error 
>> and such) are now inside the GuC not i915.
>>
>> Without the heartbeat going ping, there would be no context switching 
>> and thus no pre-emption, no pre-emption timeout and so no hang and 
>> reset recovery. And GuC cannot sent pulses by itself - it has no 
>> ability to generate context workloads. So we need i915 to send the 
>> pings and to gradually raise their priority. But the back half of the 
>> heartbeat code is now inside the GuC. It will simply never reach the 
>> i915 side timeout if GuC is doing the recovery (unless the 
>> heartbeat's final period is too short). We should only reach the i915 
>> side timeout if GuC itself is toast. At which point we need the full 
>> GT reset to recover the GuC.
>
> If workload is not preempting and reset does not work, like engine is 
> truly stuck, does the current code hit "stopped heartbeat" or not in 
> GuC mode?
Hang on, where did 'reset does not work' come into this?

If GuC is alive and the hardware is not broken then no, it won't. That's 
the whole point. GuC does the detection and recovery. The KMD will never 
reach 'stopped heartbeat'.

If the hardware is broken and the reset does not work then GuC will send 
a 'failed reset' notification to the KMD. The KMD treats that as a major 
error and immediately does a full GT reset. So there is still no 
'stopped heartbeat'.

If GuC has died (or a KMD bug has caused sufficient confusion to make it 
think the GuC has died) then yes, you will reach that code. But in that 
case it is not an engine reset that is required, it is a full GT reset 
including a reset of the GuC.

>
> Regards,
>
> Tvrtko

