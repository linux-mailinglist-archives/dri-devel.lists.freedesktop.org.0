Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42A876726
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5810F4AB;
	Fri,  8 Mar 2024 15:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2qW0ptO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A4810F3BB;
 Fri,  8 Mar 2024 15:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709910997; x=1741446997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BK1glXCMKLlJgDljpsVP6RVi1C4Ab7umegz9oJqWtWw=;
 b=X2qW0ptO8dX2gJy/k7uNl7vFn0END9hg4eEA58V6b2PedP0NEnkiZpw5
 Vl4PiFTSRVG1P081gE0jowqSr88Z3SVnHYIDq75C4JzvSgGzWJgAqLKiy
 /uLo9uAyuBLIEPTZv5En0JShoG+DlKOz78l6GbUKRarqPK/b4bMvlR8kQ
 UaIQj+rhQYICTpqYwtL/CATKPaTNGxN63ps2cIYRjahh3piF+NJZPcnHZ
 VVMHIddF6q0VlW9paOc3zJpMx4yCWAFTgbH1dC6ZE+vJEKIBqnxSaqmqt
 cUtlF4GRwJvQgNEB9tqb+Vqu3TI3jUMRDuHXL4k+is8dR6PEC+S8QoaTw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5233161"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="5233161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10417014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:12:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:12:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:12:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:12:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkQylCMKWm1p+8z0jd5ut+02e3bl0UBymyuwaWm/U9AEA5NSMR/6TVMcUATILHUXMRQvqQK1p02rheXPlLmm6bU+kZh4Tgw8YI4r1sj77kdVhP6hqERXz1DyIAEFRZf6cBveeYk9FR8R/T2Hmdlrry0+dPFSV+eDSomWVyIZmdmSBfDG33UrImgOyDbDW/2/hmF8ciGfFzA+Bj5o1roiAFKaJ149zNdsJZOXxoGEUNeC0rwwVj45ahWQyHcBx04p96er6BkWAt7laFAp0uu8lCopx+SMY/Ozkqt7rUcYHmgBKL+MxZgGmGyhe00v1IrDXPOMmdUkWvMZbYsCwD6g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY1v95TGEyTKvi8asMXeC4pvAEvbpCb6jxf4CZOx6nE=;
 b=AOBDIVYKpamHYA/+wbO2LEHsHL5zfCvdlcKnPbODYhmME3vPNTLdSNj3uiJ7GSKLvF+tvEd3LNRk712bT4VfD8E8TnFjas7pM8SaiHs9LX/U5LRtlHSEMLfMYGpjqsLrQd8NIR+Pk5urIoU/Ip8NMQyhQFlU7Wo+J8vDXyJdoOT1ehgcvWWKeCH0JJ3cs8cMNKJEB7/Lh/FeUbeu797iVSOUWAO7HgvrYPtqSrTVft+ktrwce4PKVy+715TDkLlfsylCsERMxt1dyrkovErCBJQ2F1JNi9UfWddpw/TiMCx7zfETazPtJnGX/pAY9/e9MLmVqgQV0gV19Ule4HSnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 15:12:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 15:12:10 +0000
Date: Fri, 8 Mar 2024 09:12:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH v2 14/16] drm/dp_mst: avoid includes in
 drm_dp_mst_topology_internal.h
Message-ID: <5ok4ekttwsrlnmtvytgxe7l7k3bkozrbyhpuurwql6k6leewut@pytcbqi5ju7f>
References: <cover.1709898638.git.jani.nikula@intel.com>
 <83d96b40724e7fd18bec81a9c6c935dbe924da91.1709898638.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <83d96b40724e7fd18bec81a9c6c935dbe924da91.1709898638.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8eb8fa-c741-4b81-7899-08dc3f822088
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbyGX+ReF8f58MLKbL1N5qoRle4T6NhfSlBldeIdT9OKj3tW4u5VDAMMYGJe+5hRuWmvRaSO8CMHOKPNlG4CiFrj6yBaYQtMTFwvrf0ranRIiJAfQJfR9Y8XNdD0+LS2TOxGj+mugkYXNJ9O8doaQRtBdKuyOXpWWWX141smS937US25WFdRpIUvbN3OdzvwkdvjnATQ69G1ghFLAaoAfefnHr0YFIxUMcYUuVHwxcIO5bIaJu56dUbA4FIvjTw184fCV0Tkh+b5YnDKGeIdzUg3I/q57ouipOQJdLvat23DrvS9PvMUu3cQ3wXbwBrerUfkfUfClM8vVvtrj8xSTzIrhW7w/hc9aDpOitoEpYwHxSJlATSl5WrzqXixNpnrZd/lnWMStzBnv2gCt5M/cMbneprN0B5PdBA2Cm3qAfFphEMfT7JL4tlT9t2kg4TG1Utt4qn9JAMofWseiW1mlrOEti5kjzZWvX9hvoNsmo1cvsjWn9GZleOGuSZ0U8SE/CA9u0Hb7DL9tAzCaXeqqiiltukKg4AmmYs7lFYoNDsA+y1zwtyFoe6qh204bbolgzwnHft+JRMVz8kNyv7GrhA4MJSkair9/4um7uWoD7E2bNK/ZlVYrbBA4c55fS2bl5v8VLx2pnZoBnxqtrKJgNj4SgmPu2yoEbqrGxgI7pA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTuVvjRy/5w9ySdzhAIUapLBr2o2uzEy5AU5WWu+5YdmTgGzf34SANo8gVdF?=
 =?us-ascii?Q?fsiyqxbgA/H8OqNTLhoWfdQbZWJRfyHxxDEnpIE9jgMp8KADTA9yDXkzV/L7?=
 =?us-ascii?Q?+VPk1HyMZVxs+yU8Np6Q+frZZPA+LY0sjQ99xkE/PBLFFn72Z9bR6hwtcuYN?=
 =?us-ascii?Q?I+o807+bXprNuBVNvywhZ7wcoyLPBs2Hf5iyk1+xXJ6NYixuvyBiXck7udC4?=
 =?us-ascii?Q?JlG5AAJSB+xxTMr+CGc0r55mAkttHuIBCBpxdoXjia/RUQpNo9YPUJ+bbFkR?=
 =?us-ascii?Q?TuA2v1YnpKo3/M7clZ3YewcHucBdB4q8Yz9JoMUaW6tmb0mJ6OoPvsZcx1/9?=
 =?us-ascii?Q?wZq7r9N1yJX/S3cqSvZzFReAZFvqjeHo9fc1MuKnf9Wt18FkKC7inL4/OR0V?=
 =?us-ascii?Q?s3/pllmvyYpSV6kpG89z2XCt19NSTslNGY05LzjgGuY5IfvhJ46wablmJYLi?=
 =?us-ascii?Q?VrVn0C0UsEdySQ9EqJUnaR/h2WDf4ftHCM9/arOuOL8D2nndp6dBxGdqW6j5?=
 =?us-ascii?Q?NZ0a2kVkK8zVSRRSOE5GgsujkuFkIg7X19cfORlUv1uwEdH+DUHyANLneu2U?=
 =?us-ascii?Q?PAOoAAC7h27bXbGIZ9ob+xIo+w+aGIU7wCv8aB4BOvkdqTyq2U1y3ghotbAl?=
 =?us-ascii?Q?tb3RFS7iFkdCFLJ/etm8tpCeNF5JHPygnxgz9aIuIdxeisk0Uv42mu40wrC9?=
 =?us-ascii?Q?OvMdKCU6hHc8fMsd2RCtrXKF277hFXraCmOv7W0RnlWD0q7EGxfv5SjyQTI2?=
 =?us-ascii?Q?eSc/KpOHc4wsWYO5oaBM7/a1zecD0cUf1yt8PVst3VfbmI30yQdzjsRbrlU4?=
 =?us-ascii?Q?0WWNNIsPcGVIFdCXSKVWFnLDCASuIH2B4WY5DBjjv9cLxOm67XzD+xuCw+7F?=
 =?us-ascii?Q?zye6SShAS9fQoXrgyXsfaQJj7rinvd6xpn9o4KcmNvT4WPk92PusSs4Otxoa?=
 =?us-ascii?Q?HvPMYb993Brhqn5bUL/87YcAYdQXVu+Ch6zEvGmAXlsUbbzkMjzextOzt7pR?=
 =?us-ascii?Q?/utNxEt2Rzi4m7Q7bxIpGygRd8/PcdtH1SIcJRNJKxLpNXETRaeh4z50l7VI?=
 =?us-ascii?Q?najcSKVVc5Fn/b1b3ZHYgCNcwKXBvKwxytkCzKMemlotLhCDaaPQrBJfLGbG?=
 =?us-ascii?Q?7Y05q7Fe0EGgEKdFwRiBMgWHMvUKDHREcVt7ov7NcLaCeDKj+KqR3e1PPgYz?=
 =?us-ascii?Q?xA7ZixFXrVXeP8ooNE8pvJf5gbhRFMC1JlBTCCYQcLtCz/WdzBkx0tpKAGXr?=
 =?us-ascii?Q?ztnadhHFPf+ie5XqzdREfjwRKYpi05ocfrfHy5k7pFd3RxPlf7ko1ewRsEUt?=
 =?us-ascii?Q?IfbeTuK+g+EgBkInBqrBHjADoVDBkdLb4D1pHY1Uof1VUvY36JBJZke/9/DH?=
 =?us-ascii?Q?y6EhXJdXDOdugkQB3ZFk+Lr0EdNmRlbJ3S++46AqAIaxQJUBq76A7PMfQeIZ?=
 =?us-ascii?Q?ihmtg/c99upYCB9lU33re0mm0bdNO0IcLJUiX77EWLYR4jeAffh5lTYIHeVu?=
 =?us-ascii?Q?yMoetNIESRWWZ3Qsbf8tkWsofP+8BSXpFNDQZNjg0RpdHw6YyXUESuuxUwov?=
 =?us-ascii?Q?shNupmT7uwdZFF3Ays1v72ilaw4p4bXhRi3C7ErqDlMxAs3/6c9t+7HfLXzm?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8eb8fa-c741-4b81-7899-08dc3f822088
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:12:10.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q54aGZT+e/OO9RIRkokyzOM6j+aKtZgr5SvLyRajWKIjrV9bbiqCtxNJTRK9/L4ohylCn+qdsrAaHWjM9nit9B49jb3gzWEAsfdo379LsHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Fri, Mar 08, 2024 at 01:55:52PM +0200, Jani Nikula wrote:
>Prefer forward declarations over includes where possible.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/display/drm_dp_mst_topology_internal.h | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h b/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
>index a785ccbfdd73..f41c34e26be2 100644
>--- a/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
>+++ b/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
>@@ -10,7 +10,9 @@
> #ifndef _DRM_DP_MST_HELPER_INTERNAL_H_
> #define _DRM_DP_MST_HELPER_INTERNAL_H_
>
>-#include <drm/display/drm_dp_mst_helper.h>
>+struct drm_dp_sideband_msg_req_body;
>+struct drm_dp_sideband_msg_tx;
>+struct drm_printer;
>
> void
> drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
>-- 
>2.39.2
>
