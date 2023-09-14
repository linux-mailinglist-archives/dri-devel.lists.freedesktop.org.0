Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD87A09B4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 17:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044D10E577;
	Thu, 14 Sep 2023 15:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7209510E13B;
 Thu, 14 Sep 2023 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694706577; x=1726242577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TfcbRhUcfN+bK539eAHtVTu+Uhd0gX2EA2u1IlNnmrY=;
 b=K2tCTH5AltlOz+/0d7heSY6RyIY5niSv/pcKt0inlBsc1hN78kNbZRla
 inbpHz/cRGkZMfQI3X0waFnu5OiJyWfbhQYmDSPUXMMDscOHQKftVp5Oc
 SyHsmSFacd7YRIHS2bm7ObooohvJUoZrANok3SjFVuIby4Lxfs15UjL1u
 /CNnAO28ptI8+84/x1C2hGJb7wzbje79kJp3uN+Ad3K8IxQtnynstIv/Z
 JvwT2xR21FcQj2CaEULtoSHjlANTFG6H4rPWSBuDnhCDoazu0o7Kt8Cle
 d51A8iICaG3uIYkDxXe/XzC9chOe+G/MrHQGAvZYJ53OUbA+cLIpHxTSf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369291490"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="369291490"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810130909"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="810130909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 08:49:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 08:49:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 08:49:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 08:49:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 08:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLEUTkVIU1aw3W7/C2M769cW3l7ZVPahI5mevhaqE1syO+ykFa/T3ADbPxMCQ0O7g+wkmW4HhxAZGkUCBVDoZnUObzoECaOHTKD3jNlr6HRqIutKRDqrb/T16H4ltIq8jVh16y62dx127YeAKnDCj9F6GSjPAxpMjXeIIhesd4kV2CcZ0cBzSs4taAsRiPw+TQY2GCSpq811qKFB5N/D1Rx2elDlMRLSqbnq/bjvesjFFm111iv2rNqc2Q5EF28EtZ9rTlPvjtzSpir7n18qfvzRZXP31e79z57fQljk4DFj6iJ/2vaE1464lOGih1U9Dy9Hucdl7Wes19EcPDKVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBU6R0XK1KMrf0aRomp08llxaNWuWQBzGRnvOwfs3G4=;
 b=el9/+bOMvePFP71r5FWAuLkgDidTGukUYGkjkaHml6fHWVxiAh3BrlcFo5DmETLvFE70ppzSRAavCt7kGsxYKxwN129fJDdr4VHa1He8SvhKO7IKJs/fi0qOBJxAjt45pRn1ZQ/GsAt05sejDDj5mfp0tIey3/2yVaGH9WZN2IJYPi1H8TBOX/xmYTTq1Y/NWnqtqeaWz2MzFX9mXbtwBirarUtW0R07XHEbnqvp1728gzxCGghRPrHW2LmHS7FabBkQyJGlqrAvTBln634ZCx+q9oMjOGUaF0aZT9TYG6SQgMaMPjGtF97fCwSZi2yrxzmXXuRTiHjtYV3WueuaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Thu, 14 Sep
 2023 15:49:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:49:33 +0000
Date: Thu, 14 Sep 2023 15:48:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZQMrTXzRBH+rM+MQ@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
 <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
 <7c54b2d7-0a17-43e8-9da2-766b0464f4f8@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c54b2d7-0a17-43e8-9da2-766b0464f4f8@amd.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e8c721-a070-413b-e963-08dbb53a30af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lv7JpefWfsDokGdIJlYzIFlT4pJ4Hnsr2g+hu3UkLy9CWyt16qrGXOQI5xbIzW9NTL07B/AzMcVA1JeLgeJH2BTD6fqLeMdtpPqvL6WT/elbiz55dOxVCLLMCFIOT5WrcvZQe4DD3ZZRu9IxvWhxn4D9TdkhNX3ZNn7T8M9sNRxXviQ+jdxBaL5X8PhFQDYfijjuxf6TFrMq6AbXrCj0BuxxiMXbjbaAgXAV/6LuWS5/SbIseyJgZ+A5/bwLpZRLLzPQ6BvOLXvmKJpMBhuLhdTKv7ayQZS8DeMSMnPpysHQYkMnR+wjV58O+J8S5XFZo4nIKSNUaZtsSwsKnzzbBskwyd2JPH8Eo0vyCzuAOWDqpwPRa29IoUgBlYlRguHBRJwZKGx+hVXv6VK9qRhycvqJBqttV4vL7ctrnFwjxjMDU3uylOsUrKxuUvvQXoyFHYDj79YscNygoT/kE3sQ4iKaIC4tOuIy5F6NbR2Jl8tE1GjV590lhP5d2d1YooEcgr5vx6/CSd/9BQG0UdIv1un8THPXNcTN6xz67cw6C5UenK+xHqa6bXVn3yLB2T5q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(186009)(1800799009)(451199024)(41300700001)(66556008)(66476007)(316002)(478600001)(6916009)(66946007)(82960400001)(38100700002)(7416002)(2906002)(86362001)(5660300002)(44832011)(8676002)(4326008)(8936002)(83380400001)(30864003)(6512007)(6666004)(6486002)(6506007)(53546011)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRrTY6krs7Zz0t1peszW6Z/HXnq8UXeQAxeBKoXFAWtEYwlxNfaaeNT7cxxn?=
 =?us-ascii?Q?bSQvNFmzt6CVDtJjDkxiSEnbM3ZVTZE1KwsfL1G+z40CuaRr+XMyhioSNpSS?=
 =?us-ascii?Q?9LhV7dVrMufCorllt6cuce4KW5Ca9aGJU44A6+27tGFpPxFKWhS3UZkAQ/XZ?=
 =?us-ascii?Q?8cOUzIcp+l42SLAkYWjEQX1HnLJC0b47Ju2aNKeoOmjbINHEqy9iMnmzB4re?=
 =?us-ascii?Q?JC8B3YSHFaA75Maae5dAY1F+jYGaaLbdWp/W0k0L/CJsN99GfsGp9b1upVpf?=
 =?us-ascii?Q?HqC5Bc/JIBjmEeODkKkn/OMuSQZx3x0FNuzJfI/mxUQlegWj9rsacvWaz0fk?=
 =?us-ascii?Q?pF5q7XdnWCQwUV57//qGXVMHQ6i9MC2g8D1KJbgJk+3ImjdhSazKCe7Rx9ZE?=
 =?us-ascii?Q?3+jUXpoJxhVqs4cCrjRQRdFQO6L4DufX3rzBTKwsRWrwHyA5b8B3QNVJ2teR?=
 =?us-ascii?Q?MMc4o4Xb+lsHNcfvCu/8QpmYAbpvyuPufWYcdGXtUEY52jGOMFlPFft0Ob3U?=
 =?us-ascii?Q?z7s4Vu2x4QHCBmB174gmGOARIZ4Dba63osYgvVUTMmoVUb4tOHXeTK5RqjvZ?=
 =?us-ascii?Q?TpnYb9M67rHZB0ZsjDX+bA8f5J8XUwIEqSbT9aD/evVUr+cSf70F/+ePQE7I?=
 =?us-ascii?Q?4vVlY+/sk0aYCaqKGIDrsznMWiE2l7EsNqs11fFWiU4OpJpA9V3Io1wZ1ch8?=
 =?us-ascii?Q?SRZqcQX6qP4p6cK4T2qtf9PmN6XpvFEwOnf1ysXgV95JrJdj8Vhz29v/cC2v?=
 =?us-ascii?Q?LTV764bTZXiaIEdl2Ua1GEYOplyURxol+EJVr/rz1yunIceNIQBxpTu8qhpS?=
 =?us-ascii?Q?hLaszNnqcqu3FYDt+6re1/LmeglEFMw+xoCOTM7yklrtmkyNJQOFtyU9lGUI?=
 =?us-ascii?Q?zcUTUDnVgolyCpaxVNuk3Ysxahd8btSEEUZ1qUDOTrKXd9N1FMyd2vAN/P1A?=
 =?us-ascii?Q?chPW3RaMGOLSfsDlhcMmr3gSYDC+6cY9XjjcuCjKZT+kxnONtHvjnWCs6+UH?=
 =?us-ascii?Q?DLmc3EK2oLOiRbVqbmdci8bEgtPewNFWMszBxAA1IoHGs53/240uU1Sli+2E?=
 =?us-ascii?Q?Qhg9mtAi3lrgIjxVWNsk3WVQ5nUW84OmJ7hiZ0KYXT8vhO1sDFRvvTCvztge?=
 =?us-ascii?Q?tDyTdLxUetVCwxsSqceUpQTxRYTmzKLL4moFQtoq1gmP7Z1EhtZ2vlk2Gvc+?=
 =?us-ascii?Q?AAuSJ4ukzuglImVDc/8ubBt/V/ZaZZAQDfgfO5JpMHz/9FAF/mVdsEDFxDNs?=
 =?us-ascii?Q?65hVIRu5qquoWamZicoNo17UbZaTK0iqLxRtFah626AHz2R4fAQGshQdn9wQ?=
 =?us-ascii?Q?8OIWkJv7MOJVaymwo7s+KmqW695e2j99wMlwRTS5k3yPENDpDhTCqiiLLHEC?=
 =?us-ascii?Q?z6sIcGwnJgoafse4N5j3eDvtZmCl11Ws34hGBG4uqQlMdAvnM+jpwMX0dUWf?=
 =?us-ascii?Q?O40UDZJ3SB+6FEdc/JYFzW4kHnF+I0Ijk/J9I+e/jd/SCMDw9vzinGV0TwkU?=
 =?us-ascii?Q?LC5fh0nxS9Gq0EsI9gVI6hE2UHW2JY3SNy2T1Vx5HwZaRdfka968L7XpcoeH?=
 =?us-ascii?Q?nUBYeYtmtmgsQgJ3+ocX8cSbLbhXD1FogXjFDqGEgBfMhrvxv1lax1lFZPKQ?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e8c721-a070-413b-e963-08dbb53a30af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:49:33.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LbrdQp+xaRjPzPedTZ5OyQvd6Dy7soiAcjIm6EOlDgzhtXzrsOaht/QqLlAzMZVXPbdkZ9ZcMnsvFOnZZq1hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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
 boris.brezillon@collabora.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 12:23:35AM -0400, Luben Tuikov wrote:
> On 2023-09-14 00:18, Luben Tuikov wrote:
> > On 2023-09-11 22:16, Matthew Brost wrote:
> >> Rather than a global modparam for scheduling policy, move the scheduling
> >> policy to scheduler / entity so user can control each scheduler / entity
> >> policy.
> >>
> >> v2:
> >>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
> >>   - Only include policy in scheduler (Luben)
> >>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
> >>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
> >>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >>  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >>  drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
> >>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >>  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >>  10 files changed, 72 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> index c83a76bccc1d..ecb00991dd51 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -2309,6 +2309,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >>  				   ring->num_hw_submission, 0,
> >>  				   timeout, adev->reset_domain->wq,
> >>  				   ring->sched_score, ring->name,
> >> +				   DRM_SCHED_POLICY_DEFAULT,
> >>  				   adev->dev);
> >>  		if (r) {
> >>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> >> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >> index 618a804ddc34..3646f995ca94 100644
> >> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >> @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >>  			     msecs_to_jiffies(500), NULL, NULL,
> >> -			     dev_name(gpu->dev), gpu->dev);
> >> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> >> +			     gpu->dev);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> >> index 8d858aed0e56..465d4bf3882b 100644
> >> --- a/drivers/gpu/drm/lima/lima_sched.c
> >> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >>  			      lima_job_hang_limit,
> >>  			      msecs_to_jiffies(timeout), NULL,
> >> -			      NULL, name, pipe->ldev->dev);
> >> +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> >> +			      pipe->ldev->dev);
> >>  }
> >>  
> >>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> >> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> >> index b8865e61b40f..f45e674a0aaf 100644
> >> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> >> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> >> @@ -96,7 +96,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >>  
> >>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >>  			num_hw_submissions, 0, sched_timeout,
> >> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> >> +			NULL, NULL, to_msm_bo(ring->bo)->name,
> >> +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
> >>  	if (ret) {
> >>  		goto fail;
> >>  	}
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> >> index d458c2227d4f..70e497e40c70 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> >> @@ -431,7 +431,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >>  
> >>  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> >> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> >> +			      NULL, NULL, "nouveau_sched",
> >> +			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
> >>  }
> >>  
> >>  void nouveau_sched_fini(struct nouveau_drm *drm)
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> >> index 326ca1ddf1d7..ad36bf3a4699 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >> @@ -835,7 +835,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >>  				     nentries, 0,
> >>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >>  				     pfdev->reset.wq,
> >> -				     NULL, "pan_js", pfdev->dev);
> >> +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> >> +				     pfdev->dev);
> >>  		if (ret) {
> >>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >>  			goto err_sched;
> >> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> >> index a42763e1429d..65a972b52eda 100644
> >> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >> @@ -33,6 +33,20 @@
> >>  #define to_drm_sched_job(sched_job)		\
> >>  		container_of((sched_job), struct drm_sched_job, queue_node)
> >>  
> >> +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> >> +			 unsigned int num_sched_list)
> > 
> > Rename the function to the status quo,
> > 	drm_sched_policy_mismatch(...
> > 

Will do.

> >> +{
> >> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> >> +	unsigned int i;
> >> +
> >> +	/* All schedule policies must match */
> >> +	for (i = 1; i < num_sched_list; ++i)
> >> +		if (sched_policy != sched_list[i]->sched_policy)
> >> +			return true;
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  /**
> >>   * drm_sched_entity_init - Init a context entity used by scheduler when
> >>   * submit to HW ring.
> >> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >>  			  unsigned int num_sched_list,
> >>  			  atomic_t *guilty)
> >>  {
> >> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> >> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> >> +	    bad_policies(sched_list, num_sched_list))
> >>  		return -EINVAL;
> >>  
> >>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> >> @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >>  	 * Update the entity's location in the min heap according to
> >>  	 * the timestamp of the next job, if any.
> >>  	 */
> >> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> >> +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >>  		struct drm_sched_job *next;
> >>  
> >>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> >> @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >>  {
> >>  	struct drm_sched_entity *entity = sched_job->entity;
> >> -	bool first;
> >> +	bool first, fifo = entity->rq->sched->sched_policy ==
> >> +		DRM_SCHED_POLICY_FIFO;
> >>  	ktime_t submit_ts;
> >>  
> >>  	trace_drm_sched_job(sched_job, entity);
> >> @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >>  		drm_sched_rq_add_entity(entity->rq, entity);
> >>  		spin_unlock(&entity->rq_lock);
> >>  
> >> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> >> +		if (fifo)
> >>  			drm_sched_rq_update_fifo(entity, submit_ts);
> >>  
> >>  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> >> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >> index 614e8c97a622..545d5298c086 100644
> >> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >> @@ -66,14 +66,14 @@
> >>  #define to_drm_sched_job(sched_job)		\
> >>  		container_of((sched_job), struct drm_sched_job, queue_node)
> >>  
> >> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> >> +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> >>  
> >>  /**
> >>   * DOC: sched_policy (int)
> >>   * Used to override default entities scheduling policy in a run queue.
> >>   */
> >> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> >> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> >> +MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > 
> > Note, that you don't need to add "default" in the text as it is already there at the very end "FIFO (default)."
> > Else, it gets confusing what is meant by "default". Like this:
> > 
> > 	Specify the default scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> > 
> > See "default" appear twice and it creates confusion? We don't need our internal "default" play to get
> > exported all the way to the casual user reading this. It is much clear, however,
> > 
> > 	Specify the scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> > 
> > To mean, if unset, the default one would be used. But this is all internal code stuff.
> > 
> > So I'd say leave this one alone.
> >

Ok.
 
> >> +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> > 
> > Put "default" as a postfix:
> > default_drm_sched_policy --> drm_sched_policy_default
> > 

Sure.

> >>  
> >>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >>  							    const struct rb_node *b)
> >> @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >>  	if (rq->current_entity == entity)
> >>  		rq->current_entity = NULL;
> >>  
> >> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> >> +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >>  		drm_sched_rq_remove_fifo_locked(entity);
> >>  
> >>  	spin_unlock(&rq->lock);
> >> @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >>  
> >>  	/* Kernel run queue has higher priority than normal run queue*/
> >>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> >> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >>  		if (entity)
> >> @@ -1071,6 +1071,7 @@ static void drm_sched_main(struct work_struct *w)
> >>   *		used
> >>   * @score: optional score atomic shared with other schedulers
> >>   * @name: name used for debugging
> >> + * @sched_policy: schedule policy
> >>   * @dev: target &struct device
> >>   *
> >>   * Return 0 on success, otherwise error code.
> >> @@ -1080,9 +1081,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >>  		   struct workqueue_struct *submit_wq,
> >>  		   unsigned hw_submission, unsigned hang_limit,
> >>  		   long timeout, struct workqueue_struct *timeout_wq,
> >> -		   atomic_t *score, const char *name, struct device *dev)
> >> +		   atomic_t *score, const char *name,
> >> +		   enum drm_sched_policy sched_policy,
> >> +		   struct device *dev)
> >>  {
> >>  	int i;
> >> +
> >> +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> >> +		return -EINVAL;
> >> +
> >>  	sched->ops = ops;
> >>  	sched->hw_submission_limit = hw_submission;
> >>  	sched->name = name;
> >> @@ -1092,6 +1099,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >>  	sched->hang_limit = hang_limit;
> >>  	sched->score = score ? score : &sched->_score;
> >>  	sched->dev = dev;
> >> +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> >> +		sched->sched_policy = default_drm_sched_policy;
> >> +	else
> >> +		sched->sched_policy = sched_policy;
> 
> Note also that here you can use a ternary operator as opposed to an if-control.
> 
> 	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> 				drm_sched_policy_default : sched_policy;

Sure, will fix in next rev.

Matt

> 
> -- 
> Regards,
> Luben
> 
