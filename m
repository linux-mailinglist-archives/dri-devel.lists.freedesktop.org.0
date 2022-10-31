Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CB613C6F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EEC10E0A5;
	Mon, 31 Oct 2022 17:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BF410E0A5;
 Mon, 31 Oct 2022 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667238385; x=1698774385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KvRyBRlVXzS/krlp82cG9w5q6ntohgifpS4Jn1PPBNU=;
 b=lpR1LX5M1iwHj690G4kr77+voW+wERSbezYgsLjScVsDfm6TFgRDcFRR
 gvlX1PcMvxZixa/Phf0OcFYJGYBl26IgbhpftmuF5vJYMChEwA6mE7tNf
 vyJ0RdYjw78pcOD5qHnAu4KFOSrKkaE39Oliw6NNEOvmLe3VXEviWBQ2C
 ASzxQg+iOpsghOW0BYK71BHkdCqN7vcr/FqMMsBr7K+giV5A3n91b4NDc
 C67FFCENzsy0YplCMEa/H+DRzLBG5R1S3w2iJPh5S/2NF0zoKIqRqCx/O
 CW18fPeQlr8gm4bhHA7yXqqrLLNOpxJEbNQnzBQe2RS2jI6qCjYBiwEWq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371038462"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="371038462"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 10:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611571665"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="611571665"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 31 Oct 2022 10:46:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 10:46:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 10:46:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 10:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvb/ueD455jabXha4Xw9x5J/ifyqgDGQBO5BTWENZPbOtdfzrX1fPjntI8TGA/MlGfg3T0yBF9cElQe53TIeQwp4tlfC6MSusCCq+td2RlmBDWWz/1Ty/vcC97oLUbtSENz4x76g5onVqFgX2z5HtJKntFh6dv40EKVmCU1xkyzsUnD9gcPTXYjTulpjjY/Y2p2PumoEdfWuVTDXvy34SIQeRBX7vmHmy+vU6AcFqUmxQZakgtfnSktOQ9SdGxoLiHDW6bQbaFH0GuGC61JtNYbodufYbVi5LgA2BGrJPGV1hq8bIZHycFHibjabyGK4InH9Wyjkc4Vu/xRk6cqunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwF4Le/KGLekr3F4e5FPRm7lnCSfrbj8vfQ70elfKa4=;
 b=nKnTL+n9uxQG9/LdGGB3mGiJQzcAhBoDCl7rglPerqwo9sAy3+W/xYbYXSeLvHUlJ9GtQ+KeJZs83K70rZLhx6c87wG918oscUkq/2xgL825aWLP1mx5Np4nGlFEheZcrscqcBXCOYPJFamF8HOGYjq6JcwFGZg3pXx7DYDAyyLU1H4nAbH4A5tFHScHREOWGmhP1mlranWUqkmrl/gihV9ks+wyy90SgaGm0MdnQNORgtv5kAJoP40vSsoRWrX+GknbdaFGxTVnXZ4Y4K/NaUd13YLVDs9dCoMi+xGAK/3z6sXlXdMa0UiKqaeI1bkU0Wnm+1YNWNBB5eMbAUY3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 17:46:21 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 17:46:21 +0000
Date: Mon, 31 Oct 2022 10:46:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Media GT and Render GT share common GGTT
Message-ID: <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 6812ee91-8faf-4d3f-c2f8-08dabb67d274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMZgF9lyRUQ+sQwNpTErvWJBTt7VAm3oe1g3hEQBoiXIekXeySuZYtVb/pC87uGqFMZGfxFqjJjtj36z0swOYlfMJyZMwTvuf9EWoks/NN3ArETCIA9uWPz/pZXSq1/QZxtAUKQ9lEuQymqEDvNYOUPbCrKif87F5UhKnSKZkjA0iqL3JJLJxQxi7toWfQ5+glg6mxMBueR46Gp290MJaJC3O8fRhji7kM+7aH7Jwr1Y6ZeCLOrnbkL302A0Clp0hddEjcPPk+hDD27ObPXGeBB57A47ZbUl5VwAmxbC8o4GQvH/u8QRDTqvoT5XNAuHwDY1iBVKbpexqrG91lK/VFRPcqpZYbum8IDdIp7irm68JqqlVJ9+muxvLHF9wjj+wN3uG/2tJytUxOnrtxEjNYSSCF62r+MGiQ5NdQMDjEvfVrucTQaltnvtX9Y2JDvN6tNIMO7Bkm0fkn2dxPnnAQdD6VzyJJhaCgHbqMqTDZ/8r0Rdk5pxktuKXjk1vQ1un6/isp0zG3nlVZkCM12xiII7MGlfx7V1klDbnnIbzHLFVatrkqJar+32O0278/aeJOxClnZDDPz12P+Ju7O2oAWC+0lKwHlw9TV0hrXnfdEAamLyYNx1sq7oIKwa7V2rYSFUQG127rOzXor2xr0nhFqwAcZD/wu7fx9KjxeUei1Mv/1Quj1W149znG7QEcbx70ZgMGGhzcuaqqIlgq12qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(83380400001)(6486002)(2906002)(30864003)(86362001)(82960400001)(38100700002)(26005)(6512007)(186003)(450100002)(66556008)(316002)(8676002)(66946007)(4326008)(478600001)(6862004)(41300700001)(6506007)(66476007)(6636002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0jppDIZTb9mPH4XsDkl9wyhRexwiwqtebKvDkPL9yVhNXeu4RIjWQfwe8uqN?=
 =?us-ascii?Q?QE7qbaR6S6phASSOA70RHm8r+CHKRpzDeMT1TbRJqv9g5OmgzqqNaQTxPdu0?=
 =?us-ascii?Q?4iQhH2qE+cfpp3beLvw36pcY97ABdCpfqqtL9AKtdc+pKNo/pHz2ngPXGuDW?=
 =?us-ascii?Q?ZdiJf2uQYPlYfmKzdrBh0et7mNRD2cwSQRjgQ5db7CTOyHPLDjrhEvIddOQP?=
 =?us-ascii?Q?Cle7kNI69YKLaWxtsdnmeK3srOflELPfaB/T4Oakn0pP1GSaWvJIHkuQJ28A?=
 =?us-ascii?Q?Vpt8cQvLu6cfNsOcOsOn1HXEYWr1SkCYrrOZWWhYDQpGEC1UcSnufcX3UmT4?=
 =?us-ascii?Q?89FEgccRq0RARjvTcI2zoEdLvo22P6IuMQmatsLvOqrPbpzVnDyT6dZVSPcD?=
 =?us-ascii?Q?j/sxPay8FjIAYi+xYZvGBACMvSKWWGm5776e9j2sc0xKtmFD3yDMeRWJwbmE?=
 =?us-ascii?Q?122GoN32IBLUKGh/l3HTM8wfAwPXa5rZyRjjOHrPGK4WU0myiopaz8ImYqRR?=
 =?us-ascii?Q?LrGqqIv6Y8O0XTypF6q/6yjhE+DtiLrEcyFeUvj0fIdtV6rrpc9WRQomU0rZ?=
 =?us-ascii?Q?Ojr1CS9Z3rmmUEUhML5ScmEV58UDxLJLf2FKjqbOjjhZxN65WK+Dql4SpBh5?=
 =?us-ascii?Q?M37K7/NaCF4kseOC72sa9NQeYqF9W2pFszN8fN1S0+qHxeV69ib+a82mgYQs?=
 =?us-ascii?Q?0jPffCsu5VPxIaZEuuXijPZmt9JSHeviWLjy/lcAvq+jOpex595su3IV0nOY?=
 =?us-ascii?Q?dl530ZkLThkE7lOBx6wXOgj2vtj/OOMBK99JtMQmVQSq8/Hlbyh85FVW9Dt1?=
 =?us-ascii?Q?J56Hu86qHhBVbc2JMJPZUybRfp5vNbAtwCUmgKxMjvKoHHRmO4YsuMpJJCN8?=
 =?us-ascii?Q?qjDy6kBjhpSbh2xuKSbSMh2GTTY+uZmMaXRty32S2q/FtVQ5V0XbW4MK2A43?=
 =?us-ascii?Q?dTxPtqqXX6208oXU+tk+ShtDBNHA77kZhPugeKeLs26gzsRuT6o0gca9C7HN?=
 =?us-ascii?Q?r3bWL6V9V3bAcVcLs4XMdp+6w0C2BBJz2Who/7o4vRrvkyElS6Da83rLNyqp?=
 =?us-ascii?Q?5gHEoRgzs9oopq+j37aVriPqCOs0zg38VI3GIzrDKwtquUAXJj03AmbppxeL?=
 =?us-ascii?Q?wmFOJAp4yy+g94H7EfeSUaLageo/REzpMzchJrtTj7fruCTT/n53KioKteTa?=
 =?us-ascii?Q?BKxkmWtHrI/Cjmrz97mn4t8/7U4j+VkH9Bp3h714qiwDrwJjMoPRi9txThFB?=
 =?us-ascii?Q?Pcoy14w4Wu5aQ1FkHjy2dbJrR+1HTZhuJ94+kVy2XHVdjnaXqtm+mJ/Joau5?=
 =?us-ascii?Q?RlnMESiV50R87Hg+g4QhBDAuA8qPs6X41QtauYB/ebqBrqPGKHlzNma9ttZR?=
 =?us-ascii?Q?eQBqJI/rbpONX9EahdhylQn9/KHlnxLN9E4l6JJsLeJOPIt89SiP+LzTN3si?=
 =?us-ascii?Q?1K8G5OksF/bVrUYyCWIZIWOFhC7EvRKs2aSKdj2Q+C99gPRBcdRq9i4QEO3n?=
 =?us-ascii?Q?/uymWoFONL4/3Tj5qNMmO/0NSkUzkxB6oPcphTsN8sSveupykC7gAaSpJa0t?=
 =?us-ascii?Q?QZLTi83c0C5Qux8sCqLCHfK7Nz1jx9DahSHqcbAHMtV+q9mUBv+ySkVa/IL5?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6812ee91-8faf-4d3f-c2f8-08dabb67d274
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 17:46:21.5114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juINhTSOllFio4ikDmJ5uWscTl2DaLh+4vt0o78Ulqr9zn0joLFhQCQDCLwM4liTviGRYLTKectGrrduGBo+z2VQLwYUgxQocQxt5Qw8f1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
> On XE_LPM+ platforms the media engines are carved out into a separate
> GT but have a common GGTMMADR address range which essentially makes
> the GGTT address space to be shared between media and render GT.

While this is all true, I feel like this description is lacking a bit of
explanation for why/how that translates into the code changes below.
For example you should elaborate on the areas this impacts, such as the
need to invalidate both GTs' TLBs, retire requests for both GTs, etc.

Also, the movement of the PAT setup should be noted and explained as
well since it differs from how you approached the other changes here.

> 
> BSPEC: 63834
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 49 +++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 15 +++++-
>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 ++
>  drivers/gpu/drm/i915/i915_driver.c        | 19 +++++--
>  drivers/gpu/drm/i915/i915_gem_evict.c     | 63 +++++++++++++++++------
>  drivers/gpu/drm/i915/i915_vma.c           |  5 +-
>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>  drivers/gpu/drm/i915/selftests/mock_gtt.c |  1 +
>  9 files changed, 115 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 2518cebbf931..f5c2f3c58627 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -196,10 +196,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
> +
>  	i915_ggtt_suspend_vm(&ggtt->vm);
>  	ggtt->invalidate(ggtt);
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  }
>  
>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
> @@ -214,27 +217,36 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>  
>  static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> +	struct intel_uncore *uncore;
> +	struct intel_gt *gt;
>  
> -	/*
> -	 * Note that as an uncached mmio write, this will flush the
> -	 * WCB of the writes into the GGTT before it triggers the invalidate.
> -	 */
> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> +		uncore = gt->uncore;
> +		/*
> +		 * Note that as an uncached mmio write, this will flush the
> +		 * WCB of the writes into the GGTT before it triggers the invalidate.
> +		 */
> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);

This isn't a GT register, so writing it for each GT doesn't do anything
different than just writing it once.  But actually it doesn't look like
this is even a register we should be writing to anymore since Xe_HP.
The GFX_FLSH_CNTL register no longer lives here.

> +	}
>  }
>  
>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>  
>  	gen8_ggtt_invalidate(ggtt);
>  
> -	if (GRAPHICS_VER(i915) >= 12)
> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> -	else
> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	if (GRAPHICS_VER(i915) >= 12) {
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_uncore_write_fw(gt->uncore,
> +					      GEN12_GUC_TLB_INV_CR,
> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> +	} else {
> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	}
>  }
>  
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> @@ -986,8 +998,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  
>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>  
> -	setup_private_pat(ggtt->vm.gt);
> -
>  	return ggtt_probe_common(ggtt, size);
>  }
>  
> @@ -1186,7 +1196,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>  		(u64)ggtt->mappable_end >> 20);
>  	drm_dbg(&i915->drm, "DSM size = %lluM\n",
>  		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
> -
> +	INIT_LIST_HEAD(&ggtt->gt_list);
>  	return 0;
>  }
>  
> @@ -1296,9 +1306,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
>  	bool flush;
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  
>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>  
> @@ -1307,9 +1319,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  	if (flush)
>  		wbinvd_on_all_cpus();
>  
> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
> -		setup_private_pat(ggtt->vm.gt);
> -
>  	intel_ggtt_restore_fences(ggtt);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2e796ffad911..d72efb74563a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -110,9 +110,17 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>  
>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>  {
> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +	/* Media GT shares primary GT's GGTT */
> +	if (gt->type == GT_MEDIA) {
> +		gt->ggtt = to_gt(gt->i915)->ggtt;
> +	} else {
> +		gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +		if (!gt->ggtt)
> +			return -ENOMEM;
> +	}
>  
> -	return gt->ggtt ? 0 : -ENOMEM;
> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
> +	return 0;
>  }
>  
>  int intel_gt_init_mmio(struct intel_gt *gt)
> @@ -965,6 +973,9 @@ int intel_gt_tiles_init(struct drm_i915_private *i915)
>  	int ret;
>  
>  	for_each_gt(gt, i915, id) {
> +		if (GRAPHICS_VER(i915) >= 8)
> +			setup_private_pat(gt);
> +

Since the term "tile" is used for PVC-style remote tiles (which we have
some framework for, but haven't enabled yet), it seems confusing to have
the PAT setup for all GTs (including the standalone media GT) in a
function called intel_gt_tiles_init().  Maybe we should also have a prep
patch that renames this function if we're going to start doing non-tile
things in here too?

>  		ret = intel_gt_probe_lmem(gt);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 6f686a4244f0..aee37e9e79b0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -292,6 +292,9 @@ struct intel_gt {
>  	struct kobject *sysfs_defaults;
>  
>  	struct i915_perf_gt perf;
> +
> +	/** link: &ggtt.gt_list */
> +	struct list_head ggtt_link;
>  };
>  
>  struct intel_gt_definition {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4d75ba4bb41d..cb1272702a1a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -390,6 +390,9 @@ struct i915_ggtt {
>  	struct mutex error_mutex;
>  	struct drm_mm_node error_capture;
>  	struct drm_mm_node uc_fw;
> +
> +	/** List of GTs mapping this GGTT */
> +	struct list_head gt_list;
>  };
>  
>  struct i915_ppgtt {
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c3d43f9b1e45..6b973182ddcc 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -577,7 +577,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>  	struct pci_dev *root_pdev;
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>  
>  	if (i915_inject_probe_failure(dev_priv))
>  		return -ENODEV;
> @@ -614,9 +615,11 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  
>  	i915_perf_init(dev_priv);
>  
> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
> -	if (ret)
> -		goto err_perf;
> +	for_each_gt(gt, dev_priv, i) {
> +		ret = intel_gt_assign_ggtt(gt);
> +		if (ret)
> +			goto err_perf;
> +	}
>  
>  	ret = i915_ggtt_probe_hw(dev_priv);
>  	if (ret)
> @@ -1318,7 +1321,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>  static int i915_drm_resume(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> @@ -1333,6 +1337,11 @@ static int i915_drm_resume(struct drm_device *dev)
>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>  
>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
> +
> +	for_each_gt(gt, dev_priv, i)
> +		if (GRAPHICS_VER(gt->i915) >= 8)
> +			setup_private_pat(gt);
> +
>  	/* Must be called after GGTT is resumed. */
>  	intel_dpt_resume(dev_priv);
>  
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..e9d4352ebfb8 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -43,16 +43,30 @@ static bool dying_vma(struct i915_vma *vma)
>  	return !kref_read(&vma->obj->base.refcount);
>  }
>  
> -static int ggtt_flush(struct intel_gt *gt)
> +static int ggtt_flush(struct i915_address_space *vm)
>  {
> -	/*
> -	 * Not everything in the GGTT is tracked via vma (otherwise we
> -	 * could evict as required with minimal stalling) so we are forced
> -	 * to idle the GPU and explicitly retire outstanding requests in
> -	 * the hopes that we can then remove contexts and the like only
> -	 * bound by their active reference.
> -	 */
> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +	int ret = 0;
> +
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> +			/*
> +			 * Not everything in the GGTT is tracked via vma (otherwise we
> +			 * could evict as required with minimal stalling) so we are forced
> +			 * to idle the GPU and explicitly retire outstanding requests in
> +			 * the hopes that we can then remove contexts and the like only
> +			 * bound by their active reference.
> +			 */
> +			ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = intel_gt_wait_for_idle(vm->gt, MAX_SCHEDULE_TIMEOUT);

This function is only ever got called on the GGTT as far as I can see
(which makes sense given that its name starts with 'ggtt').  It's not
clear to me why we want to handle PPGTT too now?

Even if this is intentional and correct, it might be best to move this
up to a small if statement at the top of the function with a return so
that we can eliminate a level of nesting from most of the function.

        if (!i915_is_ggtt(vm)) {
                wait for idle;
                return;
        }

        ...


> +	}
> +	return ret;
>  }
>  
>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
> @@ -149,6 +163,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	struct drm_mm_node *node;
>  	enum drm_mm_insert_mode mode;
>  	struct i915_vma *active;
> +	struct intel_gt *gt;
>  	int ret;
>  
>  	lockdep_assert_held(&vm->mutex);
> @@ -174,7 +189,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  				    min_size, alignment, color,
>  				    start, end, mode);
>  
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +
> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  search_again:
>  	active = NULL;
> @@ -246,7 +268,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>  		return -EBUSY;
>  
> -	ret = ggtt_flush(vm->gt);
> +	ret = ggtt_flush(vm);

As noted above, this call is always done on GGTT (since we checked and
returned if it wasn't GGTT just before this point in the function).

>  	if (ret)
>  		return ret;
>  
> @@ -332,7 +354,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>  	 * a stray pin (preventing eviction) that can only be resolved by
>  	 * retiring.
>  	 */
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  	if (i915_vm_has_cache_coloring(vm)) {
>  		/* Expand search to cover neighbouring guard pages (or lack!) */
> @@ -437,11 +467,10 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>  	 * pin themselves inside the global GTT and performing the
>  	 * switch otherwise is ineffective.
>  	 */
> -	if (i915_is_ggtt(vm)) {
> -		ret = ggtt_flush(vm->gt);
> -		if (ret)
> -			return ret;
> -	}
> +
> +	ret = ggtt_flush(vm);
> +	if (ret)
> +		return ret;

It's not clear to me why we're removing the GGTT check here?


Matt

>  
>  	do {
>  		struct i915_vma *vma, *vn;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index c39488eb9eeb..24cbee3c1ce5 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1542,6 +1542,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  			   u32 align, unsigned int flags)
>  {
>  	struct i915_address_space *vm = vma->vm;
> +	struct intel_gt *gt;
> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>  	int err;
>  
>  	do {
> @@ -1557,7 +1559,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		}
>  
>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
> -		flush_idle_contexts(vm->gt);
> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
> +			flush_idle_contexts(gt);
>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>  			/*
>  			 * We pass NULL ww here, as we don't want to unbind
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index e5dd82e7e480..2535b9684bd1 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>  	 */
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		i915_ggtt_resume(to_gt(i915)->ggtt);
> +		if (GRAPHICS_VER(i915) >= 8)
> +			setup_private_pat(to_gt(i915));
>  		i915_gem_resume(i915);
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 568840e7ca66..b519d271f4fe 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -127,6 +127,7 @@ void mock_init_ggtt(struct intel_gt *gt)
>  	ggtt->vm.vma_ops.bind_vma    = mock_bind_ggtt;
>  	ggtt->vm.vma_ops.unbind_vma  = mock_unbind_ggtt;
>  
> +	INIT_LIST_HEAD(&ggtt->gt_list);
>  	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
