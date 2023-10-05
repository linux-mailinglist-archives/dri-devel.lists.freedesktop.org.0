Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A77B9A9B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 06:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7410E3D2;
	Thu,  5 Oct 2023 04:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403EF10E14C;
 Thu,  5 Oct 2023 04:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696478619; x=1728014619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a+abdLY9XxvOEX6ULpA5Nf6HU9LAEWLhkOQ3wfm+LTs=;
 b=f0j5rZOdK7J+juco3xyDo/wL64ne7HTfEDq7IrH5W5AK+uYTY4MTMwHp
 udjmBSBwsUCVFdHSPVejHEcbUKL+HPRnqPm4/BMYmSCLrTEibU+Qy99DJ
 /Do10IWEiCanpEuTPF3tU9AUb6hm+oEQ8B1dglbZeyqT42Lj/CwNdEGg1
 HsnGW7pRue08L/LkWAIYaFhGpU+rfHNVJ7sHQMZgl6JVOMGiAwwYeUaWu
 SHLD+ZrnyNzMnF6p1jiiSNGNgJHlXJuc591mJD7WYji4Wl1vA+uw9yg0/
 qGtjc5hylj0sLDsSGMfF5LTG9DEaXX4cSoYhgI+WIgevlGXNr5dyUNPOP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363673016"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="363673016"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998793079"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="998793079"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:03:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:03:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:03:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:03:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJGUow5Wd1Ui8f2MZ9khzKZ9Ne3+05xiH1gj+3W6kBzizcSWBb0+sJhSvX8Lkee2quxMOdsgZ+VgMx3C69lqTLmTJXw3k5NEzH8mDobfsj3FOwfBnkN4HXPNpAGZH7osekSdivvkbFrV1YuRC9WMotJio9ZqKuczvKBX8YpbP9qQ4EvNBPdJXso38cF01QFrLZWSj1gRRlSJ/IZCKsxHOZdu8kNDwuNLv5rher7Cy5P0LiwVy/qvjlHkMFxFPViBGpSS+aMDfGjaE3mIZJLseQBKRaF/Pl7XW8/VRreFxF5ycn/yu/eRgJLH4eU3Ch7u9F6lD7n9e7N+HIPey4F2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5TvOGcRKdhlsyNYJWPuoVEBW8CNjOiS7RR8mR1Je1I=;
 b=Denkp0t8lavl3uoiTcykr/Op28T3IbL+2tIpR6uYENm012gXPpSaGd7WPbcU+xzu4LbpAGbXMnF1WYT8kY2r9g4PUcgMUh6+wgLu+GOOOACNXNHIasDCeNotVWTdU2jpjJgTgJ6wOl09ZGH9BQ6C4frsNchjdcjmrRPbWtDmJVsyttYEazG+poUurIb+sfqkKnNYz9yaI1faMaY7CJjYhO6SY6Sogwzaj5ef9PjSJD4dhniZNDHW6vWolNZeoOCl0B2KhIRf1N9xPakKXsXYRWVwLU7pvY/l0pONUHt6Fi2wMSdFDvTBR/Ryv5+rE/vz3SSFMDEJbBuGn2asRw207w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 04:03:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:03:34 +0000
Date: Thu, 5 Oct 2023 04:02:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 04/10] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <ZR41TcJzxa7h01cp@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-5-matthew.brost@intel.com>
 <8bfb2f07-fafa-4753-b37b-fb3f4c25cad8@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8bfb2f07-fafa-4753-b37b-fb3f4c25cad8@amd.com>
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c9fde9-ec07-4409-7b6c-08dbc5580af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffDJxL/sRzbQPNhEEIHD/VwnQ3jBtQVYFe55ZY9VYUUPQ60J+1xPpBHp54RW7Qcs7nTn77zua3V0hJGjKByXSaw+gndA0G19uT842IHVlzrW7+CbocSuEnr5MkgloS9a3LpdhZYe3+0ltxI8aJFk5rC/0NAjxSW3p0BCCG3KRuBI0uilzQoXcx4Qpm8tN0YH0VyKMXrytCwyUlwUDG/jVFvtR6PD07oUw7+VHL/r0a6kX9f9DmFNNDMRqSozjizDdeA1d1CmU13CEhwDg1ruPBRumwHfIy6crSN1zc0WxUvHrcFEkspppQmHmSQQ28R6oDQvFUnXxEOb8XiCLB2mdg1a1eFgfbHIejmqN6PoMzryEw9CXK/qwF9c5/YicpRjiIW6YhGYA6IhHqhajv2+qeY0ECajPpPCvm5UBA7+5fuR6dz1HuejaS32vV8oygnq45HgaDLWaHd+85rTmOmH3vqadFzU/ESmM/TmpmSgNMjzi61XG1MsS+hqvj0hGyuYiDYm1jvKN9b4O+7lcP3nyj32G9a+eiWYYOFidO2TcTGt0USGaklfWUr7UCHQDQOqE7xI0lABcp2Hs96jS4DjPwW42c5EcbAuLaPJtte1EohBmrUifnhYekX0dqvKTQR0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(66476007)(66556008)(66946007)(6916009)(316002)(41300700001)(44832011)(6506007)(6512007)(30864003)(7416002)(53546011)(2906002)(83380400001)(6666004)(5660300002)(26005)(8676002)(8936002)(4326008)(82960400001)(6486002)(86362001)(478600001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SaJFvH93BjXA9tbN3rdyVzM04fOq1GbIMZd3xZqspZr+iQE07aUCOKVijux9?=
 =?us-ascii?Q?qx9roriG5eCFTul4Ltpe9oPKDFQFCs54tDZN67TM1NQXqNWILNX34dKhABlQ?=
 =?us-ascii?Q?PB9a/gbpw2xoC97Zmo9Ps7QQzeGOj9UeYo7XiMwrYtG5kImi4FEQcPjZVq6o?=
 =?us-ascii?Q?5ophFTXnMVw3C4Dut8YrNy8FPK3rEy4Ud27UM5pDd/odfawzBu+sV/Uzyd5k?=
 =?us-ascii?Q?ND1eUXYBkKSFao6anc1F1dQakBJhwQRZQpLomMmF87rrvyXRKSqji8IWqKJV?=
 =?us-ascii?Q?xinx6Jo3w5iU5lZBHYl1MsSzBg1loVfrxqoTqMHvXuh/AWb7crcbFz26r6KM?=
 =?us-ascii?Q?1kZvMnTnRKQcjwQm1AHHkqjyJOmPaRoog/D7iNsUuxts2WVj4faS1ZF7C/ON?=
 =?us-ascii?Q?PGttOS2/Wxpm+PaasX7WJMjbdVq6FSgPdaW1Gke8oHeQOOgwd76N2pxXMsM3?=
 =?us-ascii?Q?rMtpfvlhN2pP2Y9Yn2TjgmZma1KOHQxiW7j/SF8zD03qxU/G7GTU7TMD6Tg3?=
 =?us-ascii?Q?VThYWZPwxyAeZuinOIp+oJDgAz71oH1++XvfgyPliN8HqwQhORUw18HEjLy/?=
 =?us-ascii?Q?9KJRmWTniThL9k0HrwYGt3SJ6MHrJ+BR2mUY/sV8I6Cp5gW+zZuH3a2m6jAt?=
 =?us-ascii?Q?F4vY++YsacdIby2249j2qdPlUFYFuX/5hjCeJkqmlGm/fzFeCFKZhe92kDO0?=
 =?us-ascii?Q?IR9pf36el0OrUJiNiFM319a6BRBEvqMszRv+kRne9TlnuassNKNe8D26OAmA?=
 =?us-ascii?Q?s5rsJmWQs/N3BDyIEWbzt/z1bu+DDMsOku9xI53fJ6qP8Wp90V0cE+H0hEdT?=
 =?us-ascii?Q?ImjB3RLZ5WWSQeHWKRqGWVl3aWbamCW5S9mLA+/DGkW0mGkAUNjax4he2MkP?=
 =?us-ascii?Q?XtGmZmvfJrDoFbpuEFzanajorxHLc1lzuGjlxP0CeGysV7Yea8bLpLtvJMyJ?=
 =?us-ascii?Q?/bhs9RbYJntdj/Jrpp4+rLr3dVpoar6L/OR0UicVjGCwB0EHm1zF5UjSdSkp?=
 =?us-ascii?Q?m8eQ3+PCpR3gTCpLnkZALdV93AMSxtTmr4IwlSYVedgx6XuDRf+NgtNFCeKl?=
 =?us-ascii?Q?s3Bt71g72VP7NxXIsC28xUl0+P0Vv6Zw3iLMd5kasj+vvf8HRCVjt12Qx69j?=
 =?us-ascii?Q?Cm5zuor+iHoI8R6LF1LynTtaQuVLTNOH6MLKXeai9yyM28eP2f4XpxYjq0Le?=
 =?us-ascii?Q?9tGSK/pRMsb6GRvya6u+Xwf3KmLlbRIozpT1jV4UUxafRefxh13xgjbHAFbx?=
 =?us-ascii?Q?R84oI7+31TMqu3t4OmZd3bslPxouC1HvmGlWfNByT1e0vJ38/A5uZw63OlG6?=
 =?us-ascii?Q?vd/ZQjtBpjReYauuRNE9QIKcTiFH1P+625WDZTtGc9RTOoo6VYoWXhFTGmfn?=
 =?us-ascii?Q?VISfUOfvSlHxhgI+ZdpfijhiV38BfPcwWuAKtwTO6KNBvgjCdUf0LLU9DQdb?=
 =?us-ascii?Q?MgZrLducwJGi+HjWnjAkEnIiz/hqoB3ToQlfKWvyGyQpfRoTP9F3S+NQC5Rn?=
 =?us-ascii?Q?SbH0gtRuKYoLvw7PRgoFUFKJ+C81RMRnfbBb5ndqvf72PiGl4Gs8dXbmW8Ud?=
 =?us-ascii?Q?gNGfvpBH00T7l5phy2yt3f6ThoTmbasuHlpzo8e3MeLRAiGJ7jUhGBNjoW2D?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c9fde9-ec07-4409-7b6c-08dbc5580af6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:03:33.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZvOuQqSLKpQBI84E73SlIFEdFQJdKEElwc2Y06rHsaGmkhyt9dgxEP4iIvdF8eNqtErioxznOoJNVDaD+V84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

On Wed, Sep 27, 2023 at 10:36:49AM -0400, Luben Tuikov wrote:
> Hi,
> 
> On 2023-09-19 01:01, Matthew Brost wrote:
> > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > scheduler and entity. No priorities or run queue used in this mode.
> > Intended for devices with firmware schedulers.
> > 
> > v2:
> >   - Drop sched / rq union (Luben)
> > v3:
> >   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++++++++++++++------
> >  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 64 +++++++++++++++++++---
> >  include/drm/gpu_scheduler.h              |  8 +++
> >  4 files changed, 120 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index cf42e2265d64..437c50867c99 100644
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
> > @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> >  	RB_CLEAR_NODE(&entity->rb_tree_node);
> >  
> > -	if(num_sched_list)
> > -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +	if (num_sched_list) {
> > +		if (sched_list[0]->sched_policy !=
> > +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +		} else {
> > +			if (num_sched_list != 1 || sched_list[0]->single_entity)
> > +				return -EINVAL;
> > +			sched_list[0]->single_entity = entity;
> > +			entity->single_sched = sched_list[0];
> > +		}
> > +	}
> 
> So much (checking for) negativity...:-)
> Perhaps the simplified form below?
> 
> 	if (num_sched_list) {
> 		if (sched_list[0]->sched_policy !=
> 		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> 			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> 		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
> 			sched_list[0]->single_entity = entity;
> 			entity->single_sched = sched_list[0];
> 		} else {
> 			return -EINVAL;
> 		}
> 	}
> 

Will change.

> >  
> >  	init_completion(&entity->entity_idle);
> >  
> > @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >  				    unsigned int num_sched_list)
> >  {
> > -	WARN_ON(!num_sched_list || !sched_list);
> > +	WARN_ON(!num_sched_list || !sched_list ||
> > +		!!entity->single_sched);
> >  
> >  	entity->sched_list = sched_list;
> >  	entity->num_sched_list = num_sched_list;
> > @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
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
> > @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >  	dma_fence_put(prev);
> >  }
> >  
> > +/**
> > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> 
> Please use verbs. Please?
> 
> Fix:
> /**
>  * drm_sched_entity_to_scheduler - Map a schedule entity to a GPU scheduler
> 
> > + * @entity: scheduler entity
> > + *
> > + * Returns GPU scheduler for the entity
> 
> Fix:
> * Given an entity, return its GPU scheduler.
>

Yep.
 
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
> > @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
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
> > @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  		container_of(cb, struct drm_sched_entity, cb);
> >  
> >  	drm_sched_entity_clear_dep(f, cb);
> > -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
> >  }
> >  
> >  /**
> > @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >  				   enum drm_sched_priority priority)
> >  {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	spin_lock(&entity->rq_lock);
> >  	entity->priority = priority;
> >  	spin_unlock(&entity->rq_lock);
> > @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> >   */
> >  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >  {
> > -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> > +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
> >  	struct dma_fence *fence = entity->dependency;
> >  	struct drm_sched_fence *s_fence;
> >  
> > @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> > +	    DRM_SCHED_POLICY_FIFO) {
> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  	struct drm_gpu_scheduler *sched;
> >  	struct drm_sched_rq *rq;
> >  
> > +	WARN_ON(!!entity->single_sched);
> > +
> >  	/* single possible engine and already selected */
> >  	if (!entity->sched_list)
> >  		return;
> > @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
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
> > @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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
> > @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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
> > index f645f32977ed..588c735f7498 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -32,7 +32,8 @@
> >   * backend operations to the scheduler like submitting a job to hardware run queue,
> >   * returning the dependencies of a job etc.
> >   *
> > - * The organisation of the scheduler is the following:
> > + * The organisation of the scheduler is the following for scheduling policies
> > + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
> 
> Yes, so this was badly written to begin with. If we're adding more information,
> I'd write:
> 
>     * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO,
>     * the scheduler organization is,

Yep.

> 
> >   *
> >   * 1. Each hw run queue has one scheduler
> >   * 2. Each scheduler has multiple run queues with different priorities
> > @@ -43,6 +44,23 @@
> >   *
> >   * The jobs in a entity are always scheduled in the order that they were pushed.
> >   *
> > + * The organisation of the scheduler is the following for scheduling policy
> > + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> 
> Remember, it's a list, on large enough scale, thus,
> 
>     * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is,
> 
> > + *
> > + * 1. One to one relationship between scheduler and entity
> > + * 2. No priorities implemented per scheduler (single job queue)
> > + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> > + * 4. The entity maintains a queue of jobs that will be scheduled on the
> > + * hardware
> 
> Good! But please fix,
> 
>       4. The entity maintains a queue of jobs that will be scheduler _to_ the hardware.
> 
> > + *
> > + * The jobs in a entity are always scheduled in the order that they were pushed
> > + * regardless of scheduling policy.
> 
> Please add here,
> 	Single-entity scheduling is essentially a FIFO for jobs.
> 
> > + *
> > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
> 
> "... is expected to _be_ used ..."
> 
> > + * when the KMD is scheduling directly on the hardware while a scheduling policy
> 
> I'd spell out "kernel-mode driver" since it makes it terse when reading a processed
> DOC format, and having a three-letter abbreviation spelled out makes for an easier
> reading experience. (There are too many three-letter abbreviations as is...)
> 
> "... directly _to_ the hardware ..." since, ultimately, the DRM scheduler just
> pushes jobs to be executed to the hardware by the hardware and doesn't support
> or control hardware preemption of jobs _on_ the hardware. (See what I did there? :-) )
> 
> > + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
> > + * firmware scheduler.
> > + *
> 
> Yeah, so that's a good explanation--thanks for writing this.
> 
> >   * Note that once a job was taken from the entities queue and pushed to the
> 
> Please only use present tense in software documentation. No past, future, or 
> perfect tenses please.
> 
>     * Note that once a job _is_ taken from the entities queue and pushed to the
> 
> >   * hardware, i.e. the pending queue, the entity must not be referenced anymore
> >   * through the jobs entity pointer.
> 
> Yeah, another good explanation--thanks for including this.
> 

Yes to all the wordin changes.

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
> 
> So here, I wonder, and I've a tiny exploratory request:
> Could we "fake" an rq for the single-entity and thus remove (become unnecessary)
> all those "if (single-entity)" and "if (!single-entity)".
> 
> If we keep adding code peppered with if () everywhere, over the years it'll become
> hard to read. However, if we use maps to achieve choice and selection, such as entity->rq,
> then you'd not need much of the "if (single-entity)" and "if (!single-entity)",
> and the code would naturally stay mostly the same and the sched selection would
> still be abstracted out via the entity->rq.
> 
> What do you think?
> 

I looked into this a little and can't really think of an easy way to do
this. Wouldn't we just end up with a similar number of checks in the rq
code? I'd say for now let's just live the if / else in a few places. If
we start adding more scheduling modes then perhaps we explore another
approach.

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
> >  	if (!submit_wq) {
> > @@ -1111,7 +1149,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	sched->dev = dev;
> >  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> >  		drm_sched_policy_default : sched_policy;
> > -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > +	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
> > +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
> > +	     i++)
> 
> So, "sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY" doesn't seem to be
> a loop-invariant, since it doesn't cause the loop to exit over iterations.
> It's just a gate to executing the loop. I am used to seeing only loop
> invariants in the for-loop conditional.
> 
> I wonder if it is clearer to just say what is meant:
> 
> 	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> 		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> 			...
> 	}
> 

Sure, will add if statement.

> On a larger scheme of things, I believe it is a bit presumptuous to say:
> 
> struct drm_gpu_scheduler {
> 	...
> 	struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> 	...
> };
> 
> I mean, why does a scheduler have to implement all those priorities? Maybe it
> wants to implement only one. :-)
> 
> Perhaps we can have,
> 
> struct drm_gpu_scheduler {
> 	...
> 	u32                             num_rqs;
> 	struct drm_sched_rq             *sched_rq;
> 	...
> };
> 
> Which might make it easier to fake out an rq for single-entity and then leave
> the code mostly intact, while also implementing single-entity.
> 
> It's not a gating issue, but perhaps it would create a cleaner code in the long
> run? Maybe we should explore this?
> 

See above. I'd vote for leave this as is for now.

> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> >  	init_waitqueue_head(&sched->job_scheduled);
> > @@ -1143,7 +1183,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >  
> >  	drm_sched_submit_stop(sched);
> >  
> > -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +	if (sched->single_entity) {
> > +		spin_lock(&sched->single_entity->rq_lock);
> > +		sched->single_entity->stopped = true;
> > +		spin_unlock(&sched->single_entity->rq_lock);
> > +	}
> > +
> > +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
> > +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
> > +	     i--) {
> >  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> 
> Same sentiment here, as above.

Got it.

Matt

> -- 
> Regards,
> Luben
> 
> >  
> >  		spin_lock(&rq->lock);
> > @@ -1186,6 +1234,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
> >  	struct drm_sched_entity *entity;
> >  	struct drm_gpu_scheduler *sched = bad->sched;
> >  
> > +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >  	/* don't change @bad's karma if it's from KERNEL RQ,
> >  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
> >  	 * corrupt but keep in mind that kernel jobs always considered good.
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 9f830ff84bad..655675f797ea 100644
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
