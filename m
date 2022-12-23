Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD765539F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 19:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2197810E083;
	Fri, 23 Dec 2022 18:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FEE10E083;
 Fri, 23 Dec 2022 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671820093; x=1703356093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q3qehF8BkHtKaXP8Nkn4PLrxMxxEys1IAFuJaB0Tk7A=;
 b=gwMr3SbsTIpG2B/aeKgCwO70lVsC1RPp7Mb9B5q4pdiA+Kibqb7eMP8Q
 vwx1fWV81tcshfhdWv2y5MwcHU2dGykU/AAPrXAhpTN8CA5Jm8lMfOR19
 d5Nf5Pswk01z3KK02qwAuuxe4ripQfWL0AMhII4YOSLclQTIRhHJ/4kn7
 eumFYZo5UWFzwK9wzOxkJFGwDGOR3Jw7Gi8USJG7pTiun9CMRTm7NKXOx
 ibEHpnDF1hjTc2MLja4g+zU7klQpa8davaocH4jEhZYEAPYsq+bzehHKV
 CpjXP6GPJjI/uDnc9ficHiPkkOkAknv0y0GJ8R6xDLB34QH9PZrLL1E+f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="300704332"
X-IronPort-AV: E=Sophos;i="5.96,269,1665471600"; d="scan'208";a="300704332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 10:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="645636767"
X-IronPort-AV: E=Sophos;i="5.96,269,1665471600"; d="scan'208";a="645636767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 23 Dec 2022 10:28:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 23 Dec 2022 10:28:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 23 Dec 2022 10:28:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 23 Dec 2022 10:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgzQlJLVdGkBqlQc9AtLc/WMiZ+DPbK8VFslrJenTl7wNCKLwXEPmEPZ3PEzUux30c3cMHUGiYjWgvxe7w9Y0QDMg0Y3PWS2wvgvWh4te+gjg1zvOwP4f9G0cgffCnFZJpHBWEJxwgqMQnldlrFdHfQoertgAGSxSUjzX86/oANQ4iVI++1MkS9avrGkpUahkZ44CovCFAsHVDVVE2VdwyyWvqExmrOhv+43HHt058u4iv6THjf05lER4iGH4iMwxxqFFnKxdnHKN+QQxdQ4R6eEdC5RzsVu+G45Zpig9YTmR2sLhJKPQYJg3EqM6oSVhPzmqg36Vg7qYVYBl6qfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk6HQXdLJNRQ4pTzw76afao9A4jCHccSLgumWMlecXo=;
 b=YmlRBMbsuTu6WflnvhpLK2tWLRvb6gtXj8fFD5L6159XKrdkRzJSVvsUH8wiBAiSYdH+iLAgd94qizdJBkNWBn7YRzVJV1wNkrgTjHoSfyR5Atmq+tYaPd3KjTEkpPLmB/ItE5LeRwbSyM6kkOmkjosno3o2rOV/0AWldXeCSLp0dGM8/+Ajv8gaPieR30aGU6nWF2qy10Sc/67lJfTgswkOuFt/yFRIKQH9hdk4SPeDj+6xnYq6SoVNv/LuqVDV06mdKVjyFepwLmLFbDBYqYQhPF2dy5jzvV0cAScHplwcHr5/t9Bl4kiPsDKO9vT9jiTo4GD/2zIGUoIJwdqPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Fri, 23 Dec
 2022 18:28:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5924.016; Fri, 23 Dec 2022
 18:28:10 +0000
Date: Fri, 23 Dec 2022 10:28:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Message-ID: <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da26e4e-7eb0-4838-dcea-08dae5137173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOIrfBnhnsPiuV6TqObtZNMJsL/I71S9r56OMqtkpo2rT/29x2sYfxpuW1KUUiaFb0XmjCpPdv7NYB7IKjteNFAq8Xp7x0bTfkDJj0+NQ+LAyFFN3xXLc5QLE7OD93pba/ywoOLGLk8mLG5KLVG/ZClWUDQhW2lxOWiMMB76RW2yIUESlCCeB1tOjROiKW6HUH4m4L7hUS+MH2R0uP3iLsG4At8K8MbcM7UpuIGFHi5N7scnwssVm5O+xFrJwj74OxMO7j7KvD6Mjq8Em+FeRIXdpz2dicm4fWVyiWGwvDhzxaUPZkKiRSPGGIFjvPZzoSRZdSt9ybEtTf5fwAA7/l9umlhSCyzFb64pS1gfbctSIAumGkTe7w2Apo388ybrhuOJ5R3E6+v5bLaZJzmOq9FUY8whgJ1W0R21K3AKRN1YS5MGMD5/ol19eBagG6diUhQn7ndvgVxRgtVnJ3UEXCwnlgjMgL16/h29Xj+CRVnrjbclzF9s0+lGML9UipV6HKWICtk/q45kGCWn6ENUvyTtW2vN/DzIK+7RlxuRVWCnzpiVWyPTBVvm8b85gi92sq0oV68A+EB3nYREMNVeMeyZU4H4fzj4zvvoijNOt4VVh/DXVwyGyl6n5O0gCaXGDyfZn3WUTWzGmH5grSy+OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(86362001)(83380400001)(66899015)(66556008)(66946007)(8676002)(4326008)(8936002)(66476007)(5660300002)(316002)(38100700002)(6512007)(26005)(9686003)(36756003)(186003)(1076003)(6666004)(6486002)(41300700001)(2906002)(82960400001)(478600001)(6916009)(54906003)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BgEm5EEy9Vnzch1aavsb8T1boguqDS96jkWZsAtqsJHfSMJA7pCZ8hvcWM?=
 =?iso-8859-1?Q?GWwX7VvEsp8qIgyxy2QEl7W5gHyvUVYJPEeia3nJmdYU69qLfikslR2CAX?=
 =?iso-8859-1?Q?M0aKTAsFJKYM5b+NFCDY/15iEZ2r8EUg8esD+LgKmm3slkkVVpa6RL233b?=
 =?iso-8859-1?Q?wj66ClnN9XWroEH4Futb4nRmUY5Cgb8rtuECPax3HWbGi7YaXZFyQSnhPW?=
 =?iso-8859-1?Q?dVQZaiRx6sacYiuyczXz+/bV3z4AD2kD5UKYbJHWgW8/hCRAQj7tjQ+8wF?=
 =?iso-8859-1?Q?rC+vjlMwvFglNXZIM/7JNkbR8StmuM5Su5DXxzvtgVCmeKkLFu54NTI9PB?=
 =?iso-8859-1?Q?dj6JkwoRtxfFhXjEvUlVtaoVZgnWj/xOy2GBJ3/XJ77hszsDtwtyt64rQP?=
 =?iso-8859-1?Q?JT3iD6WzSbTB2KvhCL1IVAX+7aK66Hopjq1l1uo+2Lp22vEvNAbm/BffGD?=
 =?iso-8859-1?Q?q/X+60zRPn8fgDN4BSphwfPaU3ltNdGOuOkyvSoK4MDJM4wDfu1y77AcWy?=
 =?iso-8859-1?Q?X16UzcjvP9GZ74SJmym94evIQfF2ffVQLiccXFJlNpItnksTtuwX5fyPWA?=
 =?iso-8859-1?Q?x8fodHVN+Qmg/M6LTFGHS4GeJozWSdxZx1YQ5D64FSrMMinECAxxi2Ge7x?=
 =?iso-8859-1?Q?tNuGPDigKVRfU1DEAGbHqmNrOO6H++bv047bMwUKL+mYu5dfKXouM5FZQj?=
 =?iso-8859-1?Q?1dE4SdyEcdaQQNEwlhd/RRqj/lDRfBZckcjNfC8Ob7ANTYxAYlFJL6qRqh?=
 =?iso-8859-1?Q?2VMvr3EM1E+fKQUAx884e5M0rrje8+Z35tm/rPDYFQwMLAV3/NULMXrr6E?=
 =?iso-8859-1?Q?w/abC8kdC/fWIQbAyAxqyRnYHdf+P1mWuyUaFxuuRQiavmp/3ds64VG9OF?=
 =?iso-8859-1?Q?jaHasRrCJ1VvhP3YwkWEHx49wNhJS1We3899dKA6UZlMtIBoScuTlNZXBT?=
 =?iso-8859-1?Q?XDE0QinOXGMReEZL+v/zo4tfWBCJFTcFBC7bUQkpJRSaFiROTepPTv5E2g?=
 =?iso-8859-1?Q?wVDU0Opbnb6mxBzjbQ+PEEbzdR1+DcgPMNE6gcRcz1QBy5BZThblBwFR1t?=
 =?iso-8859-1?Q?pTu/+7eFATzdYCkIqQeqsR82OiNBq8CXMSnvBjVj40ojL0Qsu13SXTI6In?=
 =?iso-8859-1?Q?0ZIfJArBij4B5F5w85O3zQMRrlqgH6w+2mT5oRWjeAC6lOrEHZ2Emzh/FI?=
 =?iso-8859-1?Q?nHahZhFICgNMYoIKdkXmy2sHDyWOTVa9QTCzzlgX7q2Lgc/lHSxQ+inoqr?=
 =?iso-8859-1?Q?/IZDZTlH8a/8XarjsHfYR+5NGsEPLycvp/IGWKjkIGQie0kD1yw1naMRMH?=
 =?iso-8859-1?Q?6jPwAbsicDv7J0tRj0lO5S0dDtOp/7RGdbF3gXFoKYdvs7J3NXHnGKTekW?=
 =?iso-8859-1?Q?qbv5GH8fC053EN2++lXlSHvhUC5hVu4cycyFQEBv/RZlC1L+HnnNMWP13/?=
 =?iso-8859-1?Q?ohtEfjs2YAdSjSNE9xZQwgN8BRSP1Qg79VRh45rsyiu3PnfkDNrTfJgwx0?=
 =?iso-8859-1?Q?XX23DUCSujuSHF14LGpoHDVaUpIW9wuZLtJPyfDIhCQcymznn7oZZieQYz?=
 =?iso-8859-1?Q?nuMbM/rYICWHwkSaVjQ3vj/upG+HdB2svyGmjT126yiFeXO2SfnLpFEFLK?=
 =?iso-8859-1?Q?hdOD3M4TOXD/TGvuqNaaxDoMTvUnWAYzvmWwRm6X+7c8qXcP1XnDiPCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da26e4e-7eb0-4838-dcea-08dae5137173
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 18:28:09.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRYq9kom0/TmQKpd8XTID534LRW1903N07FSztL6u5IvEucs0AOEjnlHK6jZw9K+thgGnzWVsQyvb1lrAkUoGVmwDqaMqmBGNnMK2AOBLC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
>
>On 22/12/2022 15:55, Lucas De Marchi wrote:
>>On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
>>>
>>>On 22/12/2022 08:25, Lucas De Marchi wrote:
>>>>The comments are redundant to the checks being done to apply the
>>>>workarounds and very often get outdated as workarounds need to be
>>>>extended to new platforms or steppings.  Remove them altogether with
>>>>the following matches (platforms extracted from intel_workarounds.c):
>>>>
>>>>    find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>'s/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
>>>>    find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>'s/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
>>>>
>>>>Same things was executed in the gem directory, omitted here for brevity.
>>>
>>>>There were a few false positives that included the workaround
>>>>description. Those were manually patched.
>>>
>>>sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
>>
>>then there are false negatives. We have Was in the form
>>"Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
>>we simply don't see. After running that in gt/:
>>
>>$ git grep ": mtl" -- drivers/gpu/drm/i915/
>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
>>drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
>>
>>I was going with the platform names to avoid the false
>>negatives and because I was entertaining the idea of only doing this for
>>latest platforms where we do have the "Wa_[[:number:]]" form
>>
>>>
>>>Maybe..
>>>
>>>Matt recently said he has this worked planned, but more 
>>>importantly - I gather then that the WA lookup tool definitely 
>>>does not output these strings?
>>
>>Whatever it does it's true only at the time it's called. It simply 
>>tells what
>>are the platforms and steppings the Wa applies to. We can change the
>>output to whatever we want, but that is not the point.
>>Those comments get stale and bring no real value as they match 1:1
>>what the code is supposed to be doing. Several times a patch has to
>>update just that comment to "extend a workaround" to a next platform.
>>This is not always done, so we get a comment that doesn't match what is
>>supposed to be there.
>
>Tl;dr; version - lets park this until January and discuss once 
>everyone is back.

I'll leave my comment here since I will be out until mid January.

>
>Longer version. I've been trying to get us talking about this a couple 
>times before and I'd really like to close with an explicit consensus, 
>discussion points addressed instead of skipped and just moving ahead 
>with patches.
>
>References:
>  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
>  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
>
>So point I wanted to discuss is whether these comments are truly 
>useless or maybe they can help during review. If the tool can actually 
>output them then I am leaning towards that they can be.

I consider "can the tool output xyz?" asking the wrong question.
"The tool", which is our own small python script querying a database can
output anything like that if we want to. The database has information of
what are the platforms/steppings for each the WA is known to be applied
*today*. And that can change and do change often, particularly for early
steppings and recent platforms.

>Thought is, when a patch comes for review adding a new platform, 
>stepping, whatever, to an existing if condition, if it contains the 
>comments reviewer can more easily spot a hyphotetical logic inversion 
>error or similar. It is also trivial to check that both condition and 
>comment have been updated. (So lets not be rash and remove something 
>maybe useful just because it can go stale *only if* reviewers are not 
>giving sufficient attention that changes are made in tandem.)

I can argue to the other side too. We don't have comments in the kernel
like

	/* Add 1 to i */
	i += 1;

This is exactly what these comments are doing. And they are misleading
and may introduce bugs rather than helping reviewing:

	Wa_12345:tgl[a0,c0)
	if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)

One might read the comment, skipping over the condition and thinking
"ok, we already extended this WA to B* steppings, which doesn't match
the code.


>From a slightly different angle - do we expect anyone reviewing 
>workaround patches will cross-check against the tool? Would it be 
>simpler and more efficient that they could just cross-check against 
>the comment output from the tool and put into the patch by the author?

see above. Someone cross-checking the comment is cross-checking the
wrong thing. As I said, it happens more on early enabling of a platform.

>And point here to stress out is that accidental logic errors (missed 
>workarounds) can be super expensive to debug in the field. Sometimes 
>it can literally take _months_ for sporadic and hard to reproduce 
>issues to get debugged, handed over between the teams, etc. So any way 
>in which we can influence the likelyhood of that happening is 
>something to weigh carefully.

yes, that's why I want to remove the comments: from my experience they
are more a source of bugs rather than helping.

>Secondary but also important - if i915 is end of line then an extra 
>why we want to rip out this for ancient platforms. Is the cost/benefit 
>positive there?

yep, here I agree and was my argument about using the platform names
rather than a more "catch all" regex. I think doing this only for tgl+
platforms or even dg2+ would be ok.

>As a side note, and going back to the question of what the tool can 
>output. Long time ago I had an idea where we could improve all this by 
>making it completely data-driven. Have the WA database inspecting tool 
>output a table which could be directly pasted into code and 
>interpreted by i915.
>
>For reference look at intel_workarounds_table.h in 
>https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3 and 
>see what you thing. That was just a sketch of the idea, not complete, 
>and yes, i915 end of life point makes it moot.

now that xe is announced I can talk about this part... this was more
or less what I implemented in xe: it's a table with
"register + condition + action". There are the most common condition
checks builtin + a function hook for the more advanced ones. During
binding the driver walks the table and coalesces the entries creating
a per-register value that can be used at the proper times, depending if
they are gt, engine, context workarounds.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
