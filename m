Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBDA2F787
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B69410E5EF;
	Mon, 10 Feb 2025 18:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzRedhUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A175510E3A9;
 Mon, 10 Feb 2025 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739213012; x=1770749012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rhLmRmcweScm1eQZzye7u2L1vr+OeenxlHqamOVS3yk=;
 b=FzRedhUBTr57826gemjSeZ4kUvyV3g1JbKUiwKbuFrxvRqvb3lIPlA2/
 tbDa4nur4DA4SP4FtTrGKFk/wUmeErdnuHLanCUpXAt6a+f7pCcRuFU8/
 yYBa5S5jqw0xXhKNoytldhXcZqLpnIJ+SXCJvsYkdlcYCCkFa48LGyWwe
 Xp1MzL53aTbSEcc09RrXRtzVfeX/FrmNdMqpVrAh5/TVfEobymcyzV2/v
 w70+wU+1Wwx55HxtpLhBmWPNckoihUra7dMqNQp46SCV9BiBnmutgoIub
 VgfSB4lfZSX82zAvevNYsmdZyMoYlAhqyb9/OVz/sjneCkosfJTKPRYvf Q==;
X-CSE-ConnectionGUID: Mxn+GzqCTUKwZ9HAQKE7pw==
X-CSE-MsgGUID: Bc5bN32TRn6psTpPOiofRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50446430"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="50446430"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:43:26 -0800
X-CSE-ConnectionGUID: Isml5fkaRBWYVXui5MUEhw==
X-CSE-MsgGUID: VMK4AsoUTzy4HvbniUz89g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117352682"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:43:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:43:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:43:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:43:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFoJJ1twFwtUsJKZByP4uMHyUma9PBbGLv8/o+bp/vLv4Vc1yVaae0CtqLx8CCPC/KHbwN8hai7ea31Gq9WxtR28lISqiQfOmbT4EhkpPJHt/c8MbaELO1sg4E9i86oZ0z11Rb36LxxcxmBs+SkasZAtQALqrADoqn6EGiAzBnHkvLr0AR5+du8OXBzsdn/x5lwVp6BeKLxtyVERbOdbBLHX2rkX9bhYYfJRWyiCwG0MVg3l2/TjEojYyYpoI/CR8vzLr8iK//p8wSUQ4wTFfOKNQIBljdNmw4q72BBYWRdB5eyNhoP0HUzK3yR2D1Gsc4acyDLfYs2Pa9RPZDTDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIuQMiuEMgl2s3KmhJhXex01NkWxnHxmyljmaGw+JY0=;
 b=kbTq+zJe+N1S37roFGi5I2aSvzSEqcGe4n06RjNBlEpl2uR5253U5rikd6kCtWrG2z5QfNGG1z51H9XNMSf/Q1sXwdITpZcqnYj9YP2vqeEZIXmaxN7qBj4WJM8FyliXHlr1htIm59Oj7YOs5LR4OD2K+wK8qawBf1Dlg6g0xcIaFZQgbyQyZM33nKT75Ok03z6/RdIUPBuW4YPKm0PnQuX4zlmstrHyvxYT0QujLrORZbkzu5H5NhpOa4jAFVGi0VgC6Z068hTTGTpO0IBXnpiR4IAH/Jvnei89ZB6pOAWfWYV+xuuX//b4oAbhvwu41RmbEWY8WxYjB3IEYcma1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:42:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:42:49 +0000
Date: Mon, 10 Feb 2025 10:43:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dave Airlie
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add TTM reviewers
Message-ID: <Z6pI5EFE5C1tXttP@lstrano-desk.jf.intel.com>
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a234746-c841-4538-a1b2-08dd4a02b7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Nj8ph39T8fWJn1KQgcfjE41os3CBKr3xfrNe/YFlhEcdPI37M1fbKxfzDG?=
 =?iso-8859-1?Q?SiNJ42+nB58NCy+Di6XsDKV5a+K+iM4S5ao3aDYh/agMdenQsemzaxYzR/?=
 =?iso-8859-1?Q?kk5G/ZVbHjTZCC61U4BHhI7tsUvo1KQ8xl9aUq9kWTQOSVwBiWsC+I+vjI?=
 =?iso-8859-1?Q?uJT4UNM1gCiO7A2PKsEzYT0/msbbSVpa+pi8M3QfekUgZTq4Ue9z/OO2rj?=
 =?iso-8859-1?Q?cSpjwf3Aftwto9bE7QhZ5bhqe3nwasOqQcvmeN79qblReVIeBM16nUxnJJ?=
 =?iso-8859-1?Q?NHwJJKd67Skp2nfIvkdVRggbgVX7EbeEG3VpKO8mFWtG82tiReu5nh6pzq?=
 =?iso-8859-1?Q?CZoiADkw19JtUxcrEDxApqVnhSo0l7eftckLy8jyENqUB3WeuR41UCkIs1?=
 =?iso-8859-1?Q?lrr8BHMhtHiaQ/ct2kFI5euDdNqHXwOjaNSVHe/ebpy8xP/FvLnul+PTlu?=
 =?iso-8859-1?Q?NDevSwwQ05owa4ig3YM4pugJvgSwjReSaMPqi5hJBphQ7RM5OiDAEb1joM?=
 =?iso-8859-1?Q?63LueP79f/xerDoViXfuQyKZzmOD35TFu47QBY6sNsSNDalgeS+SA7s7zp?=
 =?iso-8859-1?Q?31y/VlcFNIIt4Yzax08rQygWo5omrko5trFK9J5mz+8u9W//z8eivUKhnx?=
 =?iso-8859-1?Q?13YtN+xxfrW0ciAeuxvh5pMFNfJQ53tWkb99ZNHlkitBSpP0ehVz8trE2y?=
 =?iso-8859-1?Q?9Ha7Ivekzr33AmxY1aePAMjcB18mtcgo9Gp1Bl0dUtaXdSlwxDtLwRNvVK?=
 =?iso-8859-1?Q?FrwekPK/M6VHJtezL1LS8cJiBsIAdfsvOlz9/2j4BMaN+BWHukrRW5OU/o?=
 =?iso-8859-1?Q?x+oRr6ZE6AL3gfKB9oRyaRPkiRMPbyF3+a1Hxjlq/sOIU6GM1DGelOYNJY?=
 =?iso-8859-1?Q?RwEeG4ejdHjJqBWmtm2GieW9IEgigfi0xpWLiSHBOjLoi/JVccWvTu5/x4?=
 =?iso-8859-1?Q?H5CRIiw7DT8LU6wK5kMvdzgPvG5oBl+3EyoP5TwEGD5mhwypUdDKmowfCk?=
 =?iso-8859-1?Q?BuFWNp63rK4J0erdmI/7cFjiS0UhSTmUZBW8yz1ml3Jet7BDcvpNYLhJ93?=
 =?iso-8859-1?Q?noQ3IJfaveIupcZtKOA+OPpG2y1WtQiZivtgMYPHvJNrOn4irTyfS1qokR?=
 =?iso-8859-1?Q?rxrVc501ViXb3pVZJF3z80SmGEopzouyOePNhf+GxUw7cSL/Kn1GtkCqQ3?=
 =?iso-8859-1?Q?p+haoN7TiJabIEDWEJR9nJsxlPDQy7LV9I+70dPLtrkMKbziBe3U4ZDruM?=
 =?iso-8859-1?Q?wrfcS8NNKiW2X74NJ0f+OCubt03Jb9vagRxZXrfdWz8lI6xlaCiJg2WyJQ?=
 =?iso-8859-1?Q?6hKfy2BuvhteuoFDyF+N3s34a+zyrSP8/bVPjie9WxyjCHNVT71l70WHla?=
 =?iso-8859-1?Q?Atj5BmnRkTkaQ7A9XFmo0FWuTijY03PQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4suRCfS8YRzcTfR1u+Z+H2UbMOLSaHHdKhnTbOyG6gNbVPQbe2U7jd3mR/?=
 =?iso-8859-1?Q?oRm7Ykopz+IHlxho6W1TPU6vEXmdyQrVA85Y5mDZL589MedImavfCtiNM4?=
 =?iso-8859-1?Q?NmPXlI+0yFZUjyLWiTe4elAAtMyaXD422dxiSVfVFouqzMVtoL9NrWexRv?=
 =?iso-8859-1?Q?MnYWBba1Iic1OEJLGJvzXaIoZOL5iDEZWkuQ9wiOS9E+VMig7o7qJhLCaR?=
 =?iso-8859-1?Q?XzaQYTjf16ugZo4V9hGwur7rbMj+FzZpq3icV8EYSOV1wFsfEKcM+vtGvI?=
 =?iso-8859-1?Q?8CdP0Jtmuz+C5InIpNALZtVTK1/bKn3ibLcSYAyYGiMfa/5lyGW9qHkwic?=
 =?iso-8859-1?Q?dmJQhLcMai8KwVIGERisGAENgvz6NMF0ud5Pdq35YsPfFWiDpw/krX00MD?=
 =?iso-8859-1?Q?/yrEj+uLaKQdNDJVB3+YxEYJrNHnYCpto0+GNnvscTCcbHTMVpw5UTSAho?=
 =?iso-8859-1?Q?wNdVQx2X2Tr8d413hgORslmVLAWxaOUeus9y1b3aYcA4GxyWKGPPP041gF?=
 =?iso-8859-1?Q?X63UdeimxrpqWG2tgv9ZPL9sxEGG5YJqyZ9vTUTy1U/t4R+fiOeMU4h6V2?=
 =?iso-8859-1?Q?xHMnimQt5WWzg4zvdcoy2ONv2oGWXz7M9ioLjuhKQ0u5xsO+zaQCnOwpX8?=
 =?iso-8859-1?Q?Evb3UFZLFhdq1DSZ+zaxKvL8A/xQlcb1/qSblpEKRx8iogUyw8OPwf7fdP?=
 =?iso-8859-1?Q?3iZT7CyhjxRjuEg/D+GFOPf8opKmDuKkVomM4bFysRHm+G01sKirnYATx0?=
 =?iso-8859-1?Q?0U08CayvsQLHen3sfgUPpAVJOrFZ7KeIs5rOi8JjPj+7HUiD+y42wLwue4?=
 =?iso-8859-1?Q?Gln/7AejHnWqh/GPhpztrUKU5YTpxKuwQQs+e1Z7Yf9CGMZJjewHsB+8Yw?=
 =?iso-8859-1?Q?9Yfg55P47sU+qVMdfRoOIJ4WUfDp/MJtNEsSAGQiK3ti+FKnQJfCIlS+R0?=
 =?iso-8859-1?Q?7F60hOs8WXq6QGMKkFM1LONJLper+oKPAtBEiTW3jLZh3ven5HAqe1olOa?=
 =?iso-8859-1?Q?4IdwavS/EQMj+nn1AY13dW+AUcTmxjW805dqAwhfczDkP24duug1S2eoew?=
 =?iso-8859-1?Q?AelkzcwW13w6Z5F4UenZaSrSdOBVBhX8K+TPgyCmGl8siYpMsFZSaHFri7?=
 =?iso-8859-1?Q?i0woRehP7tyNTewcs4bpqIW/6HuhpWB2nwuQ2gdrwUcs8INna4w8NVUNNc?=
 =?iso-8859-1?Q?ipWOkeC+2RQCufV3VTynOiZVYBEteZDRjpmvN88ch7CFupgYKoLr6fUguK?=
 =?iso-8859-1?Q?JiLyyaIgrceWafm+M13EZ3I3yZ0Zf6H9ni2mNLBojfU4QY08XKXM7GD3DH?=
 =?iso-8859-1?Q?R9i6Y8KbyPSXMI0kVA3G0M7rCI2rGUAMUA31N7FETwmYWv82e+BCGyXoIK?=
 =?iso-8859-1?Q?cL3Y870rKgOVjkjFjVFyzLesgqwv9XXaiRxlAHDvO8Jutosbp62xz8Jpwa?=
 =?iso-8859-1?Q?1tLBT+D99vuXa0IiWXfuZUu4E0jzS+5vx5/ESAXsKQsYEfdAFmfYtRY+jl?=
 =?iso-8859-1?Q?MA+QJ2xas5k3KTRGdneDAMRm2Fqf1GleJMPup5tY/t4zzgIbtfLlqv3909?=
 =?iso-8859-1?Q?//9rriIPZFBGRwFpSsnZbEJVaGgtiNbPhHm6ZQ2sAc2Cx4SIEiA6x5gAp6?=
 =?iso-8859-1?Q?ItiD8xsk2Zh5kKCtSnBvAtjbqwga/RAe+M6n/dI46UlvDFs+gLonsV8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a234746-c841-4538-a1b2-08dd4a02b7cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:42:49.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqueI/3X+lWguDKSt7eXkDDovap3UG5n97p9vuDiD3JTCQyhO/tnmZOeUPIwRrEtZr94T+/vVQR7Vx3moGep4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Thu, Feb 06, 2025 at 11:35:44AM +0100, Thomas Hellström wrote:
> Add Matthew Auld and Matthew Brost as TTM reviewers
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dbf6a03e416..7a032ea9f109 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
>  DRM TTM SUBSYSTEM
>  M:	Christian Koenig <christian.koenig@amd.com>
>  M:	Huang Rui <ray.huang@amd.com>
> +R:	Matthew Auld <matthew.auld@intel.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.48.1
> 
