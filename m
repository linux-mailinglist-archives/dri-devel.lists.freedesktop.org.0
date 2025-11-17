Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E21C660A3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E905910E1A7;
	Mon, 17 Nov 2025 19:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUMa50se";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8F010E1A7;
 Mon, 17 Nov 2025 19:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763409471; x=1794945471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fSKxT7N3yCVL7hCr590A8Uxlnv2rPP/C2B4Ab+kC9Oc=;
 b=kUMa50segmlVC/r465w4y8bfk2QJI5REZRCiAdigcfQ0k7jL9/OvLxaT
 W9ArGrIHz+x0XNjnx8CO9iTBZScyG5wcAWDwa5SIY3MVoj7fR5qSG1eBA
 4/oiwe8DdGT4ShPyZkP/DKP3aAn9vx6OyFOcO4gpWg4dCk72CChPtGPKN
 GuV8YioY8HNJj15W0hj0RFMtZlQfPgFHMoZun6LuZzceOBunxrbLwdok+
 K9P3lN2bQ5e7CY5ygWFaYD5c2oxzb74Zj+OwzxKyT/lX2sETFpFkDkTnc
 on1cXmca+iSCJgDNreg5aup3e/Zmeg4cDDuggg8H+aAnY5w70LWMc3R00 g==;
X-CSE-ConnectionGUID: Jk1cn6vQS2WiVmlkPWH1sw==
X-CSE-MsgGUID: 3Ma4c1qcQSCu15HsgR7EBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69270679"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="69270679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:57:50 -0800
X-CSE-ConnectionGUID: 96av16g5SMWtY5z6Cl7KIw==
X-CSE-MsgGUID: uj5uMvXhSUOaS01HSQuelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="213934005"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:57:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:57:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 11:57:49 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:57:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZmp3YT/hXwct+6Yy86FkEsoVtGWHgwlDbqi5Bhu/VM7bejQcmA1sySSaVdaifXqO0lBMMg7F7hrw6aMTPEuNr3jP7EpowdMVhUdX3rSzaecPRKIgTCwTY56bz1iZ+CvB8EcoPh2xsHpC1UK2cDzkH8eAT3qv7OZcfPyaBl84LVfJN2+JBml1/EBm6TX356cWfoxpws8QBDcmDBnVkY4B2C/aYaE5ebHQ94If6WvUelftwCtRVov/Gr5tjY6NJV5SpKKRwMFvfWuvEvm7sChwDxmsNZrjAYLzQqnxBV6FMvp2V1ls45DXeuZnOCdeyArnLeDOsCogbrplNcxv6oN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlQihu64XEWrDQBfh438lq3u1hictCTMjXcBRK63GJ4=;
 b=wrLGtK7HV/6EP9c1yxEHn+z0zpDccOFzQUfKYzXDc1Vj8X2v6cq7xvNFuFm116C3wB4ij6u2En/Aoca182P5wd7ZlzXOkrX/9g1x68E69xv/R1roKUNyw5F/UhmvxJZTdnzKzZgt8/reuilmNq/J/bF4G4j3aoyIxtq904pZNCrDuuOc+hV+f/Kz4IGCrj0DJRi20LKjYuo5vejLbfqxtLTl3yAO9w7j8Ib0etb0fzxvDd87ZO5NJK5Lunv5YHxoTvHrkTSn7JtmPdPtYFw/nV/PdvxeNuNRmlUgw90i4cfj1J83ptlBXLEi7mrG1fSMx+8fUjzl008KKoM8/VRcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA3PR11MB9302.namprd11.prod.outlook.com (2603:10b6:208:579::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 19:57:47 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 19:57:47 +0000
Date: Mon, 17 Nov 2025 11:57:44 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 2/7] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
Message-ID: <aRt-OPJh01t8AhVG@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-3-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA3PR11MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 6853dbf8-86b8-421a-f5b8-08de26139495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hu0TXXOg8uDHOU0uXRu9/4IVV5tvNJtozF/IVKS3Kco7LCkKOPoQKlIyX0jv?=
 =?us-ascii?Q?NI8veEndwDKKSipz0cR5mJZcbE15TXbl0Aty4JyxwvwbP0jNYKvbe9vvJQih?=
 =?us-ascii?Q?f3LeNVchnoBkWwiC1rO7CVlBVQ8iYXjV/Zdae15TZw36iSS/TN2NLTJCF804?=
 =?us-ascii?Q?MSO8l0MfPV+CuI4vf9e8sCzwrM0LVEEFJ5Snu4bcow0m9EQNyp+DooBS9Qey?=
 =?us-ascii?Q?arZtCH15R4YrgTs0snKW6Ity1omV6jsntfh1hkUkDPwI/J91Ky9wcjiBirn+?=
 =?us-ascii?Q?j32MIdsrIkQUX18ejLgqQRwRrE2bE7DzNgO5400AJqceSIkT5NMuf1y6N7Qi?=
 =?us-ascii?Q?ZRCOt+M/CTAHNkESXFNybF7IAEShnesoaNdIU+aUUFWkPdc1oK5qiJsgO3lV?=
 =?us-ascii?Q?BE/6tFJCxB2NxJbjhLKMm30OScWbe7MXgHvV9EEMfEiWkO/WS9nQZTxz3QfK?=
 =?us-ascii?Q?lCnIUIcOKV30DaFGBOx174POO5hElkeJ9uwavmC++2fjnp6CHhCVNt8H5Vv5?=
 =?us-ascii?Q?srnshHdUgiMNTUAQraM2nW3T9JWHu7UzphZdmDXtFJLK5mz7vWdZCM3NFFno?=
 =?us-ascii?Q?tDDY35WiXCluUeUT/rFTkMKqpp46v7R1VRNPfoHwGOT2lFJ/DqCBAiyGPQJP?=
 =?us-ascii?Q?H9YCYsjiA8rM02y3WG4M2TkIeOM17Zj7NzUaGwxe9cgtYbJZ02et58c6WgqC?=
 =?us-ascii?Q?E7np8Rc2pTOpdtUniZORldCNitaeAfcpwfTbFyYuugXiObvwm4964heZPmNF?=
 =?us-ascii?Q?2xL4kLneIH5EHyJjxlEldnd51iVBBua3Y+M1BsxvTcokrG5lfBV44cehC94x?=
 =?us-ascii?Q?B0YRo6bRZRfyDcjYOIERUADWgExkxsSkHaCMdZ8yGgaRz/1N5dmxaaKMOUbM?=
 =?us-ascii?Q?sJtzU56JwdFZuOua8oaTyAtQ+OE/KA7DHJukOFE+eNuMzYwhQYVIAe/SsosY?=
 =?us-ascii?Q?hNCLz6DtYq/uVdoGOfbaXz3JFMgo01Q9Cj4/ZW4gomx6+CdVxVZtAwpagT7j?=
 =?us-ascii?Q?0MnMWKrk2S1EJeCxjFMfQCHtheM4Y5yO4jgRoPJRJKEx7BXBGU6pxJE2QAH5?=
 =?us-ascii?Q?C8GPFzb4skK0PeIwsXUbQv64RwzB94BNXy58xaeJIJNVUUx6ckWKOZVewnfO?=
 =?us-ascii?Q?uraDfUnAenaLpUSk5bcm9m+VH9F+PCR1OZlwSJlJdR1KR1xKIiTDgB+4fG5T?=
 =?us-ascii?Q?h1dQffYjDMa+URD0+euSZzJ9raqwrXSlj+DkhEYfsgUeSeMNfg55/JW55+3u?=
 =?us-ascii?Q?s8fOUxqdBgFYQScDTiwTlOhGSgl0roOIa/bWguHMBADUz8X9sunFRSueg5v+?=
 =?us-ascii?Q?UKGNAyTBrNJq0qbTT9BehYfTTjzT5sDNW6ZtKEmd3sD5SuBnD9P3Vvq/uS2Y?=
 =?us-ascii?Q?8pa+yOH3FdXhLAiqDzGtUvuWMOSVakPXlP+gDU4Uijz9MzWdya+Vle5MZM5f?=
 =?us-ascii?Q?+Xb/SkcwN8gAKADs3UlQXO9XiYbbsesC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hO8CIhVFM9GkpUO1TzP8PjKR0I/W63uLM9MN2RQwk4cPcXXEclwDRxBp5Rd?=
 =?us-ascii?Q?nm8iVKgXyIBJfuAvDlsF0I9quvig8Jp2okd0vbFAQCiKxQLe46nJGf3BbmRI?=
 =?us-ascii?Q?gKjchc1qtdYbkMPzrh5tT1ZEUJbtfgL33kdYXRTqOGzxpm5KO3KVB845ph9L?=
 =?us-ascii?Q?+qpGHjRqB2/6WGBDIGnOcwc1jh0+Rq20y5avmAFb8H/BudfBLEHOofogBlY+?=
 =?us-ascii?Q?D8ijj9fJRQnT9me0uAml9obx9nU6Mb48PQ0B7CFMAPsP+V7Pn4uI4c5oMyQQ?=
 =?us-ascii?Q?svcDA10Liza8gMo79g03Pqy/JooqYSYC3PCCIWK2lKpfw4LbHWKECkoF5M+5?=
 =?us-ascii?Q?t7VMrunPMK0x2t4zydZ9Vhr0WcT+ER1w1J+qcaYoR9x1+Sfnih/fuIe6XOlz?=
 =?us-ascii?Q?JWBNzBIBXLnqU+NuM2WjV0qGkhiGhMdtwXqSrFELB7pUp9WlJ8p05PNUWJew?=
 =?us-ascii?Q?zWReWW9EZZpJZ1IDNJrnSAXl+Qh46BKjB9t/BsZQyORSXab0EDfRTl2MJf3V?=
 =?us-ascii?Q?J3GBKwZ+NnOgrm3IIwlmvPSIBWn8LMrKC++UY489a8JuOvEx7vw/BjH/RD/v?=
 =?us-ascii?Q?C/wJ6cNKYlY3WD8sCcABPWq9ecv98WIErTGcO9HalJcmlc6Zypms2FWsio3g?=
 =?us-ascii?Q?DCNZ7sqT1mI0ozjskd2Vf613REolwr2RbgzESoWvxUAyKLiBHVz1Tsdz58xp?=
 =?us-ascii?Q?sISt+YzDoBv7amRIm3y2lHHKjZ9g2TrYCpysOlYUudUT9TdpAeYoVDJEm2ea?=
 =?us-ascii?Q?h8Buf69ArJ+1lBnA3HNowJ4b4O0YdyKQxL4tF+E9AqadBhoVsDXm6AwcMpPg?=
 =?us-ascii?Q?Ph5s8I9epMZz3Gjq5adGXiSN4NDITcmv+ZxXBB4npWEnAJQV+dhX9VBeMvOw?=
 =?us-ascii?Q?WgAaZsCrbrnELlqIETNPJXtd1L8zFuW3DY7UaNQmAr6vYeckOJD/u0wPObjq?=
 =?us-ascii?Q?nxrqDY9Owzrb6TGe9lrwgvkks6gi7GqERl4bGdN09JJGCZB2eoJsPEQZfHCi?=
 =?us-ascii?Q?9HZTaeSlCXP133ANqm0sNzFsEg31cq3p/QiI7wMGgGeqRtz4D+2fPVRV44BY?=
 =?us-ascii?Q?yDtibuLsXKChbiLqWV611kdpJqQvWTbETk9E9E2IMmqfM4uDj3RQfC4WXWtW?=
 =?us-ascii?Q?u6CsuwGFWqpeIbGaZNgXX9UXa6/NuIM65bthvkB0jPngvscl3HJURtVUpSK7?=
 =?us-ascii?Q?RhOOed5NZMvp/bmbR32QR+OKEZLeWd0z3KlpfbEqaigwcIZB9ktxllLUtf5+?=
 =?us-ascii?Q?L3G6x45QMNau2CWPO5PYwDat2z7beU4uORIvoOdAWxFa6Bvl2JrXiMEFQb5G?=
 =?us-ascii?Q?KxXhYg+WaAccUOAT8OyZmulCdlwsqCPEwIuqiY8J+IVphQy/5S8FnZZbGBks?=
 =?us-ascii?Q?zi5LRwrhlc3z7tJbWyorK0aZowbBs0/0qRrX5k2k0fIYey5AdqoNqTJcF+7R?=
 =?us-ascii?Q?CNGCQvvrOaI4Q5PfQFl6RyoDaMyrX2Ltysi6easy2k3iAmTiWTJxPv657HlE?=
 =?us-ascii?Q?3E1/AMa16jD8gZrumbPP0gyaA1OwBa8oOVuapytXDmdEN6z8A9kLpPANZgfb?=
 =?us-ascii?Q?5szxFyr2dJjgQtrAr+jaNnGa/aGEkW2GHvp0CBJ803Sn7QFDT9NDrzvSxcTP?=
 =?us-ascii?Q?JAd8SwFk29yN6PxqzM31zYs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6853dbf8-86b8-421a-f5b8-08de26139495
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:57:47.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0w/vTJH8gvmCGStt+HKxtA3Ly57cXNzypdLlrhWXm1YvJwMurbm61QU0xnNcbYgn+B/t2bXk3jFRj+EIfiIwiKxSmpiKloY4LcH0QFMaYBYgiDZwqfs5odI6Gr3lJ2Yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9302
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

On Thu, Oct 16, 2025 at 01:48:21PM -0700, Matthew Brost wrote:
>Add helpers to see if scheduler is stopped and a jobs signaled state.
>Expected to be used driver side on recovery and debug flows.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
> include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++--
> 2 files changed, 32 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>index 46119aacb809..69bd6e482268 100644
>--- a/drivers/gpu/drm/scheduler/sched_main.c
>+++ b/drivers/gpu/drm/scheduler/sched_main.c
>@@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>  */
> static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->pause_submit))
>+	if (!drm_sched_is_stopped(sched))
> 		queue_work(sched->submit_wq, &sched->work_run_job);
> }
>
>@@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  */
> static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->pause_submit))
>+	if (!drm_sched_is_stopped(sched))
> 		queue_work(sched->submit_wq, &sched->work_free_job);
> }
>
>diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>index 7f31eba3bd61..d1a2d7f61c1d 100644
>--- a/include/drm/gpu_scheduler.h
>+++ b/include/drm/gpu_scheduler.h
>@@ -700,6 +700,17 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>
> /* Inlines */
>
>+/**
>+ * drm_sched_is_stopped() - DRM is stopped
>+ * @sched: DRM scheduler
>+ *
>+ * Return: True if sched is stopped, False otherwise
>+ */
>+static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
>+{
>+	return READ_ONCE(sched->pause_submit);
>+}
>+
> /**
>  * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
>  * @sched: DRM scheduler associated with pending job iterator
>@@ -716,7 +727,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> 		.sched = sched,
> 	};
>
>-	WARN_ON(!READ_ONCE(sched->pause_submit));
>+	WARN_ON(!drm_sched_is_stopped(sched));
> 	return iter;
> }

NIT...instead of modifying the functions added in previous patch, may be this
patch should go in first and the previous patch can be added after that with
drm_sched_is_stopped() usage?

>
>@@ -724,7 +735,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> static inline void
> __drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> {
>-	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
>+	WARN_ON(!drm_sched_is_stopped(iter.sched));
> }
>
> DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
>@@ -750,4 +761,21 @@ class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T
> 		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
> 			for_each_if(!(__entity) || (__job)->entity == (__entity))
>
>+/**
>+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
>+ * @job: DRM scheduler job
>+ *
>+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
>+ * to obtain a stable snapshot of state.
>+ *
>+ * Return: True if job is signaled, False otherwise
>+ */
>+static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
>+{
>+	struct drm_sched_fence *s_fence = job->s_fence;
>+
>+	WARN_ON(!drm_sched_is_stopped(job->sched));
>+	return dma_fence_is_signaled(&s_fence->finished);
>+}

NIT..In patch#4 where xe driver uses this function in couple places,
I am seeing originally it checks if the s_fence->parent is signaled
instead of &s_fence->finished as done here.
I do see below message in the 's_fence->parent' kernel-doc,
"We signal the &drm_sched_fence.finished fence once parent is signalled."
So, probably it is fine, but just want to ensure.

Niranjana

>+
> #endif
>-- 
>2.34.1
>
