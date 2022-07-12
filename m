Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8008571754
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 12:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6820E18A348;
	Tue, 12 Jul 2022 10:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC6F14AE45;
 Tue, 12 Jul 2022 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657621809; x=1689157809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ROeytxKRHG2k9gywO6y2tjBwn6FphgM/Elu6X7hYsU=;
 b=OwtG6H7BJeBsbpf8eCkl/MkKs86wrpMKvmd6V6zKmV2R3X3tFF6RiAAm
 8Xif8b8L/nICo0VdaQm3Zvufm0qFgIpbtICzHTDVqSdh1oOhtrC5uFzVj
 lBAVbRgnWBUBtAhWt36Iah6hc0kh6GFqReMKEZ3WGs7Itb8S/Q28pPBWa
 EFpcZp8AYf/zKwHjuK0pVvQIPHs/4c2JkYXM1Kt+VDQoL2q63H2nqQ7/5
 MWjRvEZFsDkTHd3neOVrXN+aU0gW7462aGf9VdzQkE7dKLkiKvDXtreIO
 n9sSZz8i1xgio9qBkHpouKTVKIfKl4f7ipCnlL5IIQCS/OJSXRrHlsSy/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="348872717"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="348872717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 03:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="627844113"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 12 Jul 2022 03:30:08 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 03:30:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 03:30:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 03:30:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 03:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQEdlObcM7cRK0ZrfWmb5zHfmVirFDhyOAVWlkGHeH+w/Llz7VMaeIb9sEM0b7pvs04VZuk/HpIZ24fMR+B+cGrtqv4+r7tvgbsyv0/fF5Vp42ws8Thk8RdoC23GKy5rzLI0xuL8DrNzy5nHVpbr2NIDoYT9N21R6PH0ZJ/gN6kpBtobo19+0nB9aRfcuOZ4s9I8TDz2pTb81Yi6UN2RhevcRpBPAX7lfHndkQCzaoaxfVye657D/tqiIdcRxR4TNN2njXuVPR9cL5J1j2CHEVEi6W19unNQIRtitFu8UYcgjs73WakK+mgouRGK57FDzxyDGRkR/z260Lh7NtBVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yLMsIOJcnT9/Ud4BFjVSrNmEIndOZDVMArEj8fu970=;
 b=oCWzqwPmjXA/3j3aW6yviAEdV5ZstpThCIC/MT1BbPHlG0yw+Suad7qKwDX2GEmU00WD3+hNXwrq5hhnYzSAjXZz7x8Yeuq06Vs63F+AJCctQvSTAsxHOPzkX4zNlMu2NDE2UhpLr635K4YZAzzeq5BOhDXdj62p6oie+EMKrczu4vulOca/1icrd5dIL5tM0ZEiNFZS/7Ji9O+1J+ihbNwGgIaqunxST7Q6bZNIhDy6k9FwqvZtWd177vBKaqHA92c8yjJjwRHNstTOO7vl1WI50E0o6YacwDL8JQHF5SQ1DBWGdHmZGnagAlDFi53VXq4dEkr6RqAFcB6OqK83dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by BN7PR11MB2530.namprd11.prod.outlook.com (2603:10b6:406:ac::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 10:29:59 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%8]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:29:59 +0000
Message-ID: <107f35de-1b72-b3ae-3939-b53df5cd95c6@intel.com>
Date: Tue, 12 Jul 2022 13:29:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/7] drm/i915/gem: Typecheck page lookups
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-3-gwan-gyeong.mun@intel.com>
 <20220705163508.4dc35087@maurocar-mobl2>
 <f2f2dd4e-c6b5-8d69-3ddc-e1e1bfdd02f3@intel.com>
 <20220706191016.5108f063@maurocar-mobl2>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220706191016.5108f063@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::18) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2426fe2d-d444-4e6b-0102-08da63f178c6
X-MS-TrafficTypeDiagnostic: BN7PR11MB2530:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qqhh7kXqUogtBOVl2A2RWPi3daVnhQi+QXKsC6nyRCy1pCUtJ+2CTayBWj8xJk+jzut0c6pnXnUA2g88PQdmzvWjmtXR57Xn5XAdb8+rl1WfNhjF4QIzUk3UiIeE+n4QPSNb1FIyxTCiTjIlGD+FAOjJLXO97vDH+/oSZVuXGiw5rEB2bKD8Df7q40wIYuFaxSjhsqIlQO8227fNXfZy8rCOd+XTK9EUvxVvpvykXHQ2lmjwZfkk+EYqYqCuWUpob8WKONehD84RMnmTUBlffe5yt+rXDm9UGGqPP9mbk5q5R3yXJXlN7kRcsTFA6VpFQkhKf4klRoTXJUJYaC1MPr7/D3A5pMwSak3Tdg/dSc9BWHRVtZl/Pk2R7QVz3bseTJrlymBp9v+Jme2elLABv5rdRa0tXlNgAJ0nzLoUdPA8Bu+iqfRZ08Biq28boAY3pis2i9ufGND7MZWHXSGo92ZXZyqaNrvM7IrJPegTdC505FnjpKfhWPVHxhh0cHhuaTONhfzucfJcC/6IXY61/2E/Zmysul/7xNi/0Sy8QDLwT5DrtmxqltXMQZZGBgUZt/xhz4F7J9JeXLI63tUzgPVWoCm2QtiamHTM0PdzsiaiEo2dzWifoea/6rGVUdhYMgxIAJP70fSIT6rOyKAnu0AeMhyMMgfLHPxzPcO2fsIJdWHkkcbdfqsSMbyLn8nIbsnUoYgYmHWc10zxkc6raAq1BFg/2ZgSymR0bXw5DYvyCV7087wPZg3KJPlj5LQUp7rieXowMEiAJT324cMzPty2QSY3NHYlrPtlQo2zlCubioQkms40pvYcp3/NxE0Wou+IdCPtE0r1HofQQdro7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(26005)(66476007)(2616005)(66946007)(6486002)(186003)(5660300002)(4326008)(86362001)(66556008)(6916009)(316002)(66574015)(6512007)(478600001)(6666004)(31696002)(36756003)(6506007)(41300700001)(30864003)(38100700002)(8936002)(2906002)(83380400001)(82960400001)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9sR0NEdE9jN1dydEFJdGx0MytQTGwzMG9CcEo3WGlYdnF0Q2NOc0tkMVM5?=
 =?utf-8?B?M2dGS1gzb01WT1NQTjVjYjRYU20wUDN1d3puV2haR00yWWJNalN5QS95cVZV?=
 =?utf-8?B?R1pZSXJMTWt6SjBSZ3NpUUd0WjNtM2t1RlM2eE94WVA0bWV5alpDTzdkYVM5?=
 =?utf-8?B?QktUREhHcXI1NTkvMlMyTERzOVBLZnB0c3R1Q1R2M25pZEdESGdNMFNBc0lo?=
 =?utf-8?B?dUlwclZ3bTdSUjNGSHJuaEpVN1BCNGRsb1RaWjdXbmJvMC9mUGdkcXdQR0NC?=
 =?utf-8?B?Z29ZdlF0aVBCV3NHK1FoSHpWM2hlcUZlYUU0V3BLTzZoNDJZeG5UNXFPMmZG?=
 =?utf-8?B?ditaeXl3bFNKeExRZEd1ekhuRnM3RWFQbDNYQWxLb0JpQjNpSHh5amwyRTQ4?=
 =?utf-8?B?cStkMkJ3OU5mTjhhK0t2TU1mZnVuMjVBaFJpQ2FIWFJRM0dSazV6d0hPWXNX?=
 =?utf-8?B?OUZCNWdOUk1PRmJXNHd2U0pIMzhPdDMrZWZYaXZzSy96MWxSd2pSbTFqRUh1?=
 =?utf-8?B?NkZ2enZrMC9vY0hDNTNYaTRQZDBBVGpaaHg3SkJXb1ExRm1SRzFmVlVuaUJF?=
 =?utf-8?B?UUNCK09wNmZoSlAxelFYUjRVTTYyZ3VFTkk5T3hlNVpycjJ1RUlKL0gxYzFt?=
 =?utf-8?B?YVdxMStvYzRtT0ZxV2daa2xrYnhxUHlJTmtuWDlYK1J3ZStOKy8rVDhLUnA3?=
 =?utf-8?B?QjNkZkZ6SDU5OUZNWnl2Yis2RUFZV0liTERiTlJ1czFZMHhldTloQWZXNnFm?=
 =?utf-8?B?YVFqZlRZSTVHbnArb0h0eXpDZ0w1V3IwVVk0QjlobWxYOUsycWwrTkRoZldL?=
 =?utf-8?B?QUhGZzFUTnVLbXlzNXI5SU5CMU1YTEpvR3ltcmdQNVBjSUJRd1gweHNnK2J0?=
 =?utf-8?B?R1hDZEtYdkwxbHJGOGlhVFZZNnRjSnJ3V0gwaUlqNTE2UnhrVDB5dWVDUjhE?=
 =?utf-8?B?Yzd6ZGhWTUF3MFlwcjZiWVM1MEUzYVZvOVdjNTZYcklhK2pHNXVSTG5sUEti?=
 =?utf-8?B?VTJxdDExTDZLcXo1R1N3OHNJZVg3WTU3OGxYaTRqdW9pMTJzNGZobkZrSXhI?=
 =?utf-8?B?NUtVdnlmWmlCRkIxTFBTU3hwYXFtbjBnTlpCT0k2U0JpM1NZWFNCQ0dEQ0I0?=
 =?utf-8?B?aThNbnRDSkdLbFkvNFdsVElhY0I1NHBpMTVEWnVXSjJQclA5ajRmMnhpRnB1?=
 =?utf-8?B?N0hXWTdjSU45d1p4Z0p2ZDlVOU4xTVBKSHA3L01mbVFyWDdQOGZEVE5uRXVK?=
 =?utf-8?B?TXpZTU0yK1NXcHZJZmQ4VGxSSDVWKzVsTWk5MitHSWJ5c2NpaHczb2NRV2ln?=
 =?utf-8?B?bTZ5dGw3UmlGb0psRU5kTHFDS0l0UzFDYmtQQ0t5c1BOUDlTdFBHV1JQUXpE?=
 =?utf-8?B?blNJa1FKMVJFYnB0Y0hyOW8yeDk1UGpMdkxMcFpvendRcXdNMGpoc1ZBNVNR?=
 =?utf-8?B?L1ZFaXlreVpnSWRCdldTdXVXc3hvVU1rOXpjWStQaDRNRFp3anR0RDR2NmRT?=
 =?utf-8?B?V3NhUlRiUEE2SWRCeVBhaDM5NndCR2ZZNmZ0Yk5wNjR5MmNMT0FEcS9vdStS?=
 =?utf-8?B?YWxWRWQxUGlOeWhRenMxSXRzSE4rT2ZGdnJUTlk4bk42QzE0WXI2bkRpMGJa?=
 =?utf-8?B?dUlQNXcwakIwVjNwS25LMkRJTktLNUJUcGVlVkFkVUk3STd5SXZwM2x1MU02?=
 =?utf-8?B?eTM3enhYdE43SWxnbTZqZC9jR0xFZSttd3F4cElLZ09hVkx3cE51S1lEK2VK?=
 =?utf-8?B?NldFWlhzYjU5QXVwQkE1MXFPc0lhNzVad0J3WkptUG1OS21RcEJyNzlTM1Q3?=
 =?utf-8?B?NjdST0x6UjVEdTg5akFrbzh1MEw4VkdhSCthMHN5REQvaHJUbmExU3FMM0Z1?=
 =?utf-8?B?UUx4UFBBU0pzQkZOZ3hwUWx5UDVQTlNsNjJoSCthQUNHSXVOYUcyQmNrdkFX?=
 =?utf-8?B?L0FzZFlDdXhVZDBnUXBrM3QvSlhVN3BQQ2RIb3NjN0hjSXQ3bmtUUTVXekNX?=
 =?utf-8?B?Q0h5eDd6T0s5eWZBZkd2dURBUzU4NlphUU90OXZtQm9CZkFCd2g5eXR3bWtF?=
 =?utf-8?B?VkVpUzJxWFNXTkZBdmZMTXBnbEkxalpLOTdLWVNnYVZvMlZqaEE0OEFzU1Nv?=
 =?utf-8?B?ZlVUZ1luUjhkQ2xCd0pidzZDSzdTcHFiSFNhLzJrRjMyRi85K3lhNlE4c2Vq?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2426fe2d-d444-4e6b-0102-08da63f178c6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:29:59.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oS+sZw89IgEN+I3EcOySlLDwFCLCOK0tPnqvrBZDEb+LkeKSeagU+L7fqzHwEioCpM6c+n8e09QGe7g0WPV+TV2pBjxrEAYZAffFt3Cdgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2530
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/6/22 8:10 PM, Mauro Carvalho Chehab wrote:
> On Wed, 6 Jul 2022 19:33:22 +0300
> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> 
>> On 7/5/22 5:35 PM, Mauro Carvalho Chehab wrote:
>>> On Tue,  5 Jul 2022 15:24:50 +0300
>>> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
>>>    
>>>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>>>
>>>> We need to check that we avoid integer overflows when looking up a page,
>>>> and so fix all the instances where we have mistakenly used a plain
>>>> integer instead of a more suitable long. Be pedantic and add integer
>>>> typechecking to the lookup so that we can be sure that we are safe.
>>>> And it also uses pgoff_t as our page lookups must remain compatible with
>>>> the page cache, pgoff_t is currently exactly unsigned long.
>>>>
>>>> v2: Move added i915_utils's macro into drm_util header (Jani N)
>>>>
>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    |  7 +-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    | 67 ++++++++++++++-----
>>>>    drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 ++++---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>>>>    .../drm/i915/gem/selftests/i915_gem_context.c | 12 ++--
>>>>    .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 +--
>>>>    .../drm/i915/gem/selftests/i915_gem_object.c  |  8 +--
>>>>    drivers/gpu/drm/i915/i915_gem.c               | 18 +++--
>>>>    drivers/gpu/drm/i915/i915_vma.c               |  8 +--
>>>>    9 files changed, 100 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index ccec4055fde3..90996fe8ad45 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -421,10 +421,11 @@ void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
>>>>    static void
>>>>    i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>>>    {
>>>> +	pgoff_t idx = offset >> PAGE_SHIFT;
>>>>    	void *src_map;
>>>>    	void *src_ptr;
>>>>    
>>>> -	src_map = kmap_atomic(i915_gem_object_get_page(obj, offset >> PAGE_SHIFT));
>>>> +	src_map = kmap_atomic(i915_gem_object_get_page(obj, idx));
>>>>    
>>>>    	src_ptr = src_map + offset_in_page(offset);
>>>>    	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
>>>> @@ -437,9 +438,10 @@ i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset,
>>>>    static void
>>>>    i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>>>    {
>>>> +	pgoff_t idx = offset >> PAGE_SHIFT;
>>>> +	dma_addr_t dma = i915_gem_object_get_dma_address(obj, idx);
>>>>    	void __iomem *src_map;
>>>>    	void __iomem *src_ptr;
>>>> -	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
>>>>    
>>>>    	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
>>>>    				    dma - obj->mm.region->region.start,
>>>> @@ -468,6 +470,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
>>>>     */
>>>>    int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>>>>    {
>>>> +	GEM_BUG_ON(overflows_type(offset >> PAGE_SHIFT, pgoff_t));
>>>>    	GEM_BUG_ON(offset >= obj->base.size);
>>>>    	GEM_BUG_ON(offset_in_page(offset) > PAGE_SIZE - size);
>>>>    	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index 6f0a3ce35567..a60c6f4517d5 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -27,8 +27,10 @@ enum intel_region_id;
>>>>     * spot such a local variable, please consider fixing!
>>>>     *
>>>>     * Aside from our own locals (for which we have no excuse!):
>>>> - * - sg_table embeds unsigned int for num_pages
>>>> - * - get_user_pages*() mixed ints with longs
>>>> + * - sg_table embeds unsigned int for nents
>>>> + *
>>>> + * We can check for invalidly typed locals with typecheck(), see for example
>>>> + * i915_gem_object_get_sg().
>>>>     */
>>>>    #define GEM_CHECK_SIZE_OVERFLOW(sz) \
>>>>    	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
>>>> @@ -366,41 +368,70 @@ int i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
>>>>    struct scatterlist *
>>>>    __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>>>    			 struct i915_gem_object_page_iter *iter,
>>>> -			 unsigned int n,
>>>> -			 unsigned int *offset, bool dma);
>>>> +			 pgoff_t  n,
>>>> +			 unsigned int *offset);
>>>> +
>>>> +#define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(__i915_gem_object_get_sg)(obj, it, n, offset); \
>>>> +})
>>>>    
>>>>    static inline struct scatterlist *
>>>> -i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>>> -		       unsigned int n,
>>>> +i915_gem_object_get_sg(struct drm_i915_gem_object *obj, pgoff_t n,
>>>>    		       unsigned int *offset)
>>>>    {
>>>> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, false);
>>>> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset);
>>>>    }
>>>>    
>>>> +#define i915_gem_object_get_sg(obj, n, offset) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_sg)(obj, n, offset); \
>>>> +})
>>>> +
>>>>    static inline struct scatterlist *
>>>> -i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
>>>> -			   unsigned int n,
>>>> +i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj, pgoff_t n,
>>>>    			   unsigned int *offset)
>>>>    {
>>>> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, true);
>>>> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset);
>>>>    }
>>>>    
>>>> +#define i915_gem_object_get_sg_dma(obj, n, offset) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_sg_dma)(obj, n, offset); \
>>>> +})
>>>> +
>>>>    struct page *
>>>> -i915_gem_object_get_page(struct drm_i915_gem_object *obj,
>>>> -			 unsigned int n);
>>>> +i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n);
>>>> +
>>>> +#define i915_gem_object_get_page(obj, n) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_page)(obj, n); \
>>>> +})
>>>>    
>>>>    struct page *
>>>> -i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj,
>>>> -			       unsigned int n);
>>>> +i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj, pgoff_t n);
>>>> +
>>>> +#define i915_gem_object_get_dirty_page(obj, n) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_dirty_page)(obj, n); \
>>>> +})
>>>>    
>>>>    dma_addr_t
>>>> -i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
>>>> -				    unsigned long n,
>>>> +i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj, pgoff_t n,
>>>>    				    unsigned int *len);
>>>>    
>>>> +#define i915_gem_object_get_dma_address_len(obj, n, len) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_dma_address_len)(obj, n, len); \
>>>> +})
>>>> +
>>>>    dma_addr_t
>>>> -i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj,
>>>> -				unsigned long n);
>>>> +i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj, pgoff_t n);
>>>> +
>>>> +#define i915_gem_object_get_dma_address(obj, n) ({ \
>>>> +	exactly_pgoff_t(n); \
>>>> +	(i915_gem_object_get_dma_address)(obj, n); \
>>>> +})
>>>>    
>>>>    void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
>>>>    				 struct sg_table *pages,
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>> index 97c820eee115..1d1edcb3514b 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>> @@ -503,14 +503,16 @@ void __i915_gem_object_release_map(struct drm_i915_gem_object *obj)
>>>>    }
>>>>    
>>>>    struct scatterlist *
>>>> -__i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>>> +(__i915_gem_object_get_sg)(struct drm_i915_gem_object *obj,
>>>>    			 struct i915_gem_object_page_iter *iter,
>>>> -			 unsigned int n,
>>>> -			 unsigned int *offset,
>>>> -			 bool dma)
>>>> +			 pgoff_t n,
>>>> +			 unsigned int *offset)
>>>> +
>>>
>>> Nitpick: no need to place the function name in parenthesis.
>>>    
>>>>    {
>>>> -	struct scatterlist *sg;
>>>> +	const bool dma = iter == &obj->mm.get_dma_page ||
>>>> +			 iter == &obj->ttm.get_io_page;
>>>>    	unsigned int idx, count;
>>>> +	struct scatterlist *sg;
>>>>    
>>>>    	might_sleep();
>>>>    	GEM_BUG_ON(n >= obj->base.size >> PAGE_SHIFT);
>>>> @@ -618,7 +620,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>>>    }
>>>>    
>>>>    struct page *
>>>> -i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
>>>> +(i915_gem_object_get_page)(struct drm_i915_gem_object *obj, pgoff_t n)
>>>
>>> Same as above: why are you placing parenthesis at the function name here?
>>> Just use:
>>> 	
>>> 	struct page *
>>> 	i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>>>   
>> In this case, the macro and function have the same name. If parenthesis
>> is not used, the following compile error occurs as the macro is applied
>> to the c code.
>>
>> ./drivers/gpu/drm/i915/gem/i915_gem_object.h:356:55: error: expected
>> identifier or ‘(’ before ‘{’ token
>>     356 | #define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
>>         |                                                       ^
>> drivers/gpu/drm/i915/gem/i915_gem_pages.c:506:1: note: in expansion of
>> macro ‘__i915_gem_object_get_sg’
>>     506 | __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>         | ^~~~~~~~~~~~~~~~~~~~~~~~
>>
>> And all of the parts you leave comments below are cases where the names
>> of macros and functions are the same.
> 
> Don't use the same macro name on a function. This is very confusing
> and will prevent ever adding documentation for it, as, for kernel-doc,
> macros and functions are handled at the same namespace. So, no
> duplication is allowed.
> 
> Probably the best here would be to replace the macros by inlined
> functions.
> 
When using an inline function, the function can check the types after 
typecasting its arguments.
It is more efficient to use the above macro style to check input 
argument's type in the compilation stage.
This way is also used in the macro below among the existing i915 codes.

#define sg_alloc_table(sgt, nents, gfp) \
	overflows_type(nents, __sg_size_t) ? -E2BIG : (sg_alloc_table)(sgt, 
(__sg_size_t)(nents), gfp)

#define sg_alloc_table_from_pages_segment(sgt, pages, npages, offset, 
size, max_segment, gfp) \
	overflows_type(npages, __sg_size_t) ? -E2BIG : 
(sg_alloc_table_from_pages_segment)(sgt, pages, (__sg_size_t)(npages), 
offset, size, max_segment, gfp)


This method has the advantage of being able to check the type of a 
variable passed as a function argument before it is typecast.

However, the kernel-doc's issues is something I didn't think consider 
before. To fix the naming problem in the documentation, I will change 
the macro name and the function name differently and send it as a new 
version.

Br,
G.G.
> Regards,
> Mauro
> 
