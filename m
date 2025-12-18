Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F58CCD352
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8CC10E6B7;
	Thu, 18 Dec 2025 18:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6/qj/gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4B10E6B7;
 Thu, 18 Dec 2025 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766083259; x=1797619259;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UYgJCcIBlUkXlVePy4Tno/RLsjA9pCUdNZLirmruSSY=;
 b=K6/qj/gsw7DVi/CgsT6zdyLqCEsmQtYIgB/C35f0WLKTtynny7OXxBJ7
 3SxMjnRS26hnITQv+2SpIH8UgX2sutqTlqK1ZtuoyaP9cjvM/tHt2mWiC
 4ngqCiJqwUmC11qMohfpSOxlgFmDmQxYb26XdSeR5fD7FS4FKkioF9y+W
 XiEoNlv6fWTM1NNflpMuZcOu5WLaCltckQL7o+0xWO91hPB6dAiUStiqO
 Wt/0RBPXAGjuuxVkhU0Ccr8nZcNnnUW03D7nTSmGPwH0RKYAzcS1haoJQ
 yat4ILN9eos8tDplIpI/MhNxrebEy6axv1izSTFnP6gDm8oNUnlu+4YtK w==;
X-CSE-ConnectionGUID: 0k+ukCMYR0y4Rmg0Rn+UFA==
X-CSE-MsgGUID: Kjly3GRSQLqpMTsF6h8zEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68199945"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68199945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:40:58 -0800
X-CSE-ConnectionGUID: F9dVtLQsStylPyMXcmbPRQ==
X-CSE-MsgGUID: wx6w1P22Ta6201k75eYkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198421408"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:40:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:40:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 10:40:57 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:40:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKszeWM9kbFR99xFNvJP1vd0h3w9Ie4Zkqqk7xHwva5RaZHBHHZmZ0iQ/dvlQnnwG0dI0Fvga8WpgGB4nafEq90cznDvPaEuCjLv2F+Upl5j2AvcwivrwYjAJMkdittr532/kjv6LijXBcV3plKDMG/fWWcdTlJAEODw7MivRuygqU9LWNBjCd0GzY+XI10fYXirciqbCcbMlxXsyd3sHMUE52ufak8iYFurfr7SXEir+oLJ8Q3Wh8LJfekPQmhQwDuSN73gJ0nopyS46Q+Vq1+ZubuO4e1Bsdxk/LtIDX5P5Dm7BqVWwnk2uUI7kslROTHhfpo5GU1YMNjyvi9dvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkhuUae+jXHAt6Bu+3p4bu1t0VfXoCkRWgEBSUU6pM4=;
 b=Rr683hJCR2SXhfgpjvqjoPIRwX6sAEnXFlmOBfRSlZ32XqkE3sjW9yxtmQd7sRGZDV+miDu5vMMQQtEfWe5tUEverr8HoDBZUmX91wM3g38iKpWPTTS58bZWj8E9AL5kCA0rQaRTxEtnGJZsUPXfaPUWfo1FNzmbkTNa4eB3W6nk/rNawjxhiXqX9PINHw9sEF6GR7Op+x85SCccJOt6xl6buLjvZg1RFAk2b9F1lLEjThOe2z5N1Sqgv8qXOGlJAJvTMXRbOYOmJEknusa8KNdIJQzAZ4S/CjIb0bMFddZw8hG5Bc+XmFqoxXXTzfoUEUpsDSQ0LoRgL9ochopAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9303.namprd11.prod.outlook.com (2603:10b6:208:574::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 18:40:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:40:53 +0000
Date: Thu, 18 Dec 2025 10:40:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 22/24] drm/pagemap, drm/xe: Support destination
 migration over interconnect
Message-ID: <aURKsk18sFly548x@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-23-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218162101.605379-23-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9303:EE_
X-MS-Office365-Filtering-Correlation-Id: 310f0af4-4383-4249-96f8-08de3e64f933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7wGzsijHpQ3c08FOwckpbkYLZKfKpO70dQCziDfgVvFBc+jFXdFr2+GZ9v?=
 =?iso-8859-1?Q?uaIXtx4NkTuUoEnFroNmn/t6LgQ0y0aC3yUGnc4s2abZbsc527WXkj52w2?=
 =?iso-8859-1?Q?WUg8CEOU0L0YknJatIk6tAHB4AkTf9VPvdU5r5YyW/cZYGoVVoctmtBIfG?=
 =?iso-8859-1?Q?R5pegm5CIsy5/bwXFZ5sm5zyNUx1li/g2672/VGuwCSPxbp7aG+hg3/JU4?=
 =?iso-8859-1?Q?WjFKi3OUskRjZIubfX4w30vqtgR9HZjL1HQq9VH116d27UelgIAismM2Mg?=
 =?iso-8859-1?Q?02DtKL4MXDgnK/CiesHzGk8fJnT3kuET+IIUyUswLdElhXCGzf6/CE90j8?=
 =?iso-8859-1?Q?kcmZ1p9q+BG95h2wi9uOr0qkDvDCHW63A6PtPaBNWqYcowg9lNuaxEiCAO?=
 =?iso-8859-1?Q?W1KQ9zqW3lVdTbbPUYElK7M7eaXsPqjrGekz5Zd4jUtowKzc13DVyDuqeI?=
 =?iso-8859-1?Q?yItiTKB1JnpNiNf/LePJzVrgPGP8nx/hKptes+PL+Lk76v+GvaPDOcSeiE?=
 =?iso-8859-1?Q?24rmrTC+HjXtgBn298mcvrRx2oS/DrbQ9XEPSNsXQTUYcY5p7WmbEVP2ub?=
 =?iso-8859-1?Q?go98uZHdP0DDOcTsYwdSs/aLcDfVMla2FvYxLIuznttNG41NvrjxAtLMAq?=
 =?iso-8859-1?Q?jPikxwfkJe/f7WPRanUcZ4bnMG1b2esr7JgAJuoZwpMG7mBXoUnnkQHIz5?=
 =?iso-8859-1?Q?xbS9wmIU7GGqdqzeH07JQwu2T+A/tCBMFCmHtbDnM9Tim41Z+C7HGi8070?=
 =?iso-8859-1?Q?pkKNPgyaIkMFpJfckna2XhMcx4e4Mf/yP9b1KS1n/LNCfws6loh1JURNYG?=
 =?iso-8859-1?Q?RjDQAMpRuiSz8ResFUiRcKbWu26HaXbNsZhuE7sboRX4PgNuXYterTfonj?=
 =?iso-8859-1?Q?NmvNt9KNUMK7moHyTjh+t3lRIOBtyr6UeY9NX153POzbkKBaRNP+9Luzf4?=
 =?iso-8859-1?Q?MXrZYCtDUNUtJS0UnfzmPgkwF9Ope1+LCifhL3mZiQlksC3R9dTjTzWYS5?=
 =?iso-8859-1?Q?MtCl/cZ0iA7GHMFzZh0xW9C71OM/WzaSxoU134XexPDm4Bt0Zs2cmNCmz6?=
 =?iso-8859-1?Q?x1pPDl9Dn8Nuf3xK7JRhgEHx0/l5tkKxfT2C5lddcIZyHdZYSuYWYyzjUf?=
 =?iso-8859-1?Q?w/Wa3GFeJW/WcQadah1XucX+an69NZDLzG4WOVp7lFfXDFTsQFwnZfSNPn?=
 =?iso-8859-1?Q?9CshThi6ykgjqAs+QQVWPYG4TXaGcOJ1ekHOH8FSfDlW5JFKy7UZdP5xTO?=
 =?iso-8859-1?Q?a5wo1CaXfrfmgZujlPp0/pVymrgMc7l0eDtpjIo3BVj47JiXnTH73tGs3s?=
 =?iso-8859-1?Q?DBLQcyhN+n/JodpN1qHXgNMuQbO4MQ5HyqlXLOWfR6wx1xvHAf3PhPSeN/?=
 =?iso-8859-1?Q?ysnKYqQ2jqQL8VCF/B0ykC3uBD1i4EN0fhjO4qFBj22ybgTQul+972lMpD?=
 =?iso-8859-1?Q?9kj7dmkrbu0eYLs5GIMfl5x1XssEz60nHKlbcdGks9MNhtRNWBUoTGzZG6?=
 =?iso-8859-1?Q?5ggVoremyWNo1cBe1VMFdK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G2210GtcRI5Cn6gV2YYHlvQL6gHCszOqE/x21BjiYDuz4pMOe5/M/oh6B8?=
 =?iso-8859-1?Q?TFq0+TAbtwUts7MLG+k1p+8hPo+Nesz+ywwiSEMqqDBUWThC21StXZ5O/8?=
 =?iso-8859-1?Q?/K5yq517JbudtdXllPLGz4TQR4sBGEv+grwTqHZyfceD3uKgCUpEaHOwRb?=
 =?iso-8859-1?Q?9w8FR5MDYuCuXTsBOfoUmxv1IIGg3bGEFXkon0Ar6mINGtyOYFh5vutzcb?=
 =?iso-8859-1?Q?V3a+uESvZ/wGJq6pY6OJMSHsqUL1i7nrbf5J/0yTt5plCW1CTIKIgwyau+?=
 =?iso-8859-1?Q?EO8RaRGcaqYl1Ijz1Ya3/qFhuJQzM/X3MBBREC2+VLGFHkxAGnx8XYjc9P?=
 =?iso-8859-1?Q?cjIVkaFmWI0jN8CwgcfBYYCMTfI0DlLQtJZIm9UJrJ8uVvxrLtj7YUJzkb?=
 =?iso-8859-1?Q?4aWFO3UovrT1NzdT623Q6XWkSNQopF/EskFoStgo670IpKVxaI1NdxYE7o?=
 =?iso-8859-1?Q?B679MNSd+6rqF0tiWh7WbiSfqncqTfS9CfWVgpEBSIwFj8RxTqiJu5btnz?=
 =?iso-8859-1?Q?ITxtcyDX7kLWY/qS+WfUw3QJVpcf6++vjhYQt+7jXR2nmsiEqFKO1r0VWB?=
 =?iso-8859-1?Q?ky/sZeiNgCbB+p3m2stUXu8dP1rLkCQFxwQq8WMVYyKF9kYdLEgXkwGwzr?=
 =?iso-8859-1?Q?lMz05poLurEcbwyF4Trrqm61AmM2/Ek3b69qlcU0uAyWO+k56pef3y9I2G?=
 =?iso-8859-1?Q?47lGv2Y1C6B3g2q7pjPhiIHml5QWQ54bhy/ZHk37ynwNaLnuVwhbjIpHAF?=
 =?iso-8859-1?Q?7fj8x4lESDjUfFfrH1XUYDCOs9Dp5r+UvbJwQy2WzBVy+lVsX4mYwAqIEV?=
 =?iso-8859-1?Q?NuAWFldGaDFaVpqvQ/8l9qLODQhaomRVqfJjdYd3YulsmW12YLyFBm+PxY?=
 =?iso-8859-1?Q?W8H/Q6OK9XEUIB0kZtx0DtUBjj4oAdMv5pVrWU8TQrIGDEg20L7q63cbat?=
 =?iso-8859-1?Q?CFjryRbnlwuOTqDV0ZUyBAdzbsMPzgjyPsjM8yoEp1qLbbUQlfIZb6oLIa?=
 =?iso-8859-1?Q?ny/klh+u9xlQv+4jiutJucpBQc/sMYmMu6hmxSjx5zPg5Yuu+aC9EFJ6pt?=
 =?iso-8859-1?Q?NrIj71boxFG+gzDy9PUl8Wgyi7vbkTEblmDQ42xrTM7KWM30rgeoN1+nqA?=
 =?iso-8859-1?Q?EN0s3qASOkK6hvoIwRt99xj8fJ8Z08kFnCgWYWS1ccnsJ3fUV3Y7cW1Adj?=
 =?iso-8859-1?Q?mO13KPXlzpdohhGorjvGRpLHNIh5uvWlbOp1G+DLyKddqEPymirV6pFmSR?=
 =?iso-8859-1?Q?z+CEdf5xGCOty8N+g5332eaREIy+bY7udkpIenZXvR/ij3tOjlrBa9qVoS?=
 =?iso-8859-1?Q?Bee+N8/i0o2Vh4HAp0WVlAW0mIwoJ3VztD4eDgtZWTCEjyPjaSMvsBv8/+?=
 =?iso-8859-1?Q?BXqj5eWwgTRqkuVDpr3wEfXWOqg6fuF9BjIXkX/VQ6qoOF2ok9VBqhphPd?=
 =?iso-8859-1?Q?C7RDRrK8E6MssEiSVFKrvj9bDFcXB30VKPC32vxZma5ZMNj+FNXCdW27Od?=
 =?iso-8859-1?Q?BdfQ2clPCv96eVG5PL9Pn/+QPt0nogeCS5jp4pVbtzA7mxLEE4A5OL4PgL?=
 =?iso-8859-1?Q?fkgRwVGdxRo8SNjNgaGaOj0EvL0FxqDjgFoF6wC9uLQjEW9qbSpLdJQ5Vm?=
 =?iso-8859-1?Q?aQn40+YJijbPlhosGeQzsvFqWBrZ0NcW8kAoOSyiBHr0NtLl1XlF2Zmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 310f0af4-4383-4249-96f8-08de3e64f933
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:40:53.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz/LQzm+yqkml287cexjK35/t0SI01FKPeCfCypjEROP3k5pILZfszqDoLwJuBKYZEad+ScnAbrYwveVCrRQdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9303
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

On Thu, Dec 18, 2025 at 05:20:59PM +0100, Thomas Hellström wrote:
> Support destination migration over interconnect when migrating from
> device-private pages with the same dev_pagemap owner.
> 
> Since we now also collect device-private pages to migrate,
> also abort migration if the range to migrate is already
> fully populated with pages from the desired pagemap.
> 
> Finally return -EBUSY from drm_pagemap_populate_mm()
> if the migration can't be completed without first migrating all
> pages in the range to system. It is expected that the caller
> will perform that before retrying the call to
> drm_pagemap_populate_mm().
> 
> v3:
> - Fix a bug where the p2p dma-address was never used.
> - Postpone enabling destination interconnect migration,
>   since xe devices require source interconnect migration to
>   ensure the source L2 cache is flushed at migration time.
> - Update the drm_pagemap_migrate_to_devmem() interface to
>   pass migration details.
> v4:
> - Define XE_INTERCONNECT_P2P unconditionally (CI)
> - Include a missing header (CI)
> v5:
> - Use page order increments where possible (Matt Brost).
> - Fix a negated value of can_migrate_same_pagemap.
> - Move removal of some dead code to a separate patch (Matt Brost).
> - Remove an unnecessary zdd get() and put() (Matt Brost).
> 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c   | 184 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_migrate.c |   4 +-
>  drivers/gpu/drm/xe/xe_svm.c     |  26 +++--
>  drivers/gpu/drm/xe/xe_svm.h     |   1 +
>  include/drm/drm_pagemap.h       |  19 +++-
>  5 files changed, 187 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index d44372a80a90..09356d50b8d1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -207,10 +207,12 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
>   * @dev: The device for which the pages are being mapped
> + * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
>   * @pagemap_addr: Array to store DMA information corresponding to mapped pages
>   * @migrate_pfn: Array of migrate page frame numbers to map
>   * @npages: Number of pages to map
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + * @mdetails: Details governing the migration behaviour.
>   *
>   * This function maps pages of memory for migration usage in GPU SVM. It
>   * iterates over each page frame number provided in @migrate_pfn, maps the
> @@ -220,12 +222,15 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
>   */
>  static int drm_pagemap_migrate_map_pages(struct device *dev,
> +					 struct drm_pagemap *local_dpagemap,
>  					 struct drm_pagemap_addr *pagemap_addr,
>  					 unsigned long *migrate_pfn,
>  					 unsigned long npages,
> -					 enum dma_data_direction dir)
> +					 enum dma_data_direction dir,
> +					 const struct drm_pagemap_migrate_details *mdetails)
>  {
>  	unsigned long i;
> +	unsigned long num_peer_pages = 0;
>  
>  	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> @@ -236,31 +241,50 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		if (!page)
>  			goto next;
>  
> -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> -			return -EFAULT;
> -
>  		folio = page_folio(page);
>  		order = folio_order(folio);
>  
> -		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> -		if (dma_mapping_error(dev, dma_addr))
> -			return -EFAULT;
> +		if (is_device_private_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +			struct drm_pagemap_addr addr;
> +
> +			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
> +				goto next;
>  
> -		pagemap_addr[i] =
> -			drm_pagemap_addr_encode(dma_addr,
> -						DRM_INTERCONNECT_SYSTEM,
> -						order, dir);
> +			num_peer_pages += NR_PAGES(order);
> +			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
> +			if (dma_mapping_error(dev, addr.addr))
> +				return -EFAULT;
> +
> +			pagemap_addr[i] = addr;
> +		} else {
> +			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> +			if (dma_mapping_error(dev, dma_addr))
> +				return -EFAULT;
> +
> +			pagemap_addr[i] =
> +				drm_pagemap_addr_encode(dma_addr,
> +							DRM_INTERCONNECT_SYSTEM,
> +							order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(order);
>  	}
>  
> +	if (num_peer_pages)
> +		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
> +			num_peer_pages);
> +
>  	return 0;
>  }
>  
>  /**
>   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>   * @dev: The device for which the pages were mapped
> + * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
> + * determine the drm_pagemap of a peer device private page.
>   * @pagemap_addr: Array of DMA information corresponding to mapped pages
>   * @npages: Number of pages to unmap
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> @@ -271,16 +295,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>   */
>  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  					    struct drm_pagemap_addr *pagemap_addr,
> +					    unsigned long *migrate_pfn,
>  					    unsigned long npages,
>  					    enum dma_data_direction dir)
>  {
>  	unsigned long i;
>  
>  	for (i = 0; i < npages;) {
> -		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
>  			goto next;
>  
> -		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
> +		if (is_zone_device_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +
> +			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> +		} else {
> +			dma_unmap_page(dev, pagemap_addr[i].addr,
> +				       PAGE_SIZE << pagemap_addr[i].order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(pagemap_addr[i].order);
> @@ -297,13 +332,12 @@ npages_in_range(unsigned long start, unsigned long end)
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
>   * The caller should hold a reference to the device memory allocation,
> - * and the reference is consumed by this function unless it returns with
> + * and the reference is consumed by this function even if it returns with
>   * an error.
>   * @mm: Pointer to the struct mm_struct.
>   * @start: Start of the virtual address range to migrate.
>   * @end: End of the virtual address range to migrate.
> - * @timeslice_ms: The time requested for the migrated pagemap pages to
> - * be present in @mm before being allowed to be migrated back.
> + * @mdetails: Details to govern the migration.
>   *
>   * This function migrates the specified virtual address range to device memory.
>   * It performs the necessary setup and invokes the driver-specific operations for
> @@ -321,7 +355,7 @@ npages_in_range(unsigned long start, unsigned long end)
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  struct mm_struct *mm,
>  				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms)
> +				  const struct drm_pagemap_migrate_details *mdetails)
>  {
>  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
>  	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
> @@ -330,9 +364,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
> +	unsigned long own_pages = 0, migrated_pages = 0;
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
> @@ -374,8 +410,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	zdd = drm_pagemap_zdd_alloc(dpagemap);
>  	if (!zdd) {
>  		err = -ENOMEM;
> -		goto err_free;
> +		kvfree(buf);
> +		goto err_out;
>  	}
> +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
>  
>  	migrate.vma = vas;
>  	migrate.src = buf;
> @@ -386,35 +424,84 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  
>  	if (!migrate.cpages) {
> -		err = -EFAULT;
> +		/* No pages to migrate. Raced or unknown device pages. */
> +		err = -EBUSY;
>  		goto err_free;
>  	}
>  
>  	if (migrate.cpages != npages) {
> +		/*
> +		 * Some pages to migrate. But we want to migrate all or
> +		 * nothing. Raced or unknown device pages.
> +		 */
>  		err = -EBUSY;
> -		goto err_finalize;
> +		goto err_aborted_migration;
> +	}
> +
> +	/* Count device-private pages to migrate */
> +	for (i = 0; i < npages;) {
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> +		unsigned long nr_pages = src_page ? NR_PAGES(folio_order(page_folio(src_page))) : 1;
> +
> +		if (src_page && is_zone_device_page(src_page)) {
> +			if (page_pgmap(src_page) == pagemap)
> +				own_pages += nr_pages;
> +		}
> +
> +		i += nr_pages;
> +	}
> +
> +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
> +		npages, own_pages);
> +	if (own_pages == npages) {
> +		err = 0;
> +		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
> +		goto err_aborted_migration;
> +	} else if (own_pages && !mdetails->can_migrate_same_pagemap) {
> +		err = -EBUSY;
> +		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
> +		goto err_aborted_migration;
>  	}
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> -					    migrate.src, npages, DMA_TO_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
> +					    migrate.src, npages, DMA_TO_DEVICE,
> +					    mdetails);
> +
> +	if (err) {
> +		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +						migrate.src, npages, DMA_TO_DEVICE);
>  
> -	if (err)
>  		goto err_finalize;
> +	}
>  
> +	own_pages = 0;
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page = pfn_to_page(migrate.dst[i]);
> -
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> +
> +		if (unlikely(src_page && is_zone_device_page(src_page) &&
> +			     page_pgmap(src_page) == pagemap &&
> +			     !mdetails->can_migrate_same_pagemap)) {
> +			migrate.dst[i] = 0;
> +			pages[i] = NULL;
> +			own_pages++;
> +			continue;
> +		}
>  		pages[i] = page;
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
> +	drm_WARN_ON(dpagemap->drm, !!own_pages);
>  
>  	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
>  				  devmem_allocation->pre_migrate_fence);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +					migrate.src, npages, DMA_TO_DEVICE);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -423,21 +510,37 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	/* Upon success bind devmem allocation to range and zdd */
>  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> -		msecs_to_jiffies(timeslice_ms);
> -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> +		msecs_to_jiffies(mdetails->timeslice_ms);
>  
>  err_finalize:
>  	if (err)
>  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +err_aborted_migration:
>  	migrate_vma_pages(&migrate);
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page = migrate_pfn_to_page(migrate.src[i]);
> +		unsigned long nr_pages = page ? NR_PAGES(folio_order(page_folio(page))) : 1;
> +
> +		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
> +			migrated_pages += nr_pages;
> +
> +		i += nr_pages;
> +	}
> +
> +	if (!err && migrated_pages < npages - own_pages) {
> +		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
> +		err = -EBUSY;
> +	}
> +
>  	migrate_vma_finalize(&migrate);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> -					DMA_TO_DEVICE);
>  err_free:
> -	if (zdd)
> -		drm_pagemap_zdd_put(zdd);
> +	drm_pagemap_zdd_put(zdd);
>  	kvfree(buf);
> +	return err;
> +
>  err_out:
> +	devmem_allocation->ops->devmem_release(devmem_allocation);
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> @@ -710,6 +813,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
>  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct drm_pagemap_migrate_details mdetails = {};
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
>  	unsigned long *src, *dst;
> @@ -748,8 +852,10 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> -					    dst, npages, DMA_FROM_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
> +					    dst, npages, DMA_FROM_DEVICE,
> +					    &mdetails);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -765,8 +871,9 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		drm_pagemap_migration_unlock_put_pages(npages, dst);
>  	migrate_device_pages(src, dst, npages);
>  	migrate_device_finalize(src, dst, npages);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
>  					DMA_FROM_DEVICE);
> +
>  err_free:
>  	kvfree(buf);
>  err_out:
> @@ -809,6 +916,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>  		.fault_page	= page,
>  	};
> +	struct drm_pagemap_migrate_details mdetails = {};
>  	struct drm_pagemap_zdd *zdd;
>  	const struct drm_pagemap_devmem_ops *ops;
>  	struct device *dev = NULL;
> @@ -866,8 +974,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
> -					    DMA_FROM_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
> +					    DMA_FROM_DEVICE, &mdetails);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -884,8 +992,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
>  	if (dev)
> -		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
> -						DMA_FROM_DEVICE);
> +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
> +						npages, DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
>  err_out:
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3b66b55acfb..4edb41548000 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -35,6 +35,7 @@
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
>  #include "xe_sriov_vf_ccs.h"
> +#include "xe_svm.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  			u64 pte;
>  
>  			xe_tile_assert(m->tile, sram_addr[i].proto ==
> -				       DRM_INTERCONNECT_SYSTEM);
> +				       DRM_INTERCONNECT_SYSTEM ||
> +				       sram_addr[i].proto == XE_INTERCONNECT_P2P);
>  			xe_tile_assert(m->tile, addr);
>  			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c83ba32f1175..40401aa70dbc 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1045,6 +1045,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      unsigned long timeslice_ms)
>  {
>  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +	struct drm_pagemap_migrate_details mdetails = {
> +		.timeslice_ms = timeslice_ms,
> +		.source_peer_migrates = 1,
> +	};
>  	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
>  	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
> @@ -1096,10 +1100,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  		/* Ensure the device has a pm ref while there are device pages active. */
>  		xe_pm_runtime_get_noresume(xe);
> +		/* Consumes the devmem allocation ref. */
>  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> -						    start, end, timeslice_ms);
> -		if (err)
> -			xe_svm_devmem_release(&bo->devmem_allocation);
> +						    start, end, &mdetails);
>  		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  	}
> @@ -1615,6 +1618,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	enum drm_gpusvm_scan_result migration_state;
>  	struct xe_device *xe = vm->xe;
> +	int err, retries = 1;
>  
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
> @@ -1633,10 +1637,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>  			dpagemap->drm->unique);
>  
> -	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> -				       xe_svm_range_end(range),
> -				       range->base.gpusvm->mm,
> -				       ctx->timeslice_ms);
> +	do {
> +		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +					      xe_svm_range_end(range),
> +					      range->base.gpusvm->mm,
> +					      ctx->timeslice_ms);
> +
> +		if (err == -EBUSY && retries)
> +			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> +
> +	} while (err == -EBUSY && retries--);
> +
> +	return err;
>  }
>  
>  static struct drm_pagemap_addr
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 50e80bc892b6..b7b8eeacf196 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -205,6 +205,7 @@ struct xe_tile;
>  struct xe_vram_region;
>  
>  #define XE_INTERCONNECT_VRAM 1
> +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
>  
>  struct xe_svm_range {
>  	struct {
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f73afece42ba..46e9c58f09e0 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -317,10 +317,27 @@ struct drm_pagemap_devmem {
>  	struct dma_fence *pre_migrate_fence;
>  };
>  
> +/**
> + * struct drm_pagemap_migrate_details - Details to govern migration.
> + * @timeslice_ms: The time requested for the migrated pagemap pages to
> + * be present in @mm before being allowed to be migrated back.
> + * @can_migrate_same_pagemap: Whether the copy function as indicated by
> + * the @source_peer_migrates flag, can migrate device pages within a
> + * single drm_pagemap.
> + * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
> + * should use the copy_to_ram() callback rather than the destination
> + * drm_pagemap should use the copy_to_devmem() callback.
> + */
> +struct drm_pagemap_migrate_details {
> +	unsigned long timeslice_ms;
> +	u32 can_migrate_same_pagemap : 1;
> +	u32 source_peer_migrates : 1;
> +};
> +
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  struct mm_struct *mm,
>  				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms);
> +				  const struct drm_pagemap_migrate_details *mdetails);
>  
>  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
>  
> -- 
> 2.51.1
> 
