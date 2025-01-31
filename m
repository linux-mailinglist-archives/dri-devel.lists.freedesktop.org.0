Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F42A241E5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 18:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A1810E40A;
	Fri, 31 Jan 2025 17:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfg8sBtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8367B10E409;
 Fri, 31 Jan 2025 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738344589; x=1769880589;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d4OPAEEzI58zpfJULQB0+UJeZa1JU5BmGkVBkSx/PYQ=;
 b=mfg8sBtNyg4lBx2YQRvp5yjihBMyAHk+BUNq/no61Z/PCAzILepP2z7q
 13c7984EQ01kMgYiJOYBGOmsmv9HuZyzjPvNBfVnjID1sSpVUduv/9Axl
 jLzhmFKzS1BVFHno3fWpSGjFAaViwE/xaj/GFym3FM4Bb0+V8ychBZf73
 IiwEYxTIgwhf6HHlZ5YCZ/N+ZDoGATEWasNvBvh139OGqGnolRf/cg3xC
 2l1yTVRnKv3Y/Y6qpoOfzh0j1GyqwPVI27UTYF68tCaiqKOlQfBekP+oS
 +H5GMD/vO6zmFFQEYB53k5rtoKC7+/WmimqUVWmUzHK0o8Qv4xgysbsL6 A==;
X-CSE-ConnectionGUID: 3gYprAMBSfeG0HbTYgis7g==
X-CSE-MsgGUID: I/MOhFOLQXWydn/oqn3pAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49178139"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="49178139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:29:49 -0800
X-CSE-ConnectionGUID: 6bg20U/5Sr2/m1zuPi0sFA==
X-CSE-MsgGUID: pDgOnyHUSVOTcNUD2tZmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110134765"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 09:29:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 09:29:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 09:29:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 09:29:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJRH92INP9CquhxRA0HysDyTIpKx40UyaiChh4A+7HFIyXIWcyl9NrGHy/Kp6V2hoYTTfS+XfOX1xiDPoNquoAlXnhP+NOuEdW0OjX7suZNZ3JRoY7/SYR30KB1UqIAcKjg8sN5mBmaq9AmaHVUjzNxvDL1Tg6CkX2HyTee9cGVgX863cznCjLltkSQWIayYONCXmD2c+b24ExJcxqqZOVSZ68hjzyoSiD8upDrsiA7BdPDqHMhfarE9xmG4FsZ7lln2K6m+7upXhs3WOYdERZASRb5alr7wvWUjGnM0OuP5X/LPwNTUPJDa3APfisqeDEGIyDLp8jWqGcdlkabvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgzMFIPNJFT2Wp9haCb/H3iXjM8fWkGkNJgmEWAM+Ew=;
 b=kG7uy2IqN4XxniQVnLnDNeJUcqeHdxmxv1XbnsE5r51Lh51bj0kTMHZdl8uy2pi7CJgG123Wh6PfUCCqEkesLUwDse7pMy4f1qaSNVPg1+N+tricpd8qmXD6RB4ECz+JR/AYm+VWw3vXD16ognEi7/XkT0aLnb9JNhxY2jx40DnsXXIfUJ4oU6oyhsQ8u+yA3u87M1LvTqdHq4kXksGorShDTaonchbpSOpfFKDOARID4bo8q7e28RM0zpfZWJCyYNNBugkvmZAK/cYEZzZOEKstl3z9fKbPFRgbG7Ry9POgpwAIOf11EBySgBFM8xJ4TrVfC0yGBIhQczPkJcgpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 17:29:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 17:29:11 +0000
Date: Fri, 31 Jan 2025 09:30:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
Message-ID: <Z50IoPSBZa2mKm6z@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
 <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
 <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
 <93473543-9536-46f2-aabb-ee5e4dca60cc@intel.com>
 <Z5u3YyxWSGvDONl5@lstrano-desk.jf.intel.com>
 <f914f280031adb68dec28e61badf9033da2bfd64.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f914f280031adb68dec28e61badf9033da2bfd64.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca9f95d-b9c4-43c7-35aa-08dd421cc67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NFjEUQx5U5yoiIzAmcXFTit97Gg0UFIPlxrXjN6ZuN8eJi+Zg+FBDwlafm?=
 =?iso-8859-1?Q?QnMrr7mQ/WxBn6obh+CWX+AXBJD0oExF0YqZ5oMvNbVlDzege28fGTSb/N?=
 =?iso-8859-1?Q?b2Vef6LuDAyjwVutE9Im3k77QQk7rWITDVH9k41SyWW78Cj/hjKMxi6RTa?=
 =?iso-8859-1?Q?aWZrPUELXjG4Z4hKOF13vEEu0vnnhl/+/vpSryAtGq4YNND5T/Y0SL2q01?=
 =?iso-8859-1?Q?iKCTQWQdKnB78kBOLSX1/03OC+ycAp99J3ZmZpchBvcMVcYkfB5loXoyev?=
 =?iso-8859-1?Q?JQGnRs6a7FXLSi2rSEfaafPnAUl+tMwvANUw63oaJF2ggSqtKcX30eL38W?=
 =?iso-8859-1?Q?A3OK1HUGVjQpSkTfIfs3Te5MELBz/4neRgpQOEJHt4GacP6Rt6Pu4CxDlA?=
 =?iso-8859-1?Q?RA+YcH0gwrBkMc3UvRL1hZtRApoZq07jV4MqC7+l/2QpqT2GpyC0yMaali?=
 =?iso-8859-1?Q?PL/OMwk40dEiHMdHT8l9al6wOER6Qpez2dB0kSH6V20TJjZjgFFwIiUJ8C?=
 =?iso-8859-1?Q?lIXZp92U8RAhPokwaIiiGORmMXgodGBcKWq1kaYU0Tt+s6ZanCV7XtSXV/?=
 =?iso-8859-1?Q?iewBHdxcZRV/1futu4RKXIRVOEA5J5qbyLSUxh7Beh7Teig+g5q4+bfdR2?=
 =?iso-8859-1?Q?30aubx0SVqYpFRiFyOENvEOF4Zkf9BBkwvzFfrr0yKcRHv5aQHveyM0KcS?=
 =?iso-8859-1?Q?EnwjvUuCTQq5pflBy2I1UxCJ/6tzIkvY1vIrpsEio1BBWceatRhPI9opTU?=
 =?iso-8859-1?Q?UxEBwzNeDYqrpL6m2QfGRpKxPVyQzTUfXkzh/vYn+BP3yPurDF0GV8acrw?=
 =?iso-8859-1?Q?ID1HZQBF6MYBr3UHSXwVd9od9ichal6hXHLCAeh2BBoY0ffXYGT0x/1Q1U?=
 =?iso-8859-1?Q?AZ7yC50+hmFCFmxkoOJTbyMD1pbCFUpslgGxB2TQOhE+cBzeSimMiYmUR1?=
 =?iso-8859-1?Q?t5TSkjR7yeB7n68cCixz1CPiwL4VJgr6HWlY5vCxdOb+X405W5T4qMIM1W?=
 =?iso-8859-1?Q?CJrymdcpdTXEYwaci2ap5F87xAToXQiPuWOOduYQ1f5ddCQeuennM2uYMx?=
 =?iso-8859-1?Q?6o5HYceaxiVFcnEnF8rI+ulFJVpxQMEn5PtIKrmDMSEFTWGhVli+MuN0q4?=
 =?iso-8859-1?Q?Xm0sEC9T37gfbweV9PxvVYrOXA/J3mhdtWycBvDpSk5GjEFmaWAv6FfB1c?=
 =?iso-8859-1?Q?3g2ljXiUkKBXS1Kl1zQ+FKJH7eitaN1OZwTiniyXfGh2+ikdkvh3GNTtEf?=
 =?iso-8859-1?Q?CICPvuNnTgO1OAZdSl6dXMRVmX9GcvJbTuPSaCoySqBWZJzVmRp2Y2yNDY?=
 =?iso-8859-1?Q?KYeMnLwb7sUqrFFLZtOQc68E7wRXA0LmmStKVZKAb+ELxEu28WDbPzPbox?=
 =?iso-8859-1?Q?xFKOE5j3tPnQTe97DdtAbJLGnmp4HePg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PEnEVg+h/09ZY1ymvr2Pmp/9WOKzfRxodujopaYjn+C0/84wC28sv0ZhmP?=
 =?iso-8859-1?Q?Oyo0KZ6yKaIixyvCaXjduUafus9XtS7fVnSYsCmAzH6X5db/UrRvFc07te?=
 =?iso-8859-1?Q?udQmm86oYJlXDukVvOn+3kvITE/dxkv9y1phD6QKH9OZLUvHTO24POvvgC?=
 =?iso-8859-1?Q?l/pP4b1wAmuFMS+Jp5EsOJ8ClUWfXtZkn3m/H2kpUdMhqqDT4eAYakAQSR?=
 =?iso-8859-1?Q?hNy/SoA0e8u9xwVFl9AF+HYskzpXb2urhU1Xyq9X6ZGBwjeIkB5nYaPvz8?=
 =?iso-8859-1?Q?snIbNJQ3/eEQAl9DcHt9xSZQ+5CDQzJRUmm/U68uYjv2r8klZfaz9qHgRd?=
 =?iso-8859-1?Q?bjASkgzloBhBmwUzSGHGx/Egg9TZfa4JQ+xsF+Rj9r6l0gPVEWJWF7kRFC?=
 =?iso-8859-1?Q?0EnVnp2rARWmiOEbTKsr+JUA3olUHPsoVCQWhWSYO1Os0BvNiN1LuDxZpb?=
 =?iso-8859-1?Q?0UBw0vY4MBh8MOYxoGZl/Cfm6/RNayFb02Qo/TGdH5OiAsbPI5/vc9D4z5?=
 =?iso-8859-1?Q?CWjoplsjMd2FlWndLSNsNSKbYsQhHEjWFPuYXxYsI0jy2x1fBEVro8ieGk?=
 =?iso-8859-1?Q?E5ouVb5MVSXWMgaZo/xyG6FkvarfotVvApCD1yOhzRzc8ois3rOQk9Djk4?=
 =?iso-8859-1?Q?ZOEmB/RWCgez/SGbORGm3PVXFaQK3dEfaH9FYf1HwII5Zv/0G+L7FnCU6e?=
 =?iso-8859-1?Q?Rcl7YQdxsybARNi+tYGPB0rYI7/qiJ+ZuCAhbVajHTMSCmwcPTbouXtaV0?=
 =?iso-8859-1?Q?58z4/B4d6Uawe5cYPqK4l0AWduLOSDkbizLPscSPk7P8KHHzMF48BUqSqZ?=
 =?iso-8859-1?Q?QOJ/Mov1IHsVS7ZwFoYMgcmqIr+TpXxf7AsWihW+5OKGRVp18exz77pZyW?=
 =?iso-8859-1?Q?Q6ltXZdG6Qlkdvt3jh1uQIUKi1h2GxFyYg28YhtJMCW8KSk37sCPAJLE78?=
 =?iso-8859-1?Q?wK4hRXqNqVuA15isftQTUruE1FYjUoemD/bPpncbEIjA6gEKS8JqehnO8Z?=
 =?iso-8859-1?Q?dq+0jGOpe9NoWgWjluYP63IDJ3JZrrkoip7oANdheCR6S9o1WvL/xyT54K?=
 =?iso-8859-1?Q?n794uGooNn/+AkJPCWLVfXTUl72RUO8UON4HzJ3Vj/xZrz8bQcC7E7V5GP?=
 =?iso-8859-1?Q?TS6vIfN8fvkeCmzhza1WoNAksN8JJo/4htO8x7ryViaMxboK2cgtCl2G80?=
 =?iso-8859-1?Q?NV27wUo/N8phnZRqL7hQNa6LiDArWKvMxbrbv4lQYekSxjHqA/00ofn4A3?=
 =?iso-8859-1?Q?WZ5lEnlGKrS85erwC9WiYntTYzZ9SAoqwH/we47Pv9qg0yNPWYMXSRYKLM?=
 =?iso-8859-1?Q?6Zjzg+nhf4inHJsZWD/BnicaR3ouwO6WzQT582PZ4NvekLg1Kv2Rzky/Er?=
 =?iso-8859-1?Q?UzJ37zdrPTlKiaLly+tdF4rl1bRi+DzSj24dwyQDZOVawv7CO+5rM9W/P8?=
 =?iso-8859-1?Q?yxB6o5YCwPuGJhBHtAehq8JzUrE1TCxuoqfawWsjdl89NUz2pTFZ9JI9QT?=
 =?iso-8859-1?Q?aY6wmsxTSceSKBjDLzkiHF2dd5efX95zJ9sY7tUwah8BKUs/GX106cdc35?=
 =?iso-8859-1?Q?fPrekOHcBpp8fPMA7jo7M/21u11T6X52DGGX03RVoO8X20J9bdfuAnHf5q?=
 =?iso-8859-1?Q?tz2pmhscXJq0oq4lJRisPpqdZBb+oEO4bObrtx/ZDbkTiFh6/+O9gtJA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca9f95d-b9c4-43c7-35aa-08dd421cc67d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:29:11.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmKmWXtwdluecUawlPxGCL1682rWs6cO1ATvJG3zIop613rHb6htvbtVf7EmeqnZNz9HDHFXqNMm6tRt4i4UPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
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

On Thu, Jan 30, 2025 at 07:51:49PM +0100, Thomas Hellström wrote:
> On Thu, 2025-01-30 at 09:31 -0800, Matthew Brost wrote:
> > On Thu, Jan 30, 2025 at 04:56:39PM +0000, Matthew Auld wrote:
> > > On 30/01/2025 16:32, Matthew Brost wrote:
> > > > On Thu, Jan 30, 2025 at 02:22:55PM +0000, Matthew Auld wrote:
> > > > > On 29/01/2025 19:52, Matthew Brost wrote:
> > > > > > Migration is implemented with range granularity, with VRAM
> > > > > > backing being
> > > > > > a VM private TTM BO (i.e., shares dma-resv with VM). The
> > > > > > lifetime of the
> > > > > > TTM BO is limited to when the SVM range is in VRAM (i.e.,
> > > > > > when a VRAM
> > > > > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > > > > 
> > > > > > The design choice for using TTM BO for VRAM backing store, as
> > > > > > opposed to
> > > > > > direct buddy allocation, is as follows:
> > > > > > 
> > > > > > - DRM buddy allocations are not at page granularity, offering
> > > > > > no
> > > > > >     advantage over a BO.
> > > > > > - Unified eviction is required (SVM VRAM and TTM BOs need to
> > > > > > be able to
> > > > > >     evict each other).
> > > > > > - For exhaustive eviction [1], SVM VRAM allocations will
> > > > > > almost certainly
> > > > > >     require a dma-resv.
> > > > > > - Likely allocation size is 2M which makes of size of BO
> > > > > > (872)
> > > > > >     acceptable per allocation (872 / 2M == .0004158).
> > > > > > 
> > > > > > With this, using TTM BO for VRAM backing store seems to be an
> > > > > > obvious
> > > > > > choice as it allows leveraging of the TTM eviction code.
> > > > > > 
> > > > > > Current migration policy is migrate any SVM range greater
> > > > > > than or equal
> > > > > > to 64k once.
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/series/133643/
> > > > > > 
> > > > > > v2:
> > > > > >    - Rebase on latest GPU SVM
> > > > > >    - Retry page fault on get pages returning mixed allocation
> > > > > >    - Use drm_gpusvm_devmem
> > > > > > v3:
> > > > > >    - Use new BO flags
> > > > > >    - New range structure (Thomas)
> > > > > >    - Hide migration behind Kconfig
> > > > > >    - Kernel doc (Thomas)
> > > > > >    - Use check_pages_threshold
> > > > > > v4:
> > > > > >    - Don't evict partial unmaps in garbage collector (Thomas)
> > > > > >    - Use %pe to print errors (Thomas)
> > > > > >    - Use %p to print pointers (Thomas)
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_svm.c | 99
> > > > > > +++++++++++++++++++++++++++++++++++--
> > > > > >    drivers/gpu/drm/xe/xe_svm.h |  5 ++
> > > > > >    2 files changed, 100 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > index ba1db030bf33..fc030855d078 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > @@ -502,7 +502,6 @@ static int
> > > > > > xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem
> > > > > > *devmem_allocatio
> > > > > >    	return 0;
> > > > > >    }
> > > > > > -__maybe_unused
> > > > > >    static const struct drm_gpusvm_devmem_ops
> > > > > > gpusvm_devmem_ops = {
> > > > > >    	.devmem_release = xe_svm_devmem_release,
> > > > > >    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > > > > > @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct
> > > > > > xe_svm_range *range,
> > > > > >    	return (range->tile_present & ~range-
> > > > > > >tile_invalidated) & BIT(tile->id);
> > > > > >    }
> > > > > > +static struct xe_mem_region *tile_to_mr(struct xe_tile
> > > > > > *tile)
> > > > > > +{
> > > > > > +	return &tile->mem.vram;
> > > > > > +}
> > > > > > +
> > > > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm,
> > > > > > struct xe_tile *tile,
> > > > > > +				       struct xe_svm_range
> > > > > > *range,
> > > > > > +				       const struct
> > > > > > drm_gpusvm_ctx *ctx)
> > > > > > +{
> > > > > > +	struct xe_mem_region *mr = tile_to_mr(tile);
> > > > > > +	struct drm_buddy_block *block;
> > > > > > +	struct list_head *blocks;
> > > > > > +	struct xe_bo *bo;
> > > > > > +	ktime_t end = 0;
> > > > > > +	int err;
> > > > > > +
> > > > > > +retry:
> > > > > > +	xe_vm_lock(vm, false);
> > > > > > +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > > > > > >base.itree.last + 1 -
> > > > > > +			  range->base.itree.start,
> > > > > > ttm_bo_type_device,
> > > > > > +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > > > +			  XE_BO_FLAG_CPU_ADDR_MIRROR);
> > > > > > +	xe_vm_unlock(vm);
> > > > > 
> > > > > What was the trick again to ensure eviction is not triggered at
> > > > > this point?
> > > > > I thought there was some trick with eviction_valuable() but I
> > > > > can't find it.
> > > > > 
> > > > 
> > > > I dropped that given the hacky nature of how it was implemented.
> > > > Yes, it
> > > > is possible that we allocate VRAM and it is immediately evicted
> > > > before
> > > > the bind occurs but in practice should never really happen given
> > > > this BO
> > > > should be the last entry on the LRU list. Even if this happens, I
> > > > believe this is harmless given the bind will abort and trigger a
> > > > retry.
> > > 
> > > Looking at xe_svm_bo_evict() it wants to use stuff like
> > > bo->devmem_allocation, but that is not set up yet?  For example
> > > dereferencing the devmem_allocation->mm from there will potentially
> > > hit a
> > > NPD?
> > 
> > Good catch. I think drm_gpusvm_devmem_init at least needs to be moved
> > under BO's dma resv lock.
> > 
> > The multi-GPU work Thomas is doing will even expand this scope
> > further
> > to include drm_gpusvm_migrate_to_devmem under the BO dma-resv too -
> > this
> > was ommitted in this series given we'd have to rework the mmap read
> > lock
> > a bit too which I'd prefer to wait on until his series.
> 
> TBH, I think all pages need to be present in the CPU page-table before
> we can release the dma-resv lock. That will ensure the eviction causes
> an invalidation later than the migration invalidation, and everybody's
> happy.
> 

Yea, perhaps. Certainly this is safer but I think I reasoned it actually
ok given 2 opposing migrate functions lock the individual pages before
the migration actually happens. We'd likely end up hitting the retry in
the eviction code though due to partial eviction.

I do agree in general with taking dma-resv lock here for safety /
simplicity.

> An alternative until the multi-device series lands could be to pin the
> bo until the end of the function. That would avoid the locking
> trickiness.
> 

I'd rather just rework the locking the structure with the mmap taken in
the Xe layer + a comment indicating moving this lock to a DRM layer is
preferred.

Matt

> /Thomas
> 
> > 
> > Matt
> > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > > +	if (IS_ERR(bo)) {
> > > > > > +		err = PTR_ERR(bo);
> > > > > > +		if (xe_vm_validate_should_retry(NULL, err,
> > > > > > &end))
> > > > > > +			goto retry;
> > > > > > +		return bo;
> > > > > > +	}
> > > > > > +
> > > > > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > > > > +			       vm->xe->drm.dev, vm-
> > > > > > >svm.gpusvm.mm,
> > > > > > +			       &gpusvm_devmem_ops,
> > > > > > +			       &tile->mem.vram.dpagemap,
> > > > > > +			       range->base.itree.last + 1 -
> > > > > > +			       range->base.itree.start);
> > > > > > +
> > > > > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo-
> > > > > > >ttm.resource)->blocks;
> > > > > > +	list_for_each_entry(block, blocks, link)
> > > > > > +		block->private = mr;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Take ref because as soon as
> > > > > > drm_gpusvm_migrate_to_devmem succeeds the
> > > > > > +	 * creation ref can be dropped upon CPU fault or
> > > > > > unmap.
> > > > > > +	 */
> > > > > > +	xe_bo_get(bo);
> > > > > > +
> > > > > > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > > > > &range->base,
> > > > > > +					   &bo-
> > > > > > >devmem_allocation, ctx);
> > > > > > +	if (err) {
> > > > > > +		xe_bo_put(bo);	/* Local ref */
> > > > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > > > +		return ERR_PTR(err);
> > > > > > +	}
> > > > > > +
> > > > > > +	return bo;
> > > > > > +}
> > > > > > +
> > > > > >    /**
> > > > > >     * xe_svm_handle_pagefault() - SVM handle page fault
> > > > > >     * @vm: The VM.
> > > > > > @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct
> > > > > > xe_svm_range *range,
> > > > > >     * @fault_addr: The GPU fault address.
> > > > > >     * @atomic: The fault atomic access bit.
> > > > > >     *
> > > > > > - * Create GPU bindings for a SVM page fault.
> > > > > > + * Create GPU bindings for a SVM page fault. Optionally
> > > > > > migrate to device
> > > > > > + * memory.
> > > > > >     *
> > > > > >     * Return: 0 on success, negative error code on error.
> > > > > >     */
> > > > > > @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct
> > > > > > xe_vm *vm, struct xe_vma *vma,
> > > > > >    			    struct xe_tile *tile, u64
> > > > > > fault_addr,
> > > > > >    			    bool atomic)
> > > > > >    {
> > > > > > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > > > > > xe_vma_read_only(vma), };
> > > > > > +	struct drm_gpusvm_ctx ctx = {
> > > > > > +		.read_only = xe_vma_read_only(vma),
> > > > > > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRR
> > > > > > OR),
> > > > > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRR
> > > > > > OR) ? SZ_64K : 0,
> > > > > > +	};
> > > > > >    	struct xe_svm_range *range;
> > > > > >    	struct drm_gpusvm_range *r;
> > > > > >    	struct drm_exec exec;
> > > > > >    	struct dma_fence *fence;
> > > > > > +	struct xe_bo *bo = NULL;
> > > > > >    	ktime_t end = 0;
> > > > > >    	int err;
> > > > > > @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > > > > >    retry:
> > > > > > +	xe_bo_put(bo);
> > > > > > +	bo = NULL;
> > > > > > +
> > > > > >    	/* Always process UNMAPs first so view SVM ranges is
> > > > > > current */
> > > > > >    	err = xe_svm_garbage_collector(vm);
> > > > > >    	if (err)
> > > > > > @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >    	if (xe_svm_range_is_valid(range, tile))
> > > > > >    		return 0;
> > > > > > +	/* XXX: Add migration policy, for now migrate range
> > > > > > once */
> > > > > > +	if (!range->migrated && range-
> > > > > > >base.flags.migrate_devmem &&
> > > > > > +	    (range->base.itree.last + 1 - range-
> > > > > > >base.itree.start) >= SZ_64K) {
> > > > > > +		range->migrated = true;
> > > > > > +
> > > > > > +		bo = xe_svm_alloc_vram(vm, tile, range,
> > > > > > &ctx);
> > > > > > +		if (IS_ERR(bo)) {
> > > > > > +			drm_info(&vm->xe->drm,
> > > > > > +				 "VRAM allocation failed,
> > > > > > falling back to retrying, asid=%u, errno %pe\n",
> > > > > > +				 vm->usm.asid, bo);
> > > > > > +			bo = NULL;
> > > > > > +			goto retry;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > >    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > > > &ctx);
> > > > > > -	if (err == -EFAULT || err == -EPERM)	/* Corner
> > > > > > where CPU mappings have changed */
> > > > > > +	/* Corner where CPU mappings have changed */
> > > > > > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > > > > > EPERM) {
> > > > > > +		if (err == -EOPNOTSUPP)
> > > > > > +			drm_gpusvm_range_evict(&vm-
> > > > > > >svm.gpusvm, &range->base);
> > > > > > +		drm_info(&vm->xe->drm,
> > > > > > +			 "Get pages failed, falling back to
> > > > > > retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > > > > > +			 vm->usm.asid, &vm->svm.gpusvm,
> > > > > > ERR_PTR(err));
> > > > > >    		goto retry;
> > > > > > +	}
> > > > > >    	if (err)
> > > > > >    		goto err_out;
> > > > > > @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >    	dma_fence_put(fence);
> > > > > >    err_out:
> > > > > > +	xe_bo_put(bo);
> > > > > >    	return err;
> > > > > >    }
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > index 63daffdfdbf6..4c2576162c39 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > > > >    	 * range. Protected by GPU SVM notifier lock.
> > > > > >    	 */
> > > > > >    	u8 tile_invalidated;
> > > > > > +	/**
> > > > > > +	 * @migrated: Range has been migrated to device
> > > > > > memory, protected by
> > > > > > +	 * GPU fault handler locking.
> > > > > > +	 */
> > > > > > +	u8 migrated	:1;
> > > > > >    };
> > > > > >    int xe_devm_add(struct xe_tile *tile, struct xe_mem_region
> > > > > > *mr);
> > > > > 
> > > 
> 
