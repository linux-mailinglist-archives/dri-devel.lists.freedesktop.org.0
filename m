Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME61F90kp2mrewAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:13:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0501F5182
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE4610E89C;
	Tue,  3 Mar 2026 18:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSq7cd38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F0310E89C;
 Tue,  3 Mar 2026 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561624; x=1804097624;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PdqQADp61IVtjYOzLbgwMY7M2AYUq6kqGqDbOhPBwr0=;
 b=PSq7cd38x6KyJNA7LPA7vWBz1UNsgf0hXGDJOIE354AQIWCoOK0klYmj
 nK5O+04Uvj4JBS20NZ4YGjjxzbd8SyK+wp7UvmrmKI9B3H9Hbx9cQb4Fx
 97NaFFl1NCINGB80H3vt2L1QTVFrzLtk53cF42I2Jyw3+yxCp5nZ4w8Kl
 bUqyaEKSYA2KV6KJSfhC+WALxMZaK1qX1h8Qh6fyAw+qHalUseIjHQOfc
 0qJl/uMJcgq4uJEDa4j1m0oRRNxpp0+7oZMtGztDvrg2EfGtMsp1y1oon
 ekxIicYAXQDRBrk8fAGhgLNKc3wURQdN/5hwHNJDaSgf/EW1jfzyDlALx A==;
X-CSE-ConnectionGUID: qs8QzEKcSjuH+tAAxrjQPA==
X-CSE-MsgGUID: q1Su2rnSRhqk8l+pL7i28g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77454965"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77454965"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:13:44 -0800
X-CSE-ConnectionGUID: adUS6M0lRv+AFoGFJMu6YQ==
X-CSE-MsgGUID: kQybSvZdRNmNdkSvS5G58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218031412"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:13:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:13:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:13:43 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:13:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2b2WA+wuuCWb7rc4LM6S9OC5NE/hq4Lvpbf1pXlcwjTG5v3OxzCBoatLtVxnTEpFCOA9OXsLcHS4dKmnc1XQTm8jVbsItOkb6Wd0KTrcIH1EUlIVEekgAl8hlvidwrf8z2hmO2L92aYw7aVM6ROKkPnIlLaB9kJ12GOGvjuvlbPuSBFWPF9i/ynX98UA8dPq03GCFD8rRh8bhmlxXcKxWEK9n1NB3e4qnPDEeWO4U022DUlykI7mOelMI0wlJfl7NgM0OQFS6/VAA3eS+2GXi6a4hEQhIiPM6dX21C4HN+HqtgJU91Rsury18eHqjyPYS2g4Y9XgM0NsRLcTwmn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaRMG3D58w2JGxNdMkfX3kjmnCtuo/6Z9xFFTHcKo5E=;
 b=DXjrtOQd9XfbdVcMlO3UUuqd2FMXO/PnMEIbTbsQmqayaPLXVC0+H9rdkRVobSem07AZf7HPniLbHCICrNDA3nwnHGf8oxICdtCx0HqfY7eaFHRs5Gu71CJAZuw7rH6LxJ1oRo/IyvGJmYWwZ5sGAEmoWgIuD4738RbPOKHxVbiK4lNdiob2N10l/uPSc17j9tthBGDTZm3veWwXhEEJ/s13Y+Vde3MtdsmywXNX445KaY4ABdHAgLwVj16tV35oRDyaZh6/md17tR/iQh+MDf19UUVEOnWLDreuDSX7kFozxM6oOBUNl/74cOOkl2z2X7J7mQQt3Gkd8j2Ky1N4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:13:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 18:13:39 +0000
Date: Tue, 3 Mar 2026 10:13:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] drm/xe: Split TLB invalidation into submit and
 wait steps
Message-ID: <aack0DFgje/muR9I@lstrano-desk.jf.intel.com>
References: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
 <20260303133409.11609-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303133409.11609-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc773d0-9bb9-447b-42de-08de79509830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: LjRW0yEnqPVmJpPVsvgqTMmCgJTfiRAvqfA4JeTEYW1mEivob3pcadDDExCtaOkCk8FTCc0Zzc+MLHdFYEqQNAK9V0B/wII6VvAhV+kQFs0YlmKBbkQYyb+3pxedwUHz0kceLyGkbXjq8A/BuLHgrTl4rD1VNb+0Q428Cgh6U8986aGW8a+A0uM2wj85+RD4wbuVdiIuPDa75ztprtKP6wvsqX4lm3AN3AQEeCnoYQsDVzQWncemTWK/ySim9Cv8cL0jtO170cBFAVNfZKJ427W+PuvOLAeZtmVsIJDkCEow+HuqrA8eHbiSGS1B/QTjJNtw/6kKkZ1tYNcwD86D4cI6KvLxrmEj2Roe8JlWv/G8Sb/YL7jJqBtc9/VaG9YqfyvQQNA72J6s6dNi3kZxJ7ymYvTMsoVn5tsFrCu5Hg1zaZ8ROEHeGeik1q3URu4Rykr5ERCXIuSE7fyumMm2WZahHw/Ipfifh4svqFIW7ywAJhImW/Mm2fGnCjKixvZ0iGXmcF0avhmL25hzGZ5KcG6p8UjifPSlnG7T1B/x+a9e+PcB4+ZSo+KsufMqsGB9bh8CuRDDkZlEPzbOhX8J4Xx1sJP4tjvSL3nXYP2pY04bZcqxd18mqjWszIegy14+sT845AZeqWMr64QtvYHOlOkbnFxhL+FyO/9Ok8KR1K6nVrbMC6a2Xs+tPQSDvgUVfbs7KFEE4g2QuHWEpnB8SHGmJ7cGS+9X4pxBdiE/o3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XwOSyr9WV4ae08qHL67Q2Q6YF3FDvkdDhOcuXACv+7Ss5v897lDUrmWG1L?=
 =?iso-8859-1?Q?C8+M8EXF3rg8E2EZTi037PGAuvWBnJyNpazCxIkIKqk0acZCl72/4Co8B6?=
 =?iso-8859-1?Q?Do/eE2nlsfkQojMT72714qpl63Bux3f/wyS48SRJK1ZDBr+9Zu+mut/npB?=
 =?iso-8859-1?Q?p+XmDixm7kPTVYwK7uVRUBc/6/gwAbq48HkGj2s3e+nOm+ddrJrvvQ1NrR?=
 =?iso-8859-1?Q?sXUrZbJEYqxuOVstrBtXj+l1RO+Q3m1ADtoJxVhSSCMJWTpHI7ftPbNR57?=
 =?iso-8859-1?Q?62DN1jW/nvqETl4fQ9y4nYaoSEEw4b5dy6AB3YV57sVKdxQ5j9DyH2GxZh?=
 =?iso-8859-1?Q?0uvfpTpzm7pR8d3ACaeROgc2RxUxjPf1ayaLPQkRzJc0//ghy8juhNiHpK?=
 =?iso-8859-1?Q?WW7553GncmcKu7/ART1Al3ZSIXviS2so/MZiTR1tIXxAjTaK5dWYU172+j?=
 =?iso-8859-1?Q?SlT5L0I0kRa49fC/DaXgCTLSEU7u4ss6MflopsYFMBjrDjtaW8eCUCz9+F?=
 =?iso-8859-1?Q?eY5ETQs4XsO+fVgnZVIE+adzZ3vsFPR3dXwths1imkcGgTxLbcebwjjrm5?=
 =?iso-8859-1?Q?PET5GgWEQXxclkgcZXe9QqdMLQYkMBI5WP7p2rhZtXtUNY3vppt+Yp8WFr?=
 =?iso-8859-1?Q?xN0dt4Th5bolMsAl8CD83TPrvylc1EBO+KFCkemLi6Ki/m4RxIEVcQ3IhY?=
 =?iso-8859-1?Q?tjBHyhB2MIIU0tkw1G25hrWcAhNHNhdYgeP/G34LM1m6Mn3JUiG64AdNgK?=
 =?iso-8859-1?Q?9uTv1/azwwdSrLq2f3e42Kv8W5UmuVlFq+5PRH/oFmI9KGdltHHm9TGmtV?=
 =?iso-8859-1?Q?XKDRf9JjEtP98MEMxGuF/95ZfPf/YiEUDK/9OFlWmJNCGemG52AWt/jEJ2?=
 =?iso-8859-1?Q?wyuIjSp9URTS7RpA6sbvvyAzykLQgX6Uo1GTLwyTC+huT11RJE6ClUaz0b?=
 =?iso-8859-1?Q?sQ5bmI/oCU0DO8uRacPzxU92cA16zXN8hM0tWukZ+GDCzjt2O5KAwoTlEC?=
 =?iso-8859-1?Q?aRsU1rpUxrofgM8gSH670e4JAIHHzdJS4XpBwRyyvRoyRfd7HwQY3DXnOS?=
 =?iso-8859-1?Q?B23moGYu3/TqnH2+/nGR5tlDQaOoJKPpYh9HK2Dh98UQPpbh6SENxeJufx?=
 =?iso-8859-1?Q?g6ak4p8pMUt0d8U8Gj8lLgaOoyZ0twC5kQLWJon7/z9BN9GXw2+9f2J7WI?=
 =?iso-8859-1?Q?CwP9bgph2i9rNfYSsBUhzbGMlE8fEGtYY4pn9BjLicKfmXWNctt+7sGQmi?=
 =?iso-8859-1?Q?BuuexctdKE8S2qJ3WzNx9cihuIwvPtgsA4W3OQmZ3gXW7A/McF31PTEsun?=
 =?iso-8859-1?Q?nXC7bQA+mpO1qD5As9qPqwAdhMryKNKhXPIOjtv/hLKapiEBgj0NAwzXH8?=
 =?iso-8859-1?Q?DoN1dreO+n3Z5RvjdWUIDCy8DIRsaUrsGz29jj1KYH4XtTLpa1zKCQ5EST?=
 =?iso-8859-1?Q?QoRbhvTSmbZVjuBr1icuzW98NOSLAFWJXjQaRWFeALZuejnMXMcDeUQ2B/?=
 =?iso-8859-1?Q?43XqQdEEpWgzWwF84Rl3RkYCk8/f0HwIzEF6idJ9LrYaiKP5g2E8Nd6xTq?=
 =?iso-8859-1?Q?Eoy3JfngQ8VqoOWFB3kGdZ37haqz5Q14tuoG+LCRsDBLoD4M8as82jyIpB?=
 =?iso-8859-1?Q?UiLAna2gSj68z684vLlWMYi0BgtBOXM/LGXqKQpVUE6Cbsfl6DNoflaGJo?=
 =?iso-8859-1?Q?AinKKdm9n2AnUuiN165eEcvb3ONfmt0SqgXBgZiH/anafrLuoo2lzntSoV?=
 =?iso-8859-1?Q?haKh/1FzgjTH0csZ3oAtbP5atqL4F4aX8/Yybjf/WSACyy9m4fuVLjB+dK?=
 =?iso-8859-1?Q?kKZrBzYlANGZvsu0yxtDohpd6uPsOus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc773d0-9bb9-447b-42de-08de79509830
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:13:39.1951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sracCjp+Keov6kDy8gJxuZcObXMC8td0wa0mMZRIrBUpsdhK4XZBDi0IbdwGrcQQK2THnRd67BHSD/LMHCp+NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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
X-Rspamd-Queue-Id: AD0501F5182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:34:08PM +0100, Thomas Hellström wrote:
> xe_vm_range_tilemask_tlb_inval() submits TLB invalidation requests to
> all GTs in a tile mask and then immediately waits for them to complete
> before returning. This is fine for the existing callers, but a
> subsequent patch will need to defer the wait in order to overlap TLB
> invalidations across multiple VMAs.
> 
> Introduce xe_tlb_inval_range_tilemask_submit() and
> xe_tlb_inval_batch_wait() in xe_tlb_inval.c as the submit and wait
> halves respectively. The batch of fences is carried in the new
> xe_tlb_inval_batch structure. Remove xe_vm_range_tilemask_tlb_inval()
> and convert all three call sites to the new API.
> 
> v3:
> - Don't wait on TLB invalidation batches if the corresponding batch
>   submit returns an error. (Matt Brost)
> - s/_batch/batch/ (Matt Brost)
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c             |  8 ++-
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 84 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  6 ++
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 14 +++++
>  drivers/gpu/drm/xe/xe_vm.c              | 69 +++-----------------
>  drivers/gpu/drm/xe/xe_vm.h              |  3 -
>  drivers/gpu/drm/xe/xe_vm_madvise.c      | 10 ++-
>  drivers/gpu/drm/xe/xe_vm_types.h        |  1 +
>  8 files changed, 127 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 002b6c22ad3f..a91c84487a67 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -19,6 +19,7 @@
>  #include "xe_pt.h"
>  #include "xe_svm.h"
>  #include "xe_tile.h"
> +#include "xe_tlb_inval.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> @@ -225,6 +226,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  			      const struct mmu_notifier_range *mmu_range)
>  {
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> +	struct xe_tlb_inval_batch batch;
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_range *r, *first;
>  	struct xe_tile *tile;
> @@ -276,8 +278,10 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  
>  	xe_device_wmb(xe);
>  
> -	err = xe_vm_range_tilemask_tlb_inval(vm, adj_start, adj_end, tile_mask);
> -	WARN_ON_ONCE(err);
> +	err = xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid, adj_start, adj_end,
> +						 tile_mask, &batch);
> +	if (!WARN_ON_ONCE(err))
> +		xe_tlb_inval_batch_wait(&batch);
>  
>  range_notifier_event_end:
>  	r = first;
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 933f30fb617d..10dcd4abb00f 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -486,3 +486,87 @@ bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval)
>  	guard(spinlock_irq)(&tlb_inval->pending_lock);
>  	return list_is_singular(&tlb_inval->pending_fences);
>  }
> +
> +/**
> + * xe_tlb_inval_batch_wait() - Wait for all fences in a TLB invalidation batch
> + * @batch: Batch of TLB invalidation fences to wait on
> + *
> + * Waits for every fence in @batch to signal, then resets @batch so it can be
> + * reused for a subsequent invalidation.
> + */
> +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch)
> +{
> +	struct xe_tlb_inval_fence *fence = &batch->fence[0];
> +	unsigned int i;
> +
> +	for (i = 0; i < batch->num_fences; ++i)
> +		xe_tlb_inval_fence_wait(fence++);
> +
> +	batch->num_fences = 0;
> +}
> +
> +/**
> + * xe_tlb_inval_range_tilemask_submit() - Submit TLB invalidations for an
> + * address range on a tile mask
> + * @xe: The xe device
> + * @asid: Address space ID
> + * @start: start address
> + * @end: end address
> + * @tile_mask: mask for which gt's issue tlb invalidation
> + * @batch: Batch of tlb invalidate fences
> + *
> + * Issue a range based TLB invalidation for gt's in tilemask
> + * If the function returns an error, there is no need to call
> + * xe_tlb_inval_batch_wait() on @batch.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
> +				       u64 start, u64 end, u8 tile_mask,
> +				       struct xe_tlb_inval_batch *batch)
> +{
> +	struct xe_tlb_inval_fence *fence = &batch->fence[0];
> +	struct xe_tile *tile;
> +	u32 fence_id = 0;
> +	u8 id;
> +	int err;
> +
> +	batch->num_fences = 0;
> +	if (!tile_mask)
> +		return 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		if (!(tile_mask & BIT(id)))
> +			continue;
> +
> +		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
> +					&fence[fence_id], true);
> +
> +		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> +					 &fence[fence_id], start, end,
> +					 asid, NULL);
> +		if (err)
> +			goto wait;
> +		++fence_id;
> +
> +		if (!tile->media_gt)
> +			continue;
> +
> +		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
> +					&fence[fence_id], true);
> +
> +		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> +					 &fence[fence_id], start, end,
> +					 asid, NULL);
> +		if (err)
> +			goto wait;
> +		++fence_id;
> +	}
> +
> +wait:
> +	batch->num_fences = fence_id;
> +	if (err)
> +		xe_tlb_inval_batch_wait(batch);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 62089254fa23..a76b7823a5f2 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -45,4 +45,10 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno);
>  
>  bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
>  
> +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
> +				       u64 start, u64 end, u8 tile_mask,
> +				       struct xe_tlb_inval_batch *batch);
> +
> +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch);
> +
>  #endif	/* _XE_TLB_INVAL_ */
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 3b089f90f002..3d1797d186fd 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/dma-fence.h>
>  
> +#include "xe_device_types.h"
> +
>  struct drm_suballoc;
>  struct xe_tlb_inval;
>  
> @@ -132,4 +134,16 @@ struct xe_tlb_inval_fence {
>  	ktime_t inval_time;
>  };
>  
> +/**
> + * struct xe_tlb_inval_batch - Batch of TLB invalidation fences
> + *
> + * Holds one fence per GT covered by a TLB invalidation request.
> + */
> +struct xe_tlb_inval_batch {
> +	/** @fence: per-GT TLB invalidation fences */
> +	struct xe_tlb_inval_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	/** @num_fences: number of valid entries in @fence */
> +	unsigned int num_fences;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 548b0769b3ef..a3c2e8cefec7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3966,66 +3966,6 @@ void xe_vm_unlock(struct xe_vm *vm)
>  	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
> -/**
> - * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on this tilemask for an
> - * address range
> - * @vm: The VM
> - * @start: start address
> - * @end: end address
> - * @tile_mask: mask for which gt's issue tlb invalidation
> - *
> - * Issue a range based TLB invalidation for gt's in tilemask
> - *
> - * Returns 0 for success, negative error code otherwise.
> - */
> -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> -				   u64 end, u8 tile_mask)
> -{
> -	struct xe_tlb_inval_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> -	struct xe_tile *tile;
> -	u32 fence_id = 0;
> -	u8 id;
> -	int err;
> -
> -	if (!tile_mask)
> -		return 0;
> -
> -	for_each_tile(tile, vm->xe, id) {
> -		if (!(tile_mask & BIT(id)))
> -			continue;
> -
> -		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
> -					&fence[fence_id], true);
> -
> -		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> -					 &fence[fence_id], start, end,
> -					 vm->usm.asid, NULL);
> -		if (err)
> -			goto wait;
> -		++fence_id;
> -
> -		if (!tile->media_gt)
> -			continue;
> -
> -		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
> -					&fence[fence_id], true);
> -
> -		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> -					 &fence[fence_id], start, end,
> -					 vm->usm.asid, NULL);
> -		if (err)
> -			goto wait;
> -		++fence_id;
> -	}
> -
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_tlb_inval_fence_wait(&fence[id]);
> -
> -	return err;
> -}
> -
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> @@ -4040,6 +3980,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_tlb_inval_batch batch;
>  	struct xe_tile *tile;
>  	u8 tile_mask = 0;
>  	int ret = 0;
> @@ -4080,12 +4021,16 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	xe_device_wmb(xe);
>  
> -	ret = xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma), xe_vma_start(vma),
> -					     xe_vma_end(vma), tile_mask);
> +	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
> +						 xe_vma_start(vma), xe_vma_end(vma),
> +						 tile_mask, &batch);
>  
>  	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
>  
> +	if (!ret)
> +		xe_tlb_inval_batch_wait(&batch);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f849e369432b..62f4b6fec0bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -240,9 +240,6 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  				     struct xe_svm_range *range);
>  
> -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> -				   u64 end, u8 tile_mask);
> -
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  int xe_vm_validate_protected(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 95bf53cc29e3..02daf8a93044 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -12,6 +12,7 @@
>  #include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_tlb_inval.h"
>  
>  struct xe_vmas_in_madvise_range {
>  	u64 addr;
> @@ -235,13 +236,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  {
>  	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
> +	struct xe_tlb_inval_batch batch;
> +	int err;
>  
>  	if (!tile_mask)
>  		return 0;
>  
>  	xe_device_wmb(vm->xe);
>  
> -	return xe_vm_range_tilemask_tlb_inval(vm, start, end, tile_mask);
> +	err = xe_tlb_inval_range_tilemask_submit(vm->xe, vm->usm.asid, start, end,
> +						 tile_mask, &batch);
> +	if (!err)
> +		xe_tlb_inval_batch_wait(&batch);
> +
> +	return err;
>  }
>  
>  static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1f6f7e30e751..de6544165cfa 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_device_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_range_fence.h"
> +#include "xe_tlb_inval_types.h"
>  #include "xe_userptr.h"
>  
>  struct drm_pagemap;
> -- 
> 2.53.0
> 
