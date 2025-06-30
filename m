Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBEAEE5EB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 19:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1832410E4A3;
	Mon, 30 Jun 2025 17:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFsRz9gS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431A710E4A3;
 Mon, 30 Jun 2025 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751304869; x=1782840869;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GUaeRnToic17naDURILTwjVzpID5/Sr4lPAK3AGsL1Q=;
 b=JFsRz9gSTE86KLS5yibbv369Dvu3e9u7c2a9f+ZRxs13vhojxhHiDia1
 Wv4xEq7A3iPYcEYLn46xJMyeIONNLsdRjKmI2U7h95Cp8U3mXLf3DIwM9
 2dJwLJ7P5xbpGUOneyQG14nOFFSOYqlKQluyGycrjrLy+mjfSr/WyE/Lh
 Znf/GHuNSyOlcsxUIsc9vCO4ea8kSJni6hA1v4urfueA8a3yoIn2Bs/xj
 2xk99MO9fYpNjF7ws6qF0N1hMqEzUWIS+WFwvgMcnB5rWvS8YpoxqKuTo
 Ixpf+1N0fDbE6OfytQxs0RBM5DZ8GtU79Vp/e86YgF1+5P8hLi2Lg4TeV g==;
X-CSE-ConnectionGUID: moUseAxQR6K1err7bca25g==
X-CSE-MsgGUID: 2fDewoEERzuwWlU9MIgF7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="41166585"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="41166585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:29 -0700
X-CSE-ConnectionGUID: SidXlkZyQba7bk58g/Cgmw==
X-CSE-MsgGUID: I90+ofnBT3y51jIBPT0Yqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="158069959"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 10:34:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 10:34:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 10:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYZ1SiriGa6dO3CbRx3llBYmQUUhmZoRlstkRSSKNJdJIUJznT9bwCRT9OrMwDyqh3db4j4EZZ/6GdbbzT9l4E4vQ5lk0awYmbSNNfcarwRZZ9XWog7yFdJ/YpEZrr3wkUGOEh930wzLI+/Fb6Z+knCy8d+HZwiUkoRxA4Ej5281kMuKidCcErxpv7QODKW8leL2uPRvipI1ZV/VmhR0VQl/53nO/+sTWOZqwy4ihNx4q1ChvuhAmDqfclSdbIGEmmMlayrgdD6nd29IQnNrGZVJ0NpW+awqtNYIdFr3H/W4MtMEBUV3/1YRC6WFH9exrCPizwBjhvHgCYOq5aehOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSSw5VdGIYMwKOn7rz63Z6qfjqn/j45TNROyfGBdf4o=;
 b=dqbDqJAUABRkx9Rf02yOOW4aThSufkIjVAwomfMIl5h7mgtAKnB/kIkNTgqDo1Bl4pcu/Fe3b23Hh812hQnxmuo7/ebp81N+hdiEj/bmZSQ6aPzC6YWsziKzqreE1r6+H7mtpcpB0+H1rsqaGYsPlZy2FloT3CAT7V5At7p5XEcUIBGDPAnAIsGDN0NBNBH369Sbm1s/rZ2qMHKkzFogRyuJ3019KyZYliLNp2hgtDt5cBT5laPG4v3U6HJ+sFrjwm/7DQdDvrIyhiKxiTc6LmYkSvui33hufdsL5hexjw9SXYbAGbJAgso+NzqHCHqNauSOIee7P6Bb2uFCmsRw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 17:33:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 17:33:59 +0000
Date: Mon, 30 Jun 2025 13:33:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aGLKgholpl8Z3zWm@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
 <aFsaXXKZSBPrcYJb@intel.com> <aF8PZMuMgmWKYJgo@intel.com>
 <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1e2fbf-226f-440e-38dd-08ddb7fc4bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vgEqWJKHlbLcwviYRDLe+8UxxV3kNd0sDZwaTzA6wxuAtp0VeEaU0/JP8g?=
 =?iso-8859-1?Q?qt29DWHSEZkPHQEE05NQ3Q92H+9/DsRD9L8VOuK+UqKUfLT8AxjwlUYCPM?=
 =?iso-8859-1?Q?tf7mG2nzPq7hCPnCYGwEG9uQTrogxDN6jMlswymdbxcXbkGV/TO/NkE9h8?=
 =?iso-8859-1?Q?eT97Fx4LD771QMRz+tRpF3dXfNh3UVM5s6fdUTCaxZbXHxv9woufNo01iQ?=
 =?iso-8859-1?Q?UZvXZ2RC40pSPgrp6w9XUiyo408gpv+oFOSOxln7eeXie45MJ+J+CbtezG?=
 =?iso-8859-1?Q?Wp7/FssQNFHyzpBNMYJCw9KTx1SaaBuv3LWSIAnmj086qs1ZLnsIqrALng?=
 =?iso-8859-1?Q?Fbw292q77GyQpVXLGLfXkVgYaOGRaMF29V5RGbdSlvdSNzLikKBR7Bfs30?=
 =?iso-8859-1?Q?6ICN4eoJDwJyf46af0b/TWUqQuPzIJDKsDjZ4kNiqa1iOGsj/dkHpD3v+L?=
 =?iso-8859-1?Q?x/8/PHlARX3YgrSt8eRv4hAdFPyiN7r8cnqla3LoL51YHMBhk0bQ1RLD7R?=
 =?iso-8859-1?Q?SywC9GlsD6YHQlfmbhfcmqQgTa+HjTS+3jC8mgovgNlIA8ugnIe9l0k1gc?=
 =?iso-8859-1?Q?9iwMtrAUdgiE0MFYc+Rohw1bZu0bJRkQZa0Lw/KIvZC5oiNmU5CjbPO0LG?=
 =?iso-8859-1?Q?NIZnVsXNh4IE8gZYmqe0Kj8jlhIPGmGrptu94H6ksFd0xZ2AZTHbiJ0fs5?=
 =?iso-8859-1?Q?T0siF7JnZcQwIpPA/uYSx0Juu3U103J3CmGaJNFTTBKXiWfltRwPBKKxRe?=
 =?iso-8859-1?Q?1KcZjjRczwsWjDKdaTXiozdLp0+DWID0D3sXFZJzSMrKBdHH2xdGHDXmLQ?=
 =?iso-8859-1?Q?O6W9V2ro7bHX4X0jS8nUIOexgAaF1eJm99GaLQvaJK0m+5aFlwK2K6hAuU?=
 =?iso-8859-1?Q?9GO3ckAVO9tVG2tEzUY1yW/1CISU5i6Y4CDYIDdgBAZZjlfYOoMNgoNMP4?=
 =?iso-8859-1?Q?zZoGSvyYezXHjEXFlrQNClWnkO8JGHBZiFN1422E9SVCL/byFsmwEQg0eM?=
 =?iso-8859-1?Q?5kUYQZ2pKgccQ+S4NOcODRtBsrhSAvkegSMMzMXmRqyaQl+TN6qFMHDy1a?=
 =?iso-8859-1?Q?rXyCveQgqXMcpiZU3x5oOtlx36btv5h5qeMVhepczJF9MG8OQduYrKaMJO?=
 =?iso-8859-1?Q?Q6LJVmsgWIw6BIFMNp4PSt6jAxTKHD7tSzEL813fhjEkNtNpXdPrmXxK0W?=
 =?iso-8859-1?Q?RZOLgCTETfuF2CMMp77T5RogfoV3phihCLrXjZns8VorQeWDIrIbgEs1eh?=
 =?iso-8859-1?Q?GLxc0Ay24g9GBzc1bjxMpZxq44b+AY/LLkZYrw2RncfmTSc8EvfmXO9msh?=
 =?iso-8859-1?Q?25Kes8sn9GOQSuEyBnhRDAhSev5woxEIFPkX0g2+FkSWz3jpu7OrMla01t?=
 =?iso-8859-1?Q?KI2YCMOCeqd3L9F2ATVGiY7rXIuQ/v6odtATbrMoeGS9FcdlLDa1wiLHIh?=
 =?iso-8859-1?Q?yW/6I61vvpHDfT4zaMe6bBLXjNcz6nTRM1NBKxkLFxH//ojPh2+495yOQv?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CV0/Hmcp1GLRfnpNmQ1gZ9xiYEl5KwwvBb7CtJSCZi1h/oECz9FBhZmFlm?=
 =?iso-8859-1?Q?94CMGCSvCRvUnyTq5sxVWveDehZz5dGaeaIBYMx4vVf75x3bQPXCDhMpt4?=
 =?iso-8859-1?Q?p9WrKLE479k5Wbm7kuSSXQ3mU4wHp7vuML4AVXAN2+QPY4g5wlnaGFmgGR?=
 =?iso-8859-1?Q?1M/n5xTF8cdUABZZxQSEMrb7khpOe5EI6oIjcFSYPpJlIjzIyBr1GViYVb?=
 =?iso-8859-1?Q?e25GOGLOP31gJwbezIT8JbAsp99Mocxt1UlESw1+JwSRT1ZnUiE23LDPMg?=
 =?iso-8859-1?Q?jyr5/yZPktV4RYvf37oT4Upx6QGSj6p36ZlLN2RGfCuKqWUrXOIb8iA4um?=
 =?iso-8859-1?Q?qNp8L3EWwZS3Mrptc209qpceJmpub21f4batCLR4nnsVJO59FY7/AfPY6z?=
 =?iso-8859-1?Q?yPO+rneDuP7XINmBZG3GhzFqwO22oqKmM5jcsZYwVSs6nkpDDd02/HWSYw?=
 =?iso-8859-1?Q?0ALENrHowtuZmJOLTGswjhgbQAoR2AYA4cfTpnAOXg8ze91iHaUVe7dAlf?=
 =?iso-8859-1?Q?XL6ZjUdvlibcYnRV6hO5Vtov1PaUz3GBPIXoAIg5vu8uW5iSBM3lbu2Kak?=
 =?iso-8859-1?Q?prwFw8l7E9zPkCuPP/mSwC0Texq4MKHnzHV0rTwrdEdjdU8pxIqrbHxLr4?=
 =?iso-8859-1?Q?VIVi0df/fSpf3hWkEmGlEmBFGWhmo9bjDSRglbhbpUo2b3EO8bPb3Q11h7?=
 =?iso-8859-1?Q?8zceYOpbsDNlbwx4MGS1EOLmsmUJ08cNw1XZ6utpMKoh8C73fwIZZfr8LF?=
 =?iso-8859-1?Q?b4AiJp/p55RkAoC8/FN/JhGxW7bgWG9dbQh0IRlsPWEdHGqMA6N72gIqfr?=
 =?iso-8859-1?Q?05ycbM1gsfdyqPD3emos+g1v1UC/jKvQKEkupttMKnrM5HGol22UDh++kx?=
 =?iso-8859-1?Q?4EDrZQsFBmzwVWPEfcKqkNmo3TDUdPhyUkIEkU2XIx/cJMAkvkefFTjbO8?=
 =?iso-8859-1?Q?6oV+yT3PAUHxFunmgVMgY+GH2bPc+3q4nj4yHKsQjYHCJHnf0cAxPhZNOa?=
 =?iso-8859-1?Q?PZ4WN6qN5Y59P5DVINDC5z7FO1hK/ft5hdVtHoF1ODlrPAK3bgEFELWt7U?=
 =?iso-8859-1?Q?DOpuCjql0Duwj4Yp39m931lLDF8tWefyarFcs53adx2jcJ2ZyDvETR0SWG?=
 =?iso-8859-1?Q?Rx7hcAHMnMuFv0VseYQq1qCOLhXSWZxyAHGYmY7oSMCkWWdeDEKOzC/q2c?=
 =?iso-8859-1?Q?lOkG89Y2PnG8imVIFyPY15fMUUIr5m/9INVCUYb2InwDLL9qJS/0RUnFf5?=
 =?iso-8859-1?Q?kzuG9Z/bV+vgJcQnwWIJPQIBhFsZYBURRI9epOqoz58OTxZHiCzadZzxMv?=
 =?iso-8859-1?Q?WcELpKTDE23HBt9sd5BspDFD7UyfutTTg2sENCtUl/Ob0AVplAP3gxj0sG?=
 =?iso-8859-1?Q?FkroAB340nHnm0sETRK0ZJwanrFCvhB1w4l+qsrzsShq0Sj2HAVJuk+NTg?=
 =?iso-8859-1?Q?hqXY2lf3V2xVVoPsoP07xcgIGeggCCIDseGZlyE0q1UnIQ2tawBUIk/WkM?=
 =?iso-8859-1?Q?UDYVvlkA2nkhdF2Wf+AfNK9kPEme1wkaMhchwAB2Lxw5QO5lgzGixYgOKi?=
 =?iso-8859-1?Q?i83uC3cA0o1828pZsbzdMPp7mYEbQA1RJBb1iXQovwG5y+4al0OoFm8BjP?=
 =?iso-8859-1?Q?RWPSIWcgY593zlere7GhEfM1/4qivumjFQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1e2fbf-226f-440e-38dd-08ddb7fc4bf8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:33:59.3643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsXwCvpmZmQ1bV+k0QVUyDEKMreLZRD7pQbUvi12twq9w7A8imh7kRWOhJTIBQI0EXTA0euse6cb/Ccicn0x4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
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

On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
> On 27.06.25 23:38, Rodrigo Vivi wrote:
> >>> Or at least print a big warning into the system log?
> >>>
> >>> I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.
> >>>
> >>> I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?
> >>
> >> The goal is not to do that automatically, but raise the uevent to the admin
> >> with enough information that they can decide for the right correctable
> >> action.
> > 
> > Christian, Andre, any concerns with this still?
> 
> Well, that sounds not quite the correct use case for wedge events.
> 
> See the wedge event is made for automation.

I respectfully disagree with this statement.

The wedged state in i915 and xe, then ported to drm, was never just about
automation. Of course, the unbind + flr + rebind is one that driver cannot
do by itself, hence needs automation. But wedge cases were also very useful
in other situations like keeping the device in the failure stage for debuging
(without automation) or keeping other critical things up like display with SW
rendering (again, nothing about automation).

> For example to allow a process supervising containers get the device working again and re-start the container which used it or gather crash log etc .....
> 
> When you want to notify the system administrator which manual intervention is necessary then I would just write that into the system log and raise a device event with WEDGED=unknown.
> 
> What we could potentially do is to separate between WEDGED=unknown and WEDGED=manual, e.g. between driver has no idea what to do and driver printed useful info into the system log.

Well, you are right here. Even our official documentation in drm-uapi.rst
already tells that firmware flashing should be a case for 'unknown'.
Let's go with that then. And use other hints like logs and sysfs so, Admin
has a better information of what to do.

> 
> But creating an event with WEDGED=firmware-flash just sounds to specific, when we go down that route we might soon have WEDGE=change-bios-setting, WEDGE=....

Well, I agree that we shouldn't explode the options exponentially here.

Although I believe that firmware flashing should be a common case in many
case and could be a candidate for another indication.

But let's move on with WEDGE='unknown' for this case.

Thanks,
Rodrigo.

> 
> Regards,
> Christian.
> 
> > 
> >>
> >> Thanks,
> >> Rodrigo.
