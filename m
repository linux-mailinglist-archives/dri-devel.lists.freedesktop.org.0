Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E6B9A971
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB7510E23F;
	Wed, 24 Sep 2025 15:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P77rczDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE8510E23E;
 Wed, 24 Sep 2025 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758727451; x=1790263451;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=n9SQy/jdvLQmHh//tP7OxMfr9Y/FKpLJhqKNKOlC7Ig=;
 b=P77rczDlW2AeA9MwFUsWSAa10wMzFXrn1OuA91LJ6+Gmj5ecCzcTA9zj
 3seDATWwtcrKNvbYYxzYp9Lhw6eJTXEiizPVkZT4lrOeMVcQap6BqmVr8
 c1aiw6HmBbpv2jIYJCV8zkPHEjqxPVRsodNXrivexMY/W/xXpxupcfQ8t
 HhRlg0mg9SIRrfeTj3LCrRIlrUTFvXXsI13mq2JzSOAzwN5z7fjt0Uo5T
 ryTV6bmUEAhf5elsztXT7Q9clFedMR5F63EdW56dJuw3rcQprW8HJx9eT
 7/YzDYQajeEYWvVACx2ch7Ie27CLijMT0THPhpYIligp+UcaUI/OLICs+ A==;
X-CSE-ConnectionGUID: bhZQHPLeQ6ap265aDktbtg==
X-CSE-MsgGUID: sPN7BKsCTrSmkopSUWuzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60942474"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60942474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:10 -0700
X-CSE-ConnectionGUID: HddsAGFGQQu+XnyzBm2tmw==
X-CSE-MsgGUID: ETO9Sh+XS/u0qUr0Z0pS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="207806655"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 08:24:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 08:24:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 08:24:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buSWovn6SYB6BI3M3wbieJej49EZRPnmG9sn9PFint/wpyV95LWo0T+ImhMvF7ozP7wQmi6EhQa9k+UJcfJ4bQ4cwNJZ56Ud6wUjgmDRrAp1ZMdUc1KU5oqOVBTrtktJpubLSP+G1d1Tf9rSkeZ9UvGayrPi/3A/soN0FN3dYbkvkCcEfoZJrItxh3SOgTtVEsPTuLGRFAoP+/hcK1AxipZ3EKWroRiv8uTbWoqkEbTe+nLAMZzrGTwzjRzOAbdmjR5JcvP/KVnd4SJ5EspKL8AJIM+LqwHHmz1TY51h0544VL+n19ugIFPesDv3Ias9ngJHlI/tAmmVlHE1wX3hvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkz+BtQ8cPuUfquwV/27xlpnqgaJOM/zBOOX1hJwPvE=;
 b=qc2/mTKXmqPPbFJi99LBf9unyzLT0+oPvonTar8lSXE0eiD+8Dfzvw1OLABwCMeo8CS3+T8Xlvp+VVwutmcBEbFvls6vB8VjTZf6fUPTUcAM6hmQyTCmbFNRodxm3fw6iYb8xUbMfSDJS5cM3QWCrUrrNwt3877RsrSKDlOmm11u5j8XWOo4eqqDDEarp99pURPoVuoTAtWSyvkwtLPhLx0eaLK6aH0Ty/9udy/b3iWy9kQpZR1WSPuD+qFQibCj1NFK8hA8Mniz1UOGYauu3x5jD+TMj+zmTsH/b0LjF+jygmcr17Wfre1dALA8+079JQy2W3v+rL2pWjZwUfGN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 15:23:56 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 15:23:56 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Vidya Srinivas <vidya.srinivas@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/6] drm/i915/dp: Work around a DSC pixel throughput issue
Date: Wed, 24 Sep 2025 18:23:26 +0300
Message-ID: <20250924152332.359768-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca63b98-da70-4769-fb2a-08ddfb7e6062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzdkbjlKaERGMXN6VUREZWprZE5jTmJRZVFoTmJvQnErcG9oRDlOQWQ4S2hi?=
 =?utf-8?B?Y1N5ZHNtYUtTMzFMQnU1TWtJNS96ZzFMMWx0TnFmZHJOQUp5eTB3MC84OGZm?=
 =?utf-8?B?TlRoMG01ZlFqaFhQa2tHbFFvZ0ZqT2tqdHI5cUtsQjQ5RHVtTVd5aEVuRlhB?=
 =?utf-8?B?bjlUM2xmOXBSSmVtNGcyc3BTSlE5Q29FaVlhRzRuTkhyQlowVUhZWnc2d0V3?=
 =?utf-8?B?dkh5ZnBsTndIbG1tNFVWMzZTMWpYNlVtVHlRZUg5cjRvdWw1Qmp2TTJoeGlP?=
 =?utf-8?B?RTMvRDNKbDVpYTBwTTllY1FRNGZybXNrZW9XZko4clJLUEVUZFM0b0dVaEhy?=
 =?utf-8?B?UlRCRG8rRFhoM291UlNiZ0RUUS9EbDlFNVVHR1FYT0xkVS9pdFdVdnk3MUJS?=
 =?utf-8?B?NkNqL3J0SGpoVFdhWk03MGhYTjJHanlJRWs4b2l1YnFHMzBJY1ROYk1KcGFD?=
 =?utf-8?B?c1BLdjEybkxEQVp4NTEvRWdyQmZ2WEkyK2x2ckgwQklRT1MwazYramlrZSth?=
 =?utf-8?B?UXhyckxKR3BEWnlNRHgzZzFJVDRoMDVYOUNKd28rODdFQW9Jd0NYdE96VmhU?=
 =?utf-8?B?RFpwNng0dzBlRjdYeDRYYWRveTYxZmNiWlVka0o0NmR1Q1R3Nkl3MDJ3c1kr?=
 =?utf-8?B?aStvYlNFM1N1ZXdSM0E1Q09FVjQyN2lGM3J3TXJsMFhVSE5lRGlTMmVQZzJP?=
 =?utf-8?B?ZXBUTXNVU3JtNytHdjY2aUROUUNHYlg3emY5WTNUVnd1QWZSOStvQVlLT2VR?=
 =?utf-8?B?YUdzU3Azd3B5MWptTlh1Q3dGd0s4UzN6S1FLMnhpZ0Y0Y0Yya21MWG9ERHhX?=
 =?utf-8?B?YWtzWHBuaXN1Z2RUbUtEYWVxZEJhVi93NW5JdGd1NkxCTksrdE8xZGNEc1cv?=
 =?utf-8?B?RFJZVEtSUnF2eXhWUDhsWlEwcnU4Y3NBRUU2SXhmVk9YWk40c3RlajNpZUdi?=
 =?utf-8?B?Z3F3YVRRQUJiWUJKWFpjSHpFalVFTjVtU3lwaGRCU1o2aEMrbUVHVXRjUnBh?=
 =?utf-8?B?bjhzejdVeEEvRVhXaDhsaHh0UTk2T0FkL1h6L0dzdG1QRklldXlNTHB1U1hT?=
 =?utf-8?B?V2xYMU1jNzBsaTVYV2RHV2h3QVRuNE9QY0FTaHlFbDlyWmNhTncxdU41SW5l?=
 =?utf-8?B?RFAwb0RCdXhkLzFYbTlIa252K1BhQ3BkVll6MDJKMUZmd1AwT3pUeHQ3OG5B?=
 =?utf-8?B?ZU5YWFJmYTM1WWlkUlFzeWNZZ1Ixb29aT3d6SjVhRkxEc3haUzlTRWtVSi9F?=
 =?utf-8?B?QzczNDMxaUJtS0ViZW5DOVFkSk1aaGFOZG51TnVUVzc0Q0tST3lSRFI0RHVJ?=
 =?utf-8?B?Wm0xREo0WFpCV3N6STYrT0VQS2VsVDV6enB2VFZyWFh2RUNMTEZ4Wm4ydkNH?=
 =?utf-8?B?dzZrc3dQcnBGTDROa1pKYk5RMlFZWHluaGg5ZERjeDJheE1oU2MwYkY3NHBy?=
 =?utf-8?B?bGZzTmtFZVBTNHdJNkVZRVhtM05obGVmRm9aUll5OWdHcnc3WE1ETnIwVnM4?=
 =?utf-8?B?bmN5WVUzZ2J2VVZkSVZYNkJGajV6UlQwUjZlckY3YU92UlkwM0toK3cxRUNw?=
 =?utf-8?B?N3Y5YXM3OFZVTFMzTGRVOVdHWkozY0NndElKbjhjdG9xUXVMQ3ZhRzlMY2c2?=
 =?utf-8?B?WGZSa3RrYkZOQk50ay9tWTNHQjd5dFBpakpaQmg2V2ZkVm5qNHorYTcreTJa?=
 =?utf-8?B?ME94Z0duc0hReW1XWnAzVm9zb2hVb2NsWFdJT0txLzFJRjRRRTV4VS9BbGNV?=
 =?utf-8?B?RzBVVXpqcWFGVEc3NXJKUFh4eFU0UE85TGJPY01aSzZqektXUXJOV1BWNUVa?=
 =?utf-8?B?L1c3bC9iMUp2WXlGb3dVYWFYTCs0clRmTFo3ZS95c2JJQms1QmpJb1lwRmQ4?=
 =?utf-8?Q?8yz7DAWbqThvo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnBXQlVZZzF4R1gyZEcySTRGZDVSZHNsNGUzR01ENWFVZzYvZmM1eVlXZGt2?=
 =?utf-8?B?bjZTa0NpNGwvbWtESURuRnZXdXUxRG1vVTU0S25JNmsrdWZmL2tqRFcrWWcy?=
 =?utf-8?B?NG42R1NqY3JEbTIyV3RIT1Vqa0dEVlptVWNsNGp4bitOMnNvTzdweS9ENHh4?=
 =?utf-8?B?VDFEMmVsTkdyb28yV2dEczcxVGZ2ZzJYUGl0UVVQZUFnSTFFSU13V2ptdnVX?=
 =?utf-8?B?cm54cUQ5ak83azk4bXZpTitBbXgzQkFVRjJkRDRWNkFTc3hnemMyZmUwaFUv?=
 =?utf-8?B?NGFyWUxCeUVXVzloL2tpY2k2ekxzR0ZxM3lQeGNhQnhXaVRSdzFua3FYUXl2?=
 =?utf-8?B?U3YzSFhxUTN5OFh5WFlzZU4vR09TV1Rsb0hSemVLYmUzV2dVZ0lzQ1dHVXgy?=
 =?utf-8?B?K2lrd1RQd3M0eWZkZnRPUFl6WGVCbjcvWWlTL2tldFE2R0lZL0FXSzdCZ1NZ?=
 =?utf-8?B?RlJjUWlpd1Z1aTVrUE1kY2JCSWlqYnBNZ1JpZ3lacXhKQmxFamJrbFVoWXpN?=
 =?utf-8?B?c3hyVHFZeXVvU0M3a25WTWIvWUxwcnF5NTNOdWRVT0t2WmNYOEUvMzhEclcv?=
 =?utf-8?B?UnFlTzhtcmhYeHNZS2cvTzlJOEVFeHVCSGQrVkcveU5FUmJWQ3VNdzQ4U3U0?=
 =?utf-8?B?NTBlZlNtUVBEdHphaUo4Zk9HdTVZT0E1cFRpNDhpVitodHNxemdXTDRxUFlB?=
 =?utf-8?B?cDQ3NnZJZGZIMzVVSXNDcnBMcWEyNTRQUmZheDR0Vll3MFpSTHBjQUdSTXA2?=
 =?utf-8?B?bldVMjRRLzFiOTdLSWgzc3hIdXJDVnh0SDd6YzlRSGxSeWlaUmlPQ2hZTnBy?=
 =?utf-8?B?S2dTYnB5anNaZEoxUGlRM2tCU3huVGt3MDJYQk94NS9QVmVSc0tPUkpmS09x?=
 =?utf-8?B?dTMxY2xja1hYVDBNQkR0SE5qMnZiU0VyeGFGcWdNWnB6dXJrRHp4NFBhd3Vo?=
 =?utf-8?B?WGVhdXpNclZzS3hLRU9PVHl5dEg4VDBCaFNpVC9XVnZUVzlPdUtnRDUvVTRB?=
 =?utf-8?B?SzlOMXFiblVPeTJ0K0dUNmVGRUx5Vmk4NFFwTlQ2U1pmUnI5Sm5INkNlV1Vj?=
 =?utf-8?B?SVUyejJRTlpMSXJZZmdRTTEycmVPVnYzcm1VbWZaMzJHT1NiRy9iNnlCN1dq?=
 =?utf-8?B?Nmh0QjFtNXpSZTJRV1g0MUZkNlJDNEtVMTA5V3I3Wlo5K25aQ0Nncnczb3Bk?=
 =?utf-8?B?dHpjZmVueDJGb0tRQng3ek5kakNoMExEQm9mZTNhRGJNMkRUK0tLWXVxQU42?=
 =?utf-8?B?dEIycVFGUitqYStocy8wQWI3YUZQcTcva3FRSnptdDRVbjdXWWNXRkpLZHhC?=
 =?utf-8?B?d2haeG1wYmVtT1Z2ZFlCb0pVa1k5QjlrcjUweE5SMGtEYVl0MFQ3Z2UwYjRS?=
 =?utf-8?B?anJuYWhzVVU0NjZpZVBwa1ZwMDVyTjFrNmFaczhzYW10TlJwNTBWUFN5cDJO?=
 =?utf-8?B?b2ZpQ0J5dzhjcjFXd29ndXlBcXM3K2hZclU1VlR1cHI5ejVOZG1BKzd0T2o5?=
 =?utf-8?B?U1BHMXZtQUZvVmp3L2YxdGZvblpGOTdwZG1HSGk5L0FYNk94a0o4UE9TOUh0?=
 =?utf-8?B?NjV0dThtZEJ1R2JyS3BrSy9UWkpDVDlkTUx4RTZYR1JmWkk0Z2tYWXc1VXlv?=
 =?utf-8?B?bzB3VnR6MG80L0dxL1hWRFhmQ3dpQzUwbW1Rak04L0hING40bE5sZENHdU9Z?=
 =?utf-8?B?K2hmRTQvNUhjM2M4WHowRXJ5bHozc0pwTUx0eVpNd0w4MFQxUUwxYVZUZVpq?=
 =?utf-8?B?ZjhPYWpCNktRRU9FTGpUNVF4TThEMVBaems2SEVEamhQdys0VEVMZHhNdUVl?=
 =?utf-8?B?Q1N1Q2ZGRXQ3cDcxQzVyMFpNOVdQd1BuV2FPQ1ROY0h5SzFncTI5Y282MlNl?=
 =?utf-8?B?S2pEeThIUlZIaVNteUFyMm9iOWZxN0IyV2pWRHl5KzhlanFmZVo3YURTbEYx?=
 =?utf-8?B?UFo4RmoyNUNSZVJFU1A1MXhFUGpuSUpibXJCMjN0V2ppUHRNd1B4bVJCY01O?=
 =?utf-8?B?RVpZMUsxSUtrSXhKcFlEMW94cEhCemRxZ2tBeHltaGVoa0ZIVVRnODVuMlIr?=
 =?utf-8?B?aXFFMVBlYTU5NGo1cHlJOTV6ZVhZUmtCWXZnSDlrUHpwZGZHY2tXQ29ocjZI?=
 =?utf-8?B?Umo3akV0VEpVTXNWM3d4R0RFVGt1ZFVIYVlpbW9zb0kzWWlUS21LMjRtTDFn?=
 =?utf-8?Q?KsnklHl3fAuQs9WnNgKs0hVIDashF3AGm4ba3HeVJe7E?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca63b98-da70-4769-fb2a-08ddfb7e6062
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:23:55.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s513kTGpY+ntG5FHaERpcgono8c9iDWlPY7gnL6QOtt4Kf1edtJqQiFoHDQ4EVZkwhVqRL4UgWvqfTM/KVfXCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
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

This v3 of [1], addressing Ville's review comments, moving the max
per-slice/overall DSC pixel throughput and overall line-width query
functions to drm_dp_helper.c .

[1] https://lore.kernel.org/all/20250918211223.209674-1-imre.deak@intel.com

Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org

Imre Deak (6):
  drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
  drm/dp: Add helpers to query the branch DSC max throughput/line-width
  drm/i915/dp: Calculate DSC slice count based on per-slice peak
    throughput
  drm/i915/dp: Pass DPCD device descriptor to
    intel_dp_get_dsc_sink_cap()
  drm/i915/dp: Verify branch devices' overall pixel throughput/line
    width
  drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk

 drivers/gpu/drm/display/drm_dp_helper.c       | 137 +++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   9 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 141 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
 include/drm/display/drm_dp.h                  |   1 +
 include/drm/display/drm_dp_helper.h           |  14 ++
 7 files changed, 302 insertions(+), 14 deletions(-)

-- 
2.49.1

