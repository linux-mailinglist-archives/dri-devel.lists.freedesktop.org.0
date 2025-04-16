Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E1A90CB0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 21:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC93210E06D;
	Wed, 16 Apr 2025 19:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqVNhFs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6C310E06D;
 Wed, 16 Apr 2025 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744833475; x=1776369475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oA0+UMN9aRMg+nWUjilLbXjlJVY1DQjiPjajOu8XGAk=;
 b=aqVNhFs7U8M/Fb/B/5kWFPDfJghQYStDR02mWpl/pxXjLcns809Pykgx
 15GAk0+39KdCw4R18aZABoZjgRIiaGcAHqPKlDwx3cB9009r6tyW9lHyf
 M/WUnOxL88tYPbW/eUSrRFFoOcYxl9pTPoG/pEBAOR4bQtsrRNUiUSoj8
 n0gey5yBTtlKyofICGvGYzJGRfjVFXWx7XvSlLMIZT32jnV8kGXgAHuqf
 7O73rc1PJ+9SOWzSHAg6oxNx5OdWYJpS8X6B1/1Bf9JNa9XnnQ6EAaOix
 yAVSJkMEAuS4YtVHoBkZ/rbdYQarq3PdBwUqyIJy8csqXCwg69mTeQtSW w==;
X-CSE-ConnectionGUID: iAq7UDJATLq9Rsqp7Y/PBQ==
X-CSE-MsgGUID: 1zoWS1H/TAGPuyrB+t9Jxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57066497"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="57066497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:57:54 -0700
X-CSE-ConnectionGUID: GnGMw/idS7qswfXaS6+R9A==
X-CSE-MsgGUID: kTguVps6Q8e12hoDD0XcLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="134689410"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:57:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:57:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:57:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhV02SyzOcCyqD1aOz9MrlsW/99pfNdEyiO6JJCPN+t0kjViXpAplmo57HCnkg8clMk5NMJQ/Ge8PuPvz460tDG3Y7UlRx8zFcVtG61e27cLjHt4PElgiZW4DwWXjM3JHoq/aX4SpldcRn14gccA+0rUmWMu0vhtAIDfbhfuxGHs0VE/BDGhpyDfDr9VXc1gdbdGgo7YOA1tzeYBdcMdsY46btYpfnngVPvqeQ99oBaMXABXtNOrvxnIW4XBkv5yEstV0jn3mm800uKk6I8zb+Bn/lauY1cPJAQrFlq1mKnIqaBf8Eh9gYUUFZaRqOHS6vUZYm54RD0xwaohZ5mGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMSbgfNzuPZVpNq+gu/5FI04/b4kUlnnzh/02MhG0x8=;
 b=JtdeYTpnQ/S4pfxZEv5G3d0rK1bBfiayU2eiPvWAcHnCynixEcP0+jcXz3pJ3VcrBN5XnJwrFwZMTa65fFQHWlREpIfWVc1RyGihFD5tggq9XGjFHwKOH/LPmYyssgB5ax7YUJ7jdn13LycQI7LnHQ5rjWSYCThYjO9HCruV+IiHUgV8ADAYCh/eIaozY5lqGNlt0GHY8b89jL6vcwNgz8pwNSw1d6eZVPZyqfWWYeEuGjgZwZ/CtRyEqa3pN0kfmx/G51obQBOxsiLoVJydb86BOJ0ATuHM7Ucu9aPHvrIALgVAGUu49smG+8H0h9gcEpt2yeIRCzuAbec1219w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 19:57:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 19:57:49 +0000
Date: Wed, 16 Apr 2025 12:59:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH 0/4] Enable SVM atomics in Xe / GPU SVM
Message-ID: <aAAMDFKLdTkdI3Ln@lstrano-desk.jf.intel.com>
References: <20250416181107.409538-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416181107.409538-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 704af0d9-06f0-4435-1a1b-08dd7d20f715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CRJEDlb3Kp5nihTanj9AALqOEnqEZW97KvvGJmlmS27GUvxWivZKWQFkcnv0?=
 =?us-ascii?Q?qz9SnN8t9v4PeWQ6/ItsQxnUaImtI6m8VTJHOjaVY4sxYjvK/CwG2FZFoCsD?=
 =?us-ascii?Q?qVBQjvUlEA+go/euDYNuNyMo4UfhsMxl46hAHdqulizJCUvDD/dfj7WIPEeP?=
 =?us-ascii?Q?OLayOOYskcc4LtUalNeobsZ/RpmNGyXGGv9AMmLjmwqSH2Cs+hlfneneBZGx?=
 =?us-ascii?Q?riCBX+5XPLie2Sr2zEl+FE85FB2kch/i+Sbdnh3Z4rvBNgMcMgotNMlMyfQt?=
 =?us-ascii?Q?scognfk+wNHPRrUOl5ARpneBA4Ac8HN255wNflalP2ttVTdJFGILy64dPb41?=
 =?us-ascii?Q?9+rGw0tCNCjfsFShZ6WrkyuSi8odzfvUyj12aKF4KdlC3fkInD4qLBT/1S4r?=
 =?us-ascii?Q?cmmAW5DpnxLjKkp9ATdkeVYhLEo2CI+QxT2tVJ+DJdWa6wK4O+4y0HKYxo/y?=
 =?us-ascii?Q?JgcIS5AKw741oZm0+9h8wv1YfuaMQqjG8tZyHTMHvkNDTaC2PwfaektWQfOA?=
 =?us-ascii?Q?aASAF5nhJX4/J37NFSJiORp3uFcX2oOXW9CI6699LG2cZQXXDdmADl8QrUZu?=
 =?us-ascii?Q?SBR4qC26iHfVXtgzlvbI2AQT7mHlq289sZhoVliZzZqh8IfBgGcTrGUsWwZy?=
 =?us-ascii?Q?3A2cCY5Pxd713WEkgMNkIaKpxME4WfjmDDpy2flq9mhqXbwIUG/nL8Npj8NB?=
 =?us-ascii?Q?xOtmaL9YbXtXKio4xq5PC9E3Sgglu+xZgSuHvAeswrkckuTicSkokqxuEImH?=
 =?us-ascii?Q?nwYTmDfOttbKnhL7S4J/nnsjvRh0f3R4qVGNzCYKtw5rWN+pX0qArQEzfjtD?=
 =?us-ascii?Q?y+0udEDtB4roabCr2CPjH8Rigi+uwvP74Enz0Mh9TSZgUOQ41NvGV0A4dm0c?=
 =?us-ascii?Q?Qn7cF6V69G8huqCJh+T8iMZ93OYs/6S0esGRnMl2z79jakUEl9EKsANLYdA0?=
 =?us-ascii?Q?pbrQGVmIyjiGTRaXGkJgooX5ZSYPUMkj12c+6SNMARNSXby0M4o/cKm8T5f9?=
 =?us-ascii?Q?z8+f+2+ApxWMhFgVjcQ3xelrpV2GHr4R9wnKJdHSUlszd1xG/Sg2btKY4bJK?=
 =?us-ascii?Q?caWbaxbC8E1TLfHHrH4nSZhsD5Tq4Gurm4nQAox70YRhTg2HYf0K5WeIR+VY?=
 =?us-ascii?Q?B6CUnwZoBzWoXn4nujyxJwUfSauPJ4te0vbWTv/Oj8lqPC+QVYDGJs3dapnj?=
 =?us-ascii?Q?AQLMf+od0JKspF+VvERWZToJyNgUMkqLk3/RRGO1c2mY4moXx1OnnC2IORpk?=
 =?us-ascii?Q?7wXyafKm5dzkDYZgAoM6WDlZRlQQIDSkGqnXC34HzVbrt0jAFFuIkmYAyr4a?=
 =?us-ascii?Q?u1v1UtAUeQqRITzifbraGHA2NiHsMQFDxNM3jcb6nYexVVkcuAQ9uyY2Cb64?=
 =?us-ascii?Q?s4auhBSQ+J9kPdegUoVKvnBHqhE+YtT+ROLa7h25cw/urUUr9Mom6eIxgh4r?=
 =?us-ascii?Q?UfUX+J2NPEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkaYAqD+kjcV5MW69K4QhXW2ysnIzFCw/ZFbhHnG7qjMX9SE3hGR7ddas/l4?=
 =?us-ascii?Q?Y2elNmECLD8/1QNV5PI/Z3Jc1gHbYlE7bT5OPvKy8J5+cMMo0D5ZV+tHEvOj?=
 =?us-ascii?Q?DXCoJ+MA9P5iODu3GNHlCKFMQp42KvzZu75F1yOCOFp996mdLYy6afkOio+O?=
 =?us-ascii?Q?J+5wruxfYTpBpxEMMM6FbdYBFBJmjXk+CeypQm+UHc8jhXwp8Pz+OEfknFKR?=
 =?us-ascii?Q?OBO03DO2qbSEBeVK6LP83o6wC0uuPe/94Hq1ncBIjIuJveUEeWm1tC6dkyst?=
 =?us-ascii?Q?WhOB5Omc1tHJ+Ra7Vbe0+IzuthON93x3zZq3wuOS69yr8v3LU5guJRay9+RL?=
 =?us-ascii?Q?wrNC6GEyO+ZsQSVI8jeIAVWRq905mctCPYC7EM/JxASsgRVxY0bPWVF84Bko?=
 =?us-ascii?Q?CL4Noiv9njKmMNFSlsHy1/au4ulOVOsIqHYjjLXprCCdBI/ib7pMQVSbS79m?=
 =?us-ascii?Q?Fp0mBNCz0pZoicAscF17EKD29kvHSJ1pG7zSGHzXdnTLUHptIZb06eTB5Osk?=
 =?us-ascii?Q?1UJ6yBfM+KfO6FUain7Gr2WC8EhyH0Zq+7TG+M/ggHyGD4JRjy/GAh3opQvn?=
 =?us-ascii?Q?3WeTIHcLXdSyOwVdOki/eFGSEDNCfFtvPI9ZhVgkbI/Jypx5aUHY0tBW914i?=
 =?us-ascii?Q?lqA1v40A9aqzZVQY7bQWHPJCmtor6awmNJFvSlgaF9e8vpeuH7asze2Q+Oax?=
 =?us-ascii?Q?+HIKQUcvjP76tagissNEkvDppoxYhHytiFFCVIelHGZLr/FlsqLx9BbWhsEH?=
 =?us-ascii?Q?DfUqBWLxypdPGqhLigS7pOUSTH+1nk5S/3TxqK+LdWEXumI6XMTyJP9FyOk3?=
 =?us-ascii?Q?+vifT8DVjXninunrLJtaURORc9vIgNCk0UprptMuK8lHV0xoA7jkzsSCYZkW?=
 =?us-ascii?Q?HuU9dOrOsVRWySotmR+C/kPNCgytndl1fzzndvlbufylqVOlFYa3daUND0V9?=
 =?us-ascii?Q?h+0brKgTy5+EvXC8kbTd2DTPZMmL5hj3iov8z6Xje9nKv3w97m8HO7qIL72S?=
 =?us-ascii?Q?6PjQVwfAxwclvOAgZlbTjSagbP4/s92phvEs7NIHkvB3pGx60R7NO/er6AEj?=
 =?us-ascii?Q?29kiAIjHM8wfWT/h/Q9s/g8FFtygPfsre9GBxwbJZfKOK+lwf6bgcm1xNFp4?=
 =?us-ascii?Q?ykrbCQqU1Fq76xcONx7KeO4lcbZnxgtoLtd3FvCBHzlTKVMYnfYFU9azOIXY?=
 =?us-ascii?Q?jx+j9CQdRm4mM67KV+3Izz/CnHDYSjckXuu7/a2zFXcOaZFFIpaNm+hmL2Ty?=
 =?us-ascii?Q?sLsy8uGvc0QlC0mY7a5/tBYSLR3ro0dHjWsCD6ktFTzKc5JO0m5+4/8hZC1u?=
 =?us-ascii?Q?3kRKVChGRqht4gBie601aH/choQGs+5yuLSzPoFf/ysOHrsk2eIZZcF16/Ws?=
 =?us-ascii?Q?SI+4EjbnnhAvB3lKWldWWBiXeYNqGKyRTUC4uGh2a9beS1JamdSA/7Eoxepg?=
 =?us-ascii?Q?apwQTuoq0LPDYtsKrASwnNBoWkp2jEsHKnwh6GuNwmq7tGrTl9q0cedag9W2?=
 =?us-ascii?Q?oTQEZAs0tNkVb6R+IM2Yz/nqxw/QsLa15vNlfi9Ra2PAL37fKfZVpPVqNVpQ?=
 =?us-ascii?Q?6EaPeZhsseDXnJMzDZbIDcUR81S2picSRZCrROyeDH3DT00vHQ2PaW8a2yjv?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 704af0d9-06f0-4435-1a1b-08dd7d20f715
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:57:49.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q690s7rnNfQV/xr8FoJTbbqtfbWmbIqwXsukCYG6ugLr52zkAdcXULLlDLy3e48SsVUopulUObBcjmCyGj3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
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

On Wed, Apr 16, 2025 at 11:11:03AM -0700, Matthew Brost wrote:
> Minimal set of patches to enable compute UMD SVM atomics.
> 
> Collaboration with Himal.
> 
> Sending as RFC to see if we should pursue merging this series ASAP, the
> solution of timeslicing may not be the final solution but it is quite
> simple as a stopgate / software enabling.
> 
> Matt
> 

Something in series broke processes-evict-malloc-mix-bo, will need to
fix that.

Matt

> Himal Prasad Ghimiray (1):
>   drm/gpusvm: Introduce vram_only flag for VRAM allocation
> 
> Matthew Brost (3):
>   drm/xe: Strict migration policy for atomic SVM faults
>   drm/xe: Timeslice GPU on atomic SVM fault
>   drm/xe: Add atomic_svm_timeslice_ms debugfs entry
> 
>  drivers/gpu/drm/drm_gpusvm.c         | 14 +++++++
>  drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_svm.c          | 58 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.h          |  5 ---
>  include/drm/drm_gpusvm.h             |  7 ++++
>  7 files changed, 108 insertions(+), 18 deletions(-)
> 
> -- 
> 2.34.1
> 
