Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190EB5A192
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 21:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D9310E05E;
	Tue, 16 Sep 2025 19:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7wV/JOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9910E03C;
 Tue, 16 Sep 2025 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758051866; x=1789587866;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vc1ylC7/58JGWcpPxuDx4AGXuy3Mp8zGEgcfd3OcNi8=;
 b=T7wV/JOLtpK7jkxdSDRQBk8uazHzEMWO9elRJn7U/yh22//G8B936vfD
 Z4IoVNZFRTeAdTpywMFoGZVW9wTaF78zzf0AW+tPfK1H84/YVD80StMaT
 GB3VOQsVO1cuZR5wpA4cOA9AHki+taeNw6wCiGKYRpTefbcPxuKydMeAc
 8ay/iORPEA48Fg/6K+ghRq87NdcR0UErlCfkcSmH9tPD9PE5ebTeLs4gp
 dZkXhzNi6QDt42bqPfsYG39UhR4qzkxLEnzZ/3mVjwW428VXNmm9jeqtN
 IVCAmDFAjdp+CXB90/6MuxAkwu8pETuAIZOM4fNd+no1JBefA2xPy8HX+ w==;
X-CSE-ConnectionGUID: im9sPVtSQkW93oiOqZsxTw==
X-CSE-MsgGUID: 33UXhg28Tn2r9snNQ6H5kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60489662"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60489662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:44:25 -0700
X-CSE-ConnectionGUID: KhgPisGWSyCLJQCZ7yClcg==
X-CSE-MsgGUID: 2mnyhcsBTCOwxzJjnRXX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174640117"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:44:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:44:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 12:44:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/k3cvHt6gwbKvHUJEmOpfA20aWbxnEzaIN12SOatF8dWmKvxDnU7IitBLDd7oYRqCcUKv0aKqWLFpCv+xTvNlE0fduMQNHd8YGBIr1iIuW6B4ERwbnIns9H30/hckkfdXzQlJ4BpzSoKa8Zi85UsHppWkh4qKEOdmdfdNGfgmNIJoguYEkdfS4UDIoGQEX9k4LF5UPge02x2vvrm4idxlRXJPtzCKZEh3OxsBajWmhp2onNtet4oxn5rk47A07z3JONZ2ottIn/clAdD+VGrWPrjZ+qVrTOwlyEo+QcQxorQhYkLEay2SHEQn2HR0wO28kzS553hR+tpRWMa1/B0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gImkwpXU+J35WcaTiVaCWqgpr6HjaSugTlO8oTMz4is=;
 b=h1oW8JEoY77js+siKneKh2eqx4q4hnaYBtcNjz5SteEcOMZmB/CPW0ezDOE4yeSqpKb/4B0V6H08+VLWa/yiosDWMt70rQ3hWrsVGBMexb4UBSs95X9rseEf4XLfii/eEZqL/nOjdsYlpkjHgi9QLXEaKE7Jdro/DTTWHSUKHa5X6eyZZ6t0T7VgbkLBMCN3qNw3kc6Y5DNJx5O/o5sD3l/kqJUXJ0uzbyx5sSQopNUnybsgEvarisRGzBDHKvSyecEuH4FjQ6ipGjFB/Ies/mCruQsQNxlizzLJRbGMjyaOQI/cyV6XiJwMqEIrmr2cXa4HXz+HU3/zXslzp02+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8533.namprd11.prod.outlook.com (2603:10b6:408:1e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 19:44:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 19:44:20 +0000
Date: Tue, 16 Sep 2025 12:44:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
Message-ID: <aMm+EB/8l5K/mKg8@lstrano-desk.jf.intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-5-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915072428.1712837-5-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: fcba2b35-e068-41d5-4187-08ddf5596da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uXD9y0glxwx959kb+0xWxbPz+msVSFtjK8hiTiV3GtuGggW74nuUCzahm+?=
 =?iso-8859-1?Q?YaYSLLOy5GqDqan98wCfZlpHvr/7xxAuyrnZuG/VUgTxMZL9jQUAzxSBqR?=
 =?iso-8859-1?Q?oTJYBotiCvNdyHJZs/PJJ6CUEAa/CBKd65L1IfWy851PVfONOBM/IKLI51?=
 =?iso-8859-1?Q?8Z5U8WbY6wP3W5CQF6DfPdSW0/g8LUC1Jhao9k2NidXZLZMvY6+qEigOTn?=
 =?iso-8859-1?Q?Zc774fOq2LJ1atW0sCNwi5fRwl4oE0+ck3UcO8hRmXQzhQbCtJWToJreIk?=
 =?iso-8859-1?Q?twaOe5FwOoE8Pl9alPs2GNZ9wSCLgN+jp4Hc87fj1ErqDyE+oVw+Xbjx6q?=
 =?iso-8859-1?Q?AkSN3Sfltjen5T2K91EnZxgVZ2q8vCJPVd+82LO3ocQC/4J69PVRw9lqNR?=
 =?iso-8859-1?Q?V86E3ktyiK1bsmFvOrv1/CDslO0fIgz2zJisvpOSrPjKmBMc977zo9gXqb?=
 =?iso-8859-1?Q?/ud8sHNWrHQ0v29V8d36I5RulyY0oJAILqXljg4+4tldz37r51H0T9Cmwt?=
 =?iso-8859-1?Q?bFxiy3d9WPnyD1CzOsAKPcgRFr5XqhozDUNdO2lQT1TLBOmq3QWjv8bPWo?=
 =?iso-8859-1?Q?1IQpCc5lXdCWB43CaqiquAqTNOQqE5Hjn2G5gqmxNTG6htZSMFiRUBtq5/?=
 =?iso-8859-1?Q?y+uFv/4cVSL1Lv6QCbpYfXBHTskha2tAoRkjaPDVhRx6F3oo0hcvbiHMo3?=
 =?iso-8859-1?Q?c1yrxUwmOHN9j0i9O17YzvmPXnGEtT1eG8av36z83UIMGrwM5Pu/iQhIFF?=
 =?iso-8859-1?Q?SsbfSyRzjRls4GsfFKvQdM+7EwuFTW9GLYu0eNHQFFiQqIcP44/vBEii/b?=
 =?iso-8859-1?Q?pfBx1lr/6EnctIUAATxvILZ/tREgeM5qgZW//mYEZcLF5fY8M+UhWDYukQ?=
 =?iso-8859-1?Q?0HKxAYH+nPWzgFeVLADKABVGlgxGHRiNvXYYWa0SwTC4lf7K3XAfKt8uUS?=
 =?iso-8859-1?Q?bNuyUzOZg/kSJf5LBjMA/UE9PKjwLzJfOEn+FXWVsHxTBtvlGnLYypNyPX?=
 =?iso-8859-1?Q?fhZ8P+JaoWcSFGT0hwzMEzl3PACaw1hgFpl49id8IauiLm+0KQO/LbmrC3?=
 =?iso-8859-1?Q?ww1YhN6yqRp9v392yi1dJWlgCvQ2NfqQGEZCniVxv2e1ZXGCMijAMkAAa9?=
 =?iso-8859-1?Q?dAJ4LDja4v7LWYzNnHCF+mPOZhbm4lZTdYvJ92I6o+4m6ajjVbCu4H86XZ?=
 =?iso-8859-1?Q?g/n0SP5JjoXDGwo8J41jYtAu77rB9jv0KUPtEVBF5ht10I4TcckAUYcQQ1?=
 =?iso-8859-1?Q?BGo7jghePjgTOsfYnM3Lvz0NWtHV5LImhEsT73xVLDunQ+AZA03hvwDg6P?=
 =?iso-8859-1?Q?rsL63CBgrksxGPAIfX2DXJXx7qImeyIs9NfqopU+G1rny1ZI6DVfxdxR0O?=
 =?iso-8859-1?Q?p6Upk3WBdOhVcPJwF/zgxCoRJL7wimvc5cWVG6nIVC2JqeTNsS5JaDsfp5?=
 =?iso-8859-1?Q?khlj4hSIWU8dp9hAiubkD9uL829n4MbGd1ubNyDBvkoiKN+hbFT4QejC3U?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+714Krs2lV1L5C+zIyCQ2jRcP6RIIbJJNdRL5FR6uD1bWwa/aIXGjMlGdK?=
 =?iso-8859-1?Q?BUmenXk4aENcrU18rpBH8ehgt0I0C0NTv6zNDfeEHuHUA0evo56bbNoyAm?=
 =?iso-8859-1?Q?2LY3cWr5N3qcTyuewnKBGCQfqggviV6UpZd1XBvqFolloB5IczmiXejaEQ?=
 =?iso-8859-1?Q?wrSCR5lWsfp+hM8DY546akI0Fg47GyECskYUZda2CvvIzqUtZM3KUCDHi1?=
 =?iso-8859-1?Q?v+8H9K7yruwdHkz6lgBSGV73nbC/vDk/kmbjmzLdxOROHubuao3Wh+7/sd?=
 =?iso-8859-1?Q?8sjSHY5oe4aTQCl2dVsomsGBFDJ8AaoRbt5CtWxa37qpFb25X8pHhY3JuU?=
 =?iso-8859-1?Q?V4LZsJkReLqR4lHCCCi0Gh2w86Oyaes9R/hrsYToRb5nDLyANWhUOimWCT?=
 =?iso-8859-1?Q?hwMnAmiADAbItjEtCwR78V8t7PJ6YVgA/4/TN+8fzHKBK739bJ8sBKlTFM?=
 =?iso-8859-1?Q?jZwUSn1UeEbU4V2rCT0tMKLHEAE71xZvWx4lAKCkLK/z2cPMbYVnEPnd0V?=
 =?iso-8859-1?Q?7SqpS3c99WUjqNh/LMS+xvsEaNouG8ZK8pCL1ZvUBRPlC4iJ1ldwYpaF0I?=
 =?iso-8859-1?Q?R0Fd8+QPEgD/tO0bR8qYo1CV9ILD58dT0bIwYHgcRO20mLg6ta1D/QFgwK?=
 =?iso-8859-1?Q?5J+a7OPYQ/YxzJ3tAIuyIv6EClbLa6klz0F3Qwdg7fjCeOes3Hm0/o/9+2?=
 =?iso-8859-1?Q?kQHtFj+5XJMKU47R/TkM0uyTWQhkWiBnt+XwyU079hs67+klYKXNNfquLz?=
 =?iso-8859-1?Q?mbIagNhLzAU/g5QvAML+zucIohWAMY1LjtxyYpfE7sVxj5XLgJfdzj5N04?=
 =?iso-8859-1?Q?utRgL/vXl9E5m8dtJBIEUbvC2z2xx7VTWmUa/LDb/p0dRllwSm1RJC3+s3?=
 =?iso-8859-1?Q?bOalbqhsrFW9bxsDmsHnLB4d57XnUI0Rul383MwxsFnNCYnPYtcyOajN3z?=
 =?iso-8859-1?Q?l8wzYfEBMnaj1KZlHobIvmTa81pPZXqxsEGFLLH8evL/eNSOuQq8Ss5LUu?=
 =?iso-8859-1?Q?PSLSUKZsmYucgcHs9txLe9/Y2QsSkXXLOhGx3G5oa4Mcih2Ueng2MVYx3H?=
 =?iso-8859-1?Q?vMERWZlcChClubaHjxux8q7zTJR3LvEx+OC3/ZEy6lNSnwE0kae9fngrvO?=
 =?iso-8859-1?Q?UoysSmh9Rv6OpXFJO360ogvTff79XxRLwWA6t9xOZfa6IOLYkPmJE0nbWA?=
 =?iso-8859-1?Q?2MqwbLHKOj44cURPckA9ry+0WyrpOjHpyvm+N5O+twuQgi/obbTOIFFeUs?=
 =?iso-8859-1?Q?ensdmEyBByriZnWIKUJjklWCIkSSS+ohGiVz5OqJlxuXCVdWU46Z2qajQN?=
 =?iso-8859-1?Q?LOmYArU3+yLOXKeUmnXpEBV+BrLDYd8JTah5SBsG0mRrrjpHzjukq7vX4Q?=
 =?iso-8859-1?Q?bv9i+B6okMU/fYy/WfN9b3YNdQz6pD11KtVa7mkRL8HNpF0E4N26s5ybqP?=
 =?iso-8859-1?Q?dH8cKnGKH2srQyu4EHcpDXp51M4UHkMTH5+kpfPI/BP0qgEj8o5BhZF50A?=
 =?iso-8859-1?Q?CGuqyDClyKwzmevoltMBYfR5F10iGeC+1gSIK6eh4dxd226Z0OMQkELuFa?=
 =?iso-8859-1?Q?6UwNut9UuLJ375fc1l1j2ELOwk1eYP074ZZSGWSJwPiOEQaNii5RjO5ahy?=
 =?iso-8859-1?Q?870UAZ+9zztsOUP9WsedWaX11feAZP6DHu5GuIJBSupSNztSD0zrLDpg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcba2b35-e068-41d5-4187-08ddf5596da9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 19:44:19.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLBHiPDG0G1KU9Ex2GzAIScjIEgkXp5I79xYR+kqcqq6QdVAb2ba7MssUiK6w1cOIP67YNndmOcLFvuHHsU+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8533
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

On Mon, Sep 15, 2025 at 12:21:08AM -0700, Vivek Kasireddy wrote:
> For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> associated with a VF, we need to adjust and translate these addresses
> to LMEM addresses to make the BOs usable by the PF. Otherwise, the
> BOs (i.e, PCI BAR addresses) are only accessible by the CPU and not
> by the GPU.
> 
> In order to do the above, we first need to identify if the addresses
> associated with an imported BO (type ttm_bo_type_sg) belong to System
> RAM or a VF or other PCI devices. After we confirm that they belong to
> a VF, we convert the BAR addresses to DPAs and create a new dma_addr
> array (of type drm_pagemap_dma_addr) and populate it with the new
> addresses along with the segment sizes.
> 
> v2:
> - Use dma_addr array instead of sg table to store translated addresses
>   (Matt)
> 
> v3:
> - Remove the usage of iommu_iova_to_phys() as the imported BO would no
>   longer contain IOVAs and would instead have BAR addresses.
> 
> v4:
> - Take a reference on the VF's backing object in LMEM (Michal)
> - Create a new type for storing dma data
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c             | 101 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h       |  12 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h |  19 +++++
>  3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6d16b34e5b5..a4e09fa88274 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -21,11 +21,13 @@
>  
>  #include <trace/events/gpu_mem.h>
>  
> +#include "regs/xe_bars.h"
>  #include "xe_device.h"
>  #include "xe_dma_buf.h"
>  #include "xe_drm_client.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
> @@ -33,6 +35,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -679,6 +682,90 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	return ret;
>  }
>  
> +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> +				      phys_addr_t phys)
> +{
> +	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
> +	resource_size_t io_start, io_size;
> +
> +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
> +		if (pdev->is_physfn)
> +			continue;
> +
> +		io_start = pci_resource_start(pdev, LMEM_BAR);
> +		io_size = pci_resource_len(pdev, LMEM_BAR);
> +
> +		if (phys >= io_start &&
> +		    phys < (io_start + io_size - PAGE_SIZE))
> +			return pdev;
> +	}
> +
> +	return NULL;
> +}
> +
> +
> +static void xe_bo_translate_io_to_dpa(struct xe_bo *bo, struct sg_table *sg,
> +				      resource_size_t io_start, int vfid)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct scatterlist *sgl;
> +	struct xe_bo *lmem_obj;
> +	phys_addr_t phys;
> +	dma_addr_t addr;
> +	u64 offset, i;
> +
> +	lmem_obj = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
> +	bo->dma_data.lmem_obj = xe_bo_get(lmem_obj);

Since we're taking references here, and if those leak it could be quite
problematic, I'd assert that bo->dma_data.lmem_obj is NULL before
assigning it.

Additionally, I've updated the flow so that
xe_gt_sriov_pf_config_get_lmem_obj takes the BO reference under the
xe_gt_sriov_pf_master_mutex lock. This is typically the correct approach
when looking up an object under a lock to ensure it doesn't immediately
disappear after dropping the lock.

Matt 

> +
> +	for_each_sgtable_dma_sg(sg, sgl, i) {
> +		phys = sg_dma_address(sgl);
> +		offset = phys - io_start;
> +		addr = xe_bo_addr(lmem_obj, offset, sg_dma_len(sgl));
> +
> +		bo->dma_data.dma_addr[i] = drm_pagemap_addr_encode(addr,
> +						DRM_INTERCONNECT_DRIVER,
> +						get_order(sg_dma_len(sgl)),
> +						DMA_BIDIRECTIONAL);
> +	}
> +}
> +
> +static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct drm_pagemap_addr *dma_addr;
> +	resource_size_t io_start;
> +	struct pci_dev *pdev;
> +	phys_addr_t phys;
> +	int vfid;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;
> +
> +	phys = sg_dma_address(sg->sgl);
> +	if (page_is_ram(PFN_DOWN(phys)))
> +		return 0;
> +
> +	pdev = xe_find_vf_dev(xe, phys);
> +	if (!pdev)
> +		return 0;
> +
> +	vfid = pci_iov_vf_id(pdev);
> +	if (vfid < 0)
> +		return 0;
> +
> +	dma_addr = kmalloc_array(sg->nents, sizeof(*dma_addr), GFP_KERNEL);
> +	if (!dma_addr)
> +		return -ENOMEM;
> +
> +	bo->is_devmem_external = true;
> +	bo->dma_data.dma_addr = dma_addr;
> +	io_start = pci_resource_start(pdev, LMEM_BAR);
> +	xe_bo_translate_io_to_dpa(bo, sg, io_start, vfid);
> +
> +	return 0;
> +}
> +
>  /*
>   * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
>   * Note that unmapping the attachment is deferred to the next
> @@ -697,6 +784,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
>  	struct sg_table *sg;
> +	int ret = 0;
>  
>  	xe_assert(xe, attach);
>  	xe_assert(xe, ttm_bo->ttm);
> @@ -721,13 +809,19 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	if (IS_ERR(sg))
>  		return PTR_ERR(sg);
>  
> +	ret = xe_bo_sg_to_dma_addr_array(sg, ttm_to_xe_bo(ttm_bo));
> +	if (ret < 0) {
> +		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
> +		return ret;
> +	}
> +
>  	ttm_bo->sg = sg;
>  	xe_tt->sg = sg;
>  
>  out:
>  	ttm_bo_move_null(ttm_bo, new_res);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -1554,6 +1648,11 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  
>  		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
>  					 DMA_BIDIRECTIONAL);
> +
> +		if (bo->is_devmem_external) {
> +			xe_bo_put(bo->dma_data.lmem_obj);
> +			kfree(bo->dma_data.dma_addr);
> +		}
>  		ttm_bo->sg = NULL;
>  		xe_tt->sg = NULL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..8e416c4ffbca 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,18 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/**
> +	 * @is_devmem_external: Whether this BO is an imported dma-buf that
> +	 * is LMEM based.
> +	 */
> +	bool is_devmem_external;
> +
> +	/**
> +	 * @dma_data: DMA related data for an imported dmabuf BO that is LMEM
> +	 * based.
> +	 */
> +	struct xe_sriov_dma_data dma_data;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 956a88f9f213..6d5f923f7fc4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -11,6 +11,8 @@
>  
>  #include "xe_sriov_pf_service_types.h"
>  
> +struct xe_bo;
> +
>  /**
>   * struct xe_sriov_metadata - per-VF device level metadata
>   */
> @@ -42,4 +44,21 @@ struct xe_device_pf {
>  	struct xe_sriov_metadata *vfs;
>  };
>  
> +/**
> + * struct xe_sriov_dma_data - DMA related data for LMEM based imported dmabuf
> + * BOs that are associated with a sriov VF.
> + *
> + * The data in this structure is valid only if driver is running in the
> + * @XE_SRIOV_MODE_PF mode.
> + */
> +struct xe_sriov_dma_data {
> +	/**
> +	 * @dma_addr: An array to store DMA addresses (DPAs) for imported
> +	 * dmabuf BOs that are LMEM based.
> +	 */
> +	struct drm_pagemap_addr *dma_addr;
> +
> +	/** @lmem_obj: Ref taken on the LMEM obj that backs a VF's quota */
> +	struct xe_bo *lmem_obj;
> +};
>  #endif
> -- 
> 2.50.1
> 
