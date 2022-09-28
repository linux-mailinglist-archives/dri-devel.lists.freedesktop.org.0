Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F35EE6BF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 22:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFCC10E012;
	Wed, 28 Sep 2022 20:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4F10E012;
 Wed, 28 Sep 2022 20:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664397823; x=1695933823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IKvm7Gt3B3ra4fafkNedRPjr2LYqKxvXFIeLJhKTGyo=;
 b=fmceLKnJfIKieqXFDbLOpGerXtcPJVMtrmVG6ZL7QcNCh/hIWu+jbQ0+
 9UI6iSQWORTS6BgNnaFPeKlSWcc8Lmw2/8MjkkpWoXGWo44PBDzKbpvrS
 09h4d28bJ5Ao3/8iFYy5i1fkk7lzm8Ub5lEN/XtorOaT5s7gfw/TnvkB9
 T0gdqyvEKjcceMkXwDwwzU0lZXvYrb2hou+/enpFnSpr+C8Bgo0KTL8Z9
 ZwnOmcBuSNA43gnnKpzwP2CszXO9goK73tjDGzhkqLbp3fX39RC1bCM5s
 3azBoAdyLociIhU6dsjbhtKIeORyNllfox9PHpzpjt8bN7f4bCYh6pxnJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="288870008"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="288870008"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 13:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711109254"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="711109254"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2022 13:43:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 13:43:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 13:43:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 13:43:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 13:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRGM8mU63x4S21dKjFhbCtUCoersWYCHWjhwTnZbX9zFW/FxjdtT78dz/oadMQOoslKOJ2Dpp5qtv8CcmcSCb9Q6Eqk8lw4ml7pV/qlndiXAxZItzRNpNIyHE3DEfnfih2TknLVrUU2R9K40hmlEi5M7J4VcDb7jupHTHKxRUCKkG5u2k0nAs+97CjeRZpMkMgwBgYq2xQnMvodteobkUfyFBgrXe1PhDk8TdtKu5AhhjG6/aWnmxhlhGm9p0m5DhXHUupct99O4WWKEx5NN6krc3Jea7kzCvKwGrFqMAy45Vq6C/JAuaYnxC6AD3UOZITauqtYm60QIr1V+MCDG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zgtSdpWEeFnTaRGurmVzkIZqVd2wA05XOou2yEtxjE=;
 b=XktCCb8/q1qCK9tGg3b4nUGC5IT1mhnDIv7ONLcWsCIOeXQlS+DzXv9Qc0uvPoirh6dbbzRdovL4YktgReoljGZZiXwzg2DDwBATwbcb9cTiLc+esg9sh2tJTNeNphSI/FP59iGrJkiefbM6lysoP4Q1mFe8rVupVmX2bcP2kYmsn8k8UrnrotxCKeYv/c4zhgJv4xwEF3l9jNp3ILUC8YKBq9DjtsjWHKVbyjj9YhDRFrt4oHLCbC1SoJ4NaL7kLvV7nmtLYnKPM31SVT7p/uE2livpejW65YyG/AXyNoDJQqBSElh58Dx7El/DIyozr4vOMDZagnz6SHBNARBX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 20:43:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5654.025; Wed, 28 Sep 2022
 20:43:39 +0000
Date: Wed, 28 Sep 2022 16:43:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Perf_limit_reasons are only available for
 Gen11+
Message-ID: <YzSx9iAS7o+OoOgE@intel.com>
References: <20220928190212.3200835-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220928190212.3200835-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:a03:167::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5a7127-2a8e-4c99-d438-08daa1921f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5I9pH3bQvz9kVeNNtoheIKsH9PmPkDqpjtokqi0Gg/p0KWpYwBkXtlCKPK7jhf3S2d46jzbzB7QArzKS7mHrTE3VD3pcValxRNq9OpK2o0Lut35B14p3q8ZuifcMlTa5Ox8AfrbenBpwl0Z50h9DrnZnWvjyNu4WmtYN2pfZdCdNC+c/yJc62TddN778NQtYinhGmOxHeX3NwkzfjDNOaf0Jet4zW8ZlJKIsdelWPgglbuscmHxTrwpnflp+nWefYsHGttAR0lJ5ekkQjfePd45B2wRuYhzgnXARVq9T6CxbTKZbTE7DHsozLLbDZRA8asU2QPC+YQTRPd+CeQcvups6vNZMINNyzNBS6qG2F8VQ8Fttm0Cnm+Tyw+zm88zAWXrbHcP0PXkE1tKKKgxPVHtF0XoW0tS2zxvos4hk3/0NXgXoBivQ1mZ/fubG2ZPykDduTC12YIN6jrsUQ33mu9lbDxh/lFbSbvxTwm9AGUSe52vfI50/DaLEYJb7tOqwGG/Pgnp54FQjPLYrv1hKnA9prlAvRHhgO7jpY8UmWggbzzwcKKH8eiEMT0GhXjqN8mxxBEI/QehNKv64wyB5h3c8WIHl91YqCjRc8js5ENN/fqcr4qjmmMScTes8SJ+VI4NZK0kXdkftEv0ufuI1NjgPzhjMtRdas4DCx9T+3d7OURss1GLz+AtRaVpKlkCZvul7mPb6W82ASnpA3fy5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199015)(2616005)(478600001)(38100700002)(186003)(82960400001)(83380400001)(6636002)(6512007)(5660300002)(26005)(2906002)(44832011)(41300700001)(6862004)(66476007)(8936002)(6486002)(4326008)(966005)(6666004)(66946007)(6506007)(316002)(66556008)(8676002)(37006003)(36756003)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zxprjIXkegeCvCKO41vloAE2Y9nRvJDuJekKYQZfdb/i0y08rSd4MrcpsBQH?=
 =?us-ascii?Q?oqZVsnmLfGshU91ymNmmxv4go6z+XB0rhhETepW/IgnD5SK2jWg9SZCijdEB?=
 =?us-ascii?Q?iO++YMLBAj76ypFQkVhMjQOz61yfCk7zbYvQgyrJTnZsDbROsTHqYgLHcgzW?=
 =?us-ascii?Q?firWTFaRATx35oibDB0iU8OLWTks/Z4Re3jQuRapqtNKAlOZ6RWyHs7zIAr6?=
 =?us-ascii?Q?f5/a4aTRdoK81xjELWJKecjv0X09GTdjsMrjqfZhpCGeYvNv1B30/DLQriX0?=
 =?us-ascii?Q?htteY/K4P1Avs85C8WmAAHTDyoTHkXQ4MsvtdU4rO1AoI2ZKCiBzge4eV+w/?=
 =?us-ascii?Q?rCJt6SAk0GJbPaRJInIBLfv2cuHCbukedpDqnskiGPCf2RA6O9wlZKgiH/V7?=
 =?us-ascii?Q?RML1yg750nnq9WJRKT0rZJhYo6VoF4yfWtsHKSWBkwFOy1b2bd4R4ZXS1M9V?=
 =?us-ascii?Q?XPRzsr/x4U13sQEEvWHxWtuxOPwF66EelOgC33HVsTmFSh2jUy6rTb0zvoIu?=
 =?us-ascii?Q?lQOIpVQr/zP2Rkylh/kHsrz5AMgKEBHTVDyosiTF6VL8tHW6Xijw08wpHNEo?=
 =?us-ascii?Q?J+l7ttKR8jz0kxcewxN9Jv7hUYCyMNVjgYImLRdcipZQwjiyJ3GuXNIuppYd?=
 =?us-ascii?Q?LTjnjYnnBHO3L7zXz+GeAffq0m2v/zlzn09Q7Grobo8/kvOUzSiq12MloThz?=
 =?us-ascii?Q?4koozn9UJQw3KOCiQh4U0uH8lFFRaShxOv4EsWSklN3fzCaQXQW5jZZVK2Bo?=
 =?us-ascii?Q?2tT65/AZhrmltwT/SWVQJx4087KEF5MTclQ+q1dxR0f5bXWAJdm+jTTGyhsS?=
 =?us-ascii?Q?TjtH1N60b/+3V1mFXyAgiWewhbvfXLJ5i+AzwWzctL6ZYvI3FAwcwxGCGMOx?=
 =?us-ascii?Q?wM27+B/53hAVJuelviAGPDizr5rB97cV8zxNZfkN8bM+w5R6xd68DKw6O3Vj?=
 =?us-ascii?Q?CNp/KUv4JCJt9nbv+g/uJUbHVsZp8xMCTlss5r/4oRoJvB838P+IUFGKTOA5?=
 =?us-ascii?Q?u56ErjPp5hCDkHvrAnSPxjv9A2Ulu3dMB6JmeSI3HnWpcrQdClPWGbj3habb?=
 =?us-ascii?Q?zmChaXwYtwMJOkWZ47xMvPjUX0/VvD+F2XWefHN/1Ite26ourGlCcnmABD7B?=
 =?us-ascii?Q?j4paaYAaa1eGXJEy1Mhivlov35Y+DAQf6BwL3oSxokq74u9aV6+6VffelSlx?=
 =?us-ascii?Q?51Eza8i/dOhoH9UTq1XhL0ABbxJxFcvp0a7wXOiq1Zf+CVdDvWkGAms4OpdX?=
 =?us-ascii?Q?y6jv+FcoO/e7tFNDABoC7DUPt6JayqrGEZemrUUJJrdEInscfBW1TVfase75?=
 =?us-ascii?Q?InQqqmmMAh8/h5fVW9Rn2ZNUt0NfLEWnToT5tC6wFFllaNTS9zMkxtPUR/kG?=
 =?us-ascii?Q?ts5Pjt8dZb/oNap02t2azuZdsR7NgywBDSRf4sRBWaigTyrfasnmVpnupoIn?=
 =?us-ascii?Q?P7pXPONEdiDhlZkmV7Jxr1pKrXYF1ZUwjh1givfRptdZc2RIxfAyj1j5hxxj?=
 =?us-ascii?Q?stk6P5KPa9dGjl2gR0kjk9IlYW9i+ev4/sIOxv9WRwV8SXdbgGRi2jiPjCLK?=
 =?us-ascii?Q?y7dTLAGkDHoLCusLUy+5AaJxkodI9Q4qNcgmyunLm16M7hnCimkSppdvtSQZ?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5a7127-2a8e-4c99-d438-08daa1921f72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 20:43:39.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sMqa3ERkzEmWqe5QfVB1SIp5OiN+Fq/0GWyhtZb1FobTUNBskX+hX0xCxZLSm1cJmjckXMZl3S6PruyKmjSvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On Wed, Sep 28, 2022 at 12:02:12PM -0700, Ashutosh Dixit wrote:
> Register GT0_PERF_LIMIT_REASONS (0x1381a8) is available only for
> Gen11+. Therefore ensure perf_limit_reasons sysfs files are created only
> for Gen11+. Otherwise on Gen < 5 accessing these files results in the
> following oops:
> 
> <1> [88.829420] BUG: unable to handle page fault for address: ffffc90000bb81a8
> <1> [88.829438] #PF: supervisor read access in kernel mode
> <1> [88.829447] #PF: error_code(0x0000) - not-present page
> 
> This patch is a backport of the drm-tip commit 0d2d201095e9 to
> drm-intel-fixes. The backport is not identical to 0d2d201095e9, it only
> includes the sysfs portions of 0d2d201095e9. The debugfs portion of
> 0d2d201095e9 is not available in drm-intel-fixes so has not been
> backported.

Thanks for the backport. While pushing it, I adjusted the commit message
to make checkpatch happier and to also ensure we included the previous
reviews and patchwork link to the backport.

> 
> Bspec: 20008
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6863
> Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 73a8b46e0234..d09a0e845d09 100644
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
> @@ -763,12 +762,20 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
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
> +	if (GRAPHICS_VER(gt->i915) >= 11) {
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
