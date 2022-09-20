Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5BB5BEF22
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 23:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CFD10E79B;
	Tue, 20 Sep 2022 21:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C8F10E79B;
 Tue, 20 Sep 2022 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663709353; x=1695245353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=//oT+Vs3kE2V6AkEZdy1xN/BBqs9uC/gfiWvlcZyb6M=;
 b=DEdcCwJCHhSjrrrwwZX2NLtA5v5TEkRurXWLW+eFFVmElfiwlnaUmqHs
 OCxM7HCcG3O2XEWhwFMzAQgvuxRNkp+/1zrxetfsXeg6Umn9oRqB37T6j
 smsapwe7JLyH5DlH0GIKd9aAaj82PzWJE66el58zbCr8SRmK4QvZKN2Zt
 69e5ccEUt40ykk7ZplaGh/qQ1w+DbRVHlzLWfdxJA6yTDTrzNLEMOwhAy
 fCo/PiPIPD9czSLmQpNk0RthVXo2Sjlxgi1VgT5TSvSyGT8NJKRqlic7a
 iG8tmtFLQu3XWMBFaL6UV7SvPNU9h0yjj+hAekTWZE46dUlUhmH88CoYU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298544188"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="298544188"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 14:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="681477030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2022 14:29:11 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 14:29:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 14:29:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 14:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC4wh0rsciU+CI0IgOIu2E5EMc/zl3o9Aep+x3BhNJHhMnFyXnUq9b0dWwSZ2UyiVoNekBGBZT1ST0p086VFyjze1xLFNviTmKhiv+Rkk+JjistFPEX9F2AMHts14l8Bz8QvbSTf04gReb5aRnid6m7uwPRgE0hrEZHWvWl5lfxfdw1bYBOd+ew3hfOWfhKFRFUMiPltLqE5k3GTo6EkWAgoTL/EMudHCrowCkd5KWKMr3XplDfKWUALc93Na6++sOl8tRqy8wZDxvAD1UO+fuiot9h5Wf2dmsaFzTcOtSu0ME0kyfPCOHhqDKCAmdiY8/UDriJeblIgo3b/vuyyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrCeZV1JhZA+4EeuGqJjhqyyLpTwaw8VijMm0kT5wX0=;
 b=YGxJ7e93CfXJtPIB6+XucTZ4fzfMYL95IzwFQeb72VOlEUzwe6CLcjGjzjC5mWU25ENRF0Glo/ukINOezEEn449DlRFJq7IaZxMd+Dyg/xsp8fTe5x8u5oiqGOStRHyUNk8WeoJUGbKFbaaOWI/VGqsefGSbGdVT4KrXuNRbT8T6Z2+vlCDCvA42E8zY+izxPFl7xhbqvp/4chnSIC+ROhAuZ960dv2lo2+a7jarkut3p+oR1H7m7H9IeFZ6bGgECmgVV5/pn4JCLqoRxU/xEKontBDPbJ+gKQf2l3JwX/dla7VtaFeFxxRGetV3Vja3cgNZiWxrLFrH3TaDoEKdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 21:29:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5632.017; Tue, 20 Sep 2022
 21:29:09 +0000
Date: Tue, 20 Sep 2022 17:29:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915: Perf_limit_reasons are only available for Gen11+
Message-ID: <YyowoOejh7pq2TNU@intel.com>
References: <20220919162401.2077713-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220919162401.2077713-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4701:EE_
X-MS-Office365-Filtering-Correlation-Id: ec41dffc-bc19-42ae-1c1d-08da9b4f2730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5SzZE9OsxK3PlW4hFQGFQGPfEujPBTfE+yGl/wIToKOuFdemrpgxLuNSm2LBGx8iup5WPwPx9s0GabRVmNq3puUU9mbwALX+FEpa4N36Vp5YNmuZhWgJbNSCP4+uVXIxQtcWzAXQ3vGWIBKaOToaLrffDLda5vUwQ5TbLYrn2GOdcID74cAkTEi90ucSGCRAQbJEJUZe9KfvVXOtagx4mu83r+naQqfFH3Hkyzznsx4tx6aUeBZsJnoOckJPNCV2TjTpuJsfHBn0xafjZub9B45pxz94T4ez439UceJHv8JhstS19J6YWcNFpCRWCNlcgwyWTeq69gPmln+SsaRpgrusRlnwVHe/MOJ+U1kzRlIVfXQegr9fzTbX9DCD6LvL52YNEuXsBEhOzXJ8QkEIbYfKPXMuX1UOwRc+pxbzdK4hbljW1s40rFPgmuatRMyuM5zEUv7igr/rnhKsUmRR/eDxAN8laU/uTf7GFymqWeHK+o9ymHE3xBCxZWP0xUnxXTyMNYJQq+FGjLKoxbCWuv0paB8wBaNUuiOJ15Ocu14wtDaWRVhkPP1tbcGashmyL94sm79Ga+zxbMAyIzarvIGlUJZ4FxRMh/7YcVb8PGDp/zXXO8w8nDEcVZlSxNagPM6bOPghSnvf2d3U+wDOdV9WkHk386yGS6gVCbDqvFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(6636002)(2906002)(6506007)(450100002)(86362001)(4326008)(6512007)(38100700002)(6862004)(8936002)(26005)(6486002)(36756003)(41300700001)(8676002)(66946007)(6666004)(66476007)(82960400001)(966005)(478600001)(66556008)(54906003)(2616005)(37006003)(83380400001)(186003)(44832011)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ybw83lU8Le2F+S71rQVfrBBYEYSGzyn5nmbZrFFIyH0P+gwCxKL9rDg9YDGN?=
 =?us-ascii?Q?cyX/k9JkHC28nhHZz9ibNj5J2UQacLnL6+eunpqb6GNWZMHQhQ9J+DLxyLdQ?=
 =?us-ascii?Q?K3VqxlzisljziK+7KXRB9ZZ+a8hmtvMNuK/eohNszfOrgvTBp3htfpDJDR16?=
 =?us-ascii?Q?gH8EWN+yu5OB3gqGTDBxoMbCiyRw06fttFueGRvJROWELGzhckwCuOTRQ1vX?=
 =?us-ascii?Q?dlnlB/vP+GRURsv/7UFfbVUOzmHfbzy8g9SUEu+XCFyEqRdzdLOTbY6jLjfd?=
 =?us-ascii?Q?/f7ClT/mcTf/0Z/aVN0jFdOQ1AC/DQe4yccI3FbxnFpCmYo4armuPAe/pAgp?=
 =?us-ascii?Q?OqzdO3+WA60lrO0UHskGBu7RnhvtKvaaz6l29MiZeV8J0bYjQnI4hHfSVrSO?=
 =?us-ascii?Q?pRaDL+GDuxZb5WurHvyS3Bzm8wqJKerzieGOqpWZbZpZcAXVBJVgD3ChZzmW?=
 =?us-ascii?Q?6CEvhfX3R2B2cfK53gebCd0BhQAXCcrloVMNsAyCTH3ACYAL4eTrvbNZu3JN?=
 =?us-ascii?Q?n/WAQbWlY7TlgVQ44HyIvXDsUHkMEF5CNaaBUw6BVbv4CrXlNOnVn94RI2yY?=
 =?us-ascii?Q?roFHbpb1+EPDJW7aOmZ/8fRw6TasHGoAfe7tkWRWpNuB0N0Q4VKFlCNBzV1t?=
 =?us-ascii?Q?a6CXxHZYOTPuuqzFZLY+J3T9nf95L2BaW+wmeJ7pQr1PEJoa0l1IffrOrU98?=
 =?us-ascii?Q?s7SpbjIL46evzlTLrYb5Gl/z1gg6cQKrgixygd+9Uxjp6Fl844cE/iBozmCw?=
 =?us-ascii?Q?Wmzw35G2bvQ+HwcRtIGuDuc5MIWRnOKXbNuY4YiLN5n0O7oKhAwVy1AvjfvW?=
 =?us-ascii?Q?VNVQHoXhowxkLJb0vNir0piCWSAacNvUNNTdqk1S/sCGBLh47lZZNWRg/wTC?=
 =?us-ascii?Q?OR8yaXoX1EPJmSG5TuCAKBaLrCBppo0xw6yUC3v1Cb2kfRTppozL/UR+aAKi?=
 =?us-ascii?Q?xKYF9+wkdrWettdahrDgawn2a9ye664113iACfQe/quB3HI3EtQXuVEl/aGi?=
 =?us-ascii?Q?+3CHJ7FGNcgjLkFEn6HLFfl8XjMdMZSjPBCfV55pTqv0mz4NZ53lWNCnpXab?=
 =?us-ascii?Q?sh8Uf5VFuuidgZ8r2dbORAdXTnjGm1Ze9SZBjoRqAQKW7xhfUSVze7MCSv0d?=
 =?us-ascii?Q?VazDPUPNwHkXJcvFjhxNXGeHY+SgxEfKo98sEkm70lC3LEn29jlH3kuinqoi?=
 =?us-ascii?Q?ClBRkSe9DmB1Zdp2YcqAnoKjDViplGfCwWhD23sg0HNTZcXzVuGrn2kqW9Bt?=
 =?us-ascii?Q?k43Mmw9rrTHM4TuxT5HjacYRpAuSUWhjpiez0LjtWONdOvQkvG2p3zGETzJg?=
 =?us-ascii?Q?0Jm6YiSmSfvVRrsiEL5faQqqqfdgR9yMjzI/qDmpoDJ06+wwxRU09GuCMMqZ?=
 =?us-ascii?Q?z9A+9/bF8mNiXET8XNwSNt8Djs1+20lp6L4N91UQ66aNNMEXKIGcO0AzFstt?=
 =?us-ascii?Q?20g/nZu98V0rSyPjrdvNWXV/DvWbP5CPg1489GNPAzmVPfzgpCugjsgykE9q?=
 =?us-ascii?Q?ftUT9A23X2iSnwNd8y/18lHwEljU+0LzWKkxb2fRNSxmCQiSsKn2tjK/1I68?=
 =?us-ascii?Q?TOXc9LepSXkJ4+RN/lzJI58zWmiqybRGwHLem13fkF2eXWP/qNOMXOuIR4dS?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec41dffc-bc19-42ae-1c1d-08da9b4f2730
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 21:29:09.1670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+LoNcYK/2ttl+TGMN6R3PfWaN6/AZv6z7/jiSd7eCu8U9bQlUjnLWpIKpF1X2lhdCE/nO5F4+LSuD/QyAy7Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
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
Cc: intel-gfx@lists.freedesktop.org, Tilak Tangudu <tilak.tangudu@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 09:24:01AM -0700, Ashutosh Dixit wrote:
> Register GT0_PERF_LIMIT_REASONS (0x1381a8) is available only for
> Gen11+. Therefore ensure perf_limit_reasons sysfs/debugfs files are created
> only for Gen11+. Otherwise on Gen < 5 accessing these files results in the
> following oops:
> 
> <1> [88.829420] BUG: unable to handle page fault for address: ffffc90000bb81a8
> <1> [88.829438] #PF: supervisor read access in kernel mode
> <1> [88.829447] #PF: error_code(0x0000) - not-present page
> 
> Bspec: 20008
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6863
> Fixes: fe5979665f64 ("drm/i915/debugfs: Add perf_limit_reasons in debugfs")
> Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  4 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 10 +++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 15 +++++++++++----
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 5ddae95d4886..b367cfff48d5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -233,6 +233,10 @@ static void gen6_clear_engine_error_register(struct intel_engine_cs *engine)
>  
>  i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt)
>  {
> +	/* GT0_PERF_LIMIT_REASONS is available only for Gen11+ */
> +	if (GRAPHICS_VER(gt->i915) < 11)
> +		return INVALID_MMIO_REG;
> +
>  	return gt->type == GT_MEDIA ?
>  		MTL_MEDIA_PERF_LIMIT_REASONS : GT0_PERF_LIMIT_REASONS;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 68310881a793..10f680dbd7b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -682,6 +682,14 @@ static int perf_limit_reasons_clear(void *data, u64 val)
>  
>  	return 0;
>  }
> +
> +static bool perf_limit_reasons_eval(void *data)
> +{
> +	struct intel_gt *gt = data;
> +
> +	return i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt));
> +}
> +
>  DEFINE_SIMPLE_ATTRIBUTE(perf_limit_reasons_fops, perf_limit_reasons_get,
>  			perf_limit_reasons_clear, "%llu\n");
>  
> @@ -694,7 +702,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
>  		{ "forcewake_user", &forcewake_user_fops, NULL},
>  		{ "llc", &llc_fops, llc_eval },
>  		{ "rps_boost", &rps_boost_fops, rps_eval },
> -		{ "perf_limit_reasons", &perf_limit_reasons_fops, NULL },
> +		{ "perf_limit_reasons", &perf_limit_reasons_fops, perf_limit_reasons_eval },
>  	};
>  
>  	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 54deae45d81f..904160952369 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -545,8 +545,7 @@ static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
>  static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
>  static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
>  
> -static const struct attribute *freq_attrs[] = {
> -	&dev_attr_punit_req_freq_mhz.attr,
> +static const struct attribute *throttle_reason_attrs[] = {
>  	&attr_throttle_reason_status.attr,
>  	&attr_throttle_reason_pl1.attr,
>  	&attr_throttle_reason_pl2.attr,
> @@ -791,12 +790,20 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>  	if (!is_object_gt(kobj))
>  		return;
>  
> -	ret = sysfs_create_files(kobj, freq_attrs);
> +	ret = sysfs_create_file(kobj, &dev_attr_punit_req_freq_mhz.attr);
>  	if (ret)
>  		drm_warn(&gt->i915->drm,
> -			 "failed to create gt%u throttle sysfs files (%pe)",
> +			 "failed to create gt%u punit_req_freq_mhz sysfs (%pe)",
>  			 gt->info.id, ERR_PTR(ret));
>  
> +	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
> +		ret = sysfs_create_files(kobj, throttle_reason_attrs);
> +		if (ret)
> +			drm_warn(&gt->i915->drm,
> +				 "failed to create gt%u throttle sysfs files (%pe)",
> +				 gt->info.id, ERR_PTR(ret));
> +	}
> +
>  	if (HAS_MEDIA_RATIO_MODE(gt->i915) && intel_uc_uses_guc_slpc(&gt->uc)) {
>  		ret = sysfs_create_files(kobj, media_perf_power_attrs);
>  		if (ret)
> -- 
> 2.34.1
> 
