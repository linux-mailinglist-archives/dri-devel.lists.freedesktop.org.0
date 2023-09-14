Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F27A0BDF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2D10E578;
	Thu, 14 Sep 2023 17:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B450810E2A1;
 Thu, 14 Sep 2023 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694713055; x=1726249055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DrVsVJ/oavYZgc4M3kwAS4xSSe02wGeglnB6HJ/0H4s=;
 b=lLsnpV4YTMM9ufxizwUSAloG4405f9Ic6epROtFYgfmwPSkeIsmdvTd5
 1ICZQBbrD8onstC/Gzj0iic4tn7SSwzMmI0T6i34PFIhe9ucdo2VY62m7
 yuiEP3j1xPoooeGJCVpBDrCfq0d+0bW0KlKhtKxB+IFfYBqS5t/ARvDtG
 VEbhnRs+NMa5QCpRoLSJudhvuNMkJSSE6khqYMl2tsOFVtItx4svkRznp
 tQv+hF/RRmuP4XpA+WugbC3lzcW3JMZ298Y4nxpGAnpXt87TTL1cWK1cL
 Ll0QH9ej5E2WLhesN7x51jPKlqmCk3KietD23KlqX5UQ2ZJsDUT3VfIdq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445463969"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="445463969"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 10:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744622750"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="744622750"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 10:37:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 10:37:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 10:37:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 10:37:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 10:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCqaWP+/RW8ZmtN5TqWKKhDxMbKMukPbmjLqEyA/IhW1sYj94kO4tdIFbBV7sqA0nj2j8VIAEMqPbxZ5ZZc6/lSBCIvYC/way/SeGMXuge+MKd4VkoGTJVMxFNPsdAy9AWxZxsHAaNxkMswxy4IZkNvoR4/365XEaT1jxdKZmwEV5lmCTYqHdUryMBgoWEiEpm0WYgrWBnHgvOLGrF3lRKgXlPPeWDb+Ldp7+/JjRFRv5GLNhKhr66ixVToYQqQGkwB1aFOSAIQ8Ed4O1hY2e1qFKDv4pUXdCuDXtqV16Glvgs8cA++sg7TwUfctBoiQoTojddsyvShCR2/sK4Fl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2uQ0bPIWWTpC8kp7R7OwH6QdVfq6aAlOf00pGBOLcw=;
 b=LePDGqUlEG9P1Se5F/HieSo/kpN+2EWWdGXHQsfGJqehor6HIeU4+bdWbnc10JRsueXQALk76RtoUoUbodjHGWp/D6PI/Gnzrw2NNqCJNT1gIH+JcFKh3UDoHt6IaMM8s4FyGu0OLmzpmVofvKzGqJXZw/xy4VvMZPlWhxcPedoh8J5ocMTE3CMw1R8TO9JeZqBjxgVHYjOI+O3g5lOWShHi4p9mXOR9+RChReuqR6XLSpTafiEdVSXtEEMV9J5kGHM9i28oUG8AxMDW6IoantOIFLvBm5Gx6sRGowNVemykmd38eCM00sLc4hpzWgPtc794yPB5IOFCK7lbxZu2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Thu, 14 Sep
 2023 17:37:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 17:37:32 +0000
Date: Thu, 14 Sep 2023 17:36:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3 10/13] drm/sched: Add helper to set TDR timeout
Message-ID: <ZQNEm/82c4tSK8gm@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-11-matthew.brost@intel.com>
 <93a1dd2d-72e3-42b1-914f-d325b104580b@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <93a1dd2d-72e3-42b1-914f-d325b104580b@amd.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b5db57-f4cb-4c7d-a80b-08dbb5494636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EpBrLpGdFoUV1PZ7JJXZyTVd84fqHyxjsrNoxMLWIw7+7urYPnsdBA3WbquJUH12dVF+uo9SmP6d7j45+1Kdforer7KffmNH7C56lIsxnpsLDnuFGk8DbQWp7/JNNv1llX9jbVpE6x1GTRrGcJMlhLt9evmkAlBQSowYF8IQjk5DRnFAeSsDd4rOlisEYOizDJlH6DbWf3cbUORgMGIge6fNPUh0Fi3iTTzipGZrLIvEDoQh3jX5FwP3HMSaZ4Avef6/okS7TX/Lu92zbLd9SjV5DOcq8/yvmJtKsG8xk5+ANshbBg4mdgBwmczvlgNjxRQ3HZFzH90sitIW8sNcnbD0mnD7iemPg8aX2UE4Vv07+XILK7sHgBKYcTkkholrBYwEptlpoGGYAoRRgweYPlxBAJVc2Na6oRG0MojR3XlVBc1SiVsF8z7YWGVBfZOvfeOl1KoRSixeZ5mP3YhOdvgvpl14Qj+0LCZeqsSu+G045pNIRzB/MwxIvcHECV1+18hRYjkhNY8rSfDGAn2Wmc/5u1bhr5a31qBcQ4urOnYChTRlbDV04XchAKbK+mo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199024)(186009)(1800799009)(26005)(38100700002)(6506007)(6666004)(6486002)(53546011)(83380400001)(66556008)(6916009)(2906002)(66946007)(66476007)(316002)(44832011)(8936002)(4326008)(478600001)(5660300002)(8676002)(7416002)(86362001)(6512007)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIlu3zE3xunsV5eGXoJtNyx+aUL+R3ehK061rS7DFaKjXdiEfyTJlmh08jBh?=
 =?us-ascii?Q?NoEcA1jCI1/IN6g+NEVyDSvkp4bIYcxboQqMJxUYWSaHkLw+p/3VxP++crqe?=
 =?us-ascii?Q?KIdBCuDIxshAxdUN1cntuWIM711TNBtt8DMgLQpbM3sCZBi3v64F82Os4QUq?=
 =?us-ascii?Q?HWbGCfes+nH1cTX+PTcLnTzvSgUwQkY/4qr31GjcC2/xp6shGCIjqakWuSxa?=
 =?us-ascii?Q?Ll9xn5cNtU1ze1Shj2Nzm3HQdy8RFFgXoMwXXvYbRDdT469LShtttTQ63h0a?=
 =?us-ascii?Q?fOetcpX4ltLU1u8VQGVmR5foIZAd1Q/eTvGi2pQze3UqjCuCK1gX9QrXyfwc?=
 =?us-ascii?Q?G7J7V2yS/lSWPQOHjxUqFfCm7sF+oap8JEfv28/jJ1ICpQKHdusCU3Ws87Xv?=
 =?us-ascii?Q?637VrLCNvUZgUgbQW3/Oho7atkA3qNUn9VNKgLo31ZROvAu7l9foTUle2K98?=
 =?us-ascii?Q?wH7AQA55ZY52VQca9i3x7q5t+uzGRCZgIdf4xwwYlwxG5bZV5qe4eRbEuFhB?=
 =?us-ascii?Q?yZfdBhCz39neVGqZeO3dCKJ4dyNx95Y8nc4qUJ26X4p+u0o4lmGFRpgFEfoU?=
 =?us-ascii?Q?rr6fwiK0O/ADoUk9gSlKAr1dAoLmsvlVyQTIFi/RapxYoebL1yWdlQp2cKQC?=
 =?us-ascii?Q?CnUgcbsaqejuWqBOdVpf6YbZt6fAFDNKWdt6Yh4DnZmkjLYSNafCbSwWe15U?=
 =?us-ascii?Q?FH4iMJ+TeKkHW9y51Lk9NFWmu6wWhq5G4sreyKFOEifmIn/TWqSlGvxizLjE?=
 =?us-ascii?Q?G8CJh0VcrsV9OdgpxKUAKQX+wP14X0hECgl2WnRxQYEE6LOIgLgR/c/zXEv9?=
 =?us-ascii?Q?RPD0Nrr/48rPiNmHqYokhj8BJHWwNmHj7TDVaiocN5qjVbeVMYyQH3utJpj2?=
 =?us-ascii?Q?IZERYDUgYuElGPr/euM16NbRIj4mBYBSnNBxBqzt/sHapuw0KSs3sgwZgzKi?=
 =?us-ascii?Q?ushovCb660RzpC9ON7bbtCz84u6iKilL6ChNj6byO5Mmha2iFWXxXQOHNzoS?=
 =?us-ascii?Q?KxYIVyxhPbqutahpvPDayNI0oc2zvVkuV+xDBE7VBRlQccongwuVY7c6OLW8?=
 =?us-ascii?Q?mzqfbEqq1cPtLPOTwo8Ho+3ye5bKp3PA8dSoqem06+bAmWPasqAUs5V79L3b?=
 =?us-ascii?Q?lUxUgHJt8nJbNRPXw25ZkN6NQXY0ZXuynRflxh991Mr7AJY5Yj1Hxc+3n3/a?=
 =?us-ascii?Q?ti0cVlR2/TdA7uthdE546oB/qlhrvh+9hITK9by6PMKtrKNnnYmTkLfOsOJB?=
 =?us-ascii?Q?KNfEluY2gehPSh5ulqvV0+nSR5LTmDT+oNzgXjBMkTJaGRF047m/hKKcW6J3?=
 =?us-ascii?Q?zmMkXvu583j/NLgG1vOiOjlziQr5UhXWbotBPGxq9kSLeeuJuMd7CsdbzDuq?=
 =?us-ascii?Q?5z2x76x0EcVHZ0PO1BFLlOw/5F0jdyQJjvGNOfJ5SOaZA/x8wr+wHrRb9OD+?=
 =?us-ascii?Q?zEzLtC4hHDslXiQRpjZ3ddRnT7I/NzSTC0mxZywww3yTDclWBxd4zzkRL+5q?=
 =?us-ascii?Q?G3rft1KEQZset7ASCyyrff0A7gNdk/7cvggDxPQi0PmfqmWf1WwY3LeHk2zP?=
 =?us-ascii?Q?Nc1J+rogull7mHjAlTsfZTmKbzThqgP95n2G3e7aPZZYHxS+LuZOgMAemxCY?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b5db57-f4cb-4c7d-a80b-08dbb5494636
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 17:37:32.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TB/+vGzXmCTVANKJzMMKjOJqxR3AEXOkUHhxjE87rFYOhsbVnCRhZpTjBeBUu9qxfXPXabjhRFTCoXdRNMWENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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

On Wed, Sep 13, 2023 at 10:38:24PM -0400, Luben Tuikov wrote:
> On 2023-09-11 22:16, Matthew Brost wrote:
> > Add helper to set TDR timeout and restart the TDR with new timeout
> > value. This will be used in XE, new Intel GPU driver, to trigger the TDR
> > to cleanup drm_sched_entity that encounter errors.
> 
> Do you just want to trigger the cleanup or do you really want to
> modify the timeout and requeue TDR delayed work (to be triggered
> later at a different time)?
> 
> If the former, then might as well just add a function to queue that
> right away. If the latter, then this would do, albeit with a few

Let me change the function to queue it immediately as that is what is
needed.

Matt

> notes as mentioned below.
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
> >  include/drm/gpu_scheduler.h            |  1 +
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 9dbfab7be2c6..689fb6686e01 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -426,6 +426,24 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> >  	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> > +/**
> > + * drm_sched_set_timeout - set timeout for reset worker
> > + *
> > + * @sched: scheduler instance to set and (re)-start the worker for
> > + * @timeout: timeout period
> > + *
> > + * Set and (re)-start the timeout for the given scheduler.
> > + */
> > +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
> > +{
> 
> Well, I'd perhaps call this "drm_sched_set_tdr_timeout()", or something
> to that effect, as "drm_sched_set_timeout()" isn't clear that it is indeed
> a cleanup timeout. However, it's totally up to you. :-)
> 
> It appears that "long timeout" is the new job timeout, so it is possible
> that a stuck job might be given old timeout + new timeout recovery time,
> after this function is called.
> 
> > +	spin_lock(&sched->job_list_lock);
> > +	sched->timeout = timeout;
> > +	cancel_delayed_work(&sched->work_tdr);
> > +	drm_sched_start_timeout(sched);
> > +	spin_unlock(&sched->job_list_lock);
> > +}
> > +EXPORT_SYMBOL(drm_sched_set_timeout);
> 
> Well, drm_sched_start_timeout() (which also has a name lacking description, perhaps
> it should be "drm_sched_start_tdr_timeout()" or "...start_cleanup_timeout()"), anyway,
> so that function compares to MAX_SCHEDULE_TIMEOUT and pending list not being empty
> before it requeues delayed TDR work item. So, while a remote possibility, this new
> function may have the unintended consequence of canceling TDR, and never restarting it.
> I see it grabs the lock, however. Maybe wrap it in "if (sched->timeout != MAX_SCHEDULE_TIMEOUT)"?
> How about using mod_delayed_work()?
> -- 
> Regards,
> Luben
> 
> > +
> >  /**
> >   * drm_sched_fault - immediately start timeout handler
> >   *
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 5d753ecb5d71..b7b818cd81b6 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -596,6 +596,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list);
> >  
> > +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> >  void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> 
