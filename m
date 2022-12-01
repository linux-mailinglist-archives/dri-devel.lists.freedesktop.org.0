Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831063F989
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 22:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CC510E167;
	Thu,  1 Dec 2022 21:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4826810E160;
 Thu,  1 Dec 2022 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669928520; x=1701464520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gn3EZAXS6mlfM91zpfdLYqRCU8C5X0HY/TWoueCglyE=;
 b=EULZJBtBk6HDoaiYdklsxYJB1FrT4FX5ldjRFz8v/QlbCD+xFZmbpNEZ
 rEIfLGwXZxJeJizP/LGTF7tMOrJwdrUX2dUA79StBgfRym73JS6v92MVT
 TTqcjCp1gqa64ZPn/L9CTEG1kpC3ZAYpqq2/LsTkYYDEYkqlenIBv9Ifm
 bk3h3A47qx2GfB0uD6rNl+ialQdZHd9+oyBurUpCuXlmogvhtl41JQE4I
 5vSrLJZNIdGLu8YE1r1xrBuNWfc/G1R1Nyw6UPqG4HnagxWVYZltTbxQQ
 gKMj9xAWZTUECsXLU0QtYlL3F0sTSldjk7t7Zrvl3h3eyIgCIdZ+2GJzf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380087704"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="380087704"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 13:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="973668369"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="973668369"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 01 Dec 2022 13:01:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 13:01:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 13:01:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 13:01:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 13:01:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH8Qm6UDXxdUiRRaxsYmh8LxhH8LW5nwMa/j92qmcqn7t3mZ6j0T6QPqOHgYD9RHmHMBX1VeMja0vtX+47jEPcPs/1oXF6NVm7iqJI/abvSieI5vbRahK235Q1M1M+dCCxLBKb9fFT33Ny0DlbjvKUuJi3k8u5dzq/j2upD6Rl5PS3DF2nxH6TzYW7dDfJDncJbLvwq4NqhqkMaPTjZmr/MgeBSxsP+yfqAJ5vlHFS8vx2VHa82ATQqoZIpi43pqaEzFahI9KlhzaNEQbb5w8hvD+K8YJ3Zr1HR9F1GzDwTkgBLXEvYET9xmYss7nEUlnzLbC85wjQihvf44Kla5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+fDzp5BrNOm4ORRpe3P5u9d60Vz4L2pW85rFB6d58E=;
 b=VxrRx5uG4NCpufboO7ByV/vrOwwjavX54D4trzvMHVMo6rjLtdVNBUWCdOJ0peC2s5b+kkIcgKyGSU0IfeJkzhuZILzw7b3dTWGDb1XnmqsU8qTxLzAIS9+yX2q8lKkpzV0JPulLGKFTSg9UZFHWSkW/0MroxOLCpCGA1TzvOn7UidVwgaLFVrWKtbdlxD++Y4zPC4wswHQLkK1LpTfTbp7V7HRjFV8LzmDkrBX3km2kBkd754EbFaQTREaIYPNT7yAnkndLstBfHcp/N6zQBC+CMJQtgJVHaSFE3gHSTQtGnkAOhrvz21xyChxeG6mfEipLGgQ6X1O/FP2AkeOTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 21:01:42 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 21:01:42 +0000
Date: Thu, 1 Dec 2022 13:01:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v3 5/5] drm/i915/mtl: Hold forcewake and MCR lock over
 PPAT setup
Message-ID: <Y4kWNDh5PGNmMocS@mdroper-desk1.amr.corp.intel.com>
References: <Y4d76483JRj5d4RL@bala-ubuntu>
 <20221130155852.19601-1-matthew.d.roper@intel.com>
 <Y4hzRs1LY1dnlEgr@bala-ubuntu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4hzRs1LY1dnlEgr@bala-ubuntu>
X-ClientProxiedBy: BY5PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:a03:167::28) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f23bd1-0191-4cc9-f232-08dad3df3f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mwa0CTHmEB6X/S9hT8I9T2ZvuoVVFO3NrsHcnqk1KK0CzYzy+pSuvY8EtccNUJRGYBDPi6rogYLBmaSuwiaWCHv+q4S9Py5cgWHWTS4pLo+CmhzX61ubUtkZ/RhpdGywsryNdQcpoNmGxbBAGO6ARKTFTHA1OziTe+8XAtn2l0OrZZpYVaWvSuV1YsyxtPT+I9U8QhKMrhyDHiKvp68OVCLXSChXlBEg1zTiD6jqfSL28reNa9lUJ7jfuVSQCeolVR6slktdDFZd7rI020YQAsTwEHIg2I/aXVJu42bD02wIQ6UERVrTbtoNvpLzqnQAFj+dxE8z6VfpEbe8CSZak9lN/3e32zL9pzKsALl7TWjadhkFs2B2DOUlOow4VPzfEgpvjSpBxN55qehpneWRjD47odGQHi4f76TLP9mRaFobdn2L7qZdrhAo4zqplWRfaNYhfdpFT3I1z0k3CKrp6sAE/R0pE1qcC1w5ZVDT+1hrzAd397SyHedy9c1jy5MvSn11GJi11S/d4MUKiJYOSdanlrvSODuX2BxVxsy3/P7leavRMRhmk9Njm6i7O5ncH5qXIDgfZVGeL958KjZAtNY2O39ZKj14g6L0BjmosMFDwpO5BlHBHpN5KokAPGtRsP/ag8AT5JLAA/Uq/wwLzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(478600001)(83380400001)(6486002)(53546011)(2906002)(82960400001)(38100700002)(6636002)(5660300002)(41300700001)(6862004)(26005)(66556008)(8936002)(6506007)(86362001)(66476007)(4326008)(8676002)(6512007)(450100002)(66946007)(316002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35U9nPpMOWpQnKs3wQJaiGEHv/J/sJbNfXtvl9lKa9csf1/WYPhTylOv5Ypm?=
 =?us-ascii?Q?H8u+Wym+L+lRRxmZs7rgDKoaOYFhmVaf4fpKc5w6jgN9Gipqi9xHti/TCuws?=
 =?us-ascii?Q?BcvuNz6H119l2xa3GZbXxYlqygGEwpy2AvmYmJ18lO7zdxl83pAwZkY3H4km?=
 =?us-ascii?Q?d6JeX3lVIYl0LXmqqCbv32USx1AlfTMwPVEr8BckXp3VBQuDNMWnyIVXDf9l?=
 =?us-ascii?Q?9nbxONEfHUg08FzlZlxwLEQJMuceLJmS3cWlX3YPnfE/GYPOMgqBuZQ5URjx?=
 =?us-ascii?Q?l5UcTK9lkMT0JzxMOtEWIdO+Ifxd0XBR37EpbGaHMJhTPP2sl7JZThiclVue?=
 =?us-ascii?Q?UptKMOJGHiMRBNBPUdcKlYwB7KgwYkxPVXwPcM0L36DY8R1CL/fklqvNPqgf?=
 =?us-ascii?Q?RXHPuqT46m7rZUQXtqwLtiibwTRIqplfc6T4brBbdKByIlO2JO5uZDLDGKSG?=
 =?us-ascii?Q?RL0aXEUr7v0w8TjaRrSxxF6Wm9t1ONpordR+gUGr2OoU4sdgrGpD9YKRUzO9?=
 =?us-ascii?Q?K45ZZY3vh2ynnHi1noixejuBQvAschE6ObpiBDdVFlROlwwb53pISE1xgM3d?=
 =?us-ascii?Q?SPfa5/4lbBjFbrq9a1Y5MnO6CGylyfoyCH34DhkF1Bp0k30xFKXDGlknXQMJ?=
 =?us-ascii?Q?DQplc6QfCmI4D+uwrELr2y4s7nBTuS9TmUL5b8EQlSyMr7E+PxU66bHuORIc?=
 =?us-ascii?Q?TxKpF3x7Vx9CnVUk8F9hyXoID94BRjAdgjdd1JpMj3YcIivHJ09sxjb3qz0F?=
 =?us-ascii?Q?lLTDMTB1sFMTLpRVEowIj5gTF8695M7Z5farMOptoMybZNOJ60ajbrCdEEIO?=
 =?us-ascii?Q?5wXC/tJathHS+giUJI2aP3Jbfk2eQpo1w3qtcqQiuoejtSxu/zptyqohN5/+?=
 =?us-ascii?Q?rWVsaqL4hVPYLTUZ+ff+STjKwza430U23OjWeSVOnLrY28uZNF7tGHOZ0NRp?=
 =?us-ascii?Q?pXDJYmQHOCMBo/iIwuYFEKl6E4PMuotZDk7BSAkbxro/u1v3CYMMQd+E7sy7?=
 =?us-ascii?Q?HziPROaQR+k2TzCfEDhosjHqxm+NifJCYNbi4bz4qUca2mlf9I2R5ZKBAMh/?=
 =?us-ascii?Q?F2NtPiuEBXLMGyf8y449uuc7GlfpiGGp5Nf8ev+qiZ+hQlqb5vNM+9sXRkmH?=
 =?us-ascii?Q?0qPEg9pfQNgFWDG+8pvuAI+18nj/IpPA8b1/OjH/p71tTCuIeWqueI6q9cza?=
 =?us-ascii?Q?+JxqQoQbUOQnEZe9iukiYJhBQFycOK/Jqwdd4z1wDpjxlAjabSiN5h/69fbI?=
 =?us-ascii?Q?3PC9rVHbD3sLGEA1xTZSoQlNsbcIawynXkMpqEUyXmTvSIB89qcRMsVMkggY?=
 =?us-ascii?Q?zv3rknz3/xkV4bh7XTp2P0iJMCyF7VTDUDNHwxqUs+Pj3apr/3BxBUZWzWNJ?=
 =?us-ascii?Q?7w6SeN63RBqTdcBCRDJPWcicSiAJe+kOi1qH7+Dt4DUwV9vsGg7T8xOvsDGV?=
 =?us-ascii?Q?uFnlQ9nGYhFJpD11dgFqoVFfGNnhgX5wbLuITNLJsPPGZd+fr/J3rM4d6Q2T?=
 =?us-ascii?Q?pbCtQWIvEi5sUMWTJcxUj5H2qJkf7DqYwZ8u7cCOs7QJGHhYJtxcTpQ9zSGf?=
 =?us-ascii?Q?UQ/P/ObVvSFgNofFR6yAuq8ZwPNJjq67jXAAfSRErhvZxBurcbn2XARtXO+2?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f23bd1-0191-4cc9-f232-08dad3df3f80
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 21:01:42.4491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cp+t62fxeIaagY8ME7hMvTiYQC3VpKbVVTZBhg/a1rgp8Oe/1tbANNwj2iRUXvIFuVLD0xcUMG//VHxmaX0J42mcvhc/oLkHGjEZ0SGDST4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
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

On Thu, Dec 01, 2022 at 02:56:30PM +0530, Balasubramani Vivekanandan wrote:
> On 30.11.2022 07:58, Matt Roper wrote:
> > PPAT setup involves a series of multicast writes.  This can be optimized
> > slightly be acquiring forcewake and the steering lock just once for the
> > entire sequence.
> > 
> > v2:
> >  - We should use FW_REG_WRITE instead of FW_REG_READ.  (Bala)
> > 
> > Suggested-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Thanks.  Since this patch is independent of patch #4 (the only one that
hasn't been reviewed yet), I went ahead and pushed this one to
drm-intel-gt-next.  BTW, I noticed I wrote "mtl" in the patch title
where I actually meant to have "mcr" (this isn't a MTL-specific change),
so I corrected that typo while pushing as well.


Matt

> 
> Regards,
> Bala
> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gtt.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index 2ba3983984b9..e37164a60d37 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -482,14 +482,25 @@ static void tgl_setup_private_ppat(struct intel_uncore *uncore)
> >  
> >  static void xehp_setup_private_ppat(struct intel_gt *gt)
> >  {
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> > -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> > +	enum forcewake_domains fw;
> > +	unsigned long flags;
> > +
> > +	fw = intel_uncore_forcewake_for_reg(gt->uncore, _MMIO(XEHP_PAT_INDEX(0).reg),
> > +					    FW_REG_WRITE);
> > +	intel_uncore_forcewake_get(gt->uncore, fw);
> > +
> > +	intel_gt_mcr_lock(gt, &flags);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> > +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> > +	intel_gt_mcr_unlock(gt, flags);
> > +
> > +	intel_uncore_forcewake_put(gt->uncore, fw);
> >  }
> >  
> >  static void icl_setup_private_ppat(struct intel_uncore *uncore)
> > -- 
> > 2.38.1
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
