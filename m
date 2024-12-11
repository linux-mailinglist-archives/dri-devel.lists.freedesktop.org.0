Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F09ED577
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E2410EC01;
	Wed, 11 Dec 2024 19:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNAuVzG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08B910E612;
 Wed, 11 Dec 2024 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733943665; x=1765479665;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=48KnFbNhbETMnLC8Z8u6C9UoetICqjI5fpR0lKqhnqs=;
 b=mNAuVzG++e3U4soAhUHBjyJ0/GSgAkksV1Yf+b49h1LNbhyPu6kSQ2WL
 HcVqjydvA9NEd4ubkNij1p9TeVT2XGcNMo6atKzBeAtWsa2CkBQR8DyTm
 DZc07RwYJQRoxGWJ91bxf7Bi9BlgfkaFo+mDMPPwMa/a1Ce9Ev+r3tioF
 U9Sc8sf3KRTvwqT77qwd1DtfMWgwlNMNU1TlXA1FdfD61E9Ptk5Z3fvqH
 RsMsA97SqO3r7ipoZlfgoLJ0tVsZJ5Kr1hGaGb0zqwkV+s/feOLSl6lUa
 4Bu9tLRVzNvwHGRKlhlo+Or1PPNLlhXAOr0jHM9chKPQlnpIjGJWaXxOB w==;
X-CSE-ConnectionGUID: pjhZQx20R/uTAxEYacD7jQ==
X-CSE-MsgGUID: Xz79swY/RkKNKHnj55ljIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44812928"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44812928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:01:04 -0800
X-CSE-ConnectionGUID: GcdlsDVfRVO+H2LrR0hfYQ==
X-CSE-MsgGUID: jzbxZgPhQ8uP9IsEzOoflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133306627"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:01:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:01:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:01:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDOT0+kwS56mbYeMMhKXEk5VPnKhfV9Iws8wvcEnDOXzBRcZOjZhEMAGRkFgZ+OxKb8WwaldaxSF8ND8GhMOfPvB10d9Lj8pqAH4IGFRk/mK5tkZZMmB5TgYrjpnh85BXjS7MwQNONQnA9yqYkTAQ42WiyQdYT+aCLpFkIAveOHgvHlX8NTAxRf+CJB/R34bONUFDT1tBewRyxGwpOV3yJhFnw/x/3mqzkWPdt9n1kF6qAdAFZv2DL66LeeU/hjORGA9HAEzcL4oTHY47CvtG2hj7FqCOHBqXc9BEANbxjyhfSeQXsKDXf5kfV+p/0x2r0ycY9RUBQkTRLXsX6R7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNULsKpzaTIOZE6BQcOcoCn4yXH9Cqlno3ICC0NHh+Q=;
 b=NF87683LRXMuQ4wI3jvA1K18Y3Z3Myoew3aqhYdxIrqprf2RIGpVM7rCZz6ev+LS8pDljv+jW3DhSIxazh9RbPYnZuseQGD+127E7tYu+ficYIXnZoGmHnQr/GZdQoWsZ9L6UGrGjnrQlxbM+StJOLxqqCPdss0mPKPLDNJn7UkEvXInnNc7QmUn2CRk2hZxa02dUtYYihox/6pSy4Mr+FrG8WGZWuit12JXd+NgLPwf0m0cjS8miG2FrBGx1n5pu8NkURmAyB+/ulGWsEaXKH/kc+ynes9Aw9vM1rPo6zSa6UhLLP3T/JHB/a1Wu9/L3h/VDcxZCKInBXaXfUkqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 19:00:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:00:32 +0000
Date: Wed, 11 Dec 2024 11:01:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 09/29] drm/xe: Add SVM range invalidation
Message-ID: <Z1nherArkwqT9g0/@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-10-matthew.brost@intel.com>
 <12b541d3a1b46434032afc1bcb9ce90428aa24a5.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12b541d3a1b46434032afc1bcb9ce90428aa24a5.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cefdc8-bd94-4a04-20f1-08dd1a161629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6fxYm4b4kgzyzcWkpdMxHHIyQylYAsa/TFJbX8cBMxUVIzj1G0KGb/kDtX?=
 =?iso-8859-1?Q?paQqs15eHvu8tQWb9+IYKXwxsuXVBogoLOj+acp82KCdzBwURfq7cUlMVB?=
 =?iso-8859-1?Q?X3G6YG2sROsjkzbjlH5azvvRE85h47dMDOlg+FdgVqfm08mvBaxr2RXj2o?=
 =?iso-8859-1?Q?+vR5eUaJVWg843+UgIQQgJKInNUPiQrYE6AdBXmNH6a47ZrR/qkxVCds5T?=
 =?iso-8859-1?Q?WYpeZs4lfhA2Oz/VWua9yHfKX96T9pPIoPK8xyBU9LagRfnv9QMB5FSGHU?=
 =?iso-8859-1?Q?P4fTmIOBQ9ntp6bo89TlXIRkyPehuqMjP51hygLYZoRsSoNzYNSIWEhU69?=
 =?iso-8859-1?Q?Ayz/0WV6bzU8v54rgN+jMa+BfeEzZLqA6P7PnlcNdg89H0kTdDwM0QmUXh?=
 =?iso-8859-1?Q?9Ad4+fPKxcA/EkDGLolGF+/tghVizilHFcPJUYK2ffro68zMQXEfhuomid?=
 =?iso-8859-1?Q?71KxnYV9DLXiFrj/Q0fPjGn8OSd8Gy2/7CMNc3JUMbnmkK3Zl3wc504S7s?=
 =?iso-8859-1?Q?pcQ4JzmfS5zKMvEK9iPzRpBilC4M7CENT5y71l345168vq8gbfTSvmR07K?=
 =?iso-8859-1?Q?lY3N+BW4wolde0aQ7xyUcnQ/8jE6QPKpgz6n5NwkI9SespSFVDq9fPN1eu?=
 =?iso-8859-1?Q?zkgEqoZexftQtix7Xh6yoNy6blfZEuBHu2GxAwE68A9sEZRFKiyjqmy4E+?=
 =?iso-8859-1?Q?rTBhOOvFZrr0vjt3XBVFlcORdY5EOY1Um12GtSqx8W0e8IOoaNdvbj3CJ3?=
 =?iso-8859-1?Q?qroYjDTnjuzljG0FofC29dOJYysPGbDLoW9FjmS/9R/bACHDJys1OrrAQU?=
 =?iso-8859-1?Q?AlZAhrWqwBd6J4dx69+FqG9oYnMozA2N8t2TOjTN8BKNP6VzsOk/np6vWc?=
 =?iso-8859-1?Q?N3pB/KZsBwz66yGEPhItrflQiCi4DI+wHt+x8MYkY6EBtR9so0STWBt19Q?=
 =?iso-8859-1?Q?XkX1+A6c6UD/x/IP9LK/fQhuAuCJWj8KJf+yqIPzHWrIxqRHLNP2zLscWc?=
 =?iso-8859-1?Q?Tm6ii1gOQd5jqzEOZbNmvJ6zlUUuG8lOfOSQjIPk/wOVcgQ2EnBf7jHe2h?=
 =?iso-8859-1?Q?HYGTAZLyLcf8QK07AZyFCrGTgvPDihNSiotIi8b1KY4QWBNhE+P4UuH+yC?=
 =?iso-8859-1?Q?bdbCM9iN9UOETuhhW39cr7bOFTssPW3HEYooDu28d5/5YM0UcekeZRGh+z?=
 =?iso-8859-1?Q?4v+tWgdQqEkpmiyzxeynr7zzU1lT2QEC3EIJIMlJFe6gzVdXbmkIwwZmEt?=
 =?iso-8859-1?Q?/7OR2E2u12M/dv4T2zqheYXNuVse46irRCmFoPV6HgV7nNyLCTu4RQ3lK8?=
 =?iso-8859-1?Q?BNfy5KgklEPBC64nrzcVtv6Obu3U30P9tIyXSSEd3u9DXv22P791AcjlEG?=
 =?iso-8859-1?Q?Y9nOCAWkrTcRpvK11D1OCC+Cbh7kMmZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GsCY9KcRhHLD2i7vkDoJMC1X48c2iO/9r5zuxDXAvgsKV34WMANSXumy8Z?=
 =?iso-8859-1?Q?n7U7xhbW+WnDcxFIxJP46eucq6eaMyfp2BMlsM3zsv/zjqLJ8rnII6Ks+u?=
 =?iso-8859-1?Q?2hDdt5GPHfyH9YwMwRaQrgiu3XPkQYgHdxp+HtElJDpRSL9AWRZD+7Af/7?=
 =?iso-8859-1?Q?Iue3xfcMBsc9wDKnSKTpasrnXqCv6gnCdHjnHsu0Bo3/xU/rKfXISEkUuq?=
 =?iso-8859-1?Q?0z5PNTybYJhlGoK4v9Rg/Rk+1ko8k9TiKmNn+4Brs0V/cY43ClixwDJJ5N?=
 =?iso-8859-1?Q?Uxnwdbo+45kHY6qd7B39SxD6iJgFM+3XjbaL3InAlLNbDcoAsqcqs4kTyJ?=
 =?iso-8859-1?Q?hhVdDMfulmQhAGyRzl6DOc7KA/5LYlME4fCsQ35BIeh7iDlSjmKPtI4WnD?=
 =?iso-8859-1?Q?YB82fjJ5WwrZmPdXTQExnU5iHMaqCtk19umLwgOJlHUKqLCnnHymCeL8kq?=
 =?iso-8859-1?Q?+lVbWVtAC1iRitRdM+NPvcgURqM06dz71e2nV9hxC3j+RDo2Ii+VtLSS4P?=
 =?iso-8859-1?Q?c0hzn8V3CUS8wcT1UgU98O4dlGKT/auytlKBWqmSLDXDKnQv/KGDUpt91x?=
 =?iso-8859-1?Q?d1+ECQ4qTVymRlifEJWhwk3n0AiA0lRUncM/UD85WT1py+x/uIdkVkLiHr?=
 =?iso-8859-1?Q?3xNG3pdFI9bUoVJ2UtWwC93Vkb65iUPHJSQaaGphYml1LsAsurQjCHHvyF?=
 =?iso-8859-1?Q?f2ve7u8MrRoAfITuU1zgYra3p1GpDZfXEtRqOAJKL4SO3E3r172M6kj1Sc?=
 =?iso-8859-1?Q?kVcI5doJ+1G0qO4PrCmZqKlJHonzE5jEvdqVoR/Acz5ECE/1lVQ0M8OpvN?=
 =?iso-8859-1?Q?aihKH2/Ne92shutEsslHEdoHoHf209QP1nv/5O3Kclji68PsLk7d7aviP+?=
 =?iso-8859-1?Q?CCBxS7/mfYKZXmuMCN7h0498FVGYkYBNAu3i6AprzFNOxZnBgcGfvXucD+?=
 =?iso-8859-1?Q?3MrKj7ZkR+zcAkqKnRi2p5Ry+bwjkD2NNOKt4Zi/smLXVXJ0yvSfw0vB6W?=
 =?iso-8859-1?Q?BeYEEJlV/HfNX1eRX06WYLUaCgDg32abwgh297C+k/1tMeqloO4jcmvRGq?=
 =?iso-8859-1?Q?s8MkIi24lNegWe++l8QhL6N/OJ3l2CuuFCIrB8UzjGijPa8WJJG7u7PA2Y?=
 =?iso-8859-1?Q?lItkDV69+zYxCIFPQupJWKTIr65f6bUpyXPc/6GWwmmJPx4Hx+oWd7RSJF?=
 =?iso-8859-1?Q?l7zcagJWH/Sq11rX7QtFdOxFcu+Rh1Cz/eu4rpgBI89tmtrFsvzds4UabJ?=
 =?iso-8859-1?Q?EDWot1vJZiYuLhaJPNP124fFaVq1RAa894xsK5DL2OTLqNRBFHHI/WB4pi?=
 =?iso-8859-1?Q?T1E1n9cErlPZrIAlK83O//swGgQbmULK6ttL1uFt4xVIPtWO+h3zU1pkvZ?=
 =?iso-8859-1?Q?Bepyee/EANhe3KvireHgv6PeC2eXc1TuMPYciBsMYSNGdyo5fCgy1UzpSP?=
 =?iso-8859-1?Q?yRMZ+608oWRAax0yl5zPl7xlodZsMlInkK559/B94sS9MiAtoF1lK6f5Sc?=
 =?iso-8859-1?Q?FboK48x4pSfan0Wx0t3rT8qNxcaJ2L/aWmYk0skCwi4W/FtSsmq8GY62v1?=
 =?iso-8859-1?Q?/ZstDoPIGxdJsY/P0CRb2XZOpDFu9YoNw3YqmV2nwxvDBk770zZUW/G7DL?=
 =?iso-8859-1?Q?b8/BbqRV32BvqjiMo3xeSpqj4Oj24MP+MpNl7WIViCrUy+3d9q6PjXOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cefdc8-bd94-4a04-20f1-08dd1a161629
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:00:32.1991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9kh7e4bqy6iiTuIEWQrkFt/IqFqUi6t6n4MYTeZLTAZKNuShJREWo6+5zk0DWDTJiUb/WHxizOKB1iBRILS/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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

On Tue, Nov 19, 2024 at 02:56:12PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > Add SVM range invalidation vfunc.
> > 
> > v2:
> >  - Don't run invalidation if VM is closed
> >  - Cycle notifier lock in xe_svm_close
> >  - Drop xe_gt_tlb_invalidation_fence_fini
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  17 ++-
> >  drivers/gpu/drm/xe/xe_pt.c           |  24 ++++
> >  drivers/gpu/drm/xe/xe_pt.h           |   3 +
> >  drivers/gpu/drm/xe/xe_svm.c          | 205
> > ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_svm.h          |  13 ++
> >  5 files changed, 256 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 79c426dc2505..92923947a12c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> > +#include "xe_svm.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_vm.h"
> >  
> > @@ -125,18 +126,17 @@ static int xe_pf_begin(struct drm_exec *exec,
> > struct xe_vma *vma,
> >  	return 0;
> >  }
> >  
> > -static int handle_vma_pagefault(struct xe_tile *tile, struct
> > pagefault *pf,
> > -				struct xe_vma *vma)
> > +static int handle_vma_pagefault(struct xe_tile *tile, struct xe_vma
> > *vma,
> > +				bool atomic)
> >  {
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> >  	ktime_t end = 0;
> >  	int err;
> > -	bool atomic;
> >  
> > +	lockdep_assert_held_write(&vm->lock);
> >  	trace_xe_vma_pagefault(vma);
> > -	atomic = access_is_atomic(pf->access_type);
> >  
> >  	/* Check if VMA is valid */
> >  	if (vma_is_valid(tile, vma) && !atomic)
> > @@ -207,6 +207,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  	struct xe_vm *vm;
> >  	struct xe_vma *vma = NULL;
> >  	int err;
> > +	bool atomic;
> >  
> >  	/* SW isn't expected to handle TRTT faults */
> >  	if (pf->trva_fault)
> > @@ -232,7 +233,13 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  		goto unlock_vm;
> >  	}
> >  
> > -	err = handle_vma_pagefault(tile, pf, vma);
> > +	atomic = access_is_atomic(pf->access_type);
> > +
> > +	if (xe_vma_is_system_allocator(vma))
> > +		err = xe_svm_handle_pagefault(vm, vma, tile,
> > +					      pf->page_addr,
> > atomic);
> > +	else
> > +		err = handle_vma_pagefault(tile, vma, atomic);
> >  
> >  unlock_vm:
> >  	if (!err)
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 39357e829b6d..282476c4edbd 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_res_cursor.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_sync.h"
> > +#include "xe_svm.h"
> >  #include "xe_trace.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -829,6 +830,29 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> > xe_vma *vma)
> >  	return xe_walk.needs_invalidate;
> >  }
> >  
> > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> > +			  struct xe_svm_range *range)
> 
> Kerneldoc.
> 

Will add.

> Here, (and I saw Oak also commented around this some time ago) ideally
> we should make xe_pt.c unaware of vmas and svm ranges, and in this
> case, use the same xe_pt function for both.
> 

See some of other comments, agree we should do in a follow up.

> 
> 
> > +{
> > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > +		.base = {
> > +			.ops = &xe_pt_zap_ptes_ops,
> > +			.shifts = xe_normal_pt_shifts,
> > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > +		},
> > +		.tile = tile,
> > +	};
> > +	struct xe_pt *pt = vm->pt_root[tile->id];
> > +	u8 pt_mask = (range->tile_present & ~range-
> > >tile_invalidated);
> > +
> > +	if (!(pt_mask & BIT(tile->id)))
> > +		return false;
> > +
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, range-
> > >base.va.start,
> > +				range->base.va.end, &xe_walk.base);
> > +
> > +	return xe_walk.needs_invalidate;
> > +}
> > +
> >  static void
> >  xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update,
> > struct xe_tile *tile,
> >  		       struct iosys_map *map, void *data,
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 9ab386431cad..5f333eeedf5c 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -13,6 +13,7 @@ struct dma_fence;
> >  struct xe_bo;
> >  struct xe_device;
> >  struct xe_exec_queue;
> > +struct xe_svm_range;
> >  struct xe_sync_entry;
> >  struct xe_tile;
> >  struct xe_vm;
> > @@ -42,5 +43,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,
> > struct xe_vma_ops *vops);
> >  void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> > *vops);
> >  
> >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> > +			  struct xe_svm_range *range);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 57b740367843..b2bc259978c4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -5,18 +5,188 @@
> >  
> >  #include "drm_gpusvm.h"
> >  
> > +#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_pt.h"
> >  #include "xe_svm.h"
> >  #include "xe_vm.h"
> >  #include "xe_vm_types.h"
> >  
> > +static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> > +{
> > +	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> > +}
> > +
> > +static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> > +{
> > +	return gpusvm_to_vm(r->gpusvm);
> > +}
> > +
> > +static struct drm_gpusvm_range *
> > +xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > +{
> > +	struct xe_svm_range *range;
> > +
> > +	range = kzalloc(sizeof(*range), GFP_KERNEL);
> > +	if (!range)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	xe_vm_get(gpusvm_to_vm(gpusvm));
> > +
> > +	return &range->base;
> > +}
> > +
> > +static void xe_svm_range_free(struct drm_gpusvm_range *range)
> > +{
> > +	xe_vm_put(range_to_vm(range));
> > +	kfree(range);
> > +}
> > +
> > +static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> > +{
> > +	return container_of(r, struct xe_svm_range, base);
> > +}
> > +
> > +static u8
> > +xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > drm_gpusvm_range *r,
> > +				  const struct mmu_notifier_range
> > *mmu_range,
> > +				  u64 *adj_start, u64 *adj_end)
> > +{
> > +	struct xe_svm_range *range = to_xe_range(r);
> > +	struct xe_device *xe = vm->xe;
> > +	struct xe_tile *tile;
> > +	u8 tile_mask = 0;
> > +	u8 id;
> > +
> 
> lockdep assert?
>

Sure.
 
> > +	/* Skip if already unmapped or if no binding exist */
> > +	if (range->base.flags.unmapped || !range->tile_present)
> > +		return 0;
> > +
> > +	/* Adjust invalidation to range boundaries */
> > +	if (range->base.va.start < mmu_range->start)
> > +		*adj_start = range->base.va.start;
> > +	if (range->base.va.end > mmu_range->end)
> > +		*adj_end = range->base.va.end;
> > +
> > +	/*
> > +	 * XXX: Ideally would zap PTEs in one shot in
> > xe_svm_invalidate but the
> > +	 * invalidation code can't correctly cope with sparse ranges
> > or
> > +	 * invalidations spanning multiple ranges.
> > +	 */
> > +	for_each_tile(tile, xe, id)
> > +		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > +			tile_mask |= BIT(id);
> > +			range->tile_invalidated |= BIT(id);
> > +		}
> > +
> > +	return tile_mask;
> > +}
> > +
> > +static void
> > +xe_svm_range_notifier_event_end(struct xe_vm *vm, struct
> > drm_gpusvm_range *r,
> > +				const struct mmu_notifier_range
> > *mmu_range)
> > +{
> > +	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> > +
> > +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > +	/* TODO: Add range to garbage collector */
> > +}
> > +
> >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  			      struct drm_gpusvm_notifier *notifier,
> >  			      const struct mmu_notifier_range
> > *mmu_range)
> >  {
> > -	/* TODO: Implement */
> > +	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > +	struct xe_device *xe = vm->xe;
> > +	struct xe_tile *tile;
> > +	struct drm_gpusvm_range *r, *first;
> > +	struct xe_gt_tlb_invalidation_fence
> > +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > +	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> > +	u8 tile_mask = 0;
> > +	u8 id;
> > +	u32 fence_id = 0;
> > +	long err;
> > +
> > +	if (xe_vm_is_closed(vm))
> > +		return;
> 
> How do we ensure we don't race here? Are we sure that all dma mappings
> and all PTEs pointing to the range is gone at this point? Becase "They
> will soon be gone anyway" isn't enough.
>

I think this is to prevent touching PTs which are being destroyed in
parallel which resulted in kernel explosion, so I think we need this.

How to prevent a race? How about on VM close we invalidate the PT root?
I had patch at one point which did this. We'd still have dma mappings
too but I think if need to we can safely dma-unmap the pages if the VM
is closed too. Thoughts?

> > +
> > +	/* Adjust invalidation to notifier boundaries */
> > +	if (adj_start < notifier->interval.start)
> > +		adj_start = notifier->interval.start;
> > +	if (adj_end > notifier->interval.end)
> > +		adj_end = notifier->interval.end;
> > +
> > +	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
> > +	if (!first)
> > +		return;
> > +
> > +	/*
> > +	 * XXX: Less than ideal to always wait on VM's resv slots if
> > an
> > +	 * invalidation is not required. Could walk range list twice
> > to figure
> > +	 * out if an invalidations is need, but also not ideal.
> > Maybe a counter
> > +	 * within the notifier, seems like that could work.
> > +	 */
> > +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > +				    DMA_RESV_USAGE_BOOKKEEP,
> > +				    false, MAX_SCHEDULE_TIMEOUT);
> > +	XE_WARN_ON(err <= 0);
> > +
> > +	r = first;
> > +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > +		tile_mask |= xe_svm_range_notifier_event_begin(vm,
> > r, mmu_range,
> > +							      
> > &adj_start,
> > +							      
> > &adj_end);
> > +	if (!tile_mask)
> > +		goto range_notifier_event_end;
> > +
> > +	xe_device_wmb(xe);
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		if (tile_mask & BIT(id)) {
> > +			int err;
> > +
> > +			xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > +							 
> > &fence[fence_id], true);
> > +
> > +			err = xe_gt_tlb_invalidation_range(tile-
> > >primary_gt,
> > +							  
> > &fence[fence_id],
> > +							  
> > adj_start,
> > +							   adj_end,
> > +							   vm-
> > >usm.asid);
> > +			if (WARN_ON_ONCE(err < 0))
> > +				goto wait;
> > +			++fence_id;
> > +
> > +			if (!tile->media_gt)
> > +				continue;
> > +
> > +			xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > +							 
> > &fence[fence_id], true);
> > +
> > +			err = xe_gt_tlb_invalidation_range(tile-
> > >media_gt,
> > +							  
> > &fence[fence_id],
> > +							  
> > adj_start,
> > +							   adj_end,
> > +							   vm-
> > >usm.asid);
> > +			if (WARN_ON_ONCE(err < 0))
> > +				goto wait;
> > +			++fence_id;
> > +		}
> > +	}
> > +
> > +wait:
> > +	for (id = 0; id < fence_id; ++id)
> > +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > +
> > +range_notifier_event_end:
> > +	r = first;
> > +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> >  }
> >  
> >  static const struct drm_gpusvm_ops gpusvm_ops = {
> > +	.range_alloc = xe_svm_range_alloc,
> > +	.range_free = xe_svm_range_free,
> >  	.invalidate = xe_svm_invalidate,
> >  };
> >  
> > @@ -36,6 +206,11 @@ int xe_svm_init(struct xe_vm *vm)
> >  
> >  void xe_svm_close(struct xe_vm *vm)
> >  {
> > +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> > +
> > +	/* Flush running notifiers making xe_vm_close() visable */
> > +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> > +	drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> 
> Calling mmu_notifier_read_begin() ensures that nothing is invalidating
> on the range. Probably a better choice.
>

We'd have to call that on every notifier rather than just cycle the
lock, so with that I'd prefer to leave it as is.
 
> >  }
> >  
> >  void xe_svm_fini(struct xe_vm *vm)
> > @@ -44,3 +219,31 @@ void xe_svm_fini(struct xe_vm *vm)
> >  
> >  	drm_gpusvm_fini(&vm->svm.gpusvm);
> >  }
> > +
> > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > +			    struct xe_tile *tile, u64 fault_addr,
> > +			    bool atomic)
> > +{
> > +	struct drm_gpusvm_ctx ctx = { .read_only =
> > xe_vma_read_only(vma), };
> > +	struct drm_gpusvm_range *r;
> > +	int err;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +retry:
> > +	/* TODO: Run garbage collector */
> > +
> > +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > fault_addr,
> > +					    xe_vma_start(vma),
> > xe_vma_end(vma),
> > +					    &ctx);
> > +	if (IS_ERR(r))
> > +		return PTR_ERR(r);
> > +
> > +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, false);
> > +	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU
> > mappings have change */
> 
> s/change/changed/
> 

Yep.

> > +	       goto retry;
> > +
> > +	/* TODO: Issue bind */
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 376e86876a11..c91c5f538024 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -6,14 +6,27 @@
> >  #ifndef _XE_SVM_H_
> >  #define _XE_SVM_H_
> >  
> > +#include "drm_gpusvm.h"
> >  #include "drm_pagemap.h"
> >  
> >  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> 
> Not used yet
>

Will remove.
 
> >  
> > +struct xe_tile;
> >  struct xe_vm;
> > +struct xe_vma;
> > +
> > +struct xe_svm_range {
> > +	struct drm_gpusvm_range base;
> > +	u8 tile_present;
> > +	u8 tile_invalidated;
> > +};
> 
> Kerneldoc
> 

Will add.

> 
> >  
> >  int xe_svm_init(struct xe_vm *vm);
> >  void xe_svm_fini(struct xe_vm *vm);
> >  void xe_svm_close(struct xe_vm *vm);
> >  
> > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > +			    struct xe_tile *tile, u64 fault_addr,
> > +			    bool atomic);
> > +
> >  #endif
> 
> Thanks,

Thanks,
Matt

> Thomas
> 
