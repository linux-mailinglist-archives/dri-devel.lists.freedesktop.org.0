Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF5768A1C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 04:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F810E164;
	Mon, 31 Jul 2023 02:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8B10E0C6;
 Mon, 31 Jul 2023 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690771388; x=1722307388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gfK9hxD8CIZVG955n0iJyt89A+J7PmuAlcExG/pvycE=;
 b=PBnEVwmg0w4HKTJbQDB/a470qbjoNPQ+g40vx4BRnhE9Zj/vMSpuARiB
 8bc+muSYyvF23ZmYHRLfBYjTfTb4CEM/OrBOkZEQYNmQaPXv4O1GovmSJ
 RjK1FWr8E41wfzu9XuRA+VQcvkCeoP+E1v9Ku+4v+YqsGEuCep1Qv0Ddf
 f7t4Qs4MZnNYXQRs86A2X7hb9+yFXm28fBqMrpozbniwsY9E8Zz72JTBu
 CZCHKwkLsYWBuhGE4JMxrZDbF+OGMchwLVfsuObBlZ+yye6XxDZ0cIh9p
 PFDsIYPhc7OVLEpqVMptIiBB0xBU7peuGo03A6qkPOtU8qzKhR1g6gy6W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367794875"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="367794875"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 19:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="871463400"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2023 19:43:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 19:43:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 19:43:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 19:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+gwx7WZG7KWGZPfFTs3TYO0pUuHwkS7/wX69VasR/T2C5KlJAGxV9wBkoMs3AVD9GAKxtcqqXPJ5wDuX/xK2ajkEI6zAPJuzLqgaBihVy16e2lvW6MmcjkCAXoISErhTgfma/lBDAm5ThMRmYhnXwm+f9AVKsJ9juQjWiM6rBvaH9q/Agh+YPJn3kNMYOmyrUH1HoSvNv4X888emSvyfAlp7qNWit3rslhWckr0rAMltArSi02s5bZeY+KKrRO2KL9aEE5D/alFs/Ewe7jilr9TCFVbm9DCzB+1m8ose+jYU1HPbupNo0gvicpl7CoMbw7JdoT5jxd+1NHFdBHoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITLxFvhpzVGA69TIovtA3HAZs8xBKQMarKeiSrzr5s8=;
 b=Dld70o0eMBGvUoPyKJnTQakVffIpJU+NFUlosbUis16vgVqiIPgQwAZVBvdBXwVbyWtrlN38kNglwLLeELiKElmgoqs8lHWNxCmJrXmhCRrVCed8GRDLJGxH8POCrlregdlxQT6fkh+o6gVcAsYGMuWO7u65MGOZqRcHoPTUD5i7TV1c2p/NcVprLXyZjUW7XbV+py3PDBF3/3GJ3S8fhgOUuIt2HmuiEeE/t29hh3Wiyadf7RUVSHAATYCip+hm27yiiUfgzmUe3/8jJzqHSp8H5pgQrEKSsnGhE3v5GxPnV0pUAv6O5hD1wDQ7lSb/7bN508LYw1pp2Na55w9ReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 02:43:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 02:43:04 +0000
Date: Mon, 31 Jul 2023 02:42:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 04/10] drm/sched: Add generic scheduler message
 interface
Message-ID: <ZMcfiJjcjjbAJpYB@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-5-matthew.brost@intel.com>
 <6d786062-0837-fd44-085b-2cc7e7d3c064@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d786062-0837-fd44-085b-2cc7e7d3c064@amd.com>
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 925b1ad6-8c1b-4d91-2629-08db916fdcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZgrzUNUS+If68rLVgd5PmEjiJ1xqC/xAOKeK8sSdL1y9Ncw+h6RVI9Nm90CuMc5n/hr0IlvP3mJ4AwrvZN9mGKY96Uou7e2sdYO+xbhRMkxjKNptqMcFPZT+bxxrvS6ziKKM32e2HRqidVJFrSUJrVE0mKa/4hC2b9B3lfEuz81vWaQLgVfkqMeiDAf7HrUuxoDqHhmdxDMPB9sFws7cdWHF1os4dcnr8C1JjBKGoPMS92D9ATZlPZhezBCMqQQFVklR5YeGt5dsZwO9kQDHaPHQz0pFgRCw/P4S2eCn60+QA/rA+r+OyFRnBgZSe8EwW+EKMKhVDVDPTYIA/I7XqzT1KCPdfd0IjAjp53p18nYAb7hXkEkvdody6qKelhoxxlu7nqR4mqwMXqn2qYr15pun49XwGaiHEnKxZfYyQFAGJbCWCXiRvOzEExGOIbrpguERfCR8wc6JlEPKRu+NKCr2BUMXvyU0utKoSUvyy/jtCVM/Qg/fsum/lhwXW9ow6lvXPK3BhMyztVSHO2tu6Sc9sTn3BA4WT20EyupnNfwMg6M70vMO23BfvtPIaq8QY6sfp6xRc6KNPKUMvS9g031PH9EzlrI+eGaIYhKmGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(5660300002)(6506007)(53546011)(8936002)(8676002)(186003)(44832011)(26005)(7416002)(83380400001)(478600001)(316002)(66946007)(6916009)(4326008)(66476007)(66556008)(6666004)(6486002)(41300700001)(6512007)(86362001)(15650500001)(2906002)(82960400001)(38100700002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbkvwz13ySjdmyvwE+eFaKnQ0BchVDk7M21cZaQLqMBGVvvNt0+EXG1FuA8P?=
 =?us-ascii?Q?oKCkTvav7B5+FA2T/zL23OELYAkynXLhQ1rDc14XxS43TEsTULUvNae4ouwh?=
 =?us-ascii?Q?65q9Sy5cJJ5SjUshE3+E/zmv3/InTtJ7VLnwAlK+HfnPSbRpU/coQTfCUm8Z?=
 =?us-ascii?Q?NhjXBuVde/FQrvw0bkw3cpzDeHvuHX03J9P4/EsiRJF+XAK9hU/eb7nCedw0?=
 =?us-ascii?Q?N0TweMnKXGtGQP080s0+MMRvaqyy607bLG+BiP+Vs8Yp24G9s/jYHlwzhHbw?=
 =?us-ascii?Q?oRc+SiR5v7hxMouFY9aAKM3Gx8qqivxM5L6eI7ndYn0+peOPccJpoyaYiRA6?=
 =?us-ascii?Q?0RkX/o/ujqV6XhX+9Ujwwn8Sp+Pg0eD92KraYWx/JUVF39UzprHmkO4GMUia?=
 =?us-ascii?Q?Sknm4tqVxAr3OfYhRU402/ub4UgW1ByUPZ6tS3lJJunVU44aKLydHWX7WepE?=
 =?us-ascii?Q?5UZJzZAwf8fDYXP9PSx6B1e0FypstwVyarfW4i4i77HpZ7v2UYQ4QkcydvOh?=
 =?us-ascii?Q?xd2RjctM3dfC1tR4v2/jP1DqJMaRQg0OVOQrc1yNQGGne82Tu2Fu9rA1hOo/?=
 =?us-ascii?Q?NZN5aMAvRoUQql3MKFOa/JeDhoF38k3/T7ncD3PcIeNTQQmwsaEdX++uFrG8?=
 =?us-ascii?Q?x3qdutF80Be2Bsatd/ftM8nFofFENB1IROna6iQfHQkGxu3Pp3ulvPEMkAhP?=
 =?us-ascii?Q?kIXVIjpcja/mixjgdc2zxh/xQHgrHZp3oBEjDLO+jEjl/VE7UaFkTWHEW7Eu?=
 =?us-ascii?Q?l8A3ykHg552LxS1Vmx3+ne1ShkS1UmxSHRDlZ3zvlbGbWzSE+QzRhuvGzTrg?=
 =?us-ascii?Q?VZEOpuY1tiQrEeKxZJ6ILAp/lAnzpr2MSnLoqxwe00W2CAwK5MjBsQPVZ/xd?=
 =?us-ascii?Q?JdbZK39vBi6OR6OEQYERIzqGc5ZF95LThjaWtpWGw7vuKwahj1O6vF01+H9Y?=
 =?us-ascii?Q?rAh0JS6KNllS28y9d0QcanPNPuBWjRckjUV81+Sm0mMDel35Y6ynhU+wWzxB?=
 =?us-ascii?Q?YdgNYkmw9sRdudrLgih1spYGZMGkCN/Qi9PCj3KGxjdsplYbxmH89DFuv/A7?=
 =?us-ascii?Q?58HBJLQ3ZZOmdL/dAUwOQSKfDaEWwGEaj0a7Sv/e7o3FZmEhRwkVJcFgF4j8?=
 =?us-ascii?Q?OcoDoS+WPfFrpOH197rTPtWYZyLghgFOJlWNXx2BpUVvfAYZ+HMCYmLLwitn?=
 =?us-ascii?Q?0aribDC8J5uYkJaapenRcMdFPUOS6+H7CT70pZgzYPQP4o2lsUpm8inq92PK?=
 =?us-ascii?Q?WdON9Tlk92IwzyXUHUY7IK9oOftwDjKWHSKMwDrGPVdLR6251UiN/Gs8PtYg?=
 =?us-ascii?Q?sU+knAK1kjLRJwuQD+sMzTOPJFMiaLJR41+BDM3ykAdJP9NXxsTKt4RgVhOz?=
 =?us-ascii?Q?H8YYzmBHB6fJd8HQ+jEVtHbkfDR3UYFqO5YaHdDOujm1wyMMZg0snckeeo5G?=
 =?us-ascii?Q?PI+qrHc/3jHHFUxn14sdr/JUZfvZDjZ04miRv4eUbmQD37sV21GlFl7ogV58?=
 =?us-ascii?Q?ckewB8FJP4Mq44TeFK4MZyH75C6yl4xcpUnFXGX9QxWWyVmR8G3EmaOduDyN?=
 =?us-ascii?Q?6f/Crp3s5nFpVlybfkIV/WmQfGTXNqeTTZ95MdlIni9oqMEjSdWpiczcZMaU?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 925b1ad6-8c1b-4d91-2629-08db916fdcf5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 02:43:03.9086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqCxpijnb5XTlMntuq4CVjuwoCr21oQmYzNbeEXgEwK9k1obcyQ/5X1L28rGi6zUZZdz/TicoLn9ywxMZrQiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 01:28:52AM -0400, Luben Tuikov wrote:
> On 2023-04-03 20:22, Matthew Brost wrote:
> > Add generic schedule message interface which sends messages to backend
> > from the drm_gpu_scheduler main submission thread. The idea is some of
> > these messages modify some state in drm_sched_entity which is also
> > modified during submission. By scheduling these messages and submission
> > in the same thread their is not race changing states in
> > drm_sched_entity.
> 
> "... there is no race when changing ..." or better yet,
> "... we eliminate races due to drm_sched_entity state changes."
> 
> > 
> > This interface will be used in XE, new Intel GPU driver, to cleanup,
> 
> "Xe"?
> 

Will fix both.

Matt

> Regards,
> Luben
> 
> > suspend, resume, and change scheduling properties of a drm_sched_entity.
> > 
> > The interface is designed to be generic and extendable with only the
> > backend understanding the messages.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 58 +++++++++++++++++++++++++-
> >  include/drm/gpu_scheduler.h            | 29 ++++++++++++-
> >  2 files changed, 84 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 2795021efe7b..9dc3378e9c5e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1055,6 +1055,54 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >  }
> >  EXPORT_SYMBOL(drm_sched_pick_best);
> >  
> > +/**
> > + * drm_sched_add_msg - add scheduler message
> > + *
> > + * @sched: scheduler instance
> > + * @msg: message to be added
> > + *
> > + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> > + * Messages processing will stop if schedule run wq is stopped and resume when
> > + * run wq is started.
> > + */
> > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > +		       struct drm_sched_msg *msg)
> > +{
> > +	spin_lock(&sched->job_list_lock);
> > +	list_add_tail(&msg->link, &sched->msgs);
> > +	spin_unlock(&sched->job_list_lock);
> > +
> > +	/*
> > +	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
> > +	 * paused, harmless if this races
> > +	 */
> > +	if (!sched->pause_run_wq)
> > +		queue_work(sched->run_wq, &sched->work_run);
> > +}
> > +EXPORT_SYMBOL(drm_sched_add_msg);
> > +
> > +/**
> > + * drm_sched_get_msg - get scheduler message
> > + *
> > + * @sched: scheduler instance
> > + *
> > + * Returns NULL or message
> > + */
> > +static struct drm_sched_msg *
> > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > +{
> > +	struct drm_sched_msg *msg;
> > +
> > +	spin_lock(&sched->job_list_lock);
> > +	msg = list_first_entry_or_null(&sched->msgs,
> > +				       struct drm_sched_msg, link);
> > +	if (msg)
> > +		list_del(&msg->link);
> > +	spin_unlock(&sched->job_list_lock);
> > +
> > +	return msg;
> > +}
> > +
> >  /**
> >   * drm_sched_main - main scheduler thread
> >   *
> > @@ -1068,6 +1116,7 @@ static void drm_sched_main(struct work_struct *w)
> >  
> >  	while (!READ_ONCE(sched->pause_run_wq)) {
> >  		struct drm_sched_entity *entity;
> > +		struct drm_sched_msg *msg;
> >  		struct drm_sched_fence *s_fence;
> >  		struct drm_sched_job *sched_job;
> >  		struct dma_fence *fence;
> > @@ -1075,12 +1124,16 @@ static void drm_sched_main(struct work_struct *w)
> >  
> >  		cleanup_job = drm_sched_get_cleanup_job(sched);
> >  		entity = drm_sched_select_entity(sched);
> > +		msg = drm_sched_get_msg(sched);
> >  
> >  		if (cleanup_job)
> >  			sched->ops->free_job(cleanup_job);
> >  
> > +		if (msg)
> > +			sched->ops->process_msg(msg);
> > +
> >  		if (!entity) {
> > -			if (!cleanup_job)
> > +			if (!cleanup_job && !msg)
> >  				break;
> >  			continue;
> >  		}
> > @@ -1089,7 +1142,7 @@ static void drm_sched_main(struct work_struct *w)
> >  
> >  		if (!sched_job) {
> >  			complete_all(&entity->entity_idle);
> > -			if (!cleanup_job)
> > +			if (!cleanup_job && !msg)
> >  				break;
> >  			continue;
> >  		}
> > @@ -1181,6 +1234,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  
> >  	init_waitqueue_head(&sched->job_scheduled);
> >  	INIT_LIST_HEAD(&sched->pending_list);
> > +	INIT_LIST_HEAD(&sched->msgs);
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 3e421f5a710c..18172ae63ab7 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -398,6 +398,23 @@ enum drm_gpu_sched_stat {
> >  	DRM_GPU_SCHED_STAT_ENODEV,
> >  };
> >  
> > +/**
> > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> > + * message
> > + *
> > + * Generic enough for backend defined messages, backend can expand if needed.
> > + */
> > +struct drm_sched_msg {
> > +	/** @link: list link into the gpu scheduler list of messages */
> > +	struct list_head		link;
> > +	/**
> > +	 * @private_data: opaque pointer to message private data (backend defined)
> > +	 */
> > +	void				*private_data;
> > +	/** @opcode: opcode of message (backend defined) */
> > +	unsigned int			opcode;
> > +};
> > +
> >  /**
> >   * struct drm_sched_backend_ops - Define the backend operations
> >   *	called by the scheduler
> > @@ -475,6 +492,12 @@ struct drm_sched_backend_ops {
> >           * and it's time to clean it up.
> >  	 */
> >  	void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +	/**
> > +	 * @process_msg: Process a message. Allowed to block, it is this
> > +	 * function's responsibility to free message if dynamically allocated.
> > +	 */
> > +	void (*process_msg)(struct drm_sched_msg *msg);
> >  };
> >  
> >  /**
> > @@ -486,6 +509,7 @@ struct drm_sched_backend_ops {
> >   * @timeout: the time after which a job is removed from the scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> >   * @sched_rq: priority wise array of run queues.
> > + * @msgs: list of messages to be processed in @work_run
> >   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> >   *                 waits on this wait queue until all the scheduled jobs are
> >   *                 finished.
> > @@ -493,7 +517,7 @@ struct drm_sched_backend_ops {
> >   * @job_id_count: used to assign unique id to the each job.
> >   * @run_wq: workqueue used to queue @work_run
> >   * @timeout_wq: workqueue used to queue @work_tdr
> > - * @work_run: schedules jobs and cleans up entities
> > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> >   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >   *            timeout interval is over.
> >   * @pending_list: the list of jobs which are currently in the job queue.
> > @@ -517,6 +541,7 @@ struct drm_gpu_scheduler {
> >  	long				timeout;
> >  	const char			*name;
> >  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > +	struct list_head		msgs;
> >  	wait_queue_head_t		job_scheduled;
> >  	atomic_t			hw_rq_count;
> >  	atomic64_t			job_id_count;
> > @@ -570,6 +595,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > +		       struct drm_sched_msg *msg);
> >  void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> >  void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> >  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> 
