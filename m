Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B0DCC0672
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 01:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3510E614;
	Tue, 16 Dec 2025 00:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdxIeQfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF2110E614;
 Tue, 16 Dec 2025 00:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765846748; x=1797382748;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KxGSuRfzwi+lvWQYEkpsLefJVaazYuPlghEIkWZ2BME=;
 b=jdxIeQflP8gFHvDTztQ1aVUnD/9Kzq+Y3Tc40nxn1IvB7BP8kyOX4BZM
 QldLe4dChhjiql3v0M60NJdkl0gT6TpJ3KwvZopyr45Qb2/3HR+UG04D/
 wTswPa5BY30txHXBHbGPzLsMiZisLAV//MO3Sba3lEG+P0LPqFwyuSPF3
 D/tKY+w47Y+qutAG2pgQqYArkRXyTEaafO6YaGYC4AmOJ6WReXxhYAf3s
 HfkCmXOjGF1Mwa9QHQVMx/1IsEa1yLkedE2YRPvp0qrAdyFFTBMVCwRRL
 43rhgOVNPPgo4uvzIzEOlSEbtoBzsCyjDJjd7yGjU/PWWtCIDSSMOR3hS g==;
X-CSE-ConnectionGUID: ljKwn0AmT36UdmeIBd1+wA==
X-CSE-MsgGUID: RgwX2X2YTouATK0bVq1tUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67724443"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67724443"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 16:59:07 -0800
X-CSE-ConnectionGUID: k5bN8U6tSUaEbDFVxQbwMQ==
X-CSE-MsgGUID: V7M87zWLSzutJBUUNUAiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="196959343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 16:59:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 16:59:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 16:59:06 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 16:59:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VISGPMbI++QTrP23FdZUdpuzXQ/OHqptNobUnjknW87i3JROrJFFo2mIp+Fhs/75SHhpAcGX0EU1KQR2U3Rd/bUrI6w32W+QCZLTSIpoZSmtdj8Ri5F5ZSj4t4K/hTS/SXmv2wiNGCGAFADo1XxYwdpDIKQtebcV9dWPk55raZitr1QYnMH0iwjoBxwY8NqQvX8xdj4fvGj7IVDi6sutixbJR9kQbYCP1j7vzW4imfwXxAda57CtQP5QY/GWoVcM01jqMO8rrd7sm7KkeR/92+TTA+gORALK8gzzXu4clGeSk4oETsxkEVDV8ClskftfUjjF/R7k2QU0GCKR9TOdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW6fWAurU7n3cOkgKewb3d9qlUed2dLozZMwW7sIZ2s=;
 b=AT/pmvIjqzVpnm9iFrCAX2I6V9fAIJWKbXJ54+8k0O7Q9AMQ4keSeR9IuGJzTiBOb61jsIHoiRVQg3kIkdg8qkn9LW4B0pTh2CaOnjtjG8SZDeGbpgmOzUKuwRRN2GFsCm0zy4SGXOzhIhhGGiF52utnQcINugaRulNPA9pO5DuX2roeYqQm1qh5I7BRg94I88DFQAV1kl+np03sU1LWSJZ1OmLr+oBRdsIhIUJ1DXoyEV9d/iBjWrX/DEyaIocouaF4W0fwXi4B6ycZHy7NmAFtyl9HG4RszZBX+md+Ww2cCDNNYvsXW3q/VUZuhFrRh2vvGOndWaRV76GkAHXNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 00:58:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 00:58:58 +0000
Date: Mon, 15 Dec 2025 16:58:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4 19/22] drm/gpusvm: Introduce a function to scan the
 current migration state
Message-ID: <aUCuz74b9cPdlE8m@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
 <b70bec9c-da7b-4bff-9a41-b7548ea92518@intel.com>
 <b43179723c15c9a20594f4ff52c1d936a5fa04c3.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b43179723c15c9a20594f4ff52c1d936a5fa04c3.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:303:86::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: a8792911-bd0e-4109-2906-08de3c3e4b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TExpcllYdVExTjJKOWUzVCt6MThHYVhNVGNuOEJNY1RpdlJSZG5BTGRsb2Zj?=
 =?utf-8?B?N2RIZW1SZzN4ODRaeVU2Qk9OcnBFN2d1M2FtUWJIVkF3NXZTRTBSMnRSY2lq?=
 =?utf-8?B?ZERRRzZLbzJFS29JS0FqYjlJdWZGTnFTMnBDc3ZPdmhjOEJuUFdGTllPbTd3?=
 =?utf-8?B?M1ZBbDlvMXlNUndmVmoxdWxYSHh2RUUxMzFNaUI3NUFCd3p5a3NUSElPM3Br?=
 =?utf-8?B?Rk1NaUtjWm5FZkV4MDg5Z2pydFRLd21xYWRkeldOdWd3UHNEMVlMUG1VOVRv?=
 =?utf-8?B?L0NGY2c5MnJYaUdsTDd5a204T0RPeGY1OXM3eHowdzBVVkRoZ0JuY3htcWMx?=
 =?utf-8?B?dEtsR0RZUU52c2hHM3E0NU9FU2gwd3g3UmRxOTVBREZCQS9zbVd1a1I3dUh3?=
 =?utf-8?B?TWVTK2pSZ3A3UnFJdTZtMFU4Rnoxay9ZNytQUnNLMWU4RzBtQkcxcnVDNVRI?=
 =?utf-8?B?azBvejhQRE9GMG1JS2pRa3BPeExtN25UcU5TZU9SeFM0Y1BRS056TzdVWis5?=
 =?utf-8?B?OEc0NWFnNjdWKzlUUWVrSE53Tk9mYWIwNEprNzZCeVcxVUVybU9WNWZqZjNL?=
 =?utf-8?B?RjI3M3E1VlhKSzVrOWdZeWhzZExldnRJT2pIc21yblQzRFJ1Z3dMdXVBaExP?=
 =?utf-8?B?d2ZxZW5jdWx3cllyQTlrb2JNdHpaendBdmxoQ2JJR2w1cUh6NGREeTdId0JO?=
 =?utf-8?B?TGpjSmJHQ2FLQ1NSeEgvZnRLNnM0NUFHVDBEUVlZSmgvYmZrZWk0VDNjbDhq?=
 =?utf-8?B?R0wrS3lpaTRmblYyVDRGQTBhVkpiZ3JMN25BRkhlVkVuZE1weEFCVFJiK1R6?=
 =?utf-8?B?UVNzR2IzK3lHZmFRZkxhOFpHSmZ6bTB0LzV2Wi96STQ4MmdsY0F5M2JmRGhY?=
 =?utf-8?B?ay81bjB0SVVHR0g4SmIzWnBjOCtlRmZSRXdMRG5TSHlrV3hMWGtVSWtwTkor?=
 =?utf-8?B?RDl3RFQ1QWR1ZmlWa01uL3lnaUQ5aGk1cjFza0dZWXhCVzVWc1pHVTFuUkJP?=
 =?utf-8?B?aktjVHhxZzZYVFQ1bXkwVS94bEhRZC9xRTdpd1ZMSzVWNEtlN2ZUd1c5TWxn?=
 =?utf-8?B?ejI4WkZEa0RaVzY4dXA5NHUzQm1wbTJjc2t4N1loRVIvZ2srbkczRlQwVHox?=
 =?utf-8?B?QnpmNnJMc1ZBdHQxODgra3libW9hNGliQndwTEp4TGNSK1RydENVOXVrU05O?=
 =?utf-8?B?U3E1eVg5bFgycnZPNStkckhCZC9hd0NHOU1mTGFmWjkzekhEaEdOT2FUV1F0?=
 =?utf-8?B?OWdGWXJKaVMzSzFZR0d0cXcvNk5OOHFDajk4azRBMnVzd0RrVHozS1lRSER3?=
 =?utf-8?B?YkJtUlA3SGVPWFJ0c3g1NXI0U0VueU1KYTFPZ3FObmxjTWpaK0diQTdYSDFn?=
 =?utf-8?B?YTZQZVl6UGUvSkZ3SFFkc0l6TFJ2RVNSNk5pcnlwbzhiMVMvcS9maVhOQndL?=
 =?utf-8?B?RmZBL0hJOThQTnhaRTF3RDNLVXVxK0JCMG9PTFBKVzl3M2R4OHpiY2xleTdh?=
 =?utf-8?B?UGpQQjl5Umxidnd5NGZsK1N4SzNNdVlVdjV4RGlKdlI0K3R2a3E3QUtyS1NL?=
 =?utf-8?B?TTZQWjh4M01pRUsvQkpCcjdnbnhEd2xuYnEwOGRZcXU2VkhXc0ttalhweGFI?=
 =?utf-8?B?UEJwZDRvc01MdThSOFBqR3RsbUtNdGQzMGJydE43d3pYdGI1Zk5vMzRhVDEw?=
 =?utf-8?B?RndKbHNIejl5QUZ2b0ZiYm1uSGRlbm1sb2tBVG12UlcwRjJ0NlVkbDg5T0tu?=
 =?utf-8?B?a2ZiaFB1dkk1ME0wbGdPMzRkUTRHMlFVdHhuMmhIRms4S3pYSndHVHF4eUZM?=
 =?utf-8?B?L1lsTEVOR1NlMWhMY3RadS84dWI5VHVVSndQWVBHbnZnSFVvU2hDQlZMVEhm?=
 =?utf-8?B?SXd2Nis0L3M5T1ZHMzZtVVJsbTNqUlJHN1l3NjlqZmxNd3VxRmtJa2NTR2lN?=
 =?utf-8?Q?PzA0PcOnoq65RjQkbaTE1JiCq3U/GnNL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBwWGJsaW5hR0FTVTkybXNxL1ZLbXp2bFMzOXBmMDloUllxM1dzeGxSZDA1?=
 =?utf-8?B?cU40dkFBUzBpRXNacjFJTjZDYXYwdkVSeStBd01mYmtXTFBTbFJGS3MxT2pG?=
 =?utf-8?B?aVh6ZDc2SEpNM1RXUkVLWVBsWmN3OTExdVZ2Rm5YakREeVNhNlVxSjcwOE5U?=
 =?utf-8?B?TVlZWUJMS3RZRmt4NjRQZEwzYWM2TzlxaHpLQng3UHJPdmpITEIwckd1eHNi?=
 =?utf-8?B?UktyS1NIeEw4OVV1aUFIeHByMGo4SVdTZThtU3lXRVAwUFliMTY5ZkNJazM5?=
 =?utf-8?B?TkwwQUQrbG9EazFIY2REU0E4a3k0ZlY3enc5VzlLZVBZdGNhWEc5bXVlN1VT?=
 =?utf-8?B?VEFQbjluWGpLTC9JcVgwd1Fzb1VOeXQzUzg5Njl1WFNSSTh5ako0dHZiaDYx?=
 =?utf-8?B?cTZCc0xJaUpPQW43NVJSTGVQaENZUzUva2JoSVBOUlJOaHFoaStyNzdvbVNH?=
 =?utf-8?B?WmpGMGh1cG11UTlXOVlnZDdSYU9ET2JkVml6dEN6MFE2NjRBaCtoOE05OWhy?=
 =?utf-8?B?Yy85L1VkK1YxSEFybmdvZENkeTVKNHRCd29lejJjOUpFQWlsdDFneXJMNnhZ?=
 =?utf-8?B?QzNHZXB6MHE0a1BIaThGSTRqWDgvNVdsN2hoY3hqTTkzQ1V1dHNNZElOSHo3?=
 =?utf-8?B?S1ZFVmRxRUd6UDZZSVBFZ1hmdjQ1VGdxQS9VQm54QklCV2VWMHBFd0tjQnZ2?=
 =?utf-8?B?WVdQRU9vV2RPVzVNWUNpUWhTaHdoRHhHNjJzb2pNWEY0TGFOeEFUaExudkxM?=
 =?utf-8?B?R1FRRDlQRWNiWmd1WmZzSFlwZExoQ203M2Fzb3o4R2RPeTFTdTVGdTRmTnls?=
 =?utf-8?B?Y3lZeWZVOFJ1Vm5Fa1NGc2V2ZGJZR1RJc1JBMlFhSkwrZnBOTmdHSjZycGZm?=
 =?utf-8?B?RjZBSUR5ZmZvVVcyR2N3cktqUFdOQmlRbG0vOUh5ajkrb1NLSEpmbTJsbDlv?=
 =?utf-8?B?RFRVTDdlSGxEelNHMkRYbmJpSldqUGRzTlBVTkZGL0xuY1FZTFgyYlJ4WjVI?=
 =?utf-8?B?S2FKbG9WMW5uODdXOU1XamdIYUhPRHRzb1RRNTVwRXNoUk1oOEJ1NVVlRkMx?=
 =?utf-8?B?cU5mZithSlkvVG5DejJyRCtPOGN6WjV0MVR6YjFpT3Z5NGpCR2xWWVZHbkNM?=
 =?utf-8?B?YS9SUm9KY2p4eDVBbXdoVUtLMHVhZFJ5OWZwNmVxemltdVltbytWRnZxSXZw?=
 =?utf-8?B?SUYrU1l0eGRaU0Njc1FhV2ZoMjUwQUxQWlNKUFlhL1VHZm1YMTJqUlo3MXE2?=
 =?utf-8?B?ZGg3YU1XWGdpT0tYRXpiSEJPRU4zWjVSL3RRbm9qTnhWTFFuYUlVcHVuWHlQ?=
 =?utf-8?B?S0ZyNk1PT09RUzA1eEFDK0JTTDRxQytsdERBQy80S3pwRmY1enJsdW55Yzk2?=
 =?utf-8?B?VGtkMWNtUmtVVndld1NGNnNnTUU3c0kra1YxS2hiUHlMNUdIVms3Vzc2Qi9U?=
 =?utf-8?B?QzJyTCtjbm5XTEZLanMvbTZuM3AwbFAwYjEyUElHVkNueWRqRTVLaUg3NTRv?=
 =?utf-8?B?Z0wyZUs3TjNyY0F0N1B0OGpDbDNxRVl3R3FQaEtTMi8vOXdvTmNqaktSQi8w?=
 =?utf-8?B?YVJWSEJHRTFycU05eWNvWU5BV2ZPM0VZcm5Md2d5cVJiM1RybU5kd2IyTHlC?=
 =?utf-8?B?MXFEMThwVmpkb3BwRGIxdU5SQkZHN3BWaWRQOTFXREo3TWk5N2gwMlhVcXFS?=
 =?utf-8?B?cUUxaUhiOExENlVuVG8rR1NWQVVOTnRMWWRibW1Gbk43TytoT0duYnJzNDk1?=
 =?utf-8?B?dlZ3bWFkaFZEMEpEcGp1TlVOaVNoT05uS2lGRTNHaWp1eDRBTE1LcThrQ0xz?=
 =?utf-8?B?OU5hWEFUNTQydFhOaklMZXFMdm03b0NFRXNjd1k2a3dKZEllQWMraHptV1pH?=
 =?utf-8?B?ck9wRWlQNk9rTkQ0RUhJUFZaQVBBdG5pZTNnZWRwVVo5OUN2V0EvdFpoNXBw?=
 =?utf-8?B?UW1ENmhDNTN6WGpVMDZwT3JRVnVocEY0TW5OcVBQZkZqTWlGY0g2cHM2UjBW?=
 =?utf-8?B?YXI0Q0x1VloydHgrN29UaG5QT1ZtTGZ6dHVOSHFpNnNVMnBXdU9ndUN0bEhw?=
 =?utf-8?B?NmJ6cDM2U0dqeTdCdjZPWW12dlo0Snkxa2JZemJCOVEyanFiNGxZakFobXNy?=
 =?utf-8?B?Y1ZMNzVFUnVFMkdWcWpsSHBaYTU5b1pyNlhGbE1xcVE3RkdURzMvVHRSRFRh?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8792911-bd0e-4109-2906-08de3c3e4b2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 00:58:58.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye1RYo33E1PXyvTyhYexO9o62xeleddulwHZDMRtvChEyl+gM9rU9qW0R79UZnhHeweHVD27NayEiwhPS2ROhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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

On Fri, Dec 12, 2025 at 12:35:00PM +0100, Thomas Hellström wrote:
> Hi, Himal
> 
> On Fri, 2025-12-12 at 16:51 +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 11-12-2025 22:29, Thomas Hellström wrote:
> > > With multi-device we are much more likely to have multiple
> > > drm-gpusvm ranges pointing to the same struct mm range.
> > > 
> > > To avoid calling into drm_pagemap_populate_mm(), which is always
> > > very costly, introduce a much less costly drm_gpusvm function,
> > > drm_gpusvm_scan_mm() to scan the current migration state.
> > > The device fault-handler and prefetcher can use this function to
> > > determine whether migration is really necessary.
> > > 
> > > There are a couple of performance improvements that can be done
> > > for this function if it turns out to be too costly. Those are
> > > documented in the code.
> > > 
> > > v3:
> > > - New patch.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/drm_gpusvm.c | 121
> > > +++++++++++++++++++++++++++++++++++
> > >   include/drm/drm_gpusvm.h     |  29 +++++++++
> > >   2 files changed, 150 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index 4c7474a331bc..aa9a0b60e727 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct
> > > drm_gpusvm *gpusvm,
> > >   	return err ? false : true;
> > >   }
> > >   
> > > +/**
> > > + * drm_gpusvm_scan_mm() - Check the migration state of a
> > > drm_gpusvm_range
> > > + * @range: Pointer to the struct drm_gpusvm_range to check.
> > > + * @dev_private_owner: The struct dev_private_owner to use to
> > > determine
> > > + * compatible device-private pages.
> > > + * @pagemap: The struct dev_pagemap pointer to use for pagemap-
> > > specific
> > > + * checks.
> > > + *
> > > + * Scan the CPU address space corresponding to @range and return
> > > the
> > > + * current migration state. Note that the result may be invalid as
> > > + * soon as the function returns. It's an advisory check.
> > > + *
> > > + * TODO: Bail early and call hmm_range_fault() for subranges.
> > > + *
> > > + * Return: See &enum drm_gpusvm_scan_result.
> > > + */
> > > +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct
> > > drm_gpusvm_range *range,
> > > +					       void
> > > *dev_private_owner,
> > > +					       const struct
> > > dev_pagemap *pagemap)
> > > +{
> > > +	struct mmu_interval_notifier *notifier = &range->notifier-
> > > >notifier;
> > > +	unsigned long start = drm_gpusvm_range_start(range);
> > > +	unsigned long end = drm_gpusvm_range_end(range);
> > > +	struct hmm_range hmm_range = {
> > > +		.default_flags = 0,
> > > +		.notifier = notifier,
> > > +		.start = start,
> > > +		.end = end,
> > > +		.dev_private_owner = dev_private_owner,
> > > +	};
> > > +	unsigned long timeout =
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	enum drm_gpusvm_scan_result state =
> > > DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
> > > +	unsigned long *pfns;
> > > +	unsigned long npages = npages_in_range(start, end);
> > > +	const struct dev_pagemap *other = NULL;
> > > +	int err, i;
> > > +
> > > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return DRM_GPUSVM_SCAN_UNPOPULATED;
> > > +
> > > +	hmm_range.hmm_pfns = pfns;
> > > +
> > > +retry:
> > > +	hmm_range.notifier_seq =
> > > mmu_interval_read_begin(notifier);
> > > +	mmap_read_lock(range->gpusvm->mm);
> > > +
> > > +	while (true) {
> > > +		err = hmm_range_fault(&hmm_range);
> > > +		if (err == -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =
> > > +				mmu_interval_read_begin(notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	mmap_read_unlock(range->gpusvm->mm);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	drm_gpusvm_notifier_lock(range->gpusvm);
> > > +	if (mmu_interval_read_retry(notifier,
> > > hmm_range.notifier_seq)) {
> > > +		drm_gpusvm_notifier_unlock(range->gpusvm);
> > > +		goto retry;
> > > +	}
> > > +
> > > +	for (i = 0; i < npages;) {
> > > +		struct page *page;
> > > +		const struct dev_pagemap *cur = NULL;
> > > +
> > > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > > +			state = DRM_GPUSVM_SCAN_UNPOPULATED;
> > > +			goto err_free;
> > > +		}
> > > +
> > > +		page = hmm_pfn_to_page(pfns[i]);
> > > +		if (is_device_private_page(page) ||
> > > +		    is_device_coherent_page(page))
> > > +			cur = page_pgmap(page);
> > > +
> > > +		if (cur == pagemap) {
> > > +			new_state = DRM_GPUSVM_SCAN_EQUAL;
> > > +		} else if (cur && (cur == other || !other)) {
> > > +			new_state = DRM_GPUSVM_SCAN_OTHER;
> > > +			other = cur;
> > > +		} else if (cur) {
> > > +			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
> > > +		} else {
> > > +			new_state = DRM_GPUSVM_SCAN_SYSTEM;
> > > +		}
> > > +
> > > +		/*
> > > +		 * TODO: Could use an array for state
> > > +		 * transitions, and caller might want it
> > > +		 * to bail early for some results.
> > > +		 */
> > > +		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
> > > +			state = new_state;
> > > +		} else if (state != new_state) {
> > > +			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
> > > +			    state == DRM_GPUSVM_SCAN_SYSTEM)
> > > +				state = DRM_GPUSVM_SCAN_MIXED;
> > > +			else if (state != DRM_GPUSVM_SCAN_MIXED)
> > > +				state =
> > > DRM_GPUSVM_SCAN_MIXED_DEVICE;
> > > +		}
> > > +
> > > +		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i],
> > > i, npages);
> > > +	}
> > > +
> > > +err_free:
> > > +	drm_gpusvm_notifier_unlock(range->gpusvm);
> > > +
> > > +	kvfree(pfns);
> > > +	return state;
> > > +}
> > > +EXPORT_SYMBOL(drm_gpusvm_scan_mm);
> > > +
> > >   /**
> > >    * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU
> > > SVM range
> > >    * @gpusvm: Pointer to the GPU SVM structure
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 632e100e6efb..2578ac92a8d4 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm
> > > *gpusvm,
> > >   			   struct drm_gpusvm_pages *svm_pages,
> > >   			   unsigned long npages);
> > >   
> > > +/**
> > > + * enum drm_gpusvm_scan_result - Scan result from the
> > > drm_gpusvm_scan_mm() function.
> > > + * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present
> > > or inaccessible.
> > > + * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct
> > > dev_pagemap indicated as
> > > + * the @pagemap argument to the drm_gpusvm_scan_mm() function.
> > > + * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one
> > > dev_pagemap, which is
> > > + * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All
> > > pages belong to
> > > + * the same device private owner.
> > > + * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system
> > > pages.
> > > + * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and
> > > belong to at least
> > > + * two different struct dev_pagemaps. All pages belong to the same
> > > device private
> > > + * owner.
> > > + * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of
> > > system pages
> > > + * and device-private pages. All device-private pages belong to
> > > the same device
> > > + * private owner.
> > > + */
> > > +enum drm_gpusvm_scan_result {
> > > +	DRM_GPUSVM_SCAN_UNPOPULATED,
> > > +	DRM_GPUSVM_SCAN_EQUAL,
> > > +	DRM_GPUSVM_SCAN_OTHER,
> > > +	DRM_GPUSVM_SCAN_SYSTEM,
> > > +	DRM_GPUSVM_SCAN_MIXED_DEVICE,
> > > +	DRM_GPUSVM_SCAN_MIXED,
> > > +};
> > > +
> > 
> > Do we really need these enums, wont simply returning whether all
> > pages 
> > in range has same pgmap be sufficient ? Return true or false and use
> > to 
> > decide range needs migration or not.
> > 
> > If we are expecting some further uses cases for these enums, then
> > this 
> > looks OK though.
> 

My opinion is that robust core code anticipating future uses is never a
bad idea.

So I’m actually fine with what Thomas has here, as I don’t think it’s
overly complicated. I’ll defer to Thomas on what we’d like to do.

But will defer RB to next rev.

Matt

> For the deferred series implementing the migrate_system_only migration
> policy the usage looks like 
> 
> 	if (migration_status == DRM_GPUSVM_SCAN_EQUAL ||
> 	    (!details->migrate_same_owner &&
> 	     (migration_status == DRM_GPUSVM_SCAN_OTHER ||
> 	      migration_status == DRM_GPUSVM_SCAN_MIXED_DEVICE))) {
> 		drm_info(dpagemap->drm, "Already migrated!\n");
> 		return 0;
> 	}
> 
> So not all are needed in the near future. I could look at simplifying a
> bit, though, so that we actually only expose what we use currently.
> 
> /Thomas
> 
> 
> > 
> > > +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct
> > > drm_gpusvm_range *range,
> > > +					       void
> > > *dev_private_owner,
> > > +					       const struct
> > > dev_pagemap *pagemap);
> > > +
> > >   #ifdef CONFIG_LOCKDEP
> > >   /**
> > >    * drm_gpusvm_driver_set_lock() - Set the lock protecting
> > > accesses to GPU SVM
> > 
> 
