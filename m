Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D490BA84F02
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 23:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A710EA72;
	Thu, 10 Apr 2025 21:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfJxhhMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4CC10EA72;
 Thu, 10 Apr 2025 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744319207; x=1775855207;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=Fn/WWid6zb4kq3h/RJSZZxXFma9dmwfHQDRg4C7OXvw=;
 b=SfJxhhMm+JX+UnzQKyIaMkTXA6KslrcdxV60eq9+0sW9VlvXCKgIcgK8
 r8SAgSpbb5nS2nfRYly63fKC1yteNral6jhJlwb6e3YevmQpo8UlYlFNe
 jCNUDy5ukXxZ5ymNhZktqRQ2LMtq8owQYX9rM5NwQ8ld9z/HjD9hZMKIS
 rNmqevRQqjHRi3x6eNWq/UqeYnxfqLZIAgmvGuKCN7Xnv4wrUHm4ZBzxU
 5U2PDPY0Zk2OuGR4c38xdog8GRwJHeeD8mUqH7VyxMkcK4W3cGGHtGVvr
 yd+ivna3oAB6ByzM65CPAfOwXvqh6D+sszAIrLBKgck3NNCX+wPf+vmad Q==;
X-CSE-ConnectionGUID: TEd+PTJnSaOJ4SPfvX+T1w==
X-CSE-MsgGUID: CL0eZfg6TfGqQmF+l6kAdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45761508"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45761508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 14:06:46 -0700
X-CSE-ConnectionGUID: IJKP1jLpSNqCPUtlEP/i+g==
X-CSE-MsgGUID: qJzWew7kSAOx7XHptuMenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="152188751"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 14:06:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 14:06:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 14:06:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 14:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlCI+MdYWeq2reETOmHGSx1x94sqt1TRuLAIWv9nw/KJuNGNDE2fczUxXJgNnFzjypbclqsetuD7IPFgrCnNXedc1IWy7MeUB1B1B6+6rcMEUeO4E1udROJdn29VJ4Cl2bkerUmZsnTDAyIpm0TYjq2BLVgI0A14B7jET4Xa5QMKDj98RQYevDs3HyBJ29WBlh08qgREhzKZPrlZECQgPkAd/ukG2/2F1aChf3BRXWbBqajr14KT+cpI1F0P23kQ38MDjwFV/7AXyKWpotbrfc3PgdvSSftRaIhDLsbxjjZEHiGXHXnbBKmklFivqLVCx9mKCt0ZFq88SoY+9jz2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxV2RIa/yJGEuWKCwR0RrJe/e40y7pfKneyLD1BV9ts=;
 b=ncwGx3/XyLRCi48xgAYplame63GdLFoR5ncCUvzWP2jXzGrvKcaoZyqMatuAmGexbtWanxF0KVs7utya01qmPMknLBL8WXAivd4/wWcKKkxwCDYV146pYINJKEm1sdckT3TrwxCmT5gUZg8Ul4QCDnO1wpRGlWDfQ00dmZsRPvPugZt9wpfcWzlSFgrgaFd3920sV8Ypqodi30/+DCBFQD3M7Vr8MjYJFDOPHZ0/rhhkNPkOcPAKCuul4em1e+Ots3V6d1Vgdv0wRKCGD0PWtuRhrL3rv2Q2LbJWbfT2gNqhLZ/K2DbRoWmHkkY1BW2SGg6yRUFBEGZH/G0KEeWPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 21:06:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 21:06:41 +0000
Date: Thu, 10 Apr 2025 16:06:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <unq5j26aejbrjz5nuvmdtcgupyix5bacpoahod4bdohlvwrney@kekimsi5ossx>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 54da13c3-c305-426b-ddbc-08dd78739797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/i2Dv4JM58t4zOLRfwvq4k+Stwmb0DkmUnj0CF2UhpK40eS2hV2n5DF9u9?=
 =?iso-8859-1?Q?KSLmNIntuG/qEsacuviHY20EPEx7Q3g6sXLJfS4Y5V8GVDpRou32/D7S6v?=
 =?iso-8859-1?Q?U+GOmX2BYWvE0BA0Ew8tGbXpl2sGcy8dmJSRD5+RlZtHI8Vc1lF3z5TS/3?=
 =?iso-8859-1?Q?mBKM2pp5HBWNdL5LMNukq4svqTMXL75UkdWsuZaHP1mJs9jsNelvB0S9Hi?=
 =?iso-8859-1?Q?pRk3UpZgVkcREmSFZP09yOhUBFfbj4SBETwPoMJGUeuTbOmjMPMc9TWNvT?=
 =?iso-8859-1?Q?jxAO6UIvlKCrwosT8pQPIDJqhwb9GFtQ5Dw81ZK+lAe1grs2R+JZOMNoLm?=
 =?iso-8859-1?Q?hvyIZRxuJmM6QCWvOYExKVlWBM+E/21GAp3syF4w9jAnjIrqyxYyqH5oMP?=
 =?iso-8859-1?Q?HPExSojZEsVjfS6o/ZoEeCwiIpsRelGvh2dcBnyShtzMfyPKnhUHW/kwqu?=
 =?iso-8859-1?Q?q/8aawKmL4SMYl+vtUzkSAmcZDA/pweYGitUllaYEXwdE90dbmh/OC7D//?=
 =?iso-8859-1?Q?tAlM95zB7ySnRL4aSoD1ehvlrPaRjYVaxscxx6XkNXDwJelo0tQ6BDuZD5?=
 =?iso-8859-1?Q?mkIU/BJHRkOicp/Au843F5VzMBRqOGZsoygJCT2aSf3+V3uWUjQohMqVs7?=
 =?iso-8859-1?Q?UztfFkdMuORCRsTCFTxIkqFbZWO7M3IuHLHIHvmtK+F7R2GrBP6vOjr9ue?=
 =?iso-8859-1?Q?T/dldXI6w2u9+qXCx1R30OYzPo9XnePmzskG48LHKXR3omKpmVIOYIID6+?=
 =?iso-8859-1?Q?LpsCF49pyln7XyBUle24pNFmtbY7P/EKFhpoBu3BUKWdYUOie3aXJ+8YB2?=
 =?iso-8859-1?Q?Was4LW/Rae3P0jJPHpLD0a5wi0f7b6tY30ExzcLmm+73+p48UFZMlEjjH9?=
 =?iso-8859-1?Q?DwwL2xolDSHicOTmT5X5H6aZFkj5JLHnKIrQ2TK5UPV8yN9d4REHZOwmIh?=
 =?iso-8859-1?Q?n18xRf+VPW8w5AUZDIAmviWBqhXyX5qIx7PkzViQYf+Arm01YH1rg9/I0B?=
 =?iso-8859-1?Q?gSYiMDJdaUE8F8LKjK7MyloWEDDTro7ADQb0A5MFoHrSFZp5v6STa6hGB9?=
 =?iso-8859-1?Q?ug2QnFyrNQJi6rYvteKfPrXr+BArObBAEwq6hngpo0Z44EkJqebZbwq6qY?=
 =?iso-8859-1?Q?myyy7Uw/I9vjnENaYWSHPlveFx2FZ1PAo18jIb05k5rcYrjeC7du2ZFRso?=
 =?iso-8859-1?Q?akFxnl0gFnvltbMkme6AiG2aaukwLwTr6hqKR0GGx0TJ+W7FLK0zDG8NKw?=
 =?iso-8859-1?Q?LF+NbQ4SAz3jpdwHQcs1Ej1bZ9PuxO8bwbF7kt3jTHZC52ZLZGBeN4su02?=
 =?iso-8859-1?Q?D/zTOTKaFKJYcRI5Kjxwkbygm3EFpDeAbCLLUSg5sLhG9D1nq4lZXFBKfF?=
 =?iso-8859-1?Q?Awpj+QtGjk14UEnijXGlYm46RZPDIa4VkhL8krOAYcHL2SirllOfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qWmsMwWbs2oGET/rOdGkdKhqV8rIKC0dwf+RNfbppOfV61B2heNteDkiV7?=
 =?iso-8859-1?Q?YbMt7RaG2vgg3PfGf/CjwUHmo1jRmxpU4UU8hCg0V1maEWFGJfMhM+aCDK?=
 =?iso-8859-1?Q?/JBSCJkkaAgUy6HvCCLgbmmLIxBZ11KQRQ5QlYrTvRyiRU8YVKL4//darL?=
 =?iso-8859-1?Q?OO9t5wmUv+qxxMYJUuJInk6wwCD+JrgeZOFtoB2khLWqqGkxEHQy0qN0vD?=
 =?iso-8859-1?Q?gZtIVldxi5hp8sNeiwowlvNTmiuRzjA4v6BS0WN7v5N9EqUs5EPGu9/38A?=
 =?iso-8859-1?Q?W3e3iqpaOWGntKeB+zaExw8WEG57lvRR2NiJGEGczHO9lmov/3ILvAB7hk?=
 =?iso-8859-1?Q?D9IIJOQKQjU3KkAmG87jIwGsOk/pcQg9DfYjdF/jbRJUbxTvS6a4KDCxfj?=
 =?iso-8859-1?Q?Bur2e0o51Ph3xbw2PrZOZ4YAcwft1ikG30jKF910FqAcluVFY5C5jPwkMU?=
 =?iso-8859-1?Q?y18T99z3aEDmHivwA+vbL2MRxDHOKncUiilcdGvun/Flr/vgSOj2bzj0UW?=
 =?iso-8859-1?Q?CEWj/wEyaLaSbvIxbWKpyP3woSUAAIgmnYkIYIFfxbXe3iCqR+2QSopH9G?=
 =?iso-8859-1?Q?fVPyx1g5qf8bnOFBAG7aXoWIDmORs72m4BbNZL2owQwvXNVrx66pnjMscE?=
 =?iso-8859-1?Q?ECc8xw5EK2K+lZ4On70TJ+TZ9v+CGfMX6kvIkgMZ2S3brmKyz1pGs0wGVP?=
 =?iso-8859-1?Q?zE3ncETVoqS/1AnLeQZg8+hI92UlM9otYqdgWTBVGx70nsPrawgnvLLUrf?=
 =?iso-8859-1?Q?/l4kkJhJY6uPZYnzNSTi0j4jp2hD+nqVx2TGBOmDFQXoUOiWhDDEfZeCh9?=
 =?iso-8859-1?Q?4K7XNey86s8S5UTxu+tTCU4LpseAFqoRUu849C/V+0B60GZqZ2ontYkPuU?=
 =?iso-8859-1?Q?4gQanZNVarVBHHdA9qh+ewD7rLq5atNM7ulb8Fo/82Gc330wtS1semb778?=
 =?iso-8859-1?Q?IcDi1Yqfd4ZmT9an+gHHfmDfQmbnr6M8ZIYXFhXG9o9NNt3HOt20YfM6cC?=
 =?iso-8859-1?Q?NLy8tmQAf27iEynWerM+jr3Vt/8Rr/b4pYjkvCG5Yq19UG7OfYfOURwfta?=
 =?iso-8859-1?Q?WmVrTzUrCJDKjfD3pnlRxBh47btR3Fo90NsY8VK+9FOKUfFbKZaRlDFHjg?=
 =?iso-8859-1?Q?781e59yzJJ3KA7OWIUo8mVzyajPU0r9R6CtlYD5MtISHGh/AEpWbxRYh+Q?=
 =?iso-8859-1?Q?t6nnUteUG/3ciz2nMDPLee8sV5eoE46fdF0FaJBgDzZnNYZmzpEosRjl9n?=
 =?iso-8859-1?Q?ZzMHjlw9fnGo/wZq0SBpYvctXuUKP1IsIZS5yJyESEYfIKzTDUOWgI0Y5n?=
 =?iso-8859-1?Q?KZhQwAk+upN2U9P8CKfSVw0hguT1Tp7nsOqUU86LLfrZLRc/4HD8HJkHMO?=
 =?iso-8859-1?Q?xtp6etK8UfP7vLJaCEqg4QEdNGD/aIIIU0/ThVNP+J09lkIW5rSUU+ZL1m?=
 =?iso-8859-1?Q?zEIrChC30s+ebguEFP33Xl51mdyCnjwntb4f+5KUbMAVpEnqHUuFAPIi91?=
 =?iso-8859-1?Q?lf/jta5EEC948Q/o3Yb/MKNAG9IGUUio0iiNWTCmfuTla37NC9Zb1wKKnN?=
 =?iso-8859-1?Q?d3a1Wwo2+z8iynILooMh+SjCxQSQ+k+dE3xIm5pq59UpaSuAGytNU1oUBA?=
 =?iso-8859-1?Q?0X0GiuVBx3kaY4YChE6iyqpPH/xZOVqXlaezQNtoqSU0jGATQ/Gr0xdQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54da13c3-c305-426b-ddbc-08dd78739797
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 21:06:41.9161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/czxs+QeYV3qxxBR7m4pgC6vSzNb4HjKNnPN91YzOR8C5LZUAJjRAYsWEDziW6cbBcwgA8cVd9+9xoqkx1ueT3LHzaimpcGmwUlmW6uw3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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

Hi Dave and Sima,

Here are the fixes for drm-xe targeting 6.15-rc2.

drm-xe-fixes-2025-04-10:
Driver Changes:
- Add another BMG PCI ID
- Fix UAFs on migration paths
- Fix shift-out-of-bounds access on TLB invalidation
- Ensure ccs_mode is correctly set on gt reset
- Extend some HW workarounds to Xe3
- Fix PM runtime get/put on sysfs files
- Fix u64 division on 32b
- Fix flickering due to missing L3 invalidations
- Fix missing error code return

thanks,
Lucas De Marchi

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-04-10

for you to fetch changes up to 88ecb66b9956a14577d513a6c8c28bb2e7989703:

   drm/xe: Restore EIO errno return when GuC PC start fails (2025-04-07 14:00:27 -0700)

----------------------------------------------------------------
Driver Changes:
- Add another BMG PCI ID
- Fix UAFs on migration paths
- Fix shift-out-of-bounds access on TLB invalidation
- Ensure ccs_mode is correctly set on gt reset
- Extend some HW workarounds to Xe3
- Fix PM runtime get/put on sysfs files
- Fix u64 division on 32b
- Fix flickering due to missing L3 invalidations
- Fix missing error code return

----------------------------------------------------------------
Arnd Bergmann (1):
       drm/xe: avoid plain 64-bit division

Julia Filipchuk (1):
       drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406

Kenneth Graunke (1):
       drm/xe: Invalidate L3 read-only cachelines for geometry streams too

Matt Roper (1):
       drm/xe/bmg: Add one additional PCI ID

Matthew Brost (1):
       drm/xe: Use local fence in error path of xe_migrate_clear

Niranjana Vishwanathapura (1):
       drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change

Rodrigo Vivi (1):
       drm/xe: Restore EIO errno return when GuC PC start fails

Tejas Upadhyay (1):
       drm/xe/hw_engine: define sysfs_ops on all directories

Thomas Hellström (2):
       drm/xe/svm: Fix a potential bo UAF
       drm/xe: Fix an out-of-bounds shift when invalidating TLB

  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |  12 ++-
  drivers/gpu/drm/xe/xe_guc_pc.c                    |   1 +
  drivers/gpu/drm/xe/xe_hw_engine.c                 |  12 +--
  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c     | 108 +++++++++++-----------
  drivers/gpu/drm/xe/xe_migrate.c                   |   6 +-
  drivers/gpu/drm/xe/xe_ring_ops.c                  |  13 ++-
  drivers/gpu/drm/xe/xe_svm.c                       |   7 +-
  drivers/gpu/drm/xe/xe_wa_oob.rules                |   2 +
  include/drm/intel/pciids.h                        |   1 +
  10 files changed, 90 insertions(+), 73 deletions(-)
