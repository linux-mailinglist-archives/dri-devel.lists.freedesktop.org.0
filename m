Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86453A33E14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BEE10EA61;
	Thu, 13 Feb 2025 11:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8cP6Lfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9410EA61;
 Thu, 13 Feb 2025 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446193; x=1770982193;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e446u/PPH0n5nDrQxEXaUROJHAWTM0f3md5NOZOWxtY=;
 b=i8cP6Lfxbdoz8//j4WFHAvrdmI8pd40mRvW54x0aNanzOfRp3ioq7w7P
 jSP+W94d6Lr/7xAJuS88vgzd54t3R73jhH0zIKX59dI/BLJE1BbrYZnVA
 t8UozIZmMrKo0fV/O02NtTtt5N5OU81qjxM5Uw6Nn6T1Enm3A3XdaBVvl
 At4aOH0c/BUFrK6Ap4G0IKjxzcMXCHm88zdxnL586Gp7vrYmfDSQpskqz
 sIqzdIBTyGjqruWabEquHdFQoC+MnMGbZsegiBN5TZntEx7H9C/+ZSifl
 mq0cwprFetO5VGMnvO5pMKQA015nkKVPwNO27wsZ1VB32kJtzVT7FF64q Q==;
X-CSE-ConnectionGUID: 3xyK7t7FQf+VPn6x8uWMAQ==
X-CSE-MsgGUID: 4mf+qV1LQxyi+1aRaXm/ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40062071"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40062071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:29:53 -0800
X-CSE-ConnectionGUID: KEdAMpJlTeGR62vEM3WQtw==
X-CSE-MsgGUID: FY2Q0HC8TCO6zLdwRYHuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113782060"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 03:29:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 03:29:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:29:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:29:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI7hJ9WRCK1dBLobaEbgj2VNm19O01b5hOp/jcJtqRRn2VuMwP0zl6b+oIESgrLs8WIjVgGug1924FrZEhvYUM/dLsypWXgZIlTL4VMwLuAsD7Vkr1mdFLFo+PlEvpoRMcHAD4cmmg5dym4xUb8W8SHCcxK+ujt4np35JyZpW+3UD7CpoboCZ722CzdBDHsbA9BmJkPe4DEfSyWWqs9DR96/wUqu3XY5xaXSp7jP/bQ/KHXlZ223tVVanfN/1v9Q1c2moFT6MjNne6S+XA1nNMLGdYSahl0H6bpa3sm3xnVh0CLJFEKz4UDRp8SUxfK+7U3X1kAmNg2rMqT+zwqOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS7H4JATgXf13zr0/PjL1aV/WnF+dn22hg4J9fGbI0o=;
 b=tZbro0g2uZLKcJIfVucfKLDjzLP/Mf9yCJHvrbQyuIbf4LDryBFnQXQ2VYLgtXdreMzw0ujvxCoz/ODCS9klRevTXJxFwBNzW9rBZdZZkzN1Ud8KQ9+pzqQhuHqjiv16XmQ3T6Md+q/xuVV7iEJfB/W7pRSvZKo3EcmgRx5z6Y61Q9habJVmV4A1MrQI6JumLSg8aZn4rMROCJbWe1VHElXzLKxpFrYUER+gYIW8e2O/l7nmRRuF9srdA1yIFouzYWiuo6Pi9tHJySvpvZF5w00rOcYnmc4IRUKbzEZnIlylyWQylnIAMIgQtS8F7FQ0YYn1ASPMbawHA0Z1CJwZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:29:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:29:46 +0000
Message-ID: <bdf65d95-6f62-4028-aed2-01864ec1e52a@intel.com>
Date: Thu, 13 Feb 2025 16:59:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/32] drm/xe: Add drm_gpusvm_devmem to xe_bo
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-23-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-23-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: af15a567-f97b-43e9-2d1a-08dd4c21b844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0U3Lzh0QW5abVNBakJ6NU1LcUNuOHlPeFR2OWN1ZlFvQVk5czE2TUIwUFd6?=
 =?utf-8?B?ZUFGdEszRG9oRlE4YlpBclFTS1o5TGdnUGpBN0lOSE4zQWdvQ2lrbW5Kc2xB?=
 =?utf-8?B?QXkwRjdydHl5NXpud1paejZqTGhzNVRPYnBBSXpndFNGUHgyQVUvTFlhcGdE?=
 =?utf-8?B?WHVkK2IzTzM4K1JEdmh0bEJBMHE4WTB2RVNWdEtXb0QxTG81M21LbFNud1lS?=
 =?utf-8?B?a2IrdEdYSFdtdlBZTGVzYUFvZzlyMW85ZU9xWXROTlBua3Q0WXpHTE94Wk1J?=
 =?utf-8?B?dmFIeFRINGJuZzlIb2ZLVm84VThDYU9FMktid0JHTWg4NllkQ0JNcHREdXRs?=
 =?utf-8?B?T1lPRTVrc1p3ZitBcVh3ckJqVEtXMGR1L2VFSC9LdVVHT250WW96OGRuR1NT?=
 =?utf-8?B?Rlg0NjZXN1VUL0YvMVlSa1dFc1ZadjBieFRmVnhtNTduNGNRbDNiV3lVK0RN?=
 =?utf-8?B?ekt6NEk4Z290anpubkhMVDg1R0IwaHBzRzVmdXBucjBNQ2xObktDZytsdDgx?=
 =?utf-8?B?bEJJYzFxZ1FNT2kzUHF4N3ArT3VsSmdDVXowV2o1b0tNbFUyckFIMFc0MXpE?=
 =?utf-8?B?b0tENmVmS1Y4QW9XTkxTa2JvQWMyU3Mvc2JyYVAyVStNRFZvQmtwdE4xVUtI?=
 =?utf-8?B?STRVazJETEU0Tm83V3Q0Z3dpNjhiTVUrVzIycC9mamlzZURDRmVGR1VEa1cz?=
 =?utf-8?B?VGtyNGtETW5uQVE2RzJPSjJlbXpxY3FGQUhOOTV0dWRFL1FJQWZXZ0w2eTI1?=
 =?utf-8?B?dkxoVWRjYm9zYzJlSVFCSlR0TTRCTDV4bG9GcW5VaXVkZmNiVDViSnRGSmFC?=
 =?utf-8?B?YXBOc0I2UzkreTYwSjVCK0RvSU8vaUtCRHV4bSt3b2V1enhjQkZseGVDR0tJ?=
 =?utf-8?B?YUh4OGVSRW9ZTERLNmN2NDgrMHVsQU5ZK2RKNlVieWV3bjRVUDc3VTZLWTAv?=
 =?utf-8?B?ZDNLS3V1blFyZjMxUnNEQ1V0NGVtVk8vMUpqWTEvMk1IMWZoZWgyaXdETVJU?=
 =?utf-8?B?YUx5ZnBSLzYwRUxKaGZsclI5eEZSbGl3NHBDckdqWDJwcHVUQzlKMHFJUnVH?=
 =?utf-8?B?c3IvVnRrSTd6Ly8zRzM2Vkp0OHpmYnU4eHBJVEwrTFpnZlc4UVkvazVpVVNy?=
 =?utf-8?B?aDAwZElabnJ2cFEyMVRVcC9DdUYrVlVYUXU4T2xJaWt1Y0JpajllWk1IYmlt?=
 =?utf-8?B?WUR3R0E4UmQ5Um5nUVVEMW9aZmNLRzB2a2xxT0xsbExncjNYVFJ2ckM4ZDN6?=
 =?utf-8?B?RTJJdmdFcFd2ZVE4NDRnd2xjT2lnb0lBSjd4NEhkdlNnWTNFSFdxTkVUaG54?=
 =?utf-8?B?RDI0UkM0RzhGWmhhbjRib2Jtb2k0TkpNOVUrUWViUC9WbCs0eCtUNTNUTlRn?=
 =?utf-8?B?Ny9JMjBmMGdCeDZ0VWw1S2RKT1YyUmRaalBoR3BOY3BraHFTYmtGQytMWEVL?=
 =?utf-8?B?VVBzYWdiNW50N3A5T3o0M2Mzem01R0FOVW9KS1kwUXh5ODg4RThONS9iSTBP?=
 =?utf-8?B?TDI1MDRPVTJDazNPVVh5eHJmMlJlaE1WQnowVnNqV25qSUE0cG1UNjFrbG5l?=
 =?utf-8?B?TWREa1dBemh1ajFsVEZzS0czM0xKM08yWHBWNVpXN3BLb3JBK014UWszNXA1?=
 =?utf-8?B?cjNBQjRuTXdiVVZKSGJHRHJNVTludE11dDVybzFKaklML1ZQYlZDK2g5M2Qr?=
 =?utf-8?B?VEpNSkE2ZEF4UDNpQlRja2U2NnRXS0RPdnB1eXZ3djlVeEE0cDQxL0RQZFM5?=
 =?utf-8?B?Z0JncWFqME05NFNxMXdOLzU5KzlIcUF6WUhHSEswMTcrKysrUVNjam1LcWR1?=
 =?utf-8?B?V252a09GRUxlNVUzWndIU21MWlhVeHlFdGFQVURDc3I4ZDNUS28zTHR4TGh5?=
 =?utf-8?Q?3fbj8qbjNqFNf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRNL1o5T0kxcnhEc09mWW4yNU1Db2ZGSGQ5bHozU2ZRb0V4Z0FxbFVnc3RU?=
 =?utf-8?B?cWhvMjdjd29YMzFKdFQzTWlIeGxCZ2JkZWU5ME1VTlV0Q0ZOVDVra1RUTjhp?=
 =?utf-8?B?dXc0NHpNZXp3S1BZbEdVZnhEREEwZ3dkeEJNb1hqNzdYYUEzR2VtZFZzVnJj?=
 =?utf-8?B?K0FzZlFiZDJRdWJVM1duRFcydGJRbGYwODJ2RVBmK1JHaDA3ZWwvV2hyQnNL?=
 =?utf-8?B?U2lGYWtJb2IxTHA4TWwxTk96NWUxaklOUDYyZnVLYmlzU1YrZGIyOHJ6aEtJ?=
 =?utf-8?B?VmhjblR4dDJTRTV1YkdTazdDRzFyVGNEQzRVbW53dWNXRnB1L0x0Tlp4RW5y?=
 =?utf-8?B?M0JsM3hoeEhyeEdTbXNVTGt3M3hWU2h6RWxIbUJqUU5VR0JFLyttak5Bd2RE?=
 =?utf-8?B?OHkzQkE4d0JkODcyOXYrSHBOTURoNEpMT2tVT0tXRFhYazRoRldWT0cwWG5j?=
 =?utf-8?B?VzZnNWNlMEtrMGtqREM3UVowOGtUMlpmTE1JbnBuSVhOSmNnc0hWVE1LL2M0?=
 =?utf-8?B?WVZLb2NXS2VJNFBFV0VSWVlGY2t5TWdMdXRwNnF3b2VUZ0dicDJjbXovTEpG?=
 =?utf-8?B?RHQ1c25jSDljeVR5WmhZNG9pTVRVaGY1ZGpyVGRmMFcvTHhFTkVIOXdGTkRE?=
 =?utf-8?B?Mjdnck8rOEVUaEtwb3dHUlhjeEYycjJIbU1NMDBuTG4xbWlBeG0xaGE2M0Er?=
 =?utf-8?B?R2piNEFQNHZyU0RndWdlYzd3UGY0Z3ZuWGpuckF1VFlFSzhNT242aHd4RmYy?=
 =?utf-8?B?c1BtTSt4alpxaC9QU2gza0ZhbjdYM3d3UGduM0NCWnR1ck1jcWVDenkydjkr?=
 =?utf-8?B?TU5mS2xnd3QyWS9GdjVmd0hQdEdzdVFMQmNrc3JSZ0c4a0tTQjRjdnlXa085?=
 =?utf-8?B?YjNUMkdHU0lqd2IvV3llam9scE1MWTRGL1VVbXNURUNwMmU1WnZ5YUxNVDY4?=
 =?utf-8?B?NXhHa0ZMS29VRTVmSUdvazB3SGd1ZHhCNDlCOTd0anJkYTdiNTFFWnprMTFk?=
 =?utf-8?B?eDdJMnZJWkZKd2dTV2ZRNDFuV3V5SDdQTjM1bE1YRU5CWEg5MjdQc0NOZ1JP?=
 =?utf-8?B?NXAycFdVYkVxcUViYnZyRFVtZTZNeU03VTVRVFl4YjRtNnNwZ0tHNlYyRkdq?=
 =?utf-8?B?Q0VVcmllVit6WUkzSWZmbjFxeWN6VGxidldNUUl0ZFhWT0xtNVdQNmNFbVBk?=
 =?utf-8?B?YVNpMnJKQTNQNjNORk1lWFp2MUJ5dVkzVVJrWlorODdXSXVFNDZuQlVhYXhT?=
 =?utf-8?B?L21Qam83WFNveEM2c0tpZXlFVFVFYXdabWVYZFZqM0tEN2toU2ViM3dpZ0Za?=
 =?utf-8?B?YmdYL2lXZC9QdjYvRHQwZVJFWEJhN1M3UzBwb0xZaG1UaytlZVZYbi9hZmwv?=
 =?utf-8?B?VnAzbnJPL3d4NGJjZ2dtVVpQVmdranpnR3JkWEtZVlA3aElEclhjOHUxNWJI?=
 =?utf-8?B?Z0lNdFB4RzQ1a2NiU1dDeS9hMDE3bGtmZW1hdGpnNHdoUTJwNUliaXVuS0ta?=
 =?utf-8?B?a1UyUkpZTWJCZ1cyT3pQRlJwWDY5T2JRUmZPSmJYMnFLa29KVkc3eTNBTG9J?=
 =?utf-8?B?N1VmakEwUmQ4N2VmLzk4MWlaSy9rRnlqQ0JCWFJxdWNzWlpRa1dpV1FiWnNO?=
 =?utf-8?B?MVZkemRYY21tK0E5aHhRdTlwY2lxV2pCbUFCQ1RuWit3VjNZTVFibENrZGlm?=
 =?utf-8?B?MDBmelZuU2JEMkZEajJncG5adERYc0pBaURXWm9STjdKalpHYWRyYzNJcnhM?=
 =?utf-8?B?ZEFjVlJYSkQwNWNzYmlCVWtwSkZJeFp4QXhlN0gxaFBHQ21TVi9sdjU5MFpw?=
 =?utf-8?B?Q0FuR1FrVW9SN3daV253L3NuVlRDdFc4dUNnUkZmdmJuT2l1ZXVMYnBmYS8y?=
 =?utf-8?B?RFRJZ2VYdUdwMWRReUpwajRkY1RmS3NBNFArZ1czZDJXQlRKdytTb1kweDNt?=
 =?utf-8?B?S0pOaVA5WGloQWowcjQzTWNzSXk2a1h6UEhvT3ZUbHBVenB0Y3hXTlJsS2pX?=
 =?utf-8?B?VnpPR3Z2UDRacGNGeXZ0TE9GUjZlQmIzTnpvWEFMWURoeXF2endrQVhCRDFC?=
 =?utf-8?B?akRsZ040azhNR3ZJQk55SFdEbFBKWDJ2bmpHMWNzWEhXMWVsYzVVZGRqZVZy?=
 =?utf-8?B?dTh2L1JtbEoyaUFOVzlFYm1DdXNWL29zaGNLbGFHYzJLV2dpYkNhcU1XcWNh?=
 =?utf-8?Q?f/DbIUq3mNilf43aNXkhnrg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af15a567-f97b-43e9-2d1a-08dd4c21b844
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:29:46.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O919P3e2G0vvprAD8vM2WjV0LlVzQ1g/BndDK9KnBVRbgZd9ExerL7YiHztdeKpbW60JM/Rtiy0ts8RCvgAZjFsZXgCZFOtJWh8IZmle2XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo_types.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 60c522866500..15a92e3d4898 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/iosys-map.h>
>   
> +#include <drm/drm_gpusvm.h>
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
> @@ -80,6 +81,9 @@ struct xe_bo {
>   	 */
>   	u16 cpu_caching;
>   
> +	/** @devmem_allocation: SVM device memory allocation */
> +	struct drm_gpusvm_devmem devmem_allocation;
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>   		struct list_head vram_userfault_link;
>   

