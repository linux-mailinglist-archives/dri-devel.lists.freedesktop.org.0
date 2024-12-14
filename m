Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3139F2181
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 00:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71D310E35D;
	Sat, 14 Dec 2024 23:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAaBU+Wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFE310E093;
 Sat, 14 Dec 2024 23:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734217857; x=1765753857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KnhjTEJN8wLLYMEfnMmT8H6vSmBrx0TMYol6hZGlkWE=;
 b=jAaBU+Wlhz6InlgdZWC1FiS4JbwrRjUIUNhlzhaj3sFEbWZ7Enl2auDB
 59ja09t90CYWSln6czq2Ey6IhDwnRwTM5RGZ1RFfAo9w5hwWU5T5OEeIH
 ROT4a3436xkJdtYaYCRP77R21FMjscPrzuGmH17tomEOaMBo+0WqeecYY
 x6dNjZVatswzaN7mToAfGRbM8nSErGfWEY9DK03r7qWFJ5bUplIq6BQD/
 flJ25VVA0rajNMB8d2KFrhsn+Vuuu1M//sgoeOYQhN/NGfQ2/nAVQ8BlW
 tM8QaOsE4Z9iwxcSoALt1O7lgu+trAvdZ7Hz0CGOXZaqbq03jSmUlK+6O w==;
X-CSE-ConnectionGUID: RI4/DG30Qye6eGlruDKtHw==
X-CSE-MsgGUID: hRI55ZMfR5WxaSnQKO1VZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38326316"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="38326316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2024 15:10:56 -0800
X-CSE-ConnectionGUID: pbG8NQwpRseoLfUf0U2XTQ==
X-CSE-MsgGUID: wcAunRUwTsq06gYxuDU08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134199985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2024 15:10:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 14 Dec 2024 15:10:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 14 Dec 2024 15:10:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 14 Dec 2024 15:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfGcHSvdkqAZZPSHLLpUHpfzN5NHRIr/MIq6s7/T2kqfaierg6QNWcHddl2/1MW2SooODtjVUxqpLs6cmo3l483Ge7U56Us+u7lJ2bJpnfwksd5Hgw5e81kI4DvNfC26M6uLX+tzCoCo9GpFITnQrldAhRvzWNkTSkTlUzNVg/u/PsoYpIYQBQrQlspCFNdTH5Z5qOwBQdR/E38tvsQQkru0j5oZmfYJLeGOOBakofUggyogfxmkG3Ula87eX3bwQUrWPWj08w1FFpr5nCtVEpk8+o+V+2ysaDyq43NM3tDt/456AswPt30ozold6XpbXsu0Fl8Ms3Axo/EllwhUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymyKVCvIVlHsaNzNhpNHwkAJOh5Y8W+en6uH6Qmb/wg=;
 b=fOPPtJWGkiqX6cXLvakr54WHT4Aa5NWE8eWtRyuzXPIKWSfnK5vzQi0TznMhmEBiUCicIMF3h1QIzSvfAxspqhu5pOBgVDCWhX9iRXdTk4dBIvDThQqGQQdJrklqAT9RqqO3QDWFE7DnV2Bl3JF9borsd86UAfAskaZoQeRZ5Yb9sR/9SVN0XarMccz5JvblXET/o6LuEx8WjEfOCu/18Nc0BNsj+Dij7zafc9ykRgItfgINqsA3oUOjVdIwoi1kmx3aZ8FZjGfphfT5gpABNcmyOdS2UExlfUttO5Tb08Zv7IJoE7CeLghZzM0Vd/iYH2U/OsZSLce0QH2QNbaF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Sat, 14 Dec
 2024 23:10:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 23:10:40 +0000
Date: Sat, 14 Dec 2024 15:11:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 09/29] drm/xe: Add SVM range invalidation
Message-ID: <Z14Qm39ZDtZ7B8J3@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-10-matthew.brost@intel.com>
 <12b541d3a1b46434032afc1bcb9ce90428aa24a5.camel@linux.intel.com>
 <Z1nherArkwqT9g0/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1nherArkwqT9g0/@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a42d469-59c6-4803-5aeb-08dd1c9486e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?f6K+rq7tXifnGfb5FlU91L5pAYQV3cqcKsH+khRIHrpTphHTxXG3Xror25?=
 =?iso-8859-1?Q?gMTThEw6hKkXkaNJwQ3tjwzQRPCGBptURC4EkObLr7WwVjKnSKMBoBzA+G?=
 =?iso-8859-1?Q?GNMmfoTPLCw0mibEm40OX6ziRgGDH+Jh9StW60iTUx2xqynvzBf1RlhhEK?=
 =?iso-8859-1?Q?wygwGljt1HWkWBv4cYK1FphLSGGrJZs5awmvaYgPDxdC8pP2IrPuij+OH+?=
 =?iso-8859-1?Q?b9NuW6rU7qRf4cBUQ/cYucOQPVyNRaazNM/5QFIL5UeyKTC4Nc7UzJt5wt?=
 =?iso-8859-1?Q?cl47Go9a4fdFR/0WU6ZZ50ax4m1CouscxGda5Av3cQnktxk5hQKZI2pX75?=
 =?iso-8859-1?Q?30QHyyyUI7rAF9jcqBDPUcCOVRiOixoyaMq+6Qbo2IK4K0soWnUhAUeyEk?=
 =?iso-8859-1?Q?wJANxQrVmDExLFOggsnRZylPahuCSN2tANkkzfB8cvhFXFoAtirfdPgjnq?=
 =?iso-8859-1?Q?UVGR4GkYa+5gTmTs1B+yu64ob6gtjZgsB48nPr/+v3P/P88USlBZmmx451?=
 =?iso-8859-1?Q?iYOOc3koUSP8OIFrhLc22G5fbUVCNMBTDjWk5fefbeKYeZF8UQVUcFF8LH?=
 =?iso-8859-1?Q?3SkuXi7KNZ53spB3jO4+emcOk3Cw5YVoj9SU9yJY4Rsrsd2dFr5QsBvZvg?=
 =?iso-8859-1?Q?sN2M1TK4IQLh9Wd3pjJIvkaJCzzdF0oojcWrQdP79dtGiB8ScdP/Y2EgIC?=
 =?iso-8859-1?Q?fvkUU3BCrd9obBzsrnfU+culw4k6cSY4cTTgnrvaCTK54xG7IgxR112OHa?=
 =?iso-8859-1?Q?rjUWIT66AdVsgCG3tysoNsuLQakDmjSL/YPdYLNepPst2M9PpE4+pEaCMj?=
 =?iso-8859-1?Q?N/VYCpEIB2Ng/aHPGwNYYw4xv0FgvG5/daiZFvYnsrPhzBzm5ygJ1C2jzT?=
 =?iso-8859-1?Q?0fAePsIkPF1/Gxdts03VE+rN/vecWa1YHdEMVrS2oWCB/7dUGElwAIjGq2?=
 =?iso-8859-1?Q?uxEN3gHnoUNkZwTO1NHe+49jBhbETal00Xmgi7ncjucqT7ACs4ZLVkjmOC?=
 =?iso-8859-1?Q?YW6VTn147bt3x2oPltb5xnbnBuwT1kDX5iVgwWQcINPjMjqqpGEC0fEqoI?=
 =?iso-8859-1?Q?/D/xjK3YO+4CzLL1JTVyuc0LkhBS3YEulWkM6/yD61wDBK3LIxl71/HTSX?=
 =?iso-8859-1?Q?psHOfQbHSVrpVkn/MkBmsTZFEN8qWkOaoK7mMbZWUuiKeVQMUCm52hYYoC?=
 =?iso-8859-1?Q?ZG8BqzsSx8WEvE/lAtaV+FwhjujZMQexN9+5Oai173/TRWF5JFsnBhimyV?=
 =?iso-8859-1?Q?PbVyc7p87T4CoM32Eilwwne622J2MhTJWiFxEvF09a0SsiglLIU1h4nypb?=
 =?iso-8859-1?Q?XNPy2J3SKOOyMeNhNR1jsbv6P+pkeRXbxqT+DdeFAp2os1VWjeLmwHY8gX?=
 =?iso-8859-1?Q?umNlQurTFXRarF2TtFkK+Ranh9bxnMu6TuCyNPAWvV0N+mBOvv2rKTUf/m?=
 =?iso-8859-1?Q?4/e68BB0+6wfiyHD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u6Y3LEK2VRLLCtH8nA3hUTO/TENe6LHTk4Yc/3YY35sL/0F5zImT1LTfTS?=
 =?iso-8859-1?Q?1nj9QOjV1Key5YXhDJ+8YPLo6qPpgdRsyXXsS0Rlq8AwTo/gJsWpPrpf/k?=
 =?iso-8859-1?Q?grVusthmdNBTzFVFHvdhUrmn8mnxVuGAg+pqHes6uUb/TDRXW070CWbkbw?=
 =?iso-8859-1?Q?51w/FPl942UywaSXFXY2RRXviJgQ3hpxwsROE+jNfB5B3RBNjHezFa27SI?=
 =?iso-8859-1?Q?NS5ryJ+w3Zr8BEoMEXpqLmAmrgX2+JbPUi1dnqjjasCOvlI6qVZ8NpWLYm?=
 =?iso-8859-1?Q?MqoZi19lqvVp+6kYAmhLQqPjikvjX5JiQJdAJxL8a6sx158HwekfV13KxU?=
 =?iso-8859-1?Q?wj7E0FCsCEkszet27t0bcXnQvjcpVUkGnUWfCnU64iOlgAg5g0i3K2DKA/?=
 =?iso-8859-1?Q?19QWpS9fSULLaCPlmgL4Zg/c+B15nzM91krUrUdPcf5K0xgv1ckV2JsZ3i?=
 =?iso-8859-1?Q?pPaRQ60G4P4Ky8VX3jo3wBQz3ebIfmKvkPvDoxq1dhTjbVux5k8c2Splxj?=
 =?iso-8859-1?Q?a68zUsLq2+ARAmIX+dvkOsag5Jf9yyEmmE/gMRNie3b7yYy8togwfXfibF?=
 =?iso-8859-1?Q?eXmurboCeeES+U3VNHzJ7xuCmXfPNQMS3DrVXsppMIP3NYJgkd/dtXFhXi?=
 =?iso-8859-1?Q?4k33fD+9aT7U+uzUG2sbYFE+lIYmbL12ejFPQa6Fg31ioMZclGDGyQpoDA?=
 =?iso-8859-1?Q?/MsTdAEGKaqyoaREu6jg2pCxyLwmr1FYvp1t1ZIekI544Ir+n1Dg1JQZ+0?=
 =?iso-8859-1?Q?QJjqBg2pT7yJcPkk8jxKH4GSts4V1xCo9VxuN8wxY3ttjnOXP/RN9rIwQM?=
 =?iso-8859-1?Q?7z/J+MyUblBx4jvu5uj/tqLnm/UNcvQcDFn0A0PFofUXKhtcq3zKz1BTdy?=
 =?iso-8859-1?Q?nwsanK5R/j1ULJlQ1d9xNimykIBt2e9IfLm7RErje7BrNI/8QoQSCy4ZYf?=
 =?iso-8859-1?Q?e6DubteM2J4QKQdpYkxauFQejLb7Mw8aLLrNOyFtJYEqhP0aBe4n5wNke/?=
 =?iso-8859-1?Q?KMIJg0vEFm7KJcpP3A+E0W6Yy2YpDfOsGA8n8raP5F1iEDxXS9U2zjw+at?=
 =?iso-8859-1?Q?SonVtZsrzWdo+FR7ADp+QOiQNWqUhb4yKHyZHOtrsWYTmZBX/9Wla6Xbr4?=
 =?iso-8859-1?Q?vz5zk9ARaDT7SA2e2FEDrIfOuJk3deMfffXavYxC26RBxG4oxT7Mc3vLJ1?=
 =?iso-8859-1?Q?hrZwyySG7zbAN0mOeoYJAFh17aT2tm9V2XOmoF3NCiIp0b9/9iIUvv1FXk?=
 =?iso-8859-1?Q?zbFUFoxxU+xJZQs0npWyhFLPKwXbP7eU49eb9/LpDmV4LotfmTMB4eQXr0?=
 =?iso-8859-1?Q?eosYYVI209jpFqD6sWmQ8LzBOz26yhuFtVGI4ibj6v/c9EzrXlN7amXZhz?=
 =?iso-8859-1?Q?/4q1WIqABrhhBORkJhVzGmuYj7RIU6pzgp7PxoUVK6waZP80kLA6tXOtjZ?=
 =?iso-8859-1?Q?h9eKPrlFPFxtTBzz2iFbPs6YK91GawyfAe1fGEmL6WZhoNLsdhAnxjZGVw?=
 =?iso-8859-1?Q?dN3E4A176qjnYWLSKiRBu5yQx5MEpLOnQeRLWl1pORQ65S9tf5ySKdJ4Cj?=
 =?iso-8859-1?Q?GaJ9Y86uRPGHSg2jMqxT/dZXbjcLMlRo5An02+oGvcPZ9aut3VzMgvILYj?=
 =?iso-8859-1?Q?fL0Q9VoTxI/+TGUQt/Q8LTVIoN0zo92ENRn9NtNdCWPvy4Q5wy2TU88g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a42d469-59c6-4803-5aeb-08dd1c9486e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 23:10:40.2223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMco+hUjZOM13dZRdKqsNnPLw74Y9YGup4LpPnAtBrBhXnoha9xOu2IXwnhOYE/cGQ0oiGa1RHjxwvcOlCbK/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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

On Wed, Dec 11, 2024 at 11:01:14AM -0800, Matthew Brost wrote:
> On Tue, Nov 19, 2024 at 02:56:12PM +0100, Thomas Hellström wrote:
> > On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > > Add SVM range invalidation vfunc.
> > > 
> > > v2:
> > >  - Don't run invalidation if VM is closed
> > >  - Cycle notifier lock in xe_svm_close
> > >  - Drop xe_gt_tlb_invalidation_fence_fini
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  17 ++-
> > >  drivers/gpu/drm/xe/xe_pt.c           |  24 ++++
> > >  drivers/gpu/drm/xe/xe_pt.h           |   3 +
> > >  drivers/gpu/drm/xe/xe_svm.c          | 205
> > > ++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_svm.h          |  13 ++
> > >  5 files changed, 256 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 79c426dc2505..92923947a12c 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -19,6 +19,7 @@
> > >  #include "xe_guc.h"
> > >  #include "xe_guc_ct.h"
> > >  #include "xe_migrate.h"
> > > +#include "xe_svm.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_vm.h"
> > >  
> > > @@ -125,18 +126,17 @@ static int xe_pf_begin(struct drm_exec *exec,
> > > struct xe_vma *vma,
> > >  	return 0;
> > >  }
> > >  
> > > -static int handle_vma_pagefault(struct xe_tile *tile, struct
> > > pagefault *pf,
> > > -				struct xe_vma *vma)
> > > +static int handle_vma_pagefault(struct xe_tile *tile, struct xe_vma
> > > *vma,
> > > +				bool atomic)
> > >  {
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > >  	struct drm_exec exec;
> > >  	struct dma_fence *fence;
> > >  	ktime_t end = 0;
> > >  	int err;
> > > -	bool atomic;
> > >  
> > > +	lockdep_assert_held_write(&vm->lock);
> > >  	trace_xe_vma_pagefault(vma);
> > > -	atomic = access_is_atomic(pf->access_type);
> > >  
> > >  	/* Check if VMA is valid */
> > >  	if (vma_is_valid(tile, vma) && !atomic)
> > > @@ -207,6 +207,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct pagefault *pf)
> > >  	struct xe_vm *vm;
> > >  	struct xe_vma *vma = NULL;
> > >  	int err;
> > > +	bool atomic;
> > >  
> > >  	/* SW isn't expected to handle TRTT faults */
> > >  	if (pf->trva_fault)
> > > @@ -232,7 +233,13 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct pagefault *pf)
> > >  		goto unlock_vm;
> > >  	}
> > >  
> > > -	err = handle_vma_pagefault(tile, pf, vma);
> > > +	atomic = access_is_atomic(pf->access_type);
> > > +
> > > +	if (xe_vma_is_system_allocator(vma))
> > > +		err = xe_svm_handle_pagefault(vm, vma, tile,
> > > +					      pf->page_addr,
> > > atomic);
> > > +	else
> > > +		err = handle_vma_pagefault(tile, vma, atomic);
> > >  
> > >  unlock_vm:
> > >  	if (!err)
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 39357e829b6d..282476c4edbd 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_res_cursor.h"
> > >  #include "xe_sched_job.h"
> > >  #include "xe_sync.h"
> > > +#include "xe_svm.h"
> > >  #include "xe_trace.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > @@ -829,6 +830,29 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> > > xe_vma *vma)
> > >  	return xe_walk.needs_invalidate;
> > >  }
> > >  
> > > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> > > +			  struct xe_svm_range *range)
> > 
> > Kerneldoc.
> > 
> 
> Will add.
> 
> > Here, (and I saw Oak also commented around this some time ago) ideally
> > we should make xe_pt.c unaware of vmas and svm ranges, and in this
> > case, use the same xe_pt function for both.
> > 
> 
> See some of other comments, agree we should do in a follow up.
> 
> > 
> > 
> > > +{
> > > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > > +		.base = {
> > > +			.ops = &xe_pt_zap_ptes_ops,
> > > +			.shifts = xe_normal_pt_shifts,
> > > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > > +		},
> > > +		.tile = tile,
> > > +	};
> > > +	struct xe_pt *pt = vm->pt_root[tile->id];
> > > +	u8 pt_mask = (range->tile_present & ~range-
> > > >tile_invalidated);
> > > +
> > > +	if (!(pt_mask & BIT(tile->id)))
> > > +		return false;
> > > +
> > > +	(void)xe_pt_walk_shared(&pt->base, pt->level, range-
> > > >base.va.start,
> > > +				range->base.va.end, &xe_walk.base);
> > > +
> > > +	return xe_walk.needs_invalidate;
> > > +}
> > > +
> > >  static void
> > >  xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update,
> > > struct xe_tile *tile,
> > >  		       struct iosys_map *map, void *data,
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > > index 9ab386431cad..5f333eeedf5c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > > @@ -13,6 +13,7 @@ struct dma_fence;
> > >  struct xe_bo;
> > >  struct xe_device;
> > >  struct xe_exec_queue;
> > > +struct xe_svm_range;
> > >  struct xe_sync_entry;
> > >  struct xe_tile;
> > >  struct xe_vm;
> > > @@ -42,5 +43,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,
> > > struct xe_vma_ops *vops);
> > >  void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> > > *vops);
> > >  
> > >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> > > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> > > +			  struct xe_svm_range *range);
> > >  
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 57b740367843..b2bc259978c4 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -5,18 +5,188 @@
> > >  
> > >  #include "drm_gpusvm.h"
> > >  
> > > +#include "xe_gt_tlb_invalidation.h"
> > > +#include "xe_pt.h"
> > >  #include "xe_svm.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vm_types.h"
> > >  
> > > +static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> > > +{
> > > +	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> > > +}
> > > +
> > > +static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> > > +{
> > > +	return gpusvm_to_vm(r->gpusvm);
> > > +}
> > > +
> > > +static struct drm_gpusvm_range *
> > > +xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > > +{
> > > +	struct xe_svm_range *range;
> > > +
> > > +	range = kzalloc(sizeof(*range), GFP_KERNEL);
> > > +	if (!range)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	xe_vm_get(gpusvm_to_vm(gpusvm));
> > > +
> > > +	return &range->base;
> > > +}
> > > +
> > > +static void xe_svm_range_free(struct drm_gpusvm_range *range)
> > > +{
> > > +	xe_vm_put(range_to_vm(range));
> > > +	kfree(range);
> > > +}
> > > +
> > > +static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> > > +{
> > > +	return container_of(r, struct xe_svm_range, base);
> > > +}
> > > +
> > > +static u8
> > > +xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > > drm_gpusvm_range *r,
> > > +				  const struct mmu_notifier_range
> > > *mmu_range,
> > > +				  u64 *adj_start, u64 *adj_end)
> > > +{
> > > +	struct xe_svm_range *range = to_xe_range(r);
> > > +	struct xe_device *xe = vm->xe;
> > > +	struct xe_tile *tile;
> > > +	u8 tile_mask = 0;
> > > +	u8 id;
> > > +
> > 
> > lockdep assert?
> >
> 
> Sure.
>  
> > > +	/* Skip if already unmapped or if no binding exist */
> > > +	if (range->base.flags.unmapped || !range->tile_present)
> > > +		return 0;
> > > +
> > > +	/* Adjust invalidation to range boundaries */
> > > +	if (range->base.va.start < mmu_range->start)
> > > +		*adj_start = range->base.va.start;
> > > +	if (range->base.va.end > mmu_range->end)
> > > +		*adj_end = range->base.va.end;
> > > +
> > > +	/*
> > > +	 * XXX: Ideally would zap PTEs in one shot in
> > > xe_svm_invalidate but the
> > > +	 * invalidation code can't correctly cope with sparse ranges
> > > or
> > > +	 * invalidations spanning multiple ranges.
> > > +	 */
> > > +	for_each_tile(tile, xe, id)
> > > +		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > +			tile_mask |= BIT(id);
> > > +			range->tile_invalidated |= BIT(id);
> > > +		}
> > > +
> > > +	return tile_mask;
> > > +}
> > > +
> > > +static void
> > > +xe_svm_range_notifier_event_end(struct xe_vm *vm, struct
> > > drm_gpusvm_range *r,
> > > +				const struct mmu_notifier_range
> > > *mmu_range)
> > > +{
> > > +	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> > > +
> > > +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > > +	/* TODO: Add range to garbage collector */
> > > +}
> > > +
> > >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > >  			      struct drm_gpusvm_notifier *notifier,
> > >  			      const struct mmu_notifier_range
> > > *mmu_range)
> > >  {
> > > -	/* TODO: Implement */
> > > +	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > +	struct xe_device *xe = vm->xe;
> > > +	struct xe_tile *tile;
> > > +	struct drm_gpusvm_range *r, *first;
> > > +	struct xe_gt_tlb_invalidation_fence
> > > +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > +	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> > > +	u8 tile_mask = 0;
> > > +	u8 id;
> > > +	u32 fence_id = 0;
> > > +	long err;
> > > +
> > > +	if (xe_vm_is_closed(vm))
> > > +		return;
> > 
> > How do we ensure we don't race here? Are we sure that all dma mappings
> > and all PTEs pointing to the range is gone at this point? Becase "They
> > will soon be gone anyway" isn't enough.
> >
> 
> I think this is to prevent touching PTs which are being destroyed in
> parallel which resulted in kernel explosion, so I think we need this.
> 
> How to prevent a race? How about on VM close we invalidate the PT root?
> I had patch at one point which did this. We'd still have dma mappings
> too but I think if need to we can safely dma-unmap the pages if the VM
> is closed too. Thoughts?
> 
> > > +
> > > +	/* Adjust invalidation to notifier boundaries */
> > > +	if (adj_start < notifier->interval.start)
> > > +		adj_start = notifier->interval.start;
> > > +	if (adj_end > notifier->interval.end)
> > > +		adj_end = notifier->interval.end;
> > > +
> > > +	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
> > > +	if (!first)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * XXX: Less than ideal to always wait on VM's resv slots if
> > > an
> > > +	 * invalidation is not required. Could walk range list twice
> > > to figure
> > > +	 * out if an invalidations is need, but also not ideal.
> > > Maybe a counter
> > > +	 * within the notifier, seems like that could work.
> > > +	 */
> > > +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > > +				    DMA_RESV_USAGE_BOOKKEEP,
> > > +				    false, MAX_SCHEDULE_TIMEOUT);
> > > +	XE_WARN_ON(err <= 0);
> > > +
> > > +	r = first;
> > > +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > > +		tile_mask |= xe_svm_range_notifier_event_begin(vm,
> > > r, mmu_range,
> > > +							      
> > > &adj_start,
> > > +							      
> > > &adj_end);
> > > +	if (!tile_mask)
> > > +		goto range_notifier_event_end;
> > > +
> > > +	xe_device_wmb(xe);
> > > +
> > > +	for_each_tile(tile, xe, id) {
> > > +		if (tile_mask & BIT(id)) {
> > > +			int err;
> > > +
> > > +			xe_gt_tlb_invalidation_fence_init(tile-
> > > >primary_gt,
> > > +							 
> > > &fence[fence_id], true);
> > > +
> > > +			err = xe_gt_tlb_invalidation_range(tile-
> > > >primary_gt,
> > > +							  
> > > &fence[fence_id],
> > > +							  
> > > adj_start,
> > > +							   adj_end,
> > > +							   vm-
> > > >usm.asid);
> > > +			if (WARN_ON_ONCE(err < 0))
> > > +				goto wait;
> > > +			++fence_id;
> > > +
> > > +			if (!tile->media_gt)
> > > +				continue;
> > > +
> > > +			xe_gt_tlb_invalidation_fence_init(tile-
> > > >media_gt,
> > > +							 
> > > &fence[fence_id], true);
> > > +
> > > +			err = xe_gt_tlb_invalidation_range(tile-
> > > >media_gt,
> > > +							  
> > > &fence[fence_id],
> > > +							  
> > > adj_start,
> > > +							   adj_end,
> > > +							   vm-
> > > >usm.asid);
> > > +			if (WARN_ON_ONCE(err < 0))
> > > +				goto wait;
> > > +			++fence_id;
> > > +		}
> > > +	}
> > > +
> > > +wait:
> > > +	for (id = 0; id < fence_id; ++id)
> > > +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > +
> > > +range_notifier_event_end:
> > > +	r = first;
> > > +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > > +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > >  }
> > >  
> > >  static const struct drm_gpusvm_ops gpusvm_ops = {
> > > +	.range_alloc = xe_svm_range_alloc,
> > > +	.range_free = xe_svm_range_free,
> > >  	.invalidate = xe_svm_invalidate,
> > >  };
> > >  
> > > @@ -36,6 +206,11 @@ int xe_svm_init(struct xe_vm *vm)
> > >  
> > >  void xe_svm_close(struct xe_vm *vm)
> > >  {
> > > +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> > > +
> > > +	/* Flush running notifiers making xe_vm_close() visable */
> > > +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> > > +	drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > 
> > Calling mmu_notifier_read_begin() ensures that nothing is invalidating
> > on the range. Probably a better choice.
> >
> 
> We'd have to call that on every notifier rather than just cycle the
> lock, so with that I'd prefer to leave it as is.
>  
> > >  }
> > >  
> > >  void xe_svm_fini(struct xe_vm *vm)
> > > @@ -44,3 +219,31 @@ void xe_svm_fini(struct xe_vm *vm)
> > >  
> > >  	drm_gpusvm_fini(&vm->svm.gpusvm);
> > >  }
> > > +
> > > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > +			    struct xe_tile *tile, u64 fault_addr,
> > > +			    bool atomic)
> > > +{
> > > +	struct drm_gpusvm_ctx ctx = { .read_only =
> > > xe_vma_read_only(vma), };
> > > +	struct drm_gpusvm_range *r;
> > > +	int err;
> > > +
> > > +	lockdep_assert_held_write(&vm->lock);
> > > +
> > > +retry:
> > > +	/* TODO: Run garbage collector */
> > > +
> > > +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > > fault_addr,
> > > +					    xe_vma_start(vma),
> > > xe_vma_end(vma),
> > > +					    &ctx);
> > > +	if (IS_ERR(r))
> > > +		return PTR_ERR(r);
> > > +
> > > +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, false);
> > > +	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU
> > > mappings have change */
> > 
> > s/change/changed/
> > 
> 
> Yep.
> 
> > > +	       goto retry;
> > > +
> > > +	/* TODO: Issue bind */
> > > +
> > > +	return err;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 376e86876a11..c91c5f538024 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -6,14 +6,27 @@
> > >  #ifndef _XE_SVM_H_
> > >  #define _XE_SVM_H_
> > >  
> > > +#include "drm_gpusvm.h"
> > >  #include "drm_pagemap.h"
> > >  
> > >  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> > 
> > Not used yet
> >
> 
> Will remove.
>  

xe_res_cursor.h uses this in a prior patch in the series.

Matt

> > >  
> > > +struct xe_tile;
> > >  struct xe_vm;
> > > +struct xe_vma;
> > > +
> > > +struct xe_svm_range {
> > > +	struct drm_gpusvm_range base;
> > > +	u8 tile_present;
> > > +	u8 tile_invalidated;
> > > +};
> > 
> > Kerneldoc
> > 
> 
> Will add.
> 
> > 
> > >  
> > >  int xe_svm_init(struct xe_vm *vm);
> > >  void xe_svm_fini(struct xe_vm *vm);
> > >  void xe_svm_close(struct xe_vm *vm);
> > >  
> > > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > +			    struct xe_tile *tile, u64 fault_addr,
> > > +			    bool atomic);
> > > +
> > >  #endif
> > 
> > Thanks,
> 
> Thanks,
> Matt
> 
> > Thomas
> > 
