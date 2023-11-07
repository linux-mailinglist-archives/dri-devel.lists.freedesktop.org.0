Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8FC7E48AD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882EA10E657;
	Tue,  7 Nov 2023 18:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF1A10E63C;
 Tue,  7 Nov 2023 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699382967; x=1730918967;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gGB/OCfcuranbB+FQI77DMT7oLy55xe3vnVo5GX7dlU=;
 b=mffBEZns0bQLnksVCYi33ZFsRiCETdjHU+oAkIc/+u+etvwq+t6+YeTF
 bvxfuVwVxtIP7H0vfvsDeX+SRdHMdIrHMEuMQGxxz+stmJm+e/YQLxkQQ
 VgwMGwroLAtF1WPtkWOlVskH0vNMx3c8ohFeQct9XQK0rudFSA0IgvEwj
 IdoIO3nCE4uFvL8ASUrj5YY4OnKLEKJB+lsuBvjbalZTsuRhPvQZ+NU9B
 dmxYnB0JvbRZUStP4VRcMe9Csp8e4EqjKGErXZU3A3wkb4Kjhbx9gr35n
 VvRaGJdRWS4QDNfJ5zmZxje/DTzu0T7K/bmrMice9wX5CHncX+kNLdOzJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="453897595"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="453897595"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 10:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853468360"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="853468360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 10:49:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 10:49:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 10:49:24 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 10:49:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdJkKFWWvdBBy9gGGfsIKlq6/48lx8dhQ/CfgizqOQmSFfH5SkNSIPlihIAYZ44iq7kMtrzH0q9ICc3X5E65BouMNmf8RyI/oWKqqUJQPF+CofxTE9RWhjr4/EwcpnNcV1QIQVS+vTmxe1204cNdmkHH8Ej1v0KNK3fg1Z24CiBXiTuz7SXVe3gTbDffmdJlheeDhW1vGZYMNpQxz0Vu7mjpQKU9FbnPffe2bKf9slq+HT5UFJn21Nlty3DHK67U5qw/v71LJF6nxH85hbxBAQovjn1puzo8sEa5jF3wl/xkH7rEkwLfMEEOzkGv/rMSeJs7CkyBrtTYheb/xuPbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBuFGu5OicblmBjF9Fp8Jojt7Z0CSPEEZFVakwHTFpU=;
 b=cVMJYSK7KwngtrWxql9+Hzx2nSkET/TSlPMazYKqkR78T/oYgHf0/KMduwvHTb/sKQj5rE7qGor/vJzQf720BSBM5HpiJqQSjepHCEj04fRPWYrciDqomVBUv8xtKsRiOsFxcRar0IkzigGHrOgmebv40GrS1nMnJZZm4KrEvBZRNQ6KUl+j0EJJ6wLd9zlhsp/LOe/Q916T3CR2wG+tt4taBo6ZbOmOQsXRGemjFxfvFdzKtuEbINBh9+1T7m5dkJ9Kw/W01PAqYt7WTGRIedPEvQfziE0vx0kbv8M4hVC9FpwdUVyE55CUfdDK6H7Z+j85on2kCsTr0CbxrGJTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 18:49:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 18:49:17 +0000
Date: Tue, 7 Nov 2023 11:48:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Message-ID: <ZUokEKnPbLAAkCct@DUT025-TGLU.fm.intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231107041020.10035-2-ltuikov89@gmail.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 9398f8d1-f857-447c-08d5-08dbdfc23ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdD1kgipRAXb+HGxJvFEv8g6kbTObA1udfWB7Y29k3lBrm0Bw02+NCUF4K1hHevoQCtGNaCPX/3k7zJnSgmkeIAZNVu6ZzWVi0u8c0bQLNyawJ0oekxRZjEG4q8qEug5/i5M1UnQEanr184V062ewCvLtHhY1YXYHoDm9w1Tbz4Yzop+fboe8OspXytEq/Gt4CyYwmREH1G/GsKM+rpvzxRHmPZWBRPEzTJNBnEp+qw/R7vsrzjQwYIs5KsC23Wl5VfXcZvVSj4fRJmO8lMeS8ctXsA0qRWkmgn4cayFmgegMJGMauxnLdff6TuGts4o3qROCzUKistTomjyxaNf5jsNy2ieTzp0mVzjwk0QggK5Ia8t3v/qKhaNgu2TOtVfpmOv9k7xCbLwy3jbIsgmQ78Gkf6Dn3VICfUSOGXphDVjJnxKhJQi1rY2HwKB+Vj3ofxJWgGHaCrGrZ0WFBsxpi4jdtMc5pO4Gv+2HV5HbP8aXix58qxU6ZJUB4eJqsjoUvk3osr/dTxQXLwaEoEU6QZLQdapB7uW2Kz/IhRjBxGCHDgOcHPKT+C/dSwFDP8X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(6666004)(8676002)(4326008)(8936002)(6506007)(66946007)(6486002)(38100700002)(6916009)(66476007)(316002)(66556008)(478600001)(26005)(2906002)(86362001)(5660300002)(7416002)(41300700001)(44832011)(6512007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aB15BnQd8j/y2ml+lqplgzMsTnWduWZIJf0BsChvzjhskBjbMRj3FziaAOyX?=
 =?us-ascii?Q?jLcUwzLziOzPZlMOlp88eeT8q8/mKoGfkGy3dWazsO23BX8GaufFqAfabet/?=
 =?us-ascii?Q?TCL1Jf2Wo0QAI8dOv4Cz9FdjmvPyT0IsfftA+DBm/vUJ84mRK9eS0erS3web?=
 =?us-ascii?Q?0F3xuAqiK0BPw/8t0PKShkx9UvFGsHDiVXrWg9GM727XHGv5CX87s/kBLXji?=
 =?us-ascii?Q?bX40pgRfQiUFxRW8YSIMX8lSutE+aTfk9H0wePKLUUItrozE5RQNUsVSZT1F?=
 =?us-ascii?Q?Cl4oKtRYOcgwHFMGp42USFLFBhc62/A1WicndU0LgGOhKrI3kou0sbqBvdJr?=
 =?us-ascii?Q?5L1uhAZQsQMRnWxpDrXzbtf7Pj2PZIYV0zyAiudO+JRXcJw1f1kDBJJIMbHW?=
 =?us-ascii?Q?5xQ9oITuofl5W6WdlNOqPwvUciRYzQPVUztdtiqN4/4alJFeQa+Wma0Aw2qT?=
 =?us-ascii?Q?ByLOx3OtwhmPNLaof5sWzFOVhyk9P694LFG3bTRFUpVBQklzKRckKxSopxuC?=
 =?us-ascii?Q?aSIFxBAOtoQjigvRICGPxGQZ+RGfjWDvhHdh8ptOadz1ZGkmnmymdFwmoWi5?=
 =?us-ascii?Q?UVb0qnmLOFihvzV2QszyMk7UPMMwtxirnoNe4Pi0ZzaRfNNaT0Rrb2BD01cJ?=
 =?us-ascii?Q?08TNmKYmzYa2Qmy1UE8OgHKE+syZnxxDUu3QHl6tjAyfLaovk3LqQeqTA4XJ?=
 =?us-ascii?Q?ESGMHVjcICj7U4/ZJ1WhDJVVGKfweOFrHA+rBx6KCfpLgxRMC0NkEbLONvux?=
 =?us-ascii?Q?KeO7k7nnQ/M1LmjBDx3qQvBGJp+3UuN9A/tA1XhoMX2stq+R15f2NjZFlTNT?=
 =?us-ascii?Q?H6MnsmO6wMyRqZ6jDD7YH1DFVXfbEgELtaWMYfBpcP3C745n/ydalzVSW5LR?=
 =?us-ascii?Q?PRHdjPPrOAs1TKQUPdG+KoEOiPwN5YJYOC8VhnUekiFmtlutp4C3Gi2GNAna?=
 =?us-ascii?Q?49wCnHmEBLZ6hRJrqzFU8insldldym2mQriY4U545q2WZlDSX5glRrExDTEI?=
 =?us-ascii?Q?ekh7KTI6cZno7UPr0E+F0a3EJxKy7I6WYWJiHf3ZlKQPxVaHwVLd3dg099Jy?=
 =?us-ascii?Q?TgmUZg4a1uDYjSGUN6R+G/M+y+HZX36aLDgQcEcjtvOK4NkPFYxck6UKYgWK?=
 =?us-ascii?Q?ZOtkYsd3mHFDPKq3Tk/rxTYjUA6EshqPCSBPATRNG3WkwnVgeqYUdow4sDPG?=
 =?us-ascii?Q?AGi80C/uv5oS/Tu3/cBkJPxyUs6CGz6MsBdeUHP2tAPRcOUv0YE0/B4bWNdc?=
 =?us-ascii?Q?mH7V2Z2Bc5w2t6G92hcv5yz+kgAJImqiR+OvfEONljp+eoFno7iBvWEQDHTE?=
 =?us-ascii?Q?YBGEyHpeuZJ8pcCgAU1YIAShg5bAXLCj9zc85+RvouPapb1vNuHJw7XUAWTu?=
 =?us-ascii?Q?1IOf5JfOi6Hvb1QRol5Cp95zNRIIEOFCuzE64A9/byoIoVA6t0iKrsnhcWIG?=
 =?us-ascii?Q?eeQb2pKY9n6oDtfrrUojJBRvYB+n6EpUL0vKBIXtYZI8dQfmywf9wUfutvLk?=
 =?us-ascii?Q?lfpHgD17TT0xCTP6wHI/XY3+nfTNU6oaSoxPtkhJjKbE77hf93U223KjzTIJ?=
 =?us-ascii?Q?A/nR2O866FUenvi2mTZC8uPf5FD/NrqnmeVSvHP0JpmGnzMDpRhohA3sk7M2?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9398f8d1-f857-447c-08d5-08dbdfc23ed7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 18:49:17.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9USqg37JJZSAtBMhmZ9giPGGQNVaQZD/uxdP3sKX/FIqoFkwsHb/aIGvLUjRuypAesbcIZnznOjHqmwDsjd5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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

On Mon, Nov 06, 2023 at 11:10:21PM -0500, Luben Tuikov wrote:
> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
> it do just that, schedule the work item for execution.
> 
> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
> to determine if the scheduler has an entity ready in one of its run-queues,
> and in the case of the Round-Robin (RR) scheduling, the function
> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
> which is ready, sets up the run-queue and completion and returns that
> entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in drm_sched_select_entity()
> having been called twice, which may result in skipping a ready entity if more
> than one entity is ready. This commit fixes this by eliminating the call to
> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
> in drm_sched_run_job_work().
> 
> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>     Add fixes-tag. (Tvrtko)
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 27843e37d9b769..cd0dc3f81d05f0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  }
>  
>  /**
> - * __drm_sched_run_job_queue - enqueue run-job work
> + * drm_sched_run_job_queue - enqueue run-job work
>   * @sched: scheduler instance
>   */
> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
>  		queue_work(sched->submit_wq, &sched->work_run_job);
> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		__drm_sched_run_job_queue(sched);
> +		drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  }
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
> -/**
> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))
> -		__drm_sched_run_job_queue(sched);
> -}
> -
>  /**
>   * drm_sched_free_job_work - worker to call free_job
>   *
> 
> base-commit: 27d9620e9a9a6bc27a646b464b85860d91e21af3
> -- 
> 2.42.1
> 
