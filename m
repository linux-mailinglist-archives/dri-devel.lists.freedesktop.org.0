Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D97E0557
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 16:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37D10E160;
	Fri,  3 Nov 2023 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227310E160;
 Fri,  3 Nov 2023 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699024426; x=1730560426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TTOo8bVyGbtfGaAM29qboWcwLLGQCMmrwMairQv9zEg=;
 b=RjP8CMHkyy7sMxZBHTkSJXUn6CBYUoV+/RuB9rlNCmV2X8Mb5RY1P5eV
 hWob1EEVn1eVcu+X0WRFFurI9eeuYOBn8tfBosjupA1mWSyIjjnt87vjW
 QCgzu6sOiJWiUN8WzlV3PFTqeLDB37Is2m+rkD5ZxrtaKBky0Zz0QsyLV
 dCfzYoG6eV1SGxW8d3viKiiFr4jc2KG4wALzGgkkALIRSQudPLr9ep3AL
 Ep8VxxyvbyT/lNsQvwhvyANS3BEXpNUmc2HDAwiGsZfMFNroPRgnVI63f
 AmhyqMIVcdjsgOzQrkQwiAZz4UAWk+juq2f7G/DuhXZ2igjOBskU518FJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368303584"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="368303584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2780750"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:13:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:13:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:13:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erZmstcjnAGFHCdmiTCMR3tGkEDk8TpjSejN3dDJdkU0zXmiS+2yzOZi3Ikrva4GNWNsEJ/Xgigvis6TuumTBqbTjVjfTJKL7+PNBlOdonq/H0XeDNpJwg2Kf3MMPnoMr6+EsrzE7lsGHlspLvvD59lfXSKYH+QIRzjpHTG5UGuOzgFrtx8BESac3FTZahkq9jmv+QtMngz3IK/D9DuIYTdHNh3IVRYqQ5vDlXwVdgY4V4W7p05rVVhxSGtookxnIEeu58UT37peupBRKpXQWyone+aMNbl4+bVs17z/jTf4J88ruzwkF09iyLgMbE3MEPxEXaJN8eWNO1L88erSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjuqUkJRkD83EYLn0nXmb0ErCcwmr5y5BAbAjx3i/mk=;
 b=RfyXqCjVhpyr5OocPj742qFHFizxPW4AwGILqy0nsAarE8PsmbZJGEz+NMYZIbu6DNfclDVtuOGcpPVaA0Pxn1t5r8mdtUKAXM6YLeTrzNSseCOwVVKe+IKvXhLaqBfUlTF9TabD6r/T/0wo9Rg7psAP1b+ur9We8UaIzGFgcZYDQgr1uRav0VHSfPkawnLjDT90CbnZrTRQsKD7iAr7Eib+nEYj0uXbltG+ftedlLVKP/Yp2TapxFubrcvRbrd4GhmF+wk6Wsxw0ATsK75mwIVy8NsOLDg6FkOkSxJ7YgQw/oP+pWKk8xOkokLvgcx8DsXjQU25A29GVxTlQ3NVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:13:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:13:33 +0000
Date: Fri, 3 Nov 2023 15:13:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Message-ID: <ZUUOFw9YxklMb8FV@DUT025-TGLU.fm.intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231102224653.5785-2-ltuikov89@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: c97ecc40-e6cc-4d87-82bd-08dbdc7f71b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQAQUHAasmgHm5QA4B9o6hONoU8gWj9/ECim/ljvGgEghpGmRTfGSA4FL/WM5RQMJtVOpx1da2tg7fI0VrEvjdV5ju/4+SyowJyB5OWBg8BcY13zuy10Hn+CLVDQYXEolGdruO85thERVLIyit8eDYNEUJkkr6vC6DLaWUuEIjINLd0K0EFMYKjryysKSODPnxikUn6rN2+wjRA8jmEVhE6pBkVjpAGlKgG8ss5Y2im5WMhPl5XJ3Y8NRlqnP1WpiL5CMMylVXE4GbDuNVTEuaAeM80yQ5Qse9YlDDLF4Hj7sxBvKHkdKbF18Og7m/4f/EXXHV1qvLHLkeLDJnFtJNACoBZAm1qC5y7HfraQzfVDD5vH7oZIFD0L3PT5185N5dUWcnbDkYO994HYvgRr1gW79IeR49uE9PHR3GpOgovVhL1aoRPGnwC8l1nRSvLp2u5C9Wur/CPKdFktE19EK1DyYQ9s1h4QV8/e8WQzOco7pvDkhFfM92yQJHAoMIvUCbwv816+ktsKOJwTxuNBpppLXZJ4FSyFDybOo6iiLps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6512007)(6506007)(83380400001)(26005)(5660300002)(82960400001)(7416002)(316002)(66556008)(66476007)(6916009)(86362001)(44832011)(6666004)(966005)(38100700002)(8676002)(8936002)(66946007)(2906002)(6486002)(41300700001)(478600001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCJVe3rQvsOI2HRK67/D/9uAsd2hswblg8aHaddXr4+xK09lmkxw8J24hfPR?=
 =?us-ascii?Q?cbJb4ljFWTlrrhlzhgjySPs9NYjYfXrSv+nM5BuLEEB/jgnNlzcjij+wMhNI?=
 =?us-ascii?Q?iofBadPuTSIIc60skbs/MqCaRV0fpRYf25sOyPZOeQk/9kAEVqY2ShB+ovla?=
 =?us-ascii?Q?Yw59By9HjL6XTZvoiBwkI8Gf+Np1vkMZF8INKRJnwMAWBbLXwtwJENN77aJw?=
 =?us-ascii?Q?p8qYAZzObB/JW+AQsDL58HzYlqBhDRumt/76vV+Wfv0V4OhU2gyPIL95U0L4?=
 =?us-ascii?Q?WXnZSJ6Y4pmke2sklI8Powwnt2ZWz+Ip8vUwurwqolDiPcDuwKl22cUxAfAB?=
 =?us-ascii?Q?WwSaUl+wTZ4yERLnWGPs20BDOJeebfKUw/U4XIOMoRlk6PyUVzw65Zrl7VK/?=
 =?us-ascii?Q?oQiOURr+yIWMrjvAaOk7Sw73Z5gOaSjwfTN7Wf07JPBi3IlWxlUmffd2XCYE?=
 =?us-ascii?Q?s5TsSQTH5yuhXLvho7xqSwqKMxSQwoELOzmaZjy1G+M7aPDmcsWK/JkUUaBw?=
 =?us-ascii?Q?dYEXtsgCXqeEXe1/oiWmZn6/Al9KCrNjJOxNEEnH6v/0iZoofcLap3RvxRJw?=
 =?us-ascii?Q?mo7zMpEt8HX4nf6+mi9DFsrYQwgt21jVYHU/kWVNVbC2jf/462HvtiVf5jmF?=
 =?us-ascii?Q?mRasB6HY6LzFwsfw6x/Y9wRPum++OfJ7lcT6O64l2Pfm/WQ2z2hxm4KVN5kU?=
 =?us-ascii?Q?k3HeRW+edahpJGu1gxq4MqdgppoTY0TmAar0YH2jq0TldNtCMkzG5/W1Per9?=
 =?us-ascii?Q?4qU0O54DyYI/8AA8TuF1QkswRGtNo80g3PXGmM7QZ9wKtRpKnsVOm1o5sUbG?=
 =?us-ascii?Q?L2Bhis/FPK1pyO6kilrgIQFm36k4Ja6JQI4I2F/nse7sDHHbUNcEc9BNUAkt?=
 =?us-ascii?Q?0pJ0iR+9ut9FLolV8r4yb6DWVr7U5hgdbQA54fj7hCc49L98cdQvP+TRQAEz?=
 =?us-ascii?Q?cKkzey4V9++hiW3pbcsiCYZNwfAKbzXSPQ8MuMHYNjLEsXxrArMqtuCK0dqt?=
 =?us-ascii?Q?V9xDDutcakS90YmSYkzt92ehGWcvpzGP3QBcafIE8yaEr0Xad8li8OVFdJK+?=
 =?us-ascii?Q?TmUIPz3AUR0O5vqX7cu9OQebVEy+CkfDOc7V985pzLpmpYUl8NqWFPKbj73P?=
 =?us-ascii?Q?oBWUmqWhfLKHn/RtPg4E6+2XAzvFCKITJCPD3xPOc2h/uAqX/FMQJA6pNWAr?=
 =?us-ascii?Q?YdhB2pR0tiXlnUSTzJQKb1Ke/ZZvxvuN2TrQIU2RXpEmZef/Y0t/9QT+AQVW?=
 =?us-ascii?Q?kWvEWW/9IU489d/dn+avvLZf+NKzG9ouYAnaxOdy1iWVIQgh/qR9loSFE23V?=
 =?us-ascii?Q?dwjcMh0u1M0mIIeaMN1LlahKPeTJIPpyTKFZxvf0GCve2kYPO98zGsGZHmAd?=
 =?us-ascii?Q?G5elJzYcJflOKQf5pD0FQYjwGVbdV7htxf89c/9WkENH5H7EYiQZzwfoOTz3?=
 =?us-ascii?Q?DWkwXZ7O3TsRmOm/F5xdI+UnCUQGg0R+jonAa32WnrOb5HyCv/RAy/wjrXmk?=
 =?us-ascii?Q?wTeFSCjW9iOjpNKM0SncI7A/US4g/86Z7Y8sCPe3qVBDn+kCj+DfLEr/N4q+?=
 =?us-ascii?Q?n0kX860oZ3u/JEW09lX9rFH+l+3BOv0guf2XdkQnMCfilwqKLHIlXjy0FirM?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c97ecc40-e6cc-4d87-82bd-08dbdc7f71b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:13:33.1755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCB8GoyJNJ6mIxHRF7LrUhc2hfwodH6O2kLRU9iwZrhN7GJwwgRbBLgItultwiNAiDVOLZoZlyqsRPIcPHjfTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
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
Cc: robdclark@chromium.org, tvrtko.ursulin@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 06:46:54PM -0400, Luben Tuikov wrote:
> Eliminate drm_sched_run_job_queue_if_ready() and instead just call
> drm_sched_run_job_queue() in drm_sched_free_job_work(). The problem is that
> the former function uses drm_sched_select_entity() to determine if the
> scheduler had an entity ready in one of its run-queues, and in the case of the
> Round-Robin (RR) scheduling, the function drm_sched_rq_select_entity_rr() does
> just that, selects the _next_ entity which is ready, sets up the run-queue and
> completion and returns that entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in calling select_entity()
> twice, which may result in skipping a ready entity if more than one entity is
> ready. This commit fixes this by eliminating the if_ready() variant.
> 

Ah, yes I guess we both missed this. What about reviving the peek
argument [1]? This would avoid unnecessary re-queues. 

Matt

[1] https://patchwork.freedesktop.org/patch/562222/?series=121744&rev=7

> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 98b2ad54fc7071..05816e7cae8c8b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  }
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
> -/**
> - * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))
> -		drm_sched_run_job_queue(sched);
> -}
> -
>  /**
>   * drm_sched_free_job_work - worker to call free_job
>   *
> @@ -1069,7 +1059,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>  		sched->ops->free_job(cleanup_job);
>  
>  		drm_sched_free_job_queue_if_done(sched);
> -		drm_sched_run_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue(sched);
>  	}
>  }
>  
> @@ -1127,7 +1117,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	}
>  
>  	wake_up(&sched->job_scheduled);
> -	drm_sched_run_job_queue_if_ready(sched);
> +	drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> 
> base-commit: 6fd9487147c4f18ad77eea00bd8c9189eec74a3e
> -- 
> 2.42.1
> 
