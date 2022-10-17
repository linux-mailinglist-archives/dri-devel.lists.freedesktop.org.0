Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA3601413
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910910EDC4;
	Mon, 17 Oct 2022 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F9E10EDB7;
 Mon, 17 Oct 2022 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025709; x=1697561709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0hv46s9tq5SsnRU55MX1703RaYnk42DklTc8FZOfD7w=;
 b=TgD2whSa4MxtDrQmPM7sjYy5og70Qq/mFy3sz58+UU9onZMyDSad503x
 5nqojGoxE0VcrNxxJ11Cwf/DTUpNtfdpmBTWQdH4T65ECuhqPtuzCbpFF
 4fwi/iCu+krUjko4ALN1V9XroQcb+wW1nnsVDppgRwd/hD5iwHMb4opc6
 EBH8uT4Sta40DebP6MuoKIIVBkfzqjvxsjUBLo2gO/LA4+yjVOmpT8Fx1
 GmVyvBolmQJAFepolijiOeQ7QjI4UY06Su9lPAsa3tUIY5kQ4Rd6wvnLK
 e+2u2BykES0a5ex5EYy/l+IpAA2+ZXm48MOg6NPxsuQ/DWxw2W/N2h35V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="332396161"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="332396161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="630761112"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="630761112"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 09:55:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:55:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:55:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:55:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzcxRdWp7Fgi6s2tmEa1n+Mc1T3idbmLDqKsdI46nQL857/SRuuvfb8wkX/9F3X0wssUo+p5wyHQMG7T0QZiswInrLAjpUJ2CPox7TbdisW26EKS/LyHvuB34nfcyjGGZ+2vAwi0S2Om5Ab1vNwwM1Js76Tp8xBYSut4Zt7zLHZfNLiYLMZN6vDZzCK820rdwTE7yum1Gl69y2AKK31N8gGAF5xYnxACGfMzGV/FwtthsyPMBAZCODEsSPh9G08EJQmpbtkjhQM3ZkXDwin3goIT0wrCV5thd5cJMnz1nkcPcFs83nIrevhUI1wuqEurhabG8bY4r/tUBKOKFFUZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXQJ0BgNG1l5Er0/QZRQyKnXezq9u7eZj5LWbCMX17o=;
 b=P31uJ3slhA1K6/AnQ1tUfG7Ude/J4yg7sMmT/neDJUuUfNdSP/p0xamk6fqtjbH6SQLkrezaBCPzKeCLtvgQhOrWUvB2Ro6MebD74rafPzZIMggmWOJaVdpFvjdzRyaJ6s3PAtRf16Z/jhyprRZF90tbyNZICgh8un2duZF+iZYnk2eDE6AwpjCI1NQxZFp/54Q5bHuPO2Jq7ASK6Uffsla+0EUNeEDEJGw+jgQqC7hjoJY5Ud87/OlW4fiAW3416X9bMmrbMsy6LG0J6DRryYWVQFbZ8mim034h/Qe2T9Zs0shRT8rlvEhM6lVqU1kQr9+XVG+AhK19LUNeLNLaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 16:55:04 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:55:04 +0000
Date: Mon, 17 Oct 2022 22:24:55 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 11/14] drm/i915/gt: Add MCR-specific
 workaround initializers
Message-ID: <Y02I3ytRgyrDVcqV@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-12-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::22) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 905fb607-035f-40e9-3e54-08dab060568f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQBvlVWpkkNEd6KgH3gK/VXHIff9EZfGVmpwaQRwYZj+twhyCeu1zLGGn0sSAyLxW3SCAE3wkts03aFOOl7g8yqpUZkMHLzA6k4NOc4DS/D+xzoSiSQfz3zK1soKAwuM0YD9FdBd4UoBbhJirJsG66xe3EbakZAJU6U6hpzrbj26zJpKv5glEWm0Vw3gfb2kSn7Z03nbC7UWrxLnNdLq6EsCahAujpfYMD3fBeyvYx2ORbo5YRe0d1Ag6j/RHSkTYE9/a5Plvl3s3m99Bi4HwwGbU/il+r2NjaEurAQ7VJjoeUrt665qKhxfe78T24dHPu34xr498f7UwQqhpqyvSUhxcr91yL9k8D2AuAtBej5bVTaYlO3YvptYmwTyjuUbbd3CMIov7UG2CRdzxdMDNeLMUO9xCfbQV2tsfTFT9dg4Oiig6SvGEuT1blMFdrkObKQ/ASlO3z/bwV/+Yn1pb3WCQ24kj0R8XZKVoZpmxABzzPcORN7noGUMg6upcExz5dptNHB09bcjaDvvMejqXn93B1SZzP4ZRemoh9jagrZtzX0vka/gxT4PoJefstAfy4xkinxF0XxMmLusKtAWCJobdkFPb+oD5ZX6A7ObHTMR6P5leG4blkXS0YvFy2uWiF5vOlyZ94bWKQ+0gDJsX2VjoBcT+mZi+ZjZu0Roj3MISeZhhdUYIM/iUsfYxbZKhV9BQ5Sca+Cf/jpWkcJLXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(4326008)(5660300002)(44832011)(30864003)(66476007)(66556008)(41300700001)(66946007)(8676002)(316002)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(9686003)(186003)(2906002)(8936002)(83380400001)(82960400001)(33716001)(66574015)(38100700002)(6666004)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmg5T0N1N0E2UTQzMWw3empRZHg5WmFlcHkwRVJMWkZWRXZObDBObzlKSFBB?=
 =?utf-8?B?SDVmV3IzWmsrU3BCazdTWEc2a2tWdTl0am13WExnRVZpVzJGRHcxSEhLYTBi?=
 =?utf-8?B?RVlBRnNsRnFiT21HR0t3d3B1UHIwbW1nK3I5dTRXZzR3cC9HRCtnVk9YVy9v?=
 =?utf-8?B?Nm5qd2RIN0ZFTnA2SFdVd25TeUs0MW5wY3V5TDhpSFRqWkZQcWwrRWhZVWo2?=
 =?utf-8?B?alFYTnR2cStZdC9yS0tUQkkrK1R3QlVPbTM5RjZKN0UwQURTRzhRaFNUR2dT?=
 =?utf-8?B?V2hmYXo5allweGdDanVFQXFoWmt1S0F3ZEJ3M21xaWNEdmRTcXZLM0EzVlY0?=
 =?utf-8?B?VzVDMHZkdVVrZUI5YWUxV1hFd2s5bU8vdlB5OFNkcUhHcGZIcWJxcVdrRVRO?=
 =?utf-8?B?cXN3RlAyVGFjRmpGWEpzL3dyTm1MNXpGQWdMZTRlaFZOR3FiZG5DckNXdHNO?=
 =?utf-8?B?VjM0QWNpMldQWmFxdklGMkt4NS9PN0tyUTBFS1RaWkJjSSs2WERxU3ZCbllE?=
 =?utf-8?B?bGRCWjJ4YlFmd0RiWnE2UGJsYjAyazVxSS9aRDQyU0p5WGxCaXZIMU83MHlK?=
 =?utf-8?B?alRmTDkzSjYrZEhpUTBOaklsR0xLdmRDWlFOWGlBdVpvSThYV0tLSGRDTnlO?=
 =?utf-8?B?b2lwdmNqWndIYTB3MjB3Vlc1TXFZbmp1UTdKRFd1TnJ3VldDWWI4SW9HVFFE?=
 =?utf-8?B?cHplaUNRRWJXL1ZUb2M2cElkZ2RZTlF5U2pMZnEvZTlRQU9PdVByU3YwZVlv?=
 =?utf-8?B?U0hza1FQRWo4K2g1VFVYSWk4ZTdUS3RBK2ZOcDQ1eFNseWQwdERJcUJCYnhZ?=
 =?utf-8?B?M1VTcnp4TzJtZnJXdDIweEIzdVE2YnM0N2dMOE10RmhkYXVEcjRUcmZnMHBM?=
 =?utf-8?B?bmJwcDZqdFdVZkh5TUdzZUl3Zk1vV3dFcVczazVWSUxPYVd6WVZmVlNnNkxY?=
 =?utf-8?B?S1IvOSs5a2JWSDE1VDBXVCtjalhYTHo4b1pVR0xEZmFWRmQreWcxengvSTBP?=
 =?utf-8?B?bDd3VmpRSlJRTzdsaWFhQVdRWUpmK2FvdlJ3UGM3ZVo2bGpodUR2dEJ3RDlv?=
 =?utf-8?B?TDI2RUpSeFZHRS9DREhyQ3dFRjcwNXg1RG5jNU9jYi9kZzhaMjkyVGlsWmVr?=
 =?utf-8?B?TCtRSTZNd2ZWdHpaTXBTZ3BvRXNoOHo3Wm1KNWhCMUVqeFZXbU1ZY3dTem9K?=
 =?utf-8?B?aTI4bCsyeXNTUkQ2aExGQlBDTVRxaHVNaitLdWdiOXdEQjlLcmtiT1VIZStB?=
 =?utf-8?B?UE03VldPbUVsZFBqMXo5bFZtNVB1N1BjS3dGYmRMdzJmeVBHVVZ0WVkwWlFq?=
 =?utf-8?B?RDNoTTNWZGRhaTNGdC9JQldHTnpURVBZVEpGM284WnNTNUx4aE1pL3lmT0Ir?=
 =?utf-8?B?N2NtNTFVNHl0M1VibU4wdHl4aHk2U1lWcE1pUVIxRzBhSG9wdCtsOC9hMmZK?=
 =?utf-8?B?c0E1L3NjVmk2dktzNHlUQ3BuVW5jMzlnSVlZZVRZblREVEtNcFZmRmRmcUZU?=
 =?utf-8?B?dWFGaFBmRy9LNFVBUEQ5U2NjWkx3UjBNdGJtZldKYVYwNTl5NUFjT3NEWllw?=
 =?utf-8?B?eElITHJYM1VjOGNtSWZ5TkxDSndsRDg1aldpOXM0Q2xORi9nZjM5a0EvNHdj?=
 =?utf-8?B?NkhJQk50NU92QVk1S1JYb3llY0V1QW91aVRuMzVwQWhOWlZBN3ZsWG5pRXVR?=
 =?utf-8?B?YVVrVTFXOFZXZmhxdDkxeHp6Z1gzVUlaai90NVJhNjZzWlZIN3g1UU5pNlRP?=
 =?utf-8?B?c1ZKV3JkNGFqM1BOSm0zRStBTmRtUGh4V2tELzBWakh5NnBRRzhXM2pZS2hQ?=
 =?utf-8?B?MHpnK0FXZHhBMW81aGtyQzJpbTg1Z3NYZlpXNTBLcWZ3aUhCTDVrTk00T2RJ?=
 =?utf-8?B?ck5PdkN3c3VjRWl4bXJDNm40M2IraktPWXk2K2Z4eG1FWGhweE5YNDBuSTBV?=
 =?utf-8?B?MGxyV240b1lLbUxML3VBWnRFOFF0MTRwb0lFcXU4N25oSHlobXA0OUI1MUkw?=
 =?utf-8?B?R2Mrc2ZLK0JOd1FaeS9qbnNtR3BPcVIzUTJUaWg4N1UybHBjWmVBTEdlL0ta?=
 =?utf-8?B?d0xHVjZyaExudjFLRmVVTTVPWk9kd1ZLRmswYndqTElqTDloa3FOcE5Obk9Q?=
 =?utf-8?B?KzFRYURYQkxxQitXeU5MdXlXZmRRU2hEOW8xVkUxeUlHWFhSaXYyTGt1UFBv?=
 =?utf-8?Q?GzSio+GBVcg3JdeFGjDkFxM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 905fb607-035f-40e9-3e54-08dab060568f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:55:04.7235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP6I6xXYTm1YenX7RhCBz9C2zYHlbh4iP6p4QV6gFGLixY2Giox81HF+x/oHTUKIlxztdIjTtupOr6QNBkipfpK/mgcQEbikdU19Tn+fXlyiFDSSGHocM2D60QuoB0Kb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On 14.10.2022 16:02, Matt Roper wrote:
> Let's be more explicit about which of our workarounds are updating MCR
> registers.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 433 +++++++++++-------
>  .../gpu/drm/i915/gt/intel_workarounds_types.h |   4 +-
>  2 files changed, 263 insertions(+), 174 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 96b9f02a2284..7671994d5b7a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -166,12 +166,33 @@ static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
>  	_wa_add(wal, &wa);
>  }
>  
> +static void wa_mcr_add(struct i915_wa_list *wal, i915_reg_t reg,
> +		       u32 clear, u32 set, u32 read_mask, bool masked_reg)
> +{
> +	struct i915_wa wa = {
> +		.reg  = reg,
> +		.clr  = clear,
> +		.set  = set,
> +		.read = read_mask,
> +		.masked_reg = masked_reg,
> +		.is_mcr = 1,
> +	};
> +
> +	_wa_add(wal, &wa);
> +}
> +
>  static void
>  wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
>  {
>  	wa_add(wal, reg, clear, set, clear, false);
>  }
>  
> +static void
> +wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
> +{
> +	wa_mcr_add(wal, reg, clear, set, clear, false);
> +}
> +
>  static void
>  wa_write(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
>  {
> @@ -184,12 +205,24 @@ wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
>  	wa_write_clr_set(wal, reg, set, set);
>  }
>  
> +static void
> +wa_mcr_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
> +{
> +	wa_mcr_write_clr_set(wal, reg, set, set);
> +}
> +
>  static void
>  wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
>  {
>  	wa_write_clr_set(wal, reg, clr, 0);
>  }
>  
> +static void
> +wa_mcr_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
> +{
> +	wa_mcr_write_clr_set(wal, reg, clr, 0);
> +}
> +
>  /*
>   * WA operations on "masked register". A masked register has the upper 16 bits
>   * documented as "masked" in b-spec. Its purpose is to allow writing to just a
> @@ -207,12 +240,24 @@ wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
>  	wa_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
>  }
>  
> +static void
> +wa_mcr_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
> +{
> +	wa_mcr_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
> +}
> +
>  static void
>  wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
>  {
>  	wa_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
>  }
>  
> +static void
> +wa_mcr_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
> +{
> +	wa_mcr_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
> +}
> +
>  static void
>  wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
>  		    u32 mask, u32 val)
> @@ -220,6 +265,13 @@ wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
>  	wa_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask, true);
>  }
>  
> +static void
> +wa_mcr_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
> +			u32 mask, u32 val)
> +{
> +	wa_mcr_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask, true);
> +}
> +
>  static void gen6_ctx_workarounds_init(struct intel_engine_cs *engine,
>  				      struct i915_wa_list *wal)
>  {
> @@ -241,8 +293,8 @@ static void gen8_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	wa_masked_en(wal, RING_MI_MODE(RENDER_RING_BASE), ASYNC_FLIP_PERF_DISABLE);
>  
>  	/* WaDisablePartialInstShootdown:bdw,chv */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN,
> -		     PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
> +			 PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
>  
>  	/* Use Force Non-Coherent whenever executing a 3D context. This is a
>  	 * workaround for a possible hang in the unlikely event a TLB
> @@ -288,18 +340,18 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	gen8_ctx_workarounds_init(engine, wal);
>  
>  	/* WaDisableThreadStallDopClockGating:bdw (pre-production) */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
>  
>  	/* WaDisableDopClockGating:bdw
>  	 *
>  	 * Also see the related UCGTCL1 write in bdw_init_clock_gating()
>  	 * to disable EUTC clock gating.
>  	 */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN2,
> -		     DOP_CLOCK_GATING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2,
> +			 DOP_CLOCK_GATING_DISABLE);
>  
> -	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
> -		     GEN8_SAMPLER_POWER_BYPASS_DIS);
> +	wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
> +			 GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	wa_masked_en(wal, HDC_CHICKEN0,
>  		     /* WaForceContextSaveRestoreNonCoherent:bdw */
> @@ -314,7 +366,7 @@ static void chv_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	gen8_ctx_workarounds_init(engine, wal);
>  
>  	/* WaDisableThreadStallDopClockGating:chv */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
>  
>  	/* Improve HiZ throughput on CHV. */
>  	wa_masked_en(wal, HIZ_CHICKEN, CHV_HZ_8X8_MODE_IN_1X);
> @@ -333,21 +385,21 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		 */
>  		wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>  			     GEN9_PBE_COMPRESSED_HASH_SELECTION);
> -		wa_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> -			     GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR);
> +		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> +				 GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR);
>  	}
>  
>  	/* WaClearFlowControlGpgpuContextSave:skl,bxt,kbl,glk,cfl */
>  	/* WaDisablePartialInstShootdown:skl,bxt,kbl,glk,cfl */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN,
> -		     FLOW_CONTROL_ENABLE |
> -		     PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
> +			 FLOW_CONTROL_ENABLE |
> +			 PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
>  
>  	/* WaEnableYV12BugFixInHalfSliceChicken7:skl,bxt,kbl,glk,cfl */
>  	/* WaEnableSamplerGPGPUPreemptionSupport:skl,bxt,kbl,cfl */
> -	wa_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> -		     GEN9_ENABLE_YV12_BUGFIX |
> -		     GEN9_ENABLE_GPGPU_PREEMPTION);
> +	wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> +			 GEN9_ENABLE_YV12_BUGFIX |
> +			 GEN9_ENABLE_GPGPU_PREEMPTION);
>  
>  	/* Wa4x4STCOptimizationDisable:skl,bxt,kbl,glk,cfl */
>  	/* WaDisablePartialResolveInVc:skl,bxt,kbl,cfl */
> @@ -356,8 +408,8 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		     GEN9_PARTIAL_RESOLVE_IN_VC_DISABLE);
>  
>  	/* WaCcsTlbPrefetchDisable:skl,bxt,kbl,glk,cfl */
> -	wa_masked_dis(wal, GEN9_HALF_SLICE_CHICKEN5,
> -		      GEN9_CCS_TLB_PREFETCH_ENABLE);
> +	wa_mcr_masked_dis(wal, GEN9_HALF_SLICE_CHICKEN5,
> +			  GEN9_CCS_TLB_PREFETCH_ENABLE);
>  
>  	/* WaForceContextSaveRestoreNonCoherent:skl,bxt,kbl,cfl */
>  	wa_masked_en(wal, HDC_CHICKEN0,
> @@ -386,11 +438,11 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	    IS_KABYLAKE(i915) ||
>  	    IS_COFFEELAKE(i915) ||
>  	    IS_COMETLAKE(i915))
> -		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
> -			     GEN8_SAMPLER_POWER_BYPASS_DIS);
> +		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
> +				 GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
> -	wa_masked_en(wal, HALF_SLICE_CHICKEN2, GEN8_ST_PO_DISABLE);
> +	wa_mcr_masked_en(wal, HALF_SLICE_CHICKEN2, GEN8_ST_PO_DISABLE);
>  
>  	/*
>  	 * Supporting preemption with fine-granularity requires changes in the
> @@ -469,8 +521,8 @@ static void bxt_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	gen9_ctx_workarounds_init(engine, wal);
>  
>  	/* WaDisableThreadStallDopClockGating:bxt */
> -	wa_masked_en(wal, GEN8_ROW_CHICKEN,
> -		     STALL_DOP_GATING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
> +			 STALL_DOP_GATING_DISABLE);
>  
>  	/* WaToEnableHwFixForPushConstHWBug:bxt */
>  	wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
> @@ -490,8 +542,8 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:kbl */
> -	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> -		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> +			 GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
>  static void glk_ctx_workarounds_init(struct intel_engine_cs *engine,
> @@ -514,8 +566,8 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:cfl */
> -	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> -		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
> +	wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> +			 GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
>  static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
> @@ -534,13 +586,13 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	 * (the register is whitelisted in hardware now, so UMDs can opt in
>  	 * for coherency if they have a good reason).
>  	 */
> -	wa_masked_en(wal, ICL_HDC_MODE, HDC_FORCE_NON_COHERENT);
> +	wa_mcr_masked_en(wal, ICL_HDC_MODE, HDC_FORCE_NON_COHERENT);
>  
>  	/* WaEnableFloatBlendOptimization:icl */
> -	wa_add(wal, GEN10_CACHE_MODE_SS, 0,
> -	       _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE),
> -	       0 /* write-only, so skip validation */,
> -	       true);
> +	wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
> +		   _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE),
> +		   0 /* write-only, so skip validation */,
> +		   true);
>  
>  	/* WaDisableGPGPUMidThreadPreemption:icl */
>  	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
> @@ -548,8 +600,8 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			    GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
>  
>  	/* allow headerless messages for preemptible GPGPU context */
> -	wa_masked_en(wal, GEN10_SAMPLER_MODE,
> -		     GEN11_SAMPLER_ENABLE_HEADLESS_MSG);
> +	wa_mcr_masked_en(wal, GEN10_SAMPLER_MODE,
> +			 GEN11_SAMPLER_ENABLE_HEADLESS_MSG);
>  
>  	/* Wa_1604278689:icl,ehl */
>  	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
> @@ -558,7 +610,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			 0xFFFFFFFF);
>  
>  	/* Wa_1406306137:icl,ehl */
> -	wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
> +	wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
>  }
>  
>  /*
> @@ -569,13 +621,13 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  				   struct i915_wa_list *wal)
>  {
>  	wa_masked_en(wal, CHICKEN_RASTER_2, TBIMR_FAST_CLIP);
> -	wa_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> -			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
> -	wa_add(wal,
> -	       XEHP_FF_MODE2,
> -	       FF_MODE2_TDS_TIMER_MASK,
> -	       FF_MODE2_TDS_TIMER_128,
> -	       0, false);
> +	wa_mcr_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +			     REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
> +	wa_mcr_add(wal,
> +		   XEHP_FF_MODE2,
> +		   FF_MODE2_TDS_TIMER_MASK,
> +		   FF_MODE2_TDS_TIMER_128,
> +		   0, false);
>  }
>  
>  /*
> @@ -664,27 +716,27 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>  
>  	/* Wa_16011186671:dg2_g11 */
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> -		wa_masked_dis(wal, VFLSKPD, DIS_MULT_MISS_RD_SQUASH);
> -		wa_masked_en(wal, VFLSKPD, DIS_OVER_FETCH_CACHE);
> +		wa_mcr_masked_dis(wal, VFLSKPD, DIS_MULT_MISS_RD_SQUASH);
> +		wa_mcr_masked_en(wal, VFLSKPD, DIS_OVER_FETCH_CACHE);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
>  		/* Wa_14010469329:dg2_g10 */
> -		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> -			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
> +		wa_mcr_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> +				 XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
>  
>  		/*
>  		 * Wa_22010465075:dg2_g10
>  		 * Wa_22010613112:dg2_g10
>  		 * Wa_14010698770:dg2_g10
>  		 */
> -		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> -			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
> +		wa_mcr_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> +				 GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
>  	}
>  
>  	/* Wa_16013271637:dg2 */
> -	wa_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
> -		     MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
> +	wa_mcr_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
> +			 MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
>  
>  	/* Wa_14014947963:dg2 */
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_FOREVER) ||
> @@ -1264,9 +1316,9 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		    PSDUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1406680159:icl,ehl */
> -	wa_write_or(wal,
> -		    GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> -		    GWUNIT_CLKGATE_DIS);
> +	wa_mcr_write_or(wal,
> +			GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> +			GWUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1607087056:icl,ehl,jsl */
>  	if (IS_ICELAKE(i915) ||
> @@ -1279,7 +1331,7 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	 * This is not a documented workaround, but rather an optimization
>  	 * to reduce sampler power.
>  	 */
> -	wa_write_clr(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
> +	wa_mcr_write_clr(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
>  }
>  
>  /*
> @@ -1313,7 +1365,7 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_14011060649(gt, wal);
>  
>  	/* Wa_14011059788:tgl,rkl,adl-s,dg1,adl-p */
> -	wa_write_or(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
> +	wa_mcr_write_or(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
>  }
>  
>  static void
> @@ -1325,9 +1377,9 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_1409420604:tgl */
>  	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> -		wa_write_or(wal,
> -			    SUBSLICE_UNIT_LEVEL_CLKGATE2,
> -			    CPSSUNIT_CLKGATE_DIS);
> +		wa_mcr_write_or(wal,
> +				SUBSLICE_UNIT_LEVEL_CLKGATE2,
> +				CPSSUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1607087056:tgl also know as BUG:1409180338 */
>  	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> @@ -1356,9 +1408,9 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_1409420604:dg1 */
>  	if (IS_DG1(i915))
> -		wa_write_or(wal,
> -			    SUBSLICE_UNIT_LEVEL_CLKGATE2,
> -			    CPSSUNIT_CLKGATE_DIS);
> +		wa_mcr_write_or(wal,
> +				SUBSLICE_UNIT_LEVEL_CLKGATE2,
> +				CPSSUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1408615072:dg1 */
>  	/* Empirical testing shows this register is unaffected by engine reset. */
> @@ -1375,7 +1427,7 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	xehp_init_mcr(gt, wal);
>  
>  	/* Wa_1409757795:xehpsdv */
> -	wa_write_or(wal, SCCGCTL94DC, CG3DDISURB);
> +	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
>  
>  	/* Wa_16011155590:xehpsdv */
>  	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> @@ -1455,8 +1507,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  			    CG3DDISCFEG_CLKGATE_DIS);
>  
>  		/* Wa_14011006942:dg2 */
> -		wa_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> -			    DSS_ROUTER_CLKGATE_DIS);
> +		wa_mcr_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> +				DSS_ROUTER_CLKGATE_DIS);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
> @@ -1467,7 +1519,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
>  
>  		/* Wa_14011371254:dg2_g10 */
> -		wa_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
> +		wa_mcr_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
>  
>  		/* Wa_14011431319:dg2_g10 */
>  		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
> @@ -1503,21 +1555,21 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  			    GAMEDIA_CLKGATE_DIS);
>  
>  		/* Wa_14011028019:dg2_g10 */
> -		wa_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
> +		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
>  	}
>  
>  	/* Wa_14014830051:dg2 */
> -	wa_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
> +	wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
>  
>  	/*
>  	 * The following are not actually "workarounds" but rather
>  	 * recommended tuning settings documented in the bspec's
>  	 * performance guide section.
>  	 */
> -	wa_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
> +	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
>  
>  	/* Wa_14015795083 */
> -	wa_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  }
>  
>  static void
> @@ -1526,7 +1578,7 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	pvc_init_mcr(gt, wal);
>  
>  	/* Wa_14015795083 */
> -	wa_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  }
>  
>  static void
> @@ -1638,14 +1690,25 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>  		u32 val, old = 0;
>  
>  		/* open-coded rmw due to steering */
> -		old = wa->clr ? intel_gt_mcr_read_any_fw(gt, wa->reg) : 0;
> +		if (wa->clr)
> +			old = wa->is_mcr ?
> +				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_uncore_read_fw(uncore, wa->reg);
>  		val = (old & ~wa->clr) | wa->set;
> -		if (val != old || !wa->clr)
> -			intel_uncore_write_fw(uncore, wa->reg, val);
> +		if (val != old || !wa->clr) {
> +			if (wa->is_mcr)
> +				intel_gt_mcr_multicast_write_fw(gt, wa->reg, val);
> +			else
> +				intel_uncore_write_fw(uncore, wa->reg, val);
> +		}
> +
> +		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
> +			u32 val = wa->is_mcr ?
> +				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_uncore_read_fw(uncore, wa->reg);
>  
> -		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> -			wa_verify(wa, intel_gt_mcr_read_any_fw(gt, wa->reg),
> -				  wal->name, "application");
> +			wa_verify(wa, val, wal->name, "application");
> +		}
>  	}
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw);
> @@ -1674,8 +1737,9 @@ static bool wa_list_verify(struct intel_gt *gt,
>  	intel_uncore_forcewake_get__locked(uncore, fw);
>  
>  	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
> -		ok &= wa_verify(wa,
> -				intel_gt_mcr_read_any_fw(gt, wa->reg),
> +		ok &= wa_verify(wa, wa->is_mcr ?
> +				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_uncore_read_fw(uncore, wa->reg),
>  				wal->name, from);
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw);
> @@ -1721,12 +1785,36 @@ whitelist_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
>  	_wa_add(wal, &wa);
>  }
>  
> +static void
> +whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
> +{
> +	struct i915_wa wa = {
> +		.reg = reg,
> +		.is_mcr = 1,
> +	};
> +
> +	if (GEM_DEBUG_WARN_ON(wal->count >= RING_MAX_NONPRIV_SLOTS))
> +		return;
> +
> +	if (GEM_DEBUG_WARN_ON(!is_nonpriv_flags_valid(flags)))
> +		return;
> +
> +	wa.reg.reg |= flags;
> +	_wa_add(wal, &wa);
> +}
> +
>  static void
>  whitelist_reg(struct i915_wa_list *wal, i915_reg_t reg)
>  {
>  	whitelist_reg_ext(wal, reg, RING_FORCE_TO_NONPRIV_ACCESS_RW);
>  }
>  
> +static void
> +whitelist_mcr_reg(struct i915_wa_list *wal, i915_reg_t reg)
> +{
> +	whitelist_mcr_reg_ext(wal, reg, RING_FORCE_TO_NONPRIV_ACCESS_RW);
> +}
> +
>  static void gen9_whitelist_build(struct i915_wa_list *w)
>  {
>  	/* WaVFEStateAfterPipeControlwithMediaStateClear:skl,bxt,glk,cfl */
> @@ -1752,7 +1840,7 @@ static void skl_whitelist_build(struct intel_engine_cs *engine)
>  	gen9_whitelist_build(w);
>  
>  	/* WaDisableLSQCROPERFforOCL:skl */
> -	whitelist_reg(w, GEN8_L3SQCREG4);
> +	whitelist_mcr_reg(w, GEN8_L3SQCREG4);
>  }
>  
>  static void bxt_whitelist_build(struct intel_engine_cs *engine)
> @@ -1773,7 +1861,7 @@ static void kbl_whitelist_build(struct intel_engine_cs *engine)
>  	gen9_whitelist_build(w);
>  
>  	/* WaDisableLSQCROPERFforOCL:kbl */
> -	whitelist_reg(w, GEN8_L3SQCREG4);
> +	whitelist_mcr_reg(w, GEN8_L3SQCREG4);
>  }
>  
>  static void glk_whitelist_build(struct intel_engine_cs *engine)
> @@ -1838,10 +1926,10 @@ static void icl_whitelist_build(struct intel_engine_cs *engine)
>  	switch (engine->class) {
>  	case RENDER_CLASS:
>  		/* WaAllowUMDToModifyHalfSliceChicken7:icl */
> -		whitelist_reg(w, GEN9_HALF_SLICE_CHICKEN7);
> +		whitelist_mcr_reg(w, GEN9_HALF_SLICE_CHICKEN7);
>  
>  		/* WaAllowUMDToModifySamplerMode:icl */
> -		whitelist_reg(w, GEN10_SAMPLER_MODE);
> +		whitelist_mcr_reg(w, GEN10_SAMPLER_MODE);
>  
>  		/* WaEnableStateCacheRedirectToCS:icl */
>  		whitelist_reg(w, GEN9_SLICE_COMMON_ECO_CHICKEN1);
> @@ -2117,21 +2205,21 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14013392000:dg2_g11 */
> -		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> +		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_FOREVER) ||
>  	    IS_DG2_G11(i915) || IS_DG2_G12(i915)) {
>  		/* Wa_1509727124:dg2 */
> -		wa_masked_en(wal, GEN10_SAMPLER_MODE,
> -			     SC_DISABLE_POWER_OPTIMIZATION_EBB);
> +		wa_mcr_masked_en(wal, GEN10_SAMPLER_MODE,
> +				 SC_DISABLE_POWER_OPTIMIZATION_EBB);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0) ||
>  	    IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14012419201:dg2 */
> -		wa_masked_en(wal, GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX);
> +		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4,
> +				 GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) ||
> @@ -2140,13 +2228,13 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		 * Wa_22012826095:dg2
>  		 * Wa_22013059131:dg2
>  		 */
> -		wa_write_clr_set(wal, LSC_CHICKEN_BIT_0_UDW,
> -				 MAXREQS_PER_BANK,
> -				 REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
> +		wa_mcr_write_clr_set(wal, LSC_CHICKEN_BIT_0_UDW,
> +				     MAXREQS_PER_BANK,
> +				     REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
>  
>  		/* Wa_22013059131:dg2 */
> -		wa_write_or(wal, LSC_CHICKEN_BIT_0,
> -			    FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
> +		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0,
> +				FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
>  	}
>  
>  	/* Wa_1308578152:dg2_g10 when first gslice is fused off */
> @@ -2159,19 +2247,19 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_FOREVER) ||
>  	    IS_DG2_G11(i915) || IS_DG2_G12(i915)) {
>  		/* Wa_22013037850:dg2 */
> -		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
> -			    DISABLE_128B_EVICTION_COMMAND_UDW);
> +		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
> +				DISABLE_128B_EVICTION_COMMAND_UDW);
>  
>  		/* Wa_22012856258:dg2 */
> -		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
> -			     GEN12_DISABLE_READ_SUPPRESSION);
> +		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2,
> +				 GEN12_DISABLE_READ_SUPPRESSION);
>  
>  		/*
>  		 * Wa_22010960976:dg2
>  		 * Wa_14013347512:dg2
>  		 */
> -		wa_masked_dis(wal, XEHP_HDC_CHICKEN0,
> -			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
> +		wa_mcr_masked_dis(wal, XEHP_HDC_CHICKEN0,
> +				  LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0)) {
> @@ -2179,8 +2267,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		 * Wa_1608949956:dg2_g10
>  		 * Wa_14010198302:dg2_g10
>  		 */
> -		wa_masked_en(wal, GEN8_ROW_CHICKEN,
> -			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE);
> +		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
> +				 MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE);
>  
>  		/*
>  		 * Wa_14010918519:dg2_g10
> @@ -2188,31 +2276,31 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		 * LSC_CHICKEN_BIT_0 always reads back as 0 is this stepping,
>  		 * so ignoring verification.
>  		 */
> -		wa_add(wal, LSC_CHICKEN_BIT_0_UDW, 0,
> -		       FORCE_SLM_FENCE_SCOPE_TO_TILE | FORCE_UGM_FENCE_SCOPE_TO_TILE,
> -		       0, false);
> +		wa_mcr_add(wal, LSC_CHICKEN_BIT_0_UDW, 0,
> +			   FORCE_SLM_FENCE_SCOPE_TO_TILE | FORCE_UGM_FENCE_SCOPE_TO_TILE,
> +			   0, false);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0)) {
>  		/* Wa_22010430635:dg2 */
> -		wa_masked_en(wal,
> -			     GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_GRF_CLEAR);
> +		wa_mcr_masked_en(wal,
> +				 GEN9_ROW_CHICKEN4,
> +				 GEN12_DISABLE_GRF_CLEAR);
>  
>  		/* Wa_14010648519:dg2 */
> -		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
> +		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>  	}
>  
>  	/* Wa_14013202645:dg2 */
>  	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) ||
>  	    IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0))
> -		wa_write_or(wal, RT_CTRL, DIS_NULL_QUERY);
> +		wa_mcr_write_or(wal, RT_CTRL, DIS_NULL_QUERY);
>  
>  	/* Wa_22012532006:dg2 */
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_C0) ||
>  	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0))
> -		wa_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> -			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
> +		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> +				 DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
>  
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
>  		/* Wa_14010680813:dg2_g10 */
> @@ -2223,17 +2311,16 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
>  	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14012362059:dg2 */
> -		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
>  	    IS_DG2_G10(i915)) {
>  		/* Wa_22014600077:dg2 */
> -		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
> -		       _MASKED_BIT_ENABLE(ENABLE_EU_COUNT_FOR_TDL_FLUSH),
> -		       0 /* Wa_14012342262 :write-only reg, so skip
> -			    verification */,
> -		       true);
> +		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
> +			   _MASKED_BIT_ENABLE(ENABLE_EU_COUNT_FOR_TDL_FLUSH),
> +			   0 /* Wa_14012342262 write-only reg, so skip verification */,
> +			   true);
>  	}
>  
>  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
> @@ -2260,7 +2347,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
> -		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
> +		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
>  
>  		/*
>  		 * Wa_1407928979:tgl A*
> @@ -2289,14 +2376,14 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
> -		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
> -			     GEN12_PUSH_CONST_DEREF_HOLD_DIS);
> +		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2,
> +				 GEN12_PUSH_CONST_DEREF_HOLD_DIS);
>  
>  		/*
>  		 * Wa_1409085225:tgl
>  		 * Wa_14010229206:tgl,rkl,dg1[a0],adl-s,adl-p
>  		 */
> -		wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH);
> +		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH);
>  	}
>  
>  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
> @@ -2320,9 +2407,9 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_DG1(i915) || IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915) ||
>  	    IS_ALDERLAKE_S(i915) || IS_ALDERLAKE_P(i915)) {
>  		/* Wa_1406941453:tgl,rkl,dg1,adl-s,adl-p */
> -		wa_masked_en(wal,
> -			     GEN10_SAMPLER_MODE,
> -			     ENABLE_SMALLPL);
> +		wa_mcr_masked_en(wal,
> +				 GEN10_SAMPLER_MODE,
> +				 ENABLE_SMALLPL);
>  	}
>  
>  	if (GRAPHICS_VER(i915) == 11) {
> @@ -2356,9 +2443,9 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		 * Wa_1405733216:icl
>  		 * Formerly known as WaDisableCleanEvicts
>  		 */
> -		wa_write_or(wal,
> -			    GEN8_L3SQCREG4,
> -			    GEN11_LQSC_CLEAN_EVICT_DISABLE);
> +		wa_mcr_write_or(wal,
> +				GEN8_L3SQCREG4,
> +				GEN11_LQSC_CLEAN_EVICT_DISABLE);
>  
>  		/* Wa_1606682166:icl */
>  		wa_write_or(wal,
> @@ -2366,10 +2453,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  			    GEN7_DISABLE_SAMPLER_PREFETCH);
>  
>  		/* Wa_1409178092:icl */
> -		wa_write_clr_set(wal,
> -				 GEN11_SCRATCH2,
> -				 GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE,
> -				 0);
> +		wa_mcr_write_clr_set(wal,
> +				     GEN11_SCRATCH2,
> +				     GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE,
> +				     0);
>  
>  		/* WaEnable32PlaneMode:icl */
>  		wa_masked_en(wal, GEN9_CSFE_CHICKEN1_RCS,
> @@ -2479,30 +2566,30 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  			     GEN9_PREEMPT_GPGPU_SYNC_SWITCH_DISABLE);
>  
>  		/* WaEnableLbsSlaRetryTimerDecrement:skl,bxt,kbl,glk,cfl */
> -		wa_write_or(wal,
> -			    BDW_SCRATCH1,
> -			    GEN9_LBS_SLA_RETRY_TIMER_DECREMENT_ENABLE);
> +		wa_mcr_write_or(wal,
> +				BDW_SCRATCH1,
> +				GEN9_LBS_SLA_RETRY_TIMER_DECREMENT_ENABLE);
>  
>  		/* WaProgramL3SqcReg1DefaultForPerf:bxt,glk */
>  		if (IS_GEN9_LP(i915))
> -			wa_write_clr_set(wal,
> -					 GEN8_L3SQCREG1,
> -					 L3_PRIO_CREDITS_MASK,
> -					 L3_GENERAL_PRIO_CREDITS(62) |
> -					 L3_HIGH_PRIO_CREDITS(2));
> +			wa_mcr_write_clr_set(wal,
> +					     GEN8_L3SQCREG1,
> +					     L3_PRIO_CREDITS_MASK,
> +					     L3_GENERAL_PRIO_CREDITS(62) |
> +					     L3_HIGH_PRIO_CREDITS(2));
>  
>  		/* WaOCLCoherentLineFlush:skl,bxt,kbl,cfl */
> -		wa_write_or(wal,
> -			    GEN8_L3SQCREG4,
> -			    GEN8_LQSC_FLUSH_COHERENT_LINES);
> +		wa_mcr_write_or(wal,
> +				GEN8_L3SQCREG4,
> +				GEN8_LQSC_FLUSH_COHERENT_LINES);
>  
>  		/* Disable atomics in L3 to prevent unrecoverable hangs */
>  		wa_write_clr_set(wal, GEN9_SCRATCH_LNCF1,
>  				 GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE, 0);
> -		wa_write_clr_set(wal, GEN8_L3SQCREG4,
> -				 GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE, 0);
> -		wa_write_clr_set(wal, GEN9_SCRATCH1,
> -				 EVICTION_PERF_FIX_ENABLE, 0);
> +		wa_mcr_write_clr_set(wal, GEN8_L3SQCREG4,
> +				     GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE, 0);
> +		wa_mcr_write_clr_set(wal, GEN9_SCRATCH1,
> +				     EVICTION_PERF_FIX_ENABLE, 0);
>  	}
>  
>  	if (IS_HASWELL(i915)) {
> @@ -2716,7 +2803,7 @@ ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
>  	if (IS_PVC_CT_STEP(engine->i915, STEP_A0, STEP_C0)) {
>  		/* Wa_14014999345:pvc */
> -		wa_masked_en(wal, GEN10_CACHE_MODE_SS, DISABLE_ECC);
> +		wa_mcr_masked_en(wal, GEN10_CACHE_MODE_SS, DISABLE_ECC);
>  	}
>  }
>  
> @@ -2742,8 +2829,8 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	}
>  
>  	if (IS_DG2(i915)) {
> -		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> -		wa_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
> +		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> +		wa_mcr_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
>  
>  		/*
>  		 * This is also listed as Wa_22012654132 for certain DG2
> @@ -2754,10 +2841,10 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  		 * back for verification on DG2 (due to Wa_14012342262), so
>  		 * we need to explicitly skip the readback.
>  		 */
> -		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
> -		       _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> -		       0 /* write-only, so skip validation */,
> -		       true);
> +		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
> +			   _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> +			   0 /* write-only, so skip validation */,
> +			   true);
>  	}
>  
>  	/*
> @@ -2766,8 +2853,8 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	 * platforms.
>  	 */
>  	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
> -		wa_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
> -				    THREAD_EX_ARB_MODE_RR_AFTER_DEP);
> +		wa_mcr_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
> +					THREAD_EX_ARB_MODE_RR_AFTER_DEP);
>  }
>  
>  /*
> @@ -2793,30 +2880,30 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  
>  	if (IS_XEHPSDV(i915)) {
>  		/* Wa_1409954639 */
> -		wa_masked_en(wal,
> -			     GEN8_ROW_CHICKEN,
> -			     SYSTOLIC_DOP_CLOCK_GATING_DIS);
> +		wa_mcr_masked_en(wal,
> +				 GEN8_ROW_CHICKEN,
> +				 SYSTOLIC_DOP_CLOCK_GATING_DIS);
>  
>  		/* Wa_1607196519 */
> -		wa_masked_en(wal,
> -			     GEN9_ROW_CHICKEN4,
> -			     GEN12_DISABLE_GRF_CLEAR);
> +		wa_mcr_masked_en(wal,
> +				 GEN9_ROW_CHICKEN4,
> +				 GEN12_DISABLE_GRF_CLEAR);
>  
>  		/* Wa_14010670810:xehpsdv */
> -		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
> +		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>  
>  		/* Wa_14010449647:xehpsdv */
> -		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> -			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
> +		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> +				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>  
>  		/* Wa_18011725039:xehpsdv */
>  		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
> -			wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> -			wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> +			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> +			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
>  		}
>  
>  		/* Wa_14012362059:xehpsdv */
> -		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>  
>  		/* Wa_14014368820:xehpsdv */
>  		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> @@ -2825,19 +2912,19 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  
>  	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
>  		/* Wa_14015227452:dg2,pvc */
> -		wa_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
> +		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
>  
>  		/* Wa_22014226127:dg2,pvc */
> -		wa_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
> +		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
>  
>  		/* Wa_16015675438:dg2,pvc */
>  		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2, GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
>  
>  		/* Wa_18018781329:dg2,pvc */
> -		wa_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>  
>  	if (IS_DG2(i915)) {
> @@ -2845,7 +2932,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		 * Wa_16011620976:dg2_g11
>  		 * Wa_22015475538:dg2
>  		 */
> -		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
> +		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> index 8a4b6de4e754..f05b37e56fa9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> @@ -15,7 +15,9 @@ struct i915_wa {
>  	u32		clr;
>  	u32		set;
>  	u32		read;
> -	bool		masked_reg;
> +
> +	u32		masked_reg:1;
> +	u32		is_mcr:1;
>  };
>  
>  struct i915_wa_list {
> -- 
> 2.37.3
> 
