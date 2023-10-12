Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1E7C6438
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 06:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4510E402;
	Thu, 12 Oct 2023 04:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F7E10E402;
 Thu, 12 Oct 2023 04:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697086274; x=1728622274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sKNATYXWtc4msqHUmvfmJSZMhRwKaXsRPwnNoatAolQ=;
 b=j8ukgL4x8Gcg2NUUTY7qQvg8iVqXLkpcEYh5emi2Ot/CIy6xlC4w4ww1
 n5l6YeJDL04pV4zeyRJD5/d1n8WcdChU7B+DcgFzZ/x/jaXSgECek89BJ
 uQUYVUEGwL8WqNzh8twt8+5W/cG+5Lr6+y2DQE+yRlq0dfVqUJQ1ECsmj
 JZavsnM6TToVK7D/T053T1G6GBdn0UxlbEhZFJ8jEetlOyIWz95KDKXOC
 bA2Gq7XZU0XUbA97RE+Isyo0R59IV2+UrdyUXT9+c6PSugosiF76KJ127
 UOmu8+lOuttUvYsdbPMEZcoO2qRk6w+YO51y/dXQAqETWSqXLtx6qChG3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383698702"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="383698702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 21:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877971033"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="877971033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 21:51:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:51:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 21:51:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 21:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGWzKp0tXUlMmNnRwDjNbfpT8sQIEpw4eU/RUu/XP2C4SZkA7CcwQNLOEd8N/D17DMOAH8XqZEHwSIuEKqBLqrWoRKvI3bjStrqLDU6uH80qScWl6oLioSHifw6/xXzMvErlaWr4kjVOx+fwAg1sroTrNdKu1mdDDbpatNWdO+9hIyTLjFG1V05WjOmkMlus0FyJDKatzX4bN32Z7SWwDzZK+xAGADAc5h1VAXmT566uncAISRoKLt2LxfENqND5Ih6cXGryVB4EE2Zq1D/R3iHjvA0eYTfhYkXTXZmoLUSk4fvwHvVl5w+FkX9NbKXZ3fG/fuu17923hVt8CuemTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12/vBLkfMnUFh4kRV6O/MqpZp+2nAT4/Mt8QHrePy9U=;
 b=aQOxxviwFf1TCYHdC4juqGjOR5ORP9WC703fOJngduaqVvx0yKY2BzFJOm3rtDbnrvwwMyDbJSH5rO8SfhNbcGhj7/CENN5HBUiJx7BUQgpUu4AW3xG4c1sryUgvvRqeAtmt1CScOW5o/eytsZg2c0QnsTbwtTiZ3Pdv0zpSGBQwq7e4Y71s2rXjUwW0FCE6zCCGiIXnEGELQSb346X82EPbP7IEUeXqKTEZ9TSy9fpbFZENLKJkJBJYJPvynv7LBhOWi5kQnWtVASQ15b2phIn0g6V+KCUO+bLc/+Qedvqgm6bnqYtgQFcgImKF3WaXosgbuPj+rY/iaaHGTxkcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 04:51:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 04:51:04 +0000
Date: Thu, 12 Oct 2023 04:49:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v5 0/7] DRM scheduler changes for Xe
Message-ID: <ZSd6743EXHCJaqML@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <8c01bab9-6a70-fedc-211d-b22c7340f8f1@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8c01bab9-6a70-fedc-211d-b22c7340f8f1@redhat.com>
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f86cb3a-f6d6-4d45-a933-08dbcaded693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 706ZSCZGpQE9nE/n+Cq1XOLkZk+Z8CEBPWd2xYnd9MByfrmMsY0z+buH6T7FG+DWPs4GNg0j0mTteTsnraMckaGTBeQbd9J2PNq/VRpsdB0uMFRSoZvT05DlfEA6WZN492V9GRy7L7V1NmpJOwT06+fAo7/aD3rdijG2LtMofbGnUwYAK5ry/i4J14vMIWAL92uW1rWSWnmjKYiC4FF+wKoClJ2F8awNydgzTkWVY3oHCbv/6dagk0YmyU1tjREaOJeCl4SV/CBgn/mAva2vLDcUDaSIDDaDxBTdqAe51ZQ5IQ6J3QcGCArCj8eA/BlMgHmXaY10Offi9CaNAH/IoPgXFDJrd3ELkcZABfCp56GWOAXJTipGU3EnueBZyViKl1qTvuNwvZKqtVaQ5mwCponY1+xanwD3Usu3tbZvDgnd+SKb5pUm+hlMUsR0kyrapTbkjzyxeGnHGNmz7b43MKCQL+ISDZhfs1K23hOECbd8+5kTSUISV9FgIUWmpTOV2NWfVDrqmS1yOhJD+J1IXMLuxcxVLJGF6aMfvHvgG6dpN7XXVSmpSrTquq1nUjfCfxEGtQo4kUcBblRl/ElBhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(66556008)(6512007)(53546011)(966005)(82960400001)(86362001)(38100700002)(26005)(44832011)(2906002)(83380400001)(7416002)(6486002)(478600001)(6666004)(6506007)(8936002)(8676002)(4326008)(41300700001)(66946007)(5660300002)(6916009)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I7XxqQ6XvoIH1zDm8UYLETLvuvu1TNWZSsf30OSr1M1LkO3dUYcbI4uTV+AA?=
 =?us-ascii?Q?4Po38ktNt3un4XJc1jsmJv5rn8FaLwJkIQnV2rfTdfJGTd1rNZ7krukaEyjy?=
 =?us-ascii?Q?gJ37qmTG96yN8tL5YwCcrGaNGU7jnSpgeV2SAKYO8Z+jW0SuXtlfTro1Wvfw?=
 =?us-ascii?Q?VeS2vTCahFaxHIavDDLyFHEbAnmLDISeMXw3dT/42D0DilDXDLjHwCGuFCHv?=
 =?us-ascii?Q?swFFNxB+M52Ybxnu4rMXOIC4TetuCLQoPE7JuGfW5bmWx/RFg6G8vN9nCuQB?=
 =?us-ascii?Q?2OkORYMrwPY3iUUS+qAHCF64LWiLHJuXY3RuS8yegooh0W0ib7PvpN7NldlN?=
 =?us-ascii?Q?4uM+ASd7KsFjlNVKHN/R+2Rn4fx/Zf6ODa1ow3guJX82wo5SXwUq5/YETRZV?=
 =?us-ascii?Q?CMkyPDODZDdEEHh7Pi/YaCNa2752x83Lqjk+ZWJj3ddBnDhiYk8mqdkW5pwN?=
 =?us-ascii?Q?j3obJOhk6nXJWC0of+6akfyqnIttIIyzdvqvk+vzoDF2CHz8MQXsuw3Bj4Ky?=
 =?us-ascii?Q?F/J9epw05bZWXe84QvLF4qfEK/Vp/BaU1dWC2ZV666ut2+9l5SHZeOIh+v4R?=
 =?us-ascii?Q?9qnLbT3PQKOLOYqpS95wfiNAHHNWPMyh+HkLRjq4oz3JzFeLqBgF95Si25Me?=
 =?us-ascii?Q?jTevDGd3n04XbS8k60t0cVWKupQ5oeE7+gFw3hOoxRGMn7wSoq7LETTR06kh?=
 =?us-ascii?Q?bEeLUOCyayl0vBHuIe9t60i6f1Qar48NQVHrYootbaj37n2lmvLrL+kVtCUS?=
 =?us-ascii?Q?Aic5uKv+aPR+7vlh5OlvV4QUAroAhxJTqvyVH6zoCUI0rhbJ1s7ZKYq6Amsq?=
 =?us-ascii?Q?ycr2C+wEwbJE8XHbN8mwuk2ZmgwspREw2wNxKnzo+HSi1lyPe9FRLFhg+MUT?=
 =?us-ascii?Q?JBBIboSnkQ8wiaOFOSPwiuhJ0Ol21CBgh2gCAAJ6EjwBsScECFnkwfkQKdPf?=
 =?us-ascii?Q?kbfSJmB8dYlchr3tStuWlsIA3ioRQDJPjf4u7xmOrpTHAcjz64PpbR/DgUF+?=
 =?us-ascii?Q?DVGMK+tGSxG1nlb9lpUSSVHNn1Q9hCZYfiGfXfLn+t6mX/mlKLtmLRTz6rGN?=
 =?us-ascii?Q?S0WPUcwpsisRAN5vMiVT9FQRMAMD6V/tp4K8yCx4vFdcxmXFo9Ov5IgwPE5k?=
 =?us-ascii?Q?soDXxQnIbNQ5LUIvZnGO2mpOP6cmywZwQJDxQD+ll0v5hjZ/PCQ2zQmfLFvt?=
 =?us-ascii?Q?pB6JrVmC2aTYx1p60SyHNg7l/J56v8gpoxkeKxSn0sYc7KnwjCg8WI78pp64?=
 =?us-ascii?Q?Ga8aY5Up5jmTZJDXQIknKH8MxJuYNy87CCpwTilqMBYty1NTJhT+a5EpnKpM?=
 =?us-ascii?Q?8Re41f3p0NvKjsGkox5k6NNsi/TZycVjWhijX5XpwohmcdDeCZDn7llGIxBr?=
 =?us-ascii?Q?wGAZxf7lvkbEdq5flrZ840rQwqaZxhyBee6tDj3Zebrc94wRcBDX5zdF4Tnn?=
 =?us-ascii?Q?SEnzlSgvqaFgtoAvMvDQUeO6IkKp5PBHcRy+aNk41dp8UBUaA4Y1Co2gJM67?=
 =?us-ascii?Q?k5FCaH9PDG98PWzo0lxS+yXTF8lhT6pLVU3dNFpAOxm94kyLDmzKeGmj3ldO?=
 =?us-ascii?Q?cCMzLGrJxT0U6DDTbaP4pUkgGVFIDQeFXAYN/Jpxk+nHEVFS84TMwZBIV6zv?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f86cb3a-f6d6-4d45-a933-08dbcaded693
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 04:51:03.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGnhdz+f3X+wukBd8gJdX9nLBu/v1HTgmcgNWfBGWw4PEfS8r8HC3pyd5FutpIwZqjJxWR9GYDLXiN4eLoGFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 04:02:13AM +0200, Danilo Krummrich wrote:
> Hi Matt,
> 
> Can you please address my comments from V3 and V4?
> 
> https://lore.kernel.org/all/076891e9-b2ce-4c7f-833d-157aca5cd44b@amd.com/T/#m34ccee55e37ca47c87adf01439585d0bd187e3a0
> 

Not my intent to ignore you. To be clear I need to address this comment:

'There is some feedback from V3 that doesn't seem to be addressed yet.

(1) Document tear down of struct drm_gpu_scheduler. [1]
(2) Implement helpers to tear down struct drm_gpu_scheduler. [2]
(3) Document implications of using a workqueue in terms of free_job() being
     or not being part of the fence signaling path respectively. [3]

I think at least (1) and (3) should be part of this series. I think (2) could
also happen subsequently. Christian's idea [2] how to address this is quite
interesting, but might exceed the scope of this series.

I will try to rebase my Nouveau changes onto your V4 tomorrow for a quick test.

- Danilo

[1] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m2e8c1c1e68e8127d5dd62509b5e424a12217300b
[2] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m16a0d6fa2e617383776515af45d3c6b9db543d47
[3] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m807ff95284089fdb51985f1c187666772314bd8a'

Matt

> - Danilo
> 
> On 10/12/23 01:58, Matthew Brost wrote:
> > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > have been asked to merge our common DRM scheduler patches first.
> > 
> > This a continuation of a RFC [3] with all comments addressed, ready for
> > a full review, and hopefully in state which can merged in the near
> > future. More details of this series can found in the cover letter of the
> > RFC [3].
> > 
> > These changes have been tested with the Xe driver.
> > 
> > v2:
> >   - Break run job, free job, and process message in own work items
> >   - This might break other drivers as run job and free job now can run in
> >     parallel, can fix up if needed
> > 
> > v3:
> >   - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
> >   - Fix issue with setting timestamp to early
> >   - Don't dequeue jobs for single entity after calling entity fini
> >   - Flush pending jobs on entity fini
> >   - Add documentation for entity teardown
> >   - Add Matthew Brost to maintainers of DRM scheduler
> > 
> > v4:
> >   - Drop message interface
> >   - Drop 'Flush pending jobs on entity fini'
> >   - Drop 'Add documentation for entity teardown'
> >   - Address all feedback
> > 
> > v5:
> >   - Address Luben's feedback
> >   - Drop starting TDR after calling run_job()
> >   - Drop adding Matthew Brost to maintainers of DRM scheduler
> > 
> > Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > [2] https://patchwork.freedesktop.org/series/112188/
> > [3] https://patchwork.freedesktop.org/series/116055/
> > 
> > Matthew Brost (7):
> >    drm/sched: Add drm_sched_wqueue_* helpers
> >    drm/sched: Convert drm scheduler to use a work queue rather than
> >      kthread
> >    drm/sched: Move schedule policy to scheduler
> >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >    drm/sched: Split free_job into own work item
> >    drm/sched: Add drm_sched_start_timeout_unlocked helper
> >    drm/sched: Add helper to queue TDR immediately for current and future
> >      jobs
> > 
> >   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
> >   drivers/gpu/drm/lima/lima_sched.c             |   5 +-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
> >   drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c      |  86 ++-
> >   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c        | 506 ++++++++++++------
> >   drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
> >   include/drm/gpu_scheduler.h                   |  48 +-
> >   14 files changed, 499 insertions(+), 233 deletions(-)
> > 
> 
