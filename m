Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3093645E30
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D54B10E11E;
	Wed,  7 Dec 2022 15:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB810E10F;
 Wed,  7 Dec 2022 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670428598; x=1701964598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bkMdDuwr4QpYByzPrOwlRs7asuasHFf2FgUtHEkeqYg=;
 b=UadcctOFYrEReOH7v+VzXLyGHDTvWJGNerld4RJc+htK0yYvtHucaxg3
 5GOVtLQQp62Yp5rjNpv+FImMHOpjaiXiZgQRNDiRBi0RjdutPrlgchsan
 Cl4kbVQRWCsILytwiYiynMMKGRkYUGVgpfid6N1qGEx/HKtxd09GwyqRb
 ZBd3p3xG6Q3ZrLKOuNlTUrJKcSF9A7md4XwdYo0FqP7zUucri0Ue7IRHf
 e70hDFWpE4JiXL5TrFgrttMl7aBix/WvkrnPCXjuaChTLoH2jsNRb61i2
 c9KEtYuuDFuE0PnCvR3YX1c2J4kL3+pVtCJwdu5dFJqCeFblmNLUaB1fb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297278193"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="297278193"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 07:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="646652581"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="646652581"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 07 Dec 2022 07:56:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 07:56:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 07:56:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 07:56:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0Hl0a4W6d5N9c9C3XqFKWjof4qpTVXpV39dU5wcCoVRxgnzHj2/R5TbUuFR3Id1MEmOX4D3ITnND/worM/6PB7tOo4vBKAHj3nreTkpAKxP1g00jvtQz1nYgy/sg13nG5wzyA80W77n4IJVFDsM/rRAaKu+5IQ+qgqiwyTQaq0GRohORhIdVkWqLCFK4qTGJjknVlS08LzINhFq1YqDx2jThHBRzHtCD6zOCvExgl7O2DqAM8LdRl/xk49pFpUCb4gQL4PG3F4E3oODMpAlp6hRhosUd5JFoI0JtxELBTQ6jvwyJKn2mDADXbEiAJHEQfKd27Eycuja00tbuNEiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du2E8Aqw3DGa4/YFP/8GgX85qdDM9OOQXzjHrFXyduc=;
 b=g7e0QraxKc6rJUTJCSiB9zDWjjOFO/N4KiHVPaQ+I4QCmIaqNoFJgiS0wPvQMoBzrhVQjrB9+argvrGukHFQ957y/R3H87aAYp/tq4MhxIhdFdCDBYgvya4X9xhjphdVTaZuHjiC+AQp+pIXgn11UFp2yEluPtVZv7sMssr7MCgrApoa0r44RWsGIFeDNksj7Il1A5xvzvzWrLDOk98P0veGs7/4TYyPKVX5H0CXT4hfwBrP3+QTHvm1KFsX1ApT2m9N1aYsT9RkWOHuuxTHyr9zRb345ooRprWaV+0o+iy/VJGBG/cyTcgKtWjF5aywXEz0n/EtcyIcOCxPtCmt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6898.namprd11.prod.outlook.com (2603:10b6:806:2a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 15:56:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 15:56:29 +0000
Date: Wed, 7 Dec 2022 10:56:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Intel-gfx] [PATCH v2 26/26] drm/i915/gt: Remove #ifdef guards
 for PM related functions
Message-ID: <Y5C3qTuNl9fhrO4/@intel.com>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
 <20221129191942.138244-13-paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221129191942.138244-13-paul@crapouillou.net>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f73dec-0b44-4a1d-efb0-08dad86b9aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nz9CKdncZwrsv3rS6F5AUDU+GIVTmw5lGsnda5CBExgV625OQH5dMHNF5rPo2xKFz8V2djhhWLcGujtZQ7LRq9Wr7KD975RwDl/Br4yT2420myz9JlAQlDfONYUCdNKl8KmWNPa5aXZAOqogngHP97aVnWqH0fjPTuddFOs4ua/LtRfAr0dZxkFKRuh66j5qAvbMNRAeODkgScYchcxE3BxPsaxkL/e/vqc7KTd0SeO0E8WHsa6oQAd3FblMxXxD2fUlu45+InY3uh3xdsUNHaMESbO8GCWN0vZ/zfXZwhDhnobTB86AwJv2t+eo11unukcF3vEOXzGjA2B8q+VDdi+yiPAys7ZDuGfqofBNaBtLBSxH5rAFj1rDJ+xXEVjjmLl3J0aO9sfA0nVJB5gzr2fV+1pk7Q43MDJTFUNieBxO+QYXZ0aN9dyc11ZohjHtc8vovnl/p+2YoeKV2gMkAiGkpsigkxxFY9bO93AKV5lZWuN8HZz4E0aFXRrIqu0WOi5BPjEZLF3i9H8BWZYuSRR2cdOKR2DeWGSB5eUzyrUcxHkzAKadxFL27EJMcERWMwADSt19ziX7nnvxhZNvRfkH7goPP+1GqqL/+1aAx33J6yrkgYoi+m3skMU+tzZPhIzX/eeMXDoD7oPF3zoF7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(6916009)(186003)(6666004)(6512007)(316002)(54906003)(8676002)(38100700002)(6506007)(4326008)(478600001)(2906002)(36756003)(66946007)(66556008)(6486002)(82960400001)(86362001)(66476007)(83380400001)(8936002)(41300700001)(2616005)(44832011)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?keM9nxh1nbd9DdAL/knoYPIuY/K+8kRQlwK7OJMU9YHX1y4Xd+deUQPlGAIv?=
 =?us-ascii?Q?kOPjjSpjCqypaIdFkpDDTMpdv7N3DKj31VXUCoQzR8nOtugIdQKA+m8zCi/J?=
 =?us-ascii?Q?b2sv13BesyqQ8VRVK6EA0g8v5+BrfKlmn/WT3/sgP8mDEkavHMLKHbWReXmd?=
 =?us-ascii?Q?Yus3YFuzgqiUss4O1K9bp6GV9C2G7WJ6zDgDxeYWMkEu0+wAANkWTbJHJf9C?=
 =?us-ascii?Q?01N3UsZhzlg5hTvt6ZYmvnqk+sueH31fX5TU0MKcb8TuQrX3IzmStHJqcSXX?=
 =?us-ascii?Q?j0dghMyp4ngiOQZtcIcpeNUZWLZFI9lSacER/plEUjiBIcqmYnMyvH0nfwxL?=
 =?us-ascii?Q?CYTB6yp6clMYUB7vZgQVmISBD8LOGBWWIADRrRa++LzXlMehCvnVxoa1Js5R?=
 =?us-ascii?Q?6xo7fvKe6t4rGydYkvomB3eWg+j1OTgCLiL7altpseunplp1YqmmQ4PK/oWM?=
 =?us-ascii?Q?7F9z5pKcpdTYHnHnPt4S7Opw9nxoGd00gHIsM9FRs8t4w0I1xms8pwELx3KH?=
 =?us-ascii?Q?PJUENoLP+Azsu2seF6ESvPyBb+K1aZ8TFEwnfsvgff6oqF51qn1uCDsH04lN?=
 =?us-ascii?Q?78ppbhV5FpvEJBmKQZMujzDOyG8bPr+DTYnAD7ufoRG5knh6cT5md0I0PmAH?=
 =?us-ascii?Q?bLvGY/FV79mG9qY7zinm8HXKo/d1kOcUuJrCIB9FN4djvMGLX3M10lQtpvfC?=
 =?us-ascii?Q?tBL3+vbS494DVgq9/e6O8F+Dc1sPVHzX8b5TX6smmBS2gUsm1NZNAlybikuC?=
 =?us-ascii?Q?paLsZ1kAKuBm8DE071RQasQi/YCsDzlpNlGly08oxaDif2h4WkjrNg+CCx0O?=
 =?us-ascii?Q?90wZCfIBTrz3gOAx+PAyzv35CZjhdjFTGIuMAjJWAJQmRBYOwc/gOFyWcLUM?=
 =?us-ascii?Q?h689hiLtrb50NLOeA3jmbMrk9Uqso6O8UYBTCNC2GtvxjaTSNAizykdFDpx7?=
 =?us-ascii?Q?5dzh7GiEiYzDIBYi+4954Ro0S0uOVvRbeKtHLL+QegHP0zOqR4rfhFUsfL6F?=
 =?us-ascii?Q?up8sVTJhO1M2pA/fb34bi7RMBuPJnELhcbq851Xtc0pk3/OfkmDa/Qip3WyV?=
 =?us-ascii?Q?pfPqjFCLD3XQEHO/iZz0NYBtlTX16sCPC6mMu5mXR7IGDNFF27m6VYx0udJL?=
 =?us-ascii?Q?nss8rVzR1wwZWtEuQdawwLXBmsi/8T7DVRNTU5EhEI/zwAWTNSAMrRS9fyS1?=
 =?us-ascii?Q?+zTs9eMy5J3cAe+SnVm6QI97RJneZVv4ClbEQLvRNmv0kxPJsN6tCXl/yUJ8?=
 =?us-ascii?Q?S2M5O3bihtiEqMGdOeXCcOa1xCXfWvN+GW3VMvi1bbeliCWDAywsDY4jgO5y?=
 =?us-ascii?Q?wkQvTOzGeI5Sb29DGN/LAvHYkJ6MNONwt/iBwbQq9NpzfFvEckN9rJEw2IbJ?=
 =?us-ascii?Q?hBnG6qEGhRIdwPLW+HjrInuOVn/8TgZW40W2TqkzUIdodZIfeJlrJVusO+/w?=
 =?us-ascii?Q?XjJw/WHOgc4Igf/Dussrrs0zckpSufjjzdNSaVt0vnl2EE8I4IGL/Y2rNaRi?=
 =?us-ascii?Q?SuMvW0sYSedqTNfTiiZWwYXsR+2ZDIT9ii0I9ng39U6gVWX1v7tk9e24t+1U?=
 =?us-ascii?Q?0xy7VNQmdzu5DILKophAI4puUnsHwezgZymTGjaDynPynA437KSMIxpuoebe?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f73dec-0b44-4a1d-efb0-08dad86b9aa5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 15:56:29.7918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/xWKYxQ8xLSp3L3Y3I226S4mj26AGnJaf2AnoJCMBV3qRahBP4yAbIMhfjHj8+msaLVVJmVOp1MUG2GAFmPFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6898
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 07:19:42PM +0000, Paul Cercueil wrote:
> Instead of defining two versions of intel_sysfs_rc6_init(), one for each
> value of CONFIG_PM, add a check on !IS_ENABLED(CONFIG_PM) early in the
> function. This will allow the compiler to automatically drop the dead
> code when CONFIG_PM is disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index cf71305ad586..09b9365ededd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -164,7 +164,6 @@ sysfs_gt_attribute_r_func(struct kobject *kobj, struct attribute *attr,
>  								 NULL);			\
>  	INTEL_GT_ATTR_RO(_name)
>  
> -#ifdef CONFIG_PM
>  static u32 get_residency(struct intel_gt *gt, enum intel_rc6_res_type id)
>  {
>  	intel_wakeref_t wakeref;
> @@ -300,7 +299,7 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>  {
>  	int ret;
>  
> -	if (!HAS_RC6(gt->i915))
> +	if (!IS_ENABLED(CONFIG_PM) || !HAS_RC6(gt->i915))
>  		return;
>  
>  	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> @@ -329,11 +328,6 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>  				 gt->info.id, ERR_PTR(ret));
>  	}
>  }
> -#else
> -static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> -{
> -}
> -#endif /* CONFIG_PM */
>  
>  static u32 __act_freq_mhz_show(struct intel_gt *gt)
>  {
> -- 
> 2.35.1
> 
