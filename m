Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB9C6B0EA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 18:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D3B10E1C0;
	Tue, 18 Nov 2025 17:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cutEuN4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E207210E1C0;
 Tue, 18 Nov 2025 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763488367; x=1795024367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IpaLcqBmvdwgQMpkLrWmSNjUYhVKAMrpYslwu1oWcFc=;
 b=cutEuN4ywZ+jxyylazI4R26bHn/f00YOdveeZSEwX3VasUhOP/cLtrZ2
 Ff1Fg/QW2v6T1liQehJw+IAWHok4E4QssiYKGRfPuKKpSGObIekG3iPAc
 I6zJjPR3HD8sqlULibkWDS6yVoLwl05EorhpMGu7m8BS9vSTZg/0BV7si
 dmPkGyuDUgz+oyPaepHeGoxcKQ0sCV/zB1b2qD+2up1RMCvo90MWQo0l9
 FB1fU/Xw0gmF1CdmAVCmrTB95GDjKxMDWg5ytwLGyamQJKC7YTK2praA+
 pQFZJrZ+MYlyzLrw94UojIcz49gv800BrWj6ZzxQAuBI/uoHA5I0i2pr8 Q==;
X-CSE-ConnectionGUID: TRQeBwrzRmqwsU24arGauw==
X-CSE-MsgGUID: uBFHFqXJT/eRXHqdwtNqdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64516661"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64516661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:52:47 -0800
X-CSE-ConnectionGUID: pkzo4JJKTWmAfDUzOd8klw==
X-CSE-MsgGUID: nqEYVYrwS4iCq6thgaXOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190477610"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:52:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:52:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:52:45 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wfvqz9a8Rru3gcS9x+/n6f7jMfaoRppdMmiTTjOKZ17ouaNrbjRpwOXbno3u6CGSU55wV+sQdYhi3sFBfIdRpVoSu+RAxnPrJhBBsK9poTyj/DnbVZqkCISdYThLvWAw6hC62RahwBBsHC+CXaZd4YqfMiSxpJ8MZPVnotsoPu/Szrsq7mp39gez9MxVurMMMrGD/WB9eJRusk4KRxFAqHCPUwkIppiZGE9WUKWeKsPavgSrcICLx9fWL1iaVKvzB3+UI4ST8YZ5FQRp01MVtXVkj402URZ08T39Zaogqm9UYl6K3vEnWNjmseeM4aYuBBu8UMpetVfQVxEozQ/kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiNwX9latEoExq3yYJEzHU3SHROJtv9x5W/VGSY5B0w=;
 b=q3EvgWf/VNTHXdPP0rxfwy9v8WbU7Kh6Fz98iAi3xodfcXAVZfgC87wPaLnDRNavEnTWgl0aCBeZ0arZH4wD4TMMlsmbbB1+yyJSnUMFfUkQTqXKx2CX21U8WHdQIxkduZ1V3vXppC/QmtV24E+z5dqW70iSApwYy2YY52+d4z7OvMz6mxR5NgtuZQxxKES4rZsrDZFwF9CjGAvZbPENCIhElEEMrqH14fjrz8lCWDYN04kt/MfFsor0DdXlMyAQbXThD6GsdFouPY+EkAezjJmidUO5PbGvXB1iJcG0aPtne9wfayxBHG0ZNua2UwSkxAR0Poxl6esdAnHaQdkJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:52:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:52:43 +0000
Date: Tue, 18 Nov 2025 09:52:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 1/7] drm/sched: Add pending job list iterator
Message-ID: <aRyyaDdnDa5Ow3cI@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-2-matthew.brost@intel.com>
 <aRfWm7zRm3UodJKX@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRfWm7zRm3UodJKX@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 82654e17-e2a9-4e56-38d5-08de26cb461f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1/Pf5SCp2BrOFXd0trfQ+qMd19zkBG2o0LdfZGr6D6BcpgjeOlSgjaX+y1CV?=
 =?us-ascii?Q?+ZUwAIxJYecJ38wq6Uy8Yjw4gZZIiuFivz0gO96IhMA5N2gAFm71kTsupW1o?=
 =?us-ascii?Q?4iRp0+WOyzPYbnWhipRt+Xyp46w22xx3u0c28TL/MP7KnHlSLdycGSzMQB+b?=
 =?us-ascii?Q?u1ZA6wouXxhoN47VrsJztHhkzcs5eEeiwL8Bl29L9omcU6D8kJeMN3UZ1gbb?=
 =?us-ascii?Q?gf8lSzS6ZB/lwi7/TSzTgDryoIv/oX89Q27Yt6uyJApiYI85ex/f/B1XYqyl?=
 =?us-ascii?Q?NXT2znhZPPRlLbT4dPrrvz27wKtnqKz6KlqFnqEeaul/aWXh0ri0kQg3VOEE?=
 =?us-ascii?Q?PBaSFWdgo6YOsey1MofM7Spg62rqfSnPP4N+k8t2XUYfrFp0NN3mKSLwFR6m?=
 =?us-ascii?Q?rjdbHQNl4RlOfwSDIQBpWTO5p8J1g8mURzjXHV2MAF07e7tybRVZo0eKUfLK?=
 =?us-ascii?Q?3zNmw9arLj9jP0iVJRYdR5atupMjyuX50qIk6xL031CPmo9YpIsfC0s2+9lF?=
 =?us-ascii?Q?2H5kj4/iuHhK6kcy/qj0j/X4mCyayZiG45wFZv+JynBxG6zlcV8YRaiHzL/j?=
 =?us-ascii?Q?a+hmPHXUVcX2JSfT8wBMRA/6NQMbnzegP0eGO0GTPq9IMmqc4z0fY9ZjSmIx?=
 =?us-ascii?Q?WDyl6K7hz81Wh3sFilSCJRAJ2fbtcB3djL5xZ/tcdmLgGhmKd2MBbn7RQ12/?=
 =?us-ascii?Q?pESMBesfIYVURPfZQHMVNLF4kUpwC+tUAshO0hSOS4g6aziJvC1sXfF/6e+m?=
 =?us-ascii?Q?putmtvi4RbuLl0l0chQGeYhjGHO0+ErJmwZsmDV1hV1XFtKEC6lv62YetPRx?=
 =?us-ascii?Q?gT+BkCzq9HMVjf9p3yDKS7cB1w0EPvbZRlhOz7u6q1hpJhGuQNlg+IxjHGVL?=
 =?us-ascii?Q?/VwVk41kmfAAVuNE04RVygX5q48OlCSmnJpTwGBxfr1h2LPzLztg75sSjsI8?=
 =?us-ascii?Q?c/ZUZoNK+komwzvb+419fKMJAWQ82QIJE1FQD2PJCN9Mw0wSbyuQRkDJItZO?=
 =?us-ascii?Q?i/+75WB3jBnWNvRDZilXlhDs4jbdCvUWBzMp2RFC23jPWf95NivYVmT1EJdO?=
 =?us-ascii?Q?b6P3lObfXSuiSU7rxyCBSeYvG4IO1YvaGq7Cm7jz/8rSPP28GbzUABa/JFIn?=
 =?us-ascii?Q?HpeNPq+2vk5aP4rrKBuAm+DlpuNSJjXev+3zBigQmRNK7bbgtAk9nraovtMK?=
 =?us-ascii?Q?U5BNS5A+4i2D+sDYfuy2+ZnjFkUssC8biB5IDHPtlkca7HKwpn/0uJY9wAib?=
 =?us-ascii?Q?1d48anpZaqqQrBeoMs8pKwN/91CmVK5JGuNvbDsGVGZC6HhBAIgMjaHdAzrV?=
 =?us-ascii?Q?s0Fr2ABn5da05XsQQcO7tpAzjtKKbOtBPqCCdGMNkuJRgJTIpTYqWt1X011s?=
 =?us-ascii?Q?QjemauK0gjD5CSeDpI3cZuS7+9OWZe03jRxNUXVAyQtvm2Wl3lfCPL4IJo5l?=
 =?us-ascii?Q?+WwAhjS2rXlp8/Pf+OsV+dVQyV0d0kpW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fwpINeaV281eBedl2Ilfd8LWXZJvsbbSmtLlNDRtz49z36sVe8PkjV2cMpuc?=
 =?us-ascii?Q?NX/wRXfFkxk7alvrf7mS3FigBFmLxZzIgxWSocsn8n3/tEzG7Dt8ebPYl3Aj?=
 =?us-ascii?Q?xg77mPV1bu5+mSlWq+TViDzVIa3S+azibmUjwV4NWrBZ0zL79pktnpQkyG9u?=
 =?us-ascii?Q?EDkOykc+aa0S7nxiKyM+0qNogAm98KKbvnAfjdclAo3UzYLr3K3VXzh8IF1c?=
 =?us-ascii?Q?yt4xBU9O93Y468zq/V0TxR/X7iLNFBgHM/YLFGgP5CCNu4JNJhTo2ERJtNqY?=
 =?us-ascii?Q?96QWzjxQ0fG0Bhi8mpzjX+o/X4QTa4xssGzgg+dzZBs9elt2s0RFosUwtrbP?=
 =?us-ascii?Q?P5JXYqv39JIX4a9yRdeaQ8wrYIB6MhSi2EFi3d+zKRSMf7Uy2nphNM/zaqj4?=
 =?us-ascii?Q?kTWtwZevXs79S33IPjwJGftvLrBjDh95JNJuFztXwMZhLdQzbVevzQGW0rGc?=
 =?us-ascii?Q?5IfirGKFSUIpVuASb9LdsbL44DfCzdanBREMefqRcfki5Tc8FH+60yvpPHGo?=
 =?us-ascii?Q?v1EvxQDlZ8jPsnWeAF0Kb4OHv6jvLOY8Xfu+RcrqwNCLn5qTrQdgsi8uePtb?=
 =?us-ascii?Q?qoLpCMIK1QXfBVpzn3e+kVr6dpjDNY61PHzkV62uBQthTIR9APo+3Ij4oyX5?=
 =?us-ascii?Q?SU3ibfgAqNcGkJD0qTLoqdCNHKhViOwH9RzELV4gA59Rnf2Tmyc/MPVTQqd0?=
 =?us-ascii?Q?ET6FE9KnVFnKqpCBX8wctokaglg2WbtEjmTVn38I4UshUyiYg8l9MU4WhCXO?=
 =?us-ascii?Q?X93d7r98v8DEg44SZzo1HLrhXJa0txY2HNuE6b3R2FtwgK/oZkJZwAYgsaV5?=
 =?us-ascii?Q?z8RLFyPeMiEBAL5RynNc8Kg0mBvubp7d3M3GXvURdT9et1LYLwoorZeJUyFB?=
 =?us-ascii?Q?1CJz1jW2e6tvGJ57htKkwksV/vSAXSB3xLqmh1Wp8v+7iaZRd28h4j69KP94?=
 =?us-ascii?Q?f869o4Jz3c1Bax4l3oJbW5Xl/VQnOAWRSsJIb0hnuERYfhgIE3M1P+zJovVG?=
 =?us-ascii?Q?lUHQNMCuHS84E0yY1m3u02IVSN61K9IAR4nvDRABlTmORRKnb3mlO2AY25dO?=
 =?us-ascii?Q?BkGok+0bo9IgQyDHPkaiXwsCrwuCpsYrgJYcWBnxKCwyq9I9LvDNnHGmY9W1?=
 =?us-ascii?Q?J1xwjrfqPcdUnuT+LWELOjNDMg98XOGvEZvLriF8rqtxa+A0ujLYQgc/4o9B?=
 =?us-ascii?Q?T0OT7YhdXrRAal9nTPgrog5wImjcwIK8o/Vb/VgfbNLRUedOFlUOo7kUvoAN?=
 =?us-ascii?Q?Vuy/wRTOHrwrWxOfsf5BNe3Myp1DWw0hWl+B+lexMz7gdlqBtqoONzWgsGja?=
 =?us-ascii?Q?iNUSnrXyQaKnFLrVar/AJMWwryecI+BzBDqajOYerplaYZ1WDW9FUx6GdlqW?=
 =?us-ascii?Q?Ex7w8rrM7EWpNFmpYkuA/87pHjpG9rpeUtlpDFzaxpuNjrq+IBGJhXZnvIuB?=
 =?us-ascii?Q?td8JW/QGh9O/Na7MHR9HBfF0yHbv3aFeqzb2Mft6EVpOWL3x1B5uW1Wm5IcK?=
 =?us-ascii?Q?LkpvYO6/LKuejBYYZDFJ+fHtg0dXRvqUQyQXlO03s4gxzr2+wNZw+5BuJP99?=
 =?us-ascii?Q?q2YTngXYoeppV/bFEAnY3VNQLMpXQdEEhIPzEz+SpOM6zb3KW3HfBtQcdj+7?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82654e17-e2a9-4e56-38d5-08de26cb461f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:52:43.1055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He7WcQDWocibyuU/AeqBjuFKy+2hTUyBXspHkD6/fJK1pyeiCLIF4B8hrhPjrL9R+BERn/8xy5/RY+oC87ICnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 14, 2025 at 05:25:47PM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:20PM -0700, Matthew Brost wrote:
> > Stop open coding pending job list in drivers. Add pending job list
> > iterator which safely walks DRM scheduler list asserting DRM scheduler
> > is stopped.
> > 
> > v2:
> > - Fix checkpatch (CI)
> > v3:
> > - Drop locked version (Christian)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > include/drm/gpu_scheduler.h | 52 +++++++++++++++++++++++++++++++++++++
> > 1 file changed, 52 insertions(+)
> > 
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index fb88301b3c45..7f31eba3bd61 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -698,4 +698,56 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > 				   struct drm_gpu_scheduler **sched_list,
> > 				   unsigned int num_sched_list);
> > 
> > +/* Inlines */
> > +
> > +/**
> > + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
> > + * @sched: DRM scheduler associated with pending job iterator
> > + */
> > +struct drm_sched_pending_job_iter {
> > +	struct drm_gpu_scheduler *sched;
> > +};
> > +
> > +/* Drivers should never call this directly */
> > +static inline struct drm_sched_pending_job_iter
> > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> > +{
> > +	struct drm_sched_pending_job_iter iter = {
> > +		.sched = sched,
> > +	};
> > +
> > +	WARN_ON(!READ_ONCE(sched->pause_submit));
> > +	return iter;
> > +}
> > +
> > +/* Drivers should never call this directly */
> > +static inline void
> > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> > +{
> > +	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> > +}
> 
> May be instead of these inline functions, we can add the code in a '({' block
> in the below DEFINE_CLASS itself to avoid drivers from calling these inline
> funcions? Though I agree these inline functions makes it cleaner to read.
> 

I'm not sure we can just call code inline from DEFINE_CLASS, rather only
functions.

> > +
> > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
> > +	     __drm_sched_pending_job_iter_end(_T),
> > +	     __drm_sched_pending_job_iter_begin(__sched),
> > +	     struct drm_gpu_scheduler *__sched);
> > +static inline void *
> > +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
> > +{ return _T; }
> > +#define class_drm_sched_pending_job_iter_is_conditional false
> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity, and
> > + * enforcing scheduler is fully stopped
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
> > +	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
> > +		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
> > +			for_each_if(!(__entity) || (__job)->entity == (__entity))
> > +
> 
> I am comparing it with DEFINE_CLASS usage in ttm driver here.
> It looks like the body of this macro (where we call list_for_each_entry()),
> doesn't use the drm_sched_pending_job_iter at all. So, looks like the only
> reason we are using a DEFINE_CLASS with scoped_guard here is for those
> WARN_ON() messages at the beginning and end of loop iteration, which is not
> fully fool proof. Right?

The drm_sched_pending_job_iter is for futuring proofing (e.g., if we
need more information than drm_gpu_scheduler, we have iterator
structure).

The define class is purpose is to ensure at the start of iterator and
end of the iterator the scheduler is paused which is only time we (DRM
scheduler maintainers) have agreed it is safe for driver to look at the
pending list. FWIW, this caught some bugs in Xe VF restore
implementation.

> I wonder if we really need DEFINE_CLASS here for that, though I am not
> against using it.
> 

So yes, I think a DEFINE_CLASS is apporiate here to implement the
iterator.

Matt

> Niranjana
> 
> > #endif
> > -- 
> > 2.34.1
> > 
