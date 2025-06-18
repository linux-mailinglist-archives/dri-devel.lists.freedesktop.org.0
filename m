Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5112ADF766
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED0010E92B;
	Wed, 18 Jun 2025 20:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaDdsX+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767AA10E1DC;
 Wed, 18 Jun 2025 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750277140; x=1781813140;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=+I1tucFcDTk83Joc9pEv5B6gMrgtKByU0lYEiuLzw0c=;
 b=BaDdsX+7TyrPN3hhGGm4tIMa7w2D7jI1QdN9+Wz2aAkKuIpOQuWXjCuN
 CliqjgxBf0R+oIOZ85TfM6HbZk+exXSikhFqfeWp3vD2sQvXOcsGyVTld
 xs55sUuM3KakwMmP4cnVJ3T91xOaUPIBvfMzeLoeMtMJ1WQmoOWAJxXz1
 NQSIHk2K1VEIM8OJf1+FT0iETlAmIbSSF3tHLCXgaZ1VAasYeyW9UkAjO
 NO6OS46wc3ZFUnP6JvWgZyhTDyoh7V9rU2wQzUT2iyMGxZNiHPMRPP7bV
 3kaA1fbw/kxOljmoFA7fZWOudovpwlVNZhVWfira8fD8aUstxHA1lYg4h Q==;
X-CSE-ConnectionGUID: Asxh+efMT/WwTwDJ/U09ng==
X-CSE-MsgGUID: CB5ohl1lRPGmHfHVxFAa+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51623357"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51623357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:05:40 -0700
X-CSE-ConnectionGUID: 5ljXICu5S0qIrrqfkqxk3Q==
X-CSE-MsgGUID: jsI7j6lQQKmBRnm/LOS2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="155648764"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:05:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:05:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 13:05:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDqpxNpYLuLkH2ian3/nHkolHvD10oqvs5278505v2aYRyfICLd8CqaHoHNRyj9KPAsQSECK0KgYfTa5rnYKeqg7+DLzfLnOD2aKwuxF5msZhJqtvQDrzdNGZPq2Mm2Vivm0csz+m3s9R95bpvYxzh+b2J546WoAfu7C/xPRR1aKC7eeKpWa8Y+Oj78rWj6HfB50ws29fM+oIhaVB9rBTp2y0IvS7iXxx0xCWojfRNRMYgZUia3mRRNCTJrdcylHTgzhNxiDZA6lmLXk/HHwndlguDZK5zQEu2pKADIbxoymhhZTO7tistXs1HBctWAl43aMxdh4fmGGgR8ehZ6ASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voBChOp1xKrqGhuvCtyB+ZGUuk2wT0IQt64/yDbnDYU=;
 b=ybhCOoNOThr6U8gnN9BxYxKWdkMkCRDvS3DFRqhfvL6TnXf37HjEim3FBBlGmMA80LWdOFQs5SQGGDztIEuqA+PpFXkgm6cZ1mbuRLnXhz6IoDm30jSyRz2n9AMQdmp/+I4Ngel6PVly1SdDpjTt+dwd3iNwATcdeDzHET8juQ2GTGmnDWx9AgetD1wF8HYKSk20G+Tuoe1Frfxs5dRBZCIgmsXjH/sxMRQf8T6WUf7E65SOFlBNeGtR6dcPV7/hHgvG94NRRMjEua9/hHU+47z2McHuQSF7o+JTIXF35HRa6+MeIB9XLfCMrXNljDYWx7LB0skLen2y+DuUT+0jGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 20:05:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:05:22 +0000
Date: Wed, 18 Jun 2025 16:05:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aFMb_NVF_oCW7UVl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BN9PR11MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e524eb-4ac3-496f-a6c0-08ddaea374a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iqgQW7PXmZo6wYc4oFHxZ6oq8zHuxUIwqOpFHLmzvIgzsCkb54avHJdT9P?=
 =?iso-8859-1?Q?oGj+UR1eu0ADZPsqDgv5+w97uB48DlA5PHKgL3h47au2CopZBOC/A9O1RP?=
 =?iso-8859-1?Q?PYXhFmG16pGiE9Vd/hyFZdnVqM4DCkD5St2dO+6lxYdovjHzYKVFpBUysY?=
 =?iso-8859-1?Q?h2kBsBBuT59UQYyaC/F8q459rX8YC2fbDLZM0b1HxdK30IMnxgedgPGT+n?=
 =?iso-8859-1?Q?TftyXDm7h4oZd9L4prBInZa/JqqvGWP8moKv/wfuRAlsP1wZD8VWRpMwcS?=
 =?iso-8859-1?Q?R00/ABArqxMjRWWJT5b7x5XralXjle7LKUOWrfvnqsKDEochLi8FF95GK1?=
 =?iso-8859-1?Q?1vT78VkEeAJbAuDr8TvB3/9bSnLufChLENp7KhWjRMaKOA/1Msr94eGpDh?=
 =?iso-8859-1?Q?41aXn9V2XwnL4sTAuwaSqC1GdxUn7JeJQ8qsWJCjTsSMzfgbsB5pFcvpUS?=
 =?iso-8859-1?Q?vzCTKk7vxJOcaOKozEZUFL11C962nPaOX6VJkfbNZfUM0Ad/5bhSb+oK28?=
 =?iso-8859-1?Q?4wfQx3iUbgQyoKphWyjbyeYAHkQEIDEajRa89t2njifvk8P8AbgM7YYX8Q?=
 =?iso-8859-1?Q?Ew8O72s0Bd2s3LNqVHKdcKyWniNsUJXnGdgA/jUkdzymyWXlbsjGYBBuFm?=
 =?iso-8859-1?Q?O8fEhaznKnjFHdwgaiGf+oT96XvKggwx1NDJ8GSUqj1UvWZVF62jWJIOc0?=
 =?iso-8859-1?Q?sVBgICMKSWqfZ1e7SqrfrZM3+onQRTVNDdWa6thWl8FT/OK5yBbPvOKkNa?=
 =?iso-8859-1?Q?FEOiWWIRYmMj8sjlblxFxS4ZC0BEiWeIuOHYaBFY+r70bJ5BFVYuU2Ze96?=
 =?iso-8859-1?Q?TDRFwof+NPK/e94q4wN0PGWkZc6sEmOPYhNunbaolzHH76hGDzS9y+V19T?=
 =?iso-8859-1?Q?UslvbPV0kvUtN1va7QYKdqmODewrhV6/VvhlEYkq7K+AydrGFmFzBZS6o0?=
 =?iso-8859-1?Q?h41Zi9+hXmxpBMSoC3he06CST1jh7m0rCUP+pMPCyVI8p+7di0zgt6dehk?=
 =?iso-8859-1?Q?8kbhn+29NNuDJgLKgWwtlXazzg5I72SDR/XnE/lDt4vgEXjgIusZ+44Ypx?=
 =?iso-8859-1?Q?zfl0aReuaU13wWs72jd0S4kU5vANKAqGrY6OlkFYWZPtYR9uWM1vUzacR3?=
 =?iso-8859-1?Q?eZe2Kc3cbR6jwUVYiz2n5YW4RU5o4wz293R9N0B5C7no2i9RUhkmNEZLsf?=
 =?iso-8859-1?Q?MgXLeUj6xWyBcdWjI/LnTgBnjg+A3FhAw/nZVk53dhnXGKtaRla3szIClN?=
 =?iso-8859-1?Q?+vMAGq/ssiXXRG8jVa1kFzKpuVYHMRKIeCMmMRge19BhewPzuBNhaTpasZ?=
 =?iso-8859-1?Q?UP6HWYvxIs4oQvFF+zkFazxEAFK0uBAUjQG3c5/IOtJgGUOnsdZirxla5O?=
 =?iso-8859-1?Q?mb+VLvCyVsGHnXmslSSowlM3VwN+HRcJJlCHEvuWvBp8485o240Gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bS7aC631vbu47pgwVq3t6vv2YITkN9RpmLmz36/dtQHJfYVZt9Vgbi9BRP?=
 =?iso-8859-1?Q?5/8JBrReg0WHI5DHWncvX6pVn36wPSXStccncXCIn8OA6755QSMhD17Q7s?=
 =?iso-8859-1?Q?wDQFHNaqF5xWjJFLOtleFwIKPAVAWS7YuTADQlGgIPd8M0Se/oQP2a3YOI?=
 =?iso-8859-1?Q?4MQ7lXlqtjYps8N7r1qapCHawfa6J5duF/zX/VNgYBdwLyBvgfsWYLR76Y?=
 =?iso-8859-1?Q?Fd0rArnZwvpyKu+fy3My1Ezyt3T2EOddeNOmUF0Zu5BsZl7NS6YrLABtPm?=
 =?iso-8859-1?Q?tREeGDMidGNxRJp3VVBu1nuoU615q7v18ymR9FZT5Uwh+5FbJFXUW+KchG?=
 =?iso-8859-1?Q?9Z7aJSWmG/aYdX1jcCQk+jEVEQWtlIfMryh/THvbBvrUrnq3kRf/56KunR?=
 =?iso-8859-1?Q?cPXTJZXlO2qQNjz9VLvstLjYMUZpg0DdcDdQg4vME8cW9xGkFKCt1FadlZ?=
 =?iso-8859-1?Q?kwOeDRCAQMcloxTt54qoTeG7hKnH/776V0lKH5Mm1BALqTPZBiPdYvpMMi?=
 =?iso-8859-1?Q?MxXzETiURVgfkhBgXBlI/KGamSZTKzNzlSiEZuawxHIAfLBGJmYlsBAYll?=
 =?iso-8859-1?Q?T9+AOWOd0mlOD2BxtFWpx9qIEU7LyOjWMWfppzbUtdsZCehKN62HHZ3Kwm?=
 =?iso-8859-1?Q?FPIeC/dxcFFKtxCy1GBGV14UhbwSImdg5E91hwsEqYdet6IKrhU8dHStLT?=
 =?iso-8859-1?Q?vY0Qxeq+CQ8Ur70bMWfKjUFy6/ri81u8Fp7UKuJkQs3ZZ5ZWyWa7Bzhp1X?=
 =?iso-8859-1?Q?bUapFhsdb/1KMu5/7NYfCAccb4mWiocHU/xFGuoOoH+NR6iGZhQkru8oms?=
 =?iso-8859-1?Q?Ech+2rsNpb24jGO2pehO1ufxfOrexDK74/+5iKo6SOBEObXxUD5Dymkt9L?=
 =?iso-8859-1?Q?LzojYJpXRnF21fvq+y9Ps156qb4QwoNY6Fgz81/qQyYPs506aWnM1iWdFE?=
 =?iso-8859-1?Q?UcUHmTJ0FIuQkJ4Nb3B/VN9XG30ycDVtPd9gz94QI3GtxmefWhqY4fJGgF?=
 =?iso-8859-1?Q?3Id7nWN9W/mcOLYhhEzZmzqc0G3z82O5anUaPVVWMl3UPALeYODzCov6uf?=
 =?iso-8859-1?Q?EtCxL26jVbdVJUge/T7oRVIf/+ik0eOtsjoKsatwiKF/B0ZUxSvD0IsUyj?=
 =?iso-8859-1?Q?HzLn8+MsYxpLBcvvRb0G9juoIW5J7ZxmgjiByD7uj+oEVnxojzOqiV0KT4?=
 =?iso-8859-1?Q?m+xaaK9+nlckdw2hHlgzPwEG8mzyusFSM62m3xKX+1sEW9aaxD1pQChBAR?=
 =?iso-8859-1?Q?DUQaNF/HyCyvWgtw/kV1u//dTL6U5Cm1jMRk1dxPDtfEgBkVOO6Qywxn6J?=
 =?iso-8859-1?Q?CaZNoLrWDg54IsqlmOQZ2uOxaF0oZtkexPrWH6VbahuD4OMB6TJrTfXZiO?=
 =?iso-8859-1?Q?+8rZpJWtXluSg4RAlP43Nf55TzmcvXd4knTBuOE8Gqs0i0yHatDsJ3SrFz?=
 =?iso-8859-1?Q?mSRAyKi6uwoOIYNBOh8u12yphUfncFir5whUyfZEEO5hl2626xMG0eD9F0?=
 =?iso-8859-1?Q?8TleSoiQIiXiqcX8pXGnZ3fKwunt2vo9y5z/e+UAwOmMazDkBINtmvs80+?=
 =?iso-8859-1?Q?aIxMEp/N+H3ZzxF0mKV3SP4+zkfHuQOd37M06QGXglCFpD66f0ZLFyXRdk?=
 =?iso-8859-1?Q?FjWX3baDMtka3uH49C6xz3CuP4/puuB5Ob?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e524eb-4ac3-496f-a6c0-08ddaea374a8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:05:21.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iz4sMuLaRyd/tr1saym/ExgCPcZqllUj/YXjN/6h7+EcJVESuTQPHVnCJN1qAW7P7SU/prGfzicF1Uqg7cajew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
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

Here goes our first drm-xe-next pull-request towards 6.17.

The important part to mention is on the top of the tag below:
- uAPI addition for Media OA
- The restoration of a fix accidentally missed in a merge commit
- GPUSVM changes

Also, SVM enabling work itself, platform enabling and SRIOV work
is a big highlights in the driver patches.

Thanks,
Rodrigo.

drm-xe-next-2025-06-18:
UAPI Changes:
- Expose media OA units (Ashutosh)

Merge:
 - Restore GuC submit UAF fix around queue destruction
   accidentally removed in a drm-xe-fixes merge (Auld)

Core Changes:
- drm/gpusvm: Introduce devmem_only flag for allocation (Himal)
- drm/gpusvm: Add timeslicing support to GPU SVM (Brost)

Driver Changes:
 - Make gem shrinker drm managed (Thomas)
 - SRIOV VF Post-migration recovery of GGTT nodes and CTB (Tomasz)
 - Some W/A additions and updates (Aradhya, Shekhar, Vinay, Daniele)
 - Prefetch Support for svm ranges (Himal, Brost)
 - Don't allocate managed BO for each policy change (Michal)
 - Simplify and fix diff calculation in GuC submit (Lucas)
 - Track FAST_REQ GuC H2Gs to report where errors came from (John)
 - SRIOV PF: Don't allow LMEM provisioning if LMTT isn't available (Piotr)
 - Check if all domains awake for MOCS dump (Tejas)
 - Make creation of SLPC debugfs files conditional (Aradhya)
 - Default auto_link_downgrade status to false (Aradhya)
 - Use xe_mmio_read32() to read mtcfg register (Shuicheng)
 - Updates in PCI ID tables (Atwood, Shekhar)
 - SRIOV VF:  Fail migration recovery if fixups needed but not supported (Tomasz)
 - Add missing documentation around freq and RPa (Rodrigo)
 - Some other SVM related fixes (Himal, Auld, Brost, Maarten)
 - Allow to trigger GT resets using debugfs writes (Michal)
 - Optimise CCS case for WB pages (Auld)
 - Create LRC BO without VM (Niranjana)
 - Initialize MOCS index early (Bala)
 - HWMON fixes for BMG (Karthik, Lucas)
 - Drop redundant conversion to bool (Raag)
 - Rework eviction rejection of bound external bos (Thomas)
 - Stop re-submitting signalled jobs (Auld)
 - Small fixes and cleanups for PXP (Daniele)
 - Convert some print messages to GT-oriented ones (Michal)
 - Resend potentially lost GuC H2G MMIO request (Michal)
 - Add configfs to load with fewer engines (Lucas)
 - Remove unmatched xe_vm_unlock from __xe_exec_queue_init (Maciej)
 - SRIOV VF: Small updates around GGTT handling (Michal)
 - Make VMA tile_present, tile_invalidated access rules clear (Brost)
 - Xe3 Tuning: Disable NULL query for Anyhit Shader (Nitin)
 - Fixes for VF GuC version (Daniele)
 - Don't store the xe device pointer inside xe_ttm_tt (Dave)
 - Small improvements in topology code (Michal)
 - Stop relying on GGTT internals (Maarten)
 - GSM size should be constant on most platforms (Roper)
 - Reorder 'Get pages failed' message (Brost)
 - WA BB related fixes and improvements (Lucas, Brost)
 - Fix early wedge on GuC load failure (Daniele)
 - Add helper function to inject fault into ct_dead_capture (Satyanarayana)
 - Determine ATS / PTA programming during early sw init (Roper)
 - Consolidate PAT programming logic for pre-Xe2 and post-Xe2 (Roper)
 - Fix kconfig prompt (Lucas)
 - Convert xe_pci tests to parametrized tests (Michal)
 - Do not kill VM in PT code on -ENODATA (Brost)
 - Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of parallel offset (Brost)
 - Enable media OA (Ashutosh)
 - GuC log level tuning (Lucas)
 - Add xe_vm_has_valid_gpu_mapping helper (Brost)
 - Opportunistically skip TLB invalidaion on unbind (Brost)
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-06-18

for you to fetch changes up to 8aa7306631f088881759398972d503757cf0c901:

  drm/xe/hwmon: Fix xe_hwmon_power_max_write (2025-06-18 12:26:27 -0400)

----------------------------------------------------------------
UAPI Changes:
- Expose media OA units (Ashutosh)

Merge:
 - Restore GuC submit UAF fix around queue destruction
   accidentally removed in a drm-xe-fixes merge (Auld)

Core Changes:
- drm/gpusvm: Introduce devmem_only flag for allocation (Himal)
- drm/gpusvm: Add timeslicing support to GPU SVM (Brost)

Driver Changes:
 - Make gem shrinker drm managed (Thomas)
 - SRIOV VF Post-migration recovery of GGTT nodes and CTB (Tomasz)
 - Some W/A additions and updates (Aradhya, Shekhar, Vinay, Daniele)
 - Prefetch Support for svm ranges (Himal, Brost)
 - Don't allocate managed BO for each policy change (Michal)
 - Simplify and fix diff calculation in GuC submit (Lucas)
 - Track FAST_REQ GuC H2Gs to report where errors came from (John)
 - SRIOV PF: Don't allow LMEM provisioning if LMTT isn't available (Piotr)
 - Check if all domains awake for MOCS dump (Tejas)
 - Make creation of SLPC debugfs files conditional (Aradhya)
 - Default auto_link_downgrade status to false (Aradhya)
 - Use xe_mmio_read32() to read mtcfg register (Shuicheng)
 - Updates in PCI ID tables (Atwood, Shekhar)
 - SRIOV VF:  Fail migration recovery if fixups needed but not supported (Tomasz)
 - Add missing documentation around freq and RPa (Rodrigo)
 - Some other SVM related fixes (Himal, Auld, Brost, Maarten)
 - Allow to trigger GT resets using debugfs writes (Michal)
 - Optimise CCS case for WB pages (Auld)
 - Create LRC BO without VM (Niranjana)
 - Initialize MOCS index early (Bala)
 - HWMON fixes for BMG (Karthik, Lucas)
 - Drop redundant conversion to bool (Raag)
 - Rework eviction rejection of bound external bos (Thomas)
 - Stop re-submitting signalled jobs (Auld)
 - Small fixes and cleanups for PXP (Daniele)
 - Convert some print messages to GT-oriented ones (Michal)
 - Resend potentially lost GuC H2G MMIO request (Michal)
 - Add configfs to load with fewer engines (Lucas)
 - Remove unmatched xe_vm_unlock from __xe_exec_queue_init (Maciej)
 - SRIOV VF: Small updates around GGTT handling (Michal)
 - Make VMA tile_present, tile_invalidated access rules clear (Brost)
 - Xe3 Tuning: Disable NULL query for Anyhit Shader (Nitin)
 - Fixes for VF GuC version (Daniele)
 - Don't store the xe device pointer inside xe_ttm_tt (Dave)
 - Small improvements in topology code (Michal)
 - Stop relying on GGTT internals (Maarten)
 - GSM size should be constant on most platforms (Roper)
 - Reorder 'Get pages failed' message (Brost)
 - WA BB related fixes and improvements (Lucas, Brost)
 - Fix early wedge on GuC load failure (Daniele)
 - Add helper function to inject fault into ct_dead_capture (Satyanarayana)
 - Determine ATS / PTA programming during early sw init (Roper)
 - Consolidate PAT programming logic for pre-Xe2 and post-Xe2 (Roper)
 - Fix kconfig prompt (Lucas)
 - Convert xe_pci tests to parametrized tests (Michal)
 - Do not kill VM in PT code on -ENODATA (Brost)
 - Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of parallel offset (Brost)
 - Enable media OA (Ashutosh)
 - GuC log level tuning (Lucas)
 - Add xe_vm_has_valid_gpu_mapping helper (Brost)
 - Opportunistically skip TLB invalidaion on unbind (Brost)

----------------------------------------------------------------
Aradhya Bhatia (3):
      drm/xe/xe2hpg: Add Wa_22021007897
      drm/xe/guc: Make creation of SLPC debugfs files conditional
      drm/xe: Default auto_link_downgrade status to false

Arnd Bergmann (1):
      drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency

Ashutosh Dixit (5):
      drm/xe/oa/uapi: Expose media OA units
      drm/xe/oa: Print hwe to OA unit mapping
      drm/xe/oa: Introduce stream->oa_unit
      drm/xe/oa: Assign hwe for OAM_SAG
      drm/xe/oa: Enable OAM latency measurement

Balasubramani Vivekanandan (1):
      drm/xe/mocs: Initialize MOCS index early

Daniele Ceraolo Spurio (9):
      drm/xe/pxp: Use the correct define in the set_property_funcs array
      drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
      drm/xe/pxp: Decouple queue addition from PXP start
      drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
      drm/xe/vf: Boostrap all GTs immediately after MMIO init
      drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
      drm/xe/vf: Store the GuC FW info in guc->fw
      drm/xe: Fix early wedge on GuC load failure
      drm/xe: Extend WA 14018094691 to BMG

Dave Airlie (1):
      drm/xe: don't store the xe device pointer inside xe_ttm_tt

Himal Prasad Ghimiray (18):
      drm/gpusvm: Introduce devmem_only flag for allocation
      drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
      drm/xe: Make xe_svm_alloc_vram public
      drm/xe/svm: Helper to add tile masks to svm ranges
      drm/xe/svm: Make to_xe_range a public function
      drm/xe/svm: Make xe_svm_range_* end/start/size public
      drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
      drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
      drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
      drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
      drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
      drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
      drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
      drm/xe/svm: Add xe_svm_find_vma_start() helper
      drm/xe/svm: Implement prefetch support for SVM ranges
      drm/xe/vm: Add debug prints for SVM range prefetch
      drm/xe/svm: Avoid duplicate eviction on get_pages() failure
      drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()

John Harrison (4):
      drm/xe/guc: Remove double blank line
      drm/xe/guc: Add missing H2G error code definitions
      drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
      drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from

Karthik Poosa (7):
      drm/xe/hwmon: Add support to manage power limits though mailbox
      drm/xe/hwmon: Move card reactive critical power under channel card
      drm/xe/hwmon: Add support to manage PL2 though mailbox
      drm/xe/hwmon: Expose powerX_cap_interval
      drm/xe/hwmon: Read energy status from PMT
      drm/xe/hwmon: Expose power sysfs entries based on firmware support
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Lucas De Marchi (13):
      drm/xe/guc_submit: Simplify and fix diff calculation
      drm/xe/hwmon: Simplify and fix 32b wrap
      drm/xe/configfs: Drop trailing semicolons
      drm/xe: Convert "fused off" messages to be gt-based
      drm/xe: Allow to disable engines
      drm/xe/configfs: Add attribute to disable engines
      drm/xe/configfs: Add internal API to documentation
      drm/xe/lrc: Use a temporary buffer for WA BB
      drm/xe/lrc: Prepare WA BB setup for more users
      drm/xe: Fix kconfig prompt
      drm/xe/guc: Default log level to non-verbose
      drm/xe: Annotate default for guc_log_level param
      drm/xe: Fix memset on iomem

Maarten Lankhorst (12):
      drm/xe/svm: Fix regression disallowing 64K SVM migration
      drm/xe: Remove IOSF_MBI select.
      drm/xe: Use xe_ggtt_map_bo_unlocked for resume
      drm/xe: Add xe_ggtt_might_lock
      drm/xe: Add xe_ggtt_alloc
      drm/xe/display: Remove dereferences of ggtt for tile id
      drm/xe/ggtt: Seperate flags and address in PTE encoding
      drm/xe/display: Dont poke into GGTT internals to fill a DPT
      drm/xe/display: Convert GGTT mapping to use pte_encode_flags
      drm/xe: Remove pte_encode_bo callback
      drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
      drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests

Maciej Patelczyk (1):
      drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()

Matt Atwood (1):
      drm/xe/ptl: Update the PTL pci id table

Matt Roper (3):
      drm/xe: GSM size should be constant on most platforms
      drm/xe/pat: Determine ATS / PTA programming during early sw init
      drm/xe/pat: Consolidate PAT programming logic for pre-Xe2 and post-Xe2

Matthew Auld (5):
      drm/xe/bo: optimise CCS case for WB pages
      drm/xe/vm: move rebind_work init earlier
      drm/xe/vm: move xe_svm_init() earlier
      drm/xe/sched: stop re-submitting signalled jobs
      drm/xe/guc_submit: add back fix

Matthew Brost (14):
      drm/xe: Strict migration policy for atomic SVM faults
      drm/gpusvm: Add timeslicing support to GPU SVM
      drm/xe: Timeslice GPU on atomic SVM fault
      drm/xe: Add atomic_svm_timeslice_ms debugfs entry
      drm/xe: Do not warn on SVM migration failing because of 64k requirements
      drm/xe: Make VMA tile_present, tile_invalidated access rules clear
      drm/xe: Reorder 'Get pages failed' message
      drm/xe: Don't use drm exec locking in SVM pagefaults
      drm/xe: Use WRITE_ONCE for range->tile_invalidated update
      drm/xe: Make WA BB part of LRC BO
      drm/xe: Do not kill VM in PT code on -ENODATA
      drm/xe: Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of parallel offset
      drm/xe: Add xe_vm_has_valid_gpu_mapping helper
      drm/xe: Opportunistically skip TLB invalidaion on unbind

Michal Wajdeczko (15):
      drm/xe/guc: Unblock GuC buffer cache for all modes
      drm/xe/guc: Don't allocate managed BO for each policy change
      drm/xe: Allow to trigger GT resets using debugfs writes
      drm/xe: Convert page fault messages to be GT-oriented
      drm/xe: Use GT-oriented printer to dump topology on init
      drm/xe/guc: Resend potentially lost H2G MMIO request
      drm/xe/vf: Introduce helpers to access GGTT configuration
      drm/xe/vf: Move tile-related VF functions to separate file
      drm/xe/vf: Add sanity check for GGTT configuration
      drm/xe/topology: Simplify code for loading DSS mask
      drm/xe/topology: Use register array size instead magic number
      drm/xe/topology: Stop trying to fix programming mistakes
      drm/xe/uc: Use GT-oriented firmware messages
      drm/xe/tests: Drop unused xe_device_fn typedef
      drm/xe/tests: Convert xe_pci tests to parametrized tests

Niranjana Vishwanathapura (1):
      drm/xe: Create LRC BO without VM

Nitin Gote (1):
      drm/xe/xe3: Disable null query for anyhit shader

Piotr Piórkowski (1):
      drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device

Raag Jadav (1):
      drm/xe: drop redundant conversion to bool

Rodrigo Vivi (2):
      drm/xe: Make xe_gt_freq part of the Documentation
      drm/xe: Add missing documentation of rpa_freq

Satyanarayana K V P (1):
      drm/xe: Add helper function to inject fault into ct_dead_capture()

Shekhar Chauhan (3):
      drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
      drm/xe/xe2_hpg: Add set of workarounds
      drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID

Shuicheng Lin (1):
      drm/xe: Use xe_mmio_read32() to read mtcfg register

Tejas Upadhyay (1):
      drm/xe/mocs: Check if all domains awake

Thomas Hellström (4):
      drm/xe: Fix the gem shrinker name
      drm/xe: Make the gem shrinker drm managed
      drm/xe: Rework eviction rejection of bound external bos
      Merge drm/drm-next into drm-xe-next

Tomasz Lis (5):
      drm/xe/vf: Divide GGTT ballooning into allocation and insertion
      drm/xe/vf: Shifting GGTT area post migration
      drm/xe/guc: Introduce enum with offsets for context register H2Gs
      drm/xe/vf: Fixup CTB send buffer messages after migration
      drm/xe/vf: Fail migration recovery if fixups needed but platform not supported

Umesh Nerlige Ramappa (3):
      drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
      drm/xe: Save the gt pointer in lrc and drop the tile
      drm/xe: Add WA BB to capture active context utilization

Vinay Belgaumkar (3):
      drm/xe/guc: Ignore GuC CT errors when wedged
      drm/xe/bmg: Update Wa_16023588340
      drm/xe/bmg: Update Wa_14022085890

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  48 +++
 Documentation/gpu/xe/xe_configfs.rst               |  10 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  34 ++
 drivers/gpu/drm/xe/Kconfig                         |   6 +-
 drivers/gpu/drm/xe/Kconfig.debug                   |  11 +-
 drivers/gpu/drm/xe/Makefile                        |   3 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |  31 ++
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |  14 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  50 ++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   6 +-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |   1 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |   3 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   2 -
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |   5 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   4 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |  11 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  69 ++--
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |  24 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h             |  11 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  69 ++--
 drivers/gpu/drm/xe/xe_bo_evict.c                   |   4 +-
 drivers/gpu/drm/xe/xe_configfs.c                   | 160 +++++++++
 drivers/gpu/drm/xe/xe_configfs.h                   |  11 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |  38 ++
 drivers/gpu/drm/xe/xe_device.c                     |  21 +-
 drivers/gpu/drm/xe/xe_device.h                     |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   7 +
 drivers/gpu/drm/xe/xe_drv.h                        |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       | 249 +++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h                       |  24 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  96 ++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c               | 106 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                | 297 ++++++++--------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |  21 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  32 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   3 -
 drivers/gpu/drm/xe/xe_gt_topology.c                |  44 +--
 drivers/gpu/drm/xe/xe_guc.c                        |  19 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  27 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |   4 -
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 330 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   7 +
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |  15 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.h                    |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  17 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  25 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  37 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      | 264 +++++++++-----
 drivers/gpu/drm/xe/xe_lrc.c                        |  99 ++++--
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   3 -
 drivers/gpu/drm/xe/xe_map.h                        |  18 +
 drivers/gpu/drm/xe/xe_module.c                     |  11 +-
 drivers/gpu/drm/xe/xe_oa.c                         | 212 +++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h                   |   6 +
 drivers/gpu/drm/xe/xe_pat.c                        |  44 ++-
 drivers/gpu/drm/xe/xe_pci.c                        |   1 +
 drivers/gpu/drm/xe/xe_pt.c                         | 135 ++++++--
 drivers/gpu/drm/xe/xe_pxp.c                        | 153 +++++----
 drivers/gpu/drm/xe/xe_query.c                      |   4 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |  37 +-
 drivers/gpu/drm/xe/xe_shrinker.h                   |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  58 ++++
 drivers/gpu/drm/xe/xe_svm.c                        | 308 ++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h                        | 138 ++++++++
 drivers/gpu/drm/xe/xe_tile.c                       |   6 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c              | 254 ++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h              |  18 +
 drivers/gpu/drm/xe/xe_tuning.c                     |   5 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  56 ++-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |   2 +
 drivers/gpu/drm/xe/xe_vm.c                         | 381 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h                         |  24 ++
 drivers/gpu/drm/xe/xe_vm_types.h                   |  26 +-
 drivers/gpu/drm/xe/xe_vsec.c                       |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                       |   4 +
 drivers/gpu/drm/xe/xe_wa.c                         |  46 ++-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |  11 +-
 include/drm/drm_gpusvm.h                           |   5 +
 include/drm/intel/pciids.h                         |   7 +-
 include/uapi/drm/xe_drm.h                          |   4 +
 86 files changed, 3249 insertions(+), 1142 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h
