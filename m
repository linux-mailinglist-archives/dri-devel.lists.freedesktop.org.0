Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D26A225E0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 22:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F39710E1AA;
	Wed, 29 Jan 2025 21:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVpDL4aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924110E1AA;
 Wed, 29 Jan 2025 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738186667; x=1769722667;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qGbSOSrIXYaRfAivZCnX6TLw/YktW3tDZl7V/1RqMto=;
 b=aVpDL4aCsE4Emn64h5nFx4Z20CtXcnJ2bACfgJqYLRG1SrqxdYNMFjoe
 t2XHIKn3tyw0YDMFubhl+5Cb/jdpCd26Czwbtsa3xoocTWTpDWQaeTnJj
 ahTnzbafUhAgY2S4ibeZQGN4YlNpSZ5fa6hars67ShtCoY2OauENjkxIP
 sFpEjyPEU6WUqwsrwX5FjS6AYYwPo+KX7JZ6kEbiMUs0fSkAv6TZ0CCXc
 n+ez1HBByOr0PzapXBzIpFAuGs+cJ8xNn3aRnwrvqeL9zLpoN+xF8bzGp
 bf63V8k6wwyno21Rhz+O2pNymR/AqHY/xcbla9VEOexyrvM0J5yQU2v4w A==;
X-CSE-ConnectionGUID: O2d56tkPTO+usv1P+2Ev6w==
X-CSE-MsgGUID: 7Bf8g50KTZiD7rGR0n0JdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56147470"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56147470"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 13:37:47 -0800
X-CSE-ConnectionGUID: w/s1TGuSTv+AMSOLQF/I9Q==
X-CSE-MsgGUID: LG4hsWUCQeWyVNb+N29tXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="114183186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 13:37:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 13:37:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 13:37:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 13:37:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdHu8ERlTwPFma7pSMRNGesn3T8EdmjeW+vSXV6dCJZZbg69WmkbOzvZU5nwG6AT9j+xaEo0+JebPJwEmHOylmzk7eF0ERxCUFfk79RROjlWFi3GGp4C9YcL70UeBHQTxYU/OvVQa/MqKVbhNyuCnwUcVIsqNEIbidwbZtfqmk81w2f6FHsaOCuDnb0bLf1ec0TbAMx3ilSPIJTfB6jkc6fiHEirZjlrDTzZqvYcvUr1oFlGC6HD8llBqzfGtbulxM563RZhAciKN9TQ6aoa+1hutobSEB/ALi3cNB32pNzzvqExgr4h3LHmdw1bftnDDXV0kuBuzQqGYSIxA8cq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KEZaS07rVipSLPhdwMQoi52W10JYqFXtw4m2b7Blyk=;
 b=FiZRfAUe4c7kJRZfTplZRgyQcYcbZPLWx+2XFDJX2zWsQIMXslmnKEjofXRk0ccycrZZzCOVlbjmYMC+cADLOb7VnQT7lPdEn/wzq7jTsK2JuSWMzOXGHd91fGwfmOkYJwI37bo7PBw9Mr7TznSoqCrhiF7nksLnqu9J3MwpfmZAwgDFFGCXhGnWkMy4ETh+odeUCgkjmI5AffzC3dSUrMN3flUcTCxpbDWxJh2n/mbO1KqrbNDkKH6OtzDTqC9vxJ6ByUOo13/XcZGbFxXPaPKyagrY89twskTGAKSYnXeNB3st6Upu/Ma79Y6XqVbPJqIyfCd+gZoDHX8h5mVpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SN7PR11MB6996.namprd11.prod.outlook.com (2603:10b6:806:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 21:37:01 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 21:37:00 +0000
Date: Wed, 29 Jan 2025 16:36:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karthik Poosa <karthik.poosa@intel.com>, "Reuven
 Abliyev" <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/11] drm/xe/nvm: add on-die non-volatile memory device
Message-ID: <Z5qfdpPY_bZ1glmc@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-11-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250101153925.865703-11-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SN7PR11MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: e500ea46-5d0a-46e4-ee95-08dd40ad1069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UbxmqlIJ6YkBEingu34jRFim5eyoIuv2MQuB3AEoYnORh+GdyUIDkALW/3+l?=
 =?us-ascii?Q?UBZ3BGn9ytVtNjP7rMkAf/I+gZrikX3J6zMyzuoQvAnws/tLCItuEte7mPuC?=
 =?us-ascii?Q?0tpzbcLgILU+RTz+VlUFLmNmkw6oZ6IIGPT7dEsa53uWRdTUjMkoqG8Vy6k8?=
 =?us-ascii?Q?kpXMFx1UrsiEAVeJtMFkWQfsyXA6c7qfUU+1ksBK2Hx3GA/21axJ0vS9LZEJ?=
 =?us-ascii?Q?NHQ6WLFimbMTeFivPkkVSL76TbCdQjNbJ7Z7//iwiGXYz9zxvx8HinQG7GpU?=
 =?us-ascii?Q?P3diIX+xUoUz7WIxG5zXsRNuTrS0kNF7cbYRqIy132p8m+zFRkNitPn4Nmq1?=
 =?us-ascii?Q?h0W2O9pFqpqxS598yGe9H4HeVxY+RQaQSIdXJCUeLg4Lbq2F7S7X5u/NnDo/?=
 =?us-ascii?Q?qiCUurzIjIHxb3JmRmOywzTNDKsW2nGAqkUswMmp6QJ0Dw14wcZhZjt9cCZ7?=
 =?us-ascii?Q?MbCVCPehERa/UzH2LDtCleQv7Y13+mPjgezCJSBBOh0JZp6nf1+OgJRqriiL?=
 =?us-ascii?Q?vkkViShhV9Peu7cCl66A3aZwcpSZhA4OttjY9bvCdqEsa6fDGkVUQmv9e/nh?=
 =?us-ascii?Q?Fdndnlt6OUZSdDK04WoYXZsjXDJ2A3k/O+9G7uDpSgCjKMeSU4sr9Pa/wjT5?=
 =?us-ascii?Q?05NxgD0hxOV5hQkakAZmut/P4DmAcDdEHCzZ+sMPxFxyJvoFM3ns50yIeENe?=
 =?us-ascii?Q?MhbaFyVDkEONL9w9pi9xZJZkTjLybH+aaGJ6xeJiTTtK6Pq5EXcZGfijhHSy?=
 =?us-ascii?Q?UK2uMtUQoFHD7qulotOOLd5INLJ/n8rZdYIQJHr42ESl0BrN/7IJxIZydi3P?=
 =?us-ascii?Q?3bCes3e6Sm3/aG0q6GMwr58ZJRijWAgvYMYgWrJ+nx5c3Hn3CXP8GbtAolYq?=
 =?us-ascii?Q?b6FR9HxKukPccz7qIKmIQUzsIO2D2nOqrF9NoCIYpUWT1jRWL1lL7QEzAK1j?=
 =?us-ascii?Q?6XnykI/aBnXiJPA8JCso2qFFLaixFJB7iITyEJuMrY1pVgXTfImSi3hTkrHV?=
 =?us-ascii?Q?axEN1Fd+pqRvYkHC2EBgC4CE7kHZlc8ctJrJHnuS9k+mw2XBig0EroFCooSW?=
 =?us-ascii?Q?Rreb1nELR292+ib3KiE5jLB9J4U7fWKxHbawj2r7yz2FtecfGMIfPI5MV/zy?=
 =?us-ascii?Q?qkwvK4dGgkpMgb6s+V2s89XIjZbiEti870Uq+WxiHbthxp+qrPqwPQhhOcSD?=
 =?us-ascii?Q?ZYJI+m81iwStQYnMEiA2AQfoSfsXd8LflaRxmSy7DsxiohaEDSm+pOYjTuSU?=
 =?us-ascii?Q?Xh32gM2be+NG+lk9eMRWjALDyFyAMYLQA5aCI3rryQFRDEwgoU2KL1CajWBx?=
 =?us-ascii?Q?XfGW63hClkgTknfljci1rNAWUrE3w2WKlSRfJRRhI9Acm5LfYjRi4JwG42ar?=
 =?us-ascii?Q?u9aPv8LM1cEg7gRnrkdpFeJbvQwq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4ymarDBBzp14UG8DNmTT2rUKlX7otl4FLHq98mQQT3N+rNJfFR4Rom0Z9ow?=
 =?us-ascii?Q?levJx0Mh5ABa/a6cm3hhDR+IB6x+5x/vcWVDgIsS8iScWwvToVtArEdilwK7?=
 =?us-ascii?Q?Iw5OzhQ3in2A0dlOwF5hoCCYdgz2DsG2Ogs6mquCHj0N/ZjdQqRAgFJOg8WG?=
 =?us-ascii?Q?K9LHTqTPUmOCFC8kDFNEuxp2TBgxdzdWwcJbyDOFxVJEsSttZx7W85HrEl1a?=
 =?us-ascii?Q?DPWweYvF1Jh3ngQ70HU+ja1mHckUy6pGY0DdhbXtxSjV+dAA59wOOc/ulfD6?=
 =?us-ascii?Q?LFXk15Bn8tLi3f2oWPyBLWrgFZ8Drm8lI0fRsnMtAVtnbE4EaNQGSmDqgq8d?=
 =?us-ascii?Q?lMjFrJ8n1gaH9AoumvmyPnZJlnOfAM6T7ZDs4vZKHZy5L5TamaQpTwX0K8KV?=
 =?us-ascii?Q?NDMzPhT8+I/MzqDcqQeD1dACEWPO2Sa3mAd0u+bHBZNGO3EFlWHAT1hwOgbi?=
 =?us-ascii?Q?SqIZ6pIFLpXYFNs4enx7jdxNkVrHYhBXxUq7VCsvQ/l/fjcGRMIYYp1NY82q?=
 =?us-ascii?Q?In6q1dHfsEInkRfOQIfzPpb5mjwND7H14lfFGkU3NMtF8weai6730fHzb6sH?=
 =?us-ascii?Q?v0Gl1FCVEuuq02z68mPRh0Rqc7XCL3pwy3BfvZM7MZJIexVuWnEJO+8MsMBA?=
 =?us-ascii?Q?7VR4GeZIPSeo9Bga1XaoyC6AgbLhFDYaVbKW39jioKUF5u1haQ6x8NVb5uKe?=
 =?us-ascii?Q?bAAp3VUeEtzCo0o6mz71Ep9YjUF0WEfBQHD5SjOYuwuhHS4objjsQfFIb4Zo?=
 =?us-ascii?Q?sI0z0OGRzcT+7dT1/5P6zQyBOEZYK9fV8zOaE+U2U3EIrV6ndRz+dl9Cu1Va?=
 =?us-ascii?Q?8IL0ADJRG3krQl1vJb4tg3cGaaOOTkr7707GhfoNYoEBo4F+CMUUEgD8TS4d?=
 =?us-ascii?Q?23xypL0r1yIEti/QVEteaP63obiyH5BlJZt10icolcXAs0rbvuYVYrQjfuc3?=
 =?us-ascii?Q?1H74jCF1uQdw0MxLC2MQGhFWZD8Ad/RJNY7aPhEQsPs4adeSdAVnrf9AZw3/?=
 =?us-ascii?Q?UVgOEYE92fakL8smnTOXpoSSETyIuHd7FGc+F1Q8nLlD+Gp9Dp7sD7ZGxYM5?=
 =?us-ascii?Q?7/1GnXWuFdaTjJn5+qMtd+fXzL3qBb87qUAwlN4q0rSUwXsrKBc1OQ9YfwNF?=
 =?us-ascii?Q?CQbbzy/yvD9HAVPTXfTyfnZ3al9q6syloHg2G7Oyg2l0Pa1/5zvH+wfZdvvF?=
 =?us-ascii?Q?nSzJZbzDSQhxlMZwzJMBUVS0ppL5lHCkn1Ciobj8eDgF5ZhvHGsgUrzVzudx?=
 =?us-ascii?Q?TqPlKZxjlePGqc8IZDRnlxkrNE4/P7F108A6TN1ZZluJHCAUqbjEH7eIB8Xg?=
 =?us-ascii?Q?bYEeLQ5vhAOxhouCPb0E8QEU77lEQXL/KIjse2LPTnXWwK4t8VGyCoADFO3R?=
 =?us-ascii?Q?U3v2a0J8NfPBgXtT8Hva/eejBSaSwaIidEopY9KRcj7KD5y924TJ0WnzkHRP?=
 =?us-ascii?Q?m0ipteIH3x+PY0zFUL6nNElJa+OnHfm333pcm9Gm9sgEyInNIzzb0cELJ15r?=
 =?us-ascii?Q?ibfMqQVMu6vIakIRlAHEZcO3bg3+JKNGGupCqNP5Zt+PamzaRJUHUFDiajIZ?=
 =?us-ascii?Q?3Uj+PPN+rtKmyUWgAW4A8KYthxOwbwu/vJ2TM9W1wzdKTcmksErnAorJdmhB?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e500ea46-5d0a-46e4-ee95-08dd40ad1069
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:37:00.8706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l05AG2S73TsK3Hzx/+eV8dn8p1RuhpaCz3twqsNX1IeV5QXNLJxm+ixaq1AWNqax0GX8KGytxpqdc9rCVij8cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6996
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

On Wed, Jan 01, 2025 at 05:39:24PM +0200, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Since this patch needs a rebase anyway, please allow me to point out
a few nipticks that I'd like you to adjust.

I'm sorry for not catching this earlier...

A rebased version with my nipticks can be found here:
https://github.com/rodrigovivi/linux/tree/nvm-mtd
(But you need to add more platforms there... I just added the BMG,
and also I didn't address all the items that I'm listing below)


> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h |   7 ++
>  drivers/gpu/drm/xe/xe_nvm.c          | 100 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
>  drivers/gpu/drm/xe/xe_pci.c          |   6 ++
>  6 files changed, 132 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7730e0596299..f5f3a3233fab 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -94,6 +94,7 @@ xe-y += xe_bb.o \
>  	xe_ring_ops.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
> +	xe_nvm.o \

move up to respect alphabetical order.

>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7f021ec5f8e7..78e5e88435c6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,6 +50,7 @@
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> +#include "xe_nvm.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -743,6 +744,7 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_fini_gt;
>  	}
>  
> +	xe_nvm_init(xe);
>  	xe_heci_gsc_init(xe);
>  
>  	err = xe_oa_init(xe);
> @@ -813,6 +815,7 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_oa_fini(xe);
>  
>  	xe_heci_gsc_fini(xe);
> +	xe_nvm_fini(xe);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..817c8fac9d9d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,8 @@
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  
> +struct intel_dg_nvm_dev;

move above xe_ggtt and no space needed.

> +
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -308,6 +310,8 @@ struct xe_device {
>  		u8 has_device_atomics_on_smem:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
> +		/** @info.has_gsc_nvm: device has gsc non-volatile memory */
> +		u8 has_gsc_nvm:1;
>  		/** @info.has_heci_cscfi: device has heci cscfi */
>  		u8 has_heci_cscfi:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
> @@ -511,6 +515,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @nvm: discrete graphics non-volatile memory */
> +	struct intel_dg_nvm_dev *nvm;
> +
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> new file mode 100644
> index 000000000000..16383cbc9e1d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.

2025

> + */
> +
> +#include <linux/intel_dg_nvm_aux.h>
> +#include <linux/pci.h>

add a line here to separate these 2 blocks

> +#include "xe_device_types.h"
> +#include "xe_nvm.h"
> +#include "xe_sriov.h"
> +
> +#define GEN12_GUNIT_NVM_BASE 0x00102040
> +#define GEN12_GUNIT_NVM_SIZE 0x80
> +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
> +
> +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },
> +};
> +
> +static void xe_nvm_release_dev(struct device *dev)
> +{
> +}
> +
> +void xe_nvm_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writeable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}
> +
> +void xe_nvm_fini(struct xe_device *xe)
> +{
> +	struct intel_dg_nvm_dev *nvm = xe->nvm;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	kfree(nvm);
> +	xe->nvm = NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> new file mode 100644
> index 000000000000..068695447913
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_NVM_H__
> +#define __XE_NVM_H__
> +
> +struct xe_device;
> +
> +void xe_nvm_init(struct xe_device *xe);
> +
> +void xe_nvm_fini(struct xe_device *xe);
> +
> +#endif /* __XE_NVM_H__ */

#endif  is enough here without the comment...

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b7f77425c7f..9b8ce6397a67 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_gsc_nvm:1;

move above heci ones to respect alphabetical order

>  	u8 has_llc:1;
>  	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
> @@ -282,6 +283,7 @@ static const struct xe_device_desc dg1_desc = {
>  	PLATFORM(DG1),
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_nvm = 1,

move above heci one to respect alphabetical order

>  	.require_force_probe = true,
>  };
>  
> @@ -293,6 +295,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
>  	DGFX_FEATURES, \
>  	PLATFORM(DG2), \
>  	.has_heci_gscfi = 1, \
> +	.has_gsc_nvm = 1, \

move above heci one to respect alphabetical order

>  	.subplatforms = (const struct xe_subplatform_desc[]) { \
>  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
>  		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> @@ -324,6 +327,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	PLATFORM(PVC),
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_nvm = 1,

move above heci one to respect alphabetical order

>  	.require_force_probe = true,
>  };
>  
> @@ -344,6 +348,7 @@ static const struct xe_device_desc bmg_desc = {
>  	PLATFORM(BATTLEMAGE),
>  	.has_display = true,
>  	.has_heci_cscfi = 1,
> +	.has_gsc_nvm = 1,

move above heci one to respect alphabetical order

>  };
>  
>  static const struct xe_device_desc ptl_desc = {
> @@ -616,6 +621,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_gsc_nvm = desc->has_gsc_nvm;

move above heci ones to respect alphabetical order

>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
> -- 
> 2.43.0
> 
