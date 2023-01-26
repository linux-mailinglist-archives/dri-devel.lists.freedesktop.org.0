Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B667D0BC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74110E138;
	Thu, 26 Jan 2023 15:59:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AE710E18E;
 Thu, 26 Jan 2023 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674748755; x=1706284755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FqXiwRDrl80nzG12u3pBoSnImCiYiQ+FxFKICP2C5lA=;
 b=Ed5Dyo+0uGy+EXM7wC6moX4+Px3MOai1iNRzzXC/Rn+JptKGriEtD/Ok
 8ev1Vu64OOpYy8d5mTgF1JW00k37/rBpN8eaZbBpdMTGbbmoJUpkoNn7X
 ebujCrbpAZaHwKuJ46MfJGpderh9LGrpsgifXXEbnQnzaxWaqr/qaj0HA
 8CJfxuEDnj55ji4qxn4/iFCkWz0k2Mqjyv8ENaiz255Gzqte9py9UaODM
 gU4gKebkfN+Qieug3svEXeRLlB8xVfc3bdWLUfRgXYfEppan+TwEvOwuP
 rY44ezINIor7pon3nkKPcB3127+MEtajT0Sys/xeO4TZCqg7Se0y3iYYf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328951530"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="328951530"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 07:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="662908147"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="662908147"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 26 Jan 2023 07:59:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 07:59:14 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 07:59:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 07:59:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 07:59:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu/A00GLHkCmxOB/T1BzVDTzRmx6BAuM3BlZjnwlVYYY0QYMHROUbQOeL3q62mt8omsraH4fBB6ReUxDDHYiOQWrb97FQNHoZVU6TDUZ/Ha0xI+HD4Pj8n3dlomJDJ2+B7J5jeeLBklv8po2Mts3mHjAWSlZk0R6dUSjXYuV/sfa6P4TWhaeU4xxVjCN1+G+TY50NBhLp28Qvy4cp7+LiyS7jWtqxMo9pFgGpfVmFrTRshV7LznaFLGKI6pim4/9XB4kVCYw4M/msjk/eKLWJ4xb7n8BZx979PNfSDmy9jkwKlGT2gVULjTnaSeKl5/gk16djG/aGwFToG8tgLraeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpA+MuWau1S+inBOh4oibCh4dydh9oJMIcbo+Q2zF0I=;
 b=VMPgepcLSJa8AsxA1NTXVrr1NbdcmXBfdTzbpeXkR/KTT8cUYV/BUd6tCpQbHeVwKCvep4Z6QMNhnWwa3DCwlJ/MQWWDkUPyt90iFlppRgzCKok6H3nDfwrm8mX1+tMMxjjqCaWCKDNWFxbhN/rLXKLpFDEJQa6KLNsALtKBrjMdF2btgOfPX/I9wBF6ePb0NPwapZcq15jwH6Md8w3priaKvYJTxWV2GHyd7u4RAgwp7vE+ITpxhxTn87bv07/RKNHqQ96aSR82gRE5hIV3GzZts/NJBx1CnL0cJ70xbGV07o6livjQE0Ee7dXEi2lZFojx+hxM6Ba/rTkF86JGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5560.namprd11.prod.outlook.com (2603:10b6:408:105::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 15:59:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 15:59:11 +0000
Date: Thu, 26 Jan 2023 07:59:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/uncore: Use GT message helpers
 in uncore
Message-ID: <Y9KjTDr+xJ1TkS6c@mdroper-desk1.amr.corp.intel.com>
References: <20230124205426.1444686-1-John.C.Harrison@Intel.com>
 <7d0cdcb1-9ee4-c69b-4499-bf3cefb7a43c@linux.intel.com>
 <Y9F9RrdJnDhacze+@mdroper-desk1.amr.corp.intel.com>
 <eb4713e0-736c-4e95-f8fb-0692d2e53a8c@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb4713e0-736c-4e95-f8fb-0692d2e53a8c@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b5ea3e-3f9b-4b31-bee3-08daffb643e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1t/9TMIUjruVyFl4+VPKNS5CfVSVt3h3NiREAvoyE7gUalgyLC0jjCe1m13VTu7B0S6G2olN40e8Y+pT/mlMFOU1BUjD49cav1A8KVaGO//z8QwfgdSWPkw2ep7coHnfTmBMKTNxUIJzDLsYIIakYJYNZV+uYuywOe2EjCInbJjk2TwW7cWYg5V9gyKbovjMbyVIiO/blQospuWG6m4l8FPRys3LYCdByIMznY/fyeca0SpLXgv4qVo0R1+CxWujQxe2PncYDS3Dj1vRzFerjsq4fEQ/yMp+JySYyo7cUxkkcF8q7fr1xqzb27V68+HAUl9v7FVPcBw5ZRMCS/Gyz+3d2HapAeKmBAlR3WHQBxyIqMgDoyZqvgC9rUCEIWEbgYYBM7dJyhPkOva79btNWpp6HjJyMXVksE0YdbVFDEBumu3/4s6VqCRnkvNAy7HNXiQob+TaySrdqqyztrSba7a1Kl/O2GIm+5s89z7loGNlz2DIFntXbClTcsHCOU1p5bGV6ptcgW6M/gKbtMRstdHqVRkVnU3ITZhTmiOg2rO8SQ0ZYoZPLkVsw+eAeJRJGR+7Sa4hO820U1rCkpLUcdJXOt0vSPhiDa+m3MCjLp1tCC9TbHPnQF/oiMjhaPoHI7rwx9QM27ux/9CZzutXPZzDu1YJkQmLxuJAvZDcgiSYIHbzpAbQQkkDlyA5oXwT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199018)(66556008)(66476007)(86362001)(83380400001)(6916009)(66946007)(8676002)(316002)(53546011)(6512007)(4326008)(6486002)(6506007)(186003)(6666004)(478600001)(26005)(8936002)(5660300002)(15650500001)(38100700002)(41300700001)(82960400001)(2906002)(30864003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtaRCJ976+TglIUps5xCgMoGBuRf9aLwcT7j9MCgvjqXjDzRwQDNFUSfWocb?=
 =?us-ascii?Q?JxlntUBhgc3V1KdN9UxkM+3+dEz1DxmT2WcURf6ld2d+admGMHImvU++vRG9?=
 =?us-ascii?Q?yBUx8f/k8oZUclAiixMbIs+5T7L2roOQ/lgH2zMBmy4hvsnIcAsD30q7LyQh?=
 =?us-ascii?Q?vAQ3Pu/x2U4bnLwKMrAnqtnjoPyXAQDY2NpXYG83oLv7kjSbaP5s3wj6dx0T?=
 =?us-ascii?Q?XoHKcTurZkT9YcqqQ7EjpSCEGVeVv2jbXS4NAQW6eSA49BTEWDF7LJV62sRa?=
 =?us-ascii?Q?ctrqSmZyPS0M9wrUn3RDEPIlPD17qtt9J5BVHpq3Wkbx0nNEfxMpc+kzu0e2?=
 =?us-ascii?Q?sW8kyFPFyli9afc+xaWlqlVxH4feAjVuJJ9hB6QmdQ8rvToReog2TFYbYAGL?=
 =?us-ascii?Q?7beDsZ6lgEurK/mu4/K2Bs2tt0eGtaZk3dNrsLY33cqHT8cRIxT/Nr2+jNA5?=
 =?us-ascii?Q?iPKvo7EqnskCAf+54xGvmoje9s/9rarIw6zQghD8nvCahX2DbT7wIN13MCmh?=
 =?us-ascii?Q?jazE//6QZ5yCZzO1g6PiL22UMr99MnQPorGum5CSQ7SkxCEf1Xv7d241imrl?=
 =?us-ascii?Q?XAWfYLkJMFrk+mcq5c70jQVhNKYaJrb0xNnQZGPG1wjTvNf0Uj+Bt9D0SR3/?=
 =?us-ascii?Q?EQiqm6c4Gecm1KhprhLkLiC52JfjWOb9GRbn9T3QCt4osjVAz9QKL+pxeedk?=
 =?us-ascii?Q?3cXqA/aPH4BkHgPKwALtcMrlYOKP2qZzsGjqClsYDH1gmNJ5uysmAIoLA6bW?=
 =?us-ascii?Q?PafyyRdZbDuuztfMEv58vK0IrP0GHzp399Xv0jbXnSgNlhjSz+vWmzrrlGfX?=
 =?us-ascii?Q?4jCfWymGCZADoZp7WYwvt7Lw9ao+ej4OSpEwWsX2s37N9FOvQBnFvR3dCaLN?=
 =?us-ascii?Q?YCTFA8nEDVdw9zu4Z4eQx3htSlbrHEe7sr9Pn6nQtTop0SZSW4gabkVDz57H?=
 =?us-ascii?Q?bvxPww7+qw/mbbXUbpXo9mahlUHqokowf15if0Zg8ZnJpGK5YZnyJTbXiYIF?=
 =?us-ascii?Q?50O5rrl2gvxf84wzWQKlkzz572sYqFMosAHnDywKBHAfooCNab+nfUV9Uym9?=
 =?us-ascii?Q?7w6g+JB/Qo2eUceDPojeD07CORV1CLeaI+eW6twYLd3JYVXYaBDtN6ATiMQt?=
 =?us-ascii?Q?QMbtgo651nMxjZT6NVe7Qjx8+YEfpt358fkoswn33fK1AOAYscI7eWNqOL+h?=
 =?us-ascii?Q?R8sElZhQP75QoV8BP1KPD1zUMi5TKKFCj8bEbf8sE1E8UJ8EmJ2dCxDm+0vC?=
 =?us-ascii?Q?lsmAT/eeObcsLq+JoBaXhZYWCjPK+/Wb/zsgCROUr21PqSgd7rQ8YfViSaJv?=
 =?us-ascii?Q?2cZw9UAyqwkK80ebeuMg4zGqIF0N7EkbGuWxBK5nEQ1zWzWiKpGKlvbdmtqv?=
 =?us-ascii?Q?AX+2X7UCnTJJXqzZ7eoRqKsvQy5GCbgdmqAoMf09WiOJyeAAoOwd/yUvAXNO?=
 =?us-ascii?Q?5Oxgk4uw/TB4+ftVbNTSdr4WWFr+5mdKpufMNxS2kBLhB2b1vMnOFyuP9wpn?=
 =?us-ascii?Q?7+Fx8YjEclQDHZPfJIwnrhZqEIN43KeCisxDVd8EfUw9WWy+29XrqLroKyr7?=
 =?us-ascii?Q?9FSOhDPaPjyue9/3F6EqCt96+loqbYM1HcZZCzDx1z4llSwroW6RD0eYbA1t?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b5ea3e-3f9b-4b31-bee3-08daffb643e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 15:59:11.6586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A3og1SYzRNN/NPQLjhPQFbxLR4kJlFNG2vjd3FdqO8TJ2NmllGHhwUu+FxecF0+ZeXlriZmF0yf/hoB9m3Y/pxU0vAiVypxQa0yBA1Boz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5560
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 10:46:01AM +0000, Tvrtko Ursulin wrote:
> 
> On 25/01/2023 19:04, Matt Roper wrote:
> > On Wed, Jan 25, 2023 at 10:51:53AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 24/01/2023 20:54, John.C.Harrison@Intel.com wrote:
> > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > Uncore is really part of the GT. So use the GT specific debug/error
> > 
> > That's not really true; uncore should be outside the GT since it's used
> > for all kinds of non-GT stuff as well (sgunit, display, etc.).  I
> > believe "uncore" is just an old-fashioned name for what modern docs
> > refer to as "system agent" these days.
> > 
> > Granted, our i915 design does stretch the truth quite a bit today by
> > rolling some of the GT-specific concepts into the uncore code (GT
> > forcewake/shadowing, GSI offset, etc.).  Having two intel_uncore
> > structures on a platform like MTL doesn't really match the hardware
> > reality at the lowest levels, but allows us to update the software for
> > these new platforms without major, intrusive changes for all platforms.
> > 
> > I feel like including 'gt' information in log messages unrelated to GT
> > might be confusing.  For display stuff it's probably obvious that the GT
> > information is bogus, but when stuff is related to the sgunit it won't
> > always be so obvious.
> 
> Level of confusing vs absence of debugability and a suggested way forward?
> Just do nothing and accept any forcewake related errors will not include the
> originating GT?

I guess it's probably fine to keep it on all messages; people will just
learn to ignore the bogus GT stuff on things that aren't actually
related to the GT.

It would still be good to change the commit message though so that
people doing git archaeology in the future don't get an incorrect
understanding of the relationship.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > 
> > Matt
> > 
> > > > message helpers so as to get the GT index in the prints.
> > > 
> > > Conversion looks good to me and on balance it's better to include the origin
> > > in logs even for messages which strictly are not GT related, than not to
> > > have the origin at all (intel_de_... helpers, I *think*).
> > > 
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > I'll just add Jani and Matt in case they have a different opinion.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/intel_uncore.c | 133 +++++++++++++---------------
> > > >    1 file changed, 63 insertions(+), 70 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > > > index 8dee9e62a73ee..4e357477c6592 100644
> > > > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > > > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > > > @@ -25,6 +25,7 @@
> > > >    #include <linux/pm_runtime.h>
> > > >    #include "gt/intel_engine_regs.h"
> > > > +#include "gt/intel_gt_print.h"
> > > >    #include "gt/intel_gt_regs.h"
> > > >    #include "i915_drv.h"
> > > > @@ -83,8 +84,7 @@ static void mmio_debug_resume(struct intel_uncore *uncore)
> > > >    		uncore->debug->unclaimed_mmio_check = uncore->debug->saved_mmio_check;
> > > >    	if (check_for_unclaimed_mmio(uncore))
> > > > -		drm_info(&uncore->i915->drm,
> > > > -			 "Invalid mmio detected during user access\n");
> > > > +		gt_info(uncore->gt, "Invalid mmio detected during user access\n");
> > > >    	spin_unlock(&uncore->debug->lock);
> > > >    }
> > > > @@ -179,9 +179,9 @@ static inline void
> > > >    fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
> > > >    {
> > > >    	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> > > > -		drm_err(&d->uncore->i915->drm,
> > > > -			"%s: timed out waiting for forcewake ack to clear.\n",
> > > > -			intel_uncore_forcewake_domain_to_str(d->id));
> > > > +		gt_err(d->uncore->gt,
> > > > +		       "%s: timed out waiting for forcewake ack to clear.\n",
> > > > +		       intel_uncore_forcewake_domain_to_str(d->id));
> > > >    		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
> > > >    	}
> > > >    }
> > > > @@ -228,12 +228,11 @@ fw_domain_wait_ack_with_fallback(const struct intel_uncore_forcewake_domain *d,
> > > >    		fw_clear(d, FORCEWAKE_KERNEL_FALLBACK);
> > > >    	} while (!ack_detected && pass++ < 10);
> > > > -	drm_dbg(&d->uncore->i915->drm,
> > > > -		"%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> > > > -		intel_uncore_forcewake_domain_to_str(d->id),
> > > > -		type == ACK_SET ? "set" : "clear",
> > > > -		fw_ack(d),
> > > > -		pass);
> > > > +	gt_dbg(d->uncore->gt, "%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> > > > +	       intel_uncore_forcewake_domain_to_str(d->id),
> > > > +	       type == ACK_SET ? "set" : "clear",
> > > > +	       fw_ack(d),
> > > > +	       pass);
> > > >    	return ack_detected ? 0 : -ETIMEDOUT;
> > > >    }
> > > > @@ -258,9 +257,8 @@ static inline void
> > > >    fw_domain_wait_ack_set(const struct intel_uncore_forcewake_domain *d)
> > > >    {
> > > >    	if (wait_ack_set(d, FORCEWAKE_KERNEL)) {
> > > > -		drm_err(&d->uncore->i915->drm,
> > > > -			"%s: timed out waiting for forcewake ack request.\n",
> > > > -			intel_uncore_forcewake_domain_to_str(d->id));
> > > > +		gt_err(d->uncore->gt, "%s: timed out waiting for forcewake ack request.\n",
> > > > +		       intel_uncore_forcewake_domain_to_str(d->id));
> > > >    		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
> > > >    	}
> > > >    }
> > > > @@ -366,9 +364,9 @@ static void __gen6_gt_wait_for_thread_c0(struct intel_uncore *uncore)
> > > >    	 * w/a for a sporadic read returning 0 by waiting for the GT
> > > >    	 * thread to wake up.
> > > >    	 */
> > > > -	drm_WARN_ONCE(&uncore->i915->drm,
> > > > -		      wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
> > > > -		      "GT thread status wait timed out\n");
> > > > +	gt_WARN_ONCE(uncore->gt,
> > > > +		     wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
> > > > +		     "GT thread status wait timed out\n");
> > > >    }
> > > >    static void fw_domains_get_with_thread_status(struct intel_uncore *uncore,
> > > > @@ -402,8 +400,7 @@ static void __gen6_gt_wait_for_fifo(struct intel_uncore *uncore)
> > > >    		if (wait_for_atomic((n = fifo_free_entries(uncore)) >
> > > >    				    GT_FIFO_NUM_RESERVED_ENTRIES,
> > > >    				    GT_FIFO_TIMEOUT_MS)) {
> > > > -			drm_dbg(&uncore->i915->drm,
> > > > -				"GT_FIFO timeout, entries: %u\n", n);
> > > > +			gt_dbg(uncore->gt, "GT_FIFO timeout, entries: %u\n", n);
> > > >    			return;
> > > >    		}
> > > >    	}
> > > > @@ -476,7 +473,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
> > > >    			break;
> > > >    		if (--retry_count == 0) {
> > > > -			drm_err(&uncore->i915->drm, "Timed out waiting for forcewake timers to finish\n");
> > > > +			gt_err(uncore->gt, "Timed out waiting for forcewake timers to finish\n");
> > > >    			break;
> > > >    		}
> > > > @@ -484,7 +481,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
> > > >    		cond_resched();
> > > >    	}
> > > > -	drm_WARN_ON(&uncore->i915->drm, active_domains);
> > > > +	gt_WARN_ON(uncore->gt, active_domains);
> > > >    	fw = uncore->fw_domains_active;
> > > >    	if (fw)
> > > > @@ -520,8 +517,7 @@ fpga_check_for_unclaimed_mmio(struct intel_uncore *uncore)
> > > >    	 * to recognize when MMIO accesses are just busted.
> > > >    	 */
> > > >    	if (unlikely(dbg == ~0))
> > > > -		drm_err(&uncore->i915->drm,
> > > > -			"Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\n");
> > > > +		gt_err(uncore->gt, "Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\n");
> > > >    	__raw_uncore_write32(uncore, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
> > > > @@ -550,7 +546,7 @@ gen6_check_for_fifo_debug(struct intel_uncore *uncore)
> > > >    	fifodbg = __raw_uncore_read32(uncore, GTFIFODBG);
> > > >    	if (unlikely(fifodbg)) {
> > > > -		drm_dbg(&uncore->i915->drm, "GTFIFODBG = 0x08%x\n", fifodbg);
> > > > +		gt_dbg(uncore->gt, "GTFIFODBG = 0x08%x\n", fifodbg);
> > > >    		__raw_uncore_write32(uncore, GTFIFODBG, fifodbg);
> > > >    	}
> > > > @@ -622,7 +618,7 @@ void intel_uncore_resume_early(struct intel_uncore *uncore)
> > > >    	unsigned int restore_forcewake;
> > > >    	if (intel_uncore_unclaimed_mmio(uncore))
> > > > -		drm_dbg(&uncore->i915->drm, "unclaimed mmio detected on resume, clearing\n");
> > > > +		gt_dbg(uncore->gt, "unclaimed mmio detected on resume, clearing\n");
> > > >    	if (!intel_uncore_has_forcewake(uncore))
> > > >    		return;
> > > > @@ -847,9 +843,9 @@ void assert_forcewakes_inactive(struct intel_uncore *uncore)
> > > >    	if (!uncore->fw_get_funcs)
> > > >    		return;
> > > > -	drm_WARN(&uncore->i915->drm, uncore->fw_domains_active,
> > > > -		 "Expected all fw_domains to be inactive, but %08x are still on\n",
> > > > -		 uncore->fw_domains_active);
> > > > +	gt_WARN(uncore->gt, uncore->fw_domains_active,
> > > > +		"Expected all fw_domains to be inactive, but %08x are still on\n",
> > > > +		uncore->fw_domains_active);
> > > >    }
> > > >    void assert_forcewakes_active(struct intel_uncore *uncore,
> > > > @@ -869,9 +865,9 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
> > > >    	assert_rpm_wakelock_held(uncore->rpm);
> > > >    	fw_domains &= uncore->fw_domains;
> > > > -	drm_WARN(&uncore->i915->drm, fw_domains & ~uncore->fw_domains_active,
> > > > -		 "Expected %08x fw_domains to be active, but %08x are off\n",
> > > > -		 fw_domains, fw_domains & ~uncore->fw_domains_active);
> > > > +	gt_WARN(uncore->gt, fw_domains & ~uncore->fw_domains_active,
> > > > +		"Expected %08x fw_domains to be active, but %08x are off\n",
> > > > +		fw_domains, fw_domains & ~uncore->fw_domains_active);
> > > >    	/*
> > > >    	 * Check that the caller has an explicit wakeref and we don't mistake
> > > > @@ -884,9 +880,9 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
> > > >    		if (uncore->fw_domains_timer & domain->mask)
> > > >    			expect++; /* pending automatic release */
> > > > -		if (drm_WARN(&uncore->i915->drm, actual < expect,
> > > > -			     "Expected domain %d to be held awake by caller, count=%d\n",
> > > > -			     domain->id, actual))
> > > > +		if (gt_WARN(uncore->gt, actual < expect,
> > > > +			    "Expected domain %d to be held awake by caller, count=%d\n",
> > > > +			    domain->id, actual))
> > > >    			break;
> > > >    	}
> > > > @@ -955,9 +951,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
> > > >    	if (entry->domains == FORCEWAKE_ALL)
> > > >    		return uncore->fw_domains;
> > > > -	drm_WARN(&uncore->i915->drm, entry->domains & ~uncore->fw_domains,
> > > > -		 "Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
> > > > -		 entry->domains & ~uncore->fw_domains, offset);
> > > > +	gt_WARN(uncore->gt, entry->domains & ~uncore->fw_domains,
> > > > +		"Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
> > > > +		entry->domains & ~uncore->fw_domains, offset);
> > > >    	return entry->domains;
> > > >    }
> > > > @@ -1190,7 +1186,7 @@ static int mmio_range_cmp(u32 key, const struct i915_range *range)
> > > >    static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
> > > >    {
> > > > -	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
> > > > +	if (gt_WARN_ON(uncore->gt, !uncore->shadowed_reg_table))
> > > >    		return false;
> > > >    	if (IS_GSI_REG(offset))
> > > > @@ -1898,11 +1894,11 @@ __unclaimed_reg_debug(struct intel_uncore *uncore,
> > > >    		      const i915_reg_t reg,
> > > >    		      const bool read)
> > > >    {
> > > > -	if (drm_WARN(&uncore->i915->drm,
> > > > -		     check_for_unclaimed_mmio(uncore),
> > > > -		     "Unclaimed %s register 0x%x\n",
> > > > -		     read ? "read from" : "write to",
> > > > -		     i915_mmio_reg_offset(reg)))
> > > > +	if (gt_WARN(uncore->gt,
> > > > +		    check_for_unclaimed_mmio(uncore),
> > > > +		    "Unclaimed %s register 0x%x\n",
> > > > +		    read ? "read from" : "write to",
> > > > +		    i915_mmio_reg_offset(reg)))
> > > >    		/* Only report the first N failures */
> > > >    		uncore->i915->params.mmio_debug--;
> > > >    }
> > > > @@ -1913,10 +1909,10 @@ __unclaimed_previous_reg_debug(struct intel_uncore *uncore,
> > > >    			       const bool read)
> > > >    {
> > > >    	if (check_for_unclaimed_mmio(uncore))
> > > > -		drm_dbg(&uncore->i915->drm,
> > > > -			"Unclaimed access detected before %s register 0x%x\n",
> > > > -			read ? "read from" : "write to",
> > > > -			i915_mmio_reg_offset(reg));
> > > > +		gt_dbg(uncore->gt,
> > > > +		       "Unclaimed access detected before %s register 0x%x\n",
> > > > +		       read ? "read from" : "write to",
> > > > +		       i915_mmio_reg_offset(reg));
> > > >    }
> > > >    static inline void
> > > > @@ -2201,8 +2197,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
> > > >    	if (!d)
> > > >    		return -ENOMEM;
> > > > -	drm_WARN_ON(&uncore->i915->drm, !i915_mmio_reg_valid(reg_set));
> > > > -	drm_WARN_ON(&uncore->i915->drm, !i915_mmio_reg_valid(reg_ack));
> > > > +	gt_WARN_ON(uncore->gt, !i915_mmio_reg_valid(reg_set));
> > > > +	gt_WARN_ON(uncore->gt, !i915_mmio_reg_valid(reg_ack));
> > > >    	d->uncore = uncore;
> > > >    	d->wake_count = 0;
> > > > @@ -2254,8 +2250,8 @@ static void fw_domain_fini(struct intel_uncore *uncore,
> > > >    		return;
> > > >    	uncore->fw_domains &= ~BIT(domain_id);
> > > > -	drm_WARN_ON(&uncore->i915->drm, d->wake_count);
> > > > -	drm_WARN_ON(&uncore->i915->drm, hrtimer_cancel(&d->timer));
> > > > +	gt_WARN_ON(uncore->gt, d->wake_count);
> > > > +	gt_WARN_ON(uncore->gt, hrtimer_cancel(&d->timer));
> > > >    	kfree(d);
> > > >    }
> > > > @@ -2388,8 +2384,8 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
> > > >    		spin_unlock_irq(&uncore->lock);
> > > >    		if (!(ecobus & FORCEWAKE_MT_ENABLE)) {
> > > > -			drm_info(&i915->drm, "No MT forcewake available on Ivybridge, this can result in issues\n");
> > > > -			drm_info(&i915->drm, "when using vblank-synced partial screen updates.\n");
> > > > +			gt_info(uncore->gt, "No MT forcewake available on Ivybridge, this can result in issues\n");
> > > > +			gt_info(uncore->gt, "when using vblank-synced partial screen updates.\n");
> > > >    			fw_domain_fini(uncore, FW_DOMAIN_ID_RENDER);
> > > >    			fw_domain_init(uncore, FW_DOMAIN_ID_RENDER,
> > > >    				       FORCEWAKE, FORCEWAKE_ACK);
> > > > @@ -2403,7 +2399,7 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
> > > >    #undef fw_domain_init
> > > >    	/* All future platforms are expected to require complex power gating */
> > > > -	drm_WARN_ON(&i915->drm, !ret && uncore->fw_domains == 0);
> > > > +	gt_WARN_ON(uncore->gt, !ret && uncore->fw_domains == 0);
> > > >    out:
> > > >    	if (ret)
> > > > @@ -2487,7 +2483,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
> > > >    	uncore->regs = ioremap(phys_addr, mmio_size);
> > > >    	if (uncore->regs == NULL) {
> > > > -		drm_err(&i915->drm, "failed to map registers\n");
> > > > +		gt_err(uncore->gt, "failed to map registers\n");
> > > >    		return -EIO;
> > > >    	}
> > > > @@ -2615,7 +2611,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
> > > >    	 */
> > > >    	if (IS_DGFX(i915) &&
> > > >    	    !(__raw_uncore_read32(uncore, GU_CNTL) & LMEM_INIT)) {
> > > > -		drm_err(&i915->drm, "LMEM not initialized by firmware\n");
> > > > +		gt_err(uncore->gt, "LMEM not initialized by firmware\n");
> > > >    		return -ENODEV;
> > > >    	}
> > > > @@ -2646,7 +2642,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
> > > >    	/* clear out unclaimed reg detection bit */
> > > >    	if (intel_uncore_unclaimed_mmio(uncore))
> > > > -		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");
> > > > +		gt_dbg(uncore->gt, "unclaimed mmio detected on uncore init, clearing\n");
> > > >    	return 0;
> > > >    }
> > > > @@ -2721,11 +2717,10 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
> > > >     */
> > > >    static void driver_initiated_flr(struct intel_uncore *uncore)
> > > >    {
> > > > -	struct drm_i915_private *i915 = uncore->i915;
> > > >    	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> > > >    	int ret;
> > > > -	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> > > > +	gt_dbg(uncore->gt, "Triggering Driver-FLR\n");
> > > >    	/*
> > > >    	 * Make sure any pending FLR requests have cleared by waiting for the
> > > > @@ -2738,9 +2733,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
> > > >    	 */
> > > >    	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
> > > >    	if (ret) {
> > > > -		drm_err(&i915->drm,
> > > > -			"Failed to wait for Driver-FLR bit to clear! %d\n",
> > > > -			ret);
> > > > +		gt_err(uncore->gt, "Failed to wait for Driver-FLR bit to clear! %d\n", ret);
> > > >    		return;
> > > >    	}
> > > >    	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> > > > @@ -2752,7 +2745,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
> > > >    					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> > > >    					 flr_timeout_ms);
> > > >    	if (ret) {
> > > > -		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> > > > +		gt_err(uncore->gt, "wait for Driver-FLR completion failed! %d\n", ret);
> > > >    		return;
> > > >    	}
> > > > @@ -2911,7 +2904,7 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
> > > >    {
> > > >    	bool ret = false;
> > > > -	if (drm_WARN_ON(&uncore->i915->drm, !uncore->debug))
> > > > +	if (gt_WARN_ON(uncore->gt, !uncore->debug))
> > > >    		return false;
> > > >    	spin_lock_irq(&uncore->debug->lock);
> > > > @@ -2921,10 +2914,10 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
> > > >    	if (unlikely(check_for_unclaimed_mmio(uncore))) {
> > > >    		if (!uncore->i915->params.mmio_debug) {
> > > > -			drm_dbg(&uncore->i915->drm,
> > > > -				"Unclaimed register detected, "
> > > > -				"enabling oneshot unclaimed register reporting. "
> > > > -				"Please use i915.mmio_debug=N for more information.\n");
> > > > +			gt_dbg(uncore->gt,
> > > > +			       "Unclaimed register detected, "
> > > > +			       "enabling oneshot unclaimed register reporting. "
> > > > +			       "Please use i915.mmio_debug=N for more information.\n");
> > > >    			uncore->i915->params.mmio_debug++;
> > > >    		}
> > > >    		uncore->debug->unclaimed_mmio_check--;
> > > > @@ -2957,7 +2950,7 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
> > > >    {
> > > >    	enum forcewake_domains fw_domains = 0;
> > > > -	drm_WARN_ON(&uncore->i915->drm, !op);
> > > > +	gt_WARN_ON(uncore->gt, !op);
> > > >    	if (!intel_uncore_has_forcewake(uncore))
> > > >    		return 0;
> > > > @@ -2968,7 +2961,7 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
> > > >    	if (op & FW_REG_WRITE)
> > > >    		fw_domains |= uncore->funcs.write_fw_domains(uncore, reg);
> > > > -	drm_WARN_ON(&uncore->i915->drm, fw_domains & ~uncore->fw_domains);
> > > > +	gt_WARN_ON(uncore->gt, fw_domains & ~uncore->fw_domains);
> > > >    	return fw_domains;
> > > >    }
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
