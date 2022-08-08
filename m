Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431F58CE21
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140D7112CC8;
	Mon,  8 Aug 2022 18:47:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEF210F6D3;
 Mon,  8 Aug 2022 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659984237; x=1691520237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YmTcCfmhuiwOrlT3YMb8/wIqjYxp56HWEJq6Roe9D20=;
 b=W/cl0UbrUqiIjsSKdREkqzL5MOWFimr2m6tClanwaowXdNPX2Z1P8wuq
 ZAwr/kK+nPW+Fw+3ARWFzDQa7paypGJ4FtvjtBLcffBYWlowwd5mEVKHs
 kqRF+qDQSnpuJbTvFp0Hwsaj+wHGrbR8Q7v3R9TufzNaII3rxG5zC3n9w
 /M/PnTDse4+pX02VS6mU2p89O5ddgoVE0TOnaRryibeBjSvEzeFxRrLao
 uHY/9Y+0AerZDOcFvF9/KOJIhs56H6U4zFv5STb2lEIlY7HfaYWWfjIJA
 obmnsjeUNB3gkMwTN90f18rQAZQ/WzmiIHAd3n+wTsl+IzF029RZAPkHV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291446009"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="291446009"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 11:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="780594693"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 08 Aug 2022 11:43:56 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 11:43:56 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 11:43:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 11:43:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 11:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDACa7RR3abNunUE4hvhOHTJe1xeRlVWK59rehAo6Vb0iEFshNxGufRq4GCOoVxeW1Lk/ZaBCR4Nj33xno5AuwqAMkPJzGLi7kdmyd+jkAAv84dORwKsX+lc1vzxccusme1Hx+20Aq+59St0ZjBIFCg2KSRn5XABq+eCyNEnJtSq7LbG7v69qlwE26oPyIY5pAcuerq9rwqphwIh4wti8CzB06GeK0m/nByT4ovnaRBhVUAvZiwtloE83Wj3T0uhDv8no067C/bt6qc/p73zm+Irzq8aE5ToMhpYXuBs9iMcgXPFqvIVazM2T1t47AfyjUOSmHIQ/KfHRHnFaYnYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgW6lzZSnj50ayE0I3c23319aeRpBqtNHun8EohakLo=;
 b=k0Bc+Zmxi1RfGCyVTlfJ8Nw++4Syflvr4y56Jq2kpAXqopNm5ya9ABH1NTbmAOLLt494DjE+1l1ScqPtdXzivlVhpHXsdt9tp9ONErPPyQFnSBBSjWJ4z09+iboa/4fLtjFiqS+Wyj36abuVgnAwAVPifApt2SnPvGPYU9JaJqW4WVidXmNGuljRFuo5tPtikr/QvhH/+ZLF/+qL6TkEshREhF0oNSHRHqSD+SVIRNAi8A1wgnKRjzvdmrlpS9ORs2CskHa0meFsJtq1i1XNSlufv+mqT3d54GxsMCMn+TrURe6cMHTHC7HkKdDqad5td1IbfRYpYBckpWHmT3Ymlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB3503.namprd11.prod.outlook.com (2603:10b6:805:ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 18:43:53 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e%5]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 18:43:53 +0000
Message-ID: <2b8105b9-f05c-454b-c678-af1cf98f54b7@intel.com>
Date: Mon, 8 Aug 2022 11:43:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
 <f1c122a1babf75c8fb0910ee5e2e48d9f52e9722.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f1c122a1babf75c8fb0910ee5e2e48d9f52e9722.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a17cd3-a13f-4aa9-44e4-08da796df13d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3503:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPcUs4JxgS9fmK/Kl9Nir7IoPLmuCtlwGTQCZjU4jViEKomaAifv8c0O89/hSqSyc1UR+vOfBkxj7kDXlhqYSIEeHs2yHYLS6T35ILwbiWi/uvjQDSVKnLghRujunzWIQjAVuHcLdGbeGe2rORirpbK0Sm/DjXewhzrjMojAvbuoU7qmm0riCnJeQknNL/GPzXozJJ47ji5f4JrFOGHHhcBxdf6noWZUjVAMYn27ly+btYQHYv9IBVLHZl3HSqCoRDyF39dKyr/bw/rTMHFhu3x20+Oadr0+gbi2Jv58wK446CHIKOY/YGRiFWfZo9Yj+rMlGnJmbfBoRUBGOvkaqGltgaL06XarXEd3lKh/EYx/wTcXnWpkcnn8nlpNBiWic3ai7WAruBUhfx4Q3ImcZJ6trVHNbGq7ayaBWyZ3j+L18fAfxFpxpfsMHTdJ8GO4bTyphtAi8QKaKng326sObpm1a9N3KqSS/3JvbndlfTpg+aArhzEVsTQ+ctFGmqPmOe9fhY63vFx4QpNAJbtLKFOX14aNUuv+shaL6o35pbx5Rjw/75FejPrRirWYI+WtOX+VKAqF2q0cbd9bLsQ+NcOmQyT3qVJkLYqzrCZr5yvUdbUhk5hu0enxaW6ku1chdawMltBLE0bgSyksWZ8Sc72HHHk0Jljcd9mFk+FrIw3VP7P2+GLHtCkw2cGOchIjSULZ/xvEMUjVw5XIGMsh7jX2sIgE33kmD4zR/qpcRTgVASHiEtHNB6BfCccpPkjIwxpvyQ50rCRAvUZk5rrAkkrCpOQUynGCryk0oFic70xYkzt3RZmjxlGpZIEuzGqqW7uXVJC4FGEHo06xJr4OZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(66556008)(4326008)(8676002)(450100002)(2906002)(66946007)(478600001)(6486002)(316002)(36756003)(110136005)(53546011)(38100700002)(82960400001)(41300700001)(31696002)(86362001)(6512007)(6506007)(26005)(5660300002)(31686004)(8936002)(186003)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1rWldCanBmOTFwZzE1K3pEdXhGaFhwck1ReUpTcG8zMmxJSFJKS3FPcjdV?=
 =?utf-8?B?OUNidTFqVDhEa0p4S2ViQjk1c2Q4VUVObEYrZEtYRkJCSUt3a3Z6K1VGcWxl?=
 =?utf-8?B?RTJoNmpGa2NOT01FNytLSGdYTWhBQk51UFowcmtUUjdmMFlJV0hXTG9YN3Vl?=
 =?utf-8?B?dmdmYUh0RjVFbVhTcnFFSC9YMjJRajVqZGJ1RlBuQlBlZDBac09YQ2JPOEY1?=
 =?utf-8?B?ZkhXOE11VTlkanVFYmFMMmtYVnBWQWFBRDUxcFplQm5YY1lQcFFwUEVIZWFw?=
 =?utf-8?B?VDh4OFc3REFoVTUxUmZzeVdEL3dkaGlOTHlrTDRTcXBKb3VJbU1lM2ZnK0JT?=
 =?utf-8?B?MUFKOXRTREtCTTBwYlBGeTlHekJsWHkxQW5Ca0pKUXdQNWhlcVpvbTN4d1pJ?=
 =?utf-8?B?d0VBT2VWb3JXekIvZ3dHMU1vZmdzeTZZK2Z5c1o4RUl5NytYNkUzOTlxbXpK?=
 =?utf-8?B?SW0yUzd3MkwxRVRreG84TDNxOUtzNndrUE1mMlJQWmJrbm51V25SNjNSekw3?=
 =?utf-8?B?OUtMSHcxRDF3K3Z2RWpYMldMSnJydVE2NTBvaFllMTJpS3hyN1JHTTNTLy9v?=
 =?utf-8?B?SUMzbnVtaVRRMlRzYUpMSnozZHdsUit6bE9ZdHVFRGRhaHNFb2Znc0R5ajli?=
 =?utf-8?B?VWtNcHh3aWtTNHFQVVdBTm9zeFVFYTlRMjNpWlBleDZCN1FXSThyNXUyYWRS?=
 =?utf-8?B?OTUwNWk1cXRHa0pnWmNZRlJORlVhSHhwOURGSGp1VVEvNEpvN3BJZXJBREFI?=
 =?utf-8?B?eUh6RENvNUtQZkZpUEl5YW1Ebkl1OTdsSnlyZzZFbGMzaCtXQXRPZlZDdHda?=
 =?utf-8?B?MDVMWU0zSm03TlA1WFg0MVc2aWlVMlpjemszdFNWRDc4Qm1jd0NtS2NlR29B?=
 =?utf-8?B?TlBWS0FSN3pMNGJwK2tXdnd1UTJNK01naHRMdWc0dnc0aEdkMFl6czhPUGNW?=
 =?utf-8?B?VzhFYUV1cnJSd2tWOWdxMjJyd2lCUmQ1ZXpJblhhbVREdUxhdHE5WStIdWhm?=
 =?utf-8?B?alF3b1NQUWRGR3ZKUyt5dzhIanM0VTRpdE8zaWtXK1BjVlplZjFESTdqZmVR?=
 =?utf-8?B?eTVIR25kU0FHOUVTNlFVUEthU2tQTC9DOUhnZ0FIMW5wODBpakhlV0huWVJC?=
 =?utf-8?B?NmxZOFlhNitlUVV4bWhoallsc3pNSVh1Y1FubDJsY1FrbEJUSEhGR2tMY2pw?=
 =?utf-8?B?Sk01Um8rVUJKZC9XK25pUU5Hak1pVXpqN3RyV3BpazI5eUZKWWtYbVhxTWt3?=
 =?utf-8?B?NC9YeitqQm9IbUlNbE9tdUl0SmtjbUVUbjZFemhGeUhDV0Fka0RqNC8wbVll?=
 =?utf-8?B?OHlkMWY2ZGxTYlZjdjl2UEZMRUMxUFhnV0xOQ0JPbkh0RkNWOS9VbHBwRllM?=
 =?utf-8?B?VlVnV0h2VGJmMXhIOEJZQUd1WHRoTnJYQ0p0Nkw0MVVrL0J0dWkxelZ1MXk4?=
 =?utf-8?B?R2VDNDBCVmFBMEJIMnRISGRieks1RG9sSEJvYU9MaWdIR2ZrQlJWckdvc3pk?=
 =?utf-8?B?QkVjbjUzK29Dck1ZKzJPYTVWR1F0dlNaTjZHMkIzbk9sVXFPd2l1V3lDK3lY?=
 =?utf-8?B?dUxJelh4TUN0bS9EZW85L3ZJWWRDaWRYaG9ZVFJ6TEVzWm1DUEt6c04vNVpJ?=
 =?utf-8?B?MXFGb3d0T2Q5WERuWFdQM09YQVA0a2RQQnBUVkZzZFhyakw4N2krNUNwVXJp?=
 =?utf-8?B?cVY1SVFJbzU3TGRDOFp2eXArYkZGMXFTSUN1bWYxQW1sdlVQdlk4NmVlNHB1?=
 =?utf-8?B?TXlzcUhWWjNGREdVNGZla2lpdkVJMThuaGZ4RktqSTNJaGN6UXhzR2JSQ1hZ?=
 =?utf-8?B?NTEwaVhERmFBZURQTW5NQ0FlZ1BrS3R1aEx1dVIzd0ZHS1lMLzBXWnBPcVVG?=
 =?utf-8?B?cWhWNTdJRnN5WmNwc0xGZXVtdllHc3J5UWw5MGd2b3JMd001eXlNMDd1Mk1I?=
 =?utf-8?B?VFdyeWh5SjdZZmxDck5UYW9mR0NLdTUyQm95dU5SYU1idmY0QytkU3RCTkdE?=
 =?utf-8?B?dU1YNHp2QzNGNVFSV2krODRsam9lRk9OQk5uemcrWU12N1huWUswUEkxbjhI?=
 =?utf-8?B?OEJsd1YyMlZMek90L1FIKzlqbEpyc3MwbTlKYUdxaVhSemFOYUNCZmhidFNN?=
 =?utf-8?B?N1p0NW1MdW1FcTB6alN5MjM4SjM3NXVjUm4zeDR0NUtOQmdIdndVeDVjMzZF?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a17cd3-a13f-4aa9-44e4-08da796df13d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 18:43:53.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnPc3QAh7OFR2PaTNVbUfUQ2e7QOSBL+shtl1sLOTJZmgyT7rW/aU0CmLvhWhRWEv4Kx/AqkNmx90N90G5kqwkh2cBpeZ12BsuqEICSdQbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3503
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

On 8/4/2022 17:40, Teres Alexis, Alan Previn wrote:
> I have a question on below code. Everything else looked good.
> Will r-b as soon as we can close on below question
> ...alan
>
>
> On Wed, 2022-07-27 at 19:20 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> It is useful to be able to match GuC events to kernel events when
>> looking at the GuC log. That requires being able to convert GuC
>> timestamps to kernel time. So, when dumping error captures and/or GuC
>> logs, include a stamp in both time zones plus the clock frequency.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1675,6 +1678,13 @@ gt_record_uc(struct intel_gt_coredump *gt,
>>   	 */
>>   	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>>   	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
>> +
>> +	/*
>> +	 * Save the GuC log and include a timestamp reference for converting the
>> +	 * log times to system times (in conjunction with the error->boottime and
>> +	 * gt->clock_frequency fields saved elsewhere).
>> +	 */
>> +	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
> Alan:this register is in the GUC-SHIM domain and so unless i am mistaken u might need to ensure we hold a wakeref so
> that are getting a live value of the real timestamp register that this register is mirror-ing and not a stale snapshot.
> Or was this already done farther up the stack? Or are we doing the opposite - in which case we should ensure we drop al
>   wakeref prior to this point. (which i am not sure is a reliable method since we wouldnt know what GuC ref was at).
The intel_uncore_read() does a forcewake acquire implicitly.

Not sure what you mean about dropping all wakerefs prior to this point?

John.

>>   	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>>   						"GuC log buffer", compress);
>>   

