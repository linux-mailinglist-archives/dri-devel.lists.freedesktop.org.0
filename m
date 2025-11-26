Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B782C879E3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229B10E4CC;
	Wed, 26 Nov 2025 00:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mG7VX6Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1710E4C9;
 Wed, 26 Nov 2025 00:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764117877; x=1795653877;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8YF1Zkn306aWvgg78QUNvySxDUrd1qW+1DoxX8RB+os=;
 b=mG7VX6Ypa3M+dv7n30uYs05DosZa6mAVe2cted2d9XS0O/yw6zoDBNoV
 rqiQ8JdXqVl5OjTuUPvh/F5gPSnsFVjzDdzQGyu0Inr37ddXe9WyP+Nc5
 +OgLDcdFFOXBXRT1gR/gapR9TSMq5qVYixRC0/i0RvQ4GkikShDz4tMU4
 +RMY+YgCUXE3K3AArc/cLiOrqMAPtcgiw3bvy0gNd846DReyq8N6Wa7mX
 Em3/RkabRzreb0vnPr7Gm+ttIneKvy1hreBP2sSZnxXmp8Ono5pi2quMW
 pxiRCpSDfG525aK7Z8fymJk93uV2faIp3z/zVDto4NmfMIzivVtZFE5u/ w==;
X-CSE-ConnectionGUID: x+7DC4zTRRK1MYRiBJ5MXw==
X-CSE-MsgGUID: J11WeEuVTsKP2yZcYZL52Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66189500"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="66189500"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:43:21 -0800
X-CSE-ConnectionGUID: wZxAOmoaTganwgLRpHd69g==
X-CSE-MsgGUID: O8xKhqjhRi2VR81mdeJQlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="197270171"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:43:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:43:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 16:43:22 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:43:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7nNqN5lzruvvc76TLoe8lGIbrNPzouymM/YVsQukfT7lj2m64YjvBohos6dUov7Lv3FxcL424mTxosonxtRtueEqpQlP3TcIWHhUlAEOg/wurl1NQf0i06+n8LfMyGJnFhA/kUcZzNpWGqBlBxr8m4j96rAYp0U2Wmm9Kyjkd3PfAS/OgByLVMTB/gRHDNKxZYNRn/o48TgukMXrkwW+i4HCyx6MBNNI2EB6IdUMrFgR/D9P+6g+RRdpixFvk759UXT5icKo9KHrkSnsG/b0frlhe7DVD8GPCIf/8yrX/OodZYakAm+l78+FN1Zc68FDxhtl7UxyatfRViMBqFz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIGG/ymouj8YlHYUTVi1oBnKF7EV62h3ovHR4+f/l24=;
 b=Ip1HWOQAq4PhNOSblCPfHh7jrIxRmxxOXdvK+PJV925bUg0zZeScl4Kc7cunRTBpmzF1TgLx2PB+dhCCNQtAhTsuyBl98Im227c0LHR8hLBuydntbQzlIyG4wHZSx1bBN36T8Mu6twqiHkok0Te/u2OMyLk0vbMpKEQ/KxchFEjvVj5dl2ldJZYSt+a1pKokodfpXZ4vqcEtqS5V+857I4meZ5IP5CZrCm6M2cXjlpxXaTFiIQ4oiCEu1CxQxkNDe/A/nueLC/tHLKJpwxJ0TOiXsltXJVbHRmCnIUikeTewKErRBVwixjffIAcxsXBO5qePUH/zmAOgYC2PPeMP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 00:43:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:43:19 +0000
Date: Tue, 25 Nov 2025 16:43:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 13/17] drm/xe/uapi: Extend the madvise functionality
 to support foreign pagemap placement for svm
Message-ID: <aSZNJYLrBKVuxl06@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0382.namprd04.prod.outlook.com
 (2603:10b6:303:81::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfbe657-7b5f-48bb-224e-08de2c84cbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gufU2oub8U8CmYqE9heU2t9hF34NpcncqPgATi1DKK/0k/dGqtxdUMLiQT?=
 =?iso-8859-1?Q?/yUKtHw0Q0BIBE04iTilPYU0f2ms5NNheUHwuGMaCC+ytxeyMBzgR35UNu?=
 =?iso-8859-1?Q?EIqF0WbKFCsbx9VQFwT+2WcP1hef9VbS89dlj+ebQXCWDXQhnd4h4NWwVT?=
 =?iso-8859-1?Q?IGlCUEviGUHNTdZfHcZw3bmSlgNxsnuclQaavnWJKUSN1QdLVhHsWbX1kU?=
 =?iso-8859-1?Q?8DSIHJZ4JjvDoSayb3cjssxzdKQiY4xJJ252fJtdUh5ZsfbHoJ9TM53rfw?=
 =?iso-8859-1?Q?XIaf+Mmlx0P5+V9lHdC096ngvind4j+wiRICLDfC0g4GGUsl7B0K9SyR5H?=
 =?iso-8859-1?Q?jd/LXrW6MhJ8fI3YFBfXbjH24p0QuNjHjoCU+b2f4PeXA1BdZsr1pm0kiD?=
 =?iso-8859-1?Q?S4iDjKQUJJL4AWGUjugWVNNDCWQdlcrwMSRKMGMfwehiLvTLQLnwcOp0DR?=
 =?iso-8859-1?Q?hYnEJMbycvDnKg++63bQ5PI4vivgSOfnefKuOm0qiHOmNRSSJdt0o6Bis5?=
 =?iso-8859-1?Q?JtOHjzcrEF0zek1CTr3/fMhC4YvaY3iW8fwWGcRiEVeL02w7m0K0oZilP5?=
 =?iso-8859-1?Q?mVVpAlmPN+tcd28kDFcBqLPr5fBc70QTkEHo8BB/oszXBE/rQpmrTJLaOE?=
 =?iso-8859-1?Q?W6qvOhllHJ6dnlnjhKojB8QwgGWkYVRh9HD1gzr/2HUmib3Ro8Es60tzBg?=
 =?iso-8859-1?Q?oML/yvZvdtMk/1ho9VdfvThtPCDYv0oXuYf0Azypjf0td8E/v4YEag09jR?=
 =?iso-8859-1?Q?B8XoZ693uVbRoppBO3NWbrqz50Fkc5OvQzjq6O4SdMt64i+p0BR3cC8RZK?=
 =?iso-8859-1?Q?mLHregvjeOTxINVMujvyAapLIxQStfOFBL7XrCu1JsvXqR8c1PKP3HeX+Q?=
 =?iso-8859-1?Q?XWPe70D2rYsie9BcjrCA5Crs+O+OXRV22cd6fWjr2lM86emQRCRikvMArC?=
 =?iso-8859-1?Q?L1gOf2XfbPhE1xeRz/P2IaOJDSKhYpvmkF3IA5r7zVOFHmn2ezqVQ/MlmD?=
 =?iso-8859-1?Q?DGpoX2+uBcReIA/Btm40HOw7fIHLn13vJQOPRCAd4QjLLCXV0RHSgX8Egr?=
 =?iso-8859-1?Q?PTKvwhkXiur8/QEqk0U8cDIteJiXcYYnliT/iB+KsGl445dR69MYqh5Y54?=
 =?iso-8859-1?Q?i7OdM40Fw9oKVfx7qPQLpHd9nBis8FnSIX1OLz/7tXcluxgQxzEwylp/tm?=
 =?iso-8859-1?Q?/vaEOMngBjgEEuR6i2IozmXiHsadcKuQdnABlNC9FqvoB2PFJjcftO8pL+?=
 =?iso-8859-1?Q?vJNfPJAykBMpcvdsbztTDjkemmU0zI5M/d8bjJyIbckMtiInO2s3vAIQxS?=
 =?iso-8859-1?Q?z+EVP3oto4TkMumulWaSnuTS0OuycGzlbCQd50490ZhO2TjXnoH/2DoREn?=
 =?iso-8859-1?Q?zmP4ZfaY5kbE8JNuSOnOv8ViQnRpzPu2VomueFEwnvAP6XlKoYULyV+2ZE?=
 =?iso-8859-1?Q?vVmFZBMd+TTT+zMnetTPykOQ3lhJCKSO7Z7TYgF13N6tCuYIMVAJ/DTTpV?=
 =?iso-8859-1?Q?v2CXJ1dmYwOOrAampfqo+e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jFnIfj9ACFsEjSRYn5Dxnr/v3iWZFbH4JJcxtBzBSxGg5luOnLanK+6gpJ?=
 =?iso-8859-1?Q?dRWVzPatopkXMfmlUuip/GLCrPp2v8Hourqp/7tmqY3qgSWvgjUKAGMC0T?=
 =?iso-8859-1?Q?bxJW+yKaro9pBABpBTbcQoSSHoFbv2uK1gfUY2N9TqZul3blVWIj4R4qYJ?=
 =?iso-8859-1?Q?xj9qNuMttrNYsLSTfe5oRI/d8t50EqMrYwFeCMetSlX9J9Bewn6FBjhqXH?=
 =?iso-8859-1?Q?LSGHrs3cKwfpNnD7lGA8MUrxXxGJab866BkmtV/Kn126slEonYJploussy?=
 =?iso-8859-1?Q?qW6QaX7aSFRJZM6jSTdeim5gav/wB61bmc+t9eXNYHIz9wSpD/Jv8TQFx3?=
 =?iso-8859-1?Q?YCtguvkdzLBUeJElFDm3u0aFrViFrqsCwKmQ+WRPQbcQ7mbhbdL8CziHLZ?=
 =?iso-8859-1?Q?sjr8rmDU+9mfBNP74LRUNc26H+Rz4kaGr19xu9efewnYQVYU2BZy2bFmYW?=
 =?iso-8859-1?Q?WmxXpxpdVr5w83vns0ZHIiODuWpm2UjdDwfuOOBJ2ChoqBlZimmQApmATp?=
 =?iso-8859-1?Q?hlFdFHRjlIjnfuAhBa+JTRJqkvAJwHJ4Lu7GnNNvs/a8Zfe7fhY/5ormdH?=
 =?iso-8859-1?Q?Rxwj0QZ3Zd227mxaTp7eh7DnyRnrZgwfRHqs4nTz88ajGiDs4fPSe7I8Bo?=
 =?iso-8859-1?Q?gmnYvZW+M0RcUyZl243CwzqTN+B8pyve9gUuGxcoY+KnujxHsRI00+X2xO?=
 =?iso-8859-1?Q?EfFsH4WnoIg2v4tZuZWSTk+ihFg+dRRN4kvQv5dPcS0MvoHuA3H4jdBiyY?=
 =?iso-8859-1?Q?9MdJwZ9bz/bpa3MGevZlPIcM65JjYwj9E08NhN6/tk6RotgBMrGmMUbW/8?=
 =?iso-8859-1?Q?3kG/ogSEF/O/ZUznpxG9Ko5thF7f5XtjrMj+/J/xCz0UpyNen82v1s4Uge?=
 =?iso-8859-1?Q?a9x4U+3rel+emRgekpaHzMQJkd4XeVK5iZ3J46fVo86sj9NUMHpZj0IYn1?=
 =?iso-8859-1?Q?FclWseLpJhqsWMQ8p9LtkuCKwc6v+VA7TRDnU1NVerGYor95WRSJ+UY1nh?=
 =?iso-8859-1?Q?maxNy2QATlg19px2eEssA4cpzwNdkuPbmuOjTf5TIsgxUepJ++/5B3JS01?=
 =?iso-8859-1?Q?TgYHP8NenYZeI8OB8bIoP48yARmhOKiGsXfsAvhA6IwF7l3V3C1j8GqeC1?=
 =?iso-8859-1?Q?Mev9LznvWd+ImFEynFGDA0h8LKVsQMjXT7YW9p5iCXQBlDVPS5Mw2YdrUF?=
 =?iso-8859-1?Q?joII4b+kPTSW3vqdabYyOw/TvbFcYlz5u3Mvtr7v1z8T3MkJo66hj2LkFY?=
 =?iso-8859-1?Q?FlDgX/a8lI8roVWatT6qEbyUEyeddP3V8xz3pJQSMiZg3liQyka45ngamj?=
 =?iso-8859-1?Q?uW0jYAO0gEWdRyYQLJyHc1fHMAqHdtgPECvl83Jt3bozcdpBVisxW+KYpG?=
 =?iso-8859-1?Q?3dG9aAFcjETOtum6T5kKTHaI162VQpUICXw/TpXMOZVWcmBRTJhYNv//2U?=
 =?iso-8859-1?Q?rO/Fcm4W6ErxrAKArTdjCW6lmaWwNODPW80t7OOpXZXu0KCjiamFFs+Yp/?=
 =?iso-8859-1?Q?tf5A+SKkPviq+v9WVZPZgwTKQ9uSUs4kGdy5AFalG/5k7A4dbRdNBxO2xe?=
 =?iso-8859-1?Q?guZFnTQ1c9zQ/ZbAPBuG1P9Xh2964tehv+r7KaERUijcVbVR5JskVf2dnt?=
 =?iso-8859-1?Q?W6SsaXaWdtmjSLdASbmNSgOaAkCl08Ti0n2pRVbaCjaLR5QwuSSOUYcA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfbe657-7b5f-48bb-224e-08de2c84cbab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:43:19.8947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uhEjQOAuXKjtBOuS3X3QWCqIpJqXGCUes/O6yjJKfMlspYRH54Gzt4PTNMaBof2tVIkn745PjMZznp6PgVUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Tue, Nov 11, 2025 at 05:44:03PM +0100, Thomas Hellström wrote:
> Use device file descriptors and regions to represent pagemaps on
> foreign or local devices.
> 
> The underlying files are type-checked at madvise time, and
> references are kept on the drm_pagemap as long as there is are
> madvises pointing to it.
> 
> Extend the madvise preferred_location UAPI to support the region
> instance to identify the foreign placement.
> 
> v2:
> - Improve UAPI documentation. (Matt Brost)
> - Sanitize preferred_mem_loc.region_instance madvise. (Matt Brost)
> - Clarify madvise drm_pagemap vs xe_pagemap refcounting. (Matt Brost)
> - Don't allow a foreign drm_pagemap madvise without a fast
>   interconnect.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 14 +++++
>  drivers/gpu/drm/xe/xe_device.h     |  2 +
>  drivers/gpu/drm/xe/xe_svm.c        | 78 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h        |  7 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 86 ++++++++++++++++++++++++++----
>  include/uapi/drm/xe_drm.h          | 18 +++++--
>  6 files changed, 191 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ff598d0c68d7..2465c7a9a63e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -373,6 +373,20 @@ static const struct file_operations xe_driver_fops = {
>  	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
> +/**
> + * xe_is_xe_file() - Is the file an xe device file?
> + * @file: The file.
> + *
> + * Checks whether the file is opened against
> + * an xe device.
> + *
> + * Return: %true if an xe file, %false if not.
> + */
> +bool xe_is_xe_file(const struct file *file)
> +{
> +	return file->f_op == &xe_driver_fops;
> +}
> +
>  static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..475e2245c955 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -195,6 +195,8 @@ void xe_file_put(struct xe_file *xef);
>  
>  int xe_is_injection_active(void);
>  
> +bool xe_is_xe_file(const struct file *file);
> +
>  /*
>   * Occasionally it is seen that the G2H worker starts running after a delay of more than
>   * a second even after being queued and activated by the Linux workqueue subsystem. This
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 006de141dfa7..c0b17b548a00 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1788,6 +1788,78 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static struct drm_pagemap *xe_devmem_open(struct xe_device *xe, u32 region_instance)
> +{
> +	u32 tile_id = region_instance - 1;
> +	struct xe_pagemap *xpagemap;
> +	struct drm_pagemap *dpagemap;
> +	struct xe_vram_region *vr;
> +
> +	if (tile_id >= xe->info.tile_count)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!((BIT(tile_id) << 1) & xe->info.mem_region_mask))
> +		return ERR_PTR(-ENOENT);
> +
> +	vr = xe_tile_to_vr(&xe->tiles[tile_id]);
> +	xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
> +	if (IS_ERR(xpagemap))
> +		return ERR_CAST(xpagemap);
> +
> +	/* Below is for clarity only. The reference counter is the same. */
> +	dpagemap = drm_pagemap_get(&xpagemap->dpagemap);
> +	xe_pagemap_put(xpagemap);

I think this is overkill, maybe just a comment above
xe_pagemap_find_or_create indicating this function returns xpagemap with
a ref.

Either way, LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
> +	return dpagemap;
> +}
> +
> +/**
> + * xe_drm_pagemap_from_fd() - Return a drm_pagemap pointer from a
> + * (file_descriptor, region_instance) pair.
> + * @fd: An fd opened against an xe device.
> + * @region_instance: The region instance representing the device memory
> + * on the opened xe device.
> + *
> + * Opens a struct drm_pagemap pointer on the
> + * indicated device and region_instance.
> + *
> + * Return: A reference-counted struct drm_pagemap pointer on success,
> + * negative error pointer on failure.
> + */
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	struct drm_pagemap *dpagemap;
> +	struct file *file;
> +	struct drm_file *fpriv;
> +	struct drm_device *drm;
> +	int idx;
> +
> +	if (fd <= 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	file = fget(fd);
> +	if (!file)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!xe_is_xe_file(file)) {
> +		dpagemap = ERR_PTR(-ENOENT);
> +		goto out;
> +	}
> +
> +	fpriv = file->private_data;
> +	drm = fpriv->minor->dev;
> +	if (!drm_dev_enter(drm, &idx)) {
> +		dpagemap = ERR_PTR(-ENODEV);
> +		goto out;
> +	}
> +
> +	dpagemap = xe_devmem_open(to_xe_device(drm), region_instance);
> +	drm_dev_exit(idx);
> +out:
> +	fput(file);
> +	return dpagemap;
> +}
> +
>  #else
>  
>  int xe_pagemap_shrinker_create(struct xe_device *xe)
> @@ -1811,6 +1883,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  {
>  	return NULL;
>  }
> +
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index a0ec173c6bf0..60eae01a4220 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -187,6 +187,8 @@ int xe_pagemap_shrinker_create(struct xe_device *xe);
>  
>  int xe_pagemap_cache_create(struct xe_tile *tile);
>  
> +struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance);
> +
>  #else
>  #include <linux/interval_tree.h>
>  #include "xe_vm.h"
> @@ -378,6 +380,11 @@ static inline int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +
>  #define xe_svm_range_has_dma_mapping(...) false
>  #endif /* CONFIG_DRM_XE_GPUSVM */
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index d6f47c8e146d..add9a6ca2390 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -22,6 +22,19 @@ struct xe_vmas_in_madvise_range {
>  	bool has_svm_userptr_vmas;
>  };
>  
> +/**
> + * struct xe_madvise_details - Argument to madvise_funcs
> + * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
> + *
> + * The madvise IOCTL handler may, in addition to the user-space
> + * args, have additional info to pass into the madvise_func that
> + * handles the madvise type. Use a struct_xe_madvise_details
> + * for that and extend the struct as necessary.
> + */
> +struct xe_madvise_details {
> +	struct drm_pagemap *dpagemap;
> +};
> +
>  static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
>  {
>  	u64 addr = madvise_range->addr;
> @@ -74,7 +87,8 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
>  
>  static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  				      struct xe_vma **vmas, int num_vmas,
> -				      struct drm_xe_madvise *op)
> +				      struct drm_xe_madvise *op,
> +				      struct xe_madvise_details *details)
>  {
>  	int i;
>  
> @@ -96,14 +110,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  			 * is of no use and can be ignored.
>  			 */
>  			loc->migration_policy = op->preferred_mem_loc.migration_policy;
> +			drm_pagemap_put(loc->dpagemap);
>  			loc->dpagemap = NULL;
> +			if (details->dpagemap)
> +				loc->dpagemap = drm_pagemap_get(details->dpagemap);
>  		}
>  	}
>  }
>  
>  static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
> -			   struct drm_xe_madvise *op)
> +			   struct drm_xe_madvise *op,
> +			   struct xe_madvise_details *details)
>  {
>  	struct xe_bo *bo;
>  	int i;
> @@ -144,7 +162,8 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  			      struct xe_vma **vmas, int num_vmas,
> -			      struct drm_xe_madvise *op)
> +			      struct drm_xe_madvise *op,
> +			      struct xe_madvise_details *details)
>  {
>  	int i;
>  
> @@ -162,7 +181,8 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
> -			     struct drm_xe_madvise *op);
> +			     struct drm_xe_madvise *op,
> +			     struct xe_madvise_details *details);
>  
>  static const madvise_func madvise_funcs[] = {
>  	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> @@ -246,11 +266,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
>  			return false;
>  
> -		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> -				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> +		if (XE_IOCTL_DBG(xe, fd <= DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
> +				 args->preferred_mem_loc.region_instance != 0))
>  			return false;
>  
> -		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>  			return false;
>  
>  		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
> @@ -296,6 +317,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  	return true;
>  }
>  
> +static int xe_madvise_details_init(struct xe_vm *vm, const struct drm_xe_madvise *args,
> +				   struct xe_madvise_details *details)
> +{
> +	struct xe_device *xe = vm->xe;
> +
> +	memset(details, 0, sizeof(*details));
> +
> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		int fd = args->preferred_mem_loc.devmem_fd;
> +		struct drm_pagemap *dpagemap;
> +
> +		if (fd <= 0)
> +			return 0;
> +
> +		dpagemap = xe_drm_pagemap_from_fd(args->preferred_mem_loc.devmem_fd,
> +						  args->preferred_mem_loc.region_instance);
> +		if (XE_IOCTL_DBG(xe, IS_ERR(dpagemap)))
> +			return PTR_ERR(dpagemap);
> +
> +		/* Don't allow a foreign placement without a fast interconnect! */
> +		if (XE_IOCTL_DBG(xe, dpagemap->pagemap->owner != vm->svm.peer.owner)) {
> +			drm_pagemap_put(dpagemap);
> +			return -ENOLINK;
> +		}
> +		details->dpagemap = dpagemap;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_madvise_details_fini(struct xe_madvise_details *details)
> +{
> +	drm_pagemap_put(details->dpagemap);
> +}
> +
>  static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>  				   int num_vmas, u32 atomic_val)
>  {
> @@ -349,6 +405,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	struct drm_xe_madvise *args = data;
>  	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
>  							 .range =  args->range, };
> +	struct xe_madvise_details details;
>  	struct xe_vm *vm;
>  	struct drm_exec exec;
>  	int err, attr_type;
> @@ -373,13 +430,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		goto unlock_vm;
>  	}
>  
> -	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	err = xe_madvise_details_init(vm, args, &details);
>  	if (err)
>  		goto unlock_vm;
>  
> +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	if (err)
> +		goto madv_fini;
> +
>  	err = get_vmas(vm, &madvise_range);
>  	if (err || !madvise_range.num_vmas)
> -		goto unlock_vm;
> +		goto madv_fini;
>  
>  	if (madvise_range.has_bo_vmas) {
>  		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> @@ -387,7 +448,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  						    madvise_range.num_vmas,
>  						    args->atomic.val)) {
>  				err = -EINVAL;
> -				goto unlock_vm;
> +				goto madv_fini;
>  			}
>  		}
>  
> @@ -413,7 +474,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	}
>  
>  	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> -	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
> +				 &details);
>  
>  	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
>  
> @@ -425,6 +487,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		drm_exec_fini(&exec);
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas = NULL;
> +madv_fini:
> +	xe_madvise_details_fini(&details);
>  unlock_vm:
>  	up_write(&vm->lock);
>  put_vm:
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..34c69bcea203 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2071,7 +2071,13 @@ struct drm_xe_madvise {
>  		struct {
>  #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
>  #define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> -			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +			/**
> +			 * @preferred_mem_loc.devmem_fd:
> +			 * Device file-descriptor of the device where the
> +			 * preferred memory is located, or one of the
> +			 * above special values. Please also see
> +			 * @preferred_mem_loc.region_instance below.
> +			 */
>  			__u32 devmem_fd;
>  
>  #define DRM_XE_MIGRATE_ALL_PAGES		0
> @@ -2079,8 +2085,14 @@ struct drm_xe_madvise {
>  			/** @preferred_mem_loc.migration_policy: Page migration policy */
>  			__u16 migration_policy;
>  
> -			/** @preferred_mem_loc.pad : MBZ */
> -			__u16 pad;
> +			/**
> +			 * @preferred_mem_loc.region_instance : Region instance.
> +			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
> +			 * Otherwise should point to the desired device
> +			 * VRAM instance of the device indicated by
> +			 * @preferred_mem_loc.devmem_fd.
> +			 */
> +			__u16 region_instance;
>  
>  			/** @preferred_mem_loc.reserved : Reserved */
>  			__u64 reserved;
> -- 
> 2.51.1
> 
