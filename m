Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D44756F88
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99B10E2B7;
	Mon, 17 Jul 2023 22:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692CD10E2B6;
 Mon, 17 Jul 2023 22:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689631228; x=1721167228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yA3Oo6Nab1G1A0J8QI9SafvzIrtdzLGnjpWqNmC8Xb4=;
 b=HEYfUQUEN5qFbpgMGgo5y1CU+R33cCLqcneewPiMy7zoLkjz7/9AzbD8
 Hjiaz8D/apoe30vQDRat0IWnT3wGozi8JxF1OX+vwQisR9TSkg0ZMf1/w
 65HxcIFCFeczGxhbvn0RJFZXZVaSDE6XuyvLj5QVrvgYqbdjG1Bn6uLYs
 10v8DbaDn9opC3z01WC90eL/tY8vfVapcMIbxqnTnFZaSBbBnAZ+ktEcj
 QQ/AX3LrToqy6L6sfDNB8w+JKPg5aO1nX/rxuOyfNiGlmYkkDiXzgdEDH
 DWBAarme7Ffb5jOUM8tPgimrnYNL2qMv7YBZKVUubw0kbIXpAZXNbhpS/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346349786"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="346349786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 15:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054037807"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="1054037807"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2023 15:00:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 15:00:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 15:00:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 15:00:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 15:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk8DIf1GGHJxAZVYpCKVjMJ0S6CDJi/zA0/UBwelwHfss7ULKrfiEnaKwqvKPQW+mqgzaKyaezwi6qLmyir33m3QIHV0mq6hRkvrCakLgsxXCIRXANLDcWMql81uBBJ7iJdI0kZGrpvuut//FBi1Zd+7CkF9mvD/Iu8ts7aamrabpxizToEO4ImHZ35P05d5lJegqPvJSmW98Nta9oMsuOLLNBfhWI0KCZ+61W8uixW0dw7O8EWVldAt2RB76jv6sE61bWlBuT6F2y95PE9DSYiDaGSigFctZWM1ygQgxMb7uudFt74SnRc9nut+Qt5lCb4nIrHdF/RhYML572TQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L4O0SdSW+C+RiTyUUZqXpoznLpVzDtAD+vyMgY2DtA=;
 b=IJpUsV2pKHJKfr7cKLS+Sadw2ps2Qx07m73x0cg6QjF4XlLbvkdBtalZ2gZspX3d0rVRw3jDSx346NfEtZjd3AKLiFcSxBg1buGfT3BjzFaoFfd5ZQRKYglVnITU1ATldh9PscyYSqmavvXqSTPqmGL5FBCZmTJ80HXK3QK5s1zjD8IffDex0hJZI4f1z8qlJE+t68/bsbEW3+n1MS41kZBLrN3IlyJaPovZAPVBZz+J4zIJCRarbzmEf3s8yBTp7sP+dwzYGaeE/aBZrNruBtB21rmdQBOAyU+K38pBK/BwfQZhQwoLl83MQ0T8Xduy6P5PZzM4jB6h+a6IZNhc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Mon, 17 Jul 2023 22:00:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 22:00:21 +0000
Date: Mon, 17 Jul 2023 15:00:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <20230717220018.GH138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
 <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
 <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
 <ZLW4GXM17rdep1Ex@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLW4GXM17rdep1Ex@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: ad62c19b-bd21-4517-ee85-08db87113708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaWgqGPwbw84ea46qFWGgcbvEuLQHr/LDXSoq1+IjPNmBNxuPH42sXs9EOMPe6AE+p7lpjlmmg7Xvtge07ugptbTdNY6lRSi7I5uz7OcsRSHu8Nu9fWJeikAG0F5NgcOmZCI66rlaU4beAtTs5ryDhRDC7W4d8SZdPxs+DmN1ohvW2qBRLmB1oatHi21BOm9xt8d3aKc6IK0EpHJXXL9iFEGGsqTohp+p2Q0IXNizU61y9QJZS9dyCev9DncYVTpIsqcK0jN9wa0qyPKUSQG7lPW8eiRKCj0PISssIOQjugXnE61agSD7oJQq0jP2Dpp+GzvUa0WlPUo/Vv/MUiJqlTQTritzyTZo96dgKnIY+5n7h9o9m/bq9QUU8qgMo75rgaNsakv5Ipe20nGjJAYoWzsVMlpSdpveQKN8GdJaMwDoLxPIRyetJT+yjzcjd4moPZ1HW58abH3aWTfMWy6BHMadWt+hhZmm7iZ4aCdd/hjFvBVSSRz8CHEDgtZCT8KNzeHIrxlHRudbUWXGe4C48c1GxtdMhsUVGEZU4tka6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(2906002)(38100700002)(6512007)(82960400001)(966005)(83380400001)(186003)(26005)(1076003)(6506007)(86362001)(5660300002)(33656002)(8676002)(4326008)(54906003)(478600001)(6666004)(6486002)(316002)(41300700001)(8936002)(66946007)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIvFhpAJP33fVe9K5AV/8DHDzLRC/i8fMWe9zZxNeL1HyBThRPclvrLoCtzb?=
 =?us-ascii?Q?NKVrgGtmqlePYFXumbZynrPqLWH4hcOUTrMQ7PKw1++xAUdDV2eBggj/Jip3?=
 =?us-ascii?Q?nvQIU1thZk7LPHiP4ByDKGz6XPZNFrS1wk8GcsNnmSPuIUsHhvsPxtwDVI/I?=
 =?us-ascii?Q?0Ha4SgS0KEPu6VAj7+C9uD8/iJCvbVa9r7+v3rk4tMFQoih/ZS97WZeEI2Md?=
 =?us-ascii?Q?6ARrN1ueZrFlKwt/hn2WHDHfSacl3MHEK034MD4ut+x58eGkr5llIUcUa+T1?=
 =?us-ascii?Q?cGSfW7JQDidhxSQA5ZI2+F2YrYOB8aHlipv1dzH1uCZWbKYdssfs56bT2SMi?=
 =?us-ascii?Q?a44CiQmCgi98HJD1o3uRSm42uCdDXFKv1VN5WdxHD6SlcYjwdocryCOzNcQE?=
 =?us-ascii?Q?pcHq33QaxG+i0Eq8HHfzuaVW5Tl8NIozOwWMHgm5ldqPF5hl1J3j0Rf7ELkQ?=
 =?us-ascii?Q?bSR6q8qV+C9u8irI3pQChieQF5w/SMS2mcz0XfXDP+xJpULz+1d8hxdaOgOy?=
 =?us-ascii?Q?pa4BNYCoPB/FDjiA4mJsXVM7a32ADoMv5aqBQoObjhHdqY4xyXtdf5wW2lKF?=
 =?us-ascii?Q?JORfJLpndCS2mUIalLBhipe63xPscqpUQYUZErVR7eTkAzj6zajDFApuyf9h?=
 =?us-ascii?Q?Qt+MCgthJ3TQXgO54jdEyteSTCNGFNmUyRl/Q56o6EbWrM/FO2vrXvABfiJe?=
 =?us-ascii?Q?Vdk5fAhKVG/u9TZ6pRfCkyXWdnKikumEVNLYEBGHilcPwsCVGLvlEidvcvlp?=
 =?us-ascii?Q?oDSZP0pYC1NJYKLp0TA9yU3qBvxng2tUSKdYnl3Wzl3nFrFzPwSYsCw4V3WE?=
 =?us-ascii?Q?sFnlqzOerQtPzerY/P3SqO0Yfm7WyZTaLeOoQwmk/5a2DpjBtlk9DrI+BbMu?=
 =?us-ascii?Q?Fx45sDh49vnbvtZObUNCw1uxAfK1Jdiao+50hxPFnOpVhXckt6CZHJkHjI6r?=
 =?us-ascii?Q?ZPqMHZvvJF/MCb8L/BflsdGdt6ZGj69ZfcxFZ7hilHqq1VTxR7bEqBfhrHOw?=
 =?us-ascii?Q?3qi2Go2IynL7btNLW/PbJXUSQ1SBerhlSWo6gAYb6kygGa4tqcQ7IKVs7RXO?=
 =?us-ascii?Q?2nAcbNNbDBD1i8aX6LSohiC4v08HVFfZYnZ3iEQrAMLIcAFJlQlT9jm00a+E?=
 =?us-ascii?Q?LO3rKiH9wexrwCzHfbh4uYkfSVoisIjSiQdkuPbp8JTC5Xsj5YtRdaV3Gbso?=
 =?us-ascii?Q?LNGAzmMhjpyaMUui4Hu1V1NaYe6TSjmNUqaQTMtyrOfKNgDzgmUeIBzZqqwu?=
 =?us-ascii?Q?nOv0ZIOApW3iLNh7n652qR86epkHP6Y8rSlizmw0u32MfAftwgQsWam3AEcO?=
 =?us-ascii?Q?YhxUQfqGLYTqGgDzqLgCIpMrlXYbLDQizYIJmo1qVmNn6VXBGnozh5O2mP84?=
 =?us-ascii?Q?3qwWCNiKZlgOvS3kYYsH8pL7bFhi0GkUyU1cH+WITXnPqwuBhf8JxXQyEKKf?=
 =?us-ascii?Q?o4yUUG46r/lVmKYsUHffVvR4MLgHjqVaDCSiVYqqNDiVwseRcnBtUTs6hWjU?=
 =?us-ascii?Q?mqlqffI9j2sFVruiDjGQlW+6f6XTJsE13O5lcvKv1hoBM75ORPpli2w++nMr?=
 =?us-ascii?Q?fAlEQFsB/RW3iCVKP/Q4Km2UX0joldB7l8oPMoNJpC/torWgOpXBKkY9uNGI?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad62c19b-bd21-4517-ee85-08db87113708
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 22:00:21.1724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl+8YdV3VvMfr+cq9R0HBJeoPK6aODJd5j705GcUaS9zo5X/mQsk0TkqBDNu48hmhpv3N9Oeq0KB2FjGZGbTx68bVWaGOq0jXVE1KdF5Vm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 11:52:25PM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> On Mon, Jul 17, 2023 at 01:31:03PM -0700, Matt Roper wrote:
> > On Mon, Jul 17, 2023 at 10:54:37AM -0700, Matt Roper wrote:
> > > On Mon, Jul 17, 2023 at 07:30:55PM +0200, Andi Shyti wrote:
> > > > From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > 
> > > > All memory traffic must be quiesced before requesting
> > > > an aux invalidation on platforms that use Aux CCS.
> > > > 
> > > > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > Cc: <stable@vger.kernel.org> # v5.8+
> > > > ---
> > > >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > > index 563efee055602..bee3b7dc595cf 100644
> > > > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > > @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> > > >  {
> > > >  	struct intel_engine_cs *engine = rq->engine;
> > > >  
> > > > +	/*
> > > > +	 * Aux invalidations on Aux CCS platforms require
> > > > +	 * memory traffic is quiesced prior.
> > > > +	 */
> > > > +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> > > 
> > > It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
> > > assume !flatccs always implies auxccs.  PVC has neither, and there may
> > > be other similar platforms in the future.  We should probably add a
> > > helper function for AuxCCS, similar to what we added to the Xe driver
> > > recently:
> > > 
> > > https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1
> 
> Currently that is done in patch 6...

Are you sure?  Patch #6 consolidates things a bit, but is still incorrectly
assuming flatccs = !auxccs:

       if (HAS_FLAT_CCS(engine->i915))                                                                                                            
               return _MMIO(0);                                                                                                                   

> 
> > BTW, since this patch didn't handle it I was expecting to see another
> > patch in the series that quiesces memory for the non-RCS/CCS engines,
> > but it looks like there isn't one yet.  So we should probably add the
> > necessary MI_FLUSH_DW logic for the other engines to this patch as well.
> 
> ... where also other engines are handles as well. I left this
> patch as it is in order to preserve the authorship and it's
> original form.

I don't see it being handled in patch #6.  That performs invalidation on
more engines than we were before, but it doesn't add the missing quiesce
logic as far as I can see.


Matt

> 
> Maybe in patch 6 I can add the extra check for PVC as you did for
> XE.
> 
> Thanks,
> Andi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
