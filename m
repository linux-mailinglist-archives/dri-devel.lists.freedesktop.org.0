Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56274C4B5A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6F10E739;
	Fri, 25 Feb 2022 16:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485C110E724;
 Fri, 25 Feb 2022 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645807956; x=1677343956;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=vXxNHWMIQ5pcvgIFMYAfww83JrKCZxBr9g9xKME9EQ4=;
 b=YBTsRGoFgdZ7MpZFq0q2LPwAENCC/TfIyp44sO4JDD5ytot4iEDBrRVt
 ufZut1x3mtS2t0yDle2HzYgW7lgwRlc5m3EJahnkHomEAPL7eabekQCJ4
 FU+outbcG7D0BX8abc14Y4Dn7osGGwiqTTo9WEResY5sqyb1+mrPzCR6R
 15rehUOqEzJK+8bBgE4HPSa5HTBfGVOZDM6oVGErn5GBTHiWhNdA1Tkf8
 AevIjbRHuMmEr1j4wt9t8MqhLpaFVp+YdoGMvAojaeofnqJwHCvU8fqG6
 dUPeVeTDsuYh97p0nMUjn9NSZhnxKECYOPV4wIdPkepJ49iD7cor3wDzl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233156051"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
 d="scan'208,217";a="233156051"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:52:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
 d="scan'208,217";a="549329435"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 08:52:35 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:52:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:52:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 08:52:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 08:52:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+fw7OlDzQO67pBF154uTXbLKtcOxU6+ABxmy71Nd+wkMOGvBAbD7NBU/tqjDU12/3B6kWk19R1zANa1qYAgvoW1YZzPKZ4nLmwclpwFy93Q4qG/8zcuWdckbM2n3DO2AttkzQv6S+NKEakO24oaCtKc0GRP5EVq5gxXDeIJ+oVdeXysUtn6sCUgjVchCv8+hkeNyDbWbMofI4K4GkpKbt3YhHt6lOBI3cJr3z5ZAc4jkOxUTEk/tc5f0FtM+W5W3TbRRNreU6uV3YR6mn93G7Q0hNDIvZDBBemF9+3lwBqpu/TcQ+cW+4WQbF49UOnIQOt/HRXrsIHpLHk0P8c75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTSmhjlms5eVW9XXaSLmQmWlM7iTMu0is8wgQT/WSFs=;
 b=mX9Fjhrg+voR2hAy6ZTLZM2oA38iBJPZQvqkynmQVAyCJUmyzsH6uPaCjI0Q8d6rXjHe1fPMiikyatsOb4rCYX9IWy+E9d17R1HQo2lvxw5NQyYbVh11tbUVyh9woXrUcZ5Ezl/GChQTLoJMbCgFOn88a8DOMKLTVA5rpLt65HVE7JGmQZdff2ZTCB9EOG0bTNq1Ygqt93+vXIWYkGL3Ea+LQifEBwK7oMD7l8RylOaWgs+A6IAFT/OtQgnN0Mc+/hI0iBpU5FnVTZDHxa2poXEtukVsUAf9306eWxFt9UMlALRbgnasKJZamRW3pNw2+8P2+ACjHDrrwHO2W/Qsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by DM4PR11MB5534.namprd11.prod.outlook.com (2603:10b6:5:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 16:52:31 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 16:52:31 +0000
Content-Type: multipart/alternative;
 boundary="------------QOo0ymLngLY8d3KZr0QSut89"
Message-ID: <718c6339-4a19-0de0-2666-a32be7c56dd7@intel.com>
Date: Fri, 25 Feb 2022 08:52:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
X-ClientProxiedBy: MWHPR18CA0040.namprd18.prod.outlook.com
 (2603:10b6:320:31::26) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbbf983c-17e8-404a-589a-08d9f87f3680
X-MS-TrafficTypeDiagnostic: DM4PR11MB5534:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB55349759B1C48F1852C7DC1FE13E9@DM4PR11MB5534.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JE+9zaGHjuCqowF3LlaqVCLlrKHqD5h2M+ZlS3YsBTjyUEoQrr3d1rCmrrozgzC6FaPvZAa3ZxzBBncbWLkKMc8fz2kSe2OZuXLNN9eXmJAEI8eS/S0hotQEx5Z1gw+CqLzZnyKA4rYvYGaQ1o5JxgE6XbPpB/dHJIf6Ih0gaDdx1HjxBdG2vZQkJ0zIVpK7PnkOf92YF7H3iOq5K6OAPOW6fXB/YTfxziFd/x+Js5fTz3U/y073+2E+awv42V05VBrdLMiMP5IDuFpwPbvWcZ2WGfvDQm9hjdO0xyX1IfrIfiE9CPyGfZY+hf/hvGw8Nk8j6tdO2wh/HwR8UopRR/BW5aQ/HwU5751dKf9DMRuZL8RmhjaXfcPrntJQcg4Om9wz1XaJ0hsNFlwQoTmzbsckBFoSA2ZLS7IylYt2w3Za/mIAfYUmYD3beRsT7gVeLKkByhrPd15uPwLtHMtcVlKvu6y20RVQ5DFlx/MJmeFa6EPAkqpHG+6gzCFV8kWLj+yZ5FvPE+lEwJfRBs30ZPTHizR5cUL6irZ0C2oqzBCkY6l9EJ/+23yUFxR4EPTMI60CuediZo8PPLeI11ZwOpERFMlwTtsOrJOsD0gYP8wyh9YadyJLWtfoSHjqOEYQJWBJ2RSQ7LpW2YitKARxi+gcXWTiwAldvGzRQ0hJH1cXmi6KCZ8E8UMClPFNeOHuGY23DgKXKgTu5G54B0GbqkIe+zoVYPbIuFr/ul+jm6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(31686004)(53546011)(6506007)(36756003)(33964004)(186003)(6486002)(2616005)(6512007)(508600001)(316002)(66476007)(66556008)(82960400001)(4326008)(38100700002)(8676002)(2906002)(86362001)(31696002)(5660300002)(44832011)(8936002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWIrSGVWL0ZRWnA3NFRGK1Ewc3gwZUd1NGVYamFOL0xpRGlRVUZ6YVYxWHJC?=
 =?utf-8?B?THowekRzYnRFSUg1OGxtWWthY0tnTXM2SGxTamUvb21EbXg1SGhwVnFvS2dq?=
 =?utf-8?B?MFRkNVpmZitBMmUxZnFmMXFyaVVPbmJtTXNaODlEYW1jbk5xUlpzbTN2aVVE?=
 =?utf-8?B?Zm42ZDZ3QWlUaUZQQTBBRk5SVkZwd0JXK0sxam8wS1dBQWdCNjRIR0FxM3Qw?=
 =?utf-8?B?VUoxcGpuRVJhVkV5MnZJS0RzenFobGkwMjVFS1JwQ3ZncndtUEtBbXkvMGtP?=
 =?utf-8?B?MmN2dklSaVpDZjg0VTlBQ0V4WEh5Rk51dGtQdmFubENMZTlaRzBpcXRMQStG?=
 =?utf-8?B?RDF4aVJwZUxJRmJLSXlkS0Z5VGQyUVVGZFlCSkJlOW42eisxREVDcG5HbWdD?=
 =?utf-8?B?TkNHeWZJNTVDL21jVGtIVEc0Z1o0OHp2dElweTYxb2sxSm1DQU9IUm1Wei9q?=
 =?utf-8?B?QlYvV2ZNUW81NW51SzA4cGpLaTJLdWtOalA0V1FXT1NXMEsxQkFBV29FTXFk?=
 =?utf-8?B?UG1kVkZXc2Ewd21zcEg4eTBiZkYzRHpvRUxybXVzaE5KT0tDa3duTDhleFJk?=
 =?utf-8?B?NTIrcnY2dkx6Uk9jTlNjdE1xd3R4TXh3RjR5UVpBK2w2Z29DbHdQZ2NzOWEx?=
 =?utf-8?B?eHowWWQwK3JMc0pmOTdvQTRHd2hWOFFyVUdKL1RMVHpGbjAxNVZVdTU0S2tQ?=
 =?utf-8?B?eVBYMkZjejNVV3dxQzBZdGJ2MzlSL1lkdGdBUG1FNU9DaGpXKzBscHl0V0J3?=
 =?utf-8?B?V3N0TUU4bFhxTlcwSjI3OWx2WmRiMjdnZnFPZE91SWVRY081U24vS1p2MS96?=
 =?utf-8?B?eURKRUdNZjRwVnA3WVl4WUpzU2V5M1lnVnZIYzAyc3hHSklxUW9xSXZpL0tz?=
 =?utf-8?B?K2xYSlJ6R1NLS0wvSzBjVmhGNWZpaWJOWklJdEcwdUZDblV3Q0tpaW83L01a?=
 =?utf-8?B?a1VCVnFtbUpnK2lHcmVOWGFHNG1ZR1FqSEVrS2ozR2FHNlpSRCtxQ2dYajBu?=
 =?utf-8?B?VCt3eHhZNVdVamxJcGJwR1BqV2RaNGpBcnZ6WllrRHJ6UVRDV0xMeUVvWXFB?=
 =?utf-8?B?TE5iMk1TWnEvaXF2RUJFZ1lwWnhIcGFzVDZBY09yUDUzSXRrenRwb0xYcEY3?=
 =?utf-8?B?am5LQmJkanBPUU1oc0xTZnMyb1lBMVQ4bFlLMG5aVFlwZkR4ZzhEVGVPR0NQ?=
 =?utf-8?B?NDZxdFNrZGJLalRQQ1FJNHNOaDlUcDI3eTVKRUxRUlN1bzdsQ3JReEFQV0E0?=
 =?utf-8?B?elV3ODdoUXM1aVdpSE9aL1pUVjhIL0ZEUkh0U1VPWHAyOFR4d21jWXFXWUF2?=
 =?utf-8?B?NjRkcWo2aTJPL2l1VWNZU1NxVTExMVBZVjh2VEdCSGx1aDZGY3NvdWZ3WXVO?=
 =?utf-8?B?THF3TmdNdkU3N201QWIrSzNKSFMvOGZqUHB1U0p4bVkvWFFlVzFqNzZTS2lG?=
 =?utf-8?B?eEthdjIvdTYvWG1DMnRkRlMyYUwyclBpSTAvbkFrRkErVE84bUMwaXV2NDJz?=
 =?utf-8?B?RW1GQ2NjQnNNYlI3USsrN2ZWT0J1R0ZJUkFPRmVKbS9VcGo2ZnU4SHh1SkFa?=
 =?utf-8?B?Nlg5Q3lyOTRoY3VvZmd0TzdQSEJjSWxDdXhKNXpHMHlJY2EzcFJlVjlpS01T?=
 =?utf-8?B?MDVBVWdLTlI0RlVVcklYMGFxVkgwa3RDZUEwL3pxLzB4NkwrcW50d2cvUHpL?=
 =?utf-8?B?Y240ZWRaNGRub2VzMGJFeG1tZG9hQnlqMHBpazNZaE9DOGk2RlBwS2ZpR3lD?=
 =?utf-8?B?NFcxekMzTEhSUVhadjlwNzRxelZlRzVOd3Vyd3R5VUw3emRWaHhFY3VrV3Az?=
 =?utf-8?B?YWpwcnhZenFVb1dkRDdMRk1HTnRXRnA0ZnV5V3ZkSkp1TlF2WjRHUE13MGVY?=
 =?utf-8?B?U0RWY3RFeVVKZnhWbnJIaUl6UzhZSnFOcGQwdUtkbDlTSUptVmR2ZGp6RnhY?=
 =?utf-8?B?WGpxVWl5WUFjMytubC8ybENXSUlGdlJ2Nm1oTHhvZGVLUU9sQmJjU2FXa202?=
 =?utf-8?B?cUtST3pXb2pweVM5QlYxcFdsT1ZMUTdyS0dkQU1nb2FkK1JzTlVMTWZRTDVZ?=
 =?utf-8?B?NW55UzlhZXc3ckRxMWdpUDJncjNOaUhjMjFZdjF2UktuMzRtclpmclFNeUVC?=
 =?utf-8?B?T0dNNWswSXJUV09ldzdNbkk5S2VrSmppTzI1cWZBQ253S2dvVVZTNTVLeGlr?=
 =?utf-8?B?WWpwdDllREZta3hyRGhCZHdxSkJ2WXNLdTEySDVLZkQwaEZxYlRyL0VOSy9h?=
 =?utf-8?Q?cfUMRnSR0BBhS/qw2nulnMToBp5rBId3cz/jetYLmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbf983c-17e8-404a-589a-08d9f87f3680
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 16:52:30.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKMRXn1PQ4Kx7Bm+CCmGEf5fmx1xWWVHzqSjXq+2FlwV+YFZuN2vBdI9iWTTjSncoJua6f/irMdYPsBpti3X5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5534
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------QOo0ymLngLY8d3KZr0QSut89
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tvrtko,

It seems without cacheflush.h being included, when I build for arm64 or 
x86, it stills pulls in cacheflush.h:

./.drm_cache.o.cmd:838: include/linux/cacheflush.h \
./.drm_cache.o.cmd:839: arch/x86/include/asm/cacheflush.h \
./.drm_cache.o.cmd:920: include/asm-generic/cacheflush.h \
./.drm_cache.o.cmd:830: include/linux/cacheflush.h \
./.drm_cache.o.cmd:831: arch/arm64/include/asm/cacheflush.h \
./.drm_cache.o.cmd:1085: include/asm-generic/cacheflush.h \
So it seems without including it, cacheflush.h stills get pulled in,
I think its because its a required kernel source to build the kernel
per specific architecture, but please correct if I am wrong,as I am still
trying to understand how things works!
Michael Cheng
On 2022-02-25 8:28 a.m., Tvrtko Ursulin wrote:
>
> On 25/02/2022 03:24, Michael Cheng wrote:
>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>> performs a flush by first performing a clean, follow by an invalidation
>> operation.
>>
>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
>>             dcache. Thanks Tvrtko for the suggestion.
>>
>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>
>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
>>             symbol that could be use by other modules, thus use
>>             caches_clean_inval_pou instead. Also this version
>>                 removes include for cacheflush, since its already
>>             included base on architecture type.
>
> What does it mean that it is included based on architecture type? Some 
> of the other header already pulls it in?
>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index c3e6e615bf09..81c28714f930 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned long 
>> length)
>>         if (wbinvd_on_all_cpus())
>>           pr_err("Timed out waiting for cache flush\n");
>> +
>> +#elif defined(CONFIG_ARM64)
>> +    void *end = addr + length;
>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
>> +
>>   #else
>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>   #endif
--------------QOo0ymLngLY8d3KZr0QSut89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Tvrtko,</p>
    <p>It seems without cacheflush.h being included, when I build for
      arm64 or x86, it stills pulls in cacheflush.h:</p>
    <div style=3D"font-family: 'Liberation Mono', monospace; white-space: p=
re"><div><span style=3D"color: #dcdccc; background: #3f3f3f; font-weight: n=
ormal; font-style: normal; text-decoration: none">./.</span><span style=3D"=
color: #705050; background: #3f3f3f; font-weight: bold; font-style: normal;=
 text-decoration: none">drm_cache</span><span style=3D"color: #dcdccc; back=
ground: #3f3f3f; font-weight: normal; font-style: normal; text-decoration: =
none">.o.cmd:838:  include/linux/cacheflush.h \                            =
                                                         </span></div><div>=
<span style=3D"color: #dcdccc; background: #3f3f3f; font-weight: normal; fo=
nt-style: normal; text-decoration: none">./.</span><span style=3D"color: #7=
05050; background: #3f3f3f; font-weight: bold; font-style: normal; text-dec=
oration: none">drm_cache</span><span style=3D"color: #dcdccc; background: #=
3f3f3f; font-weight: normal; font-style: normal; text-decoration: none">.o.=
cmd:839:  arch/x86/include/asm/cacheflush.h \                              =
                                                </span></div><div><span sty=
le=3D"color: #dcdccc; background: #3f3f3f; font-weight: normal; font-style:=
 normal; text-decoration: none">./.</span><span style=3D"color: #705050; ba=
ckground: #3f3f3f; font-weight: bold; font-style: normal; text-decoration: =
none">drm_cache</span><span style=3D"color: #dcdccc; background: #3f3f3f; f=
ont-weight: normal; font-style: normal; text-decoration: none">.o.cmd:920: =
 include/asm-generic/cacheflush.h \   </span></div><div><span style=3D"colo=
r: #dcdccc; background: #3f3f3f; font-weight: normal; font-style: normal; t=
ext-decoration: none">
</span></div><div>
<div style=3D"font-family: 'Liberation Mono', monospace; white-space: pre">=
<div><span style=3D"color: #dcdccc; background: #3f3f3f; font-weight: norma=
l; font-style: normal; text-decoration: none">./.</span><span style=3D"colo=
r: #705050; background: #3f3f3f; font-weight: bold; font-style: normal; tex=
t-decoration: none">drm_cache</span><span style=3D"color: #dcdccc; backgrou=
nd: #3f3f3f; font-weight: normal; font-style: normal; text-decoration: none=
">.o.cmd:830:  include/linux/cacheflush.h \                                =
                                                     </span></div><div><spa=
n style=3D"color: #dcdccc; background: #3f3f3f; font-weight: normal; font-s=
tyle: normal; text-decoration: none">./.</span><span style=3D"color: #70505=
0; background: #3f3f3f; font-weight: bold; font-style: normal; text-decorat=
ion: none">drm_cache</span><span style=3D"color: #dcdccc; background: #3f3f=
3f; font-weight: normal; font-style: normal; text-decoration: none">.o.cmd:=
831:  arch/arm64/include/asm/cacheflush.h \                                =
                                            </span></div><div><span style=
=3D"color: #dcdccc; background: #3f3f3f; font-weight: normal; font-style: n=
ormal; text-decoration: none">./.</span><span style=3D"color: #705050; back=
ground: #3f3f3f; font-weight: bold; font-style: normal; text-decoration: no=
ne">drm_cache</span><span style=3D"color: #dcdccc; background: #3f3f3f; fon=
t-weight: normal; font-style: normal; text-decoration: none">.o.cmd:1085:  =
include/asm-generic/cacheflush.h \ </span></div><div><span style=3D"color: =
#dcdccc; background: #3f3f3f; font-weight: normal; font-style: normal; text=
-decoration: none">
</span></div><div>So it seems without including it, cacheflush.h stills get=
 pulled in, </div><div>I think its because its a required kernel source to =
build the kernel </div><div>per specific architecture, but please correct i=
f I am wrong,as I am still</div><div>trying to understand how things works!=
</div><div>
</div><div>Michael Cheng
<span style=3D"color: #dcdccc; background: #3f3f3f; font-weight: normal; fo=
nt-style: normal; text-decoration: none"></span></div></div><span style=3D"=
color: #dcdccc; background: #3f3f3f; font-weight: normal; font-style: norma=
l; text-decoration: none"></span></div><div><span style=3D"color: #dcdccc; =
background: #3f3f3f; font-weight: normal; font-style: normal; text-decorati=
on: none">
</span></div></div>
    <div class=3D"moz-cite-prefix">On 2022-02-25 8:28 a.m., Tvrtko Ursulin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:011a236d-7ed4-0d48-e8a6-c9bd98740=
d5b@linux.intel.com">
      <br>
      On 25/02/2022 03:24, Michael Cheng wrote:
      <br>
      <blockquote type=3D"cite">Add arm64 support for
        drm_clflush_virt_range. caches_clean_inval_pou
        <br>
        performs a flush by first performing a clean, follow by an
        invalidation
        <br>
        operation.
        <br>
        <br>
        v2 (Michael Cheng): Use correct macro for cleaning and
        invalidation the
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dcache. Thanks Tvrtko for the suggestion.
        <br>
        <br>
        v3 (Michael Cheng): Replace asm/cacheflush.h with
        linux/cacheflush.h
        <br>
        <br>
        v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc
        as a
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
symbol that could be use by other modules, thus use
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
caches_clean_inval_pou instead. Also this version
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; removes include for cacheflush, since its
        already
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
included base on architecture type.
        <br>
      </blockquote>
      <br>
      What does it mean that it is included based on architecture type?
      Some of the other header already pulls it in?
      <br>
      <br>
      Regards,
      <br>
      <br>
      Tvrtko
      <br>
      <br>
      <blockquote type=3D"cite">Signed-off-by: Michael Cheng
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:michael.cheng@int=
el.com">&lt;michael.cheng@intel.com&gt;</a>
        <br>
        Reviewed-by: Matt Roper <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/drm_cache.c | 5 +++++
        <br>
        &nbsp; 1 file changed, 5 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/drm_cache.c
        b/drivers/gpu/drm/drm_cache.c
        <br>
        index c3e6e615bf09..81c28714f930 100644
        <br>
        --- a/drivers/gpu/drm/drm_cache.c
        <br>
        +++ b/drivers/gpu/drm/drm_cache.c
        <br>
        @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned
        long length)
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (wbinvd_on_all_cpus())
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot=
;Timed out waiting for cache flush\n&quot;);
        <br>
        +
        <br>
        +#elif defined(CONFIG_ARM64)
        <br>
        +&nbsp;&nbsp;&nbsp; void *end =3D addr + length;
        <br>
        +&nbsp;&nbsp;&nbsp; caches_clean_inval_pou((unsigned long)addr, (un=
signed
        long)end);
        <br>
        +
        <br>
        &nbsp; #else
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ONCE(1, &quot;Architecture has =
no drm_cache.c support\n&quot;);
        <br>
        &nbsp; #endif
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QOo0ymLngLY8d3KZr0QSut89--
