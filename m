Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F0A27EAE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2610E0F9;
	Tue,  4 Feb 2025 22:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtsiYUVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915C310E0F9;
 Tue,  4 Feb 2025 22:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738709430; x=1770245430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pvwoTeQgzM+Gscl0IAF3IBbQdFtRdEBqccWN5YVxb58=;
 b=RtsiYUVyUg+NsnozQYZE/MheX0k/7FKnVB9lO8G/XTFKkWEJYBeIrlXO
 wJYzay6vNNOHNowQmdPcgCKS4xkMgBANfmsIBVXe/JKnJK4h1G37+CuxF
 wNaa1HfzSpCJNulSoqZHsWM6xEYSuXzIy1NxEuxP3E/fp4kXk4LpBvD0D
 /+wUhY+uLHKMJ47MR8tYx3TP13IuAJTrt+T3KMb/UIHUEaKdnd0+NW4O3
 kDZjBQb+X+8zSe2NdaP7WMtoY76CYFL8t/9cNk0CxQfpwJlS+4QEdxlrx
 ETzlF67hsZtM4SVlTfhNn6FHUSTd56g7UXHwL5OaMkWpbUmBLVX4P7q2A Q==;
X-CSE-ConnectionGUID: WGbvDR/TRpOWGwlV4f5XVg==
X-CSE-MsgGUID: PmRfE4s7TBWnMInMlCXNuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38467427"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="38467427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:50:30 -0800
X-CSE-ConnectionGUID: 5h333ODtRYSceo/is+w5/w==
X-CSE-MsgGUID: Y8LvpMVKSyWB89MpcA/0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115913579"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 14:50:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 14:50:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 14:50:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 14:50:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFuqA95R/7Vqbo8exJFfsiW8DXbdr0yBrqLRbsKdqxG7GK0nlT8zSJ8mS2IjdvfWeSFOicOTuaW6OuhY5NCMCWozC43b8MtuFMmlTjG7O72tiA9X0K5TJAewNdqIMx8WA5mNjsQDoUJxyCYO7qp6/TEIjBs1jhUH3hOv9eoRORBeJd39N8dLH52WXswy6Q4093Ws4aJqTfJ3Q5cRK+47nfXjD4by5u1YAQHoXo8mtWR/RHLQleWu0uzfVty8ovYlpAumi8O4bXDtcRABveOWhdAhi6udTF/6q+GSilJMi0K/J6cP9YN0VfznyJnQ2CzhZ1fJeMjUuIn0x9UnVs+RPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dgNRsmyVlHt45bbqENF8pGC3qMr49dLnjephGKo5t8=;
 b=YiMcs/8Wq9/LUSSIKV+Z//ltX01+BNsduws3ICQ4LIR2tQHvVP/824K3IyzT/PG5WdNCwvzbqvHDrAZuhJCk/XNJ/oZE8RR7HEoKR0vOREIwG7+5oZUNY0BGy2DbDs0KXjr6tvRaXf3IoJ1G97LW44hJbOZ2GqcNQBLP9x8pBpZZWsgJkyEgCWqINDUV1GL8Ow8oCOaFNQuzXyj03nnEHDItLuWHEYt9WlCrJGlelRKEN0Ziqv7zVZ1Yr1VYz6+X4J3HA2OUTnSI3GOZm/DrLd+XkoAGPSqu7hxi8aVywezw4gfdCSsG5cbmSxnXuGcaN4T5GlUoN782d9t2d8f85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 22:49:43 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:49:43 +0000
Date: Tue, 4 Feb 2025 17:49:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>
Subject: Re: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
Message-ID: <Z6KZglMsB-4EI8YC@intel.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-4-dev@lankhorst.se>
 <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
 <158e099d-6548-4de8-ba13-7de3277da82e@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <158e099d-6548-4de8-ba13-7de3277da82e@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 427769fe-b87d-4443-d7ae-08dd456e3708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6CdKFwR6qLITtdPVY3HD31dcbhJZEpJgZ477G4shinupNGPn62HZLgHCpDLF?=
 =?us-ascii?Q?QD2QjA7Sxcdcb8cwFypm/FrN4tpMFOkTAfrxGxcjn1s1ye0+vaKEOcLDGBzK?=
 =?us-ascii?Q?R5pRQffdbWyNhoo+TnfsPuSNqIHIEuUebgBw7F5Tk8WjE6ACHRE8Iu0VwGEU?=
 =?us-ascii?Q?ZDyPDGC47kAk5jDHxEFW0cbq1R75rAF3HwzdII0pnxNo7KA6mcMutz90bq1z?=
 =?us-ascii?Q?JYwtkHwyHOaCXCLjq7KAKnlDiAGcVKLqO1mRQLOlfilz7jpFH2O1eJcQhMpA?=
 =?us-ascii?Q?ccJ+lGlRZ2KLJ2SnLpqEH2gsZpsaZQmdMz11WLcE1ON5//LsQTOg4PKgxSzN?=
 =?us-ascii?Q?hICHcIZtlVLL7pMfm/C70D6YOH0afYyfAKUVIykpycAWc6M11psgvzonSq9S?=
 =?us-ascii?Q?M4MT1YNkSMKQyfRZ5b5/Fmc+qN9/z1D4oSwgjt8+HV1pzm+8YBK8O9JLDzK7?=
 =?us-ascii?Q?VSW1ZQ1Fmp5gkeWA22B4iG/iVQ9pvW7byfEE84pfwHnXr8vlQz+oIHcpyF5G?=
 =?us-ascii?Q?C9DseGz6OUCbCgcm3nIupUCkqkoNK+0SbKBghcqoSlMyzMIsslVIhrdVfg09?=
 =?us-ascii?Q?XrUxeGtQstbBYe1FqBMu/Tuh8NIZGT3FqvGoBuZEwT8og2/w+ImYi/vqjhmg?=
 =?us-ascii?Q?87wnI0N9xjgRfepnClRUvwTkWKJtjjsQ0vxsFCrD1YnofUW6AVtWT9NwhW5F?=
 =?us-ascii?Q?byZgSIsg+rNQngHccRnqf4haB7TFbxAG7gOIfXFG0YfGachOCimbZiP64qZg?=
 =?us-ascii?Q?acXVnFCa3EOoVXAS96huYBWcUKOJlOfGCQm4JHZAxAm8TYku9yNA5vGcOkH4?=
 =?us-ascii?Q?qfeWd7i/NqNls5vDFqf23j2xwuGEA4/YLQJ0Q7OhU9L+x1hf1wR0gQkbUJVG?=
 =?us-ascii?Q?SV+ZfqwvbrbGJD1P7FENSSaZ0VlGk0HY2zn7HhzWJ5WS3mfcVTdo1e3IoB4R?=
 =?us-ascii?Q?Xa09AwSJZR37UjJBheRKBlQrulEaCJNa9QlfslrdR2ry4gh8zo564tsR900w?=
 =?us-ascii?Q?NGrUg0BcaXQYqeRzOoAFKOBZLGDEv29X433GN5+PKaLsoKK7E+L8D/g5xmmM?=
 =?us-ascii?Q?+c3n2F2422bFTx20+D231WpCmpLyjpEosVYFgMqGeZ6fuvChq+1EbAerHFQc?=
 =?us-ascii?Q?uk5uPpfihFnYQYDwZ2+vBU7yeVEIRkZUhAPNMZM/L+3hP5qPPNrxZMf7GiAq?=
 =?us-ascii?Q?MRvQjCi8eEwFQ8pcgQJzhMRvOwFJEzSJ7yrfxF39TKa6bQS4IC2vp4LqgLET?=
 =?us-ascii?Q?WKsB5Sd+tWO20AW5tGIBr6rAeemR3rdLUqGf/ELdYGvKD9LW1WGmIfiMF3lt?=
 =?us-ascii?Q?RMnKhJHdAkq9mCWHckpu8kI9N6Qjp8kCnAEd7gTCOIVO+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRsvRn5pVnmekgkErvJLt/VIUiFXT84/moYWgw3ry9ea1YVRtjkle6eqgPtu?=
 =?us-ascii?Q?VkwlrciTB/FU3QE0VLII4/+hovykmjWLzDAe2nELF8C6TMqwzyGqajocW70L?=
 =?us-ascii?Q?yDXFVWJW0GYH9jMZUTRVfP/w2m1cl38jl9WqFK6Qcwk7/WVMXkW2TF3b4urv?=
 =?us-ascii?Q?Fo7vRZKCF1pPc17n/YA+wptf5DoJTh8LyP3t/nPC1bTTh/LWeo35B2ZXeT8X?=
 =?us-ascii?Q?xYz3xjE5HFRm5M5iaXTUmS9FV5bctu7xkVrLEIaNJsyqMfneK4vaIi6jdG4l?=
 =?us-ascii?Q?U9pXtlPxV4hID6ilqFqv/c7s2tumDPVm5Olt7VG4xA6SUSfRVAm9BtpaGzx/?=
 =?us-ascii?Q?QNENZ9rpLd8EuPJpQZkwkVkP5jOo7WW/IJOrPMfciw3N4SagzamvZwLYkW0W?=
 =?us-ascii?Q?BJhEFC3MqKRpZqrXl7fBrn/aGotnGG538aZ5sP+IiMeXJreOwjFmtmWClOhG?=
 =?us-ascii?Q?0u0qhgGoUJuRz5VoHvddRwXMAzghGO0/od+0sd78ZLYambT9+JR0DN0Z+Mud?=
 =?us-ascii?Q?W+0mpuA7gAH9TOa2XeUXEWEXN9sx1OzSoUuvBO6vxVu7kHVPx+YIpzxyCuyS?=
 =?us-ascii?Q?M3gQsWtHMjCcJDnKrHO8AY14WtqjWA1VcoxWOdhf5LwtlFLpsA6yD42pFmMq?=
 =?us-ascii?Q?f3Mi20wBR9192n45O3CZ/Ly9QzIFzf5UfED45l5EoozjBj8MqH8OTCWEfctW?=
 =?us-ascii?Q?GBi6dOpuzojW1lZW9Dn0qbVOYZV1qFwEipM4vmj2twd5OkLSVykMnbiQWl79?=
 =?us-ascii?Q?3EZICrbq8KpHWO3cauvINSLi5YkwMZZXVH9lbvkBCGPOj5x8EdsPuSpQCexD?=
 =?us-ascii?Q?pdrK/bTJ9Q5JM5IZ0v4p7x8I67qWlwzCsLHmoiH0368wJAry0zxhBkqef8PE?=
 =?us-ascii?Q?RX2dl0X9wNKZkk3U5A4iJHAr2OkZ1pWUb7gHD9u2ph3HKNKsEQswVY0Ev/Ow?=
 =?us-ascii?Q?Vk5esjlae46mc1xraA9bLEEoDc4uVg1l+D8UEOuWDXPXUVKkWnUSiyVDaZt4?=
 =?us-ascii?Q?oCQgZAV9k+JAJRl+v6weo/t4Ev0CiNgV5aKxEJ8y+pFrqZKU50w1v6lfrihl?=
 =?us-ascii?Q?GIR5usiX/ZlI9g7vcjhlurZlc+dT+0rZF1+uC6Pn1Wv1MclMxNpJazjT2XcY?=
 =?us-ascii?Q?ngl0SuNHN3nciQeaQBD1h4ldGVMslWNhnD8QNtrpyjZST3cZakdfoP3s26Mw?=
 =?us-ascii?Q?gMkvf6T6sLx+y+MlBCt/EGNqf8B9KOwqDdNPCdqEjN2ejt3u26q5r3aCVlA3?=
 =?us-ascii?Q?leKXCUP7hCPThnOXYGQ00dSrNPl7l1l2HojRDdoq3KjGDZmZXMKrgZGnMqpg?=
 =?us-ascii?Q?+85xlEAK0Utt5npN+a6AreLLIQ8AZwn2HjkksYlFGXCA7gdn8r9JiYcl4gn3?=
 =?us-ascii?Q?s+W6vK1WgUz4UsL+QdtwpE2cYvLq9jhqU/MxV1WcTM61xff5MfzOByXS63JK?=
 =?us-ascii?Q?8T5GEUL4cDbO1pDhfP4rRwoXHMobIS9OajPmNJ3zN7a2Z92U63JTNPlheX4m?=
 =?us-ascii?Q?bfOkcb62E2vJtHNuW7+46T0mQ9cOE0SlkB1BfNMe5xHOqlydZGF4EtQRpVca?=
 =?us-ascii?Q?Tz61AxMhl+dII7NosW+X+Z4jRU557fd3KTgXlVz7lp9Km4k+j7Wuj3mDl0ji?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 427769fe-b87d-4443-d7ae-08dd456e3708
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:49:43.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76dNsfchLo8PCFtqhPSy9t+psG0C1DXjza+tE1NFlMTrMm3BrLk/OPI7OH1wGLh4wWr4P4d3wTRkjVp/t9WSfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

On Tue, Feb 04, 2025 at 11:28:03PM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> 
> On 2025-02-04 17:30, Michal Wajdeczko wrote:
> > Hi Maarten,
> > 
> > On 04.02.2025 14:22, Maarten Lankhorst wrote:
> > > Instead of finding bugs where we may or may not release force_wake, I've
> > > decided to be inspired by the spinlock guards, and use the same ones to
> > > do xe_force_wake handling.
> > 
> > You may want to take a look at [1], which was based on [2], that
> > introduce fw guard class (and it was already acked and reviewed).
> > Merging was postponed only due to a request to prepare larger series
> > that would convert all existing usages to the new model.
> > 
> > And similar guard approach for our RPM was proposed in [3]
> > 
> > Michal
> > 
> > [1] https://patchwork.freedesktop.org/series/141516/
> > [2] https://patchwork.freedesktop.org/series/134958/
> > [3] https://patchwork.freedesktop.org/series/134955/
> 
> Excellent. I'm glad we're in agreement that doing forcewake handling in
> guard handlers is a good thing. :-)

Just for the record. I had a similar feeling back there and
also now with the new series: I believe the code itself keeps harder
to read and follow.

But if that's really a big advantage on the protection like you are
all advocating for, let's go ahead.

> 
> I have taken a look at the patch series. I think the approach I've taken is
> a refinement of your series. Yours is already nearly there, but it still
> keeps the rough edges of the original API.
> 
> To smooth them, I have created 2 constructors, xe_force_wake, and
> xe_force_wake_get. The former is used if you want to run code regardless
> whether it succeeds, the latter is when you do.
> 
> This allows code like:
> scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw,
> XE_FORCE_WAKE_ALL) {}
> to work flawlessly as intended, without having to check
> xe_force_wake_ref_has_domain(XE_FORCE_WAKE_ALL);
> 
> I think this cleanup removes a nasty source of errors.
> 
> When you don't care about failure:
> scoped_guard(xe_force_wake, fw, XE_FORCE_WAKE_ALL) {
> 	if (!xe_force_wake_scope_has_domain(XE_FORCE_WAKE_ALL))
> 		printk("Oh noez, anyway..\n");
> 
> 	/* Continue and pretend nothing happened */
> }
> 
> And for optional code, same as scoped_cond_guard, but as scoped_guard:
> 
> scoped_guard(xe_force_wake_get, fw, XE_FORCE_WAKE_ALL) {
> 	/* Only runs this block if acquire completely succeeded, otherwise use
> xe_force_wake */
> }
> 
> All in all, I'm open for bikesheds, but I think this has the potential to
> improve xe_force_wake handling even further!
> 
> I wasn't aware of your previous attempt when I wrote this and fought
> linux/cleanup.h, otherwise I would have taken that as a base and credit your
> work.
> 
> Cheers,
> ~Maarten
> 
