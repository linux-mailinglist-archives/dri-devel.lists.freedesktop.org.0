Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335497CACDA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D70010E227;
	Mon, 16 Oct 2023 15:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4F10E21A;
 Mon, 16 Oct 2023 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697468597; x=1729004597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GOjVAtOp9iPp9gXJKA/JowwGtNwhuZoUC6YBdUeTY1c=;
 b=K7rJMw5imaxTJSwZOTnBeTTMOPOttSS/ULCqX6w27RYDC1jd43/jNYG3
 RN/mNBpI40RxiZWaMAuWV/bhsx76wIHUnOPzNX8y23XzyQswVULAOo3Ed
 JIcnIrVh4vJ7P6Q9n16EzO5PlE0EoHlLThLRwg9zrwXBnXM6E5OhHniwY
 nYO0xQ0v9eKb7fRVAJrM7KNrGnx37d7t/ux/kaVBlcUyxyYGjfdPDeU0w
 frcoZ0OYYaoa7Viuy/dGsAfONzMHXl3ZA3xTFcUk9hNKilWiBPGqim8iL
 Vo/wqe3lhl72VqGd0FNFhnPfQKHVQxKIjvj751kw5NDmzS4VlEevnPbAT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389408493"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="389408493"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846416551"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="846416551"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:02:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:02:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:02:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:02:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+F/LeXQvaa48EcBqKAbqrjpdW6aDr/HSliZC2UDRTdT5oRks3vVZQd6SicD8ZgUf/FXoqSefaYKJzr009PH5mUqEGLkvtHAVbYcpWCwrARUWlqavN7jt7mg/Mjk9Gqk8pXmJx0el+RBinGR9TPJbP7NCCxVaLughZrw8PaLQmpJyhfpJY2SVSPLsaFlStq56vukiv26Yv/xARpALcbKA6tMPmHCKLrlY6T92FuBYl8dBRFCWxlk3etg3fqhHSI2SFEUS2MZVuJ0EIPz9c4zxKS1qcVzLNPXMFdHo/lZrunTImpTwMGXNv6NtQi/yn6S7G+5g/FvoXCGTVm+JhiVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhR36MecBgtvF/D/9V95ch7RuZwxmRJVL2m2BNEvwFc=;
 b=lSznIqIgSTiH2FwHWFXk/423R7gnfCWXeIbz8Fhm2QSKkcc0xZyMWatEAoZ+Cq1TRtLKsSEUMxFCANeKis4eRr1eZBX5f8SCw1n91pQrLsBHpBQsawe93vG0A18NwhTdeMoXjDCNsdokuU33Ob0XJMoo/BkTBjTxSiUdCUiNYRlqDIRkb1cqbkXWdly2xW3XNFqFU+mmrTVR3qQdfVCkJOdpL5w6vXBRb13KTCLtPgoOrz9KYnf1ZA/cO9tM0hzIKMWQTAbO6VKxvkGf3QDN8UrHowBnpKNK0PAfCCyjfLqwOFcc40OvgDbcqoYLxYQVcPXpdFGaN/IX8ljbyOYkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:02:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:02:11 +0000
Date: Mon, 16 Oct 2023 15:00:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <ZS1QHW9Y0iYPrFJ0@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-5-matthew.brost@intel.com>
 <f8316e1e-a4c8-46a3-83b8-2971d242fc7e@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f8316e1e-a4c8-46a3-83b8-2971d242fc7e@amd.com>
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: f6477e77-5faf-4d4d-0c20-08dbce58dfe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgXF0sBKZanwZLFhg+Tzzni23GzPEW6Llj+6FRkFvJJr/Gw3czGFDC49ckeTvcDuRr16s/iWMbzy8xzOC1grKzcRxRkKG6D96wv7CofSsvz3xzxScFFRQw6Jm1RlhePCIvngYdlcPOdQT6c6W6Or2f25gR7ptwPjSOLun0ejXI5NJZ0tt2+SKWYMrjcmvvKbLWDPN8EgjrGFHcvGmGp/f4fDQPH5Q+J0tQbmYkYH72VeNuToZVW82/6o9zqPjPK4fd5BN0HTpO1SbwotwmVyuyi8Sl12EVCQUqT5Tjpw22bSvHRhmJk9Su6aDw8IusECRZ8NI8hzvy/tUB2k6d6NAzd1ts3j8VwY25XmimsghwaB0q1gLa2/zXN3oIzsolr90TixuN+oSfM+bXSq6D/PpUMlUCuEn5OX2qb/LZsol8WhA0ywyEIm06iNksqILTS0xKFSR7ujjzY+LYWG2LS9/Mme/cKzhHdydYblvQmhq5OxFEAQLSGIa7Q8ksn03Cmbk305JHWDBdxLof+9hewdtEBMGpLPq0eUEo2gpSn8lAaFmIB9aDjSOel3C14gw5+uCCfO54nc+Vl+FhNbu+gsJsL+M8BEiP8rcXFhTRPxe1Dvlf1UZUeumoZ9WxZqoMuDfegnhkZphQx8X+4CuheYWUnbdhDkzOcmcXAX0+EGfH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(66476007)(66556008)(7416002)(4326008)(8676002)(8936002)(6916009)(66946007)(316002)(41300700001)(44832011)(5660300002)(478600001)(30864003)(2906002)(53546011)(6666004)(4001150100001)(86362001)(6506007)(6486002)(82960400001)(26005)(38100700002)(6512007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qjZuHpoAFPZz1W9Wx1iROCtcWwC9ZmHUUVrgaL9bHor7JSleRxbIvWf+bJaL?=
 =?us-ascii?Q?0W59R5bQmJvL0nMzwZItBMOeNLEgxwqifMGc20gjYPeebXcg/tfvjcx8qCWF?=
 =?us-ascii?Q?cBZu1Kfx7zOtUrJGgRRzyYwVh4hCpxWl/LJIEG3nFBtJQOVERgz1vAtBmQzz?=
 =?us-ascii?Q?HEN5sDjPGU4uL9fggsz7PDMxTlCUxRq7PQBZ7V2LHYJ+2LfJWOnC+jjH4SZd?=
 =?us-ascii?Q?QA7wGdlIVI7YfVkskefnIVRoUTwdr9yq4vnrdXefI+I6QqpyG2DP7yeB4H+0?=
 =?us-ascii?Q?D3ummk1P5BAll9FBVz0vXozNzvtCx17O4JWgSleH+Dr36Y69xWIQ1I8i66i9?=
 =?us-ascii?Q?spMeYSFwoktBOCrL5KIhMepYlpvp9F598amn5eS2VrLx6qz8aB4f2xqDfjWX?=
 =?us-ascii?Q?DDizC04u1NPw0bedVJb8TlYlJeQxXUAlo4lp7DSbelR1Mmi10xPyaYD9b7Or?=
 =?us-ascii?Q?y1w2nc76uFgd6J6FWuyr1Ewn5zWiW6iQuDEfeOpyJWjgO0V13p/qdifobehV?=
 =?us-ascii?Q?KF1VAgZL1fXuF9rm4I957nahRLE2BVpNCV8fZoszHAWD0Jk1gSsHaKFZdOSd?=
 =?us-ascii?Q?ppJBUtNVwv52bICZwE3idHy25b5b6S5FDxLdZjcjAJD+9AeJ34IV3DR0SXAZ?=
 =?us-ascii?Q?jDRI5HDz9LKiqrRav8aqy41ArSV+mS8TjADs0IuQshJ5qXer1SBNLqwRzNMR?=
 =?us-ascii?Q?CaruYUdZv4j2AS0Z+I3R0BnF73kLn5So1AnHLHAK1UXjaf5qXLaWzPq/JICl?=
 =?us-ascii?Q?R/kxXMcM3smUphjwHCtLPhIQvszPDtqmmrkcAS7jatsUJ+QhuWKISdd/2LX0?=
 =?us-ascii?Q?yIx2HB19pshSqvobn2MOCT1yWvBEnJBorRqG6R5jYy4tDtuuxbvRhOSOQ3dX?=
 =?us-ascii?Q?5zH3cT9yhmWdSjFcHXKAbcu48Ez3df3jw7bt2b0YXJ4a1zmypZXRD5ah8KBV?=
 =?us-ascii?Q?ge2panJiNDOZcHT7kjpSySt8ComPr8/xt44/qiE2z3yIC5lD5LM/N5v9NsLw?=
 =?us-ascii?Q?hG0CcqPOqDhdJabaajLez12F1OITSor/bwC09rR//4Zed11O7X/6TnbOKraG?=
 =?us-ascii?Q?mskPZxAGR3UZihYZTjc7eETrugamWw4VqLG6ka5W/t2SWVZQQRAwGd7v7e0Q?=
 =?us-ascii?Q?UWXwNbs8cyra5/PLLSHRVVK+qY7ydZB9gz3SHLJETEaYOCAOqNRQtPagaSfJ?=
 =?us-ascii?Q?lXGstQrV/qNd0cyPxpOKqrG/d4M8aB5FrYdwjEoIjkewgE2nB9+3UxARYAK4?=
 =?us-ascii?Q?cFIBywirkHRi/lZjShk7FrG/B8Hw6gCvMDhvz50i97K5vVumKX1aWEmOgeJj?=
 =?us-ascii?Q?XAWyY3HUIRDw04RPbTJT4KzUyw5XukAU/SXf/ZgzO6g8El4iEQLe3Q2uDXiY?=
 =?us-ascii?Q?NVi7ClTgspGyxewwzfHWla20hyFTBWLT4DSeNFt0uPh5yeMQ4P7E/fJk0lQC?=
 =?us-ascii?Q?9Htn0/30YchovP91FXiIEmLaCjMHANY8GwCYudFzsKGDXJ9zh6ERGsCHa6Qj?=
 =?us-ascii?Q?RO+lmSKOLlq6UZXCpUZmhpoep3byRv/SdHT7BrsiG4n5roCyI4XQ4xoKZDN1?=
 =?us-ascii?Q?AuSDN4ddW0z/CX3UrdY1OwSaeDbUFR+yOB578U8eV7726Jf4SLztge/6Uqxi?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6477e77-5faf-4d4d-0c20-08dbce58dfe2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:02:11.3464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xuUuZOHENVN2tXFYFTLz6XhibdTHDEFxxKOZgHWz9GQvU7xoPDuq6D+A5A0nP8oEWGtxE/g6vZFyD758W31BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 10:06:18PM -0400, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
> > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > scheduler and entity. No priorities or run queue used in this mode.
> > Intended for devices with firmware schedulers.
> > 
> > v2:
> >   - Drop sched / rq union (Luben)
> > v3:
> >   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
> > v4:
> >   - Rework if statement in drm_sched_entity_init (Luben)
> >   - Update comment for drm_sched_entity_to_scheduler (Luben)
> >   - Reword a few things in DOC comment (Luben)
> >   - Do not check sched policy in for statement (Luben)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 70 ++++++++++++++-----
> >  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 86 ++++++++++++++++++------
> >  include/drm/gpu_scheduler.h              |  8 +++
> >  4 files changed, 131 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index cf42e2265d64..1ef3883764f9 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  	memset(entity, 0, sizeof(struct drm_sched_entity));
> >  	INIT_LIST_HEAD(&entity->list);
> >  	entity->rq = NULL;
> > +	entity->single_sched = NULL;
> >  	entity->guilty = guilty;
> >  	entity->num_sched_list = num_sched_list;
> >  	entity->priority = priority;
> > @@ -90,8 +91,18 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> >  	RB_CLEAR_NODE(&entity->rb_tree_node);
> >  
> > -	if(num_sched_list)
> > -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +
> 
> ^ This adds an extra blank line and scripts/checkpatch.pl rejects it.
> 

Agree this isn't correct, will fix.

Question - catch patch doesn't complain for me though. Wondering what I
am missing:

mbrost@lstrano-desk:drivers.gpu.i915.drm-intel$ ./scripts/checkpatch.pl drivers/gpu/drm/i915/0004-drm-sched-Add-DRM_SCHED_POLICY_SINGLE_ENTITY-schedul.patch
total: 0 errors, 0 warnings, 386 lines checked

drivers/gpu/drm/i915/0004-drm-sched-Add-DRM_SCHED_POLICY_SINGLE_ENTITY-schedul.patch has no obvious style problems and is ready for submission.

Matt

> > +	if (num_sched_list) {
> > +		if (sched_list[0]->sched_policy !=
> > +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
> > +			sched_list[0]->single_entity = entity;
> > +			entity->single_sched = sched_list[0];
> > +		} else {
> > +			return -EINVAL;
> > +		}
> > +	}
> >  
> >  	init_completion(&entity->entity_idle);
> >  
> > @@ -124,7 +135,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >  				    unsigned int num_sched_list)
> >  {
> > -	WARN_ON(!num_sched_list || !sched_list);
> > +	WARN_ON(!num_sched_list || !sched_list ||
> > +		!!entity->single_sched);
> >  
> >  	entity->sched_list = sched_list;
> >  	entity->num_sched_list = num_sched_list;
> > @@ -231,13 +243,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >  {
> >  	struct drm_sched_job *job;
> >  	struct dma_fence *prev;
> > +	bool single_entity = !!entity->single_sched;
> >  
> > -	if (!entity->rq)
> > +	if (!entity->rq && !single_entity)
> >  		return;
> >  
> >  	spin_lock(&entity->rq_lock);
> >  	entity->stopped = true;
> > -	drm_sched_rq_remove_entity(entity->rq, entity);
> > +	if (!single_entity)
> > +		drm_sched_rq_remove_entity(entity->rq, entity);
> >  	spin_unlock(&entity->rq_lock);
> >  
> >  	/* Make sure this entity is not used by the scheduler at the moment */
> > @@ -259,6 +273,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >  	dma_fence_put(prev);
> >  }
> >  
> > +/**
> > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> > + * @entity: scheduler entity
> > + *
> > + * Returns GPU scheduler for the entity
> > + */
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> > +{
> > +	bool single_entity = !!entity->single_sched;
> > +
> > +	return single_entity ? entity->single_sched : entity->rq->sched;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_flush - Flush a context entity
> >   *
> > @@ -276,11 +304,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
> >  	struct drm_gpu_scheduler *sched;
> >  	struct task_struct *last_user;
> >  	long ret = timeout;
> > +	bool single_entity = !!entity->single_sched;
> >  
> > -	if (!entity->rq)
> > +	if (!entity->rq && !single_entity)
> >  		return 0;
> >  
> > -	sched = entity->rq->sched;
> > +	sched = drm_sched_entity_to_scheduler(entity);
> >  	/**
> >  	 * The client will not queue more IBs during this fini, consume existing
> >  	 * queued IBs or discard them on SIGKILL
> > @@ -373,7 +402,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  		container_of(cb, struct drm_sched_entity, cb);
> >  
> >  	drm_sched_entity_clear_dep(f, cb);
> > -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
> >  }
> >  
> >  /**
> > @@ -387,6 +416,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >  				   enum drm_sched_priority priority)
> >  {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	spin_lock(&entity->rq_lock);
> >  	entity->priority = priority;
> >  	spin_unlock(&entity->rq_lock);
> > @@ -399,7 +430,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> >   */
> >  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >  {
> > -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> > +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
> >  	struct dma_fence *fence = entity->dependency;
> >  	struct drm_sched_fence *s_fence;
> >  
> > @@ -501,7 +532,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> > +	    DRM_SCHED_POLICY_FIFO) {
> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -524,6 +556,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  	struct drm_gpu_scheduler *sched;
> >  	struct drm_sched_rq *rq;
> >  
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	/* single possible engine and already selected */
> >  	if (!entity->sched_list)
> >  		return;
> > @@ -573,12 +607,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  {
> >  	struct drm_sched_entity *entity = sched_job->entity;
> > -	bool first, fifo = entity->rq->sched->sched_policy ==
> > -		DRM_SCHED_POLICY_FIFO;
> > +	bool single_entity = !!entity->single_sched;
> > +	bool first;
> >  	ktime_t submit_ts;
> >  
> >  	trace_drm_sched_job(sched_job, entity);
> > -	atomic_inc(entity->rq->sched->score);
> > +	if (!single_entity)
> > +		atomic_inc(entity->rq->sched->score);
> >  	WRITE_ONCE(entity->last_user, current->group_leader);
> >  
> >  	/*
> > @@ -591,6 +626,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  
> >  	/* first job wakes up scheduler */
> >  	if (first) {
> > +		struct drm_gpu_scheduler *sched =
> > +			drm_sched_entity_to_scheduler(entity);
> > +		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
> > +
> >  		/* Add the entity to the run queue */
> >  		spin_lock(&entity->rq_lock);
> >  		if (entity->stopped) {
> > @@ -600,13 +639,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  			return;
> >  		}
> >  
> > -		drm_sched_rq_add_entity(entity->rq, entity);
> > +		if (!single_entity)
> > +			drm_sched_rq_add_entity(entity->rq, entity);
> >  		spin_unlock(&entity->rq_lock);
> >  
> >  		if (fifo)
> >  			drm_sched_rq_update_fifo(entity, submit_ts);
> >  
> > -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > +		drm_sched_wakeup_if_can_queue(sched);
> >  	}
> >  }
> >  EXPORT_SYMBOL(drm_sched_entity_push_job);
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 06cedfe4b486..f6b926f5e188 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> >  {
> >  	unsigned seq;
> >  
> > -	fence->sched = entity->rq->sched;
> > +	fence->sched = drm_sched_entity_to_scheduler(entity);
> >  	seq = atomic_inc_return(&entity->fence_seq);
> >  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >  		       &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 150e5330f0fa..7dbb3392124d 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -32,7 +32,8 @@
> >   * backend operations to the scheduler like submitting a job to hardware run queue,
> >   * returning the dependencies of a job etc.
> >   *
> > - * The organisation of the scheduler is the following:
> > + * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO, the
> > + * scheduler organization is:
> >   *
> >   * 1. Each hw run queue has one scheduler
> >   * 2. Each scheduler has multiple run queues with different priorities
> > @@ -43,7 +44,24 @@
> >   *
> >   * The jobs in a entity are always scheduled in the order that they were pushed.
> >   *
> > - * Note that once a job was taken from the entities queue and pushed to the
> > + * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is:
> > + *
> > + * 1. One to one relationship between scheduler and entity
> > + * 2. No priorities implemented per scheduler (single job queue)
> > + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> > + * 4. The entity maintains a queue of jobs that will be scheduled to the
> > + * hardware
> > + *
> > + * The jobs in a entity are always scheduled in the order that they were pushed
> > + * regardless of scheduling policy. Single-entity scheduling is essentially a
> > + * FIFO for jobs.
> > + *
> > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to be
> > + * used when the kernel-mode driver is scheduling directly to the hardware while
> > + * a scheduling policy of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used
> > + * when there is a firmware scheduler.
> > + *
> > + * Note that once a job is taken from the entities queue and pushed to the
> >   * hardware, i.e. the pending queue, the entity must not be referenced anymore
> >   * through the jobs entity pointer.
> >   */
> > @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> >  
> >  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >  {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	/*
> >  	 * Both locks need to be grabbed, one to protect from entity->rq change
> >  	 * for entity from within concurrent drm_sched_entity_select_rq and the
> > @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >  			      struct drm_sched_rq *rq)
> >  {
> > +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >  	spin_lock_init(&rq->lock);
> >  	INIT_LIST_HEAD(&rq->entities);
> >  	rq->rb_tree_root = RB_ROOT_CACHED;
> > @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >  			     struct drm_sched_entity *entity)
> >  {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	if (!list_empty(&entity->list))
> >  		return;
> >  
> > @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >  				struct drm_sched_entity *entity)
> >  {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	if (list_empty(&entity->list))
> >  		return;
> >  
> > @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >  		       struct drm_sched_entity *entity,
> >  		       void *owner)
> >  {
> > -	if (!entity->rq)
> > +	if (!entity->rq && !entity->single_sched)
> >  		return -ENOENT;
> >  
> >  	job->entity = entity;
> > @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >  {
> >  	struct drm_gpu_scheduler *sched;
> >  	struct drm_sched_entity *entity = job->entity;
> > +	bool single_entity = !!entity->single_sched;
> >  
> >  	BUG_ON(!entity);
> > -	drm_sched_entity_select_rq(entity);
> > -	sched = entity->rq->sched;
> > +	if (!single_entity)
> > +		drm_sched_entity_select_rq(entity);
> > +	sched = drm_sched_entity_to_scheduler(entity);
> >  
> >  	job->sched = sched;
> > -	job->s_priority = entity->rq - sched->sched_rq;
> > +	if (!single_entity)
> > +		job->s_priority = entity->rq - sched->sched_rq;
> >  	job->id = atomic64_inc_return(&sched->job_id_count);
> >  
> >  	drm_sched_fence_init(job->s_fence, job->entity);
> > @@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  	if (!drm_sched_can_queue(sched))
> >  		return NULL;
> >  
> > +	if (sched->single_entity) {
> > +		if (!READ_ONCE(sched->single_entity->stopped) &&
> > +		    drm_sched_entity_is_ready(sched->single_entity))
> > +			return sched->single_entity;
> > +
> > +		return NULL;
> > +	}
> > +
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > @@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		return -EINVAL;
> >  
> >  	sched->ops = ops;
> > +	sched->single_entity = NULL;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> >  	if (submit_wq) {
> > @@ -1111,8 +1149,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	sched->dev = dev;
> >  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> >  		drm_sched_policy_default : sched_policy;
> > -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > +	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > +			drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > +	}
> >  
> >  	init_waitqueue_head(&sched->job_scheduled);
> >  	INIT_LIST_HEAD(&sched->pending_list);
> > @@ -1143,19 +1183,25 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >  
> >  	drm_sched_wqueue_stop(sched);
> >  
> > -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> > +	if (sched->single_entity) {
> > +		spin_lock(&sched->single_entity->rq_lock);
> > +		sched->single_entity->stopped = true;
> > +		spin_unlock(&sched->single_entity->rq_lock);
> > +	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +			struct drm_sched_rq *rq = &sched->sched_rq[i];
> >  
> > -		spin_lock(&rq->lock);
> > -		list_for_each_entry(s_entity, &rq->entities, list)
> > -			/*
> > -			 * Prevents reinsertion and marks job_queue as idle,
> > -			 * it will removed from rq in drm_sched_entity_fini
> > -			 * eventually
> > -			 */
> > -			s_entity->stopped = true;
> > -		spin_unlock(&rq->lock);
> > +			spin_lock(&rq->lock);
> > +			list_for_each_entry(s_entity, &rq->entities, list)
> > +				/*
> > +				 * Prevents reinsertion and marks job_queue as idle,
> > +				 * it will removed from rq in drm_sched_entity_fini
> > +				 * eventually
> > +				 */
> > +				s_entity->stopped = true;
> > +			spin_unlock(&rq->lock);
> >  
> > +		}
> 
> ^ Blank lines aren't necessary before a closing brace.
> 
> I've fixed both of these locally, and would like to try something before R-V-ing this patch.
> 
> >  	}
> >  
> >  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> > @@ -1186,6 +1232,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
> >  	struct drm_sched_entity *entity;
> >  	struct drm_gpu_scheduler *sched = bad->sched;
> >  
> > +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >  	/* don't change @bad's karma if it's from KERNEL RQ,
> >  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
> >  	 * corrupt but keep in mind that kernel jobs always considered good.
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 320f0a720486..e67b53c3546b 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -79,6 +79,7 @@ enum drm_sched_policy {
> >  	DRM_SCHED_POLICY_UNSET,
> >  	DRM_SCHED_POLICY_RR,
> >  	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_SINGLE_ENTITY,
> >  	DRM_SCHED_POLICY_COUNT,
> >  };
> >  
> > @@ -112,6 +113,9 @@ struct drm_sched_entity {
> >  	 */
> >  	struct drm_sched_rq		*rq;
> >  
> > +	/** @single_sched: Single scheduler */
> > +	struct drm_gpu_scheduler	*single_sched;
> > +
> >  	/**
> >  	 * @sched_list:
> >  	 *
> > @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
> >   * struct drm_gpu_scheduler - scheduler instance-specific data
> >   *
> >   * @ops: backend operations provided by the driver.
> > + * @single_entity: Single entity for the scheduler
> >   * @hw_submission_limit: the max size of the hardware queue.
> >   * @timeout: the time after which a job is removed from the scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> > @@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
> >   */
> >  struct drm_gpu_scheduler {
> >  	const struct drm_sched_backend_ops	*ops;
> > +	struct drm_sched_entity		*single_entity;
> >  	uint32_t			hw_submission_limit;
> >  	long				timeout;
> >  	const char			*name;
> > @@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  			  struct drm_gpu_scheduler **sched_list,
> >  			  unsigned int num_sched_list,
> >  			  atomic_t *guilty);
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
> >  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
> >  void drm_sched_entity_fini(struct drm_sched_entity *entity);
> >  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> 
> -- 
> Regards,
> Luben
> 
