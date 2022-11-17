Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488C62E078
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508F210E643;
	Thu, 17 Nov 2022 15:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2305010E643;
 Thu, 17 Nov 2022 15:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668700628; x=1700236628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aqTZ+j9ZbPBijoJSMnheSm2etwoepwYfiJ5teWs9+ec=;
 b=GvRSWyfumm3FoU89PCCpjZvo71RQFWrwulD/gcfCkcjxayBHa88czztK
 w1rPXCvd26PhPIbjy+soA9d4IyDuQaRs9GisDYkQBN8fZ8/YMwHoa8dFQ
 TKwNANt7iEJwfu182rO6qACtnja6JmCFCJCfUdxoNkcxpIR+A5jVxf2ne
 z16dqEZczOy+c8GdbCcAHyrPOog4g/vX/TKeTrQljLOYCwVlzVqrGxXG5
 9AhaizSJ7RISdrj+vkU9nzzRKxBJY1CbS9IJIPrhHEsPB/w7nhKQ7BGSj
 rJ6UakR8+Rn1DvPFcSPhmCgZ5B5FD7T94mbiYWiPy4lQdLElL573fCjtp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339717312"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="339717312"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="672853752"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="672853752"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2022 07:57:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 07:57:06 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 07:57:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 07:57:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 07:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klNiYRg8TIZxoRc7kO1EcmMNikHdYH7hj9wCeYfNbx/0JWfafZ2G/KLEmMsw1L1e5mDmECFNnQnoaCSGlUAHzgfeaYRbM/TEe0aynVMCEgIF54NoYhOL3USZnro0l028+vEkHG12drAUi5FmK64f4wbY4p2NegfdA4/117oIAryZ3d4ShMQI94iSpA6HbUExoDiGO1oRcfFqUnuSCnQ7ohcqvQy5yu0MkZmFo6QEziKTIVodimKD8aXMBUpkNX+BaM1jR5ywBvxCS03PDEpMu/aTUUiq306u0Qyl5VJyI/SqNYAMYICk4Jk0srMEnB27bvO13rgmh15BSvl/QTxKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqjcXuW/YvawlhnycpbOic3Glw76GLkrsbmOUSu/uQ0=;
 b=O6Hx7et3GKFNfQjmVU78dZiogndAOvEdsDoaF92CPf4z2T/8OTRzT5KybWv3dpTlg3nYyY1z6+g7NgYIlA4qG4QZcRJWo1f8/vg4s6c04CNyAXd3RL3Pu39Ef006L+p7crXbVpTZ4RDo/XjBYPEnK2wUy0KbViGK+GbZ+mrpa90XcjVA+FSR1wYrqH2290zi5hqjT+w6HaPqfwKv2nwyTInrCi+adPbSmAu0D45rusgF5ot5c0J3qH//Kt/7jLT788AY1cV7tlheUV5etczVUSMPRCS4RsJPkPI3/uvsgMUdkn2J6qXFjg5GbZwbbcSDxrJCBrrZ9d5eii0N2kRQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 15:57:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%6]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 15:57:04 +0000
Message-ID: <f31de1df-fa76-4833-78c0-63dbfdaf9aea@intel.com>
Date: Thu, 17 Nov 2022 07:57:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
To: Brian Norris <briannorris@chromium.org>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
 <Y3WOf7H6nG2861CJ@google.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y3WOf7H6nG2861CJ@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7be583-d980-4af5-2797-08dac8b45f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6qANf9r2dCPvRpJvEwfN3reOCDAM0stAC6IY61w05ofmDuBBPBtU2xsk12NA6sgiM4WQ3HkB1qaWdx3bZbia7VtJjiMmkFITIOcRpuquzCptUd7BF48dNKWCgMdUl73Tk6PemQtlhmnQWBBjkQ4/dWGX44jIpA9hNoWw5ZOxwBapSnq5VjJrmZDHmlgCp33QJJReaOCiALyALKX6p0AdWlzVlarVIBTm/IdJSEA9IBhLI6u1H8keHYpFGZ/R5hDmJ+VnHJ/IfsK66RTrx0Q4x7E2adXWsIPQjzP6hZhsK+BTO85p3/l+M2vLfzj2YarH5l1XjibqqifHCivgLi6BJMR03e0dZ6VaYweWHVRHDShaxS98ztcpjHRYyDJYfFDG0YuLdWFlMjO/0YuEitVyS3n29aqFPkmYEG4lk2HRcvy4PXlPXUqXwy2OVt/7UNxcxRUy5Bmni1wjdTprNHIL5e/GvB9KVWfORU4ufgLVYmRcYTkiWKm26Qw4l8e6Tj8BEQh/3FCtzEj6hExFoYqeK2FYD68pu1K2rOUJmgc7bgmRE3OBM+6rVtCGn+SoOWyMAZhzh095KLq3dcnIbQmm5vdu2MTUniMZ49lzbqv5o9Q1peQ/+EaC5MmX8xbb4DCysLmgvglS/RexGHvJsMV1bDtrkXjOial+Eb3F17XpO6XDgJ30j440DQSykyWSvqbGDJy/VODc8yHL/4PfVxJtYOS/yoTnXnQeT2XxgosDjJ+CAEp6XFBYMtAqFKV2A0L/Ecn/dHcKkQ/upcZ8EuANw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(36756003)(31696002)(86362001)(316002)(82960400001)(38100700002)(6512007)(26005)(6506007)(6916009)(54906003)(53546011)(6666004)(41300700001)(31686004)(4326008)(2906002)(83380400001)(966005)(66476007)(66946007)(66556008)(8676002)(6486002)(186003)(478600001)(8936002)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJ6T0hyOWJBSWJVQWpyVE9zZVE1SDlzc3NZYTUxN1pNc0lHc3oxSXArK3B5?=
 =?utf-8?B?MXlidWxHMkF1c3NwUktKdEZIeHZtcEI4VWdRM0t1MmRab2NoWmRBRndCZGhy?=
 =?utf-8?B?UWJqY1NHNVZVOXRrT3RiZ3BnbXRkWVlwempsczBQWGgrQ2tkTDZteDZoUXJM?=
 =?utf-8?B?RDlZMjBxNncwZ1grQ1NYUkRyR0pDMjVLRWovTjRPdTZpSkF1b1luenVYY2ZI?=
 =?utf-8?B?T2owaktmemllUm1LSVFpZEx4RTI0U1NKZ2NrQmVRUGN0RExKbkt5Z1d0Nkhu?=
 =?utf-8?B?VkM1cDFQaTFiSG8yUVhXc0ZCVHhlVERhaTl5cFpMSTFnS1NCbHVSTEwwdG9X?=
 =?utf-8?B?eXdkam16WmlqZk1hVUhIalc3ZFBNQnYzMkxDaTE3Q3ZZZVFYU2luV0IwcW5s?=
 =?utf-8?B?aC9YSURwMTMvdDRmZ0FwTE5qUHFLaTBwUnEyTW9OTCs3eExiR3dKYTdtT1hD?=
 =?utf-8?B?NlhWS3NBenF0enFsaDB3YWYwQ1RMT2UwSDZyNlpVM1BxRityanJ5UzZST2gv?=
 =?utf-8?B?cXBTYzlReXk0aUk4TjEvWkw0MkkySFdDUFJDSEhxbVhhQmNjbzlnYlFKT1RQ?=
 =?utf-8?B?eFlqNjVKVDBqaWd5d0VRYnpMWUExT21JcGJPaWNSWCtCUGZYRThlNlR5ZlNP?=
 =?utf-8?B?M1VJSTJUQlJLcUJDZm5ubWduTmVrVFpLOHU4bmdFYStXR0c4OGRGT3JSd0NY?=
 =?utf-8?B?TFhRRitUZHN1Y1huZWVZSFhXbFJ5ekNaR2FzSStyZzNTc0tkRWZFY0I3T0R0?=
 =?utf-8?B?Vks1VHF6dzZSa3JQc3VXUHE5VjE5TW1KejRFNjJncUYvSnl5OHA3Sy9FK2JR?=
 =?utf-8?B?TmVBd01wc3orTTVZbFg0ZjAzbTdvVXRmamdtR09OVE02TzFZWHpxaXB2ZURx?=
 =?utf-8?B?b2JTUzlNODJzOXRKcitpa29RZmNqOVZVYllVaC9aaXcxblViUWt1T0c2Y1lh?=
 =?utf-8?B?MGczYlFwY0V2VitIdFdjUnRRRFdDdXZjTStZZGxGNHY5N3czcVBRdWpKRFlE?=
 =?utf-8?B?MFZhWDlsTk1NdFNuOHRRRjBDd2YraHBXRytsNHBHN3FpSWkrbUNyekJKWVNN?=
 =?utf-8?B?QUg0dzJPQ1VoSkJoWktleEhaa29SeUpqVis0cUt0RkViZGxUT1lET1RvaU9L?=
 =?utf-8?B?MFJ2K2MrRlNaZzk0TW9YMDJwSG90emZMc3U1N3FmY0FsYmpQeGlCL282ZzJM?=
 =?utf-8?B?Y0pBNU5KL2hKM3VORE03VVFHWEpIaFpXUmxoOTJTUnJjUVJqQnlja2lFaUVT?=
 =?utf-8?B?T3dVdzhtNmNqSEVHTUtPeGV6T0dvRkJNNEdvNk1XOWlIS0NsM21mcDFZTzUw?=
 =?utf-8?B?RFpra05IeHIwQUo0c0ltOFgwQVI2bHlMT0pxOEJTSmpsWjZhQllobXJaWUdY?=
 =?utf-8?B?dFVEUXlVcS9NdDNpMUZuNHBIaHdnYlhnbTZUOWVyb0FUcGhZS3kzRXJSQXFm?=
 =?utf-8?B?MHFQYWhoUUdNczI2ODZHd0JNL3ovN2ZneXVaeWFFbk9zdExMaktWVWFtY3Iy?=
 =?utf-8?B?L1RJaDJqQVVDSXZ5NWtRNGMwS0VoV3AvMUtJUXRmVjVYY3pZUnY1SjBHOGlw?=
 =?utf-8?B?ZWFnQUZaWkxtWlZMSTJYZklnZWc0c2JIQURTcURaYmdockdIMWJlZEc2YkVI?=
 =?utf-8?B?dXIvd093ZEE0d2pVdG9HbXhSRC9BTk9UUzVoQmx2ZkpOK1hEZmpMN3BzVGV3?=
 =?utf-8?B?UnBaS0x5SVl5NTBaSkFxckhqQkFQVjJMQUdHT0E2cVFLOXRRcHVUWXhRODBD?=
 =?utf-8?B?MGxCZWdWU1F3VzVJUkZJbGFGK00zcFRWbGYvMmcyajY2U3JxRGJxV0ZtVzUz?=
 =?utf-8?B?MHdTN3RISlVNdDk1R1BMaWdCZ2VkQjJsRnpqeEtiZXBiek5SWWRhakVYWjU1?=
 =?utf-8?B?aFNmQXhCbWtoaVFOR3hJWWFoUEYxYnlnZTFycVg2TnZWZUpYdHdnYUlBTnBi?=
 =?utf-8?B?RmMrSHIxNk5xdHhTMmhWb3kzelR0UkM5YnNDdmJCZm9vdFV6NlJ1RURWYmV6?=
 =?utf-8?B?MzNOdWpBdkd4akVJNFF4eEw4NFVkeGlSdkZhbEpzRE1NZXcySDJma3JoUnFY?=
 =?utf-8?B?dGd1c2dsdVlZdEE0aDlxc3ZONkdCVlU1b2NpY1lnY0ljaXlPcmJSRzVSRk92?=
 =?utf-8?B?azRDN3JRV1N2WTV1NXJyekVxcWFLTCtndmNLUWQ4a0xac2JJeTFNTGZVcm1m?=
 =?utf-8?Q?codtplO+eGBJYGSR5pIsCBk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7be583-d980-4af5-2797-08dac8b45f25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 15:57:04.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0cAnoZiAOG6TBvPUo4Oagsn5V0Z+DmKTb9zpnIkAQvKsyzUXgiyJnbGZHQs6r0Kh5ZWaENk/oGuCAwmnQgA9gLcvkk002hJivQor7vSwys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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
 intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2022 5:29 PM, Brian Norris wrote:
> Hi Daniele,
>
> On Thu, Nov 10, 2022 at 04:56:51PM -0800, Daniele Ceraolo Spurio wrote:
>> The fence is always initialized in huc_init_early, but the cleanup in
>> huc_fini is only being run if HuC is enabled. This causes a leaking of
>> the debug object when HuC is disabled/not supported, which can in turn
>> trigger a warning if we try to register a new debug offset at the same
>> address on driver reload.
>>
>> To fix the issue, make sure to always run the cleanup code.
>>
>> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Reported-by: Brian Norris <briannorris@chromium.org>
>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Brian Norris <briannorris@chromium.org>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>
>> Note: I didn't manage to repro the reported warning, but I did confirm
>> that we weren't correctly calling i915_sw_fence_fini and that this patch
>> fixes that.
> I *did* reproduce, and with this patch, I no longer reproduce. So:
>
> Tested-by: Brian Norris <briannorris@chromium.org>
>
> I see this differs very slightly from the draft version (which didn't
> work for me):
>
> https://lore.kernel.org/all/ac5fde11-c17d-8574-c938-c2278d53cf95@intel.com/
>
> so presumably that diff is the fix.

The extra diff makes the driver call the cleanup function even if HuC is 
disabled, while the draft version just fixed the cleanup function 
without making sure it was being called.

>
> Thanks a bunch!

Thanks for testing!

Daniele

>
> Brian
>
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 12 +++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>>   2 files changed, 8 insertions(+), 5 deletions(-)

