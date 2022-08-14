Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E25926F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 01:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43C18AAE4;
	Sun, 14 Aug 2022 23:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435F8AAE4;
 Sun, 14 Aug 2022 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660521110; x=1692057110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DM3tfDWlaLEZP35cB0LVPWLoXRu5SIrT1A56Z25z1GI=;
 b=UvcEQrpu6+gFyTyS/WGAYiZdUrD3xmA5gx4opiKFi3IRERImHQCHzD2V
 7BDRwJ0515P3F92TYipSZKpEl1w1V0wTWNDRuIoVr9OOsFYpnmfjIEURj
 T58LsQfJ8n5jtZcXQmxR5Ze2DSZKd7cESeL7Udfc4CDrEWVkIrG7lKD+A
 qOYkB8HjQdN5rOl2rd2MaaQ8fnVgvMgkYJNakDwh++ecU5Qp1f5+RQDGL
 8dBB9vn78IZx57VYzSFUPm3eu0fnI0NY+EX75WFW93o/UGIObc+6gm4qI
 GXbYwOxOq1M6jl3kIlViCWmhHUIK+019U5L2LVXVinDzNa2zjU2Z/B5ib g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="278818447"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="278818447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 16:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="732765272"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 14 Aug 2022 16:51:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 16:51:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 16:51:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 14 Aug 2022 16:51:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 14 Aug 2022 16:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgmzCJQvAGBEOdZU2VZkd33B12ohf0e191e7SqLOCVycOLz/GfrB48EE1io5t06vykXkOCi8GqGUi7DlOsKt6izvHFk8RGPZluv634Hoq9Xu5Pfxxr9RK7lw3N1Xp1TFV18jWKSEQKAx4/fQkUD9t2NmPC3Fe8OjiGN4gidD8P6gyFumUdG/YVBYvS9FWso1bAHNzixIbbkeSYN6PJ55z2QbXN3/ABS/EMOJwKDFwBNYLJ7Ft9/D0QdjYVKxoVGoAcqrj5Lsf/JeD+dTy/wK25OizJtLUhyh7+ZWmRmVN0EkpUOk6KRquyCzdoexZoVhy/CaA9vilPxdxpfUebrEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub2anq91zp5DSevL3xVczRK6s0q2Y95rVQD83vOuVxE=;
 b=LJXwiC8ykHQxvRUQOedXL4ThK06fluOTPGG/qXp1Mx0LDiDtydK5aAoy62GqpiDgiVqJQLzucYMAhFa4YS0VGCa8sRVmFj8GzQgJD2iH9xw7NYDgVUjFagla/cMFIDbZdR8c4uWbielNxbVuOgXeKEKMox8tnJ83EoGrRHg2qcZXK2ziFzEqtaHIKlcjSo06c+4wwpAR+CMCnsFU3T8c4bieT5k1USQ4HEIz1nF7FHp1v/YTMqgiWZ0Z5vi29yocQKbWNZ4y2EWggkF+2TH8G0sPMtJCdVwcpoJiTBzjozTbuALOAKjs5Dgwf+QOKHcUozjwuDY731tP0cx7JIWK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BL1PR11MB5556.namprd11.prod.outlook.com (2603:10b6:208:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Sun, 14 Aug
 2022 23:51:46 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213%3]) with mapi id 15.20.5525.011; Sun, 14 Aug 2022
 23:51:46 +0000
Message-ID: <b932fee2-2104-b497-6ba0-42094541b9d2@intel.com>
Date: Sun, 14 Aug 2022 16:51:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b478d3-d000-4d6b-1336-08da7e4ff289
X-MS-TrafficTypeDiagnostic: BL1PR11MB5556:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KR0k+5X42WloFhL6mu1dMxYQ1kxl0W+rjiuIxfhZ6MpZhbPkT+9OQ+YP8+HWkcuQsiMtVslJZNO7q9YdwM8DEq8J1tA7UeTsQ9vi/5RDjWE0zfx1Nd7/QUop69S8Ojh8fFsuBSc1kJ2D52Rbl68jJAJF4u/wVn7f2orYP3fqKCstUX09hMHwZSic6YBKDZzPJSCo5eSAUnAZlucFODNQJ8I/ZPhDvVlFxX1UNw2EYRqBtcyPOoS1aX/bym+hRVhOcj2J0W40tNX8ecWw5OHiXkYqAPTvZhgbF5YywYnHaKfB9q5mV8MzV2HqWMKSLcPQmoqBhDTqBB8zeLpyozGO8ch//o1gGNRH9xIVmV8+2WYI8EYBaGXHqR+xiIHwfyn+CUEq3FCQxCfbopjwwgj68Ne3yXxh7oYwYXDQkck/8S4OPt2J1PknXXrRre/bH+EbtAYugGHuKhmD3AKdZgPXBn/2vsPTKiSGDg/tKoYR4ON4IU1o2fySTPfznrYcP12kjLdU8bu1zkPWWyPiqNxK9XeH2DVTFrIwYooCyTrIqBhXOH8HMkyPGmTcGi6jjn8iu5ekmiRGNyCWxOrOxCMLIpDBHR4Rco7LiXtV/ukeIwlYs4xpFSyS2iJix/6kK2fZNpMnfYb9KmVh08BR5Z4Jhs6oW9/wdKEvgEp1oCMD5Zcu7vae9ofdO1F1K3hZ3rbdXbT8DA2pq5hFqM+sT0vet3dzPjB1kHrZcCkXRkq6qy//pGOf/f1hsF3p6nnmyf1Wt3E0gE1bC8Kh6zusnvPeZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(376002)(396003)(366004)(66476007)(107886003)(316002)(4326008)(66556008)(450100002)(66946007)(8676002)(8936002)(2906002)(38100700002)(82960400001)(5660300002)(31686004)(186003)(86362001)(41300700001)(31696002)(6486002)(966005)(36756003)(6666004)(6506007)(26005)(6512007)(53546011)(83380400001)(2616005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3pUcjd5S0xXb01hU1RyYVJpSmZPZXFWQ0lJNnBkZWNhZllaaXRMaHB3NlRU?=
 =?utf-8?B?NzFlU1VIeno0N3FrVzJVSkF3b0lrNUZUK1ovdXBqQnd2K2ZuVHJxQzFZOXda?=
 =?utf-8?B?dmU1b1NoMW9ZQ0lUWjc3ODM0bFU2azhqUGs4T3JrQy9lRkhlN0RZM1lxY3pR?=
 =?utf-8?B?czBmVStFSDRQdWsxSnFaNklERVN1ZG00ai9zVWR2Q20wbGdVUjZHTTVUVVpL?=
 =?utf-8?B?Y29VY0RXZTQrTUI5YnBCZUx6MzRvVElYdEducytKa3c0dzdDWm5MZ2o1K3Nn?=
 =?utf-8?B?MUhlblF5SG04V2s2TXZaN0kvaFVDWmdxcEM5QXhJRG9pTCtkYm8xV1RGbjd3?=
 =?utf-8?B?cE1Cb0VoQkROdFluVUwzYnZhTzRsb0FoRGpYWm5wRmZIZWZNNnVmNFlIVGJB?=
 =?utf-8?B?WEQ3eW1LRlZlT244MHR6YjdIOUxoSjBhM1UwcEZzQm5uNkNhdTZHMndGWSt4?=
 =?utf-8?B?UGpUcHVFaEl5Rld1WVpGb3VzbzMxNFdrNjQ1b1lYRnhSZGJoK2tYTlNHVlls?=
 =?utf-8?B?ZVErRXhwcTlCWSt2YWsvc1l3WTRhNlJ0cUlkMlhOK1hORUsrdUdoaXlVSDVB?=
 =?utf-8?B?aXUzazJEL3IxTDY5Y3kyOXU3OXFFd29ydjRWRWJIcDNiSlZaSWZNcklEdlZN?=
 =?utf-8?B?Yys0dWJOc3p4NUgzbnFwMVlTZFZZZ3RpVDkvNjZXd2RTOXhEYzhnVVNQUWth?=
 =?utf-8?B?N0Z5S1ViaTF2Ulp1cUNnaFl6T2hkZjlQaDU1OUVVeGs4RzIxQlViNHloOElL?=
 =?utf-8?B?N29uOUZCbmhOckwzd040emJ5Vm9GTVBuMDIzTkUrVVNSekhlMW9mYjd1TmE2?=
 =?utf-8?B?Z0RFdldnUExWTkRmQ3FjMGJlb1oreXEvKzdmd0VhSWZNNHhwRkxBczdTWUo0?=
 =?utf-8?B?QkpoeHlvRHNUNzZjQ2FpTzRWN1o0cTd0b3VoWDMzb1dBbi9ONzIzTzJJTUtQ?=
 =?utf-8?B?U0VPbWpDNmUyR1ZlZmJvZ1RGWkFveGg0c0p2bm9ML0Z3N25tc3daWmpNUlpC?=
 =?utf-8?B?eXZCViszZTBKdkhIekh0M1hVRXZKUElGZkhuR2o5ZDI4OGx6dTJ4d1UreDZI?=
 =?utf-8?B?UWQ3VG4rNWtlZ2NYRDduV2JjWmpEcndZcElNZWJnVTB3L1ZOdzlJL21pcjRj?=
 =?utf-8?B?SE14OG14cnlKdVVjYzh6RzdCaWNCdlZ3OTRWTnBPUC96S1pyalpRekxsbjRi?=
 =?utf-8?B?UmhYbDhMV05HUisrNW9XcS8rUXlJVG1RR0toRS85YXF5cEVoTlpkclhhR0RU?=
 =?utf-8?B?NFdiU1k4Wjd6WGd2LzNxa0k1MlFabGpCNDRES0VQd1pXaWhUTUpxRGxnZDFt?=
 =?utf-8?B?S2FPZXN4Y3FNTUZ4V1lHOFAwOTV0WXdEM2x0YmJHTXg4cU1hdlRNUzQyYUZ1?=
 =?utf-8?B?MDFvSkR1YkNZak0vNCtWaXM3MkwwSG44bG1rbDVJRWQ0ZERxbFRKWW56S25L?=
 =?utf-8?B?SW9tcS8raktGSEkyeW1aa3c1blhEa3ZjYnBCSGx2QjBDVkpLL1F2RGZRTkYv?=
 =?utf-8?B?OU5aZW9BQkpoSnJBbTBLaWRVN2FUbERGTGxqSzI3UnpFVWxTQkthK2Y5SzJC?=
 =?utf-8?B?RHB2V0t3a21CRWpGM0J3eXN1bC8vNUpsQVBjZDF5Y2xqY3BQM2g0aERGMU4y?=
 =?utf-8?B?RUo0aWhRWG9FMmY5eGNha1VTNGZDL2JsZ1Z3OCtvVG9Cazk1YWRwblhlSDN2?=
 =?utf-8?B?ajB4K2hBOWNKMHl5SEw0UW1DdEFQNEVUNS9zdXQ3RkZ6Z3EvSktMVFB2Ykg3?=
 =?utf-8?B?WDhOdFFnZmdrMWR6bjVyY3ZUUkdEVTFBdDdLRWxDNWpvRTd4NHVGL2IyNStS?=
 =?utf-8?B?Z0dOOWxySGU4OVFhSUduN2pEMzNUK0g0RCtmR2JoclF6UVZsbVZHREU3dWNJ?=
 =?utf-8?B?ZVp0TVgrbUVkOUEveW80Vlo2WXNEbnBlL0tKVzJDdnc0MFBncHNKUGxzckdT?=
 =?utf-8?B?WUdHbm42ZjIxTE0yd2VERXB5ZEZNeUg1SlZnUFd3cUFsRFI2R1RMTC80UjI2?=
 =?utf-8?B?MkF3S3gyaEltRGFyNUw3b1BHWTVNQU5xUHZXMXg5eUFlWDRBZW9SMjdpcDE1?=
 =?utf-8?B?S0x3cjBVL0I5WnRlSUpmZ0NNYjhuMWo2eHI5YjZCemxuN3hLYjRwM3p3blJs?=
 =?utf-8?B?N203VnE2a3F2b0xvSUpwaTJKRWoyVC9lS3JGMWpBOVlXRVM1SXZWb0RIbGZ3?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b478d3-d000-4d6b-1336-08da7e4ff289
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2022 23:51:46.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6el6r8VgB+w1A05c5tfrhKDJy4i34qm1iqWkmO/K1smbJ/+RQtxhc0CVxbmInkaDQubvCP1HwNiesa4ZK7NqA8vAtraGIyMWQQW0yIRrtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5556
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/14/2022 4:46 PM, Vinay Belgaumkar wrote:
> Host Turbo operates at efficient frequency when GT is not idle unless
> the user or workload has forced it to a higher level. Replicate the same
> behavior in SLPC by allowing the algorithm to use efficient frequency.
> We had disabled it during boot due to concerns that it might break
> kernel ABI for min frequency. However, this is not the case since
> SLPC will still abide by the (min,max) range limits.
>
> With this change, min freq will be at efficient frequency level at init
> instead of fused min (RPn). If user chooses to reduce min freq below the
> efficient freq, we will turn off usage of efficient frequency and honor
> the user request. When a higher value is written, it will get toggled
> back again.
>
> The patch also corrects the register which needs to be read for obtaining
> the correct efficient frequency for Gen9+.
>
> We see much better perf numbers with benchmarks like glmark2 with
> efficient frequency usage enabled as expected.
>
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 +++++++++++----------
>   drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
>   3 files changed, 40 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index c7d381ad90cf..281a086fc265 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1108,6 +1108,9 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
>   	} else {
>   		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
>   		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;

Forgot to remove old code here. Will do so for the next revision as it 
does not affect the patch.

Thanks,

Vinay.

> +		caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
> +					       intel_uncore_read(to_gt(i915)->uncore,
> +					       GEN10_FREQ_INFO_REC));
>   		caps->min_freq = (rp_state_cap >> 16) & 0xff;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index e1fa1f32f29e..70a2af5f518d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -465,6 +465,29 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>   	return ret;
>   }
>   
> +static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> +{
> +	int ret = 0;
> +
> +	if (ignore) {
> +		ret = slpc_set_param(slpc,
> +				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +				     ignore);
> +		if (!ret)
> +			return slpc_set_param(slpc,
> +					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					      slpc->min_freq);
> +	} else {
> +		ret = slpc_unset_param(slpc,
> +				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
> +		if (!ret)
> +			return slpc_unset_param(slpc,
> +						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> +	}
> +
> +	return ret;
> +}
> +
>   /**
>    * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>    * @slpc: pointer to intel_guc_slpc.
> @@ -491,6 +514,14 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>   
> +		/* Ignore efficient freq if lower min freq is requested */
> +		ret = slpc_ignore_eff_freq(slpc, val < slpc->rp1_freq);
> +		if (unlikely(ret)) {
> +			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
> +					 ERR_PTR(ret));
> +			return ret;
> +		}
> +
>   		ret = slpc_set_param(slpc,
>   				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>   				     val);
> @@ -587,7 +618,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>   		return ret;
>   
>   	if (!slpc->min_freq_softlimit) {
> -		slpc->min_freq_softlimit = slpc->min_freq;
> +		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
> +		if (unlikely(ret))
> +			return ret;
>   		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
>   	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
>   		return intel_guc_slpc_set_min_freq(slpc,
> @@ -597,29 +630,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>   	return 0;
>   }
>   
> -static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> -{
> -	int ret = 0;
> -
> -	if (ignore) {
> -		ret = slpc_set_param(slpc,
> -				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -				     ignore);
> -		if (!ret)
> -			return slpc_set_param(slpc,
> -					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> -					      slpc->min_freq);
> -	} else {
> -		ret = slpc_unset_param(slpc,
> -				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
> -		if (!ret)
> -			return slpc_unset_param(slpc,
> -						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> -	}
> -
> -	return ret;
> -}
> -
>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>   {
>   	/* Force SLPC to used platform rp0 */
> @@ -679,14 +689,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>   
>   	slpc_get_rp_values(slpc);
>   
> -	/* Ignore efficient freq and set min to platform min */
> -	ret = slpc_ignore_eff_freq(slpc, true);
> -	if (unlikely(ret)) {
> -		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
> -				 ERR_PTR(ret));
> -		return ret;
> -	}
> -
>   	/* Set SLPC max limit to RP0 */
>   	ret = slpc_use_fused_rp0(slpc);
>   	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index 2aad2f0cc8db..ffc702b79579 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -196,6 +196,9 @@
>   #define   RP1_CAP_MASK				REG_GENMASK(15, 8)
>   #define   RPN_CAP_MASK				REG_GENMASK(23, 16)
>   
> +#define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
> +#define   RPE_MASK				REG_GENMASK(15, 8)
> +
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
>   #define   SSKPD_NEW_WM0_MASK_HSW		REG_GENMASK64(63, 56)
