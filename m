Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD61B5A0F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 21:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3128810E805;
	Tue, 16 Sep 2025 19:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npzN4US7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AED10E3EC;
 Tue, 16 Sep 2025 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758049747; x=1789585747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HK2bJqW/UJx9MOk5N025Y1hjpVNuCZt7q/dlmmxHBP0=;
 b=npzN4US710mCC1U+jGQR2paUY4gKddVd38O7ZSibqW1rBWMoWJPrHJvR
 gpftj2S3nwxBL5OFDBT3uPJB9lknDJ6tWZgT2GA8jXjauxQ8sR6JTGOXm
 fJ2lBXRFy1ArvZmmI/qq9WZsN7QzbMa2yNZACuG8b8hmg/VQx8JiBXbX6
 usXMBCGL9H8p7Ufs8p9h14Opx24j+WOZa95342y8DESAO10flxpbFtith
 WUGAQqv9ynNjwnXAADv3kHRXfQLvjvYvmhK6nJVw91zAklNiha39KA26b
 XYguPGxjvlmK/cu5BkoyoVrtdfXBrFGynL4uoTSCCqSzZNfS5Q5EglSX9 w==;
X-CSE-ConnectionGUID: u0yx9ZdDQDew1aByOYeyLQ==
X-CSE-MsgGUID: nM26rGQzT7ujgUpq8YNckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60272528"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60272528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:09:07 -0700
X-CSE-ConnectionGUID: y1fWe11KTge9fI0Rvr0wYg==
X-CSE-MsgGUID: 3bsg5SE4Toiy8GiwtCYr/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175455759"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:09:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:09:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 12:09:06 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQhlkDLddXM/vr6pQlmKdEaJa+EMrjkxyfUV7+21cm46foQ4GadS2FeB+ewV/iFnOs6XzNSEYk9vDBA2Sdww4oWTcECURMNk5Pu8ACQTBvq/x/WrsdXIkBbwvyYO71Cd9pxzfXiSvAzjpAC2xjvM+YgtpDmaMXcrt934C2YWC63Z130udnsSf7YV6TNCsdFC0i2cM8tbhuT1yEfNQxWLMBv0s/j3poPPR59PD0pF9WDHuT+I8yrkTG75BI/fV+6HZQogOeSZMAmU7XrWHhSDR+IlKVN1+AdhJyCDHajyPN6kftZa5aJzqnjJlmpAjRBrceCtml1SomGhaq540X5GbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5X0AWhFUurKJzhxP3eRrOAIi9dZAZlmqYFOB5g/DTg=;
 b=v3DFHJoIl25ehpCWQN2RMevUjTRsYFiPf1uie8JB8WfKEofTChiPZpWhictQc1gXEUfW2bvJFnkJj4Yh6oeyAHubXbj7F7EanbHhPEjws1cyg+Pcgwt9rybY/fkJ2Lr946CVpvRKqZhOcb/upJnjldztTeZL0p9FH2cirq4l65UmRSXwFj8QcJr0mQiXrU+xrRtOGWJMnNoKKmy7YXYvXcK2YZ0kEVvKVbrimgPyE2tjNp0ZI+qrFADlub+LEwhCY4QHzf23ENQt6zSY8sjFSXWd1RBa2Ze+CnX+ku+/DKlFwaV768pExwSSNsnoTqzlPXB7CcyNXzeTlqiuJyXdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 19:08:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 19:08:57 +0000
Date: Tue, 16 Sep 2025 12:08:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
Message-ID: <aMm1x8pnn24D9c28@lstrano-desk.jf.intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-5-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915072428.1712837-5-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0cdeca-b75f-48b9-1f0e-08ddf5547cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HRxOJX8IIhLV0iT2tv0TAfIUYOeUIs45uyBKap/zIDjtDfRYPpBmWpXvcy?=
 =?iso-8859-1?Q?fPmSbLhFBmOHnShmtGqRfNY5+gaPe4jXwAqEvrKWhDUScWNO5ZDg+FmW2Z?=
 =?iso-8859-1?Q?aHkT3cEUAKO0d1wLQnTGllsNTFvIWpvgTbjgaF1akT8IbE8lzKq1c+hFZs?=
 =?iso-8859-1?Q?bcCj4fedjjqlYtKSdYOMiIWIJnodCDMwNnHU4pyqLQxYSz9DlxV5sHnw6q?=
 =?iso-8859-1?Q?f+hECMpIIQpigas9EN7RMUJklneTR8bkyA5gnn2XtmeFvzhV1sGwXrQVPx?=
 =?iso-8859-1?Q?lIE5TWsvX3rsvo2aVafXmw/QwB9AJ+t3QRcN/U+mynLq4OBPpE+HVkrzld?=
 =?iso-8859-1?Q?K5rOnzvRTW3doFvYdsuU4Ac5vLiSU6BlCoImiyjh0uSwh/YUKhWmFRdKAf?=
 =?iso-8859-1?Q?l/bCTpu/ov9owrPQCd5FkKWuKe3myX2yjGmqbv9KpQxdVm7uqkTv2fY2+w?=
 =?iso-8859-1?Q?+CIcKWrkQt60Aom6SmZiwSXoeR72C21ODZMGrjFgc7QM1CpDD/mTCuBIYH?=
 =?iso-8859-1?Q?PT1tVAsvUHBjIhBFH0X1nAOWU+heOsQDPcu0RKcS6cqb3E7NkeSAZGMePb?=
 =?iso-8859-1?Q?TaY91FjhwAHlqi9SfiGqOrdSvRB76v9LkPF8oWfVHGeyjFLkdojUD3JQlD?=
 =?iso-8859-1?Q?Ce5tyAgfIy8Ze/CCZQ/QKMdnT88n54qJIjRwsf7Qf7HjGGFZD6xtGN7F73?=
 =?iso-8859-1?Q?NdeeJm29/fuu9WT38cdPms3fpUghukRu7b2Zso9bLCHJ8LYjvJApuhTZAe?=
 =?iso-8859-1?Q?2wVouWN66PMKK8yzacJGsUAzES80wLRgV3IYlr1pdUuLwzqBXBvOmbnTyg?=
 =?iso-8859-1?Q?0YWG1K8JnhY0n6Wgv1RrMd0a4inFcYGz3ZHosEb4/7UHUYrDJ7bcBFsl2k?=
 =?iso-8859-1?Q?8vaxs7n3BND9qiXRGWtuFX6u1o4LNm0eri6agPgoNiKoCAvQz3GNaNWTTJ?=
 =?iso-8859-1?Q?qaOGOU+9ec+l/Lm9ZTie7CwL395JLL5q6++GH9pO926SaD25R66c6aOA4i?=
 =?iso-8859-1?Q?rGBjgQWM/KiNkyP91isz+lOUpMo6/C+x1D5mpY3am+xoKsRvT7Wj9jJ0Mb?=
 =?iso-8859-1?Q?V0J2LTSYGvYN1DwLtjpCYqv2CVJuZdhYquLdvqGqaBWfADx2XeohrNzJjd?=
 =?iso-8859-1?Q?K2L4f54sp/ZoBF1JHeLJTPN4iJVmQ+HMDq90BWqsN4shX+2sJk55NtoxT5?=
 =?iso-8859-1?Q?kQn+cK2C17Dk3xVv1P+XRlluSGt+jRcuuZ0ffI0AiKPq/Gdh1nLDeuelJ6?=
 =?iso-8859-1?Q?ro99BP+H1GX0w8QvImVfjLQljPpaOZoKn4Pd8TjZe3VmdUanP7picJnlrH?=
 =?iso-8859-1?Q?GtOIcBR+tOPVx19eeHDoGDkaQHjHeAurnxKzaKTIo0uW2jtsLxxjSBu09P?=
 =?iso-8859-1?Q?KTlqRPaCEpiys3gVpIy4G5zWLuQ9B1wo4EagzJ8FC76feK8HDy79VsSzFr?=
 =?iso-8859-1?Q?0m9XT/LoEjudxhmBR5V1XjW5qApDWd82NPHt5+6/TZQRQdhAdBX6cMPGKG?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hfBZrE9qtzo1udbY3RVhYsy/B7EhDdEhbXdNVBR+5XAiHDC16hIiRqNrdS?=
 =?iso-8859-1?Q?vbyLuZKhfu16wBLaNYtQHOyXQoaginErnmX9vevdDCx20fh4/tp0U0SmqS?=
 =?iso-8859-1?Q?T96CXLAx09aVAC0N+kLuhSBNRoa95iRlHKIOYP2HU9pny4DvR3+3koRssx?=
 =?iso-8859-1?Q?ZcfTfBnFwqLXSL4UKebJZ9yaVjfahENYkMbA9eT1eMGzuJ/fAwLwZheccE?=
 =?iso-8859-1?Q?tIaxh84SxnDPFG7PlqXs8b2VqM0rFwWzWrZpOCAx5bGrF7YUZ4MdPYAhTl?=
 =?iso-8859-1?Q?1qs7+RxaWde0vPVMrQyR4DPZm9Y/L+4IVUFf2Apd9U1b+Baq5N0KgYMeOa?=
 =?iso-8859-1?Q?Zd9yYE+wO6h4huoKrI9lD9lnFiBzKD7DQ2XWuKNIJmzHG1BZV1frNF3Uzs?=
 =?iso-8859-1?Q?OrK3MdVUmWnEg2+DvHz1C9HznoDEhUx0MeL1nrHPCZdVZeCd89yNLUf2Og?=
 =?iso-8859-1?Q?rmYQZcYs3Fio+pfbQf6+i9dmX+OHTSDToBYzJYwIrpe2H3SC/B0EsWL/Ia?=
 =?iso-8859-1?Q?a1+owKXel10zomL8OeM5AvAr7du7NDwiDHs67QIwH5O1WBvLa/iU20pEhC?=
 =?iso-8859-1?Q?FDOdnKILV6TvuwE0/Qg5Aq4XdDRwCk5b38yRuV8lmFZfwjYtsKcQZuzpQH?=
 =?iso-8859-1?Q?ztDh6f1lIi04uFeQBvfdswfFw8AztwSUxTOUxi4ru8dS/ernMsXbL7ABIu?=
 =?iso-8859-1?Q?s+7qmSpEz6U9CWJQGiy1akasExsaHAaPVZud6b9Gl7vkQD/7iZ0/1PmKtW?=
 =?iso-8859-1?Q?TFiWuviow4NUBuV6I6J0xNnFMwGBBldP/VcHnPk8pYPy+RyS0lzhpt8tor?=
 =?iso-8859-1?Q?Idc/G/cKHofULnHF6sFx8dQuLU7maOs0Hu5EArSuQohKwK95ex1JTVne6C?=
 =?iso-8859-1?Q?KDaHpYB2ZWHjhjF3b5a4T+Di9ta6TG1GBUvO7qtGb4YioBiVtb6JojQkvA?=
 =?iso-8859-1?Q?uk0QsdGH+1K8hG+/bGH+XHJMiXhtEP+l9v59eixeoOP5uBjPhFo+p+r2sO?=
 =?iso-8859-1?Q?YHRHBA3QN4UgtosvqMPM3BSQOS6lsFixMBmqyYdvgeZlJzStdwpSbLMOwx?=
 =?iso-8859-1?Q?B/Ho1orHL7mg0QVs4RE5ajyxkW6j51TEHsxDruXqhoM9zdynIDCmZ31BWR?=
 =?iso-8859-1?Q?qErs4nYJ8c/ilaPp7N8C/tG+lqbWAYt2XZ4dCtk1ixrCtULCROUnaXRmwn?=
 =?iso-8859-1?Q?p+mrPvU5zJrDHagb8hU7GhkMpTp/psnFWZfPVJ+ivx/z3vD/LyVpwDAxPq?=
 =?iso-8859-1?Q?JnAJFa5liiB15PQVGR5t4iv50FhIIbbJPCftgVBZaS+7S761nsmDDq9vpx?=
 =?iso-8859-1?Q?tq4NSayg039oHEPaqJlLiBZLoZ8DLjdY8SB+4kaHFdfBhTsKld9qUkXSnr?=
 =?iso-8859-1?Q?6v3zSSq7ZtkJMur579u8phpiEqkK7BXX+LHNITbSIoMBV+5zqNMHgflnrF?=
 =?iso-8859-1?Q?xEJYMEhPYKumYA5ks2fC+1VlloSjT6zMcIu3hug/kCbUvj4dpx9ZvAWu0Z?=
 =?iso-8859-1?Q?xWvds/en66O0qyl5FxebkGaXhRdmThZqpv8nYOTE3HYlkNAxj19dCL77Jk?=
 =?iso-8859-1?Q?z5wh6yLmVq7nXY1CrJQfnGTAeUdJjiZMmnriLY/PLeNdPvpL+CqTmzgemV?=
 =?iso-8859-1?Q?+9OLAdOLiTzpJUsUsHIN+HJqbl/K1fW/65K5t8/bLKRV/4y3N21KWFnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0cdeca-b75f-48b9-1f0e-08ddf5547cab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 19:08:57.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hisUFlptRkbMZfUlqVEMfOGp1GBdZ2tCm/9vREbtWWTBUrtn0zzFcKZHZ9wCxTgnK0Ehvr+14LKE9ZaCmp5qmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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
> +
> +	for_each_sgtable_dma_sg(sg, sgl, i) {
> +		phys = sg_dma_address(sgl);
> +		offset = phys - io_start;
> +		addr = xe_bo_addr(lmem_obj, offset, sg_dma_len(sgl));

I think the last argument should XE_PAGE_SIZE to xe_bo_addr. There is an
assert in xe_bo_addr which checks the argument is PAGE_SIZE.

2539         xe_assert(xe, page_size <= PAGE_SIZE);

Longterm, I think we should just remove the last argument from
xe_bo_addr as it doesn't actually make any sense but for now to avoid an
assert popping if a larger dma-page in SG list was used (e.g., I think
it is possible for a sg_dma_len to be 2M) I'd use XE_PAGE_SIZE here.

> +
> +		bo->dma_data.dma_addr[i] = drm_pagemap_addr_encode(addr,
> +						DRM_INTERCONNECT_DRIVER,

DRM_INTERCONNECT_DRIVER is a bit inconistent here as elsewhere in code
we use XE_INTERCONNECT_VRAM. I forget why we added that define, but
either we should move that a place a bit more common then xe_svm.h or
drop it entirely as DRM_INTERCONNECT_DRIVER == XE_INTERCONNECT_VRAM
should even these mean the same thing. Not blocker for this series.

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

I don't think you need this. Wouldn't a check dma_data.dma_addr or
dma_data.lmem_obj not being NULL?

Matt

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
