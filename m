Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4EBC0A15
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB310E5A7;
	Tue,  7 Oct 2025 08:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaeYtXh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313410E5A7;
 Tue,  7 Oct 2025 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759825731; x=1791361731;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=leIHb2PPLfyvk8uus8epYcf1gNwTWJYiZsShVuzFT8g=;
 b=AaeYtXh9Y8A7Daa4Zh1ft66QltKrABqf2Ney/BKU9sq+zsLBGG57XzLF
 VVQacahlJeBhcr9c3xxM4j7/qJ/vghlZL1/gwkekj75PfTTddT1NLT3Ko
 Q/x/mAOzOmtYv+VGYtD0NveAkmB2FObSTBhZGK2a5Bhqa3Efn8YUhrmdW
 6KxidugAoZjFnEpgOq4rqeR/KQamWLFmVsow66cBIA3vRKqgpOsDdIPwS
 uTXdnVfGJhLbWN7RnCV29tu0CanAkeZaNDNiuw3JZceAevZlvSOCUfJ95
 NJq0G0UHWxM7gewtYw4u9p7LFxe6gF9LWGT8weHywKhX1GbEAEMbqO1es g==;
X-CSE-ConnectionGUID: RtXmSXPrREWL5gM5FvwgwQ==
X-CSE-MsgGUID: wrIkLXM2TaavFTeUjj3aWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65834581"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65834581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:28:45 -0700
X-CSE-ConnectionGUID: IABuhzeJRAq+g12wWEHkfQ==
X-CSE-MsgGUID: nXWZOgAxRGaWVD8ZCoYgQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179372483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:28:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 01:28:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 01:28:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 01:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKz20FP8/KvACuUlHapo0xyB3zkk0/E7jwcw1qNIj1ryrxvQD5eyOAvSmgRyNQFtVDMjxv1riaFHoods/pgoDu9Fxx4ENNvqSmnsgcWRR77W5XRbAI24Vs3TOidAnMQIn1AnYbyfjO6ziq+DWtICVVYzkpRPHjGOVXXgQjr9la/4w3wXhS00lWoT89WUUlPYMCau0Yx965Wzy1mwKyHg61G8FN+z17QgHvbCtdqZi30HGiJsarCDcMcLPRn9WWLbXlAxRzExnQYU3L9eAMl9NLRjse0pgJW6QIlkiHd0F257bzDXirMjDJ24hC6DirEH3WgaP4yTmeGSk0eFdXWm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM1UYmcXds0pjcT55eGtPbo2akcqE2p1ibqvQ8HjqgI=;
 b=XYKVO7nfA4Yetthq1nWh0KGSYZmv8+u4MD9zO5JDso4asDUULD79R6N9rBCBQ2wEWFBgK1QBubjJ+pNOu/ZrnBMShM4DsOCPxe54bKv78l7vGIiSmkev5MmI2l6cENmKe3lp2DONzRFvl6cpy4P6QSjckUIYgbE8coCjpP02SoAq9SAyF5RKkX/8fh1QWTw/o+FoDyrkknjAI0Z1oytG4XYN0eoxiZP5Tbrkt4jiXUHRT0VG4nokzheaEHk9Rnp9H535mdy+LFCemGtcIT5ZK703wcCILtGwE+EdRMZ04uDWpF2hvOpSH57e+ZmEuM3dfRr4tCRoNPd9Xoc7xXaQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:28:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:28:37 +0000
Date: Tue, 7 Oct 2025 01:28:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <alexdeucher@gmail.com>, <dakr@kernel.org>, <pstanner@redhat.com>, "Philipp
 Stanner" <phasta@kernel.org>
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Message-ID: <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
 <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: b83e62c0-15a3-423d-c7a9-08de057b8320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXhiVkNvaXF4Ykd0K25ra2U1RS9XRWlIaGpIR0daZjNJRW81NVY1ZXVCZUZy?=
 =?utf-8?B?VmcrcGZjVEJJZjlpN2N5ekYvQXppSnpLdWN5T2pqZnpQaGV5L0tIdUJCZ0JT?=
 =?utf-8?B?Sks1MkFsaFNDZWttZ2p3Rkg3clpuQ3lMMkNqOE9ZOEJNZjVxN1BzaUVRVGk4?=
 =?utf-8?B?QWRZbG1UK2hIa0lubkdJTFdrdDNHQnp5Y2FrbXVTU2RKcENFRzJ5d1Z6MG9H?=
 =?utf-8?B?cVdENDlUS2I5Z3VxM01USm1yNmlPZEU4dkl0U01yQ2J6dG5jZnVuR0pNQUll?=
 =?utf-8?B?enMxQ0tKYlRqRW5YZWthZlZqaERkNXNkRkJmQ25ZbHZEaFRHdENaNzNSVVdP?=
 =?utf-8?B?MGhrdzNxYmQyeEZhN1pkRVdTa256R0tITlZiWTJIdi9qOUttekdMUEpuVEJE?=
 =?utf-8?B?N2h6VFRZYlRIQjQ3eGtnL3p1N3k3S1YwOFd5b3ZrSVFDZnJadVpvcThLR2Zn?=
 =?utf-8?B?Q3VVQ2praElJWUxWZmtoRlg2M04zT0NxaDRhSVNzSGVGQlNIVGUwczVKYzNr?=
 =?utf-8?B?M0NCLzgyMU9pZ0k1ME9ZVmVVcWtyV016T1pRY2NGV1lEOENnYnNlSkR3ck9a?=
 =?utf-8?B?NzhzTHBZWFUxd1RSS1VmZHltMmV6VnhncHB4eXd1Z2JBN0I5UUNjeEVRbjI5?=
 =?utf-8?B?Ymo3Vk1WL2ZnazhGKzgwc1lJWVdlRGJFTE4xMi9CUnlTbDE2WlpYdlJQNWNz?=
 =?utf-8?B?b2Y1QnZkL0FnREZyTkNtaEk3QmNEODVoZmNkYUZReUFRVW5LcVhMaGluSG1O?=
 =?utf-8?B?SitxTkQ3QUNCaTJicllEMXBOWGp3MjNMTFBGQlE1MkVUd0w0N2RUY2ZEeVRF?=
 =?utf-8?B?N29Na1BUOFJuM25CczZqNnpuR1EyZERhTHpIaENQUWZFQWRrTTdlNW1xa09k?=
 =?utf-8?B?aFVaVEdHdzQyRURuYVFWNkRNTkl3WEhyM2NrME5LU3pLVHdNM0FIeldnYWVS?=
 =?utf-8?B?RVo1T3pMRlNheVlCNE5kTXdxTDljWjNrTld5ZnROdGtKQzNvYkdWTzBVaEl3?=
 =?utf-8?B?bm9rdGFDVlo4SjRmNWxHYmYvMFlRcmxLdDR6UEkxK1BNS2xlRk0wZmVsWVJw?=
 =?utf-8?B?cWJ2bG1waHhCVlJZZnVTQlovOWoyQWtTU0VqTS9QZEFSeW5QcVdjdkJqQUF5?=
 =?utf-8?B?b3JtOHVnVDNES1BlejkrN24za2NCTkQrbVR3a3Y1QmJZV3hHdStxVFJpVHB1?=
 =?utf-8?B?VXpybFF3WmJYL0xFSHREZ3kvVlRwWHJvOVpIYTFHYUNUc3gxQzkvV1I2cTJG?=
 =?utf-8?B?SXg1bDJTTHlINGVFQlBxNjZERlhXcEVYMnNTaXhrMVJuNUhteXNFU3VMUnVE?=
 =?utf-8?B?SFYwbDQxdnl4TEt3R1AxM09MZmF3aVhnV0RYVkJwcGhab2dkTVdlelFBditz?=
 =?utf-8?B?N21ac01UM0dYdnpaeHdFMy9tYURDeSt2M1JydGtDbzVxSFJzMlJnUEluSzIy?=
 =?utf-8?B?QlZwSlZ4bUovMFZOS2dtaHhKT0ltVU1KMEFOaGtxSWFrTnkzV0J4N0F4MjhJ?=
 =?utf-8?B?eUF3RHBHcFdoRnJ5Wjk2SUxtYUZzYzlyL2RBdU5zaWVZR0VTNDRkK1ZTUEMr?=
 =?utf-8?B?a0xJN1B1WjFGaHNwZUx3M3IvbmVuL2hBSXpzcjJlanlJbUg5RTVjYkdJL3A2?=
 =?utf-8?B?WjdCdzlQaXRmbHdXRTlWMjJoWjFLL3ZxeitQVzFoR2UrT0FFNVRlTUYvOW0r?=
 =?utf-8?B?ZjRpK1lZNmhhbCtmL25tV0hrL01mbTVJY0x3RW1YRWdwQUEyVzREUlp0azgy?=
 =?utf-8?B?SXZJdUpBQnhmOXVDUWVrU1JsTkZkY2RhYlZUWFNhTUJFdzBzNm50MXo3R2xX?=
 =?utf-8?B?Vlk4VHNOV0hMT2lIb045bDlHMDA0TG54dDdMT2lINUVwY3c2WFJNL3BsUVdi?=
 =?utf-8?B?eXdtREVwcjI3MUZZZENVSWlNYk9YNG9Sdi9OMEorT0R4Si9wak5vWXJtRGJW?=
 =?utf-8?Q?zBIPO7tVVlEGY53m4rYci/iIyEk6bWvR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm0wY2tUVWxiektNWWtscE41Qjd0R2pDQTg2azdHcnEycCt4OWlsRzNWZ1BN?=
 =?utf-8?B?dzY3eThOak1jYjZnRDh4TDl2VTFzSjN0RGRhWkk1RjRBWkFDdmpLOGo0YjZZ?=
 =?utf-8?B?YzdrMWNBWU1HbWZUTW5mT2Q4UUhVaW5qNm5qdkpJOXkyWU1CM2l6RHVHclM3?=
 =?utf-8?B?QnlCQ1kzc3hiRGtxY000bXpQUExVYlU3TS9jZzRmdDQxZ1dKUjZ1TmVPNGFB?=
 =?utf-8?B?WTZXVCtYREs1ZWg2OVZCTVdsU1U0cTlPTk9CdkVuYU8wWENPeUFreThUR3cx?=
 =?utf-8?B?TGhpQWRoV3R4ZVBzaERFZHBqc1JycHBnWW56eTdIVngrekJhajRHNDBXMFdZ?=
 =?utf-8?B?ckJZR1pDVUpvSjd4K1JBRlFYTFVCbFdwY2djR1dSVUFxOWVSaVFURDhQUmI0?=
 =?utf-8?B?SnMyU1RVSkJQSzd5QmpEektJY0NkTHFQY085dFJtY0VDcUM5SmxWL29MaFR6?=
 =?utf-8?B?L1VvY2NWRTNZYnQvR04zNzRCc1ROaTU1dDVBNkFMaFkrdmxUbGZzMTZlOWFz?=
 =?utf-8?B?dGFHM3ZFVmM5cmwwcG5sb1lSdmRrK0JJSzU3RVRrSzgyL0REdWNMUTVneFMr?=
 =?utf-8?B?QWFLS3Vmb2RWN1EyNWkrVHg5cURNcFFMc2wxb2lGMUJ0RXg5aEluK3dnV2Rq?=
 =?utf-8?B?NUVtU2hHQnJSSE96V25MRkFrL3hRRGg3MXBBMkxSREE3K2VPZWd6OFRvK1hD?=
 =?utf-8?B?MlAyak9BbENiVnhQVDBTSmIvOHdwY3hHdTJ0SjkxUExlWTJpSVpIQTFCMVpi?=
 =?utf-8?B?NUMvZkN5cVYyVy9TWStNNCs1d1NaMzVXWC9JamVFOU1CQ2padHhYSHFhWWlY?=
 =?utf-8?B?c2xnSnVJM1JiaHAwalE3NWVCbUJ4RTJBSVJFL2lrU3UvQmFLZ2V4SUdVZWt6?=
 =?utf-8?B?VFJQdEdYRys2OGYxRkhOVEpENnZma3B5clY1UDkxT004ZjhKWTFwRE42bjcw?=
 =?utf-8?B?eWx4bjRFeHczbTQ5WWV0eGl4UWRzdFVDWnFlR2Z6MjBUU2lINmRZamZzZkw1?=
 =?utf-8?B?cjVrczZTUkRXZkJZaW5acTNIbWVWUHR1UWk3d3JldlBhZVRLdkpjRHFwN2Jt?=
 =?utf-8?B?TTRuMzNsVVdzVU9SMG5nazB3bXpZNmRZWGRxUXRCQ1NuaEd5aVFBTDNYRHVJ?=
 =?utf-8?B?N0taVWFXdlF6aktyRTRxakt2eFRGVjBFWExMOE5Wc243YW9icGJBNjZSMUxM?=
 =?utf-8?B?cU9LK3Z3c0pSU3ZvL2JiZkQwSllsRHQrdGRNOU5mOThFcHNJb0VRKzc4b1ZC?=
 =?utf-8?B?SDNGT25JcDBDcVExSFArNktnbHQyZ2JXUW4wWmlVQXYxTUsvSHRpYlRna1FE?=
 =?utf-8?B?R01lTnhDQmUwcnRIS0VubUcyWTA0cHJBZTY1VEVScG1scGZoNjZ1RWpyb0Rv?=
 =?utf-8?B?b1N5eVM4T0ZCUlRhL2JMYUpLMUlEMXkyMVFlalRnK2gzcEYxWThoQ1VVcjZM?=
 =?utf-8?B?VTF2WHVMaUxHZTZ4T3lWakVjQm1tQWxuM2R1OUYrRkxIM0ErMUhkQy95NmJu?=
 =?utf-8?B?ZUw1emVNTHVObkVReWVZbzQxNTlTa2t2Q1JvWStxMnBuaGdPdVlGeFdZMnUy?=
 =?utf-8?B?ZUhSdlpsQ09xWjJ4eEpoZmc5aW14b2NwVjRlcmo4c2hpWGN1SXRCNERYVGJr?=
 =?utf-8?B?ZWpLbGxxeWhUM0FWRzRCYXM3cmJnZ01xb2VVS1laM3g2ZzRzYW9oYU5LeEpQ?=
 =?utf-8?B?UkIwVWxtWnV2U3o4ckEwUVFDbFZKa2xvZ0JGazVrN2tjZFFXYVhmQlJLbDN1?=
 =?utf-8?B?RUs1NmVqckJZT3NtcFFKQTNxMDdOTkVsTUdQbUxIS0ErbzJtYnFLMFYwTWJh?=
 =?utf-8?B?VWFRK29ucWFxNkxSYllKNDBvTEF0aUtvdVIwMW9UNmwrdnFjazREWEx6MDlZ?=
 =?utf-8?B?anh6eEg4ajIwemQ0MktveWhrOFRrbW1tQ1hScFZ6TlBIOCs0a1BmRmE5dktP?=
 =?utf-8?B?VXMrWDVENmxSU1JJZ1pHck9KWE45UWdzdXRMWDVaM3B5TURLQTY3SFRYakdv?=
 =?utf-8?B?MzhrRTZDSy9ZM1k3Y3RUSEpmNXJhaXNyM3UzMkhOblVvekZ1bHRpRGovZVJv?=
 =?utf-8?B?ajQ5bkxRRnRGS3c5Z2FyOEZtQmZQT056U0JKb0syK1FITGtFQlByYUJQYWdz?=
 =?utf-8?B?Q0krWSt5VUU3dytaRFkxQnhWWFFJM3YwUHdIUFRlb2FCOTZZUElObVFlRTFE?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b83e62c0-15a3-423d-c7a9-08de057b8320
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:28:37.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rn1Rvot738pcCmz2jnAXsay26R3dmYbhpkdlb6JwO6G5sXOJxYn2PmysA/AF4amxBnJulcsF1sg6Rzc5E079yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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

On Tue, Oct 07, 2025 at 01:09:34AM -0700, Matthew Brost wrote:
> On Tue, Oct 07, 2025 at 09:28:56AM +0200, Christian König wrote:
> > On 02.10.25 07:16, Matthew Brost wrote:
> > > Stop open coding pending job list in drivers. Add pending job list
> > > iterator which safely walks DRM scheduler list either locklessly
> > > asserting DRM scheduler is stopped or takes pending job list lock.
> > 
> > Taking the job list lock and walking the pending list while the scheduler is not stopped is most likely a NO-GO.

Oops, I misread your statement—it's late here.

The use case for walking the scheduler with acquiring the job list lock
and without being stopped is in debugfs for Xe, where it prints out
pending job information. That seems valid. There are couple of other
upstream cases where this is done but likely not needed.

I checked and found that AMD acquires job_list_lock and walks the
pending list in two cases within amdgpu_debugfs.c. PVR also acquires the
lock in imagination/pvr_queue.c.

If this is really controversial, we don’t strictly need this in Xe and
can remove it. But of course, AMD GPU and PVR would need to be fixed as
well.

Matt

> > 
> 
> I agree. But this patch doesn’t do that — it actually does the opposite.
> 
> It ensures that if you need to walk the scheduler list locklessly, the
> scheduler is stopped at both the beginning and end of the iterator, or
> it correctly takes the pending list lock.
> 
> So, what’s the issue? Or is there just some confusion about what this
> patch is actually doing?
> 
> > As far as I understand it that is exactly what Philip rejected as looking into scheduler internals during the discussion on XDC.
> > 
> 
> I thought we agreed on having a well-defined iterator for walking the
> pending list, ensuring correct usage, rather than having drivers walk
> the pending list themselves. From my understanding, this is exactly what
> we agreed upon.
> 
> > So why is that actually needed? For debugging or something functional?
> > 
> 
> Drivers inevitably need to walk the pending list during recovery flows
> (such as resets, resubmissions, VF migration, etc.). This ensures that a
> driver knows what it’s doing when it does so, and avoids directly
> touching scheduler internals. Instead, it should just call
> drm_sched_for_each_pending_job.
> 
> This has actually been helpful in Xe already — when I was working on
> scheduler backend changes, it helped catch cases where I accidentally
> flipped the stopped flag while walking the job list. Without this, it
> could have randomly blown up later if a perfectly timed race condition
> occured (e.g., free_job fired).
> 
> Matt
> 
> > Regards,
> > Christian.
> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > > 
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index fb88301b3c45..a2dcabab8284 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > >  				   struct drm_gpu_scheduler **sched_list,
> > >  				   unsigned int num_sched_list);
> > >  
> > > +/* Inlines */
> > > +
> > > +/**
> > > + * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
> > > + * @sched: DRM scheduler associated with pending job iterator
> > > + * @stopped: DRM scheduler stopped state associated with pending job iterator
> > > + */
> > > +struct drm_sched_iter_pending_job {
> > > +	struct drm_gpu_scheduler *sched;
> > > +	bool stopped;
> > > +};
> > > +
> > > +/* Drivers should never call this directly */
> > > +static inline struct drm_sched_iter_pending_job
> > > +__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
> > > +{
> > > +	struct drm_sched_iter_pending_job iter = {
> > > +		.sched = sched,
> > > +		.stopped = stopped,
> > > +	};
> > > +
> > > +	if (stopped)
> > > +		WARN_ON(!READ_ONCE(sched->pause_submit));
> > > +	else
> > > +		spin_lock(&sched->job_list_lock);
> > > +
> > > +	return iter;
> > > +}
> > > +
> > > +/* Drivers should never call this directly */
> > > +static inline void
> > > +__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
> > > +{
> > > +	if (iter.stopped)
> > > +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> > > +	else
> > > +		spin_unlock(&iter.sched->job_list_lock);
> > > +}
> > > +
> > > +DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
> > > +	     __drm_sched_iter_pending_job_end(_T);,
> > > +	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
> > > +	     struct drm_gpu_scheduler * __sched, bool __stopped);
> > > +static inline void
> > > +*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
> > > +{return _T; }
> > > +#define class_drm_sched_iter_pending_job_is_conditional false
> > > +
> > > +/**
> > > + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> > > + * @__job: Current pending job being iterated over
> > > + * @__sched: DRM scheduler to iterate over pending jobs
> > > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> > > + * @__stopped: DRM scheduler stopped state
> > > + *
> > > + * Iterator for each pending job in scheduler, filtering on an entity, and
> > > + * enforcing locking rules (either scheduler fully stoppped or correctly takes
> > > + * job_list_lock).
> > > + */
> > > +#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
> > > +	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
> > > +	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
> > > +	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
> > > +
> > >  #endif
> > 
