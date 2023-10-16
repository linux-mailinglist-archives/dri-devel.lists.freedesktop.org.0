Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D587CA0FB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8010E125;
	Mon, 16 Oct 2023 07:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299610E124;
 Mon, 16 Oct 2023 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697442478; x=1728978478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T0uC/7YinPZS3KdfDbssZ+QjVYtry+rgXNH3qnp+BzE=;
 b=R4tpjvLWIoA5SM5tnAOiT0+geWf2dPeLDMd0NZA/3EYOd+5zUZVXzxmf
 rcTotoQLx9MidqdJphuFM3z+p6/W+va7+x2xjCOhnMU35eYvNZQSm8ybZ
 gHTJFAEUQTsHLcVJL0zNoxJm1756NPyeYbkr/do6pCqACzEi39NLHAxK5
 K3Jlx+HlNLitC9/RLPayNn+oAm7DHmzZTff7PhJvO0Vy+IQsUbOf1XiQJ
 cRghg5pvi2gUJkCB5BgeSgVI25jvJb+e8t8Kdndvw1D/V8PdPbLc0cBep
 mYNNz4v3ZZ8+eiS+AF3BxYEFTDnQQtFQ3gN9+0VyXgTkUj2g3oEzspN+6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382694537"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="382694537"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 00:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755594509"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="755594509"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 00:47:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:47:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:47:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 00:47:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 00:47:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgnmylgNvZOCsgSKMzkB23ZI6ocB1aX1UTtJB2HeWhMVgWq6INbDgYErUStfvdmvv/xONHQYHDoFm07oki4wbjFkVbfJ7dMvmdHr1TEuDxisJmNT3+asRtG4afINyPob6H/azFFS+kZp+pNoZBAuh+DAjCMNWh1wLFcwloIHCmfG0x0rbeHkY8rzZ5nC0j/+rc9T0ATa9SEUxssYUVW3heWjp9Zf2dvQoIXzD1eIb5P8gCJ3tU9/UG3J4y0r7c//yhsRsgtIpLyEn1pSDFtz/+9KdHxX4EDMrxtalVKs28Ul1gPuNBqq1k64czvQ49xs1lGrQ0Eo1afSTogm4NxN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNumajqhz19So7gMsl4DrYx5P5iK8c87j8mAw15WX1A=;
 b=bokNpmhbWjHiKM9Rdo+fyaNVM47zUrgmnJY9bN7diEkJkCT/cdavQD4Xnes8RnGr4TBrTbxteCQwInFkcUoZlGCfKRFUAtA9R5UOODWDWl/2r2mRintqgTdCSvyl07t4BhKLX8p/R5+MtpxzcKxwc9VkqjQBfKDrM2tlE5VmDtVVbLwH/MJLhxcDXPu3zbTnWl1oTA9t26p7/4qDxO799RlVTEq4K/2c+lV3hYpYa40GCfvzqVr5pcDwpVr+K0zetfBz6ZTAS/ZYn+MleDWrPRIqoN4rSVRFm/oOuAiaNB6VeX0vlxyUnONA+XmiLpl0MbS8kJAG/GAh+M6YRGkNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 07:47:48 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::ad61:1cc1:ea00:54e5]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::ad61:1cc1:ea00:54e5%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:47:48 +0000
Message-ID: <902ce412-f6f4-302d-f470-341cde6bb5a9@intel.com>
Date: Mon, 16 Oct 2023 09:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm/i915: Flush WC GGTT only on required platforms
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231013134439.13579-1-nirmoy.das@intel.com>
 <ZSpWjR+gtjt2oMJZ@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSpWjR+gtjt2oMJZ@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|DS0PR11MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: d0142fbe-7cc2-4b0c-27c2-08dbce1c310d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7kZa9fa27aorM0Pp6ezUwz1fca4eSDzuqJMMsEtIy03CaSkMBJS4Q+Tf2ituTSLLtnXjjD6IppWyT6/btlEdUcM1yp6S+SE6HwvOpwtzVbE0TF94SDIJYTsNVsLEDQ+w56qgN3F0PlvuJYJAJMtB+3e7qGeQ/hUZ99QPNkyBsVDGn/+fpCkGsGdX3b06z8tXF2Tfh+dPVFqXkA79Tv+FIfhscrK1A17MoL7B1fhWaUXRNH1eoMVdtKUBJkTvBiv7MFRImVtwj7b/etpdbSJelDmW7qUcrLZ9ijOeFPXEizEpNUfQ7KcdJIT9EA6LJWD4JtsaPN44e7VYUw/ay1e/uZtUP/5sAMj5Kd/jxxYS7WCLZ71TP+9qbJLgDDhEygqJFMvEqgLLz0qYqyT6BSmkO8tqbDURj1mA5dqSS+hfRZ5KWcTifaG+qg5O2ap1ff4YbAdpyABw2VXvDXFl0mXVA82/b8pbUle0+jT6GgK8RXGtJOZoAYqkZJ09VPleRyn9kn3LrkMGxzq8ZBfAM3tR7aJF2HQrqc3mD+qQ6QlvhabSIUHQdQ/AEO8NnLEb2900yi320/xJNmywOhAnlcr1DMf0ykivq6oGfIfSkSjtrYSJnfTqOH5Vc2agh+Rg3nhZAyG4OYHPgEJx5v5lTxtrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(53546011)(83380400001)(26005)(66574015)(2616005)(5660300002)(41300700001)(4326008)(44832011)(8936002)(8676002)(36756003)(31696002)(86362001)(31686004)(82960400001)(6486002)(2906002)(478600001)(316002)(54906003)(6916009)(66556008)(66946007)(66476007)(6506007)(6666004)(6512007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3h0UmQxN0NXUCswdlYxeUVlZnlGZTBNTDR1OTljc1VHemNCbXlpYm5BVW5z?=
 =?utf-8?B?Y1hhUXZmSkZKOGlYa2dFYUU3WnhSb1hMbllZMCtEMmFHczY5YzNaM1ZDTDlq?=
 =?utf-8?B?UUFOK0xtaTFHYkcxV3NxNE9NWEpGWjhOY2xXWHlINEhxY3NuWkg2OEc1V29Z?=
 =?utf-8?B?bUFCc1gyTk0zUkdVaGtuSFUzVTBTM0pKSzhBUUJxdUZTUVlzUXFFZVRQNG9z?=
 =?utf-8?B?WWx2aGgwVGNPb09BUE5sUjhuQUxpVmJLMmhOSFJLU1AyWXcwbTRMVTI1aVYz?=
 =?utf-8?B?WDRwbXJrZUp3UU0wUmFDNDJESHpCM011MkJDdXFtcmpqamNvdXM4U2ZZdW9H?=
 =?utf-8?B?NHJmVDlIQWszeU9BVWhyaWpCekUxalBXZlErWVJQdUlKU0ZlRHhmaDEva2Fq?=
 =?utf-8?B?QzBRUmJlR3BEMzh5SFZJNWJFR2Z1V3NLZ0pwT3VIanlMam95WWUrbXMxakRo?=
 =?utf-8?B?MU9paFpSOGVRQW03MEJXRUxBclIzOUJpbkQ5WmpyUDlJUjFFRTY2VTR4S2lu?=
 =?utf-8?B?YzVxdG5jSjVHdy95TnQ1cHZBM1hiUWJVYm16UklvL0R1ZzdFQmFvVS9zcTZK?=
 =?utf-8?B?S2o0NCtzbXVmM0NydlF5WnlqSVU5ZWtxTmkrSnZ6ZTQ1VWFXWk1rTlYyYlBn?=
 =?utf-8?B?OURhUGRHTXlMUW5FbkFpQ0NhbW9RamZVeHBmeTFVMGQyL0FkZ3ZZdXdzamtR?=
 =?utf-8?B?R0lnZXQ4a2xETm50bHFWZlVOcnRkV0JpajRmYjg4RG1NWDMwWmtOd0FUdEZP?=
 =?utf-8?B?RUlKUWpsc2UwbGlNRENVeWNvTjVkQ1hYNGV2b3lzSnRtejltK1Z0U0FXNGJU?=
 =?utf-8?B?eVlQUlhDc3RiVkprY2N1Lzl0MnhUU0gzbVdLVnE0YTJ5cTNBMlZheTVEczh0?=
 =?utf-8?B?RVpuOEhyVWVlcUN5WlI0TFJIN25uSVdWeEdvaEVMWWRvZU1mWEx3WkdzNUha?=
 =?utf-8?B?eGNYODNzTmZYaFpKdWJ2S1RHU2t3R2FQbXNqU3NwbjZsUll1OHphVSsxQkIw?=
 =?utf-8?B?eHJiTGxXeU54VTE0NmpBV25nTkkzdkFuRG9XK0ltVEhvT1k4Yi95WXBOKzlq?=
 =?utf-8?B?N3FwSkkxc1VZRFZtV1FRazVTUmdSajQwT3lJYXZQMXpTRDZJbzkySHhyTXly?=
 =?utf-8?B?emRHT3VDS2JlTUs3aXZnZ1ZoM0J5Y1YvV3NJazdpSWhSSW1oQ1kwWndPQUFC?=
 =?utf-8?B?bjFoR2Z4YlhvcjIzY2pIRTdBSG5vZDhwQ1VUb3lkNU41ZkU5MTlaeHpkSHNH?=
 =?utf-8?B?M1VLWGlJZ2xVSEQybStRZHdsdFFrVUpTTUw4RkFVQXJZM1YzelJydW9lNmh4?=
 =?utf-8?B?MlhqMmF5TDdLdCt6VmxKRjd1MGlMYzFTZVNWTk9jRGpVckZDNTU2bno2em9t?=
 =?utf-8?B?Q3ViK1RqU2M5UG1Jclc2Y2ZMTHllVG1rVTNuMFd0WEJCa2I1Ni9KYitOd0xB?=
 =?utf-8?B?QlIwZkZQNXd4YjQ5NTh2eGRJeGRyQVRSSGJTVnhqVmZFVTRlcUlERUJFTnpT?=
 =?utf-8?B?Q1RxUGNMMUNHaW1sUlc5WEJIYzQ5ZTFXTEljSmdxUlZTSGROcTFzMlljb1VY?=
 =?utf-8?B?b2k3NVZRKytkTVgwM0JDakxCQnVjUmlxRVE3VElRVGpoUU9wQmxDdDVmRUxN?=
 =?utf-8?B?a01CTmRaYzkzbDhGb3pOUXlTaHZBc2hvRGJ5a25ocjlRVi83Tk1oOW9qNE15?=
 =?utf-8?B?RnVBb1J5NUhrckVmWExaQzNPRms2UnJIdmxIMUplN3Q1bWxQcHg1OTFQeDZO?=
 =?utf-8?B?bjhGYXhRUzYrem5xWmg4Ync3SzE0VnJ2M2tqVERTZHdXVEw0NzUwYUViM0xV?=
 =?utf-8?B?V2w2WlhlSDN5WTU3cDlWUFVMRzh3aDZsSWppYUVORHFITDFCbUNlT0dzOXA1?=
 =?utf-8?B?UEtWYlFYNEZPMlpkUzhGMVdCT1ZmV29weVNnT2JaeGFOT2NWckhkS2hYN20z?=
 =?utf-8?B?dEtncE8zc1NNbnNIYUlhMFBZVjNaK0J0TkxydWYxVkhOSmgzbEdCNHpaUVhq?=
 =?utf-8?B?REN4Z0ltMWxuMGFOaXhyOHVtRW1KcmFMRzNyajhGa3FCQjBmRFZMZC9pOVZr?=
 =?utf-8?B?ZjNVRmc0S0RvZjE0Y3dVclZ4NEE2Sk1CNzgvdjZBMmIwUEZiZUQ2U3loZVRv?=
 =?utf-8?Q?ZavIKVU9PlH6KOF66NUaWfmF2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0142fbe-7cc2-4b0c-27c2-08dbce1c310d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:47:48.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL6++JZoOuhkW7FBcaBDByRVQgDhZ80Xg4eOlUDdc2nLPFPGAk2LVPZgjnM2RGirWW8eDVge3qD9oQxyZBywKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7623
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
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 10/14/2023 10:51 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Fri, Oct 13, 2023 at 03:44:39PM +0200, Nirmoy Das wrote:
>> gen8_ggtt_invalidate() is only needed for limited set of platforms
>> where GGTT is mapped as WC otherwise this can cause unwanted
>> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
>> valid.
>>
>> v2: Add a func to detect wc ggtt detection (Ville)
>>
>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Acked-by: Andi Shyti <andi.shyti@linux.intel.com>
> I took some time to look at this and you can swap the a-b with
> an r-b:
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks! Going to resend one more rev with commit that is started using 
this register for WC mapping.


Regards,

Nirmoy

>
> Thanks,
> Andi
