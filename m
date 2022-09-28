Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5815ED40E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 06:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038BF10E054;
	Wed, 28 Sep 2022 04:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCB110E054;
 Wed, 28 Sep 2022 04:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664341159; x=1695877159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1DEzWJYu401TgNJAP7zIWwMVpKA7A4WEtfTc9Zrnwfg=;
 b=EtHG8NBDHEQFFg6F/7bHzWTjYHGVW7gR9hHww5XQ8r58v4OnAweu1SLd
 f2NFjhKZXRSA0dYFK2GL+F8N1QkrsGNFwMqdllkozZQjjjbJF5Zq75ztZ
 giPzhOwkbuvWPTywkkz4pRhKR6w+daDjsJh8J1xifmSE+Z9ua2G6Q5q36
 pju5Non+h6/ur97GCcBjL5jVTXAjLScEzTvDhF3et/Q2mD66r0Y9i7UlM
 EcjmByFOFuNhFs1cuzdnr/wjpKkBAr7dyd+HGrn0QgnYG8lUfi1gmNPhk
 XtHcTyjbEiQNoyB2t4VYs6pviu3A1g3Yg7oBFKYa8QYfIP9e3qqTq7y0L g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="299102584"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="299102584"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 21:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="690252963"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="690252963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2022 21:59:18 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 21:59:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 21:59:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 21:59:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 21:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9efcRKg0Tazc5osaqo1zgvT3SFDOKjy02fpyADUMNIZQqv3lyTKFRb++88Ob7fDVs1aFo1her6zuI7A3imp+RQIXreR5bgp4lQs/0B3ejJgUiSMEsx+wrU6ZgOeK+RIluJOiP5mte6TotjuE4Xy5PjWzQXDfJdLqlsEjXtj/VDAweehxoryueLHr72blcGw7lAv7MR7eNnfLhYTnvMD5QaLe0Db2Khv9SsiZucjy2jAVsPZpm5BT9aTyb5JDPzKtRbz/9jTbJnxvYe93SmvkFWG3mpNcEgJQUyxhy6lL1ItDHpjkW3au5x5YpKMu66hpj/gMaj8eDkSJb8ddqEibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJgGxW55yiwwZTOQ/kTLqXoKWw1GDEba9PcE5SzX/Kg=;
 b=LcwY2KBEZxtk+bfTT0K5iWrOpK28Tgi7VwShFNCZFeeIaAk/o6e6nWJn5ihdoVVE2YPsUmtwIrBPHUaUiVRszH3Toa5BGzpFzA8U+xco/J5+Z7/dxCLiPU4sniydTTMaFxm69HN5YToUNcgJO2cIJOsy0gmF3nzbRgOBhiMKUM2YsBCMjYeLtGnemX5I7557PZKfjJAq8DdmFI+S5mbrfNWRZYByCN3otyr3Sy6PKZtkK8tTdUO6DsmDW9GOJ30xqb2eEzJVfvC/OYwfGgP2gCOQaTl5kI79awwTOT23pK6YtVVHoK7WOPgHs6rvZZWHu00BLcpHAoDfQK2YBvRZ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 04:59:16 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 04:59:16 +0000
Message-ID: <60353a81-b44b-40f6-7b5c-6ed8cce29d66@intel.com>
Date: Wed, 28 Sep 2022 10:29:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH v3] drm/i915/mtl: enable local stolen memory
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220926184424.23772-1-aravind.iddamsetty@intel.com>
 <YzN3injZnHyO8NMV@mdroper-desk1.amr.corp.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <YzN3injZnHyO8NMV@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 580220a7-3aca-4902-6b9a-08daa10e3158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTySjb9t9w9fipX0Sv6iIZX1Q0XenpWGg3AozPccZzHlglN9/7jJDAH+WGSD3Ou4ObVZDsEEoMpKCPyyw4PW54AX1bTJvRYx3hyBLtPg2esSDx9Q2+Bqu7HGKpKePlzAMjezt0kXVnqAirbOVqqAMuV3jCLgJR0B0pwc9OxQ6vNOSba31CY0FraewVuXlTAUJwyvksJCFGrYFqODeUoRxzAt47z/hNlgx6rZI8JuPHYEiO9x9Bc74fgQfaacQXnk/NicojjY7Bqln8cYRWXNQM7JMtHXCOxONtxoVKW4lJB3eR+6xsd91KrUz5kQiNfptI3uugcc/X6OT5ScS8VvhIPp0EuCnF0FEWovp8Vpl53NEX+7P4hA2h8T1Wpso0Lh9M9eH73EEOQS7CpV1wA2ardWcq3vjJbiNHT95MZmBUCVRYqQn+RkSEWVBVUTKHeC8H3JbcgVHaED7Yd37cWoC/F2WKt/M8M8sRhPbhoDUhyURWO0op3+mhzmQ0BwuBBjGOZxIOc+f3OplxDW2e+6j4RKvz3AWj22iQjm/JYnqsZxA7ggRXYLI78sEdqrc539/F9UJaTZwDAXLfG/nLm3L6lvn3QaQknLCwjsD1P9dghqSrb5fj4e2WTu8Rkwtq8pO8w22IfvBLvsSLesWaLGBCp+1TfC156AGo72mSdvMpFuCJ0KpzmDs3y5w+7HT++UjR7ul5z66klzimEkuTWhBBQNXoz1S1Q4MspFLMa7fAYzLvb76hnJcZGloNnQ9snv9yMr+X79dtUjap7ZXMzWVI5J8HsjK3WfXvpOlZ2EQ/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(36756003)(316002)(6862004)(53546011)(82960400001)(6506007)(26005)(186003)(37006003)(6512007)(6636002)(2616005)(31696002)(86362001)(8936002)(66476007)(2906002)(41300700001)(83380400001)(8676002)(38100700002)(4326008)(66946007)(31686004)(66556008)(6486002)(478600001)(6666004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZLNTBHd3IvYmlYZmxCRFNpUFl1bEJ6WVN5c2lUYmlNSGt1NzN6a0pQWTBl?=
 =?utf-8?B?REtVMVBzSlBQYTYzTEpuRmRhTTdNNjBaNkF1WHYwNUdycjV4QWJram1CQmFw?=
 =?utf-8?B?ZzBoeTdKR3c0ODRYNWh5NzhkVFV2dTEyNnVtckhqcU9Sc2VCWUR6dlRZT3BD?=
 =?utf-8?B?NlBBWGhMQjJSUjArU1F3N0MwaHJoOW5Lb2wxTWtlSm9DODVqZDdLbUtHV29v?=
 =?utf-8?B?ekluTUpQY3VoMmRBSitOOEVtQXJGOE1Yei8wTXBFZ1dpenIvNkNCbk9zZnZ2?=
 =?utf-8?B?TCtWUTBNa2U3dWNNMFlGN082R0hUdWFvSEw1TXVHcU9HQmt4V24yOXYvaFlC?=
 =?utf-8?B?aWxyeDVDL1pXckpNY1Q4MnZsWWNpaE1hWnphamxmeEVqckd1eC9BcHJJSnkx?=
 =?utf-8?B?YXAvcTNpS0Yyby9LczJvTFlRcEpPTTJwb0twUmd1RnoxOFRmRFZnbmVHZWd0?=
 =?utf-8?B?Ykxkd1h3cDdTL3ZJVUFMWjROdklpME9SR09Zc1YrQXphTVZpRitmdlB6cEoz?=
 =?utf-8?B?aXc0WTNxZXpOZzdhbUZxNzJISVRHa2JRS2h4ZG00SVNIQ0kvYXFOd1dNOUNp?=
 =?utf-8?B?MWQ0UFVhdDEyaWdTQmVDSGFXOG92WGJLd1dmZXZndjVZN0xVbFcyUm56MFBW?=
 =?utf-8?B?NEFtYXZiVVd6eVZ4M1VGekhBMEw4QnN0SXYyMTlWbktzd1UwZ1g2UFZQTXlK?=
 =?utf-8?B?U0RRQWF5N0kzQkhKQldFcjR1VGFSRGlwdnpqRiszUVVRSEpvMlFBNXZxeFVY?=
 =?utf-8?B?MkJaZXBQWUZSUGRVeUFZUmhpeGV4cTlBWno0bks5YXpORmdSSEc0ZG9EQU1D?=
 =?utf-8?B?UEZsRVZBTzB0N1RsWGphallFTnNWa2RwQ2ZVcEdVVGNhWFVxWUF4WDJtdGk4?=
 =?utf-8?B?NDhEbnp3UHlIQmpTdVpzL0dLVDIzRVB4TWRnQmd6N3hEOUtUcitzNzRUYTg1?=
 =?utf-8?B?Mlp2MTg2WnZKYVBuYkZHZ1VVbi81UmRYelpKeDZNOGFNOUZXaFBONVdiVFIy?=
 =?utf-8?B?UUFwWjh0UXhTZE5JV2x4U3ZDanVHNjNrT01GYWlpUGh3blRGSGs3Si93ZkdC?=
 =?utf-8?B?YS9FdXJrNTVGcnZCNkxoaGhDSU4zaDhTQXl6aHlyczRTWVpXVUE0VXk1OHdu?=
 =?utf-8?B?NEg3YktXR3owbktuNThuTzVJK1lEMUNWY1orakFhclkyeFZaVVhrZ1YybmlH?=
 =?utf-8?B?K3J5WUVJUGlLY2VURWNXa1JLdmVuZXFUUk5uVzJkbDJkci8zR1I5L0hUQm1q?=
 =?utf-8?B?ek1QRFUyY1ljc2NMbkF5UEhEWEJNeGdLeTZkM1ZGbDlRNU1UWlBHQXRzTWNk?=
 =?utf-8?B?d0t6cEhjbUV3cTVRdmU3bW9pUGFDVW1BL0djWENWaVdKMkhQR1N4K0l3MHBU?=
 =?utf-8?B?b0FpZGF6UmVkZ0NtNjlmOVF6bjljc3FYaEVEblFXNzFxUlVTSzVObTJ4Rzdj?=
 =?utf-8?B?U1U1QytUcW43WFBOa1ZzbXQwcGlMQ2p3cXJFVzBkbzA3Tks2R2pLdWVsT3NL?=
 =?utf-8?B?aVFnWkVKS0VFbVhwWExPSFhmR2NpZnpTbkkyYkFLa1RMZFJqMVJGOEtIbFJN?=
 =?utf-8?B?N2VZNUcwR0g4VndseWFDWTJpRTN0bDZ4bThaMjhFcWlqWUE2WnQ1NmRWaDht?=
 =?utf-8?B?QTdKM3hCY2kvbURCYUNSMnJYakJ0ZXhEM0NSbnV5WnBzbTlOSS9Cc25JMGs1?=
 =?utf-8?B?ZmxRNXdzUXp1YVdSQUtvVUJRUit2YU9OVTBDbmVzb3hRTUc4TGtWVDdkUVI1?=
 =?utf-8?B?c3Nha0IwRklONXhFalk1b3pndFhDeTFML1JVMUtRT3VwckFKVnBKdU5CL0Rj?=
 =?utf-8?B?bU1XMG4valdHUEVOUzhJTnpVclFEQmFibS9hdDcxY3NGaHFQbWRIYUN1VXla?=
 =?utf-8?B?S2VGSGZBaUEyMnZCTmZ6OTJudkN6QmQrdkJSdzdvbG1GK0JzWWlXNWlQaWVS?=
 =?utf-8?B?QS84QmFQM2piSUV4NzlGeHl4N1MrcGZOcWkyRFFwdWZlTzhRdWxrbFdRYXFs?=
 =?utf-8?B?c2diaUpZSTRadEpDS3RZV1p3Uk1iRXhvNUtOSWY0cUZpMnpVd1MyZjU1cktV?=
 =?utf-8?B?VldVaUxUMzNVaGxBL0VId3E0cWNPSm0vR0s5N05QUWV4V2ZNN0ZGdUJldzgw?=
 =?utf-8?B?SklYdGVJMXNsaXRLcWZXcUEwNHR3OUdOaUt2dVI4cnFGaWlYYWRkOG5MZ2hz?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 580220a7-3aca-4902-6b9a-08daa10e3158
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 04:59:15.9901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drmwAIZx7XU8AGrLkVLfCqjedPTnN+LyV295UWaxyZi09a/3pzcl37SPmRpNycePDEZvRfFalaNaujhPBNcBkB7K52Q6cdpsYbBQL+Z7OBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
Cc: intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28-09-2022 03:52, Matt Roper wrote:
> On Tue, Sep 27, 2022 at 12:14:24AM +0530, Aravind Iddamsetty wrote:
>> As an integrated GPU, MTL does not have local memory and
>> HAS_LMEM() returns false.  However the platform's stolen memory
>> is presented via BAR2 (i.e., the BAR we traditionally consider
>> to be the LMEM BAR) and should be managed by the driver the same
>> way that local memory is on dgpu platforms (which includes
>> setting the "lmem" bit on page table entries).  We use the term
>> "local stolen memory" to refer to this model.
>>
>> v2:
>> 1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas
>> (Jani, Lucas)
>> 2. drop lmembar_is_igpu_stolen
>> 3. revert to referring GFXMEM_BAR as GEN12_LMEM_BAR (Lucas)
>>
>> v3:(Jani)
>> 1. rename get_mtl_gms_size to mtl_get_gms_size
>> 2. define register for MMIO address
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>
> 
> Since this stuff is somewhat hard to find documentation on, you might
> want to include a bspec page number or two here.
> 
> Bspec: 63830
> 
> seems like a useful one for reference at least.
sure will add these references.
> 
>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Original-author: CQ Tang
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 88 ++++++++++++++++++----
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
>>  drivers/gpu/drm/i915/i915_drv.h            |  3 +
>>  drivers/gpu/drm/i915/i915_reg.h            |  5 ++
>>  4 files changed, 81 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index c5a4035c99cd..0eb66c55bbf3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>>  	mutex_unlock(&i915->mm.stolen_lock);
>>  }
>>  
>> -static bool valid_stolen_size(struct resource *dsm)
>> +static bool valid_stolen_size(struct drm_i915_private *i915, struct resource *dsm)
>>  {
>> -	return dsm->start != 0 && dsm->end > dsm->start;
>> +	return (dsm->start != 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm->end > dsm->start;
>>  }
>>  
>>  static int adjust_stolen(struct drm_i915_private *i915,
>> @@ -88,7 +88,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>  
>> -	if (!valid_stolen_size(dsm))
>> +	if (!valid_stolen_size(i915, dsm))
>>  		return -EINVAL;
>>  
>>  	/*
>> @@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>>  		}
>>  	}
>>  
>> -	if (!valid_stolen_size(dsm))
>> +	if (!valid_stolen_size(i915, dsm))
>>  		return -EINVAL;
>>  
>>  	return 0;
>> @@ -148,9 +148,10 @@ static int request_smem_stolen(struct drm_i915_private *i915,
>>  
>>  	/*
>>  	 * With stolen lmem, we don't need to request system memory for the
>> -	 * address range since it's local to the gpu.
>> +	 * address range since it's local to the gpu and in some IGFX devices
>> +	 * BAR2 is exposed as stolen
> 
> Minor nitpick:  this sentence is a bit hard to read/understand.  I'd
> leave the original sentence as is and add a separate sentence explaining
> the situation for igpu platforms with stolen memory exposed through
> BAR2.
ok.
> 
>>  	 */
>> -	if (HAS_LMEM(i915))
>> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>>  		return 0;
>>  
>>  	/*
>> @@ -385,8 +386,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>  
>>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>>  
>> -	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>> -
>>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>>  	case GEN8_STOLEN_RESERVED_1M:
>>  		*size = 1024 * 1024;
>> @@ -404,6 +403,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>  		*size = 8 * 1024 * 1024;
>>  		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>>  	}
>> +
>> +	if (HAS_BAR2_SMEM_STOLEN(i915))
>> +		/* the base is initialized to stolen top so subtract size to get base */
>> +		*base -= *size;
>> +	else
>> +		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>  }
>>  
>>  /*
>> @@ -833,6 +838,34 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>>  	.init_object = _i915_gem_object_stolen_init,
>>  };
>>  
>> +static int mtl_get_gms_size(struct intel_uncore *uncore)
>> +{
>> +	u16 ggc, gms;
>> +
>> +	ggc = intel_uncore_read16(uncore, GGC);
>> +
>> +	/* check GGMS, should be fixed 0x3 (8MB) */
>> +	if ((ggc & GGMS_MASK) != GGMS_MASK)
>> +		return -EIO;
>> +
>> +	/* return valid GMS value, -EIO if invalid */
>> +	gms = (ggc & GMS_MASK) >> GMS_SHIFT;
> 
> It's better to write this as
> 
>         gms = REG_FIELD_GET(GMS_MASK, ggc);
> 
> You can also eliminate the definition of GMS_SHIFT with that.
> 
>> +	switch (gms) {
>> +	case 0x0 ... 0x10:
> 
> Shouldn't this just be 0x0 ... 0x4?

agree thanks for catching this.
> 
>> +		return gms * 32;
>> +	case 0x20:
>> +		return 1024;
>> +	case 0x30:
>> +		return 1536;
>> +	case 0x40:
>> +		return 2048;
> 
> I don't see 0x20, 0x30, or 0x40 listed as valid values in the bspec
> anymore.yes this is missing too.
> 
> 
>> +	case 0xf0 ... 0xfe:
>> +		return (gms - 0xf0 + 1) * 4;
>> +	default:
> 
> You might want to add a MISSING_CASE(gms) since this isn't supposed to
> be able to happen, but if it does, we'd like to see which invalid value
> we actually received.
ok.
> 
>> +		return -EIO;
>> +	}
>> +}
>> +
>>  struct intel_memory_region *
>>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  			   u16 instance)
>> @@ -843,6 +876,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  	struct intel_memory_region *mem;
>>  	resource_size_t io_start, io_size;
>>  	resource_size_t min_page_size;
>> +	int ret;
>>  
>>  	if (WARN_ON_ONCE(instance))
>>  		return ERR_PTR(-ENODEV);
>> @@ -850,12 +884,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>>  		return ERR_PTR(-ENXIO);
>>  
>> -	/* Use DSM base address instead for stolen memory */
>> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
>> -	if (IS_DG1(uncore->i915)) {
>> +	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
>>  		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>> -		if (WARN_ON(lmem_size < dsm_base))
>> -			return ERR_PTR(-ENODEV);
>>  	} else {
>>  		resource_size_t lmem_range;
>>  
>> @@ -864,13 +894,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  		lmem_size *= SZ_1G;
>>  	}
>>  
>> -	dsm_size = lmem_size - dsm_base;
>> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
>> +		/*
>> +		 * MTL dsm size is in GGC register, not the bar size.
>> +		 * also MTL uses offset to DSMBASE in ptes, so i915
>> +		 * uses dsm_base = 0 to setup stolen region.
>> +		 */
>> +		ret = mtl_get_gms_size(uncore);
>> +		if (ret < 0) {
>> +			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
>> +			return ERR_PTR(ret);
>> +		}
>> +
>> +		dsm_base = 0;
>> +		dsm_size = (resource_size_t)(ret * SZ_1M);
>> +
>> +		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != 256 * SZ_1M);
> 
> You could simplify to just SZ_256M here.  Also SZ_8M for some of the
> other spots below.
will do it.

Thanks,
Aravind.
> 
> 
> Matt
> 
>> +		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
>> +	} else {
>> +		/* Use DSM base address instead for stolen memory */
>> +		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>> +		if (WARN_ON(lmem_size < dsm_base))
>> +			return ERR_PTR(-ENODEV);
>> +		dsm_size = lmem_size - dsm_base;
>> +	}
>> +
>> +	io_size = dsm_size;
>> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
>>  		io_start = 0;
>>  		io_size = 0;
>> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
>> +		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + 8 * SZ_1M;
>>  	} else {
>>  		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>> -		io_size = dsm_size;
>>  	}
>>  
>>  	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 30cf5c3369d9..b31fe0fb013f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>  	unsigned int size;
>>  	u16 snb_gmch_ctl;
>>  
>> -	if (!HAS_LMEM(i915)) {
>> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>>  			return -ENXIO;
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index d830d52ded5d..b33ba0d49bbd 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -975,6 +975,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  
>>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>>  
>> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>> +				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>> +
>>  /* intel_device_info.c */
>>  static inline struct intel_device_info *
>>  mkwrite_device_info(struct drm_i915_private *dev_priv)
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 5003a5ffbc6a..3ace2d6b4961 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -7967,6 +7967,11 @@ enum skl_power_gate {
>>  							   _ICL_PIPE_DSS_CTL2_PB, \
>>  							   _ICL_PIPE_DSS_CTL2_PC)
>>  
>> +#define GGC				_MMIO(0x108040)
>> +#define   GMS_MASK			REG_GENMASK(15, 8)
>> +#define   GMS_SHIFT			8
>> +#define   GGMS_MASK			REG_GENMASK(7, 6)
>> +
>>  #define GEN12_GSMBASE			_MMIO(0x108100)
>>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
>>  #define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
>> -- 
>> 2.25.1
>>
> 
