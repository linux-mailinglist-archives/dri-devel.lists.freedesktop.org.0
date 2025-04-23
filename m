Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B89A97C90
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 03:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F9210E3DD;
	Wed, 23 Apr 2025 01:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSDotW2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699F310E3DD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 01:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745373448; x=1776909448;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lalqLhx96A/0uDtYYFMXcMU4uoI201Q3rQE//SJrKvo=;
 b=kSDotW2M/PBqi+x+a2s5guOefgiZW1ppyXxljPOLffZzZ1jHEyIWwk41
 aHMqGsGFhfEnWQU6tALosJcEoWMETaHoQUNEUMnqpSRSIOab/RDLhPGFj
 vnwebUZ8PF5kqUsmk8bcxMlsFmE1qwgQpdN08vTSdb8hncl5QnkgMWOM6
 53RQ2RGDEk2g517FbyzWli72x/jILIu4KfdYOdDzkm/8xFmtab+gUySCq
 whSxozEw5hsh7ZcezW4eCVWtuIM6SY1AomNfhhbBSlttFqL+Wt3HyegUX
 MvTffxF8XQuBeTtwfozNLAykrNQ/sR7SVqr/zkU60dnmbom5SHpMQ2nKr g==;
X-CSE-ConnectionGUID: Domb/4q+SZGKMQLtXR4g1g==
X-CSE-MsgGUID: G6TaR4IKQkuwsKeeGiPc3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50612684"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="50612684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 18:57:27 -0700
X-CSE-ConnectionGUID: nmxVE+v6RgmYXhLVN1bgnw==
X-CSE-MsgGUID: hHu246poS2qcdRG8QL9fkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="136249155"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 18:57:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 18:57:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 18:57:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 18:57:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taYSfOfWFQnIKLRcifcOQw7E0pRh2xaFJbmD88hmiZvrMjGkvYqUDOwyrVsThtNO/r4Mih7N3aBNnniQi8a77M5EO1Y8d0Tz0kQQkbxUlaqfk42qUHiKDURoi3nl/LUq7vNQdJPxE3xHXV2gii0Dp2nTY0Bh22m4CA4QDGvhu6UewDC1KRskQClqg6lZsoliykW7gIKQfy2kDKhHokYwkLOUJdvMzWgjsNjhMCGh+LMdUFBJQaroAoTMI+2qOSg1lbSiwmNo4OLZZDXbKR63LOSplNU+ipsJrd2lmm51/4kwDx6rpydg+cvce75h7APdRoYHwV9NdurbaASx4+rN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbXpuNB+uj9c34bpIjMbv3IEJvKSraRYKCuxtuTl5sM=;
 b=OsDCdlPJGtMlJFkaDkW9C29gU/ghe+6aB8SdKDwK86W7+mPcTNZbs79oTFbQuR7utzw8m7KUNPZO8rE8saFoBqkCcBHpOHRGWqZvtt9XhBImQzxS0NBxfGhXjzjCcnFSmREG1wS1HYW4GrfKQ9O3nD/G90hRezw+S26x1nkte60z5RSQdq8Ifnw0q0hF941FuWpZY4KCFVRIhpo/dS8B7L/M/4spEQg9gM/xKQ3wwKSP7ne7WyYLa4a0us8hGxaNwjhgpJdQ2OKvbTpl2HsHKEHqnexpVnIo3wZwLRmQ1tlzCVlLGKLAeA0y3OQ7iFwDbdXUGYLgMAEsT/9gADyHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Wed, 23 Apr
 2025 01:57:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 01:57:24 +0000
Date: Tue, 22 Apr 2025 18:58:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: force_alloc in ttm_operation_ctx
Message-ID: <aAhJVYI8G9zbnliY@lstrano-desk.jf.intel.com>
References: <CAPM=9txG6J5cAMcKJWE_Ya7HCdykQYeM=s5qmEwcTVLbF9qoAA@mail.gmail.com>
 <aAhG2E8+0W6JHibK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aAhG2E8+0W6JHibK@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 64aca4c6-1062-43f1-6310-08dd820a311d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j73fPbJ/SR2pOQcOlWD3ue428Iy7cZBkRcVhtzHfqHuFE/ZbVhAvo0MSMO65?=
 =?us-ascii?Q?hy1GYNJZL/Kl8/e4OVJRFw+nWMfCS5HZvh0TyF17veyMhDhcgUKNSqJsnZ7O?=
 =?us-ascii?Q?V2uD6E/oBIfaTHpnjBDxEr28gjUCogAHbzSC+CretuePv3/W8T9STSWuT+Mo?=
 =?us-ascii?Q?roDsHAUh1TYbuj/feJ8//vIHKFiL4qmTCBpC9DnxLmPtjfM3vAzU7/Pr4tsf?=
 =?us-ascii?Q?km924HHFEafvuz+A6XnhymUJpYbEophu8FBS7e1lN6hjVtUh01Ad/aNa1WXx?=
 =?us-ascii?Q?1m042s8mmqNp/YCadfkX2iSRmycIDUjkVddagz4dcv8FFwDYq20eG6asffEq?=
 =?us-ascii?Q?E2ZBW3wX5FcUQON2wrfRbBLsjF9fwZccM/hIPIdCxlyLsAy9EWjWaWGANKiK?=
 =?us-ascii?Q?W1nQcJt67uzJZB5gHhX+QlED1wsgy/X02Q65PPL+nZAQF6gr3ujDZpYIpY6Q?=
 =?us-ascii?Q?AtRqYC2VczJdS+l89HlQmcDVgCDChK4u9S6SZnCVAwVeMiAvlj+p/WMqN05M?=
 =?us-ascii?Q?ozLV+1+twrxFkOA3r9kRrSmNHaxc9hoYjw20scIW06zj6ckzLllkzolsgYbe?=
 =?us-ascii?Q?xIQgjNtKRfyw8f+F33J+aaz6WWMDV7gCofW/sBwk0eJyZ5IIi+rxF0A4rb+H?=
 =?us-ascii?Q?ehXEihytuZbzgc54OA5Zf3t78bQ8fSS8eDfT3zpRrvEHKpGlO5RkRIhcplr5?=
 =?us-ascii?Q?B7BQ7LLITk7co9q7bM6IzameSxNC14+bbt5aqb/mKIOTPOOZ04nP4n1WFVVf?=
 =?us-ascii?Q?tseOpr+y3IX6f67BLhA4I3H4cX5NdbNc5PMXhtJgDBhOVj5Ja47x95rbzzyS?=
 =?us-ascii?Q?fcccooxuUE4BxVw3jYzHktl66tspUpnseeartjMcfWjy8S0wCKjW9FWWn5LE?=
 =?us-ascii?Q?HxHgygZX+l40U+B/1ZpQYkvSgrFrxQAZx/0Y6OXTcUCCW9GrDun729dhR39q?=
 =?us-ascii?Q?k8zBhqZgqRX+Yo+718qFifV/V7IL57xBwADqnnuL9YREs82orhzSeqhChUrR?=
 =?us-ascii?Q?t65vMvFaZFtQyatFpoLhLtspTiFWUNZ9an6er/HlenxG7HDqqQnCdTDJ0dpp?=
 =?us-ascii?Q?s2+ZuQ2c8n035Ygr3sOw36qoZ+yehMqTp6z90brWqRAvAUoRH+t8jsDgZV2U?=
 =?us-ascii?Q?Wg34BScwdxLW12s3q9ItymKvL6A3BrVD/us0lK3KQrcZm9KMoGGICmk+N/H/?=
 =?us-ascii?Q?niOxVPhL3YjnILFlcQibD91jsKk4Pqgsp3zQOFeziVuLKiR4HMBeCHAcFsXt?=
 =?us-ascii?Q?5se0i5D7qSXziH5fygvT1y6s+KSfzIUFIzhloCesZHF2T3GMzfi3zhyLjm2v?=
 =?us-ascii?Q?d1MDH2UYh5x5L05H0IUi9hdYPSqeemfxC2oE8rYIyIYWye7PA6AoHx5SiTH7?=
 =?us-ascii?Q?MlQOEnFHUXCAtGglbrFRxaM2yFzMT/GBrvO4NS7afoDei3pc6s2OTLZAUIco?=
 =?us-ascii?Q?mMnXaf2b1z8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01LgmTCmn9VPmKIEnYOxN0peKK0DQmldmkt5fI+7MD3c7q+cJGxH010whe8A?=
 =?us-ascii?Q?upcew6QZcBP1Ce+bdm47nMNbFBeH9ac6Ne46+0YQQsghZYyUgSHYjrmypOI/?=
 =?us-ascii?Q?lt5Sg8IGwecJLhQ6JIYilebHMekLzFFTduFuh/9/oib1VqnPRRKO+0kXx2WA?=
 =?us-ascii?Q?7210LNUPELCvRbO3AXAkwQ85FuYXQR8cYUC5fGcnUzkewFuOMICRHjMgFan4?=
 =?us-ascii?Q?nSlStzOPDB8adrnldU8EVgyr8PXLMUt67aTF9SXDp2tTjEKrYNEiXHQCsTNd?=
 =?us-ascii?Q?TlOUHrWvsu3WMDxmLC3edxx50wt7TyzUJCn32ug6QebG6YU75d264xwZeQRm?=
 =?us-ascii?Q?k4JX4//F4uFLp1s3wwnvlSPmDnyn15aPd0nNbstI12EoMCSLMwlnlU3+WxcB?=
 =?us-ascii?Q?BXY+AV27jdHzOXCxUdi27JK5lIM+PBke+hdhzP66Hgr+8JySfLPO2tL1/DHm?=
 =?us-ascii?Q?ikDFd9gNTqgUrOdyQXMoHwZet+UEVd4a8WppJWp0bAhvnERbpBPkIXG53Qwe?=
 =?us-ascii?Q?oOLaH2bLWrOXys25SUEbsHPFDBn0R+DNaW6NR8LnL8ueOq5CEbMBWR5ra1Ek?=
 =?us-ascii?Q?/XkeliTAfoZfwtjCio7OC8Y1mRwmIKhas+26TGeyDAUe7k710ZUAKqbvBKPu?=
 =?us-ascii?Q?yBWuatK6+kSrR4tW/7xJqVpCeJDbyuZfd0f5YSw4STZc5bc12vzUNbPWvtOq?=
 =?us-ascii?Q?SiGxbR4P+bL6c9pPrKvDDJdx5PDJ6JpAFc+68Ucc3ghoAHXMB1Gh2erVG52x?=
 =?us-ascii?Q?1v7zL+0htU4bKrcQOgrFT5DLvPNcdD8pN+zk68Dk4+XkeGkPCYIdd3X8xdfP?=
 =?us-ascii?Q?poNEimMRAKRL6XjjGUM4xqgbImbqarb8PzGD0EYrQS56KBknQxkvMw2lzNnR?=
 =?us-ascii?Q?sFZFvmDHChUabqoFk12G8zSjOIwUnEOFzztsSeMkUtWyXolm/gno7Yf79iMg?=
 =?us-ascii?Q?jYEEywtLLrkFD+3nghkAoc7ytMGXHFZ879NY+aX7/ww4SaXmxKMdRl1qm/L7?=
 =?us-ascii?Q?0Jyx6RflhWDDE6OlEKum0kAcj/f1N8MTspAjgdO82pT757iiGBb+Mi7U2Khy?=
 =?us-ascii?Q?BJ6dnuhgqYGcH8KPF7akbfUyleS/QNaiwv036dqMsJ8kW88Zh/+/+25N1oV+?=
 =?us-ascii?Q?5Sx70gdywGzhQ4GhzvsTH4cD4FnnPvz/X2fbAeNIbmAbN1cOXK5zXZLOGuzE?=
 =?us-ascii?Q?P/tk/KZTTgPeraM8nrAvyYMl0ZxjU4bGqkLqH8Z2jjZrB5AnFJ4KQj7psyUo?=
 =?us-ascii?Q?qYRBha+F+Jng+UMqoZl3TWxxf6ZUiX3xBOZoIqjBnKeTR73V+cuInjpXPBrl?=
 =?us-ascii?Q?XsnamkwOoZcpwWlb9v6nqgk9WwyiTwr5lk5zqW2LERidGiEWgHmQMgnN6Neo?=
 =?us-ascii?Q?YJ/MZSrwAyl8g/uPgwdBIL7bmL2CJyZsFPt+BriChDZ3hMHnhKc7AuZzRFoE?=
 =?us-ascii?Q?jC/a2kwgfbNd4fhVzGqZuxb2Q4n3M5GrhK3weoIicgU+lTnzLO+4Pus9BY0I?=
 =?us-ascii?Q?Ew9OjgskRItIrrCMB/ow28o8sMWcZUacB0emUYvP8sqpw2qt30IKz756Fb0e?=
 =?us-ascii?Q?5tDnbZVIgC1hM96XZpqFSIxbDPQ7Wx1ZTB7jq39xudb6Cz1T6WKWv+EbjxgO?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aca4c6-1062-43f1-6310-08dd820a311d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 01:57:24.3169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIxNo+VBvYx5i5bwlmDbhrcWXJBw9G0zLyRDIcd5U1jYqhbIb7EnLKreF9T2ZORxZjp54s/nmcKxRgeK4yjqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

On Tue, Apr 22, 2025 at 06:48:08PM -0700, Matthew Brost wrote:
> On Wed, Apr 23, 2025 at 09:35:35AM +1000, Dave Airlie wrote:
> > Hey,
> > 
> > Been digging a bit into cgroups stuff and I found this force_alloc
> > flags in the TTM operation context that seemed like I should dig
> > deeper, but I can't see this flag being used anywhere, places set it
> > but I can't spot the consumer of it?
> > 
> 
> A quick grep shows:
> 
> mbrost@lstrano-desk:drm$ grep force_alloc */*.c
> ttm/ttm_bo_vm.c:                        .force_alloc = true
> ttm/ttm_resource.c:             .force_alloc = true
> 
> We have this wired in xe_bo_evict() too but always set it to false at
> the caller.
> 

Ah, I should read better. Yea, this appears to be unused, only set.

git format-patch -1 c44dfe4de0539

This show when this flag was changed to a bool there was one consumer of
this flag but that user has since been removed. My guess is this had a
use case, that use case changed, and the flag was failed to be removed.
We can probably just remove it since there are no consumers of this.

Matt

> Matt
> 
> > Is there some out of tree patch or something currently being
> > upstreamed to use it?
> > 
> > Dave.
