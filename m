Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D7613D6A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 19:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372A310E120;
	Mon, 31 Oct 2022 18:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CF810E056;
 Mon, 31 Oct 2022 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667241381; x=1698777381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o+9AXUELuDzY2EvkngvvmKi09t/adLMVk0RsTrebdVs=;
 b=FJGl7/736ir+1ldR8O08OL0EiVzaHsz/i65YgRxqKcuAfusTdaH5TKwj
 fqGyrX+HgzRpqLsxVQqb+cAX7pzK2FLwlnO+W8nXoAr84Y5zrcSTdbQYE
 p4Kt1vHtXdRvib3txzqg9vJXs59XfoFwCd/9M1rJGwmjH7/tZfVjPvfR0
 hCRs9oJEwp+zX2AyXaN9V8LglOzJ3U771DYiyHIsuu5JHccu4chypwvMM
 vv3sXNNjDtEERn6Y2POFwBHaFKsII5YkzpsHrw/rbcT6CWhDGv02gSf6+
 3g8D1ix4QLgfWuFbXpGHJ4qGBHNHnLALdaMMKyQSbnWMlW4xb43Uzk6AQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="296391940"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="296391940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 11:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="722906272"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="722906272"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2022 11:36:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 11:36:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 11:36:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 11:36:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 11:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDcpVQh8xF5mfCKi3edmPQYIm/ExyqdIwicVR5HUtOiftM/c/okBj5CWqdEHupAuJaUlbqnMpW6EoATnDw7hBDZ3DhlCZeddYtoM+fi6navmDZ0K2CZMNglDeiKBnLsOkNEVfGCYG2mjoU9nqC2aIUFeo8OhGg2bN4ztdllLpilJNThP22AYRQmgduf50wx5unlhG3ej6CK7ghdjiMK3TcpWTV6PHbd40Yq0LJP8TtdL3vVqbTMXsV+Inqg+AsC5Z9t+rjhw4J2T0jjidYfoZdluy5gO4Rqpfi3n9mEUCfUaN28qrftYxjzcbcC5Yl3ypC6Cazigr/FlL3UZdwLXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlM1PssOKRaOxhMQCmjiFYQwj/w9Oc8Er01uLUgh3m0=;
 b=hl5I5wvhFe5Drko02mGkAbLXb+Mve406K9LMfIrz2KRl0+f01bVSjT/6w/rfR4ushiQpZTMQymLpfn3aMc1FqXtt3EBZGNPTBKXcQrOa27vqlMkDQ2KfS3rT7Sy5i+rwnGXX8slAUTs9nyMHPtvEcdDwRKLkIlMUqh8ygqosE7lYR12yxzrTlv6cXBMFDUZDzHACuBwu3dU1qoqv7k5Ly+bq65IoKJ2sZTlfjtb9yzUFBr9u4DU5oluRpInEmN0+TwoD0kch9m37FM/L4lAceRUK3n8zf2KOBi/mHfw4BI+fmxgAMSEHVQDCwYiMz4tVh0CTkf+hZ86rxhq/JAdofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 18:36:18 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 18:36:18 +0000
Date: Mon, 31 Oct 2022 11:36:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/mtl: add initial definitions for GSC CS
Message-ID: <Y2AVn5DQZI+mhbhu@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
 <Y1/3QfxBQt5Hs0m0@mdroper-desk1.amr.corp.intel.com>
 <d9b96da5-0995-1c11-5484-fb2518b4a563@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d9b96da5-0995-1c11-5484-fb2518b4a563@intel.com>
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW3PR11MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: b389cce6-18ff-42cd-b843-08dabb6ecc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5+Y+FTMJllvirtMTo3UlB4N1FicTqorqm6+fYxJzBOxrIMjp0qQxcWNwIM1vyWEJtOYWwYtUHois43E1ZQ2drDEyBCXlwcke2+wpMX4+HCQER9NMO6E+n1e0I4Hh+2DAUmDQm+Z4YKqa0AbZ3pqIO9vZknQeA1xZI0CPTeFgvSZxAk32SAd2lcR8ZyKRXqsWPxyj/5vZWrYjxXoODDtO78ik1N5Jd0eRGtImNtChc74CxejMDZBjq3eMzwcFUKwkuJHoB7c217ICqBmrDyjkqrSi8SMP7uHhZwu1YZ7qSuF70bzzOhQsQ1/fO/6MVrVjkrwyMRUCZhx091nVpbpFd1SIURpEypdXU3qrLZeJEh4HLjCun7dOXzi1NrAK9XEBhCs2JuhVNegp8gyf5JHvcd4YVfkwl5uOe1y2i0/bzq6+ZNc45eQ6i6Sf8+aYfdBxv+fx+OGzSo96zNkto9xX48LvoXetetl3P8Lcgrv4J0qVNEwNfXHVOzfGj4/nj3yS8jH5xuRQ6L1m9hLMzrQ+qShOPy3aAtADHqybswRlfGyOUuLEJyf7Vsy6ARfdJQfhggAQPiVOw0H7hlFXCYPvAGo8QSBD2rQ/q6jwgcm1JOpy+rrjYSSh92IMfuiK7WJb2RXX3mcqNHqaRLrKC9WB2PIDTe6+g1NLSq9V04eOIyudIdxKA7XUDJtqZlzwdVyAmJc2PzGORCgSuyVsCBwm9yenbTYHfgiOtl4GL/jPHMcCSv+D8sDztRJqdQ1phIv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(66899015)(83380400001)(6666004)(6486002)(2906002)(107886003)(86362001)(82960400001)(38100700002)(6506007)(53546011)(26005)(450100002)(186003)(66476007)(316002)(6512007)(4326008)(66946007)(66556008)(8676002)(41300700001)(6862004)(8936002)(5660300002)(478600001)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5mh+jxN3PvjuaImFbozBm8bFC/DZL5HXPQArmD3zcag4he4caiDVtuGf2Pd?=
 =?us-ascii?Q?wbW5w0UVz06wj1wGZEelxgerYEbuP9hJVH+JY3q9QswYO0hqBFVToSU8ywrh?=
 =?us-ascii?Q?USxTr5LG34tf4LL+3bNZwa7pNV3/xO4naJDcDJK47+T3D/fSUPAHtQ8CPbXq?=
 =?us-ascii?Q?9fNh+XvgOKJocVf4ZptJh8cY7NsG1Uu1AAKTdkTeHTV5JtB7BocLqLIPHVp0?=
 =?us-ascii?Q?6RRYc4d/kNj2nQJq21N2Lv/GjMSQOpB2DNagts7n7VQhDYLOv0JqliPEkkeH?=
 =?us-ascii?Q?VRb9AuWIo1OLikFzsKeuLhLntzBcY0qQDO+9RZt2eXKQazOR3mFwygQiJyBz?=
 =?us-ascii?Q?BCHkXfzu38uC9vmztV8TjqwAI6bwM8+FWWMyEP+Tu2m0Xrz00sWfPUOKzT8N?=
 =?us-ascii?Q?XF20anvVw+uiblukcbnDdtxlalBEsE0vYxTHj/oqx2VPnl0bgtNAZBbzmMW9?=
 =?us-ascii?Q?9/LY/4i3m38dSxuIJ9IsoAER/j+8I8rdh8QEmxg4IfQQxRA/okcjDXxJY4SD?=
 =?us-ascii?Q?vbMPMnmiAM1wbY8SfYXGCrWQYMuSb+vfO7ZJk/QXC2AzBRS0ysRk8LPJhWHh?=
 =?us-ascii?Q?q/SwNPxNkSEbym/BPC+fS+ax/9hRTT844vT5Uchc8nPh8REs4X+q6YbYCL3H?=
 =?us-ascii?Q?kyCYz6X2IUDRFehN9u77TMZAIqtJrnjhlvADW5xHLdaHLK+bBJfP+asaJSPG?=
 =?us-ascii?Q?7kkAaWrVvwr2Mnna6YFicnfCe+h3ZId0vmoiZ9xxoy+btGBym3n3WO3zycS1?=
 =?us-ascii?Q?jbNlKv5NW+LF/xLAMNnjbFriUMYDUOBkYcTiZEHLVmZ3tHEtdScjRTiRQpQV?=
 =?us-ascii?Q?s4DsXuX7Ui50kI1uRTGwwEhoe/7lFWF7B6iR9CEany/xYV4billkyfgsORR7?=
 =?us-ascii?Q?p174CYuqGedyot/Nqa5OSf0zLE1hvkV85CpM+5kL1cCI6DpVsMos6b2Isegz?=
 =?us-ascii?Q?Vn8SyyE5Z2ec7P6cO3rdmapnC47tb4sRJRnvQYNCX11HPw/6AxD2bGM1y6r9?=
 =?us-ascii?Q?QGSZQWUu86/gi2IfaNFn5X1WFh4jQBupRdo1BlS1mGtCDoLOAPm2yy3ukclE?=
 =?us-ascii?Q?olH8GR0WBZ8bMTBo0+yiGBxVT87WJyp6+B5X0AGP7cL5xqbAN8bpyNhqoBhL?=
 =?us-ascii?Q?wxiFgo/4FUhCz0JrJEQh48XUBRXSSYXDL+F2OacO0zMguN9qefmhsC1AKxXY?=
 =?us-ascii?Q?aej+sYDPhcQeUPYLSL6ZoED/Sl2LIeVqOmlVODoNG+LRaQQQw6kDsDfI4KT3?=
 =?us-ascii?Q?93BqMqY9yJ59HY5/vyiao+SPtFBoGUAsNKl1Wmu10oqAnxmm8hpiMUKSjU9R?=
 =?us-ascii?Q?qP6mkk3I7eIOembxy5mLnEleVunpNUenm58h6kXrKUY+OBukSqjTrtPqSRdm?=
 =?us-ascii?Q?E+lA1ljkz0gBnJ0LzQMrQrre9Oj+lF7K7zD7KMYzP6FNhSrWCQtJ/2Jc3nTq?=
 =?us-ascii?Q?Nw5wJEaKpDpNb1aghnvt0EptZtZ9FIB64U1dGAXWJorrZoDdvf19CCyW+3QI?=
 =?us-ascii?Q?zeF7podGaNtpTykDtIu99IhUas1tIbt50VrSUWtrTbu9EqcZiwMMdSSVxiNO?=
 =?us-ascii?Q?bFkaBFP+xV+ccmKSK1m3hOIOZkcEKamgxwecVCRzGi5kcv1ciZ6w/u+zikZC?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b389cce6-18ff-42cd-b843-08dabb6ecc8a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 18:36:18.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT/iAVj1GTBPYi8N/fGDJzxtgM3SXnSgv5EdXaZ0A4Vi2Mg2ddmjaVFyADBGoVrVgvxIIsX05kMaq8vIDLwfkBLGHVB9ifNFKLijZq0kS2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
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
Cc: intel-gfx@lists.freedesktop.org, Fei
 Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 09:43:33AM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 10/31/2022 9:26 AM, Matt Roper wrote:
> > On Thu, Oct 27, 2022 at 03:15:50PM -0700, Daniele Ceraolo Spurio wrote:
> > > Starting on MTL, the GSC is no longer managed with direct MMIO access,
> > > but we instead have a dedicated command streamer for it. As a first step
> > > for adding support for this CS, add the required definitions.
> > > Note that, although it is now a CS, the GSC retains its old
> > > class:instance value (OTHER_CLASS instance 6)
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Now that we have an OTHER_CLASS engine, I think we also need to deal
> > with the class -> reg mapping table in mmio_invalidate_full().  I think
> > the register we want is 0xCF04?
> 
> I missed that. Looks like the the situation is a bit more complex than just
> adding the new register, because on pre-MTL platforms CF04 is the compute
> class invalidation register. On MTL as you said CF04 is marked as the GSC CS
> invalidation register, but I can't find the compute one. Do you know if it
> re-uses the render one or something like that?
> Given that there seem to be non-GSC related changes as well, IMO this should
> probably be a separate patch to specifically handle the TLB inval changes on
> MTL.

Yeah, makes sense; we can follow up with separate patches for this.

+Cc Fei since he's done a lot of work on TLB invalidation and may know
what happens to compute class invalidation on MTL when the GSC takes
over that register.


Matt

> 
> Daniele
> 
> > 
> > Matt
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 8 ++++++++
> > >   drivers/gpu/drm/i915/gt/intel_engine_types.h | 1 +
> > >   drivers/gpu/drm/i915/gt/intel_engine_user.c  | 1 +
> > >   drivers/gpu/drm/i915/i915_reg.h              | 1 +
> > >   4 files changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > index 3b7d750ad054..e0fbfac03979 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > @@ -244,6 +244,13 @@ static const struct engine_info intel_engines[] = {
> > >   			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
> > >   		}
> > >   	},
> > > +	[GSC0] = {
> > > +		.class = OTHER_CLASS,
> > > +		.instance = OTHER_GSC_INSTANCE,
> > > +		.mmio_bases = {
> > > +			{ .graphics_ver = 12, .base = MTL_GSC_RING_BASE }
> > > +		}
> > > +	},
> > >   };
> > >   /**
> > > @@ -324,6 +331,7 @@ u32 intel_engine_context_size(struct intel_gt *gt, u8 class)
> > >   	case VIDEO_DECODE_CLASS:
> > >   	case VIDEO_ENHANCEMENT_CLASS:
> > >   	case COPY_ENGINE_CLASS:
> > > +	case OTHER_CLASS:
> > >   		if (GRAPHICS_VER(gt->i915) < 8)
> > >   			return 0;
> > >   		return GEN8_LR_CONTEXT_OTHER_SIZE;
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > index 6b5d4ea22b67..4fd54fb8810f 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > @@ -136,6 +136,7 @@ enum intel_engine_id {
> > >   	CCS2,
> > >   	CCS3,
> > >   #define _CCS(n) (CCS0 + (n))
> > > +	GSC0,
> > >   	I915_NUM_ENGINES
> > >   #define INVALID_ENGINE ((enum intel_engine_id)-1)
> > >   };
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > index 46a174f8aa00..79312b734690 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > @@ -140,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
> > >   		[COPY_ENGINE_CLASS] = "bcs",
> > >   		[VIDEO_DECODE_CLASS] = "vcs",
> > >   		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
> > > +		[OTHER_CLASS] = "other",
> > >   		[COMPUTE_CLASS] = "ccs",
> > >   	};
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > > index 1c0da50c0dc7..d056c3117ef2 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -970,6 +970,7 @@
> > >   #define GEN11_VEBOX2_RING_BASE		0x1d8000
> > >   #define XEHP_VEBOX3_RING_BASE		0x1e8000
> > >   #define XEHP_VEBOX4_RING_BASE		0x1f8000
> > > +#define MTL_GSC_RING_BASE		0x11a000
> > >   #define GEN12_COMPUTE0_RING_BASE	0x1a000
> > >   #define GEN12_COMPUTE1_RING_BASE	0x1c000
> > >   #define GEN12_COMPUTE2_RING_BASE	0x1e000
> > > -- 
> > > 2.37.3
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
