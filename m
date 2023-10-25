Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F57D7093
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1410E69E;
	Wed, 25 Oct 2023 15:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DA310E69E;
 Wed, 25 Oct 2023 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698246978; x=1729782978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kYZnEOvvxU4LOBw/6KSlroGSzIKhySXt6WPiCBJ80L8=;
 b=Y7KpnDMtmXw+xvklsUEv5JpIBpF82YFbsKfjXLuVEgwIeKrdVk6u+5h5
 ZuUOLxeSS9G5eamenR94HNiR2SX8pjdXI15Iuwygx/KJADbpz2T3xU8p9
 PuFViIBKO4NgtzNgjfLwkUYEvzB5SInhrvcFB22SIhGofztGJOivntgud
 FJPA4IxV1h6BJfd23hpfgZg/aIUypKorhMyg7Iw3YfwY3zHWp2sQeuny5
 w2ToS2uebkzMePdA8tI19AkTduTDIDQpzA4gO0ZvERhBbdZ6tc0elVPbS
 yV3mkmg5QUDKz488Mzm7Oob+NB1fy5ZT2K49F1VzMTgc6+PY3xEQaoFAP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453798257"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="453798257"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932379838"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932379838"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 08:15:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 08:15:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 08:15:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 08:15:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 08:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iazaUp1IzQS2PRj6Xsw7nWRXI3QAY984znppoehp/pDtrzYRnGbjl96OidIggiLAGEEgLKx0Dq0MFTfAlo3NCiU6btoJjdW0aaY8ELJrOwrz1cQfxkWmqua2bxK2nbCiuEm4cvzBissajS+Nny150WNGZrhXhOw7QfVASG8V4NHbkA1NQJvgOTexPBMfhmNJMTbavNBKdQyIltadTA78LwLLpc1XNPoOgixwTr3Eaa8ajT0UC7YNzGwtf1OGMKtP3O4U4IKrnDrbRolnyc5j6TOsTo7oIZ9My76B5qZPInQohTBUdiZ5s+eTDk1OuOwoY9yP7BepWMnURFM9OOKYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra5BcpB0s20TIUklCZSsnrw/japYq+HEb7K70tpzbtQ=;
 b=X3hHx3ZSjZighq/x4h4Qq8Rf3H1O9O3sFdKvM/AwRCQVSjtgt5gvRtFKbUGk8keU4QQzHeYji8T+zBGiCFPS0s3PraBWF/kgbmEfr3XJdYXvjkSLaP/5o6nU0NrZWOQjASqJ/Tie5JJ3dSvnNQPDar4pNFGWPod+hgTGM5pbe/hRDHA1E54+gGEOBUHhOpUjsb7CFm0ASjeAmMXlJT/ppDy0MaERDqP1i5Rr8am5itYM3GY7qmnc5KkLLWdV6dXtkmN3mbXj7Nzg0P6g41jZZbgSIgJs+NPXe88dJgMTHVywH0SgxyQftQuDSE0iM95gT4mORGX9wJUzXu+XZGdaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 15:15:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 15:15:02 +0000
Date: Wed, 25 Oct 2023 15:13:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <ZTkwqCdNvlrM9w35@DUT025-TGLU.fm.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-5-matthew.brost@intel.com>
 <b0dff3c9-933a-42c9-97ae-7b82cf842799@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0dff3c9-933a-42c9-97ae-7b82cf842799@amd.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 088cd1f5-6bea-49de-26ab-08dbd56d2955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gGtzp3CX6VdOJrMbo1RpMwCiFLjf0AXBfin8WJkrk+9YY2VEDQ2IGyulBk7Fz+oguD6e+S8LeByvtcQnCRDd4/7XKrTfY8s4gINYc+tdnwHzvCoSKJ+LLlnvSEd+e2NYBUH2uToitzsl4NbiC9Uz1UfoGKofL1YA2kqxIXw8qG6r2A8/UdWWF9Sk5sF8VTq4BL9q06B0qhoG4ETWC91x3Is/9ZVir33ujeaq3qD9ylNFR8DDlHtkbY01MqLrTC5LTke6kMbWKHY60Y82MKgSrDRUH/n1hLNIiKl3Sk5UPaG7MYcrZUqTnJbEhAzkMAa/SoQ6IQgFv/A3ZmtxXdUYdAe1u9PijKT3hnfAzGGJv/ytNB+64NZb6adNDudztvOtLQeX9ty2NJLB5FZFA9iNytt8hxWVOyOkBhPM09conRZMabQ2BFqBEkij1WONSEQiX06/NlmKFoz9ggtlLDwiJiHWe0E5d9d1RT9JGt6r0lbLN/OZWcuLQAqqqry46AAznuceNhgVj0F/sIOFo09xfXBImJZIIAt2xcwbQ6SASHOZWlooGGMAMyp+bJmBGY4JdwUrqs9uZn+WjSYej8WEhWBEud+TFcv2JcMSh3TbIV7QMeM1q5bgIYJkgHvt3BE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(2906002)(4001150100001)(30864003)(7416002)(4326008)(966005)(6486002)(478600001)(5660300002)(8936002)(44832011)(41300700001)(8676002)(6916009)(316002)(66476007)(66946007)(66556008)(83380400001)(86362001)(38100700002)(82960400001)(53546011)(26005)(6506007)(6666004)(6512007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFMjNgrIU7r50Dh1I78mw7iC79Mch7Gmv8UQazgxJVJWqSVh2e74krWV48ep?=
 =?us-ascii?Q?1DiBmse5L5h9oOLEcfV2zKJUEQc6Gg1JCebW9YYxH9I4K8XVDxDdAfWURlHP?=
 =?us-ascii?Q?+F5sxOnDRGOH0Ee/5BueRRh3USYOExkiGKQMasxeRK72O1hyh+3cmTTu9fLd?=
 =?us-ascii?Q?erGQNi+ikVjfP/eL0bEGpTyUCrjYd6Z587py248/4CPWXATgRjf88HSm1IMW?=
 =?us-ascii?Q?cp3ys+NYPKtDOzjBCasiu2ztyszHGTee9Yurk+jI4wSHHBL2IERcy1sdiNM+?=
 =?us-ascii?Q?cDIHxIfyIlJ5vxQMFmEJjXeQXLLds2upqsYLdONOGeg2VAYI4kPXj0RAObI1?=
 =?us-ascii?Q?mg7VEtnBOome94irIcJlBsR9ykhEDqR/aEuOe/lsTQ79YBZBbnhBVj3/P380?=
 =?us-ascii?Q?XWfXAqrDZ0nhFbJ1JAS84OgkNxuSibUJvBu8eOcDd6TM/Dha/URC8jOE1+lh?=
 =?us-ascii?Q?YEMQXCZRf87Tz3Gq2+Ea20OcAPdAGVU2oSVk5lk3R6aLPzZg6KLub9fk9pP6?=
 =?us-ascii?Q?G/ZntArVTeYjbvEo8J8x8STKllR1JfsBNbzaVPPnSow3IVWGUjnL/I7eAX4e?=
 =?us-ascii?Q?kDotiFBfqtS1fPZ3QDT57+GkYtRbaIg6P8oc3QDXbYhHqFV3KwpcfG6Oi4zL?=
 =?us-ascii?Q?V5dnfJNhK0H+M7WRFI9XdmxSItn3xGoU6D65dro7dWEv2pKPm1gQlux4Bv/7?=
 =?us-ascii?Q?TG2evO+2BfryN9s8UN6sJ8Z2DSQS8SXLryjpB6SF6O32uTXYU3gVwZSHjn2C?=
 =?us-ascii?Q?vW5829qIyZWfv4WnyboWVaBOUaxlOhEqTlU47v+Vxv6iTAlGSHOakpaLJd/A?=
 =?us-ascii?Q?H9H/4DL29kGknEdSjt9vg9Wi+L5cTQ5uDnoLRiy5x+V/Y9ztB7eiqq6cTxF3?=
 =?us-ascii?Q?dVLwPQTgOuMirIgp1uwmX7QPxgeyV4pAFbBTgMhTD14hpFdeKTsl0zgzyTj0?=
 =?us-ascii?Q?wOkiVYmwL1iMQZ/P7fD1WJczlteE/Vpdrua43EbLDs0Dw+gc6/LoAFnEjSXP?=
 =?us-ascii?Q?EbFtfznAj+PpkmpMNL3iso4f9KUcU+ddz4QY9G0LE4PPZpHigNPrHGyx9yN1?=
 =?us-ascii?Q?FMrWKwkh7BZtpCkXcUS/boTRHywxBARX39Laz2SxLTNO6rvcgm0OhfjUmFB2?=
 =?us-ascii?Q?EzmezOsywHcWLWYt7FfMfGFTPFLImY44cocxp7hjbqKYMFtrXRTtzJrxu/Ms?=
 =?us-ascii?Q?NPNLNMxMdbucOji54cpbwcSBmWlQlmmyWuWne9bYQXS46BDCti00elch/2IN?=
 =?us-ascii?Q?95sP39/97L+cxCPtQA2z819XyWgltVPDZT8Ia3c8XGQF615eHA1aY+rGTYO5?=
 =?us-ascii?Q?XuqZsh2h7jcXEzXx6w0xgvYeWtRjtOFVUmHQ38SNlGk4xo2Q04c3qPOY8DfQ?=
 =?us-ascii?Q?D2UO6Q5IJbP5rEq+CB690hEFXANvHoWyA0VU0ylHUiV3AOX7joT6sZn77h9I?=
 =?us-ascii?Q?KgR/C6e6ftpPiXP605ZYM5WfoCGe39nEw0gX7XAfO005O/E7zDmBD9pdubVO?=
 =?us-ascii?Q?/jTWpoBCirn5TWz3qOqNAL3semQTI+xS5X0ier0/j48X6TZWPldX6vbKdGvw?=
 =?us-ascii?Q?0HTK27Gya9kPnBz1d2DBHNt3/uO/fIavnhBa+TdTOGok5BsdV68LD9oOpHWI?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 088cd1f5-6bea-49de-26ab-08dbd56d2955
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 15:15:02.6972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z83j8oMbx0W2Oy3SNJ83FCwsc9oYNo+eM7ZKrWHaoLxAhvModMK+FORxIdHi2WO+1CB5cebdOd5O0u/tfQEY2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 11:50:26PM -0400, Luben Tuikov wrote:
> Hi,
> 
> On 2023-10-17 11:09, Matthew Brost wrote:
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
> > v5:
> >   - Fix extra blank lines (Luben / Checkpatch)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 69 +++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 87 ++++++++++++++++++------
> >  include/drm/gpu_scheduler.h              |  8 +++
> >  4 files changed, 130 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index cf42e2265d64..940f63dd6965 100644
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
> > +		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
> > +			sched_list[0]->single_entity = entity;
> > +			entity->single_sched = sched_list[0];
> 
> To simplify the rest of the GPU scheduler design and generalize the logic,
> we can do
> 	entity->rq = sched_list[0]->sched_rq[entity->priority];
> where the "priority" is 0, thus having a single rq.
> 
> We shouldn't splice scheduler and entity, but rather make it so that
> we can set the number of rqs to 1, thus resulting in a single rq.
> 
> (https://lore.kernel.org/r/20231023032251.164775-1-luben.tuikov@amd.com)
> 

I pulled out this patch [1] + previous one [2] and included your [3] to
test this in Xe [4].

It seems to work with just one rq per scheduler. We can go with this
approach in feel like this is the route. My next post will include your
patch [3] if we agree.

Matt

[1] https://patchwork.freedesktop.org/patch/563094/?series=121745&rev=8
[2] https://patchwork.freedesktop.org/patch/563093/?series=121745&rev=8
[3] https://patchwork.freedesktop.org/patch/563817/?series=125433&rev=1
[4] https://patchwork.freedesktop.org/series/125540/

> > +		} else {
> > +			return -EINVAL;
> > +		}
> > +	}
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
> 
> We wouldn't need this check.
> 
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
> 
> We should be able to carry on the existing infrastructure when
> having num_rqs = 1, with dynamic rqs. So we shouldn't warrant
> any changes here.
> 
> >  
> >  	/* Make sure this entity is not used by the scheduler at the moment */
> > @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
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
> 
> It would be "entity->rq->sched" for any and all cases which simplifies things.
> 
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
> 
> We can carry on that too, without changes. The good part of that is that
> we'll inherit all the fence work and checking for free.
> 
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
> > index 150e5330f0fa..273e0fbc4eab 100644
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
> 
> With dynamic rq, no changes would be necessary here--we just go over the single rq.
> 
> >  
> >  	init_waitqueue_head(&sched->job_scheduled);
> >  	INIT_LIST_HEAD(&sched->pending_list);
> > @@ -1143,19 +1183,24 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >  
> >  	drm_sched_wqueue_stop(sched);
> >  
> > -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> > -
> > -		spin_lock(&rq->lock);
> > -		list_for_each_entry(s_entity, &rq->entities, list)
> > -			/*
> > -			 * Prevents reinsertion and marks job_queue as idle,
> > -			 * it will removed from rq in drm_sched_entity_fini
> > -			 * eventually
> > -			 */
> > -			s_entity->stopped = true;
> > -		spin_unlock(&rq->lock);
> > +	if (sched->single_entity) {
> > +		spin_lock(&sched->single_entity->rq_lock);
> > +		sched->single_entity->stopped = true;
> > +		spin_unlock(&sched->single_entity->rq_lock);
> > +	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +			struct drm_sched_rq *rq = &sched->sched_rq[i];
> >  
> > +			spin_lock(&rq->lock);
> > +			list_for_each_entry(s_entity, &rq->entities, list)
> > +				/*
> > +				 * Prevents reinsertion and marks job_queue as idle,
> > +				 * it will removed from rq in drm_sched_entity_fini
> > +				 * eventually
> > +				 */
> > +				s_entity->stopped = true;
> > +			spin_unlock(&rq->lock);
> > +		}
> >  	}
> 
> Same here--we can keep the loop intact, we have a single rq and we just process it.
> 
> >  
> >  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> > @@ -1186,6 +1231,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
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
> 
> Right, as I mentioned above, we shouldn't splice up between a scheduler
> and an entity sometimes, and other times scheduler to rq to entity--it just
> creates too much thrashing about in the code, with too many ifs, conditions,
> etc. Simpler is better--parameterization of the number of rqs.
> 
> Instead, let's get the dynamic rqs in, and this way we can keep much
> of the code the same, inheriting fence work and checks, and so on,
> without much changes.
> 
> Regards,
> Luben
> 
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
