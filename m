Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9301A13820
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B05510E0CC;
	Thu, 16 Jan 2025 10:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIijitTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62C10E0CC;
 Thu, 16 Jan 2025 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737024063; x=1768560063;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=emqR0W7R3imhMSy67pdyFeMVHQ+6Z7r04W/XAYgxtGU=;
 b=WIijitTQQyE/RbkM/ckYjYZ7e+zkTAfmndnL26lAyEr6QbI4x+7jVAHx
 XqkJDv2VIZ6jLidTaetzVD8yvkrwrGmE6GudyP2fYPv7ihN1eOva0yHLU
 +0oup9nkgXHBdW+mBP89ZuGAZQo3p80kY9Ti8J+hMGd1POLqiCFlvkrs3
 zBH8otwHR8kRVEdL59p82BgA+UkaWUgEf4ncOlISv3EPdnX+tvHwcGswf
 wPiV5o/decjFFdaNLqNFhC5HrI4Kxu45U9b0lm0xzwhRXDkjeM71jproZ
 jWe4LUzrS0MXLYYs4osi2kSltJ1NBoFSW5wh3FT/aTQJH82RPU7qn9GGV g==;
X-CSE-ConnectionGUID: wgbYgrwsTwCrviGm53UyPg==
X-CSE-MsgGUID: tckPk8RlT4qNstoIu8HAGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41081514"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="41081514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 02:41:03 -0800
X-CSE-ConnectionGUID: Tyj2d8R+R5ONROfWWN4ecQ==
X-CSE-MsgGUID: Gj350qMDRBmET6S1NA6p3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="136294206"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 02:41:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 02:41:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 02:41:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 02:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHPJpWs0Bnfiju/W0/ztjYE1DCozwe1Ewi6UGcqeHtsqctKyRvpaA2/TNmjEq0MFLEkx7OlWyJa7X7qQyIrUXFOUDjeqr4RGJ9JJskJ5ntHbwWwqRQfF046KhELsjURrukD7GllLzWHjSuVDC0URc90ByzBzV4yDiZGv0Xx8zadSIsM/f2gaXs1eAwJ6drFE/+byXSaZ4BhG4eYghUAkTq7K+7tCAsF4g3OVMVdfr0B5RTmU7VYkFwrDJbsyDEZAmC6oerQVvDmXZSfPRd6DawZJtHaNRewnXDtAkDJpK5crTf6Nbpn+aW1l/Qyu6SSylF3+4TSh6xqSvJTTQJvyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7q5Q5z2aPerH7PkDne21DhFeZHM0hsB2u4eR1NwVGwQ=;
 b=W4/VPpX32SlpVVa5YMFLMI73v6ljRJDuWOHLUqTUwaoNdeFzHRlhGsV5zgxQO01Hazze9MTPNjoKjRg0Km1NjmMnS1a2y2bipt6/oQFe9TSYIdKUanJUh9E3GKVplFk1iVPGbDnroJbkuoVzjWrldxpbgCBhiEqb6iXNuGKHrkYYjmQUKS1KMRfy4VYT4EXicBotYVrf5N4KUS6kK3YfjxKHMhoKJUZaUHO9SPQc0Bny5R73gh6TPWn/Yh+JCQ6w/2pYsSWMxThz4Uq/+Zel4SKYyShrGT4Uo7E/NAQ0tBOeAgP4ZcPpGB7ETft/3DN9qLOPFy7NEUfLLf+s1wEPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 10:40:59 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:40:59 +0000
Date: Thu, 16 Jan 2025 10:40:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Maciej Patelczyk <maciej.patelczyk@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: [PATCH v3] drm/i915/gt: Use spin_lock_irqsave() in interruptible
 context
Message-ID: <pusppq5ybyszau2oocboj3mtj5x574gwij323jlclm5zxvimmu@mnfg6odxbpsv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: ZR2P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 01de1da8-5759-4290-5e97-08dd361a43d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEhVQ3llS1BDakh5c0xMSGFGOGNzVDZlQVNkY0dBUWJ0MThkVHVZRU5PT3Rk?=
 =?utf-8?B?M0hNUGltL0k5NzRJdFM1SGZmVitYc2hMeENESURobDJtaFN0RDQ3R2t3elhF?=
 =?utf-8?B?UnoydURHQ3JBdDZkcHNmMXdveG9CejVvU2xaM0FXeXJsUUhXR1hNYk1wSDVa?=
 =?utf-8?B?MWt2cVN1SUc4MVZDaTBZQjZSL283RW1MbXFmSnZ6bGFrbkFzRVhJSlJvSmhK?=
 =?utf-8?B?QlZUWDVBekM1VUR6T01IRzVRTTg0elNsRFBId2pHU0g5MmFuVEVIUXlLaldm?=
 =?utf-8?B?VWp3MmZKdlZjQ3VIdTg0UkFLNGZQY0xyNWs4RnNDNkVlVEZNdmRGWGJYS2FH?=
 =?utf-8?B?bkJIOERTSFkwZ005TTR2SlRoYUpVVWQwSUdFd29PcFBuZ0VIZ2luVTVLY1A2?=
 =?utf-8?B?RHQ3TXNodkpiZ0dMOE9hc2ZHK3h4OGJFaXN6bndTL0ROUHZUOVYrT3QzSlpj?=
 =?utf-8?B?MGRSV0RzVDNlOXpkdHRNNmd0MUdnVUd6a05mc2lCa0pWbTVOZ3I0WmJJMlgy?=
 =?utf-8?B?ZGVTMys3TGFSZk04L1dSRGNJRm9uT21GSGxlU1FyVkkraGNLSGhyMU9LZUk4?=
 =?utf-8?B?Rm1HNGlYdkFSRHZoU2tiRFZqUkFwV0lLc3FDdW5vV0FmLzJRbHUxQjZHZkUw?=
 =?utf-8?B?NmRLQ1dEUUlNQnNuMDAxdW1PMEgvb0YzS0V1SjQwbVhpTkE5YWVvb2dlRmJ5?=
 =?utf-8?B?Yk4wUUtoYnVvUlRsck1SbDAvZTluam1hVnZZd05YWXJlMXlaRnFiT2YyTVhW?=
 =?utf-8?B?N3ZzejhoK1J1Q0dHRGNnU1lZbndMdmxsdVB0Q2hJRjFEVkIwT0ExZnUyY0g3?=
 =?utf-8?B?aE9MTUo5TzZncWZTUlpBck02VGIzN1NDNjMzR1NNMEp1UGhkbVZyQkk4OW1k?=
 =?utf-8?B?QnVkaHpQc095OGR4SUxBSkJZUDdscnRzOFEyVXBOeXhMZk8wWDBqS2FNdEF2?=
 =?utf-8?B?U21CSXFqdWI1aEQyWUJMUlNnelpVQ1lZVDhPTU1lNDBpL0ZIZXJMWjhqWmNX?=
 =?utf-8?B?ZFlYYkRrZDJETlFhc3Y3enVUTjducWkyYmNKK1dobThsY2o1SGZVR0ZIcGFl?=
 =?utf-8?B?L2JRb3JuYzYzUytNOUk5aXZKeG02RTVlN0ZNME0wZmZPNmNCRTlzc0hnNFVH?=
 =?utf-8?B?Y1NCYjBsb3ZFM3pnK3lYNVZUMjl0akQyQ3VsT2djMHd2WlNXNE5lN0hXZzBJ?=
 =?utf-8?B?ZVF2eGJjdFg1dTE4WHo4ZTB0Um16QzBXZHA1WXV5SUNEM2FkNGIwb3VQUmZy?=
 =?utf-8?B?c2tmSk11c2w4L2VwREVVQVRtbXNRUmxScWlpVnlYeFN4MkR3TEYxeGszSlk1?=
 =?utf-8?B?UitXZllreW4xb1RMNlgxdmhjTFQ4RUxBZzVnTGNvU0RlTVdPSElJa2dKd2lM?=
 =?utf-8?B?eDVoOWoveHMrTVR6K0dlQTNtTDFNUHYwQnROVFdTd3hsWWlzY3ZKb0lNWHJt?=
 =?utf-8?B?SVh4cFJBeEJxdzhYUmEvZUhaSEdYZUxYY0w5U3R6dXpxcUdDbHAvRHpPMmhN?=
 =?utf-8?B?VnAzdmVzZFY4RitnQmt5QTdsdlJTS21ZNmxYdVFmYWZwNWhxYlY2SDRyVWEz?=
 =?utf-8?B?TnlaVmhOUEZicHdlU0hybmUzNTFJWWJtejZScjByM2F2eVZjUERTU2RGNWE4?=
 =?utf-8?B?aWdzOTBwZzhIblYxejVEOGJ0V2sycTAzUitFTjJmTlJFTmJPVVkzcGpuc0pM?=
 =?utf-8?B?TG03bE9tNTRvbEk1UUNkcEFUSGFzSFo2MXYxU3VJUFlHOFd6NnpseUZjWEsr?=
 =?utf-8?B?dnE2bUU2RFdGKzhsR1hqZDI4N0c0SlovbWZERUpETUJXSFpkSGtRdmFKR2cx?=
 =?utf-8?B?RlRRTWFxWG1nTGQ3c2VLUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0lTQTI1ZUxoQkdoV015RHdnSStCZStOVmw2eXRKRWlsaEpKK0todmNYVDBC?=
 =?utf-8?B?UWg1R3RmVytJdHFzQjk3SXMwVThMWE1Ub1JDbkMyZ1lIcVpPWDZiV25VSjM5?=
 =?utf-8?B?bkdBN2dQUFlxZnlzMzN2SFl3Y1hWaTluQTJWMEJSdS9hWW9rZEdod2NnS21J?=
 =?utf-8?B?UjdqVFBxS1lnczNUaFRRdFU5ZkpPTlBPcVYwR01TcHNENDVTK242dWgrZ3lG?=
 =?utf-8?B?N2dPYjREY080U0c5RWxoczg2bGJYUjluRE1pTWdVNTUveDhVSWdYSmRNV0cw?=
 =?utf-8?B?RnBldUR4TFR1SitxNU1XdEUyRW5BVmtrR1pEY0dpUUF4SzRnM3A3cVZsZ05D?=
 =?utf-8?B?MWU4R2EvVk1rRlBFOFdpMWFmZWQyZGdJUnROT3NWR083SG5ZZ1RNQnVVbHNw?=
 =?utf-8?B?R1VjNVVmZnZjckxTc3VGT3h1R0M4dW9iaWFGS1VydVZoSzBqOWdOL0FZQnNk?=
 =?utf-8?B?U0xDajVxM1dHWTVMeC9uRXBLcmg0bFRCSjZ6d09qa3k5dUViU1IwWkxKYUtB?=
 =?utf-8?B?VE8yU1hsbzJabmhFRXM5aGJvZm9KRlpYOTVLNHRjSnAvajFacnZoeG5UWjZm?=
 =?utf-8?B?NG5XbUVhczlnbUxaWE9ha1Y2SW9zazN6dExQU1VlYVI2MG1KMlBIVmNrV3V3?=
 =?utf-8?B?YVFIWDUzMkJma2Vha2hBQzM5RENNN1E3TUs1N3NkY2t5S05xT3doZzNRZlNh?=
 =?utf-8?B?bVJWaGdtcVh6U1JWcjZld2UvdjlubkhFZUVZSmd2Z05QQ3U4Y2tWbzZNbTll?=
 =?utf-8?B?aEd5WHFvNnluOGgzeGJGZFJpN25XNDdLRTVEZ1BzalAvZTNqcDg5OGxVSDdX?=
 =?utf-8?B?MHFHbExWMm83WmIveUd0Zlh3S21PRnN3bjZWU0RPVXJDREZOcGx6eGUxczNy?=
 =?utf-8?B?RXFyN2d4cmttWk8xVGdCU1BQUm1ScFVKUVhhelZYOERhKzVMaWxvL1NxVDRv?=
 =?utf-8?B?allNZDdXcXFNd3BqRVBBblJ6L3IveVVGNmFaQWJwNlZpaDMrUEFIRHNNRStI?=
 =?utf-8?B?Y3FmMG9FZ2w5Z3puUk8wNzVHVFEyamQ2bndkR2FScSt2NVFVOEM4aUVLb053?=
 =?utf-8?B?OGhGMEZPR3FESy9MOXVORzAvTnN6YklXaHhDb3pMWlBHQStuUFdjYTMwc0Iw?=
 =?utf-8?B?YXA5YjF4ek0yWHNpMFBwRDRMR2pMSVpoeERYdFRWZThxbEhCL1czQThtU3k3?=
 =?utf-8?B?SWNTNENHK1JaNFc2NGpZa0FmaHJ1c2FJa1c3elBRMzVaL1BFMjdlM21JbXhu?=
 =?utf-8?B?SkZjUk8rUU1FbW15bGdZSXFTNXl6bW1PQWNzVFFWWG8vZE9YMHgycmdTQkI5?=
 =?utf-8?B?ckxoTW1GOUhjanYvdWxRUEpROEQrclpYeWJXM3ExVlBTRDhsRnJMS3E0V1lR?=
 =?utf-8?B?KzBWcG84SGw2MW56VDk2U3N1dUFIeVBYa0t1cDlKclhKQnFtbU9RM1pXaWM1?=
 =?utf-8?B?cDc3WWJhSlFLMWM0SUFhWHBYc1gxVWlBV2FrcmFDTUFhOW5RWXlsN3lNOFlt?=
 =?utf-8?B?Ujg5LzNxMXFscmJ3MFB4WmRzNGkxRmpZb21sUzRDdjdFRnphUVlKVEZudzlZ?=
 =?utf-8?B?SkJXVk9RZGVid0V2MkxFOGNOVSs5YmVYSjF2c1ZGRjhtc2t4aHpnYURTWWcv?=
 =?utf-8?B?UTFyUXB4VTd3M3ZqQ0lIUWY2ZXd3RDAxTXRvN1RxUnFsejMzVXVhbytoU0Rs?=
 =?utf-8?B?UWhxb043T2xENXFJaDJtdWFFZTlXMGhIZTZXdXNWVEpETE1TelRTNnMyd3Jx?=
 =?utf-8?B?QjRUcU10eCt1djd4R2hscnRHcEMxMVhPWVh5dXdQc2thQWkrQTNybWRBNk5l?=
 =?utf-8?B?UVExRmJzQlF1bWx1SUl4L2J1L3B0d1l2V3dNcmlyTWJRSHplMG1qMmI3STJF?=
 =?utf-8?B?K3gwN1p5Ylg0MjhtdDlYMGRqTzB1OFAvRFFQZmR6di9CVnp1ak1qNUNFNGsx?=
 =?utf-8?B?ZkRVZVkxRFBadE1zMHFmWGNKTTYxY2E4dVhsT0srSnM4MHhqb005dWtMSVJv?=
 =?utf-8?B?WHg4TUZXNGdjOFp0QnhBd3BOWWtUVlZNYmZJMkZxS29tTU0xeE12YlpwbjMw?=
 =?utf-8?B?ZHR2OUFXYSt5YVhLNVV5d0djTDI4QWFzV1k4OHFHYk5ILzg1WFZIeTl2ZnNn?=
 =?utf-8?B?blpicVhmMjMySXkxK2trWVdvNlZsYXNpYTZnNHB0cTNDUjBvWjhCdFNRL2dv?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01de1da8-5759-4290-5e97-08dd361a43d5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:40:59.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUvL8+IIhPCYKVjgYoz7IDTITaBxk/bV8jKPz8f8DZb2QVvQUL9LE951NjX6mGxd12JqAsCRrEjHx9QzNDTnauN11zkRx3I1hsU1+aklZwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
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

spin_lock/unlock() functions used in interrupt contexts could
result in a deadlock, as seen in GitLab issue #13399:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399,
which occurs when interrupt comes in while holding a lock.

Try to remedy the problem by saving irq state before spin lock
acquisition.

v2: add irqs' state save/restore calls to all locks/unlocks in
 signal_irq_work() execution (Maciej)

v3: use with spin_lock_irqsave() in guc_lrc_desc_unpin() instead
 of other lock/unlock calls and add Fixes and Cc tags (Tvrtko);
 change title and commit message

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
Fixes: 2f2cc53b5fe7 ("drm/i915/guc: Close deregister-context race against CT-loss")
Cc: <stable@vger.kernel.org> # v6.9+
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 12f1ba7ca9c1..29d9c81473cc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3433,10 +3433,10 @@ static inline int guc_lrc_desc_unpin(struct intel_context *ce)
 	 */
 	ret = deregister_context(ce, ce->guc_id.id);
 	if (ret) {
-		spin_lock(&ce->guc_state.lock);
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		set_context_registered(ce);
 		clr_context_destroyed(ce);
-		spin_unlock(&ce->guc_state.lock);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		/*
 		 * As gt-pm is awake at function entry, intel_wakeref_put_async merely decrements
 		 * the wakeref immediately but per function spec usage call this after unlock.
-- 
2.34.1

