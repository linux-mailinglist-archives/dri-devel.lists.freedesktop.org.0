Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F61FB1BAEA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 21:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DBD10E03E;
	Tue,  5 Aug 2025 19:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncicdk7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA1B10E03E;
 Tue,  5 Aug 2025 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754421935; x=1785957935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6SReUVkq6kgSsVexQlnroM4Gx5dmhJ39Xoqk4OfOY3c=;
 b=ncicdk7q2LCK5esNwPxw6Ye4RRCNcEJ2mhELqmRMLFzszE/6Uj673uGR
 UJEASoc6wVUidbsFgclE6brZKL0rC12z5F5S7dVtwKtkO9qxvR8pSc/TY
 PQheMZE4UTCVSpBr956gxYnmpD9F6Ff6a9K2K7uWG3d9TZsx4Hrq+kS2Q
 f0QtU5dkAsN41HSgtZwL5SxVoNNbBQSpqZ/4XE5IGfOGubUvxOEGfz7If
 BGlMLQWmpiZCpvea/r05b6YvHkb7TTTftkrZ9AEFSlasGk5QAawqgEBAH
 6wVuzHZ0LmCixyRaJ6R0l3uvDZTCfdsFt2HH5AqPMgcGGv9TNL1c79hoT A==;
X-CSE-ConnectionGUID: 1HOUnGv5RiiuFrq4yqnp2g==
X-CSE-MsgGUID: CdEDcH2QSrOAvQ1XV4S5zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68183977"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68183977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:25:35 -0700
X-CSE-ConnectionGUID: ZFjwN2PPRbm+Sf9GSvIdeA==
X-CSE-MsgGUID: B3QFg+adQ3Cq9qpWpJN7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164994730"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:25:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:25:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 12:25:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orvoNE27LcjAsaljm/nVn3HfokrFoy4dL9bKmqpACCelp+na/WrKH/WMABqNIWZlAOye94tPkpbuT2tgIfx5ppzCm/gme5fpvgBsJ89ayCnJUxMs8Z1M+LYvwUV/FqOawYV2LO+l96TnrwwZcYmTSPvMbWRDUzDXwNUAnewEm+wY86pI7l28U13sPjfhL4EDW/6JyexN1IK6a7XqObMQT6VvtlgtgQdOACcmSS6VKdAh9VgnOnqDrhtbfMA0thlCv7LsAnYeAnqfrnHcGbrAb9fHSMEolUgtHoXoyYFHglkit+1CFSVNt0Dmrh1zsuh7lrkwD2NZVxJM0g5dnmbjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de2Xi1uFqqRkeanv69DfXjgoo8GprDO75szeNokEzjI=;
 b=sqFJRuc5QSEp77QIXE1VrZzmwOLrbNgRrgFNVQYbq/Dkpi7ooF8+wh8ToHDjKlIx+XFen/6pM5YZkZTf2hSZ3uIVZtJOMVkqx9Ab8TpNmOUzoLVw71cwhT/gjHs2x+fmJKXAlbUaImsYBkmUyV+vIgFbieFV5o5iHaRQXIOmcAIiS6c2lHc2kOvEC2x2lvfFRf0SbuxKyscOBO/QRdvIqbASAVH9vf5F1rLcqt2lQg+nHWHRjm9XAxPvcmrkpjvCmw6SalJyeeKObLWsnaF/wZ5KQxuoasR0e5s474k8HiYiwB4y0lSKcvCvDKrNRML3H08AHnWy9GRivDgR+P7mDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8340.namprd11.prod.outlook.com (2603:10b6:303:23e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 19:24:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:24:44 +0000
Date: Tue, 5 Aug 2025 12:24:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/25] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Message-ID: <aJJaeSx2BPfFDmS7@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 9249c6d4-3ab4-4a7d-e8a6-08ddd455bbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bF7lIFfy4sR7UK5r+aWR8aVX3u5b+lviwD/d7A8tsMYrc3gTEjMwFo+gaMC1?=
 =?us-ascii?Q?XbNbVkc8AQZJI2n63eUWs/5l2DbfVuaUrYIdFUaGs/xIUWFZJ7G9ppkVy3Yz?=
 =?us-ascii?Q?4uesJuwQch9FY4lhoufKdjiHR9bvVv2MHfxuM4r8SVJmopyk7onbDxqqVigG?=
 =?us-ascii?Q?mKpQqPipdoDTNLoupAWvj1vY1UN1X2CT5L67okrnByfQIQuX3QQARDw5vukG?=
 =?us-ascii?Q?Hh55fHodwjiPz7034jynUkAIQNtKzbh8sX/jo+lfV0wA140ukeQkhgNnLgNp?=
 =?us-ascii?Q?E5d5tt8g1i+E008Z2eglldjcXKuvKci91nYwobOB6NE1BXBc4Io1B/ipwjC/?=
 =?us-ascii?Q?6GLMYG2jElKpX+o+DaxhoQhK1YF2EM8F+RFguBe0wmdiFoV/kIi0/5cnre0o?=
 =?us-ascii?Q?NmPlT8UrUah7sgq32S2klTgDwu6nN4qQkh3rxp6831RMZV+EIOsWTQglKZLD?=
 =?us-ascii?Q?L1sOxm4xpIA9AW9HYfK7X2qUg9tri1hRE9Io3j+/1CjHntEFtw4DlfMBiMbp?=
 =?us-ascii?Q?vzM7MmX1EKzaP/sFawiwZpKTXNKLvQFVdts6+zgepXPAAWCz4MocuhPuIY51?=
 =?us-ascii?Q?z2HHrziijsQfw94TJsWmUgAcBs+139Ee6gQjR0QRfaIWFJ0hBj4LyV28Ck/L?=
 =?us-ascii?Q?b6qDMg57JIIp7+fSBrNGC5+TaL15E3KbkXlZJdxA66yn52H5Y3ChXLBYilug?=
 =?us-ascii?Q?mcmvv3Bxt/dsQw5dbODOYFQFGuIIIvaasVtBoAXiVS6imyGxVPVSbS5vmey/?=
 =?us-ascii?Q?f+D3JIMSWfY0MZXTO9IOkTc1964lmZvgIpZvDzA6nV0J/L/PIdAojIiTd7pj?=
 =?us-ascii?Q?EXWpppguRfNJpn7utAxw2VcBXmbLOPJeQ4Iqhs4O2pXB/8hF5kEfDyWwPTP9?=
 =?us-ascii?Q?EqQvsdXAwo6KwH50NBXleveIakcyZdF/oqTZETmsbAhnNdQuVixx4E8R2z3W?=
 =?us-ascii?Q?hC8g02qrDPrUxciJxyWytB6Teue6b91jwVHCafi0UCJm9o11pfMXM4rW7onH?=
 =?us-ascii?Q?ZEN0/W/vuCod53KC2IUooDAxQzm3tsWF2jTmf1W/vF7FrAdRB/LuWfm55v3O?=
 =?us-ascii?Q?9DRCtZyxp9EbpAPrLsaPDADNTdRbd2FCoY4PmjMEEY+wReeGR8PAiSt8GlH+?=
 =?us-ascii?Q?BQhLHkIK69yxRZ06VX8FtJcaXd3/oO3fC5+kgZp4ZfBOpoTcz5aIDkhWqfbF?=
 =?us-ascii?Q?smohy2zyeTH6m7VNk2iF+B/AcjKtPgYX9dNuy16wjLDOJD0UBqYYtKIHJAt6?=
 =?us-ascii?Q?f8wE7E6DboBy12JXpgvZ2BKzasVGeCtJZj5naMDltHeqQ3MjLrHJUqX3f9a5?=
 =?us-ascii?Q?7GSkQLpe7bAIrvQRNdiIbEHdQzTU+9J9YazDpgMqlz/h3dGHjaha4o4+i5Ir?=
 =?us-ascii?Q?GK+8K/CMqRBmsUOwN2/owN0IZFeH9N3wBa1L9F4gRx0AnpCSPLNEuIBJh6BI?=
 =?us-ascii?Q?GADBfouAhKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+hp7xm49J6+OnTzK8MSm1s09R01a5uorvw0KBuzL3cGcLC/jicqXQ3TpUtmb?=
 =?us-ascii?Q?C6hygUyJpb6NxHMYHZQvSrkAjzPkeLv2syCtQ/gC0kjYrj58u/SBpjXSLVVj?=
 =?us-ascii?Q?2T8WGZvomba/mSZ/to2/++WIEaP4Hc+XjmgTp0OEXi71j5I+TqHlZAOmrdRt?=
 =?us-ascii?Q?hZrn7ggAXNHyFRvcIYwL+Tkf9WPF507itR5xjxY6IZ5LzSTBj+n39lJKZr/W?=
 =?us-ascii?Q?zThMP3HDuO8CPf5cYKTNsuKCySdQKNolVwapjQHGdTYi+uVKyPqWDBhVE3Ec?=
 =?us-ascii?Q?y2ZF6xpvBwcMNuacM6ZfEZyJP0dWg//vGUVKNJOmkafnfboKiLecxtV0/NCV?=
 =?us-ascii?Q?zbR5g6FFNj6cpe0IN3ADi5TUqGvV9UMyAHU28gCANiiabxbGAcutiFxv1C2P?=
 =?us-ascii?Q?W0tgixaorenIZxKAVkag5vNu31o3jxKYpnSQ7QtzBSdOE4+ybWqccYQJkYKF?=
 =?us-ascii?Q?IwKJpnXvlS6M+quV4tX6s2KLhnh9bxmNDXPt2vdVrIu9wjehZ1k1py3NqptS?=
 =?us-ascii?Q?XLk6kqzkhuWo1CbDiVqfQ2XjG5NSo99mJj9by+bu+7glDyUaRXqeZgeUg76l?=
 =?us-ascii?Q?Llo0x6d+diwIRFBbVEqeYOUQdTaxEWyEJgf+vuSVmCZbO8aTm01dDMYRIQF6?=
 =?us-ascii?Q?zfr/9F58QkNJBoGt71mTFBC4vtpyygEPJu3FEG54U+Vb8k8Z8TUJ8lxB2B6/?=
 =?us-ascii?Q?tc+ER/VpBoFKo32EWjbth22S8bKXSGQdSHGVwNCLfc30pFrJmsqLyK1i7nsg?=
 =?us-ascii?Q?5pKigxN66GK4gNmSnoacalkoEDPaEGGIJzBfNqqBW++nVmfjyHEJargOLU34?=
 =?us-ascii?Q?CUGQGQry2uMa2GXpQryLWFfC4btzzc2udLk/b3LpMBOj/jfD4Ngk7x2j+aSY?=
 =?us-ascii?Q?+VNrTAudbTsQuNTsRZT/XFmjW4b3MXF2RYDtyQiawPBggc+OQ3QN1FVYSEOC?=
 =?us-ascii?Q?mn1A2xexeBpnkg218sISlebcjeSOoJPjDmHfmuXo9Fms5UYVW8+Dqm9err/g?=
 =?us-ascii?Q?ohGnX+si204hYeZK0CYxtW932Gx+If/LHmU3jcCsxaRxiqqjRxlIrj53GANK?=
 =?us-ascii?Q?LLKf8iHSjzSlSUGD4Vr2Fyn16C4X4cTnZAPqkLtHECrmtE+cJdVR2KS90JDH?=
 =?us-ascii?Q?W3MapS0vxwISdTtc1JkSPrHRWLZK+5BYrpTPA0OYNkPTMpoSZ0Dgat3kiIrM?=
 =?us-ascii?Q?5iKN8h5qR6d5NDzI0PpEqVyIBHg4PUdv4Hs0/1ugzig3YcWO7L+Wr+Ziqk3h?=
 =?us-ascii?Q?KWNvgqesMBrSvmYg7PoOnBPgcKoXXb3109HPl1iVL15SbU/pyEprPuP+s67K?=
 =?us-ascii?Q?RRP86gbf1+tPV9ycQo51KIau/VS5dwU94KtFHevUMu2UFHHr+ywI7dKvcCMS?=
 =?us-ascii?Q?PITFcOsEtIl076QNeqhfEoZMDia86GtJXEZMde4OtGZ5AueQEoCve2tSdopq?=
 =?us-ascii?Q?bWhL+z/FSsLbOOz0w6LvXzOvhTQCqyK0nvSwiGpyJA4oXrrv58/EE6EQ1GyV?=
 =?us-ascii?Q?hcOOlyNaLDQQACVp0nImQEfzGKKIGWSesf+Nt0f4xjYOi83UrIhMGOZ63Vlf?=
 =?us-ascii?Q?c6MssZ8tRVNTlxYyhwKiIktqeXwoYAj//bNB338fUm8RtfH3ksrpM80DOwlo?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9249c6d4-3ab4-4a7d-e8a6-08ddd455bbb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:24:44.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osA9SAfAKqoN8kFkglCWHbLcKXFBdAQMel89MgxchZHa/WwerpCrYqW1C6h+YEhFRWv9o5IvJuYjE4WLkO29tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8340
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

On Wed, Jul 30, 2025 at 06:30:29PM +0530, Himal Prasad Ghimiray wrote:
> - DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
>   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> user-provided range and split the existing non-GEM object VMA if the
> start or end of the input range lies within it. The operations can
> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
> used by the Xe driver to assign attributes to GPUVMA's within the
> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> the operation with this flag will never have UNMAPs and
> merges, and can be without any final operations.
> 
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)
> - Add doc (Danilo)
> 
> v3
> - Fix doc
> - Fix unmapping check
> 
> v4
> - Fix mapping for non madvise ops
> 
> v5
> - Fix mapping (Matthew Brost)
> - Rebase on top of struct changes
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I think this patch looks good to me, but will need a rebase based on
discussions in patch #1 of this series.

Going to hold off on the RB until the next rev.

Matt

> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++------
>  include/drm/drm_gpuvm.h     | 11 ++++-
>  2 files changed, 83 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f04d80a3a63b..2aeae8c2296f 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  {
>  	struct drm_gpuva *va, *next;
>  	u64 req_end = req->va.addr + req->va.range;
> +	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
> +	bool needs_map = !is_madvise_ops;
>  	int ret;
>  
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
> @@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 range = va->va.range;
>  		u64 end = addr + range;
>  		bool merge = !!va->gem.obj;
> +		bool skip_madvise_ops = is_madvise_ops && merge;
>  
> +		needs_map = !is_madvise_ops;
>  		if (addr == req->va.addr) {
>  			merge &= obj == req->gem.obj &&
>  				 offset == req->gem.offset;
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = range - req->va.range,
> @@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr < req->va.addr) {
> @@ -2173,20 +2187,45 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			u.keep = merge;
>  
>  			if (end == req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> +				if (skip_madvise_ops)
> +					continue;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops) {
> +					struct drm_gpuva_op_map map_req = {
> +						.va.addr =  req->va.addr,
> +						.va.range = end - req->va.addr,
> +					};
> +
> +					ret = op_map_cb(ops, priv, &map_req);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2198,6 +2237,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr > req->va.addr) {
> @@ -2206,20 +2248,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					   (addr - req->va.addr);
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2234,12 +2285,20 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops) {
> +					struct drm_gpuva_op_map map_req = {
> +						.va.addr =  addr,
> +						.va.range = req_end - addr,
> +					};
> +
> +					return op_map_cb(ops, priv, &map_req);
> +				}
>  				break;
>  			}
>  		}
>  	}
> -
> -	return op_map_cb(ops, priv, req);
> +	return needs_map ? op_map_cb(ops, priv, req) : 0;
>  }
>  
>  static int
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 75c616fdc119..a8e9f70501ef 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -811,10 +811,19 @@ enum drm_gpuva_op_type {
>  };
>  
>  /** DOC: flags for struct drm_gpuva_op_map
> - *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE DEFAULT split and merge,
> + *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT split and merge,
>   *  It cannot be combined with other flags.
> + *
> + *  %DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
> + *  drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the user-provided
> + *  range and split the existing non-GEM object VMA if the start or end of
> + *  the input range lies within it. The operations can create up to 2 REMAPS
> + *  and 2 MAPs. Unlike DRM_GPUVM_SM_MAP_OPS_FLAG_NONE flag, the operation with
> + *  this flag will never have UNMAPs and merges, and can be without any final
> + *  operations.
>   */
>  #define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
> +#define DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE BIT(0)
>  
>  /**
>   * struct drm_gpuva_op_map - GPU VA map operation
> -- 
> 2.34.1
> 
