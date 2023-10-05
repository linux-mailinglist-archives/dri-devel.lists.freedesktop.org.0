Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9E7B9AA7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 06:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52010E154;
	Thu,  5 Oct 2023 04:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE0A10E14D;
 Thu,  5 Oct 2023 04:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696479159; x=1728015159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FbSLJcvV+qjLqFRwtqFDnz38RkZLrp0ul2oWzLXX4Js=;
 b=PNBjd9gXviE/RgPc3lkYetXk4viEkHT658KPkpo2ZtLSMggknDg+NLVJ
 IzIZxDnrH0maYdXHQS/A7EmzUhHSLfMCoAWzK5nDB9X/3Rjv0n+14fLim
 BHzcHLktFtwfkv5eub3uyOsaszasG/qBTci4x/iOHZKzXn/NHwGn9iz3Z
 frslJA/M/bp7VrYxYdbo+93tFGsudFcc7ySI1aU3OUHIRzkYzMD4pcKnL
 L4Ah9qirqLJatfPc9sbVPOvhjh0WQQclIV94yr1ANfq5kKcLavkylTCLT
 Ie384vPB2mi+QiiORkm3oGWLnGIn/2a+rBQYkNtkQrUF55h3PIBUVFYzK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382265572"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="382265572"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817414268"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="817414268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:12:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:12:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:12:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:12:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBt44GcEnIHZeDxxZ4989M3ZwzfwGNkTD6GpH7YkiWurjsxFqav9jcSat/U5PL8kWAUu5qL90HGEOaQXBTVnYLYFsXPG+3TbNaWV89Ab9eoNYWCrfpWOZy4pKoyyiDCNmbi5Znlf8bCkNBUB2B/MuSz9UM6Rs5hrjiJRLXI5iw1Wj/uMYWDd74Ww9ixKfy3h1Ecq1CQON46ea9+wVsHoN1oTDYg+l60KLCqh9ZL+/p+K3KWh1U1ob+Xdq2Lifcc8/sMKLh/GZ6COkYHr7F8oSd/aOM1xAmLoI8G2XVYy1LIYXhC24XBLqu/UngT1G8tOoRepSyNoczgHHVkktK3nUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb9XkxCzRw0iEH3JGbGMMkt+YPESs1W7FAK7qtQoNM0=;
 b=fs2gG7EjvnQ3EbKeZaUdxzqOQv2e8++Y1k6hVPJL7cFSXbkxkfdvDStNqD3xwMQg0cjylpcWU6t5/EBWVjMuRdjME9suzqdMHmV96mkk/rnRTd124xYZyRZdN06AHdqXADBft0IDFc5HsmMoroGVka6+IeEMe2t3gEW4OidRqIGjkg4FP7FNxuqrsjctLTgPbH4jTCNR4FkYLdD+WJVhkcsfydbS6FRqLUlM2lPVfeBTTaqWunHhJUT0s+dX4izsVBPtOclJhWLeBagF3M2z7nIhfrzGbXxz2uT4qSAKXrDMnc1Tdko9jDci6Xy/KPTVnfMHzBszMXI/oU9uLtpACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 04:12:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:12:35 +0000
Date: Thu, 5 Oct 2023 04:11:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 08/10] drm/sched: Submit job before starting TDR
Message-ID: <ZR43bOMVEZd+Uscv@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-9-matthew.brost@intel.com>
 <c799633b-54d0-4158-8a13-a7c37ae6067f@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c799633b-54d0-4158-8a13-a7c37ae6067f@amd.com>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: f45609e5-3e42-4a4c-6686-08dbc5594e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DRWuVVJfABQdPYJzKUqZdTFxZv6lKFeBGygUx6UurWZ3UV5/24QGAox0YeVR0kMo1d9O5Gmzc3EcuHWj6Rn+MI9+1GRsWhcuqOi4AFilA7ewuw52VUBa5GISDTzcqZEHmNaVmQPM/VPEr5SMgTi/tMYT6Rz7+LJm2BYDCvZZF9iGQa1ddCtpZx6DsXDCPFHAEw1iKGH4fPSXudmnGIXSbJ8lYFwOlJLPbmHxSRdqKQXH7v91YI64If17pnfGfj1G8UpLwxOiqP3pzTTGT8aJXvtWZ2FT1TjNnFkdHuoF5tA50Cpqrz/wWVRScDi2IH5eDNmigDSt5wk5s3dH7HGVW2En10MRvtb2qCkpd0namEM6IxaDO9hMIAnGBUN8+QVC8j31yvCWUsh2lScKHk8cpvzffuoiVBDxLchuAJFcjvMXmBO8BDN9iB73NcCSDnVwDSNqZCDq6O7wo8YBd9M4KhySzAPX2qe+xm6O1BWs7g6TtlvfXMEsWaAuFYxwys38XTUQW358aNPWWYZQHVtTz8HRa6ngJetGVFEHTleYPi0JaBJoVHlHpPpOywHWBWhOjeb/PXGLM1w1C6l2uRU9HoEpuUKlLp9sehQzr6x5mjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66946007)(6916009)(316002)(66476007)(41300700001)(53546011)(6512007)(26005)(6666004)(6506007)(6486002)(478600001)(38100700002)(82960400001)(86362001)(83380400001)(44832011)(2906002)(7416002)(4326008)(8936002)(8676002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RcQlAHx1Mq7afSnbB22YZUo3LkYmliNo3CF9lwvA/NIFC/usA3wPrZ9v0sGE?=
 =?us-ascii?Q?QEdcAOTV3eeh6U9ZHeS3vYpLplOHCg2Q1k5A3HnhnLwVp3Sj2yK95o2B8rMI?=
 =?us-ascii?Q?Mpn5dCMGnKokZOTv87BXT6fOHGCaa8WBjZzAo47QdINJzmTB4XB92IooAARC?=
 =?us-ascii?Q?MQc48wkmTdWMWshxskNqxmSnOSKe0Om/vN7Zscm8gPwZdTlsfD/VIIbr4ElD?=
 =?us-ascii?Q?xpCZkjFFky7jvJT9+ibXKo4yHLovcpW7NcpPjhUKufCjQU4mntN/aScecMcq?=
 =?us-ascii?Q?EiQXOLXk7RMKuuNZpOBzJHoAX6QFWN/9E+aX7L4m0MoEfBuDxXcCuIPjRKzR?=
 =?us-ascii?Q?Y/I6qKD5ooMs5WHPxfWoz+AreRwJE6jdnWHzpmy10KpEagsHebnIRnWpMVVc?=
 =?us-ascii?Q?ldZDc5aiGdyeeUKPbR/OAYRuzdEVuBSUeB4sVTXqUmF/3bXogNsM3YAgucK3?=
 =?us-ascii?Q?z/zLSJRqH9Ws9Me4qcVE5gcsoCPkmixI53htWr8h8DIkAqkv/R8xwkqglGbD?=
 =?us-ascii?Q?2BB2RWOjauNHtIJeZ16kgMiT1oCK0UkI1yre7RbBlROzsMVNbrJEqe1bqV/Q?=
 =?us-ascii?Q?r38XV2Tw9r5FkfNBgpm42+9khmi4MouTbpnJKi7K6F6RLiy3zOOCo784dpGA?=
 =?us-ascii?Q?ywzrUTVHq1w6rBrvrHD/0TvSe9F5SalT1GlKVH8NaSav9iBVx8tXiI2L/6fg?=
 =?us-ascii?Q?hHQjF/poKk8dJBMsSxP6ltxe2ssJI8o4Q6n+czBJH4BMiT7T7nw1jW+MHgtX?=
 =?us-ascii?Q?OwAPxulXXJSq86urDBUmzYf3Fd3olrkf1T9y4ET9JU6IQ6bKrFrPQIeCeOm8?=
 =?us-ascii?Q?XKvWabiN8RhdhKwR2HZ+CXf+jrPRuEf6qF9yeAvB4NKM/PQ5D7rvkqRAm8bF?=
 =?us-ascii?Q?DmW5s4F8OSyLv7U4beOipomCA6UIonSrIGRxHTWQIR7RLB8n0/lpPKdrisCn?=
 =?us-ascii?Q?60USLzhbbpV0kBA3vk6gydH6QdHVJmI/jf6aXPn6HsjIUkvK9GuLgcCIn5C7?=
 =?us-ascii?Q?MZOjB5L5CvPP+nQXvUmmUYIvSU3tlPSF1Lg5zosmjWQa/BGUW1dNrAAk0CWS?=
 =?us-ascii?Q?KAl2e7tTkg6el76u/uF5F29rfdyZEgG6rwLZ7TcfWCnuYOA+zgeAdooTPGlb?=
 =?us-ascii?Q?tQE6Fq2D/sNw7d/p/zyX5IYfemgsGLGAOX0G50Bd8q3iNrTaZZmMhkVhlqKr?=
 =?us-ascii?Q?pSHEg2NKPpAC/tzMjn62BKk16ygzKeDOLlowu2inRSf5ouYs5Yp5WXOYD13r?=
 =?us-ascii?Q?35UPmWd1m92X/5Nzgi8GES+82XECiwS7NfS/3xr5VRap0O2HbjBvcv1pcFkF?=
 =?us-ascii?Q?IS/aV1jWoVG7sLXyqwoN2rLpaYQySqEdBT2jlvgAB8tQ0SOLZFi2qOV5vjBd?=
 =?us-ascii?Q?uS2hVcDvbeTb04sjexBI2QP8IiUQh0yXKv42KmLGM0Z9N3qWAJiQKEtQI4AH?=
 =?us-ascii?Q?GQQ5tWqsDlja4301bQlKAlTs4/B7XRGnCHH00PY8CERerEp7xY6X8lJl6epd?=
 =?us-ascii?Q?sE52DyC6ykv1vO56LOzsS92iP1o5xL1JObgZdVwYoZeb6SG5vlRpJJcruScw?=
 =?us-ascii?Q?AAod7ggj0wq7XiK0kbnm2uMmGO3AaNY/HU3tOEWO6LpN414ApekoxGAkxdeq?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f45609e5-3e42-4a4c-6686-08dbc5594e01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:12:35.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aD8yg/RkN1MH6yb/fSZS13fSkQ0gUlftqltICtdZH+Kl2aeVMSNQrtfqbhblQeWTJrJU/BEF447mX+oxd7lTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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

On Fri, Sep 29, 2023 at 05:58:46PM -0400, Luben Tuikov wrote:
> Hi,
> 
> On 2023-09-19 01:01, Matthew Brost wrote:
> > If the TDR is set to a value, it can fire before a job is submitted in
> > drm_sched_main. The job should be always be submitted before the TDR
> > fires, fix this ordering.
> > 
> > v2:
> >   - Add to pending list before run_job, start TDR after (Luben, Boris)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a5cc9b6c2faa..e8a3e6033f66 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -517,7 +517,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
> >  
> >  	spin_lock(&sched->job_list_lock);
> >  	list_add_tail(&s_job->list, &sched->pending_list);
> > -	drm_sched_start_timeout(sched);
> >  	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> > @@ -1138,6 +1137,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >  	fence = sched->ops->run_job(sched_job);
> >  	complete_all(&entity->entity_idle);
> >  	drm_sched_fence_scheduled(s_fence, fence);
> > +	drm_sched_start_timeout_unlocked(sched);
> >  
> >  	if (!IS_ERR_OR_NULL(fence)) {
> >  		/* Drop for original kref_init of the fence */
> 
> No.
> 
> See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
> and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>,
> and Message-ID: <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>.

See reply to previous patch, will drop this.

Matt

> -- 
> Regards,
> Luben
> 
