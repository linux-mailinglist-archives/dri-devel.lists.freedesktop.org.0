Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B895B09E8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E414110E7C8;
	Wed,  7 Sep 2022 16:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EC710E7C7;
 Wed,  7 Sep 2022 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662567394; x=1694103394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9mLgmii8nE1GTj5yIb1dit+vJSL7O5yOkMkdtvJsWQw=;
 b=CsNNNDtlAiiHTHzSq1SLZG4tWyblmlP9ilzbroDip7jMST8OLNrWBFqm
 aaMUJSzYEfOfo9OB6EzORgcSCSiZXUpDSq5Ks3oEdCErzTUVX7tTEhqeQ
 B6wmOW9ys3AvVeSvfgZv3DlmMZxzNJBS//1XZtDeFWtj7zcleGBayWYLc
 Nsu97lZEnh+vCCwxuNCLrea/2gQlXj3Hut+dAdwVAhuLiH4690lBnbJM1
 wkvxsaT70NaXGEhdJkxDu4KuReCwMeMr8jKLdKZBK0M5g5ccve9OkEH9P
 UlP97HsJ0qIRUBg/o1GYI6tjUDt7bmLhCJ7z3v7TLyDfnAmojpSVbiMuF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294507764"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="294507764"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 09:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="942955588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2022 09:16:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 09:16:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 09:16:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 09:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6RtG8x6NbXPnQUhc7vwvFzI9jiWpUGh9RW3CMAcLy1hEiNlXhW5ElbsA2Yr9nwEjW2/4jX0REsug2Ax+w4zhH/GHj0CRl9ykWnRUkSTYH5uMjEqPk9jcQGPLTTO1lNdwiZC/oPDySzqoJnrBn36t7jGXL7jMtSM2vihPlCccJIlg9lyzGw4er+SSJl0Q1086wrQJg6NWzOXJCqTU4kCJ6ITLKZ7guPzntRPFI417Bgwreby/CMXICue/2eLKORCObUoirNFuamiaqRUoUY61nIz2D0eMjlHCB8LvicQoZiVfqNtjnXQKdA/6dyc+6IcDJN8lXsbsIK77AsjNywPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm30cPR9qXGav7+nk1KAbRBIXnlGcRQstSoKYAQx0e0=;
 b=ihLNcIWcTK3MPXb9NPJwx9LtRKudptmup3JOXmazMwYqKD8sglLdlH/ZtjaUEPwEYzrSLUasVYGxRhmAzWJt49hBIuiLB/MhVE18ryuetv6IRV7X/lJDsIWXTW3DkXpyKgeGYSiE4eyrAXpgywGOn12yXg7QmUSU3W7WF+RxeJGFxuZmJEvb1ett+ltZiuJR6U3E/t7W/wTj/yAaRGxNyXo29Rzo+4ZA2a1vOSe8NdOKanQkXEMlwLF+uszsreyrZug5dOS/iwkbnntK73C4Nfb24D02YEDz1pPNvARSgTCFN5JBCjSrP3B0+3I9PtpzJv4dnuQPeIEmtcCYgz/77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM6PR11MB3307.namprd11.prod.outlook.com (2603:10b6:5:9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Wed, 7 Sep 2022 16:16:31 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 16:16:31 +0000
Message-ID: <c82350f1-95ec-7dbb-22a7-c14304b862c6@intel.com>
Date: Wed, 7 Sep 2022 21:46:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v3 11/14] drm/i915/mtl: Add gsi_offset when emitting aux
 table invalidation
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-12-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220906234934.3655440-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::10) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20ae8d9a-1bfd-4004-5f02-08da90ec5338
X-MS-TrafficTypeDiagnostic: DM6PR11MB3307:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ta/2Jj0Fi94J1eZb+41T9oYJzvBKbHtanG9/9TXBu0RsTlsjo10mfhfBqm6vm9onRbOUJXeRv8JLk3xDmTUtCMcT0BoSZMyRmPA44mM7ON2UPJL4+Zx9QNSoavaQanlFtvrUf70ep/MKicFtfMxG6yH/CyhJbDQs2nhstifuBHzzLIYtOANtSR8vbQ+gFgzGXehGBJYC1D84s9JyRwYTG9HoBzsUNtaj99VRwaEAnSZ8yxOxoAQKHGcBzM70OFKPVobMeev8uWa01g6Rat5vASaeKQ2PfxbORR5Sh10m7feED4vkrtZq0S2ICmgniRGPjbXIkaPd1y/9lJsel3p0ONtGx0An9iqJS3YN7h4KEBMvhFmCx4FktV7vU4rg/yV2Jsn/nGxRqYJYTDGYUFMWyy6BIXQoIz7qjNHh0wcKXtnHvetVs/QCsadgSdFxIv+0bbMrs5K8yJZKgBpwXR2e4S/gH5Ry+QdRBB+z00yab/s7MuCbuD0kVQ6+gX4C9FvsponqUChwYEKyEp0RpQSD1GGtuafSiSMYwGAuZ7t/4ern4sXLGnfByqp+3pCaXb0Y0EGCqofgxzmVJvZEbfR+6bIE5mrJr701jYOvtzNhS6Oh4sueOBcxcvI7dUR38LsPleVvwhi4ZBnC+POu1c/aWCST/ImHnxQgkPLvD/MPSlpmGKuxNM5iLm7b3W/Rydot7V2fAEPAF1REo2GjXMx0PI2pc0YidO1o59aYSaMZLL7DDHEQrFjOgm8koKHETwddtlAzf3NPrQEHwbmfXA43nXBxugCTIhb24Pyeyvok3i8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(136003)(346002)(396003)(366004)(6506007)(6666004)(26005)(2616005)(2906002)(41300700001)(83380400001)(6512007)(53546011)(186003)(8936002)(4326008)(8676002)(5660300002)(66476007)(6486002)(82960400001)(66946007)(36756003)(450100002)(66556008)(38100700002)(86362001)(31696002)(478600001)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVkwUlhxdGpwNmg2WFZCd3NyZWh3QXRSTS8ycEJUckZXbEx6QVYvRFIwcVha?=
 =?utf-8?B?QnUyNFltcXdaZDVKbzFLWTlKUmpOLzRhZFliV2V3RkZaTlp1Q3Q0VU5BY2U0?=
 =?utf-8?B?c3ZOaU52R01kSHlWb0NFTTRrUzhrYlFPK09hL2pkczhYUU9jSC83emsrUkh0?=
 =?utf-8?B?NnFjcTRqc1Z4L29STHJRQXZ0TlBRc0pZaTZ0b21tOUJySzVCWVVJbUdJSGNu?=
 =?utf-8?B?ZTAyc1RmT095UU1iT1pvaTAzZGo3R3E4eXZ1bFBMb280NFBUbnBiSFNLdysr?=
 =?utf-8?B?STlGOFp1U25LZC9tbWFnakJhRTk2Z2JtQXhRdi9SSkVnVEZzaUtLSGRTeDl2?=
 =?utf-8?B?K3RjTW9ZdmVab09Zd1VSVDYxWlZqVThvbSt5SWpWVWlPclEvbkJCaUZ0N2lm?=
 =?utf-8?B?K0hlbE00eWdKSVVLM1hVVDhIWU5PZ0Z4VExXZTVBaDdJMkl6Z2ZnaUtRV0lK?=
 =?utf-8?B?VE00d1VOYm5lYStLQWd4cUJQTjliY1pIMzh2YVRsWmlyOWZ5TGpqQVprUWcw?=
 =?utf-8?B?dlBpR0xHS3R2MkZDMHlZcTNwSU5tN2gvYVRTQUJ1QnlpSlU1ZFZkRVdmdzln?=
 =?utf-8?B?bzBPaVFyeXNMMjlxMXVWUGRTQXd3VVZKamszTzJkRXVJZEYrWDVvVmRML0Ja?=
 =?utf-8?B?Z0tDWHJmZkJCczRybGJJZ2h1Nms0cjJLV1Y1OVRlTks2WnVlOWdROTZoSWJB?=
 =?utf-8?B?eHlNM2lmaGJKZ0RCWTNyRExJdWI1SFk3VDNPbjFxaE13YmxaanlyM1JlZW15?=
 =?utf-8?B?Mk55RmNtNkEwQ2o0ZjhkU21JQWN1M2Z3Vk9tL0hGWFZEVDMrTmR0eG5xNVJG?=
 =?utf-8?B?ZHBrY1ZCSXFZRFJVV2k0QUtkditUUWwxVUJCM2RpekhBTEY4RWNYZE5QR0ZI?=
 =?utf-8?B?bXdyeDdSY2JIT245NlZUWnNCR3hiUmd6dmpvQXZ0VDFicFVuSjJhVjV6My9G?=
 =?utf-8?B?SHp6V0R2amk0OWNsTG55cUlhUVNKVVRvZFN2N2pjQk5GUTJiVXdGbXl0dVBq?=
 =?utf-8?B?TVlsSjlGRlBYcVhKeUJBY25uOFJwZi8yVGdtNGMzMzB1N2thUEVMenM0MVJD?=
 =?utf-8?B?MjIzVEFFMy94ZWxlQzBPUEtlWWtTeXkyWWwzS3UvWGVyNlhOa2ZZdU53NDBu?=
 =?utf-8?B?Y291bkNtZjRRUmJLR0s5eDhMbzhwaUJNNUVVQVBqK1U4OERNQlQyUnZJL2I4?=
 =?utf-8?B?VllNZ0JkQ0xJaGh4NUorVG95dDJtbzdFTnZza0laaGFBTFBLVXhSMjlKY25a?=
 =?utf-8?B?Q1ZDZ05STTNuNjJuN0xQdGI1VDdienBHMzllRXdPbGZFTlovVEQvNk9SZHc3?=
 =?utf-8?B?QkVyTGdGdkRNQkQ3ZTdEdjMvN3loZ1FMMzdBRHVVTjE5SUFLQ1RVM3k3RDBP?=
 =?utf-8?B?L0c0NE4wRUk5QkVGZFJZMUR6czFnNFd4K2RBcVhJUllSWVRVbnBJNkhaNmNP?=
 =?utf-8?B?TjNaS1JjNFRveFJOMGVodHBrVVJaVTZhaVEyNlBjTWpqVW4wQzBiZjk0TWxG?=
 =?utf-8?B?ZEpsQlg5a2d5VUJUNExEYldubE1KeDQ2OHdUVWdIRUhmNkxkSHlSZ0tRUmFO?=
 =?utf-8?B?OFRpLzc4bHMyN3pOR2JvdUJEbVJXSEFkL1hMd0pqNVJHSDJDZlNKR3FxSEZa?=
 =?utf-8?B?d0hOV3QrYzI2RnlRRHFNUm1hdkZmTFEyNjRyWEI5R2VJVmRSQTZ2ZDVpVkVz?=
 =?utf-8?B?Nml5MjAyY1dFYmxQSTNReXBrK05ZOWVhUWR2aFlDK3RSait0ZFhKZVBFVGgx?=
 =?utf-8?B?djZwcmt1cGpERC92VitWN3BjcUJIYjFiL3B5OFhVVFBKTXNHNFE0V0MyaHNH?=
 =?utf-8?B?L2V3ejNYb21WY2Q1eUJSQ2xWc3hFajNwc3kySU04cko0eEJ1clBNZmJnUWhv?=
 =?utf-8?B?WmdKMHZjRkJUc05jSG5zVUFkSGNqalZXSWtHcFhjNlV5ODU4N1J0M3FhMzlx?=
 =?utf-8?B?akppNlZTYXRqRFMzVTFvdm9XSmRLZmNNU3hGaHVEQVBYV2ZWWmpXaTI4QlFs?=
 =?utf-8?B?czNtRkk1eUYrUldmY0dtU2h4V3c4M0xpaXpreXJ3NHdrMEtUeG5ZT2NWQ2Vn?=
 =?utf-8?B?TVFPbCtTeVoyV1ZPZXNIQVpibDc3S3pac0xMK0d6RkJPSGNZZ1RPWG9FTUhi?=
 =?utf-8?B?RDNENDluUEdvcjhObzVMMEszWFdqeFRIQXZuRW9OQkdZQnE4dDlxRHNRcGdO?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae8d9a-1bfd-4004-5f02-08da90ec5338
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:16:31.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLcmrqUrNiHF1q4mglqpmD/P3ToPvMOTV89OhbEYt4bHU0RMHZrBOx/W81uJ7boxlxFUJD5ys9dZujVS1ZiVrzyCjR6hl8Owi8OEDVH2s8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3307
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07-09-2022 05:19, Matt Roper wrote:
> The aux table invalidation registers are a bit unique --- they're
> engine-centric registers that reside in the GSI register space rather
> than within the engines' regular MMIO ranges.  That means that when
> issuing invalidation on engines in the standalone media GT, the GSI
> offset must be added to the regular MMIO offset for the invalidation
> registers.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 15 ++++++++++-----
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 ++-
>  drivers/gpu/drm/i915/gt/intel_lrc.c      |  9 ++++++---
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 98645797962f..e49fa6fa6aee 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,10 +165,12 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | 1 << 8 | state;
>  }
>  
> -u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg)
> +u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
>  {
> +	u32 gsi_offset = gt->uncore->gsi_offset;
> +
>  	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> -	*cs++ = i915_mmio_reg_offset(inv_reg);
> +	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
>  	*cs++ = AUX_INV;
>  	*cs++ = MI_NOOP;
>  
> @@ -254,7 +256,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		if (!HAS_FLAT_CCS(rq->engine->i915)) {
>  			/* hsdes: 1809175790 */
> -			cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> +						      cs, GEN12_GFX_CCS_AUX_NV);
>  		}
>  
>  		*cs++ = preparser_disable(false);
> @@ -313,9 +316,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  
>  	if (aux_inv) { /* hsdes: 1809175790 */
>  		if (rq->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> +						      cs, GEN12_VD0_AUX_NV);
>  		else
> -			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> +						      cs, GEN12_VE0_AUX_NV);
>  	}
>  
>  	if (mode & EMIT_INVALIDATE)
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index 32e3d2b831bb..e4d24c811dd6 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -13,6 +13,7 @@
>  #include "intel_gt_regs.h"
>  #include "intel_gpu_commands.h"
>  
> +struct intel_gt;
>  struct i915_request;
>  
>  int gen8_emit_flush_rcs(struct i915_request *rq, u32 mode);
> @@ -45,7 +46,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  
> -u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg);
> +u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg);
>  
>  static inline u32 *
>  __gen8_emit_pipe_control(u32 *batch, u32 flags0, u32 flags1, u32 offset)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 070cec4ff8a4..08214683e130 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1278,7 +1278,8 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>  
>  	/* hsdes: 1809175790 */
>  	if (!HAS_FLAT_CCS(ce->engine->i915))
> -		cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
> +		cs = gen12_emit_aux_table_inv(ce->engine->gt,
> +					      cs, GEN12_GFX_CCS_AUX_NV);
>  
>  	/* Wa_16014892111 */
>  	if (IS_DG2(ce->engine->i915))
> @@ -1304,9 +1305,11 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>  	/* hsdes: 1809175790 */
>  	if (!HAS_FLAT_CCS(ce->engine->i915)) {
>  		if (ce->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> +						      cs, GEN12_VD0_AUX_NV);
>  		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
> -			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> +						      cs, GEN12_VE0_AUX_NV);
>  	}
>  
>  	return cs;

LGTM

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
