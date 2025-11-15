Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27937C5FCB0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 02:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6210EBAA;
	Sat, 15 Nov 2025 01:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYj8L8dF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B623510EB9E;
 Sat, 15 Nov 2025 01:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763168517; x=1794704517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EH9IojVljKxszsUAigj/RWf8sbaKw20tu3LVroNF/yo=;
 b=hYj8L8dFoQI9UD9YUt+lHuxe7pSDJ5mWP68Fqqzdb3H3JQ2NZg0ZCO1U
 V/zAHImVuA15i29EoP7WRFA4+Dbb0aNVkH8GvOpaKhJvjPN/IrcYKWGi2
 Bq0veXPZX1WEfaLobT3ZExU5MVe4x6hnh2sunvi+xlt4oJqNXHnmR9XUB
 wDpikQ+QS8Zu57DDkNNS6/ConZrEcLLJqKdUrg6gb485DReWTvJCod/zv
 EXCSYboa9zWVLPefVKI1K5u/schQgqn3Vl0gTbxj2Z228TYFfjxocxudQ
 j543VCWsNpof7szAafCGlih9Rt8zwlqFoyUVS5uXiTmagdfKWkA0gun96 A==;
X-CSE-ConnectionGUID: YeiLyyB5SC+TalPxYZ6W1A==
X-CSE-MsgGUID: vaEm/oReRAiFA9e4ANnS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76731320"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="76731320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:01:57 -0800
X-CSE-ConnectionGUID: ilbaYHUpSzaodgBNmL7oGQ==
X-CSE-MsgGUID: f+9GSe1vSxSD2zUX/s+ZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="227250745"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:01:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:01:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 17:01:56 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZhVFNL5GkVzqOnvGetObVcsJlgzOqgP3R5N3qqxpnAXOkE9m2bWdt0eJ5N4FlCZoDt9oyFP/f2vnZiSQQj0z7xE2hYTss0DRX3YzQs/OIg6kl0yFPZNqp1UMtbI/3PNNzv9cY7xRYP2n945iIqXaadqdJ6nXKIi1R4WPofODyONYcpOAvUhnIemjhGXq1M6E5ajo1iYmB6orgWWIMTiPlX6eZlBSMJ9wJSa9cDjRHa4pvAS49MU7ggJEprfLA7u92IyV0UkzhWWMBGs0zmHbbthM+17TA0oZY6m46JRe+BXPq+FXJgmfOCym8SV60mqJdSeJ3GLZwO6N7Cd5xZkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWUhBU+Q9HOYgoXvEv4TlzK7foNrGGArffbrbiaHJZE=;
 b=na2V3ksn7Ku0TJwG/TIdu4E3Dn7DPxlcpdlKc416gdfN3SV4tihsEcAY+ZXJt0ISRM1SwRsklS+5v50JykVvEUzYzUlcy7oUE0NTucaPJunI3n4PlRokEnEfWeUzl7BrQVGXIJlG96ExQDDHoMKYiCRjr+7r/afkpxI5ou3xaTkejyDKNt7NWn8mE8mqUiKz1RhtHzh9P1+bP9oABXWwSJRleuPwDupM6GL6TYIGKBTcpsL81RgXvj3cS43kYKjgV7ETqmPxhFfu08rESjnwUOnd37qSbJ1fZ5SoCASguBRiBO1oyc96SpwJWyv4fNHyLvyCO9ybayholWWzhBuAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 01:01:49 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:01:49 +0000
Date: Fri, 14 Nov 2025 17:01:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 7/7] drm/xe: Only toggle scheduling in TDR if GuC is
 running
Message-ID: <aRfQ-fh6xxw2sMq_@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-8-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7268e404-7531-4dc7-f8bd-08de23e28e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UlQou8TGlnePoxZ9BmDvwmaWjAsBUVWyZn1LLxNrSA5y4ejRYWVLuhC2oXhJ?=
 =?us-ascii?Q?NMAChD4YqRN5A7OiXoVvW0LhG+/FdlaRog2ucxA3y0wwykMnKwm8P2gGtDQa?=
 =?us-ascii?Q?LEqSfp3MLENjqMDRAli8XS1cXl83RMeA71O67BoYCd3wW1V1/pFRwodBwk1G?=
 =?us-ascii?Q?s6hCL2+KfDVq41sRYdxwNbAvoMW95dqcTKEO1WUJ1tiAeHp4YFB/JiU2MsNi?=
 =?us-ascii?Q?mri6YJy+IX+AvAdTPe8Zou3nIa9Vz92QiE2zB1JOi6AMtQ34Coszxn38/og9?=
 =?us-ascii?Q?iHKaggm4ZZNAcFYCviwPuqsxMUrslXMzJfRpJaTZ487LyNeBoOM2OL/+tQ02?=
 =?us-ascii?Q?Yxj4emeITtiGjTUW57+kG0zpJQoc0Qs3kq7XF/tdEl5Pt4mYfpmv6zjdDnGK?=
 =?us-ascii?Q?DBk9wsPNhS1LvoWJSZAyqi4xRgwhweYjCSlzGeyijG2R6VnID0h2I6+V/o2k?=
 =?us-ascii?Q?OR2IjpyBVv38ocUAwlmnJpdSDAbrzWMqw5nT6vigE6REeoQtmdy2GPrsANMp?=
 =?us-ascii?Q?NQLdJJFKxXkNvcfs6TP0j1SH43MzgqDj4M1NqzXgQ3/noMv5Mka+npL51HHO?=
 =?us-ascii?Q?IL/msVWGpl9nkFiPFCb2n8CbEZBf95A2BOhkCVBO1xgdbE9jqYWmV3v+wOT3?=
 =?us-ascii?Q?CZPFfeBClN0T2AexbgBuZ913otc0YPLwxZ3HAGGX8IZYbfxMiYYvouvZOarW?=
 =?us-ascii?Q?i0oPwx5hM7BasxKEhFn+nSrWhrBmrK3guu8PkYPU+Qmu8pXijG7wfq1Mecy7?=
 =?us-ascii?Q?/3oLGaBz3+FfMAssemrJALIodcmYOyi+MAE4WRXqXfClMf+ounizjpS9mowp?=
 =?us-ascii?Q?tz79gQcXGCb/EG+GZ9MhqCPNiP2fA0tFTcHen3LnwWXtMNtn0JuoopSbMI5y?=
 =?us-ascii?Q?6Kg9Mkq5e9vDUXqz7fGyOi3ugLvDTpUcKVhk4Z/0M+Z+WsuVqoTY20i4D/7L?=
 =?us-ascii?Q?V7kJmPYdsGVeUqY5r8h8UPXIGJC1RgKRlQ4NPh2mGrprXUBORMEHNGPn5QVy?=
 =?us-ascii?Q?Wsf8bJk4neEz0f4yDbABWdNQs9+tGNcCdqpdbxKIQjJ+PUSZJndFnA0nK2ID?=
 =?us-ascii?Q?R8I4MahWUrxmo0ngmCctg2lNgGR04Wh3FYvx/g4u7p94UeiXS2KRRhTXkkHa?=
 =?us-ascii?Q?6CxS101Vbw2gupMsYgHUKqeQ2E6flq6pc9gBc3Ckk+Agz0ewTzzz83cH4xTo?=
 =?us-ascii?Q?3uYJ4XnyVloSHjy82XoKlrkjwvat6csAnkW7QM8fJo1RDBfiQNfRflLmqhhp?=
 =?us-ascii?Q?aYKwUA+rdzuhfPZr6tjYiDrR69BeM1xaxuiK/Ean7I34huEybWYDKvdavgW9?=
 =?us-ascii?Q?xqen4abhKVW6rH4mYUUDtXw/C9z1bqMLqwolve+YBE6qT/SsNpTrywZlsZXE?=
 =?us-ascii?Q?6ZKkLttc2/0iKa75tTQ6I0J5MP4jy8sprFv/d62onOyMQzG73XLhq3Ou1IGN?=
 =?us-ascii?Q?Bx7XfFZhEaRD4BLT7zc8tmMz7ZgMsBQ6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EVE+YZZJKJirv4AJvearxlRAFLrm3QMHyyInN5Qm0Eegrml4/sxs/FhSsMq5?=
 =?us-ascii?Q?tIdygERZE58/mXrzW+A2VQf6M3YlGeHoaWA+yTHd35E8dQWG6EB9XKfO+y3M?=
 =?us-ascii?Q?p8PYkmew2R4g0w+UtAfWNLuljD7rxJN2ko0UEAN9dIZWkrU7vQ/XvjQVckTV?=
 =?us-ascii?Q?pXFdixErJBeAAixxJeXmqyMmC4UZ2M4dFHqiKhu11drmEEUh7oR8Of5nhmBW?=
 =?us-ascii?Q?fFiQ6hHM4Zs74gYO2Masmn11fbEHfv7ItrF8NdMLbAUnbKbZv5+6+/J+quSM?=
 =?us-ascii?Q?jhNQ14C14MgQC/BaNrsYABr3i+/rwSNMdttjmN3+BA8v9TROD5JwOHqRaks7?=
 =?us-ascii?Q?xOKdebsw6ZQhSX38nGVKXBmjmu81E0eOaW7U/BUSYFFSpKQXY/TTF3cHp5zj?=
 =?us-ascii?Q?aSigmUkcEoiXi8eBvXYY5/iQFvBtDibC3f949SviD/YwbwWnC8+shkxLdutu?=
 =?us-ascii?Q?N0cGM4rMA7E8m1ycJsBvA5JpN7nZp7XtrlPmpBlDEwD/9Ph9jspsJBFCdR9h?=
 =?us-ascii?Q?p6ms7XdffVY4sDQMN73kFtwIkMX1jwn0/EeenswuuxE7JUIp8NFeNWcom/7h?=
 =?us-ascii?Q?9lpOXbTtco1haGYC01+g2VXWP3GO8ih6o+OsaOHICS2n77XF8OYYs2IJYv8t?=
 =?us-ascii?Q?gFECUIz1G0Ow/4IpdQ6PGgVKA4AwxIOAuZBM3LKjuoTUdf+hGKxtQJ45iLRr?=
 =?us-ascii?Q?qLJpgCxQnplF9qY1RoiCYBPls8x6ZKrZMo6wB81nkAMFiKBjF6VHL115WbJw?=
 =?us-ascii?Q?yS6wC2a5mjiv/9lZ9/R5i600vQwWVBi/YoKAhNltb3uehSptG4pU0NGCUAXZ?=
 =?us-ascii?Q?QtAE21PzoURvHOvDOjIRE3snYIBGhx52mg71aUzNslDTQo/Gjo/6+Ak9FwRX?=
 =?us-ascii?Q?v4ki0QqLM/P4rwT7s4uR++coGVVSOQ181U9t3M7M6Evs+S42FsQe3JU5EzsW?=
 =?us-ascii?Q?fMX20I7qwp3KKRYPDufNfL2hX/WX45zewiwFspPNwgsTl8Z/M61uPJpgBU1E?=
 =?us-ascii?Q?f82kFNSnx3LG2X8BT7vjGeCUJkoTDRSxEEHZiw1X+wSkQG5P+1KZfc5ITqIT?=
 =?us-ascii?Q?MUurH5l+zk5CbYAS9s4pPMI4iPdxDtaheqLza4EeXLgm1dT0b8TJIidpbPgC?=
 =?us-ascii?Q?7igET5OLJ5vDdftNaf8uYGcOUs+Oinvb7d1CG4bk42QbR9ze1nIzhzlDIP6+?=
 =?us-ascii?Q?TPEQSACiyYCrX+gtEzAx5aUh3YFRid2PRaJQVGU1qaz5K3hwijYosHCHau9m?=
 =?us-ascii?Q?iwjzlIgwe+ow4cWw+ImT98q2NeCKNKuBSSJpU4FfRXYWy+Oq78WvmSt1kKA2?=
 =?us-ascii?Q?VkgWLacKvTLickEGIlrrqkgirKVXQOM7GCzq/T9KxBQhs1UN1MzCfmO/AeAi?=
 =?us-ascii?Q?aEYHhRu+gFrrdezzQbZg+vAAuy6OjfsOV60FrfhkuocCzzzg5IyRKpFiu4L4?=
 =?us-ascii?Q?6w7ujzXaEN4TlMORK4IIuHVxiPBE2/jo1/7KfQu7u1HdQ09ezrZELGP7pZ73?=
 =?us-ascii?Q?0/GaQzNjlcYVrk/Ac+R3c/dXzzn09wowiK+PKGqm09gCdzxRZN6MRX1YuKUm?=
 =?us-ascii?Q?fRc2vT2f+3wk6ne0rkkAFifcxPkqdHUQ52Lxh/mM0++nipGpHqVtDeXEGt/c?=
 =?us-ascii?Q?VgNMz7Vr78lJ7ImVkpYtLvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7268e404-7531-4dc7-f8bd-08de23e28e44
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:01:49.1632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4ldnVBRd1c9x/GFvdgF89IdVC00jTN6xlbjCRZso1DcyWTCVAXSX9RjD8Q0BNp7WBBQy+mKlhKA7YWOhwpPPiUx3yT78V8o9vrC4gyk9zXgezF+ZY5Z5dnj9QNKgtsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

On Thu, Oct 16, 2025 at 01:48:26PM -0700, Matthew Brost wrote:
>If the firmware is not running during TDR (e.g., when the driver is
>unloading), there's no need to toggle scheduling in the GuC. In such
>cases, skip this step.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index bb1f2929441c..ea0cfd866981 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1146,7 +1146,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		if (exec_queue_reset(q))
> 			err = -EIO;
>
>-		if (!exec_queue_destroyed(q)) {
>+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
> 			/*
> 			 * Wait for any pending G2H to flush out before
> 			 * modifying state

Looking at the code, it seems like if we skip this 'if' statement (when fw is
not running), then it will go wait for ct->wq. Not sure how that gets woken up
and logic might try to reset gt after that? Not sure if we should check
xe_uc_fw_is_running() here will one of the conditions to wait_event_timeout()
call cover this case and we can handle it appropriately after wait_event_timeout()
returns?

Niranjana

>-- 
>2.34.1
>
