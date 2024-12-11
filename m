Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89919ED6BC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEE310EC11;
	Wed, 11 Dec 2024 19:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKYgFzQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0C810E60E;
 Wed, 11 Dec 2024 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733946305; x=1765482305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VB10tapQhDg+jpKPRAkj7T6aVuwBnkToCdjnH2OO+00=;
 b=iKYgFzQO8hXek/KCoMDp+GszTdF2o6V7qp4eLu13wBDDJ99c/tGvFKNi
 sgSIjGlqZM3pawLBxME8c68b2NrrJbRaw3maQQjKhWeo4KssprK53gGDQ
 g+yo4hinBd8ELWGCvETctsKKt+Pe4/VL0IEcBreuWu38jMl27A/xNbo7K
 yVxRMGTnnUYS57SrNoprRKTlTAiYwPYdVGpX4mslW7HhKFSHd/G5yI4Go
 rxZCtsk2cQZUAb+ozBlAVi5SVilujoT6Xdx174KOBIJhV7roCNUfYK0nj
 +5VWyPon0PqjBPOxmEAScyh+ldoyq6nYzjF3QqorCNgzdUmlC+lgm9Oef g==;
X-CSE-ConnectionGUID: 1TK8HwDyQOONP1NOSntHAQ==
X-CSE-MsgGUID: dqXaudZARW2WZHN2YO3xKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34070693"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34070693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:45:04 -0800
X-CSE-ConnectionGUID: CS/g+lShTd+03v29yeEHog==
X-CSE-MsgGUID: L6ww5FuiTemB5EyokWE/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="100956590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:45:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:45:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:45:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:45:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqAMndCgPwuNk1TiGFtv2NsDfLMcGAamxMcGOafbfy/EtDbUOVhEC71jPMXDfako9EoTowMknuuUotMqnSxpSpT9L9AjD6BQSGqSf23hm2kH3uDh5p8RFoSBqgyJ3BOiVzmJMCB6XlP+3ZwFpvTo0crjTPca9izbQxYj3yKj1TaKXi7mRybvzdWb8ByZhWBxCj2ogibboNs3Hw6QVW0cUVFX7p+ClYrJ6qrCelXIVYjUfTFGH49vHpFou4Zem9OJrqsDSgLBJ3HPooWuT4kltxo/PajXotrsWuNzEoT3Bhv2a0pPypVDl3fBIsHOZM4Us9gg+chNN+yf2kOpreJ9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1u9bqbtsqUdnYkW2mhicnbs4QYafqzFErRU3ik0G0E=;
 b=JP7R1MAJGjutS+4YzQMk0x2AFaLMRPM0fp9qVuFbcCk9Y+N4wkpMi4oyoDBYYx777/mwf/L+QdjCH+E+nebBHX7RV+tLWRHo20An7j+k99jbrsbUR9BoWLsVy1+41ynU2lIY3sk8/i6C8OyZOT7nexMuZaqiVidOG/gKsg09b+f+/vaB2eA7jpLH+hM4JpTYn6m5JK6ea+THXIKX+wKRg2fUaX9TB8jPguqE03vY2tIW75qOOBNKX4058xbA/zFmgKCmHcxGYVRJsobfmqTIfZZpcAR7MtaaEt1Da/akmtrXZaCejHdAI6C7gFEWEqKDEkeDSyb44T4HpeVq8fo9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 19:44:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:44:15 +0000
Date: Wed, 11 Dec 2024 11:44:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 17/29] drm/xe: Add SVM device memory mirroring
Message-ID: <Z1nruCRvmYAVZJ0v@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-18-matthew.brost@intel.com>
 <260df86a-d115-49ab-985c-3633b532e30a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <260df86a-d115-49ab-985c-3633b532e30a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: e742e18b-baf4-484a-d226-08dd1a1c31a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cuvvugU/i3v/ODwePFGAKv11pZVCe/KqJaKZt/6Gj9Rj32CPgyYHMKdCVefQ?=
 =?us-ascii?Q?zPv2vvOofQTlVtzWqesdjyRtCZt2n5bGK2/mXGviOcmzT0tOmp5cxccdiSRN?=
 =?us-ascii?Q?ZbXIMW84JfC6Xe2MLPOhdtznJnrynjCLED311qrjGzybMgYsy/tTkn9V6RUi?=
 =?us-ascii?Q?2pZaEBdD26TJs+msDjKjggEDqtLT+76WlixXu0HsmzA3pvRY6E9DQ3BYHlbp?=
 =?us-ascii?Q?QV6beQYvcNatQ2NvwNNn4LaCFATq2N/Y607oJtxea+sXGWSducSHYZ5+KNHx?=
 =?us-ascii?Q?gb9Lkgul1x6flO+GNaYunW91+tw7zcg7TbfL+LpgGQ1f/8exU0ewDeXBRbHJ?=
 =?us-ascii?Q?OTYgW0r3uJr0bPCjFz2PtvkmuNH/SFoSwfSQn0XGDPqPFaB6+WVl0bSegChV?=
 =?us-ascii?Q?FA0a6BrI3Drqv1F1AzdxtHsRGO3/ka0gJK5i5mEbqSyQmIigcC7h9vESr0I7?=
 =?us-ascii?Q?hKrw+WPK9UKJIvi57A9YZLDZRFe2ltw0Bcv06bf9vMxV8fcI8+5+QVnOnUSw?=
 =?us-ascii?Q?B/kbun3tQU2gyTFZzAFTAsi7JiiagI1U5N3cstmsbES8TyHUSSkjeP/bKPWW?=
 =?us-ascii?Q?jUeaDG+57qylLTJXg0Li3cjCd64Y/dbpFnHiZGdx5hW2saPTMi1O6oIu+nUl?=
 =?us-ascii?Q?r+2TgE9M4IQ0YEi/11a4a4IjTsmshZJdsXu5OBbFivyzXKsRPwXlLhaKJZds?=
 =?us-ascii?Q?UUDc2SHe5gKa/2JjqvzvC9PZhbigTQd1D2RK6VSTBdH7HcjOrY3y0/SgVHo9?=
 =?us-ascii?Q?n/+yzmdG2TBXxPttJslJLFUc136aAFKdjoz3BJcYTb7hwpiKyK8iMJz+nJtp?=
 =?us-ascii?Q?Mo7UEPvsD3wt4pzDh2/cRX33oGMc6mZ9gSuCwx6qoNeVIkPIAUvqNxDVKuS3?=
 =?us-ascii?Q?F/YReJF63/lNrOFp9cVahQCMwZ2s2u2IwvyErKEU49wRgEHe/bKIZ+GrFmFQ?=
 =?us-ascii?Q?z2HlyBoVV+CcT1tqhYk7sthZC961KRU99T0uPnev/hM13XQ3o1OrKLEYB13I?=
 =?us-ascii?Q?dcT72jyL5rE4dFcDBQCil90u2eJKnZIinnoYSqYcOdYItNGyR002CoDDA8+f?=
 =?us-ascii?Q?pr1OeWTwJTZd+f80KuU3MUVLSvLoxf/lVDutgOLZ8iWq1UyaIcqBf8jUcrNx?=
 =?us-ascii?Q?MmyzOrRSE7XETblfJFVXoOvGhnEcH+51C+jpqtSdmWA/yP1W5sIPAfdfpfVG?=
 =?us-ascii?Q?mFcEWC99Qywge+4Z5zulTCmMbpsk83DejQxLDEICQ5GMEa7bgoyUgpLnYApN?=
 =?us-ascii?Q?zzmi0e8KLg7SahKwKSoBqJ83iy9JLJ3f1eLSPkyQVViMujvCK6Wnh+6WuXa5?=
 =?us-ascii?Q?a+Z7wM1QZzxzu+EzeO0Ve61PT7T542qmRHvV/BvT+J2szg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?crv8ZvkupRIx7+p/x5Fspdr3XugqAcuh6RIhC6lXzChhssVmR2MYXiZjTOS4?=
 =?us-ascii?Q?4X67MJdtnWFjTpTGx5a3UEzdTppjjzI3LFj9ZEDwv7YUl/K/tM1ucM0qnU3j?=
 =?us-ascii?Q?eXPY9+GKQjAN4/cRmCalRFDouTG5WvGkKcvT5GwUbKhugJGGEbzaHF7VZoTa?=
 =?us-ascii?Q?H9ksU2M7xW+QdRLG5hy49nWInA83o+kjSnJ7QU8SEM1+fZVlvNmjiPbqv0Vu?=
 =?us-ascii?Q?2G+1r4Xa1VxzSYcPBMfWv3npu4OKwurXY4inJEVIWdiIIy0yF8cgtMKhdcTg?=
 =?us-ascii?Q?lNXwGxMvC2XRbHrERbEk2VzXfEMYqUa0+eFxceyLXdJwwxXTHXZ6R11Sei3r?=
 =?us-ascii?Q?t+Q8rWox4Ed9ThJwKsjn5Qa0KZALr8UkLJbNj7khg/10NGxMhsR5g5zwxUYi?=
 =?us-ascii?Q?vLLErRsTcYStIMmF0EMDqMIzYRM7+wtWUAJ74r3UD9tSW7kziMg6vh0SCjka?=
 =?us-ascii?Q?wVPHD094d4k6+ChKN3PdXdcpiHz6+XoXdMzAjTYIb6CV3hFzAbir3WOvjWIX?=
 =?us-ascii?Q?gWiQq6Kv00eBaSgfNNbs6lqi+KrtabVxePnwuI/6Pe2x0ivcK/XBfBsPA0p3?=
 =?us-ascii?Q?Q0y6KQpLYk/jQbnmww0/4JSgudnxDMdV96BN3eusJ/4xCTNF3YY2yr4FfBJ0?=
 =?us-ascii?Q?EbNXV1SBRkoyEqxgl3WcT/l1XLHnXXPHiHA/KkIEPll0qJMGVCQZTotHiCid?=
 =?us-ascii?Q?s4hhBmrI2+RTZXILLQNwwUk5PYrRep34fwLTPJ0AJQFiAMBv2rDMbHAacLYj?=
 =?us-ascii?Q?k8nCNk8dX2/GFxzBJZDOFR5+oe2sax+HqjG/FOJmuoEwDze2Mj8tEmDleBhW?=
 =?us-ascii?Q?42MQcMv4jzzkFAWSL45QQzDI9Vpt5bit4WpUb+1tC7pioe8dPAzFERvJN6aW?=
 =?us-ascii?Q?f+omaQBd9ojev5qronUOKlzMVv+p8OcspDAnnpZ+Hwzks/Iokw+QtWZknzxd?=
 =?us-ascii?Q?zpk9Ib74+UkqM4HT2Sy81hhOzePeaiquZPmJH1HDACc7YJ8WNqgy4mMe3aUB?=
 =?us-ascii?Q?drL4ASBPaeXPMSNKyslAaPDV6UPlbes/pUXzSsf0AiCi5fnAFMir8PoEh4jD?=
 =?us-ascii?Q?v71CemJ0IIz/LICMvgfqS4YA6oKPksgdJwoAyr6xzVeZJX4IOo4mGsbUZ9Yo?=
 =?us-ascii?Q?bTw3Ltg/1HB5uDS5Wx6bfq/UcdrMVCprGKA3VRqhRAlv2O0BMXvMSVbhu4U/?=
 =?us-ascii?Q?0shQh+qJ2rMJzskodPmJYWcKOPYNjt/knyVEAs8vC09Luk+Gnj2/JilThvAJ?=
 =?us-ascii?Q?gynBgX5Okmk3vO76GIuzT+UjwQV/006z6GE7loBsvQzBktUzqmpAeRUAPEPa?=
 =?us-ascii?Q?C1JqZ4e45SLGzfY8+/LRxF1dKiGXg/CjVJNVMPeLqcVXfj8buCVzDCjMxmvG?=
 =?us-ascii?Q?mnB4onoxJJQja0+lC0gxAmTK1+8GQ3njxaUB5SbMUyEVoybFE/WrpAj3j/hq?=
 =?us-ascii?Q?cQTdRLDirLSkin11VoTgnpqXBKFcH5ZZ40Tszsnasi0ZQ4LJjtGYuBnTYuVA?=
 =?us-ascii?Q?ipbfabW9QQI8Z2EGICdtLuzKeDp9rPa7hyIBIT3odTwxtL3+Kb6YQ5PpGFVX?=
 =?us-ascii?Q?n1KsV0FRcERpJVG2vB8Q76+I9FYaDEoyCgFCVWAdf7vxdMeTHpTUctCtBu+4?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e742e18b-baf4-484a-d226-08dd1a1c31a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:44:15.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmNluJzd2GmLkKWlg0GvI4EvbTi3DHrj83fPG2/nvzHU44+lOCm7UpemmOshGCUfRRF6VH2i3hu+yTYKmT/vEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

On Wed, Nov 20, 2024 at 05:05:32AM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 10/16/24 6:25 AM, Matthew Brost wrote:
> > +/**
> > + * xe_devm_add: Remap and provide memmap backing for device memory
> > + * @tile: tile that the memory region belongs to
> > + * @mr: memory region to remap
> > + *
> > + * This remap device memory to host physical address space and create
> > + * struct page to back device memory
> > + *
> > + * Return: 0 on success standard error code otherwise
> > + */
> > +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> > +	struct resource *res;
> > +	void *addr;
> > +	int ret;
> > +
> > +	res = devm_request_free_mem_region(dev, &iomem_resource,
> > +					   mr->usable_size);
> To use the devm_request_free_mem_region() function, CONFIG_GET_FREE_REGION=y
> in config.
> xe's kconfig need to have CONFIG_GET_FREE_REGION dependency.

Will add CONFIG_GET_FREE_REGION dependency or perhaps even
CONFIG_XE_DEVMEM_MIRROR Kconfig which enables this code.

Matt

> > +	if (IS_ERR(res)) {
> > +		ret = PTR_ERR(res);
> > +		return ret;
> > +	}
> > +
> > +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> > +	mr->pagemap.range.start = res->start;
> > +	mr->pagemap.range.end = res->end;
> > +	mr->pagemap.nr_range = 1;
> > +	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> > +	mr->pagemap.owner = xe_svm_devm_owner(xe);
> > +	addr = devm_memremap_pages(dev, &mr->pagemap);
> > +	if (IS_ERR(addr)) {
> > +		devm_release_mem_region(dev, res->start, resource_size(res));
> > +		ret = PTR_ERR(addr);
> > +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> > +				tile->id, ret);
> > +		return ret;
> > +	}
> > +	mr->hpa_base = res->start;
> > +
> > +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> > +		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> > +	return 0;
> > +}
