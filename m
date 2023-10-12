Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D87C6419
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 06:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701D10E406;
	Thu, 12 Oct 2023 04:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C78F10E402;
 Thu, 12 Oct 2023 04:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697085161; x=1728621161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qe0wi7hg79BPp+4ms/G5cjyZSbeaRsM3JHwyFMHHsxk=;
 b=VkOXk69wdc9vSpuxsfPpwTCbju4ag+yw+0IitMU+ZOqoolnFyfjFS1Ew
 dBMA8b/GO2evg4dKmfJgvNy8AP/k9H5ENwMJegW8BkcW8DbmYpOHRjox3
 omTOlvRyLtFuh+6NLX1dE8FwMx28qviU3oKTxIxdsRA+P2qsXt1nEQm9g
 brdh1VjjgxRIgARYcUTt5fbOS9WxUk8IMPtrXu4f8dGHZgtyWhFWEA3Ml
 ieUV+8I7ydYXtDtioq3u/WvAF3yNI4aq/qH9yCsxM+emAH+U3FQoI4ctx
 v6MhZAx+lr62cdSvJiLx0EI3pn70yAk0mKk9cTiwWGO5FIYMXVvOuAotu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3415972"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3415972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 21:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747729854"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="747729854"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 21:32:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:32:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:32:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 21:32:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 21:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr8xqVxwRE6IRGFgqZSPCvWfaa8SXAUnWOCIvneqXcPtlPCTdUbgV1SLEScdCYOc991FKV0g3gXJGkycawEL3RWBD24cElygjaTGMIh8WHk7/rqKMEWXY8ShLR0jl6yFiyUVIiboevNmmowhKChYyy39fBRyHHy6jBNfyRJjcR2UHz0xyo4zOohqo4pnNeOE9VdKgP9puzBgMNFVV7RbLmQbxw6GVE6lAk+zF1cUU7XbNYdArt/O+RD6axw5Md9P3+nZsrTaM3t1zRbrrkgrxvjmJMt0oHA1Wgjt0NPVua7MpCMVBYDM8Qb7jJY+hbAmDOflomfKEaQjBhXme+iQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa5nL/8tmBXZYQlFwW99QGTcosBRjrhileCpRmbfi9Q=;
 b=ZkP7Ym9cv3HltSF46GS897v5/00wXLsc9KyWlHA8X7vlECs1kEi47czwkfKxzyefq6tC0Rpsow5ZFVpu1l7oEJsIg0M53NCuxs12kipS2RC5nbLXzEFqqTLDuPJXptm0MV7iQSqzTVVFznLOfN17Vq/B362FnLN6QV81IfxaAsPd8nWJS9ux2X21ApDWQ7hYFD0GzRBy1Dq0HrU8MEpOPGYYy0dJMaRqQGEvvM91bxKHOn+sDNjeOvSItXVZkYzXrTiFz5slv6ZRskkdS2JGTrApKjAHRrru0cdZFK1Il7HGhxCFEQACdTsN42BwSA5o9xgj9r3vA4kbGDmHwPnBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Thu, 12 Oct
 2023 04:32:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 04:32:31 +0000
Date: Thu, 12 Oct 2023 04:31:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Message-ID: <ZSd2lmMDy+ayyILC@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
 <34a4a2f4-a907-4fa2-9705-878106155639@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <34a4a2f4-a907-4fa2-9705-878106155639@amd.com>
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 57653bce-e644-4117-aeee-08dbcadc3fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2XBOqtTKcYDEtnw8TNT9mmVDMg0krD/aROY5iavFACUbIKOQBjIPCXg0HnEcWzdgoBuflnvcsmFxv94G97M5yeR+tJMnf/hBYf9vafegcMCN47YEN/YQsHm/GAdiFfxDBtwwPjgk78POrY9ZprY4/R/1H1HagtmglADwB51AscsxR6z27F993SX+8DuRDEHNFpsP97q1WyYyrShPD6AYnz7eerDjcoP/GabN3NOby2x9ZDbdHv/71UHgIn9p7muj8Z0w++sF41HGhUkIVY42a6325EXXE0pwXS486qV92YxBbZG5ijTPoXgzxIbHI1bP+0jVpEgwHyTk6RXfsZlU+9WJZUm1+MTX/E8lCsf1laFRI303dAFrqcPgEfNZ94EQzVP0PxJ7HH37aQ7jxdNhNSEESa3JYLIujzhHUe5JYoTJPOzQ3+2JqWRbRfn8ERlfZKq69mCn8rAz+GWG2BGnzdz0IX0gbSX8JsceGOQv974wRSAuDZgxjsKqrxCsiiIW8vsP3/cO8KL6qtZrJsE1T6VPhC8fT6JW4Y4CeNgWGHqEauLOuUb5Z5Wu+vsmaF2RxC70CZx2lfl+DVaDWuLG5wQAHSR9TQN+rSQHrbLNx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6666004)(6486002)(53546011)(83380400001)(6506007)(7416002)(5660300002)(44832011)(4326008)(4001150100001)(8676002)(2906002)(8936002)(38100700002)(30864003)(6512007)(66476007)(6916009)(66556008)(66946007)(316002)(86362001)(26005)(82960400001)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZvk1xypRc6nPTUQRtYUVpcRmCKHLSqtwSpgzqYz+mDq7WUzzR8eNGoOabDX?=
 =?us-ascii?Q?SiF44q5JCDo6+sYWm6LO19tjsnOa5oCutfZsNhtwmi//GY4tq08RArYmrhwi?=
 =?us-ascii?Q?fQSgXSAgNEiphcUYxg2q2CS7NZz3VZGC7UPdJ6u0szs8Yev/lkRGAFORX5PW?=
 =?us-ascii?Q?kl1RxjHri6HD9DOsJlujfUvO4/caktjVDXbwX/WYx8rbKPLb+sGCVUkAdr/B?=
 =?us-ascii?Q?5GLm46iYad4rR0fGwNu6BOSyOn2bihVIU5g9bFElkAoHOQVGdLMpSnwXBn5n?=
 =?us-ascii?Q?fmDQAr9UzCgnILSFhZE0DnVTiQesx100lWrH4k93pmDYwk99C3PnO3AoScBX?=
 =?us-ascii?Q?/5wO4qs2dO13tvG3kIXk8MYBTUzKUFwDexIHNPiJ+hT+F3+6G75OPA+7j4Fp?=
 =?us-ascii?Q?OcMAegZe631Xw41JAS9AdgPK5iIVTbsgF44KVt5bUAY0crYITXoWFSXjb28a?=
 =?us-ascii?Q?eGSZ6ZQE5OAut3w8DbmuMIUC3VZGkw0X/Y0C7+fR4UtqF+Rqhu3Rqm2yEyQ+?=
 =?us-ascii?Q?XMNSdoaAmL49mivk4zPx9M9VCXQkIxZUr2yE6E8eeeKFav3/9Rga1uNW28rd?=
 =?us-ascii?Q?Q51PH7D42870Jr3EwCxsLrDOlA7BnLraPvrNqW4Ercb/dhPcKfT1e5+w0cSN?=
 =?us-ascii?Q?+3rT4i2ncBtw/O+SPfbmVHxfi0QyLtGVRHvBOuVSmTLcz8ABO/RuESnJygmo?=
 =?us-ascii?Q?c+lbRVfN5SLUzOMCB/tmsf+4tIf9sw/qSXmm77TAcU9a9eGMinnfCgq/uJYG?=
 =?us-ascii?Q?ShjTBDf1+6Hcnday5IeeKqf4hCFQDSl+2wUx3B+BS1KAd2vwSu+jJNZ8wjgA?=
 =?us-ascii?Q?xj97ePiJl1tdFUxEXiAaFemPxMLobJuJo4ggZqxwyzBmlJLc0wbfklVYbM/L?=
 =?us-ascii?Q?X4yXpG/SpPzzCoCyeK+gCLjz8ZHkjd2KnG+VTdULoJGXoctK84zmUY4cflzF?=
 =?us-ascii?Q?bcDbrW7/Tn3TjVncnd1ptqabQzsX68qpMX9W5w+PwhweSq3tt9cDoPRPhc9s?=
 =?us-ascii?Q?ztYG8FiciH1jtdD9BoY4M8gBgklSzP7SDkoNAJyqm2lUDHNQIV0legdJLyNF?=
 =?us-ascii?Q?JDqVJXtbEo0Ntmvhonkd28Bx2NzpR9uaLh5dTJKq/TBHHe6R51myTtJuaHbJ?=
 =?us-ascii?Q?6xGx9/t0aer6kd7BDlEJotedFkJQPWpwUnGjkN9kKv0BWGv2vz9EVIxNUFtB?=
 =?us-ascii?Q?yRMe3AGYM9lk4xDcSs2vIIe8PXJ9hRx4N1Ceo2jgq4P0c48xslox0EX82VjY?=
 =?us-ascii?Q?LERMyKeTuzRH1/J4AsI1YBjYxVULz5RgD57i5jo21hglaQGNHSADOLoIEnR6?=
 =?us-ascii?Q?GAnJ0Aub1Trjbgm8g7BMMLa46I2sK/tpZc5xW2R/ElTp0EzkvUrFZSZHDhCx?=
 =?us-ascii?Q?u9imp+pYM7ueEQ6fTSj3+9dagX6RoaBb7amjb743PHNb3iCpUfm31YBiHju5?=
 =?us-ascii?Q?99TaRspG3bxIHcF1TGBLf4bHq8PpCmDAkVqWeErHsWxegvwQZDwENmSOtpHd?=
 =?us-ascii?Q?hstsnAp9VEv/3G7f5gHo7ul3EHmFXABgM7rnrj88twxvSdGSaSnsYcfdnBsg?=
 =?us-ascii?Q?uDCqklxSE5NLXLSXJQMG0CovPsSuiFeMo1qaFGWLq6XHNrUGqdWi0cqsRnjw?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57653bce-e644-4117-aeee-08dbcadc3fac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 04:32:31.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuEFDUCBau7MBARWvi3J3cWmVR3NpgzeXsHCeEHaj4AwVrtxlmnordg6UiuDAW7/FPeH91ICsqlYc5JVzGqrNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

On Wed, Oct 11, 2023 at 08:39:55PM -0400, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler so user can control each scheduler policy.
> > 
> > v2:
> >   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
> >   - Only include policy in scheduler (Luben)
> > v3:
> >   - use a ternary operator as opposed to an if-control (Luben)
> >   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
> >   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
> >   - Update commit message (Boris)
> >   - Fix v3d build (CI)
> >   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
> >   - Don't update modparam doc (Luben)
> > v4:
> >   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
> > 
> > Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Was the R-V added by hand? (As in editing the commit message manually?)
> 

Yes.

> I use automated tools for this which do not re-order the tags.
> IOW, the S-O-B is first as this is how it appears in the patch,
> then the R-V most probably added by automated tools, and then
> any other as are tacked on by other automated tools.
>

Ok, so always add tags in order starting with S-O-B?

Matt

> This also shows the timeline of the tags and I believe this is
> another one of the important facts tags show us.
> -- 
> Regards,
> Luben
> 
> 
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_main.c     | 19 ++++++++++++-----
> >  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >  10 files changed, 68 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index b54c4d771104..e4e6f91450a4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2283,6 +2283,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >  				   ring->num_hw_submission, 0,
> >  				   timeout, adev->reset_domain->wq,
> >  				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_UNSET,
> >  				   adev->dev);
> >  		if (r) {
> >  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 618a804ddc34..15b0e2f1abe5 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >  			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
> > +			     gpu->dev);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index 8d858aed0e56..50c2075228aa 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >  			      lima_job_hang_limit,
> >  			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, DRM_SCHED_POLICY_UNSET,
> > +			      pipe->ldev->dev);
> >  }
> >  
> >  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 1097f8e93d6b..173ad2f17c50 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >  			     num_hw_submissions, 0, sched_timeout,
> >  			     NULL, NULL, to_msm_bo(ring->bo)->name,
> > -			     gpu->dev->dev);
> > +			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
> >  	if (ret) {
> >  		goto fail;
> >  	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 4c959dec42b3..c4e09d2e77f9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -437,7 +437,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >  
> >  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> > +			      NULL, NULL, "nouveau_sched",
> > +			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
> >  }
> >  
> >  void nouveau_sched_fini(struct nouveau_drm *drm)
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 934b7b930c76..95330ff402ba 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -856,7 +856,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  				     nentries, 0,
> >  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >  				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
> > +				     pfdev->dev);
> >  		if (ret) {
> >  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >  			goto err_sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index a42763e1429d..cf42e2265d64 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > +static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
> > +				      unsigned int num_sched_list)
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All schedule policies must match */
> > +	for (i = 1; i < num_sched_list; ++i)
> > +		if (sched_policy != sched_list[i]->sched_policy)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_init - Init a context entity used by scheduler when
> >   * submit to HW ring.
> > @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  			  unsigned int num_sched_list,
> >  			  atomic_t *guilty)
> >  {
> > -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> > +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> > +	    drm_sched_policy_mismatch(sched_list, num_sched_list))
> >  		return -EINVAL;
> >  
> >  	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  {
> >  	struct drm_sched_entity *entity = sched_job->entity;
> > -	bool first;
> > +	bool first, fifo = entity->rq->sched->sched_policy ==
> > +		DRM_SCHED_POLICY_FIFO;
> >  	ktime_t submit_ts;
> >  
> >  	trace_drm_sched_job(sched_job, entity);
> > @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  		drm_sched_rq_add_entity(entity->rq, entity);
> >  		spin_unlock(&entity->rq_lock);
> >  
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (fifo)
> >  			drm_sched_rq_update_fifo(entity, submit_ts);
> >  
> >  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 8b1d52cff1e9..150e5330f0fa 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -66,14 +66,14 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > +int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
> >  
> >  /**
> >   * DOC: sched_policy (int)
> >   * Used to override default entities scheduling policy in a run queue.
> >   */
> >  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
> >  
> >  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >  							    const struct rb_node *b)
> > @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >  	if (rq->current_entity == entity)
> >  		rq->current_entity = NULL;
> >  
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >  		drm_sched_rq_remove_fifo_locked(entity);
> >  
> >  	spin_unlock(&rq->lock);
> > @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >  		if (entity)
> > @@ -1072,6 +1072,7 @@ static void drm_sched_main(struct work_struct *w)
> >   *		used
> >   * @score: optional score atomic shared with other schedulers
> >   * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >   * @dev: target &struct device
> >   *
> >   * Return 0 on success, otherwise error code.
> > @@ -1081,9 +1082,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >  {
> >  	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> > +		return -EINVAL;
> > +
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > @@ -1102,6 +1109,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	sched->hang_limit = hang_limit;
> >  	sched->score = score ? score : &sched->_score;
> >  	sched->dev = dev;
> > +	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> > +		drm_sched_policy_default : sched_policy;
> >  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..dec89c5b8cb1 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_bin_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_render_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     NULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_tfu_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_csd_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
> > +				     v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_cache_clean_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  	}
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 211bd3cdabdc..320f0a720486 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -72,11 +72,15 @@ enum drm_sched_priority {
> >  	DRM_SCHED_PRIORITY_UNSET = -2
> >  };
> >  
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > -extern int drm_sched_policy;
> > -
> > -#define DRM_SCHED_POLICY_RR    0
> > -#define DRM_SCHED_POLICY_FIFO  1
> > +/* Used to chose default scheduling policy*/
> > +extern int default_drm_sched_policy;
> > +
> > +enum drm_sched_policy {
> > +	DRM_SCHED_POLICY_UNSET,
> > +	DRM_SCHED_POLICY_RR,
> > +	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_COUNT,
> > +};
> >  
> >  /**
> >   * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
> >   *              guilty and it will no longer be considered for scheduling.
> >   * @score: score to help loadbalancer pick a idle sched
> >   * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> >   * @pause_submit: pause queuing of @work_submit on @submit_wq
> > @@ -515,6 +520,7 @@ struct drm_gpu_scheduler {
> >  	int				hang_limit;
> >  	atomic_t                        *score;
> >  	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >  	bool				ready;
> >  	bool				free_guilty;
> >  	bool				pause_submit;
> > @@ -527,7 +533,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   uint32_t hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >  
> >  void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >  int drm_sched_job_init(struct drm_sched_job *job,
> 
