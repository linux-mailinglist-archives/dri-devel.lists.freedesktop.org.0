Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA54F9F222D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 05:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B4B10E0C8;
	Sun, 15 Dec 2024 04:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzwn+uQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B34910E055;
 Sun, 15 Dec 2024 04:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734237462; x=1765773462;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XqAYswb5QS2r50iKHxdwSVXAXU7mI4GsX5KdwgrVSBM=;
 b=dzwn+uQMhdIn8fz9rhgYWkDxzQFKKEfx99IdOYOpbPFNGxlf0pfL1UPB
 Ip/vYRCOIwpTMIwPxrhlXfgxci0/gH/y6ekg6bM/t94NqD/8PChl+Ma0o
 t+1mXzKq/2AfBqhI0svzzJ9rpmHQpjadboJeMm+xClQwXVv5wT1TRqRTr
 Df5kao0qxr384GzR0MmJZs12wU4rIbqp7GVan5kD0JnInCMXDx4BEqFWa
 Jxxx8Z4/gZZLm5WfQ8sYrbSa9BBkxJpNGFCQERG+5yUlMmYF5TvA6/qek
 jMBLsanQoJ48isPg/zdsy1/2uxJptJmb6Ebt6QWwADWWPePUeLD5Xzw80 g==;
X-CSE-ConnectionGUID: S4vUUjtgRTO84ljG48B19Q==
X-CSE-MsgGUID: 14Uk00rnR6S0veR69jOH2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38426471"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="38426471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2024 20:37:41 -0800
X-CSE-ConnectionGUID: 7Bk/QbhISiS++fycwNwocg==
X-CSE-MsgGUID: 77Dk6nf3Ry+rhaqqFeuBxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="96638615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2024 20:37:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 14 Dec 2024 20:37:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 14 Dec 2024 20:37:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 14 Dec 2024 20:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GABDOBq3OFU5hExNU6ef3aqqXkwbalxY4CIG6Sv8p9ZQKtguJPgxKYODhI8Uo/Lsh//VZeQwBNy99QWeUMgjE1rOSL8ktehzvw1iITTUifbsbR8i/JQWbu1zwJ2TblNrqm8cHeej5iuEl5hxHny+bOelN3CDJhd/Pp2h5flcjvnU7+6FzGTKGyH4EoPqPVCxQg1xLndXQbzQoi1EHL0Tj7V9L9uSoclZgySrEz0rNKxBCsg+UkI0GxgOan/Rt5/6piScSIyAtBfFXNux8q1ZTg1cQJU6BlZ5JKqMUf14ZqDha78MVl0g6XprafmIWaLT4/ff/TXwnE2JdHqMeANFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNovC3noH+1iZc1ReJbAzwlqzlOM2tgjImPZapE3Eek=;
 b=QYutUMBoa6OhRiGSOeuV2fK+Y6QGH0cvd1IyedQkB69pjDZvXplDDcxW0ondo2+4oxs8iE2B4oqQmyK9hIT771QDK+FDhEayQmnVCu2Y5ndeHqqrVKIyALL8T2TC8lhSsHPnmAfXiDZGMgv+DBmn+AjJD2zGwnlG2PA0VfNoD3TtWJ7JuePTrmbXNflbQCcl18FICfcW1BMbURKI2JlowS+TyJXyIvBwn2hSOGPtcq2u5x+dB9EV9rEp1UU858JqCnoX5D6sQiYak7WH67VqD1gyqKE7ewjrCMsBaOveCLsM/WezJ+5cLsr9HbXfglFWAhOKanFSjKpfa6qXra0T9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Sun, 15 Dec
 2024 04:37:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Sun, 15 Dec 2024
 04:37:37 +0000
Date: Sat, 14 Dec 2024 20:38:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 18/29] drm/xe: Add drm_gpusvm_devmem to xe_bo
Message-ID: <Z15dPPbDzcPH7zVB@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-19-matthew.brost@intel.com>
 <9852474d609ce6527283b4dd2391b507322d2dfe.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9852474d609ce6527283b4dd2391b507322d2dfe.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea841ca-db12-4fbc-82ab-08dd1cc233db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FsJJt85wQNQNUj4491KoMI0mPbVqrjBOMc81u/mmAK/opqyaJlyZh51esL?=
 =?iso-8859-1?Q?tVcdDwGjvzyH2QvHXyDMQRMftzJWAXvTFYoxrPcc3isbbQZNMFOVHDNmUN?=
 =?iso-8859-1?Q?WjnmNsGDT+4CjH9THFU+YLkzr0RE1QNUlH+YEUT6jbvTCR4lxfGnIwJYEc?=
 =?iso-8859-1?Q?9BToDvFCTLaNHfP/27u4vs4D9qInH3L53W71Ty3+o6RZplvm8utjUdwgNr?=
 =?iso-8859-1?Q?XGKd7baXLw7eK3YkApsUapBfiQKctDofao3fU70+6XTojU3r6LKICsanpW?=
 =?iso-8859-1?Q?4AGmXiLKIwjNFFg+Gj/38K9rS8f4VPPw6tY/MIOzM2rsI/Yaf+mLNfpOcI?=
 =?iso-8859-1?Q?WnsDRzHio4H2I/7swl5SL146GTyM5sO9lGhBte5exyzsAPlfyGEE8X8EH0?=
 =?iso-8859-1?Q?zbKda+bbr8HeHQ0Rhi6WO3tCNVudKd9VA9pZRYsRizMUiKnVvLI0FT27C8?=
 =?iso-8859-1?Q?k/8SvI6q5kI5Xp6Ti98IBBEmc30Mu6WP5fRJ3beIBx8Lo4v5S9SL0tqkNg?=
 =?iso-8859-1?Q?/HARi0SUJOT7BS0kMzrWPWvXqVpl23NK094jzqPyNxZcADlsQ1fmki+G0X?=
 =?iso-8859-1?Q?KdgeqFY8OkV7/WbK31Gxrzz5Itdf/RB1jG4VbiaWJ+lGXF9r+l3wKHcbKi?=
 =?iso-8859-1?Q?adeONYLa3c8KKAdtT+dQQJ4ghZwZjvNIAD4NXmC/1LEHXT+msP7RctIdZA?=
 =?iso-8859-1?Q?b4hJD82oHi7g13YHyrUzUzKygA5v0SAbSWn9n5A3py7L+LzCU1iICrKRiu?=
 =?iso-8859-1?Q?tHfRRmt35DVva+Z/ONz6UdhZIQi0aEob7S1fZJQF3veSA5B+xKMKzw5nDX?=
 =?iso-8859-1?Q?Jcw69a9MScCiNqdklcrvS0deVHV28iatrVHPtd0X82YfyBDTsVWzBujVDK?=
 =?iso-8859-1?Q?xNsJbFGJ465G128zQuopgfu/TsXh2bNenu30E/A8kPVN1BoVnnLsMC+ekW?=
 =?iso-8859-1?Q?RNsiUZWOrkhWJTfYAEI2D+x3fF4/kdlikQT5BCvlVqblnoTsAS3kV9uIVG?=
 =?iso-8859-1?Q?a1pm7V7zPnibLVScufjqYuAnSykM1KUcLDZ+LwDDrHF+Nb3vIH//XJhoc/?=
 =?iso-8859-1?Q?y4CK2xP9jIFnzeVo2LvZQhokdY3Py89Ce85hJSv332I+JlC8936qMRkjFV?=
 =?iso-8859-1?Q?Jpzqh79ps3kB9wFV/MTVO2gwzHCxPLNOKGBKxqUrBLIwiKxeunKvAENvMy?=
 =?iso-8859-1?Q?hpFA2l6AotfpLC1AE03T2C1Dl8qeuxG0E5bVoy5pFSBdWg8OTDwWJ99l8v?=
 =?iso-8859-1?Q?7blAv1eRHBV43tdA4nOjluhJVN4D8TCKvj37FFD7aL4XnHUaMrED87xMoU?=
 =?iso-8859-1?Q?BBGOH700c6lvISk1gKIBqMjbGeBhW5Tu98+F22i/sJjmuGDP8svbn4Obkl?=
 =?iso-8859-1?Q?ooe6C8A3axyAs22lUuJN3tMAGeQa7OJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o5ufkRivsq++oCvSokP+d1rycxWgXvStBasvB/sXtVWXrLK/n8BX5/DoS3?=
 =?iso-8859-1?Q?8RwuwJwpGLiv8Vp3nXWuMOdOmcY4FSnudIi0p6RaSjXNlr8wSKNbFWV9I1?=
 =?iso-8859-1?Q?kG0M6zh2oIMQXkjV89VRBti2/MbwnkxpVwWdJshGwzCFvcfCDkXG3PBn0b?=
 =?iso-8859-1?Q?o5GAexUccBfuykuAZCysZC7hN/LrhrOyCP9mTJ+irsHOhDg5i6cVXIyW6B?=
 =?iso-8859-1?Q?Tskpr1/B/wBjriv0VFkMvqn05xBPiZq0kBocXMK0aoHSV9AG0rKODVjfnX?=
 =?iso-8859-1?Q?vX/bD8sxhNppVKI6gOubzEzE8AEsvL6GnRZgSfvHmtG9JlVX2FC59GUQb5?=
 =?iso-8859-1?Q?ysS2vwF3jc4wtEF8cu72qSmuJZVE80j5RibTiq+wZuh3G5IXbIh5eskOZJ?=
 =?iso-8859-1?Q?aZYQupwvixvnSc0iE7DM9zejartMU5p+NEAM+XEIHhqxyHqWz+XoChtAYK?=
 =?iso-8859-1?Q?uLiTxHKDITUjmPzVd0ZUqZMB754zUnS53PnVjs/Wg6MDl0MzGZh8NPqPkn?=
 =?iso-8859-1?Q?W2WZL1/Xxxx5+ZyxdmBLN5TTCvN3LQz2eRLxh3USQYAtsDi6ne1k6Lu4o2?=
 =?iso-8859-1?Q?oEZwLpVWcsG3X1k65XvIIs6BoxAwlu3j6gD21vh3Gpyg0l6qNvRFViPbKg?=
 =?iso-8859-1?Q?J/nCWoMCY4TDQ9d2s+z+Ed8npnDs+oPfrC8sRt8boe7vm+cS7HbJ/hIM/K?=
 =?iso-8859-1?Q?Zri+xoxAy8RWCXqCNr5rpS29z3ybujvFs3xcFgRsGORWVmIzZ0rduRSUKh?=
 =?iso-8859-1?Q?V/eUgJkFrp85W4uYe7M+4tuTqrIwpsfn6lngUyn8bGhP5Obb8RjsiQ6EmL?=
 =?iso-8859-1?Q?tPDNhp1XNZ1+tm2qXUUPLnYGkFuptqqnqafKIMBWGLbPXZhRbS+YxIbOcw?=
 =?iso-8859-1?Q?gExiwlR6SBZCdDVdSxCcwd3u6CP0r350gkDfsCFSi+Gu5aXuC5J+w62k5L?=
 =?iso-8859-1?Q?28wzql5J0si8ggtqhZQ5nnNU/OGk+1Xahv7f+oWX2jnHfh5fkutGmEtc7b?=
 =?iso-8859-1?Q?E6EspiT13IfjVdu5NL0KR9Vg0LCveiA7GuY/7pGnHqhDmVUchRXYDtvVvX?=
 =?iso-8859-1?Q?2ZQb4ouXaVImmvTDWAtnpZ/UwAwwa22mexYLBrZoow6t8l1gpIJPvqrApr?=
 =?iso-8859-1?Q?x9UL5n3GThW3/0wfEZdbJSR/4ysAQ9GDi6TwpPKZdQTShJltOkJS10X6qi?=
 =?iso-8859-1?Q?KWem2/BbHDcSQhypIwKrr7lvYxh7mNOEBKJmDnValyQCUJMa6HbC4ZrWnu?=
 =?iso-8859-1?Q?HIpTkAQqExtgueDHzF+Wwsa+bHFt6ZmGMn8VIpC0t6nFOgpcvJf8Jo5F6C?=
 =?iso-8859-1?Q?4wB4jovsVm4TCgOftp8mTZbMEJPXhh9IAcPyObBCQGDWYXFcXdLs1GDJHc?=
 =?iso-8859-1?Q?24BZLrVGPvqJ5n/y1K1FpULBVQciiFu5aGFzGNgKAg6yD0b36v9esTV3pK?=
 =?iso-8859-1?Q?K3a3XhEvNrXi9QRbq2ufO2yBYF5LhawLNTXe+ClgjObj999r7eI9BLCUmE?=
 =?iso-8859-1?Q?jPAzFrOI8rBiirP5r7jCDQBOFPCQLLB5O5B35fMzvuBeaWF5M3RQF560jc?=
 =?iso-8859-1?Q?AXjQGBGLgmwK1cIKsXn6qpYwYVL8zbVt7BFO1JzaiO74XuOu21qvn9JiRn?=
 =?iso-8859-1?Q?5cC8oHkuONU7UNXe2wZxABSr2cMxhfBZYosjbMgI0ESzFK0aOTgDIA2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea841ca-db12-4fbc-82ab-08dd1cc233db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2024 04:37:37.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZLc24eSD6QlS0H8KbSw1zC7ZGgL3Lk3/661AAA1f7mLs+FGRZq6bYWhSUnA9r2Yuo+RGvJNSN9YzL07tfz5qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Tue, Nov 19, 2024 at 05:51:50PM +0100, Thomas Hellström wrote:
> 
> 
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 13c6d8a69e91..54d337004621 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -8,6 +8,8 @@
> >  
> >  #include <linux/iosys-map.h>
> >  
> > +#include "drm_gpusvm.h"
> > +
> >  #include <drm/ttm/ttm_bo.h>
> >  #include <drm/ttm/ttm_device.h>
> >  #include <drm/ttm/ttm_execbuf_util.h>
> > @@ -74,6 +76,9 @@ struct xe_bo {
> >  	 */
> >  	u16 cpu_caching;
> >  
> > +	/** @devmem_allocation: SVM device memory allocation */
> > +	struct drm_gpusvm_devmem devmem_allocation;
> > +
> 
> I think this can go away with follow-up multi-device patches, but for
> now

Yea I could see that.

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 

Thanks.

Matt

> 
> >  	/** @vram_userfault_link: Link into
> > @mem_access.vram_userfault.list */
> >  		struct list_head vram_userfault_link;
> >  
> 
