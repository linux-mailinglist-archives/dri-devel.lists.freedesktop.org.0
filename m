Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBABC7BBDC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A9610E905;
	Fri, 21 Nov 2025 21:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFeSIegp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5AB10E905;
 Fri, 21 Nov 2025 21:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763760365; x=1795296365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GJWAaPHbNul+jnel2Ys3deM6cxyJ7PPlbB8NKG/xotI=;
 b=aFeSIegpaLoJLWNjnlCxHthenK6v9sTT2jF3vqRSdsyh5ih67q7DZL2A
 sUsLOhprdnyv/w/tHBjDeNvTvdM73NEfSNR2MR+W04JhIvkEO0h/l9dz0
 eptYFKgK6z9U43s/HROa/C9h1VtPS571unhG/WxBAa0fxlu9PS+OMVUTn
 /rgfn72XO7sY+7CAzETmNz9mVpC61LVBE+bNj6/CUfUos5QYHdQJKy63p
 3TL6OtJPgbCol+Za3Cz6qnkxQajC+y6fOrx7ghfTvNwpPbroVUqvnsMvn
 NYZDrCy+bYuyPUir0iIlnb+plSx/N9Bh+N5FUyYDq5qgzGntwlz1nXYZJ w==;
X-CSE-ConnectionGUID: PuqwUj3US3SkNauk+M9pUQ==
X-CSE-MsgGUID: gzm0EaljThyrK+UfbcwKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76189236"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="76189236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:26:04 -0800
X-CSE-ConnectionGUID: nwGuLUVYRLqvzBHiUz1TUg==
X-CSE-MsgGUID: nrc23DduRwO8QFa8GrJPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191826546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:26:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:26:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 13:26:03 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:26:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o42+69CBv2wpmOzymy1g4NzIZbhBhowbUFxm2c9RUa6Kaq/1u7gjMp2+OinIYrfYgT1kRIrrm9JtclwNJsEOsN9GRGywqbvNMrtPm+pTyn/MJ3JF2DJp15+q+DGOuNy8w0y0Kjqcsr308yPDSrvrMX/bhynkeoa3XJRq/R46biNBEHj4msKWE4T25z64gR11tKafVi6++0cuNWOnte/kSlVFBB4Chr5/0qQ9f4z5TF52m9Ba5Zti4VTtbWthpjhJs/hAXapVO32ycsWSoZuNDMLT/kW5oMEpO17mWwegQkmeX7HQ+VDjGPxO/emKE+87x+Dzck89lO7jgitUzy4bBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/ZTCcp+HOGl3C6DPheia6Qg2L4rBj/E01B2l8RadyI=;
 b=NGIQDdBgQ5MSlctD4YfHmS9t1RN+2BA5510OpOOySi9H8grqdp7k6UiiIvkjJ49ICGX7+IpAFcmrK+7DrIBR/7KHXrk0ZDQjFjd/muS5qDZxjMsolf8CMnCkLV1oHNCCksGFlK4pIJHEmUjP6AfuTaKKHPRatXGtEwFGAIn+7DoghYHUXSzd01m/uAo1gNAcZnvLcYrB0m+opAT98hKaSsxfO6KWuESSR7pisIW/LPWvwKpNId9h/2p4Gn9bjp5wN7MB9UZVyAWBAj3HnQ634tU3w9DOAfhcJW871TLwTQ7zTKqRKu727h7Ve1yBg6JSAX1AnXntBxOUj7uew70UrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 21:26:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 21:26:01 +0000
Date: Fri, 21 Nov 2025 13:25:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Do not deregister queues in TDR
Message-ID: <aSDY5iOgqa23vX6t@lstrano-desk.jf.intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-7-matthew.brost@intel.com>
 <aR9xCKn3MCEOt1Hl@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aR9xCKn3MCEOt1Hl@nvishwa1-desk>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 740049ed-3490-4ff2-c350-08de29449174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RQNRippcQVTp9pW8iyYfRQ50toyCeOa89/sGmhMUsst4chk703psq+JETwc1?=
 =?us-ascii?Q?wc5uY430rQJGu1KbDkATBv4ZPUteo5gH7/hMOtZlpKPkZN93j88VGdj4XVm3?=
 =?us-ascii?Q?bpL4Lo4VPNfkjS9FLF6YUCJN2L3bdFYWX9JGEDkMn8HB2bK8G3bEVFJgnHyK?=
 =?us-ascii?Q?umA7fM8ZvQzQRxAKsxaqvqgRipKYfKIud5WCqcz0bXRvgioZUGP+34pSSJGK?=
 =?us-ascii?Q?i1javPjHUU6MLj2w01Ls14olGVc/n9wzoRGKTgpyAKyAeeJGHF32JpQHD7A+?=
 =?us-ascii?Q?JwSpJ0KmOQHM5w/6g0WCFaz6NvjS1Yw2ejOMuNKi6WZngIxi8hGVyWHIdTEh?=
 =?us-ascii?Q?49Xj50amgQppHOzocX2mnPxXRyf/41HiBNUuQ+4KNQwIB9gvQCGsbj0Gz3/A?=
 =?us-ascii?Q?yj44KQZ5vEd3DNs6RySJw0SlsZ78b26ZWM6Pe+yj4bajqc3jpRs5oc/WY4j9?=
 =?us-ascii?Q?7odCcvwfeJBzfPT4SLp7/9C8s0QF2KRYD6Ovz7OgRrDdEu/cOVckNn+KlEb/?=
 =?us-ascii?Q?rGQUjrd1oeogpZlJt0lX27D0tzqc5Gp77P22l/fk+5WFYrcjsDMvmdg/qcQn?=
 =?us-ascii?Q?D/J6yOlNjMoQQYJ3B5WNclDqqEH1SioXxCPnVjAwktsJ2TUIhhsWkNfxUkDX?=
 =?us-ascii?Q?sJ6KR3KF9rS6203WnL80nAavOyhfMz4VvkBirPLCxCxUrTCmTX8LaxGvBPrk?=
 =?us-ascii?Q?T9f1J9Ykr6FnlMs7fh5pSVrVY7a4WqC7+cjKc7qBIEYb2xOrYApelk07TiYq?=
 =?us-ascii?Q?cVzvOicZw6ptgdk5UyeQcNzhLvD8286SdekzjywTRUOvZyYzMd0eIaVB716L?=
 =?us-ascii?Q?UOg1RqGGYOfxH+loMcMFNurNtS54eJmHCpL9DTDG8Deb4Z6MU+fKDSoY3ZKg?=
 =?us-ascii?Q?AZ7azOIkWzKND5uxANfRpAf4DZA463r+J7w4Lt/lM+V4LBlMrF8JuAEBqF/K?=
 =?us-ascii?Q?IjAX0ZDemhomKaWCYZsSO4JquNJvPClWw6ns8zup9Asd3V+AxD5EfK0ie9Gc?=
 =?us-ascii?Q?J0uClXaUQrrAZwl02pFli+/CUEjZ7Y9/AYHZA70dhzReGhafCfMaj058HZ9N?=
 =?us-ascii?Q?iS9Ps5ZA/iiPJ69iRlSt6OmIaFk4Q3zqzdX5WRCbQ+OVTBdAqz5XqAqcc33v?=
 =?us-ascii?Q?wmtjQ/72hV96Xa43A8YilZUrRtZPppuq7NFsizKvLENoYJQf2UFPokU+0UTY?=
 =?us-ascii?Q?0lHBJdO0ia0DnY4xaXQu6DWBC3ySrGBz5ZAyRumMrZQZXncqQ8DYgSa0/UWX?=
 =?us-ascii?Q?nMXMay/Zj68mpoXMQo24kP5SXzrBraEOQyzIW2/vyXbVvjZasRMDinXQlBgA?=
 =?us-ascii?Q?VJl/F9XmbqjZHxtDtLpBKEaXFiKtCqUznQpLuNTJOQADZjwZNl5BlxADldp9?=
 =?us-ascii?Q?KrAkvLxkFHAEWXpVfOPSbTBjmiPpDWbWHcOQSTNZGKAaXK1RxAFlUqxlaHLP?=
 =?us-ascii?Q?e0AMeCPVWC1pq6aGBVHbLxzRw9gMj1c7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zr84hakrd62RQIi6PkpqAtQpZFCdV60Yr+YN+9RXuIZeoil+irCxW/ePctMN?=
 =?us-ascii?Q?JLexYUHCsSWQxyMEiDwYhTaUsVGrymf93dDYj4z3qZjLIhdRBO1xRKMdd+M9?=
 =?us-ascii?Q?IJwJdX3P/FI/IJGLYne7QVvmDD8TWkb/OwHWJhq9fvxH4kNDasf32Wq0tebd?=
 =?us-ascii?Q?uMLNrz3tWW/nw1l1KhUfriZVdnkDXT8Z+EakoKW5Po85Sfc6uPlOPaqa1N5X?=
 =?us-ascii?Q?ZsB7ZcCbvAP+nt7a0otbKZD/DDTnBJEdco7T/JRVX1pK6dGpb3jW9QcHTVnY?=
 =?us-ascii?Q?Tw347R11uMDufnYuSllEfh7/UB9QbRW5qc/jNasXKj5RJHr1j1MO91VEezcU?=
 =?us-ascii?Q?FI6u7RMcQy3tCXeVWl+le3eVVaJz5P9NY2juJqFLcgx7KhTkJt7lReR5H0fA?=
 =?us-ascii?Q?1iI4mZp26C6/rQTytNHO+kuLbaCjsdc3V5LdCeZ8E4qT753pDaRNNQARLDk6?=
 =?us-ascii?Q?EoKf3Idl2VodS5pS7JjMftts/c9jj9GaxYwAwkRTnuV53WQdCmf7YNGGVI9t?=
 =?us-ascii?Q?53gUZazz/1sjFxp4mtXAR++1phXm/ml+9ZMH+U7qS7/NGI3q4Ym1NO1dkQTK?=
 =?us-ascii?Q?KLbPKN/hBERzt7ys+qXrzt79Dr/BSnS7LBTOCxvlAsT11YcaRgDefmQfbZLl?=
 =?us-ascii?Q?EAqWaCqiatBB28UvJEMWshCHtVLeSHIU17N8744jXe4MAKSqUIasiLe5cR7K?=
 =?us-ascii?Q?iknw0jRMyk7lAgqhcZORGkcQGzLamc6GKOse5LhET66p3HcEH3pX+M4Wx+cQ?=
 =?us-ascii?Q?LgbZ1j2E00dg68QQugLKIefysLHgAoTwPNztFk1eaIoLPg68xJr2LfolWhaf?=
 =?us-ascii?Q?O/teAu2Cik9LT0XxYxRSoRj156639iTYf2tmAF23ZfOA8ZMACKllk0VPscTQ?=
 =?us-ascii?Q?riR+HJxtHwOmA4Er7mCWth/MD0j2HGuqdshpg78CCzv6WdyuVpdfyPWAGuVd?=
 =?us-ascii?Q?No5UUw1yyMweSezJOxsV9o/i/js96VG+AzQQB9MM8QyvY+l3Z1hu5XG0bSUa?=
 =?us-ascii?Q?tGk2Pk1KeuYy/WNjX3weE9dGhd1pa3894D2QjJPvOMHPXKKF8/tf9QKAu7TW?=
 =?us-ascii?Q?M0VGjKjh5bTd43u6XNUl8OgW4FP9IZGB92n//Zibgrq704nfGrOL09Cc10N+?=
 =?us-ascii?Q?ZAIvVnS8rs/ib7+AEpNJLGA1uNW37EKIBhE6r/8ZND9+PCuXN7XsDh3J5iQO?=
 =?us-ascii?Q?0UD8vHHeTvqCQVyCmieD31d2R+ILEUM4VBGrHwqoALiNI6YUC70TFMOsGWdQ?=
 =?us-ascii?Q?6N6rpmuIps2ga3ZkOYRVqtyiQa+iqUya4/uVr+rZ+ESBxaBiOT7bERewpvAH?=
 =?us-ascii?Q?UpexE+cDCPtcsmaiGq5rBBd/yZQjXmMe8gdySZF9a+9ShnrEV7JBMWqVjHHP?=
 =?us-ascii?Q?q3h+TinZyTLIzXOtipOSUuZnE4dceEjknUzS/xZdEHNgx801/S/V7Gr6lgmm?=
 =?us-ascii?Q?4XQZ7GpVeO4BCcop9RBRxAmr+E1TaYAWI5FpACB6RPbWybyUEG9W5Mm37V2s?=
 =?us-ascii?Q?MK6/e9q07t5bYR6KBSTmvsb7jjW5ULXJEBIXPNe6SB5y/Fm5CRRtAC5XxzPo?=
 =?us-ascii?Q?oejsslFSfODjQuNhP7Kuhp4NHsXcvIpDtR2781ts1wciH13Pcyx89g0TytWr?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 740049ed-3490-4ff2-c350-08de29449174
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 21:26:00.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjzXWcV4uMkHivf1RnzzPZjawrRZ6VQUnf531r7IU+l4S9iBEWvmr5Tvf9UV7d8/TXE2PDV2VRjN8WP0wb/JwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

On Thu, Nov 20, 2025 at 11:50:32AM -0800, Niranjana Vishwanathapura wrote:
> On Wed, Nov 19, 2025 at 02:41:04PM -0800, Matthew Brost wrote:
> > Deregistering queues in the TDR introduces unnecessary complexity,
> > requiring reference-counting techniques to function correctly,
> > particularly to prevent use-after-free (UAF) issues while a
> > deregistration initiated from the TDR is in progress.
> > 
> > All that's needed in the TDR is to kick the queue off the hardware,
> > which is achieved by disabling scheduling. Queue deregistration should
> > be handled in a single, well-defined point in the cleanup path, tied to
> > the queue's reference count.
> > 
> > v4:
> > - Explain why extra ref were needed prior to this patch (Niranjana)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++-------------------------
> > 1 file changed, 9 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 648c9ea06749..5de300b66767 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > -#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> > 
> > static bool exec_queue_registered(struct xe_exec_queue *q)
> > {
> > @@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > -}
> > -
> > -static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > -}
> > -
> > -static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > -}
> > -
> > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> > {
> > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > @@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > }
> > 
> > -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > -{
> > -	u32 action[] = {
> > -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > -		q->guc->id,
> > -	};
> > -
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > -
> > -	set_exec_queue_destroyed(q);
> > -	trace_xe_exec_queue_deregister(q);
> > -
> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > -}
> > -
> > static enum drm_gpu_sched_stat
> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > {
> > @@ -1225,6 +1190,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	bool wedged = false, skip_timeout_check;
> > 
> > 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> 
> Is it always guaranteed? What if we get here because TDR is triggered
> by some error notification from the GuC and befor we get here, the
> exec_queue gets destroyed in the CLEANUP message handler? I am not
> sure we can we be sure here that it will be race proof.
> 

Jobs hold a reference to the queue. We have a job here, and the CLEANUP
message (which sets destroyed) is tied to the reference count. So if
this pops, we have a problem. I use asserts in GuC submission to ensure
the state machine (which is fairly complicated) works as designed-this
would be one of those cases.

Matt 

> Niranjana
> 
> > 
> > 	/*
> > 	 * TDR has fired before free job worker. Common if exec queue
> > @@ -1241,8 +1207,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 
> > 	/* Must check all state after stopping scheduler */
> > 	skip_timeout_check = exec_queue_reset(q) ||
> > -		exec_queue_killed_or_banned_or_wedged(q) ||
> > -		exec_queue_destroyed(q);
> > +		exec_queue_killed_or_banned_or_wedged(q);
> > 
> > 	/*
> > 	 * If devcoredump not captured and GuC capture for the job is not ready
> > @@ -1271,13 +1236,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > 
> > 	/* Engine state now stable, disable scheduling to check timestamp */
> > -	if (!wedged && exec_queue_registered(q)) {
> > +	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> > 		int ret;
> > 
> > 		if (exec_queue_reset(q))
> > 			err = -EIO;
> > 
> > -		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
> > +		if (xe_uc_fw_is_running(&guc->fw)) {
> > 			/*
> > 			 * Wait for any pending G2H to flush out before
> > 			 * modifying state
> > @@ -1327,8 +1292,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			xe_devcoredump(q, job,
> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > -			set_exec_queue_extra_ref(q);
> > -			xe_exec_queue_get(q);	/* GT reset owns this */
> > 			set_exec_queue_banned(q);
> > 			xe_gt_reset_async(q->gt);
> > 			xe_sched_tdr_queue_imm(sched);
> > @@ -1381,13 +1344,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		}
> > 	}
> > 
> > -	/* Finish cleaning up exec queue via deregister */
> > 	set_exec_queue_banned(q);
> > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > -		set_exec_queue_extra_ref(q);
> > -		xe_exec_queue_get(q);
> > -		__deregister_exec_queue(guc, q);
> > -	}
> > 
> > 	/* Mark all outstanding jobs as bad, thus completing them */
> > 	xe_sched_job_set_error(job, err);
> > @@ -1933,7 +1890,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	/* Clean up lost G2H + reset engine state */
> > 	if (exec_queue_registered(q)) {
> > -		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > +		if (xe_exec_queue_is_lr(q))
> > 			xe_exec_queue_put(q);
> > 		else if (exec_queue_destroyed(q))
> > 			__guc_exec_queue_destroy(guc, q);
> > @@ -2067,11 +2024,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 
> > 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> > 		clear_exec_queue_destroyed(q);
> > -		if (exec_queue_extra_ref(q))
> > -			xe_exec_queue_put(q);
> > -		else
> > -			q->guc->needs_cleanup = true;
> > -		clear_exec_queue_extra_ref(q);
> > +		q->guc->needs_cleanup = true;
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> > 			  q->guc->id);
> > 	}
> > @@ -2488,7 +2441,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	clear_exec_queue_registered(q);
> > 
> > -	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > +	if (xe_exec_queue_is_lr(q))
> > 		xe_exec_queue_put(q);
> > 	else
> > 		__guc_exec_queue_destroy(guc, q);
> > -- 
> > 2.34.1
> > 
