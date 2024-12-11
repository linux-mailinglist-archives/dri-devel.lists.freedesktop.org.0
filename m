Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA29ED715
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 21:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308BF10E145;
	Wed, 11 Dec 2024 20:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnZgQJQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1F10E145;
 Wed, 11 Dec 2024 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733948196; x=1765484196;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PNEHZDC0iGvjL8UXi9RNMUuI3sCD/bwyZA7VuDEPJ20=;
 b=WnZgQJQYalNtNM0D/pLkRzzg0xcvvzCh8D2eNWzLxeS5LTgvS/wdgKy/
 GpTY005wwvDfglgB6RqrsuAWiU7U+9p+3uSlU3pkeULKh6TdNP+LqJlLH
 omnjIHqmG3x3OMwguu++gXsHjAlBVZ/h6Cd8Fx4kcn7+VPXhczBM7ik+N
 /x0qen2h4Bq/JymoUSvvIisMItyxQfBXSgR/ueDktoorR/9DBHISTV8tH
 6ZSOgLMfrjZL6ImqVeUwclRPTOsEGkq17Blns6Kb27p7zgsLkxlpkjInC
 bGV466s7Yy0B5WUj4YK89K4H32wihtg/5y9YbEA2nk5MJ61b8N5ANE4dH A==;
X-CSE-ConnectionGUID: 2NxuePymSfaSLzIz5v6TBg==
X-CSE-MsgGUID: TaaBsX9pQyixLPkhRnCS1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45753607"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45753607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 12:16:34 -0800
X-CSE-ConnectionGUID: i6cZ9QOZQZKyuOVQM3D1Mg==
X-CSE-MsgGUID: lRMVdcl2RaSO9IVXdDV/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95787178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 12:16:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 12:16:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 12:16:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 12:16:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sejdu090MMrsIAd/EGDfTQX30CJT8jlQmhCzQTZhp2ekVkI8YNoZEo1pCdb7Z/d8WboLgWTh22hY8JyKnUFTjz0Y3DuYxJY4lWeLoBlFgWTXoj1/GxJbkpZvi7TgWheKjthx7+zaapfWzBbwNoUG2Yw+hE4G43h42SYcCb8QfazVhTW0cSoAZDI6IGEEkOgyNWI6dZDtOTnkSTJxzU8TjrDa9wZQssWzfl9Z8FBnaDcPT1Z9Z78W74hfVuFjAM/1j6ocW8XBbb2AAC5G/UymVd4k24mxhP17sLTaprEiPqLCJTLB+I68s7VmoSjdM9RsojzHdURTywCdj2I7Biz4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OohK8GPbtuKMGpqJpGukOLo+ZhA6aoTTI0/q2ddZVWQ=;
 b=nt8NgmsPn1oGxB73hF/+HVHZz1fbvv3aCxv5AIvXWVHfTYGK9qWqdXtzedgtdwlugr+cBLJL0dvB8wuF8BecFEXgot9gX+O1lHmGqVsEPj7AUll5HMgJGfFkZwIjo0NqYZg/eMqBNGswbuckH7exwTDoSJ4hJ/8wZhN0EVjKzjA6Bqw6eYO1bUxN0xUTtnxkw8QqnVBYYIRKh7K0708DtnmoY5CIilb+c+bML1Wpysu55Jx4XPcmBP3sSGUDAUJNEDNUlIhlqJKZRmRPvhl2QF9DoAvMqem6fWkRQhbT4VRTZZrqodjHQn6nXE8WMxUBnYRXCl8JrPjXGO2pmJVNMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 20:16:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 20:16:28 +0000
Date: Wed, 11 Dec 2024 12:17:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 24/29] drm/xe: Add SVM VRAM migration
Message-ID: <Z1nzRpYEZdSqPkOF@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-25-matthew.brost@intel.com>
 <c7ae9afa6b06e1aa6233929d20487b68b3fca2c7.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7ae9afa6b06e1aa6233929d20487b68b3fca2c7.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 717c3e7d-39db-4354-d229-08dd1a20b228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?i7Kl8cybHI8FV6YADMYlpvVwC9XvhlEDmVUg9l6+8eFdRMD9EFJ2UShZ4J?=
 =?iso-8859-1?Q?PFvv17eXgPK9fcWrYCNThsXJOqbMqVqChZWqKMTVryMznEqGYXDwG88CQn?=
 =?iso-8859-1?Q?makNtXgBaXOwI9WsvjYJ7tQDmsc7IIJzvygggn4oD1afTRbxUFWiCooARO?=
 =?iso-8859-1?Q?2e9VgvTcLGfUkotFx7spwunuaaDvZqKQTQ/WeGHq9Oa81q31ky/FArMUIV?=
 =?iso-8859-1?Q?gAzXKkGkw/vzIOaTTEKeRBGyzu+uTrIm3Jd4naSy5g4o35yo0XlT8KZSao?=
 =?iso-8859-1?Q?jDajr6Eei4mwdQKWw4sqbPf3qqHb2CSR2EUCxV/UbMjeVHzeHlJWbHh1li?=
 =?iso-8859-1?Q?KSGjvulCgm+C46bXB3r5TPb7NFIGt0X2fAZhRyeZ149u2PYhzKI49xyDfN?=
 =?iso-8859-1?Q?eBGdysajZzUAEHApwSL/Vswpc9oErsTs/gKQFVVCZZm26K9SrC7gRV91GT?=
 =?iso-8859-1?Q?bcXx2UR8izPOGV1BaHm8Kr9ExaRsQk2slzlScKTi94BWW8poKcvQ0qgMNa?=
 =?iso-8859-1?Q?1DBkgKHNlll7koJJtp0rhCNEbu41nar/vAdRAzcaHaKz164vAnM3zEYJ3N?=
 =?iso-8859-1?Q?5q1KO/4hxE1Pc26/7WOfQhXhmDvLYw7IMvb92iWqUHeCF0fPzcZPYuOuF+?=
 =?iso-8859-1?Q?90sRQ1ByqqXxR54/eZZGPX3iboXAVCvMF6bSX/+LhLNyPQNKqaLiKbWd7F?=
 =?iso-8859-1?Q?O1oSDo+E2mXlFWgG4jkOEuFF+Xut4KX+Fv+xzkCMPcs2hQgYc7eCoTrywz?=
 =?iso-8859-1?Q?cJpFrhFUNz47EKuh53v7llQvQQ50PefCvrP6BHE3Mi1gZtDiLiAh/bCicj?=
 =?iso-8859-1?Q?8xQfj1xDZ44Ep4EYeane+QUi9/haaE/vRB8G0v21Dni+td3ceqaALrXamU?=
 =?iso-8859-1?Q?HT7ygHm9FF2hss2gzLMi6Mby6Rxf+H6N1vUI6H6jQ56qEDU9EYYMhxZIxv?=
 =?iso-8859-1?Q?OmFRbWqyTmbaBwFkbxrSw1rg+HJmOFeWqv716KGoF9NDkPCC0ULR/YdDbZ?=
 =?iso-8859-1?Q?q+ljLCwto3DG7U1wud1b3nfXigf/ecbIjAljolgoJvoUfUdUnRapxxL/Pe?=
 =?iso-8859-1?Q?Cui+U8JxqVUAQU/IXWBYHUxlHYCyU5Nt8NeRdmpvoMvqqTPcHH8F1hkTRu?=
 =?iso-8859-1?Q?jWZHG0C8ANi3myQcA7JJ/882owMqGhyyo5R8lmf+b/7nD9MYWBBTZtqSdN?=
 =?iso-8859-1?Q?ZyQTaaOvFmKJ0MHgut/QvI7nUnwZRW1kUcAZgaoj1pu9d82nCAX54C2lYe?=
 =?iso-8859-1?Q?UOFhT6yjfBWDNIbP9IuQSFp2j00oa3PLJKJiCPSjN2EV5Foe7k8unKuZiE?=
 =?iso-8859-1?Q?o3Tju6p8IYkuOax2hxog7CA9aXUn8x3YxwoiZvZJn8YdOc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ef9YbKGhbVa6wqqCKh6vsK3ALqPiMj1Eg52DEcpz63pXWg0Ev35TtOvnHg?=
 =?iso-8859-1?Q?Qstc0PMRiOTszDqdN9K9hUvSbgRJPxuJwuRogkc3Mw3NMqjwhok6jhCFQC?=
 =?iso-8859-1?Q?SIFQM7dJFKRACwODTMFrs4lLhLclj9Q58nwYgvQM/TmOA5IGyVDzQJhNni?=
 =?iso-8859-1?Q?JrbVIOOvmZPaEVAeaD+SLhcySHKcCxOaNc3cUocKo9vr2+rSyY5Xz3KcsS?=
 =?iso-8859-1?Q?cBdfoI51CiZ65AmJCJ9jYkN5lxbc3tMOAvX7odZF1BXWQ5IT9xEVqP5cxs?=
 =?iso-8859-1?Q?HFwtNPi1wI7GjCl/vob6YH2nGOyh7+EAmdbd/40wUJbsoTJS6NO4YovEBe?=
 =?iso-8859-1?Q?cGKRmY+maG5dl6fVWwanUnBlq7og2oJnpk+nUnW656oIa9zkxNeQZSsXMd?=
 =?iso-8859-1?Q?T0Fabu0zQf/Rcsj7NJ/q+YZ7iK972mvlENfKVR/oD6U6aoGPz3mYSZVab6?=
 =?iso-8859-1?Q?9ZXbRV1vCR7TAn0q4+W+SSJCkjBeUTQf5FU6XPtktfleT37NqnwpmEhgVl?=
 =?iso-8859-1?Q?knMoOP4DT1zOLULXGkq6911BQZnuXSOL2DDHBdJmfhi/9KnMDLaADjMYGv?=
 =?iso-8859-1?Q?PESO74pX7Qiuvxp4MuHl67FWHwvBi33uVKcoh0pSm4A/q33JLcbRspMueZ?=
 =?iso-8859-1?Q?8OBszb+soUmJ6TiPPqifQtOvvgDgzZlME8GPLPyySdzhY28xZqBsdFyijE?=
 =?iso-8859-1?Q?iLqjvrQi3WUS0d0RAvKhR0Xh+SBQEYCreV0YwnH0vMOHinW96FHA4FkE20?=
 =?iso-8859-1?Q?T88vm+HIPsO/dU90NjTo7pmUOC0XqSS8hobz9QtRzDnnBuDy4+t06TODEw?=
 =?iso-8859-1?Q?08SlBxpnH8ifScNNrN1grQzyoWLZRNhm801n79JE8Y7VELUNKVDcY6o5Xf?=
 =?iso-8859-1?Q?4ttY/sRIvzMpET3UsOHAcCpah9Bcts8teTqZCyq8uxMWtFt2k9guYO+YcQ?=
 =?iso-8859-1?Q?6AvEys2CT9PBS0AIrN8MHD9xy8zGGLKfp1u2KXW/c5xPjSM+zgYcr1J9gE?=
 =?iso-8859-1?Q?vzTlSPG2u5wp31+3X4PbDZNBrfX/5Q+apkhi+nzUtuKJUsqWdqSIUpkd7P?=
 =?iso-8859-1?Q?46HP9fS0ozy5BUnyqpuvaMEu9ECnOYaNakVMsplk7dNOD2snDTyxHFHupY?=
 =?iso-8859-1?Q?8BzVjE64+CCuHUI23WtF5BilzGCkul6iqKNQvHdrBays9Tec+CyM4pM1r6?=
 =?iso-8859-1?Q?jn04RUiCV6bm99/AO204Se4HeZkKb2hELcfg36u0rlhME9qZ9i3NuDToUN?=
 =?iso-8859-1?Q?0huVET7leeLUYvSUpbudUzwUyQjBP1baTwXuzSEI6e0ETgPaBcGf2HCdjC?=
 =?iso-8859-1?Q?vnKLZPK/ijc+6XuOMh/aBgqChcATLFPt3rvrJTfC774JuAUarSBXNO4gup?=
 =?iso-8859-1?Q?O+6IFIYFOzQfqqIr9CX5urfJPkWej72fYAiMEsWaXIf1QX9gsv7JL/9+mi?=
 =?iso-8859-1?Q?ci1iG7bNJtnQmqyGZnu/4wusO2cXcoM6sj9ba958R98vSU3Ljpasi0wm7n?=
 =?iso-8859-1?Q?H7I4/sbWWym6Xkb8vkK0o63duukUo5nzHlvADLd9TqnJogWqPmExOA2J9c?=
 =?iso-8859-1?Q?QNuet9xsZg61YE6lTxIS605fmEi3GCvLTzdhwBJyI3nDaHwh5y+qu81dlr?=
 =?iso-8859-1?Q?D7iY67MwAWNgOxJhyaYlvhSFLV4yG0CnenmCxEh9r0fs+tEkak3IzEmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 717c3e7d-39db-4354-d229-08dd1a20b228
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 20:16:28.8512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+Vr9dEX2pyGSMbXltoxYJeeuLg1qRRUkxI5KzOkIxCnWxJdKFEbrdajk0LqNULxTChGZRtK6jtm48rRgjRBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

On Mon, Dec 02, 2024 at 01:06:33PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Migration is implemented with range granularity, with VRAM backing
> > being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of
> > the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed
> > to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >   advantage over a BO.
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able
> > to
> >   evict each other).
> > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > certainly
> >   require a dma-resv.
> > - Likely allocation size is 2M which makes of size of BO (872)
> >   acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> > 
> > Current migration policy is migrate any SVM range greater than or
> > equal
> > to 64k once.
> > 
> > [1] https://patchwork.freedesktop.org/series/133643/
> > 
> > v2:
> >  - Rebase on latest GPU SVM
> >  - Retry page fault on get pages returning mixed allocation
> >  - Use drm_gpusvm_devmem
> > 
> > Signed-off-by: Matthew Brost matthew.brost@intel.com
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 96
> > +++++++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_svm.h |  1 +
> >  2 files changed, 94 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 976b4ce15db4..31b80cde15c4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -218,6 +218,9 @@ static int __xe_svm_garbage_collector(struct
> > xe_vm *vm,
> >  {
> >  	struct dma_fence *fence;
> >  
> > +	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
> > +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range-
> > >base);
> > +
> >  	xe_vm_lock(vm, false);
> >  	fence = xe_vm_range_unbind(vm, range);
> >  	xe_vm_unlock(vm);
> > @@ -458,7 +461,6 @@ static int xe_svm_populate_devmem_pfn(struct
> > drm_gpusvm_devmem *devmem_allocatio
> >  	return 0;
> >  }
> >  
> > -__maybe_unused
> >  static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> >  	.devmem_release = xe_svm_devmem_release,
> >  	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > @@ -542,21 +544,84 @@ static bool xe_svm_range_is_valid(struct
> > xe_svm_range *range,
> >  	return (range->tile_present & ~range->tile_invalidated) &
> > BIT(tile->id);
> >  }
> >  
> > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > +{
> > +	return &tile->mem.vram;
> > +}
> > +
> > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > xe_tile *tile,
> > +				       struct xe_svm_range *range,
> > +				       const struct drm_gpusvm_ctx
> > *ctx)
> 
> This function will se substantial updates with multi-device, but let's
> leave as is for now.
> 

Agree. Let's get a baseline in and then rework.

> > +{
> > +	struct xe_mem_region *mr = tile_to_mr(tile);
> > +	struct drm_buddy_block *block;
> > +	struct list_head *blocks;
> > +	struct xe_bo *bo;
> > +	ktime_t end = 0;
> > +	int err;
> > +
> > +retry:
> > +	xe_vm_lock(vm, false);
> > +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > >base.va.end -
> > +			  range->base.va.start, ttm_bo_type_device,
> > +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +			  XE_BO_FLAG_SYSTEM_ALLOC |
> > XE_BO_FLAG_SKIP_CLEAR);
> > +	xe_vm_unlock(vm);
> > +	if (IS_ERR(bo)) {
> > +		err = PTR_ERR(bo);
> > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > +			goto retry;
> > +		return bo;
> > +	}
> > +
> > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > +			       vm->xe->drm.dev, vm->svm.gpusvm.mm,
> > +			       &gpusvm_devmem_ops,
> > +			       &tile->mem.vram.dpagemap,
> > +			       range->base.va.end -
> > +			       range->base.va.start);
> > +
> > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > +	list_for_each_entry(block, blocks, link)
> > +		block->private = mr;
> > +
> > +	/*
> > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem
> > succeeds the
> > +	 * creation ref can be dropped upon CPU fault or unmap.
> > +	 */
> > +	xe_bo_get(bo);
> > +
> > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range-
> > >base,
> > +					   &bo->devmem_allocation,
> > ctx);
> > +	if (err) {
> > +		xe_bo_put(bo);	/* Local ref */
> > +		xe_bo_put(bo);	/* Creation ref */
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	return bo;
> > +}
> > +
> >  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			    struct xe_tile *tile, u64 fault_addr,
> >  			    bool atomic)
> >  {
> > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > xe_vma_read_only(vma), };
> > +	struct drm_gpusvm_ctx ctx = { .read_only =
> > xe_vma_read_only(vma),
> > +		.devmem_possible = IS_DGFX(vm->xe), .check_pages =
> > true, };
> >  	struct xe_svm_range *range;
> >  	struct drm_gpusvm_range *r;
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> > +	struct xe_bo *bo = NULL;
> >  	ktime_t end = 0;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> >  retry:
> > +	xe_bo_put(bo);
> > +	bo = NULL;
> > +
> >  	/* Always process UNMAPs first so view SVM ranges is current
> > */
> >  	err = xe_svm_garbage_collector(vm);
> >  	if (err)
> > @@ -572,9 +637,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (xe_svm_range_is_valid(range, tile))
> >  		return 0;
> >  
> > +	/* XXX: Add migration policy, for now migrate range once */
> > +	if (IS_DGFX(vm->xe) && !range->migrated &&
> > +	    range->base.flags.migrate_devmem &&
> > +	    (range->base.va.end - range->base.va.start) >= SZ_64K) {
> > +		range->migrated = true;
> > +
> > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		if (IS_ERR(bo)) {
> > +			drm_info(&vm->xe->drm,
> > +				 "VRAM allocation failed, falling
> > back to retrying, asid=%u, errno %ld\n",
> > +				 vm->usm.asid, PTR_ERR(bo));
> > +			bo = NULL;
> > +			goto retry;
> > +		}
> > +	}
> > +
> >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> >  	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU
> > mappings have change */
> > -	       goto retry;
> > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > {	/* Corner where CPU mappings have change */
> 
> have changed or have seen a change?
> 

Have changed. 

> 
> > +		if (err == -EOPNOTSUPP)
> > +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > &range->base);
> > +		drm_info(&vm->xe->drm,
> > +			 "Get pages failed, falling back to
> > retrying, asid=%u, gpusvm=0x%016llx, errno %d\n",
> > +			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
> > +		goto retry;
> > +	}
> >  	if (err)
> >  		goto err_out;
> >  
> > @@ -605,6 +693,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	dma_fence_put(fence);
> >  
> >  err_out:
> > +	xe_bo_put(bo);
> > +
> >  	return err;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 760d22cefb1e..6893664dae70 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -21,6 +21,7 @@ struct xe_svm_range {
> >  	struct list_head garbage_collector_link;
> >  	u8 tile_present;
> >  	u8 tile_invalidated;
> > +	u8 migrated	:1;
> 
> Kerneldoc, including protection information
> 

Will fix.

Matt

> >  };
> >  
> >  int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> 
> Thanks,
> Thomas
> 
