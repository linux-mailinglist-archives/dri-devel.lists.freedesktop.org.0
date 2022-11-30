Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160363DA2E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 17:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A70610E49A;
	Wed, 30 Nov 2022 16:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AA210E49A;
 Wed, 30 Nov 2022 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669824411; x=1701360411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V6imPJIliBgfrOteSStikeXEHNYusO327nKuF/Inw84=;
 b=G+i6n14BzPi9xIHic4EAokNHGIZIvWkudQbyjEPWYWvmO3Z84vm9Ega5
 izvkENrk6fCrSUeNTjSC9lMphvPnZgMUKVJEhxvMJc2hGNUDwlnA0xJAO
 Tq1ull7sn1FjK8KTb2z2G5d7+tiAnk2jbZXU4n1H0AGp7aiSk8sivudM9
 ii5SULjHgf0VXi5zfkXM80tjVnpYyM5FNBMs1iOTJws/ZKJAojvWd4O8b
 UelcCVFS/kBacjzv3usi/57wASyaTdEWhlr1kcuMTQt+1DCOR9nGCDLS7
 DGhQ6zsS5fISBLqW7/y1KBJNP4jaOFsgnqx3OCKMc6PwmzRsQ418Tk+wq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314129657"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="314129657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 08:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="733034693"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="733034693"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2022 08:06:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 08:06:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 08:06:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 08:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs+bvo0fNDXST1BI0IKpSkMTy2kyWlWjCtRuehf6QxaC7YdDJpBoeCsX9tn0AKNaRQeY1EHNqKpYCmkj9BA2Hk/t1rHb+fCgUUIkhvIMKKS8H8RDlT7WQ4dfHJRzPaj3vvWORVyFNDj3cQVuaFsLEt3gRhRRHF4XtYQ8/IWQRWXVb6vUisJWxA4vtr/X6/Y1jhNiccGVjne7fgXdz0UkPspZzRqGZDENhndMxnHIeSdEkQEzKHwDSOXdDSv9/IgKd9KX5Ge9MHQq4d2saBtwLVRL4/LKTwH8I2g2JU+qQQMaXK6eA+riVWQsqblZKULbJsdkr7lMAfGomwRzXHfkNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nuv5kcA4yrGqr2wEgHlAngo6COHPCTiUfC1orAQQAH4=;
 b=fgCnHE2QEEjsxG8+dRVCrmAZMXVIjRPMIZfZlwFdT0CcIgjAgHKBRC0Ifkdy2EQ9Cvg3DrTnCBqgMdF8Pg+jtYo9s+nTO4pAzx+uF/w23+rWh+XOBaXp0ls7Vp8Ldj/+UcUgh1licFa9//MEAXo033GLcNlnC/a/c25hq22sqwM1lBC8haeZBctIs0OdiTqVtMrN3/ZRQitAfFHHhm+0ilT46nwZaSqmz0ASlRGrM1EwgHaaHyY4/TQA35XTUTwGTmyA9dLldxCmcfyPy3BflJoAQHC1yApnJuxWznFTbxP74+dHIezryfiDd/xDjom3ekGGyCPbAsOcSvn2qyxGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by IA0PR11MB7840.namprd11.prod.outlook.com (2603:10b6:208:403::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 30 Nov
 2022 16:06:01 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 16:06:01 +0000
Date: Wed, 30 Nov 2022 08:05:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2 5/5] drm/i915/mtl: Hold forcewake and MCR lock over
 PPAT setup
Message-ID: <Y4d/Zm4EafytxS70@mdroper-desk1.amr.corp.intel.com>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-6-matthew.d.roper@intel.com>
 <Y4d76483JRj5d4RL@bala-ubuntu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4d76483JRj5d4RL@bala-ubuntu>
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|IA0PR11MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 7203e2ef-982e-4ca9-0d76-08dad2ecc684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fIgGfNBKQiIIDlPced7tIDE23WzglHxk/NU7wQivePRIUEGeYd74Gi+JqfdIuDz8Uk2RwO+DG32Kg6li3kn1ekF5xzsZMdoK7cZdvQqfYsaiu0Yeig+jFkCFwbx66xNmwftzQBw06pZ2Hl607i1X5YM86lf0i5BxDoRXfvD2WovTakP0spiF2u12i4+HJG7ezd7U3JqhVyn3O8JSN5Khg5unYYV62sbb7a1ZOfb/bBiclnYPylf7UG0BIM0+0r0JAIUjfkzWc9CeAEkmZmX8MMI7FfHNTWn6SgqTav3UgdFooTvksdD/gkFq0S8G7o+7k7ThVoLZaQHPA3yA6PeiXBllW8aSQyvVnNPdSgDV219jaWuEwh2SO/3M9lp+LvEaDzk/WP0pMR6qu1tbZFuatP/iXAsgW0W/Y+GKenl2d2Ci0uAvzHHewRefDSJvgpiehPEAozxQ7E47qSHlYeLyEgYMZ1dI/zELgK9K6CGU5i3mkiq96pkdTxortdEVq2X952V18aN7rkqHf81p4/SEsskm+itPopbavpIha3im2teTJJAfYUDAo2TrZvs+UhJ6+AkPZcvfbbnlX59cfRRMOuAHGm4p6T9RURq5aPzth3It4Od62nUqD7zh1GNZq3f/O4zPV8QHershkEgSB6rxWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(53546011)(6506007)(478600001)(26005)(6512007)(6666004)(86362001)(8676002)(66946007)(66476007)(6486002)(450100002)(83380400001)(4326008)(316002)(6636002)(66556008)(6862004)(8936002)(2906002)(186003)(41300700001)(82960400001)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CDMp9lkXArj6bNIqEHAoAMKmhKIqKHLbzeiDbV7EpaaiHCv3MQr7C/bVhN1A?=
 =?us-ascii?Q?BsYOXU2OPV6ovSFE0iGWbxNcc9Fmaq8U+BMjeor0bsrhr2zHwqtJc62gCwVL?=
 =?us-ascii?Q?ZtR4PjhFPLJKrbZqWScnIhg8Zbdn6oDv2yF227kbtMomZfbqec8TmNIAI327?=
 =?us-ascii?Q?bSBGjdA2TAeepebYIwoDHDS0yBjLgLEinPmkfoUmbQjhO4Lgoae+GbefDl9a?=
 =?us-ascii?Q?ep2roOaZbfqegbPMqAqQi9ELkagx91Sb2SY97dO2mVCDy9XItkMPdsb/UzKG?=
 =?us-ascii?Q?GRliyMlEHHS1JA7y7vSCLN7XTDPgGr662wsXnH8WYpC3sk//tT6xY0Lbv4wh?=
 =?us-ascii?Q?z6ZQaaAezyd8WcRJW6juPHLdC1f4nFzcTeRRuZtMJURUJk/0ztnm9fWhRybp?=
 =?us-ascii?Q?uhJPY2Ag/0BgXL7IzkBIe3RjyYhWMo9CR5jIr8U48b3yEWkNvNcefmy4fYkB?=
 =?us-ascii?Q?arr7dK9qEtfdl2CXUruyp4MNvfBEUBfpNJJ+1m4A7Srlqoj5Q1Rn3GcuRo7V?=
 =?us-ascii?Q?aZCbSev9JSTNXp+h8rlSC1XOScjBCPQvyO8ExWM88gLNgmeUgry4Z2mrxmBj?=
 =?us-ascii?Q?JooXUxLVnTQivB79HcTk5W4Rk4fi+tbeslfD8sgRGujP8ykArL0ZRUEw/QEG?=
 =?us-ascii?Q?W1qdtrbfCTBJ0Ial39Vs652J0mHLOK9A4jnegDMS0cvK6pEF3YBmlJWWWnne?=
 =?us-ascii?Q?WWZfOaf1ZxM4SLk8vPXbJU3ZGCv1u3DuPHpS29zrrY62z7X5UBID6Sex7nKn?=
 =?us-ascii?Q?D8OEz12TSl1tM25oIDjZ4BtMsCFdE/c3glSC4wDGaJvvJ2j52CssF40VTKEC?=
 =?us-ascii?Q?lCO/4ts2zb+qACXceECH/sChdgQOEYBv5BpXsJtXTmZiHxEcDHFSMnJCeqMV?=
 =?us-ascii?Q?A2FmGCKPLYRmcNM6UBufOd4AdkUOhJdSF+SuB1CC9yqJF+/5LR/DwAIV8qLP?=
 =?us-ascii?Q?DMbQ/hussqZCEGuQd5w1la0L7uRtLJT1lnTnaL/iNVPHdnfP9ddlVDa7ilaY?=
 =?us-ascii?Q?GD7m/s7zoIfCMINyWuKDxcsn7wzR/uWfMdPSB8h1o6zaYUJMWYjUT4ThZNLj?=
 =?us-ascii?Q?jxbXNtwvVEQ/Q9GGMKoIWOiEBBkTDp4PyaPvdVUfZCMCY+7QFtJmp2GJLHfZ?=
 =?us-ascii?Q?eR5jiX/sReOYf9rx4PUBcgWy54ckv95eYchDotN3ex3hl1MqrDz2wly2AfQe?=
 =?us-ascii?Q?9ApXvFbHbzHC8chXS1Y3+eb0XXT+Fxb+rfo4bB+dVNtFSCwBGq03+l4sILn0?=
 =?us-ascii?Q?IaV+AjQI+5LrwRjQ28siwaT/c07NqfFmv3bOJSCcYUg1PpalMUHgSyrG9rVa?=
 =?us-ascii?Q?0S7Qbh0oVftazLzRye4hWVAIj63OsTRp/LJsNjDFEicyFfGs1cW7bNHyLZDX?=
 =?us-ascii?Q?OIFruFDKvPU0MTLImcoiO8OnNcJDbTKoNao0GVfbJIy0x4Vkn70AhzizPuH2?=
 =?us-ascii?Q?EhdDaYbGvXO+en3zgQkkjIHogNbqOFMgFz6sSvg1rI0gsmtfNVA/dlspilYc?=
 =?us-ascii?Q?xtPq2z4An7rtoVTo97f5bbLA/dbWba7q03Bs2zfDIwMW4d0fy59DzGysLQ7v?=
 =?us-ascii?Q?kY7Ixj1+fkGPtwTuo4kMcSFcx/x9fEDxhzABISTxhIdw0ecoap4RgomTvIzD?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7203e2ef-982e-4ca9-0d76-08dad2ecc684
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 16:06:01.3191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcD7PT0IaH4QIiqs3MKECSvYpTN3vJWXVhNd5oyoN/IuHUATjKMR4mcGqKQGSf8VBJbbhcrn8yQwc9AODI3EWMhB6WAnYG4COJOTUwQBaQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7840
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

On Wed, Nov 30, 2022 at 09:21:07PM +0530, Balasubramani Vivekanandan wrote:
> On 28.11.2022 15:30, Matt Roper wrote:
> > PPAT setup involves a series of multicast writes.  This can be optimized
> > slightly be acquiring forcewake and the steering lock just once for the
> > entire sequence.
> > 
> > Suggested-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gtt.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index 2ba3983984b9..288d9f118ee9 100644
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
> > +					    FW_REG_READ);
> 
> I am not completely aware of forcewake implementation. I am wondering if
> the last parameter should be FW_REG_WRITE since it is register write
> which is happening later.

Yep, good catch.  Using FW_REG_WRITE allows the driver to potentially
skip obtaining forcewake and waking the hardware if the registers being
written are "shadowed" so it's always good to use FW_REG_WRITE in places
where we're only writing and not reading.

In this case the specific registers in question don't appear to be part
of the shadow table for any affected platforms (e.g.,
dg2_shadowed_regs[] and such in intel_uncore.c), so FW_REG_WRITE will
still behave the same as FW_REG_READ here.  But it's always possible
that future platforms could decide to shadow these registers, so it's
good to fix anyway; I just sent an updated copy of this patch making
that change.


Matt

> 
> Regards,
> Bala
> 
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
