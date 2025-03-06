Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C8A55AAC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 00:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CCC10E9E6;
	Thu,  6 Mar 2025 23:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYe51udJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D7010E9E6;
 Thu,  6 Mar 2025 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741302441; x=1772838441;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6+di4XdvG00iHjjJYpCz2h5175RoHSGRAbZqTaA1Hkk=;
 b=jYe51udJwlaX9oFHuzfYA4mk0AJypWGdFEBdE4df+D6TfG7ec7Joln1u
 ZIQ8mbbl3V9Ff5F9d0Gg4uNh4ks8IP4me8s2ScBPrL5IHj2y1WItPAEOK
 n7uhj7IPnMgH/VhcUvzAkLEvKx+0Ytqg/hJZTvORPup9E2simhRaaVCPK
 00x7MDnaWI8Dw3tYFPMVtf1cGwlItkaAqfa0wspjyin98rkzG3DSB5Y3n
 dVjJq87l3WWEW3MG2U8GOq2JVg9wRdSp2P7UH8pfOl1hOXHcDVKGPEwAd
 OW7NJzSBAsUpzVi8Gj0Rzc7H2uqc9cix7g2MvgUtyd/Sujsq2dgPQ3d00 A==;
X-CSE-ConnectionGUID: 8vOEevOtSdiaiCIgyTByAA==
X-CSE-MsgGUID: RjBez1GPTZSLnlbFMVGVaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67714412"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="67714412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:07:20 -0800
X-CSE-ConnectionGUID: zGKqfuDsSRiv26zXielJ8Q==
X-CSE-MsgGUID: CLxtcThxReel+ANsI2rMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124366855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:07:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 15:07:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 15:07:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 15:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTHrYau9bEL+vnA7Km1I39CjkTfx5UnM2jus5iFn3ruAzjJ/VEyNvYndeNOgxvSp1hxXkVscq04WDjjassfk04/WXrIM2tm3hPgDPXM9l1kL1rEKyWN+sKw6KxnH6jribJUFxglME3v3jr0PSwFpIk3jLdCwxLONBC1yNx7cj7/+fpumcK4+YYbhHHviNjcl+FlFaDDjGKw+CDNrVyKBJ3+IHVrppqwdOmlQN0QxegKDqJOJfPBS32dFLypk99GmAlyU27fhhqykyphvkSrLP0HZFBYp+e3DsQc6kP96c+SyaoytkrQOk/VnG4jbJFCVvsU6itMdMmYmc9UdR2hvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiXjiiLtpH1QxmubtH+Eba74JtRy7+frSJBC5mQ8LDw=;
 b=NhYZNJV2NUnU3isIQEPc3QzUd124zfMTdQcV+R+qLN6sQWDDQYR+ELYaW6LP33+2SRsJ9ueLMpWyZlgBj0FK6fzpEiMs7VJIUuVOByAkCgGUEDf8DFWPM/NmwOkhRAN3d+odBqxYePisA/TFC7PTtgOUGCR6MB2mNCUSHQXP73+hqRLBVibaKP2Dd/cmWy1qnIsGuOX72VDACIezPjcAcNn3HITgHxxOERDgIA+3ZQ9ywWtIBvRqxZaAWJQiojfDSvR2CRhVy7T3JoVE1DQ2OLlfaOGFGS48G2kyXOpLA1X+IwG1kww3HBiq9ejBAdfn4mNMGJqGVfybemwWrulpVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 6 Mar
 2025 23:07:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:07:02 +0000
Date: Thu, 6 Mar 2025 15:08:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: <linux-mm@kvack.org>, <akpm@linux-foundation.org>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Karol
 Herbst" <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, "Barry
 Song" <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, "Peter
 Xu" <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, Alistair Popple
 <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 00/11] THP support for zone device pages
Message-ID: <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: afe9c23c-9b8d-439e-a5c2-08dd5d039abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdoQ2hsT0VXUmt0UkdkemhKOHZ4cGtEeDJEVXJsNWpwMFNXZlBkeHBaYnND?=
 =?utf-8?B?TUsxNHJVeVMrNW5OVUFoS09JT0RNUkV4NEpJa3FZcnR4bDRUb3RPM3ZVdGFX?=
 =?utf-8?B?NUFNbmNOU1NMWEdjNWRhRFNQVXVScTUrUWZSOVRVOTJjejBpMGlwN21PR3F3?=
 =?utf-8?B?MC9yODJzZWFVWVhlUkJ2aHRXL2pLS3dxMkdTWG9POUowZDFUM01LR09CcUtK?=
 =?utf-8?B?VEFaYlBhQjdEOTliZk9zVVlZbGIrRWcwY0pHRVo0MzdOWUZlaUtPbDFIMG9Y?=
 =?utf-8?B?WDl6QWEycjdpNzdvalF6ZXdBMUlXSTZoT3RwUldhZlVpbWVqajRheUhsN3ZD?=
 =?utf-8?B?dzRwNGc0UTRuWDZ1UjNDbW9EeUhMaStQQmxRWmFuL01Fd3BuWEV6NTV3bzRG?=
 =?utf-8?B?cElLazZlL3hBYlczd1JFUGpYZ0pHSHFROVBONEdvc0hEL1RZTC8wNHd3aWNo?=
 =?utf-8?B?TW12aDlsNDJZNnF3Y29LUG93alZuNDkySTg3TlRHYWxqTGpTSElVWEErL1hW?=
 =?utf-8?B?REVybUl6NnJnR2JxTkwyWXQ2UnhyWHptbjEwLzJDQ3htQzRvUUo2dHUyOFNx?=
 =?utf-8?B?blY3NmRtVmh5dEYxQ2JJdzFqb05xODdpZGtGSHZNekFhY1plMHVzL1A2UWJ6?=
 =?utf-8?B?OUk2UGZSa29rcXQrREpKcEhhTFBZTlpmWmYvQzZ1eStwVGtkQkppU0lLMmRu?=
 =?utf-8?B?emc5K1o1NUVOc3owOElCam5lWFRtOXNLWEdQWkswMWtUc29rUEVQaXpSZ3Zv?=
 =?utf-8?B?R296akxUTlVUMzAvQjFydXNUYkpBa2YrRnpEeHpMRXBXUU5ncXhTeTRmTVFy?=
 =?utf-8?B?cXFtTVJnbjJCN0MrV29tdDRVNVpLUVlHSUNhWHZsV05hTGJyTGttL25jSy84?=
 =?utf-8?B?UlRqNXg2QXFZYjk4Kzk4T3FrZE5Zd1FCS1NwNkE0RGFmeC9mMW05L1Bjdkto?=
 =?utf-8?B?UEJidXFodXR0OVBZVkxwZnppTGZ3Mk9JeE5jK0thSjFnNkdlQ1BFZE1sOEFx?=
 =?utf-8?B?TVlyTi9kcjREUXB4NjA1Z0xUSmtNMEtLampmVWRTQWhHbUtPdHNaSFVCYU0v?=
 =?utf-8?B?ZVJGMXFnL2lWVUJwWVFBLzdPK1JXRkxhaFAxQitkS2dXNkk3cXFjcmtKR3Fx?=
 =?utf-8?B?RWNlcXBaQVYxSkRlZnBja2syWlNnbndvdXF4UFRsTVpLcitxL0hDeG95ZTZu?=
 =?utf-8?B?SWdhK1l3U3F4azAvL0dCOXdsY0l3TmtrSy8relg4ZzZKSFBNcXpwUjF2czRh?=
 =?utf-8?B?NGc2eEhwVWxHczcyNmgzMW81Uk5oMEV1M1M3QStYcUUvYWllTm9CZ284VmV4?=
 =?utf-8?B?TWp2ZnZKckJnbGdzRHkwS3pySFFUK05xMkJ2SkZ2MkRTUks5ZEhyNHprQTc2?=
 =?utf-8?B?ZGM0VVVIK0ZUK0NzMnRhU3BhaWtpWGVGMEliOUU0NjZvTGprWFpkcW9Md0pI?=
 =?utf-8?B?dE5uQWU4aWpNQWZ4empoTEFVWjQzU1plYTdxSC9YYU4vN1VLRnVwd29jYlJG?=
 =?utf-8?B?akx4VUEySU9SVkd4TmNJa2xmNXBldEtxR25qSGxyTUp1YS9yM2VYSlpmYW1w?=
 =?utf-8?B?SXNKYWh3ZkJQbzVlMUZEaE95a2taTnNRbGhWaHZuQUp1alFrTkc4WDBuYTdp?=
 =?utf-8?B?N0VXeGJmZk4xMm1qMmVsekUyd0RXS0VKdFFhdzY1c2VYZUo5czFRc1hlUVpB?=
 =?utf-8?B?bmNuNXZabUVqKzNicTBQZGIzQ3pZN3ZkakVuTlFkS09yR0tvdmJMV3RZVVJz?=
 =?utf-8?B?dmZWeWhTQ2R3UG92SDZDbDB5b0RFR2R1ME9nRDFKT0ZUdG9Md2dMU1BYT1Z4?=
 =?utf-8?B?YnQxWkU4NHBDNzg2VGlCQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmwwdm9LQ2xPRmFuL2dNemVITHlpK2pVNVNDVzR3dWRZVm1QVm9WNFh4blhD?=
 =?utf-8?B?NWc2SHRXR3puSUxvemROUjZyaHNzUFo4UDN6RkFuL3dvM3gwemNoTVJPS285?=
 =?utf-8?B?TWVROTBFSkJaZFpZREhDRDBqbXE4S21ncjM4WEZ5MXZTd3ZZL3Z6SEFBL2I4?=
 =?utf-8?B?Z3IrUVpoV3ZZdWVaQUtuR3AvMGlwcFh4bThKKzNVcldCRys1K3lYS3ZvR21o?=
 =?utf-8?B?S0g0dmxvLzR3ZVpjK093ZFZHNnA4bmZBS3dlSTIwTjRQdm12R0dHNEVpNXBV?=
 =?utf-8?B?d3lkWTcrWm5VOXROMTZ3UHp1Z3R2NWFORnY1OHZ6VG5DWTNxZXpTMzZ2ZS9n?=
 =?utf-8?B?d2dEaG4zcCtIN0E0cGc2MmUzWWZNdzArdmtub3JtanVreUsvZnd4aGdyanBq?=
 =?utf-8?B?RFhGZ1ZMbkY5WlZaNThFb3cxcm1tVFBkN0JPZ2dnSEVXVTAwT25TM24xUnl6?=
 =?utf-8?B?NUtJZ2JCQzQrRVo3S3JROWcrYnFGQlBjTStFUVhIOVM1aUttanFnWmF0cG13?=
 =?utf-8?B?VC9EUkdxVFY1S0J6cjU5SHFKOXcxbENyYk9BYXdXNU03L01YMnB6MVpYeGpw?=
 =?utf-8?B?OTUrSnVKVVplc3BFdEg3bXZueE8xOTlrOHRsL2tnWHFkRitLSG5sc2JYelVG?=
 =?utf-8?B?UUQ4ZVU5K0xOWUQ3UTRYc25pVktHdGtNU3BkTS8rcmxoQWN0UG80aWZNdFl2?=
 =?utf-8?B?eDdDOXg4bnZRUThNc1hyTm5IUyt4dUw5TGZtdDV2dXZoTU9xTmVVMUp2andJ?=
 =?utf-8?B?WHZOSU1KOHVQUVAyMWlvRmFpK21TdlQwK080UW5wK21FL0RhenNaRjJHcnZw?=
 =?utf-8?B?anIwc0t4Z2RpdW5maCtsaVBsMXF1elRjVXVvNGV5L2p3SysyWm0ySkNvaTk3?=
 =?utf-8?B?cEZxaC9wNVJ3T1duSUJoUnQvZGl0K2FuT3YrcWtRRDNOa0cvZ242cmZtZnAy?=
 =?utf-8?B?bVp2Z3BLcnV3N1MxRUJsU3l3OHJzZ3VRbEd0QUlpSExzZzEzNEE5SEFyTUtV?=
 =?utf-8?B?ZkdpOUNyM0NNQ2s2d1l3Wm5FOGJQcy9veVBSYVNORUJlalliSllvTVNETk1L?=
 =?utf-8?B?V1FoV1ljd3NnNFplcy9kbTBwdFNOYkYvQk9sQzF2N2p3ZGxFdFBHTzAwWGJj?=
 =?utf-8?B?UEF1cHBYQjJEYjRmWUQ4U3JzQ0FVaXZGZE80aGlxNnlCT3pKaXp4V1JNVGpN?=
 =?utf-8?B?Q2J2UGU4dVFVU1p0RWFnRDZHbTZCV1VLQVh4L2grb1VzNjYvVmxLaERMTkgz?=
 =?utf-8?B?a3FBWlBqU1kyNG9RcW1PRE8zYms4OWdWNjcxZ2Z1VjFoZXJQTHVkVURFa1RJ?=
 =?utf-8?B?THlaRUg2YlpBVTNWS1c5K204UUFFZXJSSk5yZjd6bnJ3cThNTnRUTmRpM1F4?=
 =?utf-8?B?dHJxcUZ6K2NvVWsyeGJiN1Rma05EcmowVnJibFVCRkFoNWduWHVLV3BuN3FL?=
 =?utf-8?B?MnhqakwwRE9rcjdydlNJQVIvM2JNaWdYbysvNldGUkYrQjJqSGJsZ24xRmxB?=
 =?utf-8?B?Vmh4SUQ4RTRxUERMZm00UVhabks2czEzTHJUa0QzaFRVNFlxM0w3VktueTBW?=
 =?utf-8?B?N3g4b1FxMC9jT09US1NhZ1c2NWNxUXo4YjRFOW5zRGpueUd1QllXRWg4eEpE?=
 =?utf-8?B?OXRiNWFxRVFGdXVzTy9ldkc5eVU2OVJRbkNzMW9UVFJMVDBtUGgrT2hjMUpV?=
 =?utf-8?B?blZiR3NVbHJhd21Oay9tVlBvZVB2Ty9WdVBIK0JSbDU4UHEwY2szS0N1KzdV?=
 =?utf-8?B?MmtmNjRsSGVsbGpHWHFITUpsNGhTWFBCK2R0dmI4YlVxbm1lN2pES21VMWtl?=
 =?utf-8?B?ckJ6Y3dyVmplK2NaSFlUNVNDZFJRc0Y2YUFER3NvWEY1V3hWOUEyTzJZUUJj?=
 =?utf-8?B?WEo1RDM0aDVlRTRMZS9JbGQ4K29MQkkwQWd4OHdNY2M2eHJMVUxjSlUrb0FU?=
 =?utf-8?B?T2RWYlZOUnJJRUxxSnZZZjlrNzNid1JQdTBNd0dXMlVYcjJxSUNXNWNZaDhP?=
 =?utf-8?B?YTBhNDFKdzcvRDB5endoUWJkMjF3TzRzQnlZUGJHYzY2WUFQOWoxeW8zeE5x?=
 =?utf-8?B?aDBpVC9vdVpUV1VBR2pzcTdxT01Hb3JTNzhtcHFZZlNTUkpPUU9KRG9VRXpG?=
 =?utf-8?B?a2h6dDdxRVppQWRFMWNSSDU5Q1RHQVlPTmdWd1p4b0ZoWjY2VWtXaCtzL2k0?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe9c23c-9b8d-439e-a5c2-08dd5d039abc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:07:02.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2KdXTJJO35eZdlYiY11rqmkLeWbUKvuIFEqLdWEM3f+S99ujR/fA2I8qMPbDKwdFZv2fxqPv58/3WT38pUJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4869
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

On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:

This is an exciting series to see. As of today, we have just merged this
series into the DRM subsystem / Xe [2], which adds very basic SVM
support. One of the performance bottlenecks we quickly identified was
the lack of THP for device pages—I believe our profiling showed that 96%
of the time spent on 2M page GPU faults was within the migrate_vma_*
functions. Presumably, this will help significantly.

We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
I believe we will encounter a conflict since [2] includes these patches
[3] [4], but we should be able to resolve that. These patches might make
it into the 6.15 PR — TBD but I can get back to you on that.

I have one question—does this series contain all the required core MM
changes for us to give it a try? That is, do I need to include any other
code from the list to test this out?

Matt

[2] https://patchwork.freedesktop.org/series/137870/
[3] https://patchwork.freedesktop.org/patch/641207/?series=137870&rev=8
[4] https://patchwork.freedesktop.org/patch/641214/?series=137870&rev=8

> This patch series adds support for THP migration of zone device pages.
> To do so, the patches implement support for folio zone device pages
> by adding support for setting up larger order pages.
> 
> These patches build on the earlier posts by Ralph Campbell [1]
> 
> Two new flags are added in vma_migration to select and mark compound pages.
> migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
> support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
> is passed in as arguments.
> 
> The series also adds zone device awareness to (m)THP pages along
> with fault handling of large zone device private pages. page vma walk
> and the rmap code is also zone device aware. Support has also been
> added for folios that might need to be split in the middle
> of migration (when the src and dst do not agree on
> MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
> migrate large pages, but the destination has not been able to allocate
> large pages. The code supported and used folio_split() when migrating
> THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
> as an argument to migrate_vma_setup().
> 
> The test infrastructure lib/test_hmm.c has been enhanced to support THP
> migration. A new ioctl to emulate failure of large page allocations has
> been added to test the folio split code path. hmm-tests.c has new test
> cases for huge page migration and to test the folio split path.
> 
> The nouveau dmem code has been enhanced to use the new THP migration
> capability.
> 
> mTHP support:
> 
> The patches hard code, HPAGE_PMD_NR in a few places, but the code has
> been kept generic to support various order sizes. With additional
> refactoring of the code support of different order sizes should be
> possible.
> 
> References:
> [1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
> 
> These patches are built on top of mm-everything-2025-03-04-05-51
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> 
> Balbir Singh (11):
>   mm/zone_device: support large zone device private folios
>   mm/migrate_device: flags for selecting device private THP pages
>   mm/thp: zone_device awareness in THP handling code
>   mm/migrate_device: THP migration of zone device pages
>   mm/memory/fault: Add support for zone device THP fault handling
>   lib/test_hmm: test cases and support for zone device private THP
>   mm/memremap: Add folio_split support
>   mm/thp: add split during migration support
>   lib/test_hmm: add test case for split pages
>   selftests/mm/hmm-tests: new tests for zone device THP migration
>   gpu/drm/nouveau: Add THP migration support
> 
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 244 +++++++++----
>  drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
>  include/linux/huge_mm.h                |  18 +-
>  include/linux/memremap.h               |  29 +-
>  include/linux/migrate.h                |   2 +
>  include/linux/mm.h                     |   1 +
>  lib/test_hmm.c                         | 387 ++++++++++++++++----
>  lib/test_hmm_uapi.h                    |   3 +
>  mm/huge_memory.c                       | 242 +++++++++---
>  mm/memory.c                            |   6 +-
>  mm/memremap.c                          |  50 ++-
>  mm/migrate.c                           |   2 +
>  mm/migrate_device.c                    | 488 +++++++++++++++++++++----
>  mm/page_alloc.c                        |   1 +
>  mm/page_vma_mapped.c                   |  10 +
>  mm/rmap.c                              |  19 +-
>  tools/testing/selftests/mm/hmm-tests.c | 407 +++++++++++++++++++++
>  18 files changed, 1630 insertions(+), 288 deletions(-)
> 
> -- 
> 2.48.1
> 
