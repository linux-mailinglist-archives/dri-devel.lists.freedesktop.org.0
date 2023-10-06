Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54A17BC307
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 01:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5962F10E048;
	Fri,  6 Oct 2023 23:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F5E10E048;
 Fri,  6 Oct 2023 23:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696635909; x=1728171909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wdHo6YTs0mUicuxe1K6rmY6IKJLbW8I6HYBRYS1rFZc=;
 b=WdaVwJYtTygaZqeGV81cd0854ieKuzO6zmYywqduPsa1Ot/Fjl0pDslC
 8ZXZ7bX24RfigyEBE6jC6gLtqwgwwKoqPyP/vpCGnWwXu9EBHVd2HsPx9
 AAH3mJNMGCZ9ez/DyB+7HO8v2fbBXelWpeW+6i+3So2WESm7E9+nZzm72
 SQ12nAX6XnNLOdkmxY0CkpDkWIsMK+1RJPeRoI8zztlTqGP6ULXQHX7Od
 m8revXlJ5mu9tjMO3xvtjg8IedYTP1NS8FYZq4XhC2bugiIG1L9YNfcmS
 ufnpsyYqvwlOO738b5CKUnKcqVRMbjRqTmFH8efwLnaTKM+Gd4O3UGfom Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374191996"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="374191996"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 16:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818171453"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="818171453"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 16:45:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 16:45:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 16:45:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 16:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExmzszmcZ1u8n8GcrVSF/xdE6RUocHvVTc4AAG1HmcZGY8gbMXj2gkcD+a4ipqQAABq1bpmlB6m7gSMETkDQYEpSNJ5fF/C3R3i6WoBU0b1jvjJa/jWuDfjoSIPyF5J0K/XYqcElhSAFWaKJaTYdhqoxIXv6Y0E4MTtLgcGJhXh8eg/pEA75HMI/Y+EgV9SzmQQjLWbMdp5Kel3Gz1tgGBMxnXe9VedwjEZkCvC8+00JhLTLQiEFJRbY1hyOeym0bOB95wMOzBM+NOcOFwF3azVVIPiCSs2iXdYoPjwDVvtWuzUYo3XQDANG5750Y9aLp+Ii5QLprgRzcu1RRZacjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM29D+dICIprC0EmGiKMAx2MbiLDB0yBzNBTqqU3jMo=;
 b=MLZbToWY5SNThZKJt4W981nyAgf28ED38ao5n1nEeeYTYGIM/YQ0Inm8ecsuouYtonFteL+4Sarx3lsshC45xzCzZdHUXhsdNuPpSrUQpS7/3ebdoMHNmlaaQdXGdhlqCLcB+5ozV1ZJ4fp26YwVUQWF4Q52BKYPQPeYgBsnhf0ZqAEq5SoF9N5XCq0OJSfRuPpq63x02Y1VgfXSAVsgv0/cMCBbFhbpdxH6Mq1zPSF2Jb8UiW9fBcpONxeTJW0oGQwu2ykRM0kC3D5mE4w1llZyNHv5L8Dc6qtIrh8stYsF8WhNWoB2xRJuwDLRKRa6yS8fOqDyMHYfGQeV8eF/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Fri, 6 Oct
 2023 23:45:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.039; Fri, 6 Oct 2023
 23:45:04 +0000
Date: Fri, 6 Oct 2023 23:43:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v4 02/10] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Message-ID: <ZSCbt8piGPlkkqfP@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
 <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bc14ff-80d1-47e4-6880-08dbc6c643bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CObPCp2cf2NB6hJAjFZtlgJ8Paf2oG9UbMJzxxhvm514LeXRZu2RUNNfLoPooUGwhjHOcSdrjrHpn+Pp2vTsf/Y5N4M8Z3/9KX8FFmUdTL9mAAz7oddj44gS1/S67YSAU1otdttug8IlEJcAwXXd5+H9rbt6UtJIj3isiyHYm+9llxCTeSZWEC4718E7+8W3LaznVHOVQQztoeFqKl1GAfRv7tDwkRZiWzbG3YdyBh1ZKbgH++Cbffu2Uz33QozHAh5MhZSmS0U5XUO7AMOtqy1iOmUWijbHyjuTQnftf8r+13vdRWh9HqMpsVeJTEFvpsgLGYXRZl191XDPK1kUtof/nV1NSJTu/g1UN/RJEgeFZwcPzWCQInYTjAZXfziLDTpX0wMLDAyQTXLoy9uge2CuRLSHl9qZc1zBHjK5DG6pf3T4fRIYBLaZ5wmrEGa74D1unEyin0mWOP8IbTA1P6XXaToVb7a/Yv2TkBLWtj99avCxJlw0C7QNc7+No48GzjehYYpucnYsU0Cdq43b8BhKmTuEejn9OdmyzEUI+mNgsO1SgFAIt9BBCSWI09x2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6666004)(53546011)(6506007)(82960400001)(83380400001)(38100700002)(86362001)(26005)(30864003)(316002)(478600001)(2906002)(66556008)(66476007)(66946007)(41300700001)(44832011)(7416002)(6916009)(8936002)(4326008)(5660300002)(8676002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mCURIwz54wBskEbwe33UWqcxQn9/A35vWKmXQ+xpu8CHFl8G/mYH3QrdT7ch?=
 =?us-ascii?Q?u4vD6DNN7UmLtJ5Hd78U8qOBEX2f5FDghRwfHvq2QAo2Clhjf3b/TxLQA6ef?=
 =?us-ascii?Q?mF3N5D/Iz0Ktha5JI25nKqH31tLkGw687cIQM7beKBo/RvLBTIecK6D1ojwa?=
 =?us-ascii?Q?+Xiyqks4siCuKibG2cuJDN+hg7ptBZOYC2HDRPt20/IwiLdwWPviO/02sG6B?=
 =?us-ascii?Q?k9VCxAbUZqFSvK2S1guGvWY0p+J/arPwzEuHsFy91cDIsSFq8zWihYbiOuvn?=
 =?us-ascii?Q?rFA2hCp2MLUTJFR0vhcOx/XxCh51zvy3j8yL46r5iPIEq98CHnOoC6XTDo6b?=
 =?us-ascii?Q?GV9bR7GYgz3otbk4kOanAJqcSbWvMeoUgYuOQWn4QM7Wyw5aXs26sE5JiuGB?=
 =?us-ascii?Q?6Vkpj5AphDyB/rE5zuAW5IB/siXs/j0rjXS8FFU11g5qyDtNQcv+Bmte+cIw?=
 =?us-ascii?Q?mt8PTnGyVOfsElzCd+dLFq1+x/j1GFJLdQvnp05MxqcQCRQkW+8xCNpIYJ45?=
 =?us-ascii?Q?rcyZ9N5vdT+PG9DModskyaKN7JRHwSwiRn+Ww57clenrBsjxGRbkJoKZ5I9j?=
 =?us-ascii?Q?xbgE1rbESoM7naaY70KuuNUBv0LeiI6Dkk6A6PA1LbrhiIVEVFbYfKCvMEnW?=
 =?us-ascii?Q?0KR62UMX+GZMp70WzQEg/LQnal/n0B9HgrIhm2drbYbhcXqZEkAg5nS3tF0v?=
 =?us-ascii?Q?3tPVpe97tEpu7RIstd2ZtKLw1fh7sZ7FFkM9o1aFgrhXbbrVBw4yN9b2wQkA?=
 =?us-ascii?Q?FYejEK9jCQ6+9vwKfBhnSlLyQ17beS1APaKmvHR/ePbDSVW7iPrDueep0gwK?=
 =?us-ascii?Q?WDvtnc/hBVVUL6W5DCcKg6Qv/FoGagDzrSZEVgAateMwhVjaWXZ51cDxjtiU?=
 =?us-ascii?Q?2LI7R1CHMLzQDyWZk8IN/73G8MVU32d1vJ0OLIfk7hR28xWWLwRL6B/OrKvh?=
 =?us-ascii?Q?GwFF24itXR5s/QIZTN2J0rVbU7Jdetv++CAKbgmxG/6n1XdmIA7k7lZFrxe+?=
 =?us-ascii?Q?5/DZuP8QSx56lnez0ZYWtCgDypAwT7IcCH+b8JnGl9Qa/yLQ8pe2cJJuQI56?=
 =?us-ascii?Q?jsrgLhryHUm0Ahha4H0kQLlAe2RV6iTC/1rjHIV9+y2YMDuAwoaVKGLHyfKQ?=
 =?us-ascii?Q?O8yxdnjOVt3ytPYD9bdG7ubttNgQyxC1nuju97PViA02Mmi0iv2+bXTEZDKw?=
 =?us-ascii?Q?i0bzgUSzINeluhaCuG5f/w7Y40UuVZ0bgiwxrrrywvIamRBJXppaM5dzc0yr?=
 =?us-ascii?Q?FqKBgXp5+MS5x9xtO5zWMSFzqJdGkTTEZLj1TmwO6lxghYf9yqWE4edUO+WC?=
 =?us-ascii?Q?2RApLwMP9iTGu4ELcXFB/snoNFXK20LAsxKY8IZBcVXfOfWZsXKVafxDxbLT?=
 =?us-ascii?Q?DhCIoc3eu/XjfZ+bNbBMp1i1EckpHSUdSfGQZy8O0xsNJwmC6FvX66xIqjAL?=
 =?us-ascii?Q?WUnU0ypkUub5Ghd6FsbwPtx4Gv5qWhU724i7yiQ6Gf0qmBsVQ5Rdt3SmzdWq?=
 =?us-ascii?Q?2SDcziGm9Tab9wHdCozdiPPgE+mEo3uWh6l69mMC7sgjBuNy+eDPv+35SNNR?=
 =?us-ascii?Q?mY4jpcG4IdoVTJcLpem8mE8JUa0q1Wph/ZTGMXoKqX9P60G9QIUaJ/XHEfZ/?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bc14ff-80d1-47e4-6880-08dbc6c643bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 23:45:04.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeuhIHVI08F+ly7Mx+WU+K7T32XEf6XD93C5Biztp6JCovbXEHz6lACgFpzlObUFCEpsk3S5sZS3eg9CsksRLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Luben Tuikov <luben.tuikov@amd.com>, dakr@redhat.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 03:14:04PM +0000, Matthew Brost wrote:
> On Fri, Oct 06, 2023 at 08:59:15AM +0100, Tvrtko Ursulin wrote:
> > 
> > On 05/10/2023 05:13, Luben Tuikov wrote:
> > > On 2023-10-04 23:33, Matthew Brost wrote:
> > > > On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2023-09-19 01:01, Matthew Brost wrote:
> > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > 
> > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > guaranteed to be the same completion even if targeting the same hardware
> > > > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > > > > apart as the TDR expects submission order == completion order. Using a
> > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > > > 
> > > > > > 2. In XE submissions are done via programming a ring buffer (circular
> > > > > > buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> > > > > > limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> > > > > > control on the ring for free.
> > > > > > 
> > > > > > A problem with this design is currently a drm_gpu_scheduler uses a
> > > > > > kthread for submission / job cleanup. This doesn't scale if a large
> > > > > > number of drm_gpu_scheduler are used. To work around the scaling issue,
> > > > > > use a worker rather than kthread for submission / job cleanup.
> > > > > > 
> > > > > > v2:
> > > > > >    - (Rob Clark) Fix msm build
> > > > > >    - Pass in run work queue
> > > > > > v3:
> > > > > >    - (Boris) don't have loop in worker
> > > > > > v4:
> > > > > >    - (Tvrtko) break out submit ready, stop, start helpers into own patch
> > > > > > v5:
> > > > > >    - (Boris) default to ordered work queue
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> > > > > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
> > > > > >   drivers/gpu/drm/lima/lima_sched.c          |   2 +-
> > > > > >   drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
> > > > > >   drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
> > > > > >   drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
> > > > > >   drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
> > > > > >   drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
> > > > > >   include/drm/gpu_scheduler.h                |  14 ++-
> > > > > >   9 files changed, 79 insertions(+), 75 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > index e366f61c3aed..16f3cfe1574a 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > > > > >   			break;
> > > > > >   		}
> > > > > > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > > > > > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> > > > > >   				   ring->num_hw_submission, 0,
> > > > > >   				   timeout, adev->reset_domain->wq,
> > > > > >   				   ring->sched_score, ring->name,
> > > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > > index 345fec6cb1a4..618a804ddc34 100644
> > > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > > @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > > > > >   {
> > > > > >   	int ret;
> > > > > > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > > > > > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> > > > > >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> > > > > >   			     msecs_to_jiffies(500), NULL, NULL,
> > > > > >   			     dev_name(gpu->dev), gpu->dev);
> > > > > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > > > > > index ffd91a5ee299..8d858aed0e56 100644
> > > > > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > > > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > > > > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> > > > > >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > > > > > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > > > > > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> > > > > >   			      lima_job_hang_limit,
> > > > > >   			      msecs_to_jiffies(timeout), NULL,
> > > > > >   			      NULL, name, pipe->ldev->dev);
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > > index 40c0bc35a44c..b8865e61b40f 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > > @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > > > > >   	 /* currently managing hangcheck ourselves: */
> > > > > >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > > > > > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > > > > > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > > > > >   			num_hw_submissions, 0, sched_timeout,
> > > > > >   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > > > > 
> > > > > checkpatch.pl complains here about unmatched open parens.
> > > > > 
> > > > 
> > > > Will fix and run checkpatch before posting next rev.
> > > > 
> > > > > >   	if (ret) {
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > > index 88217185e0f3..d458c2227d4f 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > > @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> > > > > >   	if (!drm->sched_wq)
> > > > > >   		return -ENOMEM;
> > > > > > -	return drm_sched_init(sched, &nouveau_sched_ops,
> > > > > > +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> > > > > >   			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > > > > >   			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> > > > > >   }
> > > > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > > index 033f5e684707..326ca1ddf1d7 100644
> > > > > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > > @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> > > > > >   		js->queue[j].fence_context = dma_fence_context_alloc(1);
> > > > > >   		ret = drm_sched_init(&js->queue[j].sched,
> > > > > > -				     &panfrost_sched_ops,
> > > > > > +				     &panfrost_sched_ops, NULL,
> > > > > >   				     nentries, 0,
> > > > > >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > > >   				     pfdev->reset.wq,
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index e4fa62abca41..ee6281942e36 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -48,7 +48,6 @@
> > > > > >    * through the jobs entity pointer.
> > > > > >    */
> > > > > > -#include <linux/kthread.h>
> > > > > >   #include <linux/wait.h>
> > > > > >   #include <linux/sched.h>
> > > > > >   #include <linux/completion.h>
> > > > > > @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > >   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> > > > > >   }
> > > > > > +/**
> > > > > > + * drm_sched_submit_queue - scheduler queue submission
> > > > > 
> > > > > There is no verb in the description, and is not clear what
> > > > > this function does unless one reads the code. Given that this
> > > > > is DOC, this should be clearer here. Something like "queue
> > > > > scheduler work to be executed" or something to that effect.
> > > > > 
> > > > 
> > > > Will fix.
> > > > > Coming back to this from reading the patch below, it was somewhat
> > > > > unclear what "drm_sched_submit_queue()" does, since when reading
> > > > > below, "submit" was being read by my mind as an adjective, as opposed
> > > > > to a verb. Perhaps something like:
> > > > > 
> > > > > drm_sched_queue_submit(), or
> > > > > drm_sched_queue_exec(), or
> > > > > drm_sched_queue_push(), or something to that effect. You pick. :-)
> > > > > 
> > > > 
> > > > I prefer the name as is. In this patch we have:
> > > > 
> > > > drm_sched_submit_queue()
> > > > drm_sched_submit_start)
> > > > drm_sched_submit_stop()
> > > > drm_sched_submit_ready()
> > > > 
> > > > I like all these functions start with 'drm_sched_submit' which allows
> > > > for easy searching for the functions that touch the DRM scheduler
> > > > submission state.
> > > > 
> > > > With a little better doc are you fine with the names as is.
> > > 
> > > Notice the following scheme in the naming,
> > > 
> > > drm_sched_submit_queue()
> > > drm_sched_submit_start)
> > > drm_sched_submit_stop()
> > > drm_sched_submit_ready()
> > > \---+---/ \--+-/ \-+-/
> > >      |        |     +---> a verb
> > >      |        +---------> should be a noun (something in the component)
> > >      +------------------> the kernel/software component
> > > 
> > > And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
> > > like this:
> > > 
> > > drm_sched_submit_enqueue()
> > > 
> > > And using "submit" as the noun of the component is a bit cringy,
> > > since "submit" is really a verb, and it's cringy to make it a "state"
> > > or an "object" we operate on in the DRM Scheduler. "Submission" is
> > > a noun, but "submission enqueue/start/stop/ready" doesn't sound
> > > very well thought out. "Submission" really is what the work-queue
> > > does.
> > > 
> > > I'd rather it be a real object, like for instance,
> > > 
> > > drm_sched_wqueue_enqueue()
> > > drm_sched_wqueue_start)
> > > drm_sched_wqueue_stop()
> > > drm_sched_wqueue_ready()
> > > 
> 
> How about:
> 
> drm_sched_submission_enqueue()
> drm_sched_submission_start)
> drm_sched_submission_stop()
> drm_sched_submission_ready()
> 
> Matt

Ignore this, read Tvrtko commnt and not Luben's fully.

I prefer drm_sched_wqueue over drm_sched_submit_queue as submit queue is
a made of thing. drm_sched_submission would be my top choice but if Luben
is opposed will go with drm_sched_wqueue in next rev.

Matt

> 
> > > Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
> > > and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
> > > Plus, all these functions actually do operate on work-queues, directly or indirectly,
> > > are new, so it's a win-win naming scheme.
> > > 
> > > I think that that would be most likeable.
> > 
> > FWIW I was suggesting not to encode the fact submit queue is implemented
> > with a workqueue in the API name. IMO it would be nicer and less maintenance
> > churn should something channge if the external components can be isolated
> > from that detail.
> > 
> > drm_sched_submit_queue_$verb? If not viewed as too verbose...
> > 
> > Regards,
> > 
> > Tvrtko
