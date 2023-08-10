Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17808776F18
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 06:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0330D10E4AB;
	Thu, 10 Aug 2023 04:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFB710E0A4;
 Thu, 10 Aug 2023 04:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691641945; x=1723177945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qa1bkVZzFwKBIm52fqcapJWO9N+HmViFONraZO3Qaf4=;
 b=W0RpniHFsb6eEQKV7ln0nx0gFOocZn0V3yplFZs2p3nhq74LLNsVXuEm
 4Uw+ZaBrKKkxkIRK8jc49hf8IovHgYj73UHz5vR7kNnLNKVg7T/SZ2l4W
 3367mFsnhNzIppOs2NSy+snch+wUqcpuqTlSNvR0Amhd0nG1O4DUg9Y+2
 f+j0k7kBUtBkkW9wDwyeadn4PWVpP6HA8H7m74gHDY2OukUaoxQxUWXRn
 vAeIjW1rz3coVBBocUFkZ7P3cM4b0/LgoOEjKaZKThKrli19ldL9NghWV
 zfpYKNh9tvAXRq9FkPI7jHXXlOSTxM5SC7kj+fFOXpZl2JyYovop4mqIz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368750002"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="368750002"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 21:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855789787"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="855789787"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 09 Aug 2023 21:32:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 21:32:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 21:32:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 21:32:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 21:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpDCd+bhoDnjV+5E6fRJEuDzTxHghmuou2/Ya84uJKYpyzlUL+Rh6FAyXPVbEOFyrB4u1xCA5ZP4cwf/oUj7KWnkkU6+8UuUhOiqEJlabsrz2fIWxiPQOxt4umySfSFuG80fA+KtF952ZtE9gTbAOqWfsaiMj/lL359QVOHCAHHSRX1fv1Pn4kfcQUuE/53qGFT/GCqt2knyX47JeBrYo7/otmdo2cLB2z4GYYvmwX65MAH7unedMAT9e/NOFgte4h0kZDwOl4Hws0eSSlha0dnEYPSjnIvu62Q5Q0kmFIAKF1Ucl8MvaxiwByZfPsw1ZiQQxF4AqD1r0TrMrdbtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fmt42qH5ZuKV59Vjm4sXUr5zDPmi1zhzfloyW56OkJo=;
 b=K5kGYu51GE8HfEzKGziZwEryQEPQ3GJmdKotZWhra8Y33g7HMLjlNVwNLDUhhhj/mkIoHyCHWNTEra1Q75HJDh8MBBRo9FpnOJe4IqrPw6jVm5JFxmdwtLOiEhTFqYZGvk+3oUuTAAylWmnb6xTVBfn7eFOuYyfc6YMGWBWg9vOuGa5bF+ZHu16OnqEi+tAhkdLGhHsk1GhA6eIAOfQDGhgMsBrVAN13Lc81EKETFKM94sACYFbvuOSIerzqU7SEg77YXttHlex3rke7jy97QTqcaAB4IcXv7wF1ZJj/dJRmjrCw0fup8eAVCN9QHHtzEgPX2sxPLVJO3nGxC7DIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 04:32:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 04:32:20 +0000
Date: Thu, 10 Aug 2023 04:31:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next] drm/sched: support multiple rings per
 gpu_scheduler
Message-ID: <ZNRoIDOr2RPSf+om@DUT025-TGLU>
References: <20230809221729.3657-1-dakr@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809221729.3657-1-dakr@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba89df8-ab55-47c8-ee3f-08db995ac926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbxXicXdEJnYakuNfDYIbag70eBoaUEj2+HPnlSL8KZWnte3qotMsPwkR7QA4QW26+JPO99mXDSFr6Plc5cBEf0R9CMTVp1mC3HykoxXOWLDAyEBH4NdZ4X57TImPWb3Mjck3+PfydDVSdkxkmJsyFlD/Rdg22VMnh5mJTqx2ianudZgtqQHEL7wN7g36iS3QwWAVEDIZSvWA2L8kf5eJetXrTebztUjAzj+e4IF2cbt6u5eRTYB87jOe9llxYCJ6HN3kVY1F+L7KaLQVQLspQE8AY+8Arr22Njm6Zzy8QR9rdDYT8cbWJv/+/jUA3RExIAfnP5xzV6DQ2WmCyQc3vv+trWFT7fOLe2EXlBPBG9J8mB0C4Y/0iLv7YNq+SWkD+eLnTVrnatgZalQaKvI5pAGRyikoPInzZj5gVYnXBJyjN80LAh5IRrM3RorWuCkV2L/iWT+NlssJ5FYBJTiFG0vhzHjsz/IHrfxYNCKbZItCf64HZIXiSb+EAtTKacpI9gN0hPKL/mc4PugDIF76LEz2HFFsXfiFYObJyxjnsEkPsv593bBhXd+L6nTb6e/UjxWpmtclDqu3zjVXDTGNE/2iG0sTnijR6Q5jrrfWr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(1800799006)(451199021)(186006)(33716001)(316002)(41300700001)(2906002)(44832011)(7416002)(5660300002)(8676002)(30864003)(26005)(6506007)(8936002)(83380400001)(6486002)(66556008)(478600001)(66946007)(82960400001)(38100700002)(86362001)(4326008)(6916009)(6512007)(966005)(9686003)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xflJsOFNUQLiYXsDw+dX78OAO3rdxS4GNcDUu9pL+CbrI1rtFrLOsQpkMbk2?=
 =?us-ascii?Q?ok/g7mFLsNxkDMyGXZ5yiQJyfXJEXxK6N3uwXHjfwxxiU0wkas7kZAWa3CNC?=
 =?us-ascii?Q?U1MvaYbPuWubLIALq73D38AX29niKqV9xP+l4geCf+hkq76Nru0+/mjwGJEt?=
 =?us-ascii?Q?Vp1cIeXyTpU/jBlmhxmyDfiAzwYPgKjx/ZZl6HXhle1tVutPp0uBhJwmdZg4?=
 =?us-ascii?Q?xSSNSrtIPSlBU5tWpXJ5oHuxLezZ0AR6/uAUWfvYMBfPurCAUR3wgftZlO92?=
 =?us-ascii?Q?m7oZBfaPwhL9eBnWZ0Y69+EukTbuMOkj+pPn/CyeKIdJoP/w0udZBoPB+XQW?=
 =?us-ascii?Q?teC/v4t1JpcDaGOOkrhl6PN0haa212Ni++CT2zSqVaUmfZBC9YsVhO1DfZZE?=
 =?us-ascii?Q?jOlsdd82rXS2HGSGf9T1fYlBvGTgyzjiIludGbz6BfNLkjRX8AyKBfB6BFMf?=
 =?us-ascii?Q?S9zb3+KcTUYuqUZmlHKcQXObTk1BS3Aztmv1gsAIb3HQyORgQ78L9YgMKEYj?=
 =?us-ascii?Q?Npax8MDNsROa5KVGCq4C4Az0NG0HjAf79UE86yA2OXTcTogXcp1DAoqyPZXK?=
 =?us-ascii?Q?TG8ZRj1D03djh4Fm6E0M5NUKM2x8R/VPY85d5xapjTvS5H+vGIrBxJ10AFJB?=
 =?us-ascii?Q?qL0ok04WkkqZ1hiGj8Ne2S103UBcuNzWEsDX7OKgLMoEA7lVFfnF3REQ2Y8w?=
 =?us-ascii?Q?OQSNTMdAB2pa/kP9OmFodR1X5Fn7w+WJgT02kHSDAzcdfPpQO/rhY2A9IpDs?=
 =?us-ascii?Q?TZIGCYSSLC44q/QudpdSN2KyWuvV3rdWFLdys530dhMY9HKfl2+hMoJkpbMh?=
 =?us-ascii?Q?UBuXJcJfB7PN2wbbriryGQYFHNE/AhXryfmMg7jcJGwd9I7q7ZQqKQLmGzgt?=
 =?us-ascii?Q?PWPf5ybr5Sm05vIro4W2vFtvXD4cG8Ceicy1QoV6GVoepyipHQVA/91i5+ZL?=
 =?us-ascii?Q?NjCSPL3WazVUdUlxp3U13w9EBQ0YlXlByBmF8BDdgW9U/rw4PqtfxtEN1Q8O?=
 =?us-ascii?Q?mGbMEyEf5sGbv0luDHMnpEQ9UgKZLEWCiK9cBOmfIrgH+Ybm0WXOs3rlwzOv?=
 =?us-ascii?Q?khIxBxvNQkikrOoysrnM9JLk90UMmHxBbtZZJ3+e5qV7O7LVC7vAFJ5AjCMU?=
 =?us-ascii?Q?uqjQNByzOZKdfSPchXyXRCb7FpQjPS3U/BaApZv2GsRolIOdRbrBz8AY3ao4?=
 =?us-ascii?Q?Cyt+h0di/Va9CKYOffP0SYk+74azs3yr4OjxknuBZUdGIdvQajX8pRb5g0dU?=
 =?us-ascii?Q?aVVyPk3ijqhegJ8O89xY8Drg3LXQPMmx+/Fh3M0DJBbhrAsKz6u/co8VFetO?=
 =?us-ascii?Q?NRHmIrk3gGJm0D+kR64nN0DIDvAGfPcH6s+xeX3URfQ4fBtgb0DoosFttOQL?=
 =?us-ascii?Q?vR24knM+dkSFz2ELiIPI+vBBEknUmIpoSr9xoletgcmgmOhP45tFRUS7FG1y?=
 =?us-ascii?Q?aNGS95eLVfg/h4swcopQ5I4XHUTjbnkjUACDvA7Tm4rA0US+uCllx/jLk4wa?=
 =?us-ascii?Q?xRUVG5jnToftpmqHdwQi6yesfU2mKiwpLn21lzxMoNctyUpOIpS9VZozs5sM?=
 =?us-ascii?Q?BxF/ZnQiy0v+uoTKkkSyYIhyafmo/75a5FW6r7tFxFwqPK5tRJVxpFcv+oZy?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba89df8-ab55-47c8-ee3f-08db995ac926
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 04:32:20.6484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtupoeYScWKQOj3I77RG30tKuMVPeqHUiBGfq4Elcjf6utEq791s8ogAL5tI4MDW23VxPikgT3uHdvUFpIS+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
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
 Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 nouveau@lists.freedesktop.org, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 12:17:23AM +0200, Danilo Krummrich wrote:
> With the current mental model every GPU scheduler instance represents
> a single HW ring, while every entity represents a software queue feeding
> into one or multiple GPU scheduler instances and hence into one or
> multiple HW rings.
> 
> This does not really scale with firmware schedulers feeding the actual
> HW rings, while the driver feeds the firmware scheduler through an
> arbitrary amount of dynamically created rings, since for each of those
> rings a GPU scheduler instance would be required and a separate kthread
> would be created.
> 
> To overcome this we can think of the scheduler having two modes of
> operation, single ring mode and multi ring mode. Depending on the mode
> of operation, the mental model differs.
> 
> Single ring mode (which is the default) keeps the original behaviour of
> the scheduler and its entities.
> 
> In multi ring mode (enabled by passing the GPU scheduler the
> DRM_GPU_SCHEDULER_MODE_MULTI_RING flag) each entity represents a ring,
> while the GPU scheduler itself only exists to sort out job dependencies
> and actually process the jobs of each entity.
> 
> By just applying this different mental model, the required code change
> is pretty minimalistic: While in single ring mode, if a job depends on a
> dma-fence from the same scheduler instance we only wait for the
> dependency to be scheduled (sched_fence->scheduled), in multi ring mode
> we fall through and just wait for the dependency to fully complete
> (sched_fence->finished) in order to avoid races between separate rings.
> Or in other words, to pick up the schedulers existing terminology,
> prevent dependency pipelining.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> Just before sending out this patch I was made aware of the "DRM Scheduler
> changes for XE" [1] patch series.
> 
> However, I think bringing this alternative approach into discussion could
> be useful.
> 
> From a first glance it looks like that both approaches semantically aim for
> the same goal, namely addressing firmware schedulers with arbitrary amounts
> of software rings to feed from the driver side.
> 
> The "XE approach" for that seems to be to make GPU scheduler instances
> scalable by submitting jobs to a workqueue rather than creating a kthread
> per scheduler instance, such that per software ring a scheduler instance can
> be created. Hence the definition of a 1:1 relationship between scheduler and
> entity.
> 
> In Nouveau we approached it differently, such that we have just one GPU
> scheduler per driver instance, while software rings are represented as
> entities. As explained in the commit message, this seems to work fine, as
> long as we can teach the scheduler to prevent dependency pipelining.
> 
> As a hack this basically already works without this patch by just setting the
> DRM_SCHED_FENCE_DONT_PIPELINE flag for all out-fences.
> 

A few questions.

1. With different rings + a firmware scheduler how do you do with
pending list being in-order and jobs from different rings completing of
order. The pending list in order nature is required for free_job being
called and the TDR to work properly.

2. How do you flow control each ring in Nouveau?

3. Do you support per ring reset? Again how does this work if the
pending list has jobs from multiple rings?

The answer to all of these in Xe is solved by the 1 to 1 relationship
between scheduler and entity. In addition to the above questions the 1
to 1 relationship in allows sleeping in the main worker in the callback
functions which we use our preempt fence implementation.

This implementation as is will not for Xe. Also in Xe it is desirable to
have multiple CPUs to be submiting jobs in parallel too.

Matt

> [1] https://lore.kernel.org/intel-xe/20230801205103.627779-1-matthew.brost@intel.com/T/#t
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
>  drivers/gpu/drm/lima/lima_sched.c          |  2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  7 +--
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c   |  3 +-
>  drivers/gpu/drm/scheduler/sched_main.c     | 55 +++++++++++++++-------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 10 ++--
>  include/drm/gpu_scheduler.h                | 18 ++++++-
>  10 files changed, 72 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a2cdde0ca0a7..eed6f56e3957 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2491,7 +2491,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  			break;
>  		}
>  
> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +		r = drm_sched_init(&ring->sched, 0, &amdgpu_sched_ops,
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 1ae87dfd19c4..bfe761316ba9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
>  
> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +	ret = drm_sched_init(&gpu->sched, 0, &etnaviv_sched_ops,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
>  			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ffd91a5ee299..f559d7de5658 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  
>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>  
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, 0, &lima_sched_ops, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
>  			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index b60199184409..79fb8c96465d 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -93,7 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	 /* currently managing hangcheck ourselves: */
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> +	ret = drm_sched_init(&ring->sched, 0, &msm_sched_ops,
>  			num_hw_submissions, 0, sched_timeout,
>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 3424a1bf6af3..6528c09fffc9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -407,9 +407,10 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	return drm_sched_init(sched, &nouveau_sched_ops,
> -			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> +	return drm_sched_init(sched, DRM_GPU_SCHEDULER_MODE_MULTI_RING,
> +			      &nouveau_sched_ops, NOUVEAU_SCHED_HW_SUBMISSIONS,
> +			      0, job_hang_limit, NULL, NULL, "nouveau_sched",
> +			      drm->dev->dev);
>  }
>  
>  void nouveau_sched_fini(struct nouveau_drm *drm)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..dbbabf63f08f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -814,7 +814,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>  
> -		ret = drm_sched_init(&js->queue[j].sched,
> +		ret = drm_sched_init(&js->queue[j].sched, 0,
>  				     &panfrost_sched_ops,
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..6d1e11e6bdcd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -401,7 +401,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  
>  	s_fence = to_drm_sched_fence(fence);
>  	if (!fence->error && s_fence && s_fence->sched == sched &&
> -	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
> +	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags) &&
> +	    !(sched->flags & DRM_GPU_SCHEDULER_MODE_MULTI_RING)) {
>  
>  		/*
>  		 * Fence is from the same scheduler, only need to wait for
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..0c432c1dafdf 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,50 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is mainly structured into the scheduler itself
> + * (&drm_gpu_scheduler), scheduler entities (&drm_sched_entity) and scheduler
> + * jobs (&drm_sched_job).
>   *
> - * The organisation of the scheduler is the following:
> + * Each &drm_gpu_scheduler has different priority run queues (e.g. HIGH_HW,
> + * HIGH_SW, KERNEL, NORMAL), which themselfs contain a list of &drm_sched_entity
> + * objects, while each &drm_sched_entity maintains a queue of &drm_sched_jobs.
>   *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * There are two modes of operation, single ring mode and multi ring mode.
> + * Depending on the mode of operation, the mental model of what the named
> + * structures represent differs.
>   *
> - * The jobs in a entity are always scheduled in the order that they were pushed.
> + * In single ring mode (which is the default) every &drm_gpu_scheduler
> + * instance represents a single HW ring, while every &drm_sched_entity
> + * represents a software queue feeding into one or multiple &drm_gpu_scheduler
> + * instances and hence into one or multiple HW rings.
> + *
> + * Single ring mode may be used when the GPU has a fixed amount of HW rings
> + * which can be directly fed by the driver.
> + *
> + * In multi ring mode (enabled by passing the &drm_gpu_scheduler the
> + * &DRM_GPU_SCHEDULER_MODE_MULTI_RING flag) each &drm_sched_entity represents a
> + * HW ring, while the &drm_gpu_scheduler itself only exists to sort out job
> + * dependencies and actually process the jobs of each &drm_sched_entity.
> + *
> + * Multi ring mode may be used when the GPU has a firmware scheduler feeding the
> + * actual HW rings, while the driver feeds the firmware scheduler through an
> + * arbitrary amount of dynamically created rings.
> + *
> + * While one or the other mental model could be applied without setting the ring
> + * mode through a flag, the scheduler needs to know the mode of operation in
> + * order to be able to make correct decitions when it comes to handling job
> + * dependencies.
> + *
> + * Independent of the mode of operation jobs within an entity are always
> + * scheduled in the order in which they were submitted.
>   *
>   * Note that once a job was taken from the entities queue and pushed to the
>   * hardware, i.e. the pending queue, the entity must not be referenced anymore
>   * through the jobs entity pointer.
> + *
> + * In order for the scheduler to actually prepare, process or free a job once it
> + * is completed, the driver is supposed to provide the corresponding callback
> + * functions (&drm_sched_backend_ops) to the scheduler.
>   */
>  
>  #include <linux/kthread.h>
> @@ -1082,7 +1104,7 @@ static int drm_sched_main(void *param)
>   *
>   * Return 0 on success, otherwise error code.
>   */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> +int drm_sched_init(struct drm_gpu_scheduler *sched, unsigned int flags,
>  		   const struct drm_sched_backend_ops *ops,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> @@ -1097,6 +1119,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> +	sched->flags = flags;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5c..4ba561014a5d 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -387,7 +387,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	int hang_limit_ms = 500;
>  	int ret;
>  
> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched, 0,
>  			     &v3d_bin_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -395,7 +395,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched, 0,
>  			     &v3d_render_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	if (ret)
>  		goto fail;
>  
> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched, 0,
>  			     &v3d_tfu_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -412,7 +412,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		goto fail;
>  
>  	if (v3d_has_csd(v3d)) {
> -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> +		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched, 0,
>  				     &v3d_csd_sched_ops,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -420,7 +420,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		if (ret)
>  			goto fail;
>  
> -		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> +		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched, 0,
>  				     &v3d_cache_clean_sched_ops,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f9544d9b670d..afe29196cc7e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -465,6 +465,20 @@ struct drm_sched_backend_ops {
>  	void (*free_job)(struct drm_sched_job *sched_job);
>  };
>  
> +/**
> + * DRM_GPU_SCHEDULER_MODE_MULTI_RING - Run the scheduler in multi ring mode
> + *
> + * The &drm_gpu_scheduler typically represents one HW ring with
> + * &drm_sched_entities feeding into one or multiple scheduler instances.
> + *
> + * In multi ring mode it is assumed there is a single &drm_gpu_scheduler
> + * instance only, where &drm_sched_entities represent rings instead.
> + *
> + * This is useful for GPUs where the &drm_gpu_scheduler should feed a firmware
> + * scheduler with an arbitrary amount of rings.
> + */
> +#define DRM_GPU_SCHEDULER_MODE_MULTI_RING	(1 << 0)
> +
>  /**
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
> @@ -493,6 +507,7 @@ struct drm_sched_backend_ops {
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @dev: system &struct device
> + * @flags: the flags for the &drm_gpu_scheduler
>   *
>   * One scheduler is implemented for each hardware ring.
>   */
> @@ -517,9 +532,10 @@ struct drm_gpu_scheduler {
>  	bool				ready;
>  	bool				free_guilty;
>  	struct device			*dev;
> +	unsigned long			flags;
>  };
>  
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> +int drm_sched_init(struct drm_gpu_scheduler *sched, unsigned int flags,
>  		   const struct drm_sched_backend_ops *ops,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> 
> base-commit: e05f3938c5a7896d09736e3381675a57ffee7a0a
> -- 
> 2.41.0
> 
