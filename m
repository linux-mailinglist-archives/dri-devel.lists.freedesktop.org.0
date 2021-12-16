Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06A47804F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 00:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8255310EDC6;
	Thu, 16 Dec 2021 23:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A788010EDC6;
 Thu, 16 Dec 2021 23:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639696283; x=1671232283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W2Ua7eZjBkRXje1YR1793neUmFHdyA4uYwaBptVDje4=;
 b=gnqrQovPL6U/CLQ1z5y5sRcw7wwROkLwAG0Ed2blxKlwGDoE7PH1ODR3
 sw9Khp6npvEf7vQEZlPXiQ9LvLCPnvm/3ernJhQU5fVaX6Zbevdek8Eiu
 n4eWQerH/n46nEj/1Cco6of+Wk2d2R7gprvRt3WC/sjaD4oP9UPKmiHZr
 SzmILqA4LfzzX9Uno2itnyFVTdSzEZB6ay7yIKhCBTo0coO5SZ5PzJxjl
 q22wwX9BmDxr0R3acyUkLcyPyQK+WH0kUkqCCsnYaoZeZxFdxwpSK9uqB
 /c1hhFYqU3rKgJvMgWXSxqnZnzQsApIy+DsQvcjbejrpxasoVsT/BhD8+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303002657"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="303002657"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="519485756"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 16 Dec 2021 15:11:22 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 15:11:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 15:11:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 15:11:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 15:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kihWQfTxZL2h4Pq4jlT4MVaJyaTUKJycHymgzghaoEAM6uiW3DpvX0Ti7/2TFfxwSVmJcPgwUiHnIW3Yr0tg7vPg5QvDnaMg9EEYNqUDXqJS5IC6dQXXRuf+IT8MV01/KsvLijF5VbvtU7hPzqHSM5RkxgOPlP831oWVHms8VJEykOzicnHhr8KCO7giFvi7ns4lFjKDR4v08MnSoqnzh1f7gqHCqYg3+XyoWaAQ1zwsHjh9eM4mV/X4ivsJFU5Yx3/x6x4mQBHeKf098LbKznZqATd3bgHcv5+DEmR/BuP77CAtAQBJc64xl3s91A+OAFkXu6EJ1RLIhawO4uecDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDsG8TDxn1PW/KsWPVWATW5GzYdeAlyDzaC8dlkRvF8=;
 b=K8iajDg6k5K+QPpJdBU0QZtD+5+3L77LfMXHRLc9t4w/oxsvo6RiXDCKJoSdOWql2z3q0HplAqIfbm0BOog+KWF6nS+puQv9PiAqv9YGjDV8xgAd8F/Hi6+SLR0co5nLeagnzUXEAdtQMA2huh1JWeipIuszO2dFB86eInb4CTHfCRiY8WRCDKZm2vZISUMMMO8xAG53Pgwd+N3mRJ9qvaZgEKLNCovXgfL4h/9JxlJNURJFhfHPZSmkn2qpU+yKT7ffHvZs8NJhqr/fOgo5ZdIMU5g94k7gYvLEWb8YRapHc9hCqBI5qmYlbk5cOvql8+FEuGJ+kr58sFUju2/FTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Thu, 16 Dec 2021 23:11:18 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4690.026; Thu, 16 Dec 2021
 23:11:18 +0000
Message-ID: <32843bfa-245f-ad0e-011a-d9f642ab6f81@intel.com>
Date: Thu, 16 Dec 2021 15:11:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v8 14/16] drm/i915/selftests: Use to_gt()
 helper for GGTT accesses
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-15-andi.shyti@linux.intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20211214193346.21231-15-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
Received: from [10.0.0.208] (67.181.129.204) by
 SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 23:11:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 054851f9-b226-4224-a737-08d9c0e95dd6
X-MS-TrafficTypeDiagnostic: DM8PR11MB5655:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB5655D969FA8DB11950EA78948C779@DM8PR11MB5655.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Asumv4iXL4hxlKuk8V2t3hsfNPtDc0rHZIEDiMEtf0I3Okj6mAeaAwO79Mm05TPiuDHpbDW6iNvPq/PD9fg3hXee1ON3avjfWFN3W0+YQYtu/GQgDReU20i5aY6w8zaU88xyoGu/MdtlsF33RaFxNSUSeyqW015A26DOy6a3lvVDfhSQ50csrUt8Pu0x9HFoZdohTAbDgKInslkPNS31ZfWEv4tMfOIBA08fLz3rTEij4IIWJ3wVMM4tesbG4rRqTB3G4Pdw6DB+IWrdEFXzCLho9qFvZY0gl0LqrVz+NcI7J07iSe+QRUFPeEhPfiL4tPiCJqTQ1q9N9HJ04Ry2CyEIkbne60UfxoRp/8hNJtmhDeiedmeBSiQsz5cUkcrfYeSKkOoitl3vugR5pFWv6U6G5/Tb2MtRF3Itmp7dTj0jIqmrtWwLFa0KseYnzb5Z4ErYMdVuVlbaZqmCKgVN6doSL0w+lRyIQAZQVTICcHWqmS/o73T6w2fU1pz05E35a+7kxSMs4inGitQ11xJFP2S1LXoOWvMHBVOYY9c67gwpLZdwZwU42MrEuNNNEvxZX70jndYP5i17V8k4TKifr9EmJVFA9YoRsaDKXtf8IeBEWks/EuZhI9GT+iWq2bBjIxcp2hRU0YwYZ68ui7viHqa8073iUNwONfowUmvupWOs+Yf5Oo0bFhyEfkFpDhRpC/JkjlhDhJcy40lYdExQshwdKaq6qFZ9CjDnX9rj9iVVKmZNWBlIlh5Ra05OCwOA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(31696002)(186003)(66946007)(2906002)(66556008)(83380400001)(4326008)(36756003)(6486002)(38100700002)(316002)(110136005)(956004)(26005)(5660300002)(54906003)(16576012)(66476007)(86362001)(8676002)(8936002)(31686004)(508600001)(2616005)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZCeGxkMGVaL2JRUlBVV2NlMU1XQzRYWk1UOUhKd0RKYnZCYnlaellpUmFk?=
 =?utf-8?B?c1MvSmNtbEhIRmQwVVdaNEtLS0hJR3YxQ0R6RS9ZbGFJeWMzcUdqNnQ1SnRI?=
 =?utf-8?B?amo5NVlETU1jOHcrNkowL1A2d2FNcjR5YjRWNkM1VEg1NEIrWlNPK3VHZkFt?=
 =?utf-8?B?bjNHL0Y4cnFLaUxGRGRDU1Jqalc3N3F4TGN6TkFvMW00SVVZMCsyWitsVXYx?=
 =?utf-8?B?VFhJbmZ4L1RRNEpvQTYxUGxkL0RycUJ1bURpeUZvbUZPVnZEMzJjUU9iNWtv?=
 =?utf-8?B?VDZUZkF4RkY2ZG15UG9vbU82SHNrZzVtS2dZSURBUkNlQmxnV0c5dWRUZ253?=
 =?utf-8?B?OG85NGxwc0FYMno4a3YxUmVWT3k2T05MeEZYNEh5eXF6R1grajBLTnBWdzhk?=
 =?utf-8?B?TCtrM1dVUzFJNGhMVEkwVE5GN0s3WDdIelVLcGNnT0lxSnNFL256RkxGdjVD?=
 =?utf-8?B?T0M2OWs5TmJHKzBRODdNVGJjb21RTDNHeUVmVlozejVJYTM0bjFWWnFNZG1M?=
 =?utf-8?B?MXhCcXFxdUJ0V3hDMVBZWWdpOGdncDlwQm5hZHhSckN2ZVJYS3F4eHliUStH?=
 =?utf-8?B?TXNaSTM4L2dqQjJoNjVidVMvRUoxRmpaMTVOT3hRU1BmZHNSNUFXVHZrUzMz?=
 =?utf-8?B?MHFuYlpXZ2JjeW9mZHhGYy9ZTUZVQVdJSFFwVzNjZFJYdXN0Wlg2OXdndEs4?=
 =?utf-8?B?SGJ4RWRGNWJnVzZDdVc3UFpFN21JRERtWnZnd210U05jMVN2b1lGZEl2R1lp?=
 =?utf-8?B?VnB6dWNNYllGZXQwTXFicER0YTBiVStTZlQyK0JUejF4S2NKdk5MbHNKVnBi?=
 =?utf-8?B?MTJQa2VMSnN1dDdRMWNBT2ppMldSYjVLUjl6ZjBuR21IYTZwYVpHL3RyRkcx?=
 =?utf-8?B?RHBnNytiNUNpYkpqbzNhRUtnY3R3Q3kzbHRvQTVXZXVGRlZVejh0emo5ZXVU?=
 =?utf-8?B?UmFhc2dtdUVmV2U0TVFaVThFM2REZnNjVFNmUkxSa1pab2dneE5Pc204bWlU?=
 =?utf-8?B?aWRQYXdzc0N4elJMV0VxYi9NUnVpOEwrbmxMMitvYnZHU1UxZHdOc21VbitZ?=
 =?utf-8?B?YUMzeE1lNlJhanZsQ3VBaXZOQVorMWI4cGhBeGplTTlyTU8zZ0hRSk82VEtG?=
 =?utf-8?B?N1pBRExHdVpZakE3UXhSMkROazVoZWRWb0NUdnFlR0hyZ2ZWUU9Pd0VxTkRI?=
 =?utf-8?B?QlhLQTZ2dkVjWWxreTltanJSbnpSczA3S0RTYnlMVWlET1NMdEczaHdGTlVV?=
 =?utf-8?B?OUREY0dzUTIxUXZRLzFTa3E3TGx3NWQwQTBWdXI3eXNHWjNZQXlJdCtYaG43?=
 =?utf-8?B?aWQwQ0RYN2tIRVg3dUc3TWZFVkNVeE9HUWxiU0hkLzhnMWpJV1R2Y2JkaExG?=
 =?utf-8?B?WHhLNEZONSs3QmMzM2dOQUNoU3VGU0xXTFppN3gyZ2ZhMVVwVnJHWkRDazk0?=
 =?utf-8?B?NVM5RDRGUHExMEpPYkp5UW85VWRTMkhtTlY3ZUFPQm84R3I5UVVYQjFMdkFW?=
 =?utf-8?B?R1Q1RUQvd21zS2FpL1ArT00wWmJSV21peExhK2ROZXd1akN6OXFBNFN4NmhL?=
 =?utf-8?B?MDQyUUo2UktnaEw3dnBYZG1MVTc0K2ZCVWtFZFhRNzZGbGZpM0FiNWtYN3lx?=
 =?utf-8?B?YmpmdzI3c1prTXFGbEJRU0w3ejNDSU16cndaTkFjR01pclZFM0I1amQ5WXJQ?=
 =?utf-8?B?SUpoaUVOc3lUdTBOajQvWHUzUS9KYnd4VWdVUklmdFJPUWg0TEN1bUcvTmw5?=
 =?utf-8?B?UDhqVytYSms0V2ZLNEE1b2EwQ3hNVk9ITnFtOVNCb0pTV2t4NzdUODJqdnJK?=
 =?utf-8?B?TXhtQXJ0ZlJWVUt3TVNxTkFpTVhDd3JqamJXb2JId2xyRlVLbU02WEpyMmtt?=
 =?utf-8?B?VzdiZ2ZhakFuOGFMaG9VVWpBWVZTQis5NmRFM2g5b2RueFZWQzhwa3FydFNO?=
 =?utf-8?B?SVNmOFExTFNBWUdaOWJFbzd5NUxFMGJRS1UyZGtaNTQrdjNuWUVSTTFjVXlW?=
 =?utf-8?B?NEJ6NE1QSjhoc3M1Snh2aVQ2clBTRlpuS3B1RWpMMUZJbk03aEVuUWFUbWtP?=
 =?utf-8?B?MXNtb041WDlhK2hYUFk2WkJFWGRUY1JTMDNOZkw0V3lhUk5WZUUrcDc0enE4?=
 =?utf-8?B?OE1IODJWTWNkOUx2YmtsUlh6dzNhSXQ4Ym1DWXdUbk9hVFNGd2JGamloZkRu?=
 =?utf-8?B?ZzBOQTFud1dEdTh2dmE0eFpiR3RScDB4ZlBrYmVhZjQvWkdoTmQrSlRCODVv?=
 =?utf-8?Q?xt4NmTvwLuYR85TgWDUXXBL9KDMWPkDa4sSuNZrZgw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 054851f9-b226-4224-a737-08d9c0e95dd6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 23:11:18.5570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqTnu40VwGZc1IuAZ335uN07bKtvb4r6MDJFxPjtgDZPDv+vbAmShPv2JdX581FNu9chAOMCFEGLkeARxjsZXiXBJS+XjIS24P6wfibhVlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5655
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2021 11:33 AM, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
>
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem.c        | 8 ++++----
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c    | 6 +++---
>   drivers/gpu/drm/i915/selftests/i915_request.c    | 2 +-
>   drivers/gpu/drm/i915/selftests/i915_vma.c        | 2 +-
>   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
>   5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index b5576888cd78..1628b81d0a35 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -41,7 +41,7 @@ static int switch_to_context(struct i915_gem_context *ctx)
>   
>   static void trash_stolen(struct drm_i915_private *i915)
>   {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	const u64 slot = ggtt->error_capture.start;
>   	const resource_size_t size = resource_size(&i915->dsm);
>   	unsigned long page;
> @@ -99,7 +99,7 @@ static void igt_pm_suspend(struct drm_i915_private *i915)
>   	intel_wakeref_t wakeref;
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> -		i915_ggtt_suspend(&i915->ggtt);
> +		i915_ggtt_suspend(to_gt(i915)->ggtt);
>   		i915_gem_suspend_late(i915);
>   	}
>   }
> @@ -109,7 +109,7 @@ static void igt_pm_hibernate(struct drm_i915_private *i915)
>   	intel_wakeref_t wakeref;
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> -		i915_ggtt_suspend(&i915->ggtt);
> +		i915_ggtt_suspend(to_gt(i915)->ggtt);
>   
>   		i915_gem_freeze(i915);
>   		i915_gem_freeze_late(i915);
> @@ -125,7 +125,7 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>   	 * that runtime-pm just works.
>   	 */
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> -		i915_ggtt_resume(&i915->ggtt);
> +		i915_ggtt_resume(to_gt(i915)->ggtt);
>   		i915_gem_resume(i915);
>   	}
>   }
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 48123c3e1ff0..9afe7cf9d068 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1122,7 +1122,7 @@ static int exercise_ggtt(struct drm_i915_private *i915,
>   				     u64 hole_start, u64 hole_end,
>   				     unsigned long end_time))
>   {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	u64 hole_start, hole_end, last = 0;
>   	struct drm_mm_node *node;
>   	IGT_TIMEOUT(end_time);
> @@ -1182,7 +1182,7 @@ static int igt_ggtt_page(void *arg)
>   	const unsigned int count = PAGE_SIZE/sizeof(u32);
>   	I915_RND_STATE(prng);
>   	struct drm_i915_private *i915 = arg;
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	struct drm_i915_gem_object *obj;
>   	intel_wakeref_t wakeref;
>   	struct drm_mm_node tmp;
> @@ -2110,7 +2110,7 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
>   		SUBTEST(igt_cs_tlb),
>   	};
>   
> -	GEM_BUG_ON(offset_in_page(i915->ggtt.vm.total));
> +	GEM_BUG_ON(offset_in_page(to_gt(i915)->ggtt->vm.total));
>   
>   	return i915_subtests(tests, i915);
>   }
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 92a859b34190..7f66f6d299b2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -843,7 +843,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
>   
>   	intel_gt_chipset_flush(to_gt(i915));
>   
> -	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
> +	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
>   	if (IS_ERR(vma)) {
>   		err = PTR_ERR(vma);
>   		goto err;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index 1f10fe36619b..6ac15d3bc5bc 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -967,7 +967,7 @@ static int igt_vma_remapped_gtt(void *arg)
>   	intel_wakeref_t wakeref;
>   	int err = 0;
>   
> -	if (!i915_ggtt_has_aperture(&i915->ggtt))
> +	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>   		return 0;
>   
>   	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 8aa7b1d33865..0b469ae0f474 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -69,7 +69,7 @@ static void mock_device_release(struct drm_device *dev)
>   	i915_gem_drain_workqueue(i915);
>   	i915_gem_drain_freed_objects(i915);
>   
> -	mock_fini_ggtt(&i915->ggtt);
> +	mock_fini_ggtt(to_gt(i915)->ggtt);
>   	destroy_workqueue(i915->wq);
>   
>   	intel_region_ttm_device_fini(i915);
Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
