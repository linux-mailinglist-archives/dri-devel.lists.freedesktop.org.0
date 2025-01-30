Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C40A23759
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 23:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AB410E9ED;
	Thu, 30 Jan 2025 22:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9eqIRAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0710E9ED;
 Thu, 30 Jan 2025 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738277087; x=1769813087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xUp2aDjxJpGHj8Rrsxrd40BmD8Xtyl5udPP4B5RZT7Q=;
 b=A9eqIRAfEJg5aNUIruZvAfJIR2QFClPFzQ4dNM54GleYJX5Tfhcbxxr+
 gifjVbygEZF3ZK5YrYZ55veSufUR7xlbxZf8DJieA3XrDH5K3CxvLBel0
 NiIDq3Nv8g43VWCjDxsEwoOlpz/uWcOZGDRYXopJrgp0Guc0RUTHpjkbE
 nfBZ2SooiY6CRJGhDJ2BluRix3aEgacLO2yIeJ50eyAjCqvGDDPLpC/F5
 +i1M78Gg77aivxnFTmudNMUqQdLcDBT8KHd3WfPt9OkKe6dmQXcukfwHk
 Zhkywon3pHrR2lvYwAjOiqOTuJ69tZ45y+knUYuJcpNZ0TVIEjkibTKnJ Q==;
X-CSE-ConnectionGUID: NbyhUtHtQj6W5FiqOCl8WA==
X-CSE-MsgGUID: FUlnTRRJQAmSR4MGrBsYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38087770"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38087770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:44:47 -0800
X-CSE-ConnectionGUID: U5hhN7fPRQG9nLPsqyIqrA==
X-CSE-MsgGUID: mD4odyfMQmqehR0J18gXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109324785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 14:44:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 14:44:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 14:44:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 14:44:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7TftnJVSreF6CEpZnh/T4h3DywEtHj373Ej+e8R+8BPuC8dIOMYBfCE2CEuQpyd3NeFLywGkri3J1cj0MkBRogcDiClMzw0L2lrtpGANzWwSJ4ZkBVGfVWT8Ox6/hmtEcttptVdWl5q62aKe5J2U+/TK6tHn0umFrbO2Z1LJqflHMuC4msbG4+AmVusEoehAe0/Fdac7ZdxEGavAyfRtVy7nNBcmhZYzE6tEn4rZQM0IpYrnRMqnLA/ae9i/CTkuoSS9LwiyMlIZJzcn2uHVHWAmCVALFI0tv2po3E16lENUJLqvV0dquGFWpVtdxwdy7iY7SOWtL15MxXobO46LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MEWTx+D92c63Mnh+gCj5gcs33+j6E8T7EaHoAW6O10=;
 b=I7spud5MIo0T2ljq2Lrqx0jr2uuFli2shJ0nL1Yww4ePpvZhRzaYVX6sn6VlKRqkJuQmG4U8kOaGIc4ZyNryiGoWXWYLvun9G2njbm+mtBxIeviPPBFL2BHdViPOCzlnMNbRrW2Re/C3lFSN0pxZM675I4+U9EaVg3tsvRAs4U7caFfX+FrsgVb+sKujeHyXxImpGUZRkLMYZ0pr2VihK1kWJo+fCHRxdbNbbmw3MwquISk6g5/eb219fTowOuOpMI9AkIKOXEt0NX8ybr01qftNzadijaB/Af1iixZD1m+Via2VJWoS1/lU2QvHhnY29m+QHCaAfLrZjUCtP5Amqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 22:43:59 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 22:43:59 +0000
Date: Thu, 30 Jan 2025 17:43:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Zhanjun Dong" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation
 back to xe_hw_engine.c
Message-ID: <Z5wAq14aXXIccYhI@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128183653.4027915-5-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MN0PR11MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f36e76a-4a56-4cb4-59ec-08dd417f9635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/sFF0koPH3r99D7qZyacWOZYUGL5rYSlaNblgXUkUCGpFp3+Bejxpj17HKKl?=
 =?us-ascii?Q?+0jcchH9s8BY3QEs4xSEGuqHS7XieUC1onT3aRMQfiaSohwgBxhTc8o3SSal?=
 =?us-ascii?Q?aVsFWCLZJNWhO/hUBLc5YQj8sdt786fic1hEeZZrFTCGD/ezqJLokSrcQYQ3?=
 =?us-ascii?Q?60o/dFDDiGhsxP67aB3ZK8DMzoLOPp/huauRykJl9NThAhWR5Iaq3IKctRrn?=
 =?us-ascii?Q?l896+oXGxWJenH1xE2Kt5vYTeYMAax+WadnuqD9pNLLHsb+MifpyIHPu4NJL?=
 =?us-ascii?Q?ADz/wm1qmEDDMP5gD0xk3k6lGMFNLZFfOqvriSmADy/RiG0feR1KKJiMFASV?=
 =?us-ascii?Q?MTj5PxJPT/6YHGVNVn9Nqq8lT2ZznfpHQA2tqkAVjpsIOBavgIwPi5Sq77I6?=
 =?us-ascii?Q?ivM/OjCAW4oGDRyObLWfvvvF8ZbJozF7Mt79XZ1GsEwjS6LPh38FaZ2kn3vM?=
 =?us-ascii?Q?AFw5ZgvClFz3PHF/7DWSHJZ0zzlyJiJ3FqJ6mMFOyAA+Y+ovODejRKee/gG6?=
 =?us-ascii?Q?KwvdDDT1X2qmYfv1132TLz5EJr1oYGJgLr71sqsMNh7vjo6FCty2MM/HJfWM?=
 =?us-ascii?Q?E4H5F+gq5SPx1thBigeLlK7Uwv+F4XV4e+5MmFOWmo2pUNi359jefuenLjEK?=
 =?us-ascii?Q?3Y8SninjOQ079nX7BsV90QsDOZwRJWq9Myw8nxzlQ+zeEbcjFMMN8Rbzerlk?=
 =?us-ascii?Q?kksCW5K9KS10cdZV1npPwpU3/SwXPucnRxeZ0CCI3B96EnXMx/LDiP28TIP8?=
 =?us-ascii?Q?5aG/Jp3rVvqzMZXVIZLBPyRxyfRPJ9IlNQyMqr6J7mSkvHzTrWxGFlZdHh04?=
 =?us-ascii?Q?VPYfwmO1qH3Pk04WhFnKB5I/kT3Kfl7ZMbK1xlGUnXstD3zxTz6stlttwJxF?=
 =?us-ascii?Q?I+EtrXu4wdJZWxF3wSAxitApUmdK5FLxHNDCOkEFhZho79D0gbybiR/ruWNO?=
 =?us-ascii?Q?XUPaUQ5xwlBA9buSGf5xn6m+0uzpfvKhQWc598vujMblwgxYgyS4dquC6FTj?=
 =?us-ascii?Q?uzTNjtUalhWluJjWFFw6y6aJyJ8Prnh0BXJAiJLHe/sV0LXUBOfsQR1wttpK?=
 =?us-ascii?Q?WskbKAzozyOoMou0XBSA9CJB7Jcv0E49AQvW8nRQ5Fx28d8LCh7BU9xr8bac?=
 =?us-ascii?Q?QzovnzUrQNA5jVZ0d0XDAsVz+8YcF62i8AyIQoCTXpfVyRY3bMmgJs+5Jn/k?=
 =?us-ascii?Q?p/JnOW2c/8ZYU7Labon5wn2pUeheceqmyNe5KyayqPJ9aDyhNJejgIheK+QW?=
 =?us-ascii?Q?wIVAhsJ5nPDt+lW0dJKjWFJmowWxQNiP4KhrFqLpatZ9Zc+ZpQ8U8B9uHhip?=
 =?us-ascii?Q?/UfczupH5qW3uj5Fbi4eP2Ybr73N/LODdysTYCR/FDMowYTfBWbZqB0bzjIr?=
 =?us-ascii?Q?/WF76RC7MtPC3meucnqg/TA2PjQc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3237c5PP5y17DP2KS2MvVLYGQRSDoKn2EBHi+uy+OsN4/gsV3YvR9Gn5RT/N?=
 =?us-ascii?Q?4eRQnYgP19W3QPfYhIZT9B38o3P79q5hQP1tQjlfbxwxSgNUIL7zMmNIF40i?=
 =?us-ascii?Q?qPyXdxpo0VWNSsTb6UWSJieTiWwP5EdI0XfGB3hrkGqKpMfeFvScY5B3oIgQ?=
 =?us-ascii?Q?pDTuKterknwR6efbn7hiqn0tD0H1Yi40LA1535rIySqTlV2DVkbgRGWZnE/W?=
 =?us-ascii?Q?zQjJSSDUv7+VmfyysTsZMMzTsMKO/1QgakWV2oeaYrwubS27Xh8vcI6WwmbU?=
 =?us-ascii?Q?Ink7hdbZSgW8e6AYl8PnyimtjQL9MOt87NClT3uGlDbGz/m6HZsEt/gP0oJg?=
 =?us-ascii?Q?jbSgVNt+8Cq+Dc7lkjisQ0bvGoQIMEPkli390LrNe4h+bk+CRd57Am4OtBdR?=
 =?us-ascii?Q?oy4ZLX8YTNK5hoE7QUGMIqYFcaIDUVMCRK+0qH/Vxv5grqjWHt3jDenuVjZU?=
 =?us-ascii?Q?bu6TyrfdfqiUkTKu2QmX4pjeeW3pDBWvkeBdLW2Qjy68rq/ZGHsgWRmjAwnp?=
 =?us-ascii?Q?fC0zKfa9oaUHB7Rwiw0WNq5ekUoDfWIdmsdOx6QthZlxC5fLuCut7B72fPRc?=
 =?us-ascii?Q?VeRVuSwUuwfrJykQGnaMffZsA54zw1vELd4KCJj7PB4klcqV+cuiXVbvZf83?=
 =?us-ascii?Q?xU3gNDpW75Zlsr0K3XrLpfExQ/YHXThEFxnCWhAvq4VOpAWP6KpX92gGmGsZ?=
 =?us-ascii?Q?QnZElem3mSEdWiHNaCkqpU732p/hYLW6PZAreDpo9eWsFH9q5QMwazbcHwnb?=
 =?us-ascii?Q?1nbUA8nZ38cGZGOyQcLq26ABrHeU8ugS4dxhhLuDjmLNdtkEgnFT60MUElFN?=
 =?us-ascii?Q?CsR/m3azvSwBPhv11aJ4eFfPWH/wW/c/OSgEg6B3YKuF0Buq5pCsRDJRyzB1?=
 =?us-ascii?Q?sc5G/5JmnCq0/TE+IwCgBlNJN3iZIL8huonPvOFTulOLNzUB5L37qRvC/rSr?=
 =?us-ascii?Q?g9Bzg8SCsr6/mRMhmtLJtbs0Y35eWgy+Zek4ha6a1n/ZSFBkrE+iHsG1Z0l3?=
 =?us-ascii?Q?w4i6UYJIqwrPMIGlsMqC5IXUjPulCucF9WHpc4S1HASi/xaRCMcTs8j11Lms?=
 =?us-ascii?Q?ixn30FOjyvfVc9oLVRP1Vm+5R+2jXWuxVeUsfajFcjr7VpnOiYJaMbBvvFlg?=
 =?us-ascii?Q?9ZDvq6xgsjoEwxzYg9WRzfe9uOhz/O6m8qXYh/hIpGlcg7CtjvjwQCIrNBKV?=
 =?us-ascii?Q?USc8TtgfqYlNLeFgIR3ils2f4EcixxKk7ob+UW6z/x44sHR7baGQqN3js3X3?=
 =?us-ascii?Q?Ni9t/Sy/oLhIu6JYc4c8HngEcla1qCkHTx3L3OWsyH7ystdxVZ2sUTjWhJXT?=
 =?us-ascii?Q?buFLWzQEE3yTDR8Horor66BLVgq/aISH+IuGAQVdLwbqChrudNbVlQuGnvgC?=
 =?us-ascii?Q?vWgu+4rLJO/u1kiTQNIUcPMN3ouSM06x5ZLl1mLgq+tmrbTjOZdLVnE3tYmq?=
 =?us-ascii?Q?IQUxkMJsvyts/sTOZ6GBCjVS7+Jid9c7ideLIHrbDAyTLPgswQbP+t1mrcpE?=
 =?us-ascii?Q?1eXqu35YQGyVtwjGnVCx3GUfOcXzyTZrGX+fUTceEAEgDiy36ZfsPmzJLH7b?=
 =?us-ascii?Q?PnVWat79sB4Jlt0akFv/7SsrN5U/p3OCEvHCD3wmZUvTXFFTVP6t+rp3SLwV?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f36e76a-4a56-4cb4-59ec-08dd417f9635
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:43:59.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gs7EGuERP1ZBFrvZIrfb6wOKlmJ8AZCgGgbBQDVGnij0UwXlveRrv77wNS93KuH9t6B2AJ67I1xBS1rvETlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
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

On Tue, Jan 28, 2025 at 10:36:50AM -0800, Alan Previn wrote:
> xe_devcoredump calls xe_engine_snapshot_capture_for_queue() to allocate
> and populate the xe_hw_engine_snapshot structure. Move that function
> back into xe_hw_engine.c since it doesn't make sense for
> GuC-Err-Capture to allocate a structure it doesn't own.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 30 -----------------------
>  drivers/gpu/drm/xe/xe_guc_capture.h |  1 -
>  drivers/gpu/drm/xe/xe_hw_engine.c   | 38 ++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_hw_engine.h   |  3 +--
>  4 files changed, 35 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index a7278a01f586..6f40aad7e212 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1866,36 +1866,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>  	return NULL;
>  }
>  
> -/**
> - * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> - * @q: The exec queue object
> - *
> - * Take snapshot of associated HW Engine
> - *
> - * Returns: None.
> - */
> -void
> -xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> -{
> -	struct xe_device *xe = gt_to_xe(q->gt);
> -	struct xe_devcoredump *coredump = &xe->devcoredump;
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -	u32 adj_logical_mask = q->logical_mask;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	for_each_hw_engine(hwe, q->gt, id) {
> -		if (hwe->class != q->hwe->class ||
> -		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> -			coredump->snapshot.hwe[id] = NULL;
> -			continue;
> -		}
> -		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
> -	}
> -}
> -
>  /*
>   * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
>   * @guc: The GuC object
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index e67589ab4342..77ee35a3f205 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -56,7 +56,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>  void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
>  void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
>  				   struct drm_printer *p);
> -void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>  void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>  void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
>  int xe_guc_capture_init(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d615ebab6e42..40c1f9814177 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -830,7 +830,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  }
>  
>  /**
> - * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>   * @hwe: Xe HW Engine.
>   * @q: The exec queue object.
>   *
> @@ -840,8 +840,8 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   * Returns: a Xe HW Engine snapshot object that must be freed by the
>   * caller, using `xe_hw_engine_snapshot_free`.
>   */
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> +static struct xe_hw_engine_snapshot *
> +hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
>  	struct xe_guc_capture_snapshot *node;
> @@ -885,6 +885,36 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>  	return snapshot;
>  }
>  
> +/**
> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> + * @q: The exec queue object
> + *
> + * Take snapshot of associated HW Engine
> + *
> + * Returns: None.
> + */
> +void
> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = q->logical_mask;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_hw_engine(hwe, q->gt, id) {
> +		if (hwe->class != q->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = hw_engine_snapshot_capture(hwe, q);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
>   * @snapshot: Xe HW Engine snapshot object.
> @@ -944,7 +974,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
>  
> -	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
> +	snapshot = hw_engine_snapshot_capture(hwe, NULL);
>  	xe_engine_snapshot_print(snapshot, p);
>  	xe_hw_engine_snapshot_free(snapshot);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index fac2e9a421d9..845153fbc149 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -55,8 +55,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);

here as well. please respect the name space.

>  void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>  void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>  void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
> -- 
> 2.34.1
> 
