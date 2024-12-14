Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1289F1BD5
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 02:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FED10E44B;
	Sat, 14 Dec 2024 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y80F/Vac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B951210E25D;
 Sat, 14 Dec 2024 01:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734138981; x=1765674981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6hh6p6IKVb456cYNxig5UMWSgB1Z8ZgRhJIF4VSh7w4=;
 b=Y80F/VacmwSlUeqW+KvtWFNxvb0YY3vm3lczumS76/HjK4VbxIxBSeT5
 3S0CaJ1aBrP6w5bwr7tDOpH38WCJfksFGFK45vQb9auoM302eb3J92iz0
 DnLICnhbFLhuzuBHU7W1KjAnfX57mc8PjafirYHGpQ5lyc7/jKy0SfPGd
 /LnCnnHc7eutywOhiHnktd43t6rxN6jeb2IpVhi6B6NN98w9a8sqLcNdt
 MwQ4RPUsfScqefTOumbckRfzqH7Kwd7wbW1DBzfGZ2H29/ebmGWzSQx06
 hmcxzql5fKUQ0yQYfX7aoETWgNCKswZKD+DpIuQrQb9c/8edDAgHrZ4Dk g==;
X-CSE-ConnectionGUID: GUPJ6JAiTZinKAUg7AkRkA==
X-CSE-MsgGUID: njdH5iY7T0SR9nDYIACY+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34479612"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34479612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 17:16:21 -0800
X-CSE-ConnectionGUID: 7+OTJAXnTNi+6NlTw3o6YQ==
X-CSE-MsgGUID: bvfu7W/CS966NWkpC/STrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119939026"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 17:16:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 17:16:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 17:16:19 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 17:16:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4MRZQawFwWyMkZIEpDkwGX+3MHF80ndEpgZJonhT3G272q4ghKg1A6HNx/dlA4BumCFkUTQ3sp4y7Z2tzSbrKaodzjzQDMbsIGNo2FzzDSeZeDJ/Nv1pFTaA7oBmqzUKb/ZeNjyYEZqslly3X5k55K9MrrcQNad9gCp1XlcBADFH6e/eDtCQJuLWYMKmUbLRnKf9649TMT+4RYuCk27Pwfz71QeolYDXxThVLQ10t6yfZMqm04XyPqW8KzYjnXWPdmgZ8qPsbxdX5jQJgbrZOWq/kwN1pQ4uVt+RPxGIey9ICqCzGZfZHf18w8HoVCZZuPqXizD9/FUgdApSJawcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbiAv1YOhMXg7come/tiqZESc6Ck148bIwen3mueADk=;
 b=Sw4uigLM2rBJvKPymdfoO2z2rrsLdXuvOPlx8yc94jgNBymL9+1UUP0Ok++70BWCu/+f+oy0Pq+IYG+9uTQ28AGtWNm2vaedQe9twCrTkih0UG/yXhVH8kfo4foNeO8bxiYSoFndLJ+BkiqDSzzJVFz50nMrqL5JjmWULLc5MenamCfV0kBcPlSh+Ee4TdKsjbugjNG47eUPz3MiwJoqUZy1VA3XUdoGfHww/J0eudG2NxmAdvqjxccaL8j6M9Zi68fyDQf6S5/pYfgYI1Gp5VPBlylBUIkktcUty49ostpCSRr8FlkFp0U1haM+J1jP6qBIkFpzOTdLhfQvHBFkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Sat, 14 Dec
 2024 01:15:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 01:15:49 +0000
Date: Fri, 13 Dec 2024 17:16:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Z1zcb2P6uZFRxveV@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <87zfliewhj.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfliewhj.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4846de-b84a-44ea-ec64-08dd1bdcd7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3q7wTPKns8YQZtOS8PDYiOKtINPlWhhZ8Q1Tu8Np+YdqXETRmvNTLrioGj?=
 =?iso-8859-1?Q?SD2FqT9wa/r4dwsWgsTnKmQ+3uoq7e1UZfFdQFBF6jElZIJEdf5n0ewEDr?=
 =?iso-8859-1?Q?CC81f1328YKfzoHslZ3+DqKijuU5mcWtLMm2xnmC2FZ5VPAZydJhk4r82G?=
 =?iso-8859-1?Q?/hJ1ro87U/h4QC5ZjXLtMcdhl5Mm5FWj2MwoW7O34XKvPnUR2H2ghtLgfD?=
 =?iso-8859-1?Q?jXJnIxT1BtXWFTAiqyolFvaQk3Rm3siQeG8Dp2R+jnnJOjiDlNGZaotatv?=
 =?iso-8859-1?Q?wZhzY9VMMSBXwsN0YDYtyg2zyAZQXOhUOueZAFKYrVjteiOhkJX5vu/KQf?=
 =?iso-8859-1?Q?VZeETrZg9extqBkMKDBKylA4vL6F0xgGD83830kXnJeT//dx3lv5cOk5mu?=
 =?iso-8859-1?Q?dMeb0ZqmnGOf6kFqxAY4oZeo/d7HkNzpUX9CSngrrGaXpmPhTjXiedodOk?=
 =?iso-8859-1?Q?s1ct1+ozUr4vO3ASDfTbahuisewH/fGVs/blp5ZImDNjlbXrILYUKUFoPF?=
 =?iso-8859-1?Q?Z3qUGLp3OFgoWOTTNrk5K1gwJ7qJlpnQf6i2LlXw1M7/z8NY5dLpeA80UR?=
 =?iso-8859-1?Q?RhsskKg/eey43Q/m4QRQMm5+uGMHQdseasiybkp9bUK0TfNzh+t1BUlU0L?=
 =?iso-8859-1?Q?ovG8Be42CSOHWZDA+kINJrKmNtjWnAzhF/PCNleZP3V+B4nVP02DBY3qJp?=
 =?iso-8859-1?Q?RmLHOGgPuRDZn8A+IHXo6ww4+d+2PxndSiBi4afu0zP1owGiOqMEHCWDxO?=
 =?iso-8859-1?Q?thXs+21fiToeceg7fs8ZwhEiLDDZTdZjb3GRl97qN/9k5loB45SFzuznur?=
 =?iso-8859-1?Q?7ZWc0iScl7cMt3T0L+MVvUB+Xp6yr/tHyiOiv4yr2rQyyVgF1Xtb8e4dcf?=
 =?iso-8859-1?Q?8wJyGG9fJU004nYucssGiZ4Lg1SoMEWvq3IZzCDY/hJclzhDljF0CL8GS7?=
 =?iso-8859-1?Q?HY0R+745Ff/BxmOXxhKQzUcKnyzTSRf+dDXxuUCYJXapb4/8C7Wg7e6yJr?=
 =?iso-8859-1?Q?bSJlb32xappjbPOUBbmGauj90mUJBaCP8EE3fa4MA22YO+MFfAgkGlSDeI?=
 =?iso-8859-1?Q?95Xioi5JZOPZyIQ9fNFb/ilV1g1vqna97quKOV6F0mL1VnKXJK0BcV5tTj?=
 =?iso-8859-1?Q?Rzqs9W59LLZu7wA/fu7Imt38S4yxa+aSgHtOfWCuSfANjFY47P5k3+Q9xI?=
 =?iso-8859-1?Q?A3FT2ckSYWZNYt1u62PIAWuJn4o1f48T9YLQkTfXkdzmVox5Ha5VLIPP+t?=
 =?iso-8859-1?Q?LZvofO5cetd+S3gWt9TyMSuqX/PmthwpORUh6gunyNMD2UogA0W63R5LEr?=
 =?iso-8859-1?Q?PRfCc4X8uqQSsNYYFbmSDJPDNp5n2tFqvZh/f9SaAzR3K1j9SN50Z5Rvuj?=
 =?iso-8859-1?Q?XKCgfR6CyBvRJGTM7ddeRtt644sPcoKX7AUlK7CZI0ue48y3vpqLp9O7dt?=
 =?iso-8859-1?Q?bfe11ErDFNWDgdgJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Pw50DSbmT4Whg8ydg57Zf5qIZG9CXGaF1ylKMuYcyafNshNHSkMRBd5c8U?=
 =?iso-8859-1?Q?VbLvcJcclZcWE5CcEqZ2X7kdnFABSayUPQTzj7YiArudn0cp0G6zVNoeDL?=
 =?iso-8859-1?Q?GAoSMCoshQyxfq/W22dLGkbK5uokuB4XDKWDSH02Oa1tHQXGO9lIbvdUmS?=
 =?iso-8859-1?Q?E71mLijtraMImBzErSakkXEZHLkUj2jfpKN5P7lD9IK0UG0IeCmIhGo9qj?=
 =?iso-8859-1?Q?RAAKzbo68xMYW1tmXRL3gatvdiLDg5CMmp5+YFY0DD4VMT79jT+vC81gXM?=
 =?iso-8859-1?Q?qdtCdfXUok7+dOM2LnaYJFCZN7Y3wQWQevzxAMg6pd3ZYQy3Q03Dzgsg93?=
 =?iso-8859-1?Q?MPlXpadQlLsJ+W3Z7m+Vojvn6FIfqdHjT0RrGHJ5xwt8Pi7l4tg4InS7WG?=
 =?iso-8859-1?Q?NkNQJgTXRkCd1ORhTNMuZPvRaEnoiofekELAD17+rnU7rO46rYeGSSEcGC?=
 =?iso-8859-1?Q?359ITbhc6hawz+Qd4aFwse0OmijJJCSQ8la12Nq4IqiC0fHecVSNLkAHUa?=
 =?iso-8859-1?Q?LMM0SNv5SukmICqLhHTKU40gC3ZtQD9qFvKlxjFYY6eyywii9OUhTU+TpK?=
 =?iso-8859-1?Q?+o7YDMbn3I/888X0N4vaqOB9fv5xzPwcUJLBrFPQklmaWntG2cE/v/o5Ti?=
 =?iso-8859-1?Q?Lccw2imdkGy5dgDRJN9lGKNmgxQqy4/Rja/uxjRzxjwelO8Wd/irOQLm94?=
 =?iso-8859-1?Q?boD9nWc2NLZrSU/50Ja9S9dMfrXnSfbsuqFGY6eSj1GT+2bfqm/YSI/RSU?=
 =?iso-8859-1?Q?pWMZHeWIlUKI5EvrGNVvRUHRjAg4FmwazdxVBX7imvLu1NCt6RDPXBKoEG?=
 =?iso-8859-1?Q?5kclJeYOAP9sVqCok44jE2cf0fxWbt5MCyn4CJzDyC+vttrNlCd3Mn5W7Y?=
 =?iso-8859-1?Q?ol67oXvN79Hey1BRqT86sz5syqXL5iE0TR+K6GDopQx13ud/ue7GquLU6v?=
 =?iso-8859-1?Q?7ThiEB/AO2pPrx1XGIj/naOt8EmBZ4rnoCeZAqx4xgNeXL3aojO3qJUcjp?=
 =?iso-8859-1?Q?bNwdeuh+aaYpE5XqydPDLTQXBbyOLwmqv9x7kvayJm4Jj1qmti4HJYV4Bh?=
 =?iso-8859-1?Q?XzyX9AF+VAs4iGhsmceay0H/DSHCr8giS5Rh0hLWkifLoB+wyz8i1v3Y2R?=
 =?iso-8859-1?Q?MT8qyRA2PTvE97yHj7yI6c8BJyVbtjgAjE4yXX1OiPwUOXs6xc1iVRnHYh?=
 =?iso-8859-1?Q?XOtUo+9NgD6B4bCBuzX3d4/u9hBtZYTU8ejicXGqgd/BZoBjK9jkvRAErg?=
 =?iso-8859-1?Q?7TErLMUSvVbJNEpPgjT7P8JamFzpfIXSd4KaelgS+uHOEselc6olHHqtEn?=
 =?iso-8859-1?Q?nxUIPkuJZQoJtVSv9EdF5MmeBan+iA+QgsxVMtPgKBLqE6kqYssFhagohg?=
 =?iso-8859-1?Q?59WgiTLKMNpZQW1HTapbw7mE+uLEm87OzRQP7p9IyLa9hyG51c+jpWIPm4?=
 =?iso-8859-1?Q?q7jUjwdQMuXaU6Q1xecooRmBlwNmyJkUyKRUt+YjBu1wT5yJa8P/Sih7J8?=
 =?iso-8859-1?Q?RPaEzHDu/kZ92PY8X9MzfFmwb+2PBOj48brFQiJD4SfVhFZLBdZa2IoFfB?=
 =?iso-8859-1?Q?WOhmA0WI2xCeQeKVFDDHrcrpMqIlvocym0sBz+N5CPPtovGfrqZuJJxiJg?=
 =?iso-8859-1?Q?7fZfEsn2JVNv2gROJYHVvwQli2Tg2PbrrQ9X2UZNIryG3XRtPwQR74EQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4846de-b84a-44ea-ec64-08dd1bdcd7f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 01:15:48.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYkF8ZLNhvfrXSLeKyak4WdB008X5nMFTcQ8ab8Aeead0xeFIIQsauq88A8dFfxLI9iSL811RNe8ODafecbQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

On Fri, Nov 29, 2024 at 11:00:24AM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> [...]
> 
> > + * 3) Invalidation driver vfunc.
> > + *
> > + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> > + *				 struct drm_gpusvm_notifier *notifier,
> > + *				 const struct mmu_notifier_range *mmu_range)
> > + *	{
> > + *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> > + *		struct drm_gpusvm_range *range = NULL;
> > + *
> > + *		driver_invalidate_device_tlb(gpusvm, mmu_range->start, mmu_range->end);
> > + *
> > + *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
> > + *					  mmu_range->end) {
> > + *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
> > + *
> > + *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
> 
> I've only glanced at this series as an interested onlooker so I
> may have overlooked something obvious but why is it ok to skip notifiers
> other than MMU_NOTIFY_UNMAP? Wouldn't you also need to clears GPU PTEs
> in other cases?
> 

This just skips the addition to the garbage collector, which performs
the final removal of GPU page tables and also removes the range from the
GPU SVM tree. Both of those steps require locks that are in the reclaim
path, so you can't perform them directly here. The garbage collector is
a worker with a list of ranges pending removal.

In all cases, the GPU PTEs need to be cleared, and any DMA mappings need
to be removed. This is handled in the pseudo code in
driver_invalidate_device_tlb and drm_gpusvm_range_unmap_pages,
respectively.

Hope that clears things up,
Matt

>  - Alistair
> 
> > + *				continue;
> > + *
> > + *			drm_gpusvm_range_set_unmapped(range, mmu_range);
> > + *			driver_garbage_collector_add(gpusvm, range);
> > + *		}
> > + *	}
> > + */
> > +
> > +#define DRM_GPUSVM_RANGE_START(_range)	((_range)->va.start)
> > +#define DRM_GPUSVM_RANGE_END(_range)	((_range)->va.end - 1)
> > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node, u64, rb.__subtree_last,
> > +		     DRM_GPUSVM_RANGE_START, DRM_GPUSVM_RANGE_END,
> > +		     static __maybe_unused, range);
> > +
> > +#define DRM_GPUSVM_NOTIFIER_START(_notifier)	((_notifier)->interval.start)
> > +#define DRM_GPUSVM_NOTIFIER_END(_notifier)	((_notifier)->interval.end - 1)
> > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node, u64,
> > +		     rb.__subtree_last, DRM_GPUSVM_NOTIFIER_START,
> > +		     DRM_GPUSVM_NOTIFIER_END, static __maybe_unused, notifier);
> > +
> > +/**
> > + * npages_in_range() - Calculate the number of pages in a given range
> > + * @start__: The start address of the range
> > + * @end__: The end address of the range
> > + *
> > + * This macro calculates the number of pages in a given memory range,
> > + * specified by the start and end addresses. It divides the difference
> > + * between the end and start addresses by the page size (PAGE_SIZE) to
> > + * determine the number of pages in the range.
> > + *
> > + * Return: The number of pages in the specified range.
> > + */
> > +#define npages_in_range(start__, end__)	\
> > +	(((end__) - (start__)) >> PAGE_SHIFT)
> > +
> > +/**
> > + * struct drm_gpusvm_zdd - GPU SVM zone device data
> > + *
> > + * @refcount: Reference count for the zdd
> > + * @destroy_work: Work structure for asynchronous zdd destruction
> > + * @devmem_allocation: device memory allocation
> > + * @device_private_page_owner: Device private pages owner
> > + *
> > + * This structure serves as a generic wrapper installed in
> > + * page->zone_device_data. It provides infrastructure for looking up a device
> > + * memory allocation upon CPU page fault and asynchronously releasing device
> > + * memory once the CPU has no page references. Asynchronous release is useful
> > + * because CPU page references can be dropped in IRQ contexts, while releasing
> > + * device memory likely requires sleeping locks.
> > + */
> > +struct drm_gpusvm_zdd {
> > +	struct kref refcount;
> > +	struct work_struct destroy_work;
> > +	struct drm_gpusvm_devmem *devmem_allocation;
> > +	void *device_private_page_owner;
> > +};
> > +
> > +/**
> > + * drm_gpusvm_zdd_destroy_work_func - Work function for destroying a zdd
> > + * @w: Pointer to the work_struct
> > + *
> > + * This function releases device memory, puts GPU SVM range, and frees zdd.
> > + */
> > +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct *w)
> > +{
> > +	struct drm_gpusvm_zdd *zdd =
> > +		container_of(w, struct drm_gpusvm_zdd, destroy_work);
> > +	const struct drm_gpusvm_devmem_ops *ops = zdd->devmem_allocation ?
> > +		zdd->devmem_allocation->ops : NULL;
> > +
> > +	if (zdd->devmem_allocation && ops->devmem_release)
> > +		ops->devmem_release(zdd->devmem_allocation);
> > +	kfree(zdd);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> > + * @device_private_page_owner: Device private pages owner
> > + *
> > + * This function allocates and initializes a new zdd structure. It sets up the
> > + * reference count and initializes the destroy work.
> > + *
> > + * Returns:
> > + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> > + */
> > +static struct drm_gpusvm_zdd *
> > +drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> > +{
> > +	struct drm_gpusvm_zdd *zdd;
> > +
> > +	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> > +	if (!zdd)
> > +		return NULL;
> > +
> > +	kref_init(&zdd->refcount);
> > +	INIT_WORK(&zdd->destroy_work, drm_gpusvm_zdd_destroy_work_func);
> > +	zdd->devmem_allocation = NULL;
> > +	zdd->device_private_page_owner = device_private_page_owner;
> > +
> > +	return zdd;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> > + * @zdd: Pointer to the zdd structure.
> > + *
> > + * This function increments the reference count of the provided zdd structure.
> > + *
> > + * Returns: Pointer to the zdd structure.
> > + */
> > +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
> > +{
> > +	kref_get(&zdd->refcount);
> > +	return zdd;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> > + * @ref: Pointer to the reference count structure.
> > + *
> > + * This function queues the destroy_work of the zdd for asynchronous destruction.
> > + */
> > +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> > +{
> > +	struct drm_gpusvm_zdd *zdd =
> > +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> > +
> > +	if (zdd->devmem_allocation)
> > +		WRITE_ONCE(zdd->devmem_allocation->detached, true);
> > +	schedule_work(&zdd->destroy_work);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_zdd_put - Put a zdd reference.
> > + * @zdd: Pointer to the zdd structure.
> > + *
> > + * This function decrements the reference count of the provided zdd structure
> > + * and schedules its destruction if the count drops to zero.
> > + */
> > +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> > +{
> > +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_find - Find GPU SVM range from GPU SVM notifier
> > + * @notifier: Pointer to the GPU SVM notifier structure.
> > + * @start: Start address of the range
> > + * @end: End address of the range
> > + *
> > + * Return: A pointer to the drm_gpusvm_range if found or NULL
> > + */
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end)
> > +{
> > +	return range_iter_first(&notifier->root, start, end - 1);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU SVM ranges in a notifier
> > + * @range__: Iterator variable for the ranges
> > + * @next__: Iterator variable for the ranges temporay storage
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the range
> > + * @end__: End address of the range
> > + *
> > + * This macro is used to iterate over GPU SVM ranges in a notifier while
> > + * removing ranges from it.
> > + */
> > +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> > +	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> > +	     (next__) = __drm_gpusvm_range_next(range__);				\
> > +	     (range__) && (range__->va.start < (end__));				\
> > +	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> > +
> > +/**
> > + * __drm_gpusvm_notifier_next - get the next drm_gpusvm_notifier in the list
> > + * @notifier: a pointer to the current drm_gpusvm_notifier
> > + *
> > + * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> > + *         the current notifier is the last one or if the input notifier is
> > + *         NULL.
> > + */
> > +static struct drm_gpusvm_notifier *
> > +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> > +{
> > +	if (notifier && !list_is_last(&notifier->rb.entry,
> > +				      &notifier->gpusvm->notifier_list))
> > +		return list_next_entry(notifier, rb.entry);
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM notifiers in a gpusvm
> > + * @notifier__: Iterator variable for the notifiers
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the notifier
> > + * @end__: End address of the notifier
> > + *
> > + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> > + */
> > +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> > +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> > +	     (notifier__) && (notifier__->interval.start < (end__));			\
> > +	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> > +
> > +/**
> > + * drm_gpusvm_for_each_notifier_safe - Safely iterate over GPU SVM notifiers in a gpusvm
> > + * @notifier__: Iterator variable for the notifiers
> > + * @next__: Iterator variable for the notifiers temporay storage
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the notifier
> > + * @end__: End address of the notifier
> > + *
> > + * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> > + * removing notifiers from it.
> > + */
> > +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> > +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> > +	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> > +	     (notifier__) && (notifier__->interval.start < (end__));			\
> > +	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> > +
> > +/**
> > + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM notifier.
> > + * @mni: Pointer to the mmu_interval_notifier structure.
> > + * @mmu_range: Pointer to the mmu_notifier_range structure.
> > + * @cur_seq: Current sequence number.
> > + *
> > + * This function serves as a generic MMU notifier for GPU SVM. It sets the MMU
> > + * notifier sequence number and calls the driver invalidate vfunc under
> > + * gpusvm->notifier_lock.
> > + *
> > + * Returns:
> > + * true if the operation succeeds, false otherwise.
> > + */
> > +static bool
> > +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
> > +			       const struct mmu_notifier_range *mmu_range,
> > +			       unsigned long cur_seq)
> > +{
> > +	struct drm_gpusvm_notifier *notifier =
> > +		container_of(mni, typeof(*notifier), notifier);
> > +	struct drm_gpusvm *gpusvm = notifier->gpusvm;
> > +
> > +	if (!mmu_notifier_range_blockable(mmu_range))
> > +		return false;
> > +
> > +	down_write(&gpusvm->notifier_lock);
> > +	mmu_interval_set_seq(mni, cur_seq);
> > +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> > +	up_write(&gpusvm->notifier_lock);
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
> > + */
> > +static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> > +	.invalidate = drm_gpusvm_notifier_invalidate,
> > +};
> > +
> > +/**
> > + * drm_gpusvm_init - Initialize the GPU SVM.
> > + * @gpusvm: Pointer to the GPU SVM structure.
> > + * @name: Name of the GPU SVM.
> > + * @drm: Pointer to the DRM device structure.
> > + * @mm: Pointer to the mm_struct for the address space.
> > + * @device_private_page_owner: Device private pages owner.
> > + * @mm_start: Start address of GPU SVM.
> > + * @mm_range: Range of the GPU SVM.
> > + * @notifier_size: Size of individual notifiers.
> > + * @ops: Pointer to the operations structure for GPU SVM.
> > + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> > + *               Entries should be powers of 2 in descending order with last
> > + *               entry being SZ_4K.
> > + * @num_chunks: Number of chunks.
> > + *
> > + * This function initializes the GPU SVM.
> > + *
> > + * Returns:
> > + * 0 on success, a negative error code on failure.
> > + */
> > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > +		    const char *name, struct drm_device *drm,
> > +		    struct mm_struct *mm, void *device_private_page_owner,
> > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > +		    const struct drm_gpusvm_ops *ops,
> > +		    const u64 *chunk_sizes, int num_chunks)
> > +{
> > +	if (!ops->invalidate || !num_chunks)
> > +		return -EINVAL;
> > +
> > +	gpusvm->name = name;
> > +	gpusvm->drm = drm;
> > +	gpusvm->mm = mm;
> > +	gpusvm->device_private_page_owner = device_private_page_owner;
> > +	gpusvm->mm_start = mm_start;
> > +	gpusvm->mm_range = mm_range;
> > +	gpusvm->notifier_size = notifier_size;
> > +	gpusvm->ops = ops;
> > +	gpusvm->chunk_sizes = chunk_sizes;
> > +	gpusvm->num_chunks = num_chunks;
> > +
> > +	mmgrab(mm);
> > +	gpusvm->root = RB_ROOT_CACHED;
> > +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> > +
> > +	init_rwsem(&gpusvm->notifier_lock);
> > +
> > +	fs_reclaim_acquire(GFP_KERNEL);
> > +	might_lock(&gpusvm->notifier_lock);
> > +	fs_reclaim_release(GFP_KERNEL);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure
> > + * @fault_addr__: Fault address
> > + *
> > + * This macro finds the GPU SVM notifier associated with the fault address.
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> > + */
> > +#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
> > +	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
> > +			    (fault_addr__ + 1))
> > +
> > +/**
> > + * to_drm_gpusvm_notifier - retrieve the container struct for a given rbtree node
> > + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
> > + *
> > + * Return: A pointer to the containing drm_gpusvm_notifier structure.
> > + */
> > +#define to_drm_gpusvm_notifier(__node)				\
> > +	container_of((__node), struct drm_gpusvm_notifier, rb.node)
> > +
> > +/**
> > + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + *
> > + * This function inserts the GPU SVM notifier into the GPU SVM RB tree and list.
> > + */
> > +static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
> > +				       struct drm_gpusvm_notifier *notifier)
> > +{
> > +	struct rb_node *node;
> > +	struct list_head *head;
> > +
> > +	notifier_insert(notifier, &gpusvm->root);
> > +
> > +	node = rb_prev(&notifier->rb.node);
> > +	if (node)
> > +		head = &(to_drm_gpusvm_notifier(node))->rb.entry;
> > +	else
> > +		head = &gpusvm->notifier_list;
> > +
> > +	list_add(&notifier->rb.entry, head);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM tructure
> > + * @notifier__: Pointer to the GPU SVM notifier structure
> > + *
> > + * This macro removes the GPU SVM notifier from the GPU SVM RB tree and list.
> > + */
> > +#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
> > +	notifier_remove((notifier__), &(gpusvm__)->root);	\
> > +	list_del(&(notifier__)->rb.entry)
> > +
> > +/**
> > + * drm_gpusvm_fini - Finalize the GPU SVM.
> > + * @gpusvm: Pointer to the GPU SVM structure.
> > + *
> > + * This function finalizes the GPU SVM by cleaning up any remaining ranges and
> > + * notifiers, and dropping a reference to struct MM.
> > + */
> > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> > +{
> > +	struct drm_gpusvm_notifier *notifier, *next;
> > +
> > +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0, LONG_MAX) {
> > +		struct drm_gpusvm_range *range, *__next;
> > +
> > +		/*
> > +		 * Remove notifier first to avoid racing with any invalidation
> > +		 */
> > +		mmu_interval_notifier_remove(&notifier->notifier);
> > +		notifier->flags.removed = true;
> > +
> > +		drm_gpusvm_for_each_range_safe(range, __next, notifier, 0,
> > +					       LONG_MAX)
> > +			drm_gpusvm_range_remove(gpusvm, range);
> > +	}
> > +
> > +	mmdrop(gpusvm->mm);
> > +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> > +}
> > +
> > +/**
> > + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @fault_addr: Fault address
> > + *
> > + * This function allocates and initializes the GPU SVM notifier structure.
> > + *
> > + * Returns:
> > + * Pointer to the allocated GPU SVM notifier on success, ERR_PTR() on failure.
> > + */
> > +static struct drm_gpusvm_notifier *
> > +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64 fault_addr)
> > +{
> > +	struct drm_gpusvm_notifier *notifier;
> > +
> > +	if (gpusvm->ops->notifier_alloc)
> > +		notifier = gpusvm->ops->notifier_alloc();
> > +	else
> > +		notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
> > +
> > +	if (!notifier)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	notifier->gpusvm = gpusvm;
> > +	notifier->interval.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
> > +	notifier->interval.end = ALIGN(fault_addr + 1, gpusvm->notifier_size);
> > +	INIT_LIST_HEAD(&notifier->rb.entry);
> > +	notifier->root = RB_ROOT_CACHED;
> > +	INIT_LIST_HEAD(&notifier->range_list);
> > +
> > +	return notifier;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + *
> > + * This function frees the GPU SVM notifier structure.
> > + */
> > +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> > +				     struct drm_gpusvm_notifier *notifier)
> > +{
> > +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> > +
> > +	if (gpusvm->ops->notifier_free)
> > +		gpusvm->ops->notifier_free(notifier);
> > +	else
> > +		kfree(notifier);
> > +}
> > +
> > +/**
> > + * to_drm_gpusvm_range - retrieve the container struct for a given rbtree node
> > + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_range struct
> > + *
> > + * Return: A pointer to the containing drm_gpusvm_range structure.
> > + */
> > +#define to_drm_gpusvm_range(node__)	\
> > +	container_of((node__), struct drm_gpusvm_range, rb.node)
> > +
> > +/**
> > + * drm_gpusvm_range_insert - Insert GPU SVM range
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *
> > + * This function inserts the GPU SVM range into the notifier RB tree and list.
> > + */
> > +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier *notifier,
> > +				    struct drm_gpusvm_range *range)
> > +{
> > +	struct rb_node *node;
> > +	struct list_head *head;
> > +
> > +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> > +	range_insert(range, &notifier->root);
> > +
> > +	node = rb_prev(&range->rb.node);
> > +	if (node)
> > +		head = &(to_drm_gpusvm_range(node))->rb.entry;
> > +	else
> > +		head = &notifier->range_list;
> > +
> > +	list_add(&range->rb.entry, head);
> > +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> > +}
> > +
> > +/**
> > + * __drm_gpusvm_range_remove - Remove GPU SVM range
> > + * @notifier__: Pointer to the GPU SVM notifier structure
> > + * @range__: Pointer to the GPU SVM range structure
> > + *
> > + * This macro removes the GPU SVM range from the notifier RB tree and list.
> > + */
> > +#define __drm_gpusvm_range_remove(notifier__, range__)		\
> > +	range_remove((range__), &(notifier__)->root);		\
> > +	list_del(&(range__)->rb.entry)
> > +
> > +/**
> > + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + * @fault_addr: Fault address
> > + * @chunk_size: Chunk size
> > + * @migrate_devmem: Flag indicating whether to migrate device memory
> > + *
> > + * This function allocates and initializes the GPU SVM range structure.
> > + *
> > + * Returns:
> > + * Pointer to the allocated GPU SVM range on success, ERR_PTR() on failure.
> > + */
> > +static struct drm_gpusvm_range *
> > +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> > +		       struct drm_gpusvm_notifier *notifier,
> > +		       u64 fault_addr, u64 chunk_size, bool migrate_devmem)
> > +{
> > +	struct drm_gpusvm_range *range;
> > +
> > +	if (gpusvm->ops->range_alloc)
> > +		range = gpusvm->ops->range_alloc(gpusvm);
> > +	else
> > +		range = kzalloc(sizeof(*range), GFP_KERNEL);
> > +
> > +	if (!range)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	kref_init(&range->refcount);
> > +	range->gpusvm = gpusvm;
> > +	range->notifier = notifier;
> > +	range->va.start = ALIGN_DOWN(fault_addr, chunk_size);
> > +	range->va.end = ALIGN(fault_addr + 1, chunk_size);
> > +	INIT_LIST_HEAD(&range->rb.entry);
> > +	range->notifier_seq = LONG_MAX;
> > +	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
> > +
> > +	return range;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_check_pages - Check pages
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + * @start: Start address
> > + * @end: End address
> > + *
> > + * Check if pages between start and end have been faulted in on the CPU. Use to
> > + * prevent migration of pages without CPU backing store.
> > + *
> > + * Returns:
> > + * True if pages have been faulted into CPU, False otherwise
> > + */
> > +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> > +				   struct drm_gpusvm_notifier *notifier,
> > +				   u64 start, u64 end)
> > +{
> > +	struct hmm_range hmm_range = {
> > +		.default_flags = 0,
> > +		.notifier = &notifier->notifier,
> > +		.start = start,
> > +		.end = end,
> > +		.dev_private_owner = gpusvm->device_private_page_owner,
> > +	};
> > +	unsigned long timeout =
> > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long *pfns;
> > +	unsigned long npages = npages_in_range(start, end);
> > +	int err, i;
> > +
> > +	mmap_assert_locked(gpusvm->mm);
> > +
> > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (!pfns)
> > +		return false;
> > +
> > +	hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> > +	hmm_range.hmm_pfns = pfns;
> > +
> > +	while (true) {
> > +		err = hmm_range_fault(&hmm_range);
> > +		if (err == -EBUSY) {
> > +			if (time_after(jiffies, timeout))
> > +				break;
> > +
> > +			hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> > +			continue;
> > +		}
> > +		break;
> > +	}
> > +	if (err)
> > +		goto err_free;
> > +
> > +	for (i = 0; i < npages;) {
> > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > +			err = -EFAULT;
> > +			goto err_free;
> > +		}
> > +		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
> > +	}
> > +
> > +err_free:
> > +	kvfree(pfns);
> > +	return err ? false : true;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_chunk_size - Determine chunk size for GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier structure
> > + * @vas: Pointer to the virtual memory area structure
> > + * @fault_addr: Fault address
> > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > + * @check_pages: Flag indicating whether to check pages
> > + *
> > + * This function determines the chunk size for the GPU SVM range based on the
> > + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
> > + * memory area boundaries.
> > + *
> > + * Returns:
> > + * Chunk size on success, LONG_MAX on failure.
> > + */
> > +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> > +				       struct drm_gpusvm_notifier *notifier,
> > +				       struct vm_area_struct *vas,
> > +				       u64 fault_addr, u64 gpuva_start,
> > +				       u64 gpuva_end, bool check_pages)
> > +{
> > +	u64 start, end;
> > +	int i = 0;
> > +
> > +retry:
> > +	for (; i < gpusvm->num_chunks; ++i) {
> > +		start = ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
> > +		end = ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> > +
> > +		if (start >= vas->vm_start && end <= vas->vm_end &&
> > +		    start >= notifier->interval.start &&
> > +		    end <= notifier->interval.end &&
> > +		    start >= gpuva_start && end <= gpuva_end)
> > +			break;
> > +	}
> > +
> > +	if (i == gpusvm->num_chunks)
> > +		return LONG_MAX;
> > +
> > +	/*
> > +	 * If allocation more than page, ensure not to overlap with existing
> > +	 * ranges.
> > +	 */
> > +	if (end - start != SZ_4K) {
> > +		struct drm_gpusvm_range *range;
> > +
> > +		range = drm_gpusvm_range_find(notifier, start, end);
> > +		if (range) {
> > +			++i;
> > +			goto retry;
> > +		}
> > +
> > +		/*
> > +		 * XXX: Only create range on pages CPU has faulted in. Without
> > +		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
> > +		 * process-many-malloc' fails. In the failure case, each process
> > +		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
> > +		 * ranges. When migrating the SVM ranges, some processes fail in
> > +		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
> > +		 * and then upon drm_gpusvm_range_get_pages device pages from
> > +		 * other processes are collected + faulted in which creates all
> > +		 * sorts of problems. Unsure exactly how this happening, also
> > +		 * problem goes away if 'xe_exec_system_allocator --r
> > +		 * process-many-malloc' mallocs at least 64k at a time.
> > +		 */
> > +		if (check_pages &&
> > +		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
> > +			++i;
> > +			goto retry;
> > +		}
> > +	}
> > +
> > +	return end - start;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @fault_addr: Fault address
> > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > + * @ctx: GPU SVM context
> > + *
> > + * This function finds or inserts a newly allocated a GPU SVM range based on the
> > + * fault address. Caller must hold a lock to protect range lookup and insertion.
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM range on success, ERR_PTR() on failure.
> > + */
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> > +				u64 gpuva_start, u64 gpuva_end,
> > +				const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct drm_gpusvm_notifier *notifier;
> > +	struct drm_gpusvm_range *range;
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct vm_area_struct *vas;
> > +	bool notifier_alloc = false;
> > +	u64 chunk_size;
> > +	int err;
> > +	bool migrate_devmem;
> > +
> > +	if (fault_addr < gpusvm->mm_start ||
> > +	    fault_addr > gpusvm->mm_start + gpusvm->mm_range) {
> > +		err = -EINVAL;
> > +		goto err_out;
> > +	}
> > +
> > +	if (!mmget_not_zero(mm)) {
> > +		err = -EFAULT;
> > +		goto err_out;
> > +	}
> > +
> > +	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
> > +	if (!notifier) {
> > +		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
> > +		if (IS_ERR(notifier)) {
> > +			err = PTR_ERR(notifier);
> > +			goto err_mmunlock;
> > +		}
> > +		notifier_alloc = true;
> > +		err = mmu_interval_notifier_insert(&notifier->notifier,
> > +						   mm, notifier->interval.start,
> > +						   notifier->interval.end -
> > +						   notifier->interval.start,
> > +						   &drm_gpusvm_notifier_ops);
> > +		if (err)
> > +			goto err_notifier;
> > +	}
> > +
> > +	mmap_read_lock(mm);
> > +
> > +	vas = vma_lookup(mm, fault_addr);
> > +	if (!vas) {
> > +		err = -ENOENT;
> > +		goto err_notifier_remove;
> > +	}
> > +
> > +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> > +		err = -EPERM;
> > +		goto err_notifier_remove;
> > +	}
> > +
> > +	range = drm_gpusvm_range_find(notifier, fault_addr, fault_addr + 1);
> > +	if (range)
> > +		goto out_mmunlock;
> > +	/*
> > +	 * XXX: Short-circuiting migration based on migrate_vma_* current
> > +	 * limitations. If/when migrate_vma_* add more support, this logic will
> > +	 * have to change.
> > +	 */
> > +	migrate_devmem = ctx->devmem_possible &&
> > +		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
> > +
> > +	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
> > +						 fault_addr, gpuva_start,
> > +						 gpuva_end, migrate_devmem &&
> > +						 ctx->check_pages);
> > +	if (chunk_size == LONG_MAX) {
> > +		err = -EINVAL;
> > +		goto err_notifier_remove;
> > +	}
> > +
> > +	range = drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr, chunk_size,
> > +				       migrate_devmem);
> > +	if (IS_ERR(range)) {
> > +		err = PTR_ERR(range);
> > +		goto err_notifier_remove;
> > +	}
> > +
> > +	drm_gpusvm_range_insert(notifier, range);
> > +	if (notifier_alloc)
> > +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> > +
> > +out_mmunlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +
> > +	return range;
> > +
> > +err_notifier_remove:
> > +	mmap_read_unlock(mm);
> > +	if (notifier_alloc)
> > +		mmu_interval_notifier_remove(&notifier->notifier);
> > +err_notifier:
> > +	if (notifier_alloc)
> > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > +err_mmunlock:
> > +	mmput(mm);
> > +err_out:
> > +	return ERR_PTR(err);
> > +}
> > +
> > +/**
> > + * __drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range (internal)
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @npages: Number of pages to unmap
> > + *
> > + * This function unmap pages associated with a GPU SVM range. Assumes and
> > + * asserts correct locking is in place when called.
> > + */
> > +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +					   struct drm_gpusvm_range *range,
> > +					   unsigned long npages)
> > +{
> > +	unsigned long i, j;
> > +	struct drm_pagemap *dpagemap = range->dpagemap;
> > +	struct device *dev = gpusvm->drm->dev;
> > +
> > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > +
> > +	if (range->flags.has_dma_mapping) {
> > +		for (i = 0, j = 0; i < npages; j++) {
> > +			struct drm_pagemap_dma_addr *addr = &range->dma_addr[j];
> > +
> > +			if (addr->proto == DRM_INTERCONNECT_SYSTEM) {
> > +				dma_unmap_page(dev,
> > +					       addr->addr,
> > +					       PAGE_SIZE << addr->order,
> > +					       addr->dir);
> > +			} else if (dpagemap && dpagemap->ops->unmap_dma) {
> > +				dpagemap->ops->unmap_dma(dpagemap,
> > +							 dev,
> > +							 *addr);
> > +			}
> > +			i += 1 << addr->order;
> > +		}
> > +		range->flags.has_devmem_pages = false;
> > +		range->flags.has_dma_mapping = false;
> > +		range->dpagemap = NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_free_pages - Free pages associated with a GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *
> > + * This function free pages associated with a GPU SVM range.
> > + */
> > +static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> > +					struct drm_gpusvm_range *range)
> > +{
> > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > +
> > +	if (range->dma_addr) {
> > +		kvfree(range->dma_addr);
> > +		range->dma_addr = NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_remove - Remove GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range to be removed
> > + *
> > + * This function removes the specified GPU SVM range and also removes the parent
> > + * GPU SVM notifier if no more ranges remain in the notifier. The caller must
> > + * hold a lock to protect range and notifier removal.
> > + */
> > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > +			     struct drm_gpusvm_range *range)
> > +{
> > +	unsigned long npages = npages_in_range(range->va.start, range->va.end);
> > +	struct drm_gpusvm_notifier *notifier;
> > +
> > +	notifier = drm_gpusvm_notifier_find(gpusvm, range->va.start);
> > +	if (WARN_ON_ONCE(!notifier))
> > +		return;
> > +
> > +	drm_gpusvm_notifier_lock(gpusvm);
> > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > +	drm_gpusvm_range_free_pages(gpusvm, range);
> > +	__drm_gpusvm_range_remove(notifier, range);
> > +	drm_gpusvm_notifier_unlock(gpusvm);
> > +
> > +	drm_gpusvm_range_put(range);
> > +
> > +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> > +		if (!notifier->flags.removed)
> > +			mmu_interval_notifier_remove(&notifier->notifier);
> > +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> > + * @range: Pointer to the GPU SVM range
> > + *
> > + * This function increments the reference count of the specified GPU SVM range.
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM range.
> > + */
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> > +{
> > +	kref_get(&range->refcount);
> > +
> > +	return range;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> > + * @refcount: Pointer to the reference counter embedded in the GPU SVM range
> > + *
> > + * This function destroys the specified GPU SVM range when its reference count
> > + * reaches zero. If a custom range-free function is provided, it is invoked to
> > + * free the range; otherwise, the range is deallocated using kfree().
> > + */
> > +static void drm_gpusvm_range_destroy(struct kref *refcount)
> > +{
> > +	struct drm_gpusvm_range *range =
> > +		container_of(refcount, struct drm_gpusvm_range, refcount);
> > +	struct drm_gpusvm *gpusvm = range->gpusvm;
> > +
> > +	if (gpusvm->ops->range_free)
> > +		gpusvm->ops->range_free(range);
> > +	else
> > +		kfree(range);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> > + * @range: Pointer to the GPU SVM range
> > + *
> > + * This function decrements the reference count of the specified GPU SVM range
> > + * and frees it when the count reaches zero.
> > + */
> > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> > +{
> > +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_pages_valid - GPU SVM range pages valid
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *
> > + * This function determines if a GPU SVM range pages are valid. Expected be
> > + * called holding gpusvm->notifier_lock and as the last step before commiting a
> > + * GPU binding.
> > + *
> > + * Returns:
> > + * True if GPU SVM range has valid pages, False otherwise
> > + */
> > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range)
> > +{
> > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > +
> > +	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range pages valid unlocked
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *
> > + * This function determines if a GPU SVM range pages are valid. Expected be
> > + * called without holding gpusvm->notifier_lock.
> > + *
> > + * Returns:
> > + * True if GPU SVM range has valid pages, False otherwise
> > + */
> > +static bool
> > +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> > +				      struct drm_gpusvm_range *range)
> > +{
> > +	bool pages_valid;
> > +
> > +	if (!range->dma_addr)
> > +		return false;
> > +
> > +	drm_gpusvm_notifier_lock(gpusvm);
> > +	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
> > +	if (!pages_valid)
> > +		drm_gpusvm_range_free_pages(gpusvm, range);
> > +	drm_gpusvm_notifier_unlock(gpusvm);
> > +
> > +	return pages_valid;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @ctx: GPU SVM context
> > + *
> > + * This function gets pages for a GPU SVM range and ensures they are mapped for
> > + * DMA access.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
> > +	struct hmm_range hmm_range = {
> > +		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> > +			HMM_PFN_REQ_WRITE),
> > +		.notifier = notifier,
> > +		.start = range->va.start,
> > +		.end = range->va.end,
> > +		.dev_private_owner = gpusvm->device_private_page_owner,
> > +	};
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct drm_gpusvm_zdd *zdd;
> > +	unsigned long timeout =
> > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long i, j;
> > +	unsigned long npages = npages_in_range(range->va.start, range->va.end);
> > +	unsigned long num_dma_mapped;
> > +	unsigned int order = 0;
> > +	unsigned long *pfns;
> > +	struct page **pages;
> > +	int err = 0;
> > +	struct dev_pagemap *pagemap;
> > +	struct drm_pagemap *dpagemap;
> > +
> > +retry:
> > +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> > +		goto set_seqno;
> > +
> > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (!pfns)
> > +		return -ENOMEM;
> > +
> > +	if (!mmget_not_zero(mm)) {
> > +		err = -EFAULT;
> > +		goto err_out;
> > +	}
> > +
> > +	hmm_range.hmm_pfns = pfns;
> > +	while (true) {
> > +		mmap_read_lock(mm);
> > +		err = hmm_range_fault(&hmm_range);
> > +		mmap_read_unlock(mm);
> > +
> > +		if (err == -EBUSY) {
> > +			if (time_after(jiffies, timeout))
> > +				break;
> > +
> > +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > +			continue;
> > +		}
> > +		break;
> > +	}
> > +	mmput(mm);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	pages = (struct page **)pfns;
> > +map_pages:
> > +	/*
> > +	 * Perform all dma mappings under the notifier lock to not
> > +	 * access freed pages. A notifier will either block on
> > +	 * the notifier lock or unmap dma.
> > +	 */
> > +	drm_gpusvm_notifier_lock(gpusvm);
> > +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +		goto retry;
> > +	}
> > +
> > +	if (!range->dma_addr) {
> > +		/* Unlock and restart mapping to allocate memory. */
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +		range->dma_addr = kvmalloc_array(npages, sizeof(*range->dma_addr),
> > +						 GFP_KERNEL);
> > +		if (!range->dma_addr) {
> > +			err = -ENOMEM;
> > +			goto err_free;
> > +		}
> > +		goto map_pages;
> > +	}
> > +
> > +	zdd = NULL;
> > +	num_dma_mapped = 0;
> > +	for (i = 0, j = 0; i < npages; ++j) {
> > +		struct page *page = hmm_pfn_to_page(pfns[i]);
> > +
> > +		order = hmm_pfn_to_map_order(pfns[i]);
> > +		if (is_device_private_page(page) || is_device_coherent_page(page)) {
> > +			if (zdd != page->zone_device_data && i > 0) {
> > +				err = -EOPNOTSUPP;
> > +				goto err_unmap;
> > +			}
> > +			zdd = page->zone_device_data;
> > +			if (pagemap != page->pgmap) {
> > +				if (i > 0) {
> > +					err = -EOPNOTSUPP;
> > +					goto err_unmap;
> > +				}
> > +
> > +				pagemap = page->pgmap;
> > +				dpagemap = zdd->devmem_allocation->dpagemap;
> > +				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
> > +					/*
> > +					 * Raced. This is not supposed to happen
> > +					 * since hmm_range_fault() should've migrated
> > +					 * this page to system.
> > +					 */
> > +					err = -EAGAIN;
> > +					goto err_unmap;
> > +				}
> > +			}
> > +			range->dma_addr[j] =
> > +				dpagemap->ops->map_dma(dpagemap, gpusvm->drm->dev,
> > +						       page, order,
> > +						       DMA_BIDIRECTIONAL);
> > +			if (dma_mapping_error(gpusvm->drm->dev, range->dma_addr[j].addr)) {
> > +				err = -EFAULT;
> > +				goto err_unmap;
> > +			}
> > +
> > +			pages[i] = page;
> > +		} else {
> > +			dma_addr_t addr;
> > +
> > +			if (is_zone_device_page(page) || zdd) {
> > +				err = -EOPNOTSUPP;
> > +				goto err_unmap;
> > +			}
> > +
> > +			addr = dma_map_page(gpusvm->drm->dev,
> > +					    page, 0,
> > +					    PAGE_SIZE << order,
> > +					    DMA_BIDIRECTIONAL);
> > +			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
> > +				err = -EFAULT;
> > +				goto err_unmap;
> > +			}
> > +
> > +			range->dma_addr[j] = drm_pagemap_dma_addr_encode
> > +				(addr, DRM_INTERCONNECT_SYSTEM, order,
> > +				 DMA_BIDIRECTIONAL);
> > +		}
> > +		i += 1 << order;
> > +		num_dma_mapped = i;
> > +	}
> > +
> > +	range->flags.has_dma_mapping = true;
> > +	if (zdd) {
> > +		range->flags.has_devmem_pages = true;
> > +		range->dpagemap = dpagemap;
> > +	}
> > +
> > +	drm_gpusvm_notifier_unlock(gpusvm);
> > +	kvfree(pfns);
> > +set_seqno:
> > +	range->notifier_seq = hmm_range.notifier_seq;
> > +
> > +	return 0;
> > +
> > +err_unmap:
> > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
> > +	drm_gpusvm_notifier_unlock(gpusvm);
> > +err_free:
> > +	kvfree(pfns);
> > +err_out:
> > +	if (err == -EAGAIN)
> > +		goto retry;
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @ctx: GPU SVM context
> > + *
> > + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> > + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> > + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> > + * security model.
> > + */
> > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range,
> > +				  const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	unsigned long npages = npages_in_range(range->va.start, range->va.end);
> > +
> > +	if (ctx->in_notifier)
> > +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > +	else
> > +		drm_gpusvm_notifier_lock(gpusvm);
> > +
> > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > +
> > +	if (!ctx->in_notifier)
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migration_put_page - Put a migration page
> > + * @page: Pointer to the page to put
> > + *
> > + * This function unlocks and puts a page.
> > + */
> > +static void drm_gpusvm_migration_put_page(struct page *page)
> > +{
> > +	unlock_page(page);
> > +	put_page(page);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migration_put_pages - Put migration pages
> > + * @npages: Number of pages
> > + * @migrate_pfn: Array of migrate page frame numbers
> > + *
> > + * This function puts an array of pages.
> > + */
> > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > +					   unsigned long *migrate_pfn)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!migrate_pfn[i])
> > +			continue;
> > +
> > +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> > +		migrate_pfn[i] = 0;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_get_devmem_page - Get a reference to a device memory page
> > + * @page: Pointer to the page
> > + * @zdd: Pointer to the GPU SVM zone device data
> > + *
> > + * This function associates the given page with the specified GPU SVM zone
> > + * device data and initializes it for zone device usage.
> > + */
> > +static void drm_gpusvm_get_devmem_page(struct page *page,
> > +				     struct drm_gpusvm_zdd *zdd)
> > +{
> > +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> > +	zone_device_page_init(page);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> > + * @dev: The device for which the pages are being mapped
> > + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> > + * @migrate_pfn: Array of migrate page frame numbers to map
> > + * @npages: Number of pages to map
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function maps pages of memory for migration usage in GPU SVM. It
> > + * iterates over each page frame number provided in @migrate_pfn, maps the
> > + * corresponding page, and stores the DMA address in the provided @dma_addr
> > + * array.
> > + *
> > + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> > + */
> > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > +					dma_addr_t *dma_addr,
> > +					long unsigned int *migrate_pfn,
> > +					unsigned long npages,
> > +					enum dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > +
> > +		if (!page)
> > +			continue;
> > +
> > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > +			return -EFAULT;
> > +
> > +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> > +		if (dma_mapping_error(dev, dma_addr[i]))
> > +			return -EFAULT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> > + * @dev: The device for which the pages were mapped
> > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > + * @npages: Number of pages to unmap
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> > + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> > + * if it's valid and not already unmapped, and unmaps the corresponding page.
> > + */
> > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > +					   dma_addr_t *dma_addr,
> > +					   unsigned long npages,
> > +					   enum dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> > +			continue;
> > +
> > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_devmem - Migrate GPU SVM range to device memory
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @devmem_allocation: Pointer to the device memory allocation. The caller
> > + *                     should hold a reference to the device memory allocation,
> > + *                     which should be dropped via ops->devmem_release or upon
> > + *                     the failure of this function.
> > + * @ctx: GPU SVM context
> > + *
> > + * This function migrates the specified GPU SVM range to device memory. It performs the
> > + * necessary setup and invokes the driver-specific operations for migration to
> > + * device memory. Upon successful return, @devmem_allocation can safely reference @range
> > + * until ops->devmem_release is called which only upon successful return.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > +				 struct drm_gpusvm_range *range,
> > +				 struct drm_gpusvm_devmem *devmem_allocation,
> > +				 const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> > +	u64 start = range->va.start, end = range->va.end;
> > +	struct migrate_vma migrate = {
> > +		.start		= start,
> > +		.end		= end,
> > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > +	};
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	unsigned long i, npages = npages_in_range(start, end);
> > +	struct vm_area_struct *vas;
> > +	struct drm_gpusvm_zdd *zdd = NULL;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int err;
> > +
> > +	if (!range->flags.migrate_devmem)
> > +		return -EINVAL;
> > +
> > +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem || !ops->copy_to_ram)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (!mmget_not_zero(mm)) {
> > +		err = -EFAULT;
> > +		goto err_out;
> > +	}
> > +	mmap_read_lock(mm);
> > +
> > +	vas = vma_lookup(mm, start);
> > +	if (!vas) {
> > +		err = -ENOENT;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (end > vas->vm_end || start < vas->vm_start) {
> > +		err = -EINVAL;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (!vma_is_anonymous(vas)) {
> > +		err = -EBUSY;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_mmunlock;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > +
> > +	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
> > +	if (!zdd) {
> > +		err = -ENOMEM;
> > +		goto err_free;
> > +	}
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/*
> > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > +	 * always an error. Need to revisit possible cases and how to handle. We
> > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > +	 */
> > +
> > +	if (!migrate.cpages) {
> > +		err = -EFAULT;
> > +		goto err_free;
> > +	}
> > +
> > +	if (migrate.cpages != npages) {
> > +		err = -EBUSY;
> > +		goto err_finalize;
> > +	}
> > +
> > +	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> > +					   migrate.src, npages, DMA_TO_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *page = pfn_to_page(migrate.dst[i]);
> > +
> > +		pages[i] = page;
> > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > +		drm_gpusvm_get_devmem_page(page, zdd);
> > +	}
> > +
> > +	err = ops->copy_to_devmem(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	/* Upon success bind devmem allocation to range and zdd */
> > +	WRITE_ONCE(zdd->devmem_allocation, devmem_allocation);	/* Owns ref */
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> > +				       DMA_TO_DEVICE);
> > +err_free:
> > +	if (zdd)
> > +		drm_gpusvm_zdd_put(zdd);
> > +	kvfree(buf);
> > +err_mmunlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +err_out:
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_populate_ram_pfn - Populate RAM PFNs for a VM area
> > + * @vas: Pointer to the VM area structure, can be NULL
> > + * @npages: Number of pages to populate
> > + * @mpages: Number of pages to migrate
> > + * @src_mpfn: Source array of migrate PFNs
> > + * @mpfn: Array of migrate PFNs to populate
> > + * @addr: Start address for PFN allocation
> > + *
> > + * This function populates the RAM migrate page frame numbers (PFNs) for the
> > + * specified VM area structure. It allocates and locks pages in the VM area for
> > + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> > + * alloc_page for allocation.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > +					       unsigned long npages,
> > +					       unsigned long *mpages,
> > +					       unsigned long *src_mpfn,
> > +					       unsigned long *mpfn, u64 addr)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > +		struct page *page;
> > +
> > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > +			continue;
> > +
> > +		if (vas)
> > +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > +		else
> > +			page = alloc_page(GFP_HIGHUSER);
> > +
> > +		if (!page)
> > +			return -ENOMEM;
> > +
> > +		lock_page(page);
> > +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > +		++*mpages;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_evict_to_ram - Evict GPU SVM range to RAM
> > + * @devmem_allocation: Pointer to the device memory allocation
> > + *
> > + * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
> > + * migration done via migrate_device_* functions.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
> > +{
> > +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> > +	unsigned long npages, mpages = 0;
> > +	struct page **pages;
> > +	unsigned long *src, *dst;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	npages = devmem_allocation->size >> PAGE_SHIFT;
> > +
> > +retry:
> > +	if (!mmget_not_zero(devmem_allocation->mm))
> > +		return -EFAULT;
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	src = buf;
> > +	dst = buf + (sizeof(*src) * npages);
> > +	dma_addr = buf + (2 * sizeof(*src) * npages);
> > +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > +
> > +	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = migrate_device_prepopulated_range(src, npages);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, npages, &mpages, src,
> > +						  dst, 0);
> > +	if (err || !mpages)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> > +					   dst, npages, DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(src[i]);
> > +
> > +	err = ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, dst);
> > +	migrate_device_pages(src, dst, npages);
> > +	migrate_device_finalize(src, dst, npages);
> > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> > +				       DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +	mmput_async(devmem_allocation->mm);
> > +	if (!err && !READ_ONCE(devmem_allocation->detached)) {
> > +		cond_resched();
> > +		goto retry;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * __drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (internal)
> > + * @vas: Pointer to the VM area structure
> > + * @device_private_page_owner: Device private pages owner
> > + * @page: Pointer to the page for fault handling (can be NULL)
> > + * @fault_addr: Fault address
> > + * @size: Size of migration
> > + *
> > + * This internal function performs the migration of the specified GPU SVM range
> > + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> > + * invokes the driver-specific operations for migration to RAM.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> > +				       void *device_private_page_owner,
> > +				       struct page *page, u64 fault_addr,
> > +				       u64 size)
> > +{
> > +	struct migrate_vma migrate = {
> > +		.vma		= vas,
> > +		.pgmap_owner	= device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > +		.fault_page	= page,
> > +	};
> > +	struct drm_gpusvm_zdd *zdd;
> > +	const struct drm_gpusvm_devmem_ops *ops;
> > +	struct device *dev;
> > +	unsigned long npages, mpages = 0;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	u64 start, end;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	start = ALIGN_DOWN(fault_addr, size);
> > +	end = ALIGN(fault_addr + 1, size);
> > +
> > +	/* Corner where VMA area struct has been partially unmapped */
> > +	if (start < vas->vm_start)
> > +		start = vas->vm_start;
> > +	if (end > vas->vm_end)
> > +		end = vas->vm_end;
> > +
> > +	migrate.start = start;
> > +	migrate.end = end;
> > +	npages = npages_in_range(start, end);
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/* Raced with another CPU fault, nothing to do */
> > +	if (!migrate.cpages)
> > +		goto err_free;
> > +
> > +	if (!page) {
> > +		for (i = 0; i < npages; ++i) {
> > +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> > +				continue;
> > +
> > +			page = migrate_pfn_to_page(migrate.src[i]);
> > +			break;
> > +		}
> > +
> > +		if (!page)
> > +			goto err_finalize;
> > +	}
> > +	zdd = page->zone_device_data;
> > +	ops = zdd->devmem_allocation->ops;
> > +	dev = zdd->devmem_allocation->dev;
> > +
> > +	err = drm_gpusvm_migrate_populate_ram_pfn(vas, npages, &mpages,
> > +						  migrate.src, migrate.dst,
> > +						  start);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> > +					   DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > +
> > +	err = ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> > +				       DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_evict - Evict GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range to be removed
> > + *
> > + * This function evicts the specified GPU SVM range.
> > + */
> > +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_range *range)
> > +{
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct vm_area_struct *vas;
> > +
> > +	if (!mmget_not_zero(mm))
> > +		return;
> > +
> > +	mmap_read_lock(mm);
> > +	vas = vma_lookup(mm, range->va.start);
> > +	if (!vas)
> > +		goto unlock;
> > +
> > +	__drm_gpusvm_migrate_to_ram(vas, gpusvm->device_private_page_owner,
> > +				    NULL, range->va.start,
> > +				    range->va.end - range->va.start);
> > +unlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
> > + * @page: Pointer to the page
> > + *
> > + * This function is a callback used to put the GPU SVM zone device data
> > + * associated with a page when it is being released.
> > + */
> > +static void drm_gpusvm_page_free(struct page *page)
> > +{
> > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > + * @vmf: Pointer to the fault information structure
> > + *
> > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > + * the internal migration function to migrate the range back to RAM.
> > + *
> > + * Returns:
> > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > + */
> > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > +	int err;
> > +
> > +	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
> > +					  zdd->device_private_page_owner,
> > +					  vmf->page, vmf->address,
> > +					  zdd->devmem_allocation->size);
> > +
> > +	return err ? VM_FAULT_SIGBUS : 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > + */
> > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> > +	.page_free = drm_gpusvm_page_free,
> > +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> > +};
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM device page map operations structure.
> > + */
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > +{
> > +	return &drm_gpusvm_pagemap_ops;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
> > + * @gpusvm: Pointer to the GPU SVM structure.
> > + * @start: Start address
> > + * @end: End address
> > + *
> > + * Returns:
> > + * True if GPU SVM has mapping, False otherwise
> > + */
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
> > +{
> > +	struct drm_gpusvm_notifier *notifier;
> > +
> > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > +		struct drm_gpusvm_range *range = NULL;
> > +
> > +		drm_gpusvm_for_each_range(range, notifier, start, end)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
> > new file mode 100644
> > index 000000000000..15ec22d4f9a5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > @@ -0,0 +1,447 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __DRM_GPUSVM_H__
> > +#define __DRM_GPUSVM_H__
> > +
> > +#include <linux/kref.h>
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct dev_pagemap_ops;
> > +struct drm_device;
> > +struct drm_gpusvm;
> > +struct drm_gpusvm_notifier;
> > +struct drm_gpusvm_ops;
> > +struct drm_gpusvm_range;
> > +struct drm_gpusvm_devmem;
> > +struct drm_pagemap;
> > +struct drm_pagemap_dma_addr;
> > +
> > +/**
> > + * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
> > + *
> > + * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> > + * device memory. These operations are provided by the GPU driver to manage device memory
> > + * allocations and perform operations such as migration between device memory and system
> > + * RAM.
> > + */
> > +struct drm_gpusvm_devmem_ops {
> > +	/**
> > +	 * @devmem_release: Release device memory allocation (optional)
> > +	 * @devmem_allocation: device memory allocation
> > +	 *
> > +	 * This function shall release device memory allocation and expects to drop a
> > +	 * reference to device memory allocation.
> > +	 */
> > +	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
> > +
> > +	/**
> > +	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> > +	 * @devmem_allocation: device memory allocation
> > +	 * @npages: Number of pages to populate
> > +	 * @pfn: Array of page frame numbers to populate
> > +	 *
> > +	 * This function shall populate device memory page frame numbers (PFN).
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
> > +				 unsigned long npages, unsigned long *pfn);
> > +
> > +	/**
> > +	 * @copy_to_devmem: Copy to device memory (required for migration)
> > +	 * @pages: Pointer to array of device memory pages (destination)
> > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to device memory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_devmem)(struct page **pages,
> > +			      dma_addr_t *dma_addr,
> > +			      unsigned long npages);
> > +
> > +	/**
> > +	 * @copy_to_ram: Copy to system RAM (required for migration)
> > +	 * @pages: Pointer to array of device memory pages (source)
> > +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to system RAM.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_ram)(struct page **pages,
> > +			   dma_addr_t *dma_addr,
> > +			   unsigned long npages);
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
> > + *
> > + * @dev: Pointer to the device structure which device memory allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @ops: Pointer to the operations structure for GPU SVM device memory
> > + * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> > + * @size: Size of device memory allocation
> > + * @detached: device memory allocations is detached from device pages
> > + */
> > +struct drm_gpusvm_devmem {
> > +	struct device *dev;
> > +	struct mm_struct *mm;
> > +	const struct drm_gpusvm_devmem_ops *ops;
> > +	struct drm_pagemap *dpagemap;
> > +	size_t size;
> > +	bool detached;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > + *
> > + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> > + * These operations are provided by the GPU driver to manage SVM ranges and
> > + * notifiers.
> > + */
> > +struct drm_gpusvm_ops {
> > +	/**
> > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > +	 *
> > +	 * This function shall allocate a GPU SVM notifier.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> > +	 */
> > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > +
> > +	/**
> > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM notifier.
> > +	 */
> > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > +
> > +	/**
> > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 *
> > +	 * This function shall allocate a GPU SVM range.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> > +	 */
> > +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> > +
> > +	/**
> > +	 * @range_free: Free a GPU SVM range (optional)
> > +	 * @range: Pointer to the GPU SVM range to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM range.
> > +	 */
> > +	void (*range_free)(struct drm_gpusvm_range *range);
> > +
> > +	/**
> > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @notifier: Pointer to the GPU SVM notifier
> > +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> > +	 *
> > +	 * This function shall invalidate the GPU page tables. It can safely
> > +	 * walk the notifier range RB tree/list in this function. Called while
> > +	 * holding the notifier lock.
> > +	 */
> > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > +			   struct drm_gpusvm_notifier *notifier,
> > +			   const struct mmu_notifier_range *mmu_range);
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: MMU interval notifier
> > + * @interval: Interval for the notifier
> > + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
> > + * @root: Cached root node of the RB tree containing ranges
> > + * @range_list: List head containing of ranges in the same order they appear in
> > + *              interval tree. This is useful to keep iterating ranges while
> > + *              doing modifications to RB tree.
> > + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> > + *                 removed
> > + *
> > + * This structure represents a GPU SVM notifier.
> > + */
> > +struct drm_gpusvm_notifier {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct mmu_interval_notifier notifier;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} interval;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct rb_root_cached root;
> > +	struct list_head range_list;
> > +	struct {
> > +		u32 removed : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier
> > + * @refcount: Reference count for the range
> > + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
> > + * @va: Virtual address range
> > + * @notifier_seq: Notifier sequence number of the range's pages
> > + * @dma_addr: DMA address array
> > + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> > + * Note this is assuming only one drm_pagemap per range is allowed.
> > + * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> > + * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> > + *
> > + * This structure represents a GPU SVM range used for tracking memory ranges
> > + * mapped in a DRM device.
> > + */
> > +struct drm_gpusvm_range {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct drm_gpusvm_notifier *notifier;
> > +	struct kref refcount;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} va;
> > +	unsigned long notifier_seq;
> > +	struct drm_pagemap_dma_addr *dma_addr;
> > +	struct drm_pagemap *dpagemap;
> > +	struct {
> > +		/* All flags below must be set upon creation */
> > +		u16 migrate_devmem : 1;
> > +		/* All flags below must be set / cleared under notifier lock */
> > +		u16 unmapped : 1;
> > +		u16 partial_unmap : 1;
> > +		u16 has_devmem_pages : 1;
> > +		u16 has_dma_mapping : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm - GPU SVM structure
> > + *
> > + * @name: Name of the GPU SVM
> > + * @drm: Pointer to the DRM device structure
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @device_private_page_owner: Device private pages owner
> > + * @mm_start: Start address of GPU SVM
> > + * @mm_range: Range of the GPU SVM
> > + * @notifier_size: Size of individual notifiers
> > + * @ops: Pointer to the operations structure for GPU SVM
> > + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> > + *               Entries should be powers of 2 in descending order.
> > + * @num_chunks: Number of chunks
> > + * @notifier_lock: Read-write semaphore for protecting notifier operations
> > + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> > + * @notifier_list: list head containing of notifiers in the same order they
> > + *                 appear in interval tree. This is useful to keep iterating
> > + *                 notifiers while doing modifications to RB tree.
> > + *
> > + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> > + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> > + *
> > + * No reference counting is provided, as this is expected to be embedded in the
> > + * driver VM structure along with the struct drm_gpuvm, which handles reference
> > + * counting.
> > + */
> > +struct drm_gpusvm {
> > +	const char *name;
> > +	struct drm_device *drm;
> > +	struct mm_struct *mm;
> > +	void *device_private_page_owner;
> > +	u64 mm_start;
> > +	u64 mm_range;
> > +	u64 notifier_size;
> > +	const struct drm_gpusvm_ops *ops;
> > +	const u64 *chunk_sizes;
> > +	int num_chunks;
> > +	struct rw_semaphore notifier_lock;
> > +	struct rb_root_cached root;
> > +	struct list_head notifier_list;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > + *
> > + * @in_notifier: entering from a MMU notifier
> > + * @read_only: operating on read-only memory
> > + * @devmem_possible: possible to use device memory
> > + * @check_pages: check pages and only create range for pages faulted in
> > + *
> > + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > + */
> > +struct drm_gpusvm_ctx {
> > +	u32 in_notifier :1;
> > +	u32 read_only :1;
> > +	u32 devmem_possible :1;
> > +	u32 check_pages :1;
> > +};
> > +
> > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > +		    const char *name, struct drm_device *drm,
> > +		    struct mm_struct *mm, void *device_private_page_owner,
> > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > +		    const struct drm_gpusvm_ops *ops,
> > +		    const u64 *chunk_sizes, int num_chunks);
> > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> > +				u64 gpuva_start, u64 gpuva_end,
> > +				const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > +			     struct drm_gpusvm_range *range);
> > +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_range *range);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > +
> > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range);
> > +
> > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range,
> > +				  const struct drm_gpusvm_ctx *ctx);
> > +
> > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > +				 struct drm_gpusvm_range *range,
> > +				 struct drm_gpusvm_devmem *devmem_allocation,
> > +				 const struct drm_gpusvm_ctx *ctx);
> > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
> > +
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > +
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
> > +
> > +/**
> > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, take lock
> > + */
> > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > +	down_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, drop lock
> > + */
> > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > +	up_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> > + * @range: a pointer to the current GPU SVM range
> > + *
> > + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> > + *         current range is the last one or if the input range is NULL.
> > + */
> > +static inline struct drm_gpusvm_range *
> > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > +{
> > +	if (range && !list_is_last(&range->rb.entry,
> > +				   &range->notifier->range_list))
> > +		return list_next_entry(range, rb.entry);
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> > + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the range
> > + * @end__: End address of the range
> > + *
> > + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> > + * to use while holding the driver SVM lock or the notifier lock.
> > + */
> > +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> > +	for ((range__) = (range__) ?:					\
> > +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> > +	     (range__) && (range__->va.start < (end__));		\
> > +	     (range__) = __drm_gpusvm_range_next(range__))
> > +
> > +/**
> > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> > + * @range: Pointer to the GPU SVM range structure.
> > + * @mmu_range: Pointer to the MMU notifier range structure.
> > + *
> > + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> > + * if the range partially falls within the provided MMU notifier range.
> > + */
> > +static inline void
> > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > +			      const struct mmu_notifier_range *mmu_range)
> > +{
> > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > +
> > +	range->flags.unmapped = true;
> > +	if (range->va.start < mmu_range->start ||
> > +	    range->va.end > mmu_range->end)
> > +		range->flags.partial_unmap = true;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_devmem_init - Initialize a GPU SVM device memory allocation
> > + *
> > + * @dev: Pointer to the device structure which device memory allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @ops: Pointer to the operations structure for GPU SVM device memory
> > + * @dpagemap: The struct drm_pagemap we're allocating from.
> > + * @size: Size of device memory allocation
> > + */
> > +static inline void
> > +drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> > +		       struct device *dev, struct mm_struct *mm,
> > +		       const struct drm_gpusvm_devmem_ops *ops,
> > +		       struct drm_pagemap *dpagemap, size_t size)
> > +{
> > +	devmem_allocation->dev = dev;
> > +	devmem_allocation->mm = mm;
> > +	devmem_allocation->ops = ops;
> > +	devmem_allocation->dpagemap = dpagemap;
> > +	devmem_allocation->size = size;
> > +}
> > +
> > +#endif /* __DRM_GPUSVM_H__ */
> 
