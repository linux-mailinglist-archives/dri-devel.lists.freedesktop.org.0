Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A322A79D424
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B009D10E238;
	Tue, 12 Sep 2023 14:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D349210E238;
 Tue, 12 Sep 2023 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694530609; x=1726066609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gFbl2XPcW5zvQPE0SejbURlrCIy+zVwPCx1PxZniG6o=;
 b=dgT0yj4cNkSqGoeLCnUtx05yIAtKC1HaC+A+RFG0cAUPCQ80vuXoinR4
 T9ZYHd/2/hZTHPuYeGqvoZoACqhNToAo0uWhoUSNtgVOVL8RBknH80+zS
 YfM/RfrUmSgYcbzeMdQ4t2iRks2+Ou7jv/r/cZLLOEEj9aYpwLfmGRsVE
 Arpb7xy7WffJJwbhbXJSu6KS2l28RATsrHNyZWBDPk1ZHj1d7sM8keBTV
 jPyN1QN/3zvy1yDrCxrk2KVEtdra9gA4RF8HkIrzPvRARL0ozUDwgk157
 QVymktwfgKO1Wr/ScIDHHpOAZxbQjV0mBVhOzkd9SSm3wjIEG9c8I6wmW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363429093"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="363429093"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743747097"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743747097"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:56:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:56:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:56:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:56:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODHciwo5QA/AI2zivUBeNCBpk0tOWNbEIf/2/emRY1MWniS8t9T+vv5rd6lYt8dWiYXMEl4SixptH+ENly4u69DowVcyPw+8NgJ64sfkDR+D2DK8ouSn/TvfC7o5lfAtZUN9VKaM91+5RIgw9HvjIdWbXLwoxpVhGwozPyDMXAkAQgY3Oc38K7CULJQx8Z+Ivxg4BKYsEq1qw/8jScQ6bKBwBJyrQ0XIgg0u3ixUHhMyyut7YvnlPEaa2PidB969L8r9TgQlDDd2wlksNjEeM2fEi4Hc8i8qK0mW5YlmwCCZvbhhTqPQ7/zMvZgquROwkcOPCPRVobi9UVd7pzRwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS3Cvd8th5eMh472UsupWsw6g5KUHDfee1kXy3zNmiQ=;
 b=fsjsXOZzGRwwZNxLk7Vx4Qvrt/GHKnES5IGvF1gfGEZCPj74o0b6U4e/K4+TUmH1zP7LhxsfAiDhKBErxGHFFqbPkeJr6SswL1rWIJds36gmSf9mBNztOfd4KjCuUOHc9ohlFP1DEaXRhYb2QxLR38/MDzpmFEOhbTdoh+iSsqXMAhflou5elY6If27ffSfx5ycoKbfQfwEI+7Q9PKlJpG1RnWq/DOLQnooZmethPNstLJnyd92YSIrGqg4RlSAYzWWkRX4do4BCu2mOBiqY6WTDUaER5u0zbsl0VUpCk+VhSFrJJ2brVf9n3uXeJuBQW2lZ7TGlhAhlXoMa2xD7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36; Tue, 12 Sep
 2023 14:55:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 14:55:59 +0000
Date: Tue, 12 Sep 2023 14:54:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
Message-ID: <ZQB7loeEZaUABJfH@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <20230912122828.548f6365@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912122828.548f6365@collabora.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM8PR11MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 335968bd-511d-4e9c-202f-08dbb3a05ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWwWGMBGoGm7jFyi+VCIRmXKCmyDxXeDzcv2i7j+A/L7Qmb72qnUJFXRdeAOz437QNV/1I9AnzieYoRArthxfGI8AkwWMPQl+I/GE6j4aL0x2l9Ct6WnEwKWBPNpuDHlgkCPaWjH21DIr5X4PhbT2jtTTnZSG9a+GrpNaaWzUY+0TOkZprkxhIGjuhMjvqJEgw7Y/QCce9ifkvQPc7UjBtZYrllhrqqm+isB1QcdlaJCMtneD6DI3Gna2fTn8LYs0x0hTeweMIRi6EdsiMoGIY4Me/Fq7MX8J9lLsbZj92PFd06johiZmjzvAgoOSPFDLlDiCYJsTfVEKhqCExgjIeHtgSRe2tJ+U7j91EOYgMH1m6mET/7UJWJqNw1o9Agd26jLU0FPD6q8u2arrd1bL5Etg1inx/wTUyxOqQ10SOMh8QR9lE2MJLpc/9CPdR34NU301VLhouZqJMMNHixPs6eXYbt8z/sqjV7mPW0m25x28Z2kqeLdgSJUsEaaxUGSw24pLzh59U+e6Y7HUjXPI8JtBIQb46gTnERfA72F4tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(186009)(451199024)(1800799009)(26005)(83380400001)(2906002)(66476007)(478600001)(316002)(66556008)(6916009)(44832011)(66946007)(7416002)(41300700001)(6512007)(6506007)(6666004)(6486002)(82960400001)(86362001)(5660300002)(38100700002)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMkOumwfx99jbER89ztFAh/iAaUqUs+hhn6aO3dRSwAvXVygEgPFlkioFB9m?=
 =?us-ascii?Q?/N4Mn8gEC6lNjqDIiHfOHdtkHPaTbvBKU6NfWwEmC1MEhz13e0SpOfcInkju?=
 =?us-ascii?Q?s2CXcSmJsN67opp2BhOBEA/3dZbqcltXJ+OXRsp5ul3/81mJfZfIEKcBjnME?=
 =?us-ascii?Q?t+RgHJsxgTIKIK/CaWYtVHrPBwpLahjoAXakIclOGA7qlE2fY1EE5yjBLzqx?=
 =?us-ascii?Q?K8h8GjUczGrK4a5uDiqKGlq1V7+CRjwgRFOx3QYE5DThYe6qrgVBo5tN5NN4?=
 =?us-ascii?Q?M3uvKfj9EQWE8V65epG11HKJjUIii2bIhn3RjkRP7oW6HJ5+x5akt/T6GPKd?=
 =?us-ascii?Q?16Pxxz93q0zYdaig3Sy/mMKwGYK+t9DNzEmWciAiuo/3xrXvdR/nYTvcb2A0?=
 =?us-ascii?Q?px+egaXv7+inIlWyOmcmO/5Nt7WknXj1obp6bcb1YgBqN8Jll8jUOhbhPrdT?=
 =?us-ascii?Q?yvpUqrqKExbVjyucGXKU5LT4Flj9R6eTFCvgbZV1/vNY2SvYjqcfJtQ4HfrN?=
 =?us-ascii?Q?xAAR8W3TCcYycWVkbLaDZjOsSacRKixHAGlF69P3lGrmOCFmXStf2BBplQRs?=
 =?us-ascii?Q?ExUquq+sQs2mFnblXiPS1NS/O3kfYUetbfx9TkD8NsHyO4YJ2k4+hf2+gIEH?=
 =?us-ascii?Q?gV6LrAkZWOGb9pJ2iHEYHGc7/7Zwl335lMWLmLId53dDVmwfSfqctpbNJQ2J?=
 =?us-ascii?Q?UUr+ODsrS9J7/ynqHN2lXUln8X+Sxl72cKLi8gph7jl0PgMe+pd/yZpjhkqb?=
 =?us-ascii?Q?MLb5fj6fuGHK5LzLNMdsooix/xx+YtfA4Rxoln01SMcL0MWisNj0PrtlxWMI?=
 =?us-ascii?Q?MV5Sc1UbYYpQxuanpoOhZFxJDu/dWa1q2XcvyolP2jzBxNnLEVuHwDHQDYw1?=
 =?us-ascii?Q?3nrFKogpkWRR3kprGi/XBP6KfLmjMB151NLT138AjFUZI6OsUQUFZUGycDOd?=
 =?us-ascii?Q?kJhnhU9UnwsYkWLb8K+DK0HO4FSfYdMHyCu3p7bw6CUOg7Jf2lUfHlgLfYGn?=
 =?us-ascii?Q?13zQxzpLSoqqKg4sq0AQVYNfZf59W6zqZk4f8nmOw70jfbTQyaPXPpBO5aJ7?=
 =?us-ascii?Q?JE2zPCKwuBb3V8vacUoaBmZKVCkEaIrmkxCJ9i1nuEcCDy1RwW0mXDAExy0G?=
 =?us-ascii?Q?lEcdsMSdpUDX5oSOa56flw1pwVBxmee/+lIccYO3BHiF0cSFN4aP6i05I+16?=
 =?us-ascii?Q?Aghv7UONiwKpELzUECARSjSOxsLRAQehJhFH8ssLPjAjoaaVm4B2L5mhRbfm?=
 =?us-ascii?Q?06BDtmz5v551ef+EFb6nWOrSkLhWzfHAHTa5kR5RsYwJuDK9hP7cXmUrs1XG?=
 =?us-ascii?Q?WRExr79p2S5TSTXT7bSGIJRM62GS6DNR/fk26zfwDwS4jvgn6mXfP4SwbbPB?=
 =?us-ascii?Q?7+GzBVYQ+7LEgDrzGs22MAMi6Zu6KLHiTRdst6USCFMQOS8yIChlMah+5HxF?=
 =?us-ascii?Q?kOgrTNYl7voEGSTq24CjYQO8cdzHNbR4sbVbGnUHf8TBRX77GZgRBmN1G9EM?=
 =?us-ascii?Q?PckCXIcBV5rD7YEJLVGCzE7e8A3i6Cg1N8dG2HuXfVGdCMZU+iqYkM0rfvuu?=
 =?us-ascii?Q?KGonUxtzP8yBpdhzEGvyvQ+tQ2fX767zPqQWPaqMN08vMQfUu7VVZq5A8D/D?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 335968bd-511d-4e9c-202f-08dbb3a05ff3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:55:59.1093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngN4M8jsdiDybn+oRguiqmsU1rE/lETNOWqDFUxSkQez3q3CQkCa4kQM/fS49szi0frz8ywsaNvNnaZaPVO+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
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
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 12:28:28PM +0200, Boris Brezillon wrote:
> On Mon, 11 Sep 2023 19:16:13 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
> > +{
> > +	struct drm_gpu_scheduler *sched = job->sched;
> > +	struct drm_sched_entity *entity = job->entity;
> 
> drm_sched_entity_pop_job() sets job->entity to NULL [1], and I end with
> a NULL deref in this function. I guess you have another patch in your
> tree dropping this job->entity = NULL in drm_sched_entity_pop_job(),
> but given this comment [1], it's probably not the right thing to do.
> 

Didn't fully test this one, regardless I will drop this patch in the
next rev.

Matt

> > +
> > +	lockdep_assert_held(&sched->job_list_lock);
> > +
> > +	if (tail)
> > +		list_add_tail(&job->list, &sched->pending_list);
> > +	else
> > +		list_add(&job->list, &sched->pending_list);
> > +	if (!entity->pending_job_count++)
> > +		reinit_completion(&entity->jobs_done);
> > +}
> > +EXPORT_SYMBOL(drm_sched_add_pending_job);
> 
> [1]https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/gpu/drm/scheduler/sched_entity.c#L497
