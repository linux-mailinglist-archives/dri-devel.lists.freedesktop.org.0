Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6116013F9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806B010EDAB;
	Mon, 17 Oct 2022 16:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9EF10EDAB;
 Mon, 17 Oct 2022 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025558; x=1697561558;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h6RbotZTJAUGlKV+ERoHE5JJyktqcvnIFrXUqHOV4iI=;
 b=EJg3VNjhqNhvefdMs2SOZtfpJCt6xsU3D94iXdfE+bKd4+1TxPmwtgp1
 wPo82Vl7lBYbShsENeiefrw9yMEdqWDGNFsrjy5D0PqmR1fvTfBvonutk
 1CWGfcXBSJOJqVabYLMvR1pC8K4+yAftzvohCbaaVuPyNwiUSbW7MydzF
 7ChSOC3XLBys2ptP4dDUM8JJls5gGGPK1nEWsx8vpscym60xmf2rb9H7H
 pxzQX6q1Ftm5RCv5b2YaUcS0TUIuWd0kAMRttFdnkN/z8EEMGu6esdqGm
 9/gDTZCi4dXxR7IoMe5dqHNHG49lUj2rcpzP4Eah060/4EWXSMjm+BBCI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285578319"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="285578319"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="957410013"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="957410013"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2022 09:52:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:52:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:52:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:52:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQHwFfbDpGAjW8+/ukfC1PTkh2Jc6xehwFfAKSrGe/1GzuAeP8L8iYpA0bbLYhUuMP+0Mvskl19j04adkwgkan1HlGIe9U9flRp/NLBWMHoTNjTJyAyZd74PAcNR2lVuvHU4La2C/8SXXRjKe1s1V17ZVFEmTzqiEocYtJVAplyyWk23v8mlS6JvNXYyshKrVUmpyjcO8WB2LXdy42l2ySO6i58/kpYeUkRDVs2K4oOAyLdez9smKBOpUmZoorRzZzVeGhEUL71WfmGxQSZQ1zvznAwpEKnm3m03XKNMdeccieE6AOO2ZuEd8n/s+d34BHRyTzJGqA6GpYTGN9CF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy/3uH08Be1rY6bWP2sFbSuVC3Od1viEE0QlcGMSLXc=;
 b=F7v2o6EDCpWq9kNDpFwuwwFH5Xq6jEreg9X1Iuw0qv3n5+POEMbRZpA+z6ZAnwcEAdZa3HINaL5Wgm1GOYF60aLcsfMhT2gtvTHiDlDCNzw3vCoPrpgIWKarLEBDY65MKGuYV2bDIfNzfCvLSANE4KGhY0CDPIejK7vy9VxJvSbVma2rWb1QhM+p8+JC0qxTKzMuC4BWglxwZbi/ftkl4LtWzGNNgdqRVspVa02wQwMn5asJHbV3rGbhQ+/g4aen3IhjayA165gn/hz6uvQ3bh8c5T9YJVK3ojox3xUikC0Ld7omT1y0czw1QQB0PzghFg05dTVyfhwGfgc1Ipvdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 16:52:34 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:52:34 +0000
Date: Mon, 17 Oct 2022 22:22:21 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 06/14] drm/i915/xehp: Check for faults on primary GAM
Message-ID: <Y02IRchyKyWUQtjm@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: cfeb717a-8bbb-4524-fdf1-08dab05ffd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBOtSIrXUNhy5MvbbVW025TF/z1xnc9U585np3BXQ9fX64t+bGhuxuONq2D+kbjXIF5vyekDkaCtWOqKhruPdivqz6aVexfcgLJ06MCpkBq6SkQkDy7ZPL+x1VXjAMByuY28z3DPfoiHRvoQuLj9+VjURQKS7u2VlWymRzkoG3HlSN6/HQSXHis7w4gqG2ldM1ByOoT54r4ZBJ5161mSx5mnefr+yMWyOGteq5182rHDqDlFf+24H2rz7asWTeDoUrJtDsziXjMc7+DNw8LvcAXFnp8GkMhIyn/1Piqj2KqU+Sy6vc92UL7oKyKrUrNVyKhIF0jS2rB8oOKIDXREqnzoH1IdhDYxaBuMJccLLjV2Zc+nbLZEVtrZfjk6xNKQnoRDuFUwakSV5zar3tPX4pzQRgYMnAzMTZ01/EvAYKZVdZq9OSJgsIYvUck0VtS/fQRph59g6rtoCLHQ0V+qxp+8HCPMGDP/4aDlp4ceoYirAp00L5LISHOhfxTmT9i5hbOawt3529TUSOg37PEzO8DEsrPBdAdU2ejiy0X23aApuOk57gc8TqjF5f/UHUDm9IVoP5RR/s0YOTCyB71bP0CcajFtErWXWLPYO0aLfx9NcMgmfO289fkSCclU+ZAXTH26etB6VzV8rQ30qZQ978nkW3btvzDU3e/ng1MU72MsulJjCEoXy45nbxfghIfA0hD86xUdmo3x2C4zsazoAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(5660300002)(44832011)(66946007)(66556008)(316002)(6512007)(478600001)(6506007)(53546011)(41300700001)(9686003)(4326008)(26005)(8676002)(6486002)(2906002)(8936002)(186003)(66476007)(82960400001)(33716001)(83380400001)(6666004)(38100700002)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2QvdHlWNzZrMlcxcVM2ZEVwdzBFam5ZYSt6U1VMRzFlc0MwT05VUzNaVmEx?=
 =?utf-8?B?MGRTK1EzQkRHQzRzMVlScEpPYTk0VWhtY05xVEhkQ3ExdFBOVGg3S1NkM2w3?=
 =?utf-8?B?ZkliZXNpcUlXUzM3SkFWWDd0UHAxNTdyU1RjbjhTZW1BZm1mRnJXZjhXeFBq?=
 =?utf-8?B?SjRCYWtxQmJmKzY5QWpyYnU2NVNZVUpkdXpLVG0yU3pncXJsVGJ0cDJPYy9q?=
 =?utf-8?B?ZGVFZnRCRzU4R1NYU2Fwbmc3R2hqNmt2NVY1ZGdHaVJnbnQrOTUySkRkUXNZ?=
 =?utf-8?B?Umx2aVJGUjZ1cE1jU21pNnF1RGpaZXZtdzZ5WE9SUlJmQUtpUW1LMVBRT3cx?=
 =?utf-8?B?TUc1VEV0ZW0xNmNiUFF6c1NGaHFzaDdBeGxZbWhaaG9MMEYwU3FrVlZibXpl?=
 =?utf-8?B?RDVnVFZOQXduY0QzdGZmRzVjVXJkMi8vRjV5SGwrWThabUtxQTBIbVc0SkFO?=
 =?utf-8?B?UU1GZVBjR3NCUlVkWUs0dkRtT3lkcXk5THdMT1RtVFJqNThnNlZiamkzZ0dt?=
 =?utf-8?B?dmJGakVOaEZJZ0UycmNMd0RzNzZHL25lYXdVdkg5dlRZaFpUSjNYR2RBWDNS?=
 =?utf-8?B?aWFURzRzQWo3QTBCZGFFcVZQdmVkbnJJZ2hMRm9CTTBWejd3eEk0ZmJVaVEx?=
 =?utf-8?B?OGJhMXozc2pPWHlUVGhMWXljdnd0eUJCdVl0UFQvYXNoTXFYY3pxa0RwTlRZ?=
 =?utf-8?B?b1V3Q0ZmajBNZVlqZi9SdVBteHVUVURWcm1KdzRHeHlFVEdlRDJLTVVSLzBN?=
 =?utf-8?B?RmR0NlRXRzFncGs1N05oT2NXRFFGTFMrOExlU3Q2RVJWampWRnZwdGVaOGwz?=
 =?utf-8?B?Z0phaHhJN1RuTGJhZ2Z3MDRPWE51Rnl2ZXdybTdJVVZMZ2Q5M3RBMnZjUUQy?=
 =?utf-8?B?clNLSzVJUFNFM3VoSnJvQ0RaRDZ5RjJzekIvU3h2bkZPTHk1cENWYVIyV1V2?=
 =?utf-8?B?TW1HdHJxUG9rRS9GYys5NW5SdUE5MGh3amszcDBqaDRMWkdMd2FaUVhpRWx5?=
 =?utf-8?B?MTZFVzF6RFUyZmU2OGZWU0pHempna3JGN3Z2VWJDaWF1V0ZtYnJNbnZ5K3ZF?=
 =?utf-8?B?SnRuOVBLREJDVFJPTUJxL3laYUtGZWZVaEVyV0ppQnFQTWF2M281SHd1Q2xs?=
 =?utf-8?B?dEZzRDRVZDF2MWNyVFFOdW1PR1dwRUhpV1ArS2Z2TU4yRmRaU1IvNnlvVDVt?=
 =?utf-8?B?VWJPbzlnRmJnMEpmRVpnb3dlWS9wMDJNUEVCTmFSUlFmT0loQk8wQmVDdlVG?=
 =?utf-8?B?ZlZtZUw0QUNJVVphSjNMdWYxN1lsVEpvR3ZmZ2Vkc1ZoNjdvWjEyQjNvSVBY?=
 =?utf-8?B?Z21Gc0tKWVZaUWFId3FjL1ZaN0ZiVXhwSm5NQ1AvWnI5azhzZGFzaThkb2Ny?=
 =?utf-8?B?NjB3NWl0N1VkWnVQM1JwNXROazlZV3lUS0RWNHJVVkNpRjFncmFySVVwcXRJ?=
 =?utf-8?B?ZmQzTURza08waGVtS0VWdzkxc1BSclNaa3pIMXo4TGRLUjFjYTBQbXFaLzVP?=
 =?utf-8?B?ajBLTWRZMFhMWkdXWXJRNXRYd1h3R2dMUi9MOHFCWGtjV2g1TGFsQlRZY29J?=
 =?utf-8?B?OHlGaGNtS05UVHN5Ynp5cnNHa2xwS2dSTFdGQlA5MFM5K0c4VlFNMnR4d0hE?=
 =?utf-8?B?dVl3RUFLdVFiZ25acDd6VkN3Ylh3Qjg3V0dkV2txelU0a3IrR0RaNWVQVkR1?=
 =?utf-8?B?RXRiNGZJa2J5M0Z0TnRDYUpXaW1xZEFwYlpuRlQxcExwSjB5R3RrM1VJazNJ?=
 =?utf-8?B?TjFjODA4YnROcGNoQlZPamJrVThaOTAxRlE0M1BiR3lIRG1OZ0JTNndVNnJQ?=
 =?utf-8?B?NU1WYytaQytGMi9wRkZERTFHSzI2VmNScjhEcmhXZWEwUHpSMnd0cmNqY0NU?=
 =?utf-8?B?YUdqTmh1MXFRdkNnZEgxU1paVXhnK3paUGgzd0FvaWZUbHp3dXpmZFlWNGpG?=
 =?utf-8?B?YUtDUnhGNmp4Z3hYTnV0SG1QeTVHbU1JRGI5cVpSMmsraEM3QU1BUjNqVmlL?=
 =?utf-8?B?bU1UOTk5ZlEraEZNMzYxZ3ZZTkxoTGdIUkIyb0RzZENLRHZhbHY4MGtsRWpj?=
 =?utf-8?B?b2VjMHJTMWJ1Q3ZEZnNiVy82Q2ZXQU5JZHV2NGNjbzFJOHRheEt0V29hcklx?=
 =?utf-8?B?TFVFS2VRS1d6RjFLbklONkpHczVKYVZhNjFDTWQ2UGtBOTQzNXZzUjl4STRR?=
 =?utf-8?Q?rcM30FqoxMun3sglw3G89E8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb717a-8bbb-4524-fdf1-08dab05ffd53
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:52:34.6430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy1V8J8d6iaUikd0Wwg0HJNOkDdrmrPgp7MsXOUa0HE/WAIR2hgX5PVYg93rUZRFWmIip/6KEVWfDX/AF4Vtacfx8zc4dxyNx787CIbv5vbUgSkPpJsTI+fFq6zg9sBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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
> On Xe_HP the fault registers are now in a multicast register range.
> However as part of the GAM these registers follow special rules and we
> need only read from the "primary" GAM's instance to get the information
> we need.  So a single intel_gt_mcr_read_any() (which will automatically
> steer to the primary GAM) is sufficient; we don't need to loop over each
> instance of the MCR register.
> 
> v2:
>  - Update more instances of fault registers.  (Bala)
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c    | 52 +++++++++++++++++++++++----
>  drivers/gpu/drm/i915/i915_gpu_error.c | 12 +++++--
>  2 files changed, 55 insertions(+), 9 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 445e171940fa..e14f159ad9fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -270,7 +270,11 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>  				   I915_MASTER_ERROR_INTERRUPT);
>  	}
>  
> -	if (GRAPHICS_VER(i915) >= 12) {
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
> +					   RING_FAULT_VALID, 0);
> +		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +	} else if (GRAPHICS_VER(i915) >= 12) {
>  		rmw_clear(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID);
>  		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
>  	} else if (GRAPHICS_VER(i915) >= 8) {
> @@ -308,17 +312,49 @@ static void gen6_check_faults(struct intel_gt *gt)
>  	}
>  }
>  
> +static void xehp_check_faults(struct intel_gt *gt)
> +{
> +	u32 fault;
> +
> +	/*
> +	 * Although the fault register now lives in an MCR register range,
> +	 * the GAM registers are special and we only truly need to read
> +	 * the "primary" GAM instance rather than handling each instance
> +	 * individually.  intel_gt_mcr_read_any() will automatically steer
> +	 * toward the primary instance.
> +	 */
> +	fault = intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +	if (fault & RING_FAULT_VALID) {
> +		u32 fault_data0, fault_data1;
> +		u64 fault_addr;
> +
> +		fault_data0 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA0);
> +		fault_data1 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA1);
> +
> +		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
> +			     ((u64)fault_data0 << 12);
> +
> +		drm_dbg(&gt->i915->drm, "Unexpected fault\n"
> +			"\tAddr: 0x%08x_%08x\n"
> +			"\tAddress space: %s\n"
> +			"\tEngine ID: %d\n"
> +			"\tSource ID: %d\n"
> +			"\tType: %d\n",
> +			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> +			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> +			GEN8_RING_FAULT_ENGINE_ID(fault),
> +			RING_FAULT_SRCID(fault),
> +			RING_FAULT_FAULT_TYPE(fault));
> +	}
> +}
> +
>  static void gen8_check_faults(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	i915_reg_t fault_reg, fault_data0_reg, fault_data1_reg;
>  	u32 fault;
>  
> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50)) {
> -		fault_reg = XEHP_RING_FAULT_REG;
> -		fault_data0_reg = XEHP_FAULT_TLB_DATA0;
> -		fault_data1_reg = XEHP_FAULT_TLB_DATA1;
> -	} else if (GRAPHICS_VER(gt->i915) >= 12) {
> +	if (GRAPHICS_VER(gt->i915) >= 12) {
>  		fault_reg = GEN12_RING_FAULT_REG;
>  		fault_data0_reg = GEN12_FAULT_TLB_DATA0;
>  		fault_data1_reg = GEN12_FAULT_TLB_DATA1;
> @@ -358,7 +394,9 @@ void intel_gt_check_and_clear_faults(struct intel_gt *gt)
>  	struct drm_i915_private *i915 = gt->i915;
>  
>  	/* From GEN8 onwards we only have one 'All Engine Fault Register' */
> -	if (GRAPHICS_VER(i915) >= 8)
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		xehp_check_faults(gt);
> +	else if (GRAPHICS_VER(i915) >= 8)
>  		gen8_check_faults(gt);
>  	else if (GRAPHICS_VER(i915) >= 6)
>  		gen6_check_faults(gt);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9ea2fe34e7d3..f2d53edcd2ee 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1221,7 +1221,10 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>  	if (GRAPHICS_VER(i915) >= 6) {
>  		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>  
> -		if (GRAPHICS_VER(i915) >= 12)
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
> +							      XEHP_RING_FAULT_REG);
> +		else if (GRAPHICS_VER(i915) >= 12)
>  			ee->fault_reg = intel_uncore_read(engine->uncore,
>  							  GEN12_RING_FAULT_REG);
>  		else if (GRAPHICS_VER(i915) >= 8)
> @@ -1820,7 +1823,12 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
>  	if (GRAPHICS_VER(i915) == 7)
>  		gt->err_int = intel_uncore_read(uncore, GEN7_ERR_INT);
>  
> -	if (GRAPHICS_VER(i915) >= 12) {
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +		gt->fault_data0 = intel_gt_mcr_read_any((struct intel_gt *)gt->_gt,
> +							XEHP_FAULT_TLB_DATA0);
> +		gt->fault_data1 = intel_gt_mcr_read_any((struct intel_gt *)gt->_gt,
> +							XEHP_FAULT_TLB_DATA1);
> +	} else if (GRAPHICS_VER(i915) >= 12) {
>  		gt->fault_data0 = intel_uncore_read(uncore,
>  						    GEN12_FAULT_TLB_DATA0);
>  		gt->fault_data1 = intel_uncore_read(uncore,
> -- 
> 2.37.3
> 
