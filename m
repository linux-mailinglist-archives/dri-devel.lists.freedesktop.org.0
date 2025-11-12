Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95EEC52770
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960D710E73F;
	Wed, 12 Nov 2025 13:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q37UwLz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E46E10E740;
 Wed, 12 Nov 2025 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953867; x=1794489867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cYs90ggO7fsr7Sn7MADY4uAA+GvjeCAWXtTpwPeyyig=;
 b=Q37UwLz1/tkay73iS9+C0ChSDYIdrdBO/AMfXVvjGHeTby+zXF6HkELc
 PIV6Sono93zx2VqRH4FPld4BebW+JsVJr+2IVf4NL1Fna+mYQ77SHwwUE
 /CuXea2tlYzBSjvbLKFi0opx419zJfrDvTUWO9dxqdnt2gMlEgQOOmTml
 97Xnf1S+1EgiYPnUy186FfkZQmAMksNQkYmIBTlEUgxkpQuWwuelOPVFz
 agbA1BHl5NNlzwwb20aS6r5zYO0BJ7rg9Sy1FhQyGHN1tN1a5dHzitLfN
 rvN8cdgxuO47FBgtWFFRT+PPHWo9UugK3gvaCux9BCREXA93mka7NluyY Q==;
X-CSE-ConnectionGUID: bmfbKzITSuePZElHwK6MFQ==
X-CSE-MsgGUID: rNPli6wOTzujHw2MRRhrvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322776"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:26 -0800
X-CSE-ConnectionGUID: jhCL3q+USIq9gS1KJgQt/g==
X-CSE-MsgGUID: uxbtSJnIT5e6cTRW+KhExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188858089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:26 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNY9jad/S+3EebkDuh8H4f9BupbPYdzu5Nng/r7IC9F2kP0V96xa8TB+Xg6DbW66gk+JTEZ7o4cBKnAaVDxpxtIun//YondUSY1BeBW+4ZvFcfaWonXbW1bkZVbLvb5OVm6yitMvi1j6NLH1YZRJHxn0HEYUSTCZiBntlxVB5ZGau3Q1Ta/ptJHEJ9FcyuG2jiTH3DZg2Q0+ZoaRh0u7vIkgVD0OTTQ2NJuaM7eqYgkuMi/H4i2ZgWTZ2b2zFbaTswgvtnC5QS3XhUT/bhSqSsxSeE5ZnZhaCBgcBuKbZBoY6C+OtAlHNHw3KcZ0HyG55kKh6wY2OI3ruabiTuiJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsNx79I/mDOpckRkbt9QupEJfcKfebnzAGbQCAEVlIM=;
 b=JqB0Agtn8iNAP7ozrgzROSIU0tRKesIgiIU06wSLmws4SDzUQlTLrAsoiTplhKZ/n/FZcUXTKYYs31o2DxQqyr+9u9I5iVFF3Kuc8BI1oIVvqtg4RB7SnhlKJpxLlTxRS5ANEUGRazfzODL0oHgdBSRO1GqdQ4t1zx//kWi+46SsYo3qSvtYRehIMvxFUIUHMFzAE4LMqq37Gqmyo/2jv1galKF5Q2UmBDqoOFGJZJX9H/+ROaje6FsXSfPNseOvffumMpN5aKo3qKXEsJUvYDF8ce3Z5Re4rRPYIT1odeh9EslAviV9ickKAKDAvvQmmsA3VejI9pkF2jeEVofUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:24:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 22/24] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Wed, 12 Nov 2025 14:22:18 +0100
Message-ID: <20251112132220.516975-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0029.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: f1261dd9-f732-4830-9cd4-08de21eecbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1hhMEdIclNWU01UbXJ6Yi9xbE1yU0lrMmFqbUVtTkkvUmxQTmMzVUxtajhh?=
 =?utf-8?B?b1ZpNXhma2NaU2h3QVM2QjZkZFZ1bStZNm1sVTVvcXJaQW9JVE9nWFpDM1V0?=
 =?utf-8?B?QW9WMEpSVlppTy9yN0psUFc1cTBwS0FMZkhNVnowOXFoWGdOUEUzbVV4UWVz?=
 =?utf-8?B?WHFZYnBrVDZnUTFsMjVXQkJLTzhGMGd2VmdXWFc3RnZyWVdDUDQ4eWNKWkV3?=
 =?utf-8?B?MXpUazlxaVRvb2hmQm04SlV0M2k3K1ovMW9tNkVrTVpuRFZpVjRzVmlYbDNK?=
 =?utf-8?B?MnZZN0FXNWd2UVQyTzRFbDlCRnM0Q0xKeWhFaVFETmdTMDlnZHFHS20vV3Fz?=
 =?utf-8?B?c2RteFU3ZjBGVlc0MXpGQzVDQmRLL3Izc2RPRWd3bjdPeEpyK1FPWER5eTR2?=
 =?utf-8?B?Nk5FYkp0V1RKemY1UU40bVkrRTZ4TWwycU1TcmJSSVVmMTA4RFZQRCtjeDha?=
 =?utf-8?B?M1Q1eitlVHVmT0lrY2wxWjk0L1Q5VWYrM2pNTVYvMUE5VkpZT2R6K2hWYXJF?=
 =?utf-8?B?Q0pPenEzR210TnpTMi9yamtxdDI1WDMxTGFCdFN3dnRQQkVYY205KzBlY3Vz?=
 =?utf-8?B?MGQwc2dtTW9ZY3FzeHlSNHhnSFVwSzF5Z1JyWllwb0g3cEhUTnkzckRTTEJH?=
 =?utf-8?B?K2IyUndxSmpYMnJzYmUxalZyMEthWU5lWGJTMTNRQlVQTmZKcHpWME1BV0I2?=
 =?utf-8?B?TEE1RHZiMzFYVEdXRDloRDB5NVhkcjBUQjRFYkVaZk0vUXZIY0pqNHRTMlha?=
 =?utf-8?B?cWhGNHBjRE9FQmk1STZPTkFPdi9ndHFoUlF3d0pzcGFkbng4emdONkt6NExt?=
 =?utf-8?B?VjBVRUlRYzdpbWFXeGFvZDNRTC9VdXVDNUhJUVUyckd4b3dEa3NhckdERDVD?=
 =?utf-8?B?M1QyQ3gvMG1FQXdLbi9uNzlnWTRqRzd3MFBBcVd6YU9jM2psNUZCVXA3WG9p?=
 =?utf-8?B?aW42bVRtVDZqaXAxdUM2cEtOWkVEbXYvT2k0ZGdsT2ZqQlBDL3Z4MnkxdTFB?=
 =?utf-8?B?UWRSMFA3cjkrbXI5d3Z3VENsRDVoeTREY2VLSFloRGxVcUpGZUllQ2ZmSEZo?=
 =?utf-8?B?UGZwWEFvVkhOcDNMLzhqWGoxNk8yT3orUWR3bmp0NVRuNk1VWTBVZzdrMFlD?=
 =?utf-8?B?dzIrNmhyT1NJZHRCYmRNY2FYNlF1azdtTEVtZEZCVkVIQjJMVHZuMzlBWlhT?=
 =?utf-8?B?T1lzYUlCRjRNL0xWTUxudWxtTVozblZmTjBHYUNtS0hJQmRPZytVMElFditj?=
 =?utf-8?B?bFltZzVFUlQzTFlCOUhuUnRCcGRqME95Q1BpQW5CYURRWGU0RFQrb3VFaFhR?=
 =?utf-8?B?TWxiUnF2ZkxkVjZ5TlVGb3V6YWoydW5TRWtua0pieWZpWjlKdUx5a20wNzYx?=
 =?utf-8?B?K3huNlFQTG1BYXFibHl6NlZlQzhRWlVNclc2NnVybDJpaFJ2S0FTNTRwRzNB?=
 =?utf-8?B?UXdFVkRBKzN0ZkQrTk53YmZ4M3p6NUNYWU55c240M0FDMDB1NU5vcWZ5NnR3?=
 =?utf-8?B?dEtCZ2FBanpBOVZ6V3YrelpRVXZ3V01tYTZ4VXZsd2RHYUZxOStJUHlzTWVn?=
 =?utf-8?B?bHhQR253TFk1Q2cxd1RISEltQ2c3dnJKeEdsUWVhWGc5aTFDTWlpTUo1dG5F?=
 =?utf-8?B?RjUzOVBIQzNwQ0FhMUlNZ0JMcHJmbXpDSXYvM2J1VE5VNzZqb1hqaSs3TU1j?=
 =?utf-8?B?dElPWG4rWHMzc3FDWW84UkFlYUZzRzVaQTBqMGxUVXZnK3FpOG1UL21lVktC?=
 =?utf-8?B?WmJlK1ZkYnBHbUZ1RTZJV2g0L2hLa216c2VGVWFDWTNmbzluRnlLWjRHblVS?=
 =?utf-8?B?RTBCNFpNc1ZjNnkyMmdEMTdMSHFGZyszcnRUeHVuSko1OGdiVGlxTnlLTmJo?=
 =?utf-8?B?WjJseHU1WkJaWXZxb254TDd3Y2UrYTJpMGdPNllRRS9CMWhEMXJ3dDFrUTQ2?=
 =?utf-8?Q?1abu+PhgxVxc4/tlB2KxwL8kBkl1tPZG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpDUVYrMHZUVWZkbzU3QmtRT1paVUVFTEVvWVRUbVUwVzBSRlhZdnJ4eE85?=
 =?utf-8?B?cU12eU1FSVhDWndvS3FEeVhGdU1BYVlBVDJhTUE3VG0vN3hZZUh4N010OVBm?=
 =?utf-8?B?WDJEaGxFc3ArWS9RQ0JJUjgvUi9rOVp0K0ZvMVdtcStHV2VPUjNYTEFJMmha?=
 =?utf-8?B?eVhsWjk3cEJCdEFZdUUvcnRtTWIwMUtJZXVqYkxhSHJYeU5VNEpwelF1aTVk?=
 =?utf-8?B?cEpQVzNZUzVZalpCc3hod3VLQS9weWoyTWNtVlZ6Z25LVWQ2V2JDMGorditS?=
 =?utf-8?B?M0xKTlhqQ1dHN0I1SUVlanpsTFc3dmczRUJURE02YmJDRi82bXA0RUFzaHc5?=
 =?utf-8?B?TzVCWmpQbm0yWUxLelp0TFdUQzFlK0dMOUhhZ01mclB6eldmeUdqZ3VpSEYx?=
 =?utf-8?B?c1ZmVXZRRmV2Z3RsVi9ZUVp5cE40RjBMeEJJdlk3a3FJd2lGN1lFbFJ0ckMy?=
 =?utf-8?B?WGFaR0l2K0RLa3BYL2luUmNFVzduQ25Mekl2L1JuZ3BFRDJBTUpENitsUE5S?=
 =?utf-8?B?ZVN2dmFaNjAzQ3N1TEJUcGhoUGcwVE1ILzA2Y01FQ05GYThOKzZHNUxLZ2ZQ?=
 =?utf-8?B?RU5nMjQrdGRIVkl1MUNraEtrNWJRWkRPYTIzYmJQWmNuVHYxdHlxUXFXTnJs?=
 =?utf-8?B?ODZ3RjhHSFlzSmZWUDVURGMwZzhNMDlOSTRrN1VxbGNCZis2YmJtVjFFbDNa?=
 =?utf-8?B?N3Y3WmxIUDdYemZUVzZ3OXZKUHkrTGRWM2tKOHlWdlExMVptam9uL2VOUzFE?=
 =?utf-8?B?UC8rUWI0cUtsUmFCc0ZIdHFrTGpVUks2T2VaOUxCQ0R3Q211MFhPQTVwL21n?=
 =?utf-8?B?OGErczBYNGxrblk0TEdTMkdXbGcxVExyQXg2M0UydW9zUFZwYlQyZFZDcXpK?=
 =?utf-8?B?c2NwaU1UV0NRb1hLSFVxdjhGWkNRODAra29sVDBsTkY2Sm0rZ0t3bmZLQjI0?=
 =?utf-8?B?YkkxRk42RFV4U2d2NFhvUmk2cjhrd0YvWERLNW9lM0dzUmsvY243d3JlSTlY?=
 =?utf-8?B?MjlXUERWSXQwZ3kyK1VJZWpka1oyQXJ6dFpkV1dCcDQ2NCs4VjlyTlplM0x5?=
 =?utf-8?B?cmFiTkVPa1ArVWxwbTQ1T2xjR2RUQy9yTHdIdHVEUDZQcWZJcVl6cjhXcDBP?=
 =?utf-8?B?U2FBR3QyU1lUczZ1aHh1QkZ6SjNOWmwvdDdDTm9ad2orWXRaR2FQVnVYQXVy?=
 =?utf-8?B?WUY1bk95UUdGWmRMMXRieFZjVy9Td0JQNDMvWnNTMmlCUEVoUlFvOTFFMGx3?=
 =?utf-8?B?OUJLTVBzV0VUdWpNSTg0d1psZllOUEZtVVdXUUVzb0IrU3lqRXFBbVMvUzlq?=
 =?utf-8?B?M2NwOG9YN1RXTDlDNnhuaTNIM2VTTXNFL1kwQUQ0bXAxTFBJYkZCb2ZLSFIr?=
 =?utf-8?B?em9mczhWSHl6WkcwbFg3bzllYWIyZjJhVVFmL1oxZm9aUUk3SHMzSmFzSGFz?=
 =?utf-8?B?eE8wd2V4aGVEUURTOVEvbXNqcnFDNlhuVjNmc3dDOEY2WEdYRjBwU29LTXVQ?=
 =?utf-8?B?bmhCNjFpS2VZTVhHR2FlVjA0S00xQWdzL0l3SVhjSU5EUlE2dlNIQ3BaUHhB?=
 =?utf-8?B?bjh3QS9iMjRQYmZadjVGZUlrdXpCN0s5MS9Mb3NtUmd5YW14NGs2UCtnNEpX?=
 =?utf-8?B?d2RoY21BajBwSmlWcFFiUGMrSVk4WlRtUi8yR3FpYzVMdW9GU1NVaWVkNWtI?=
 =?utf-8?B?U0twVmcxenR3STRYUVBndDhHUllyVkMxVTA2UGs1ZHFKWmJybVlWK0JqSXQ0?=
 =?utf-8?B?bXluMkIxZVg2dy8rMXNLTGJrZnZyeXFvVVV1enBNSHl2alhrNVpNTDhjaFQx?=
 =?utf-8?B?QXVwZ1FxTmhzWVE0SVhUV2xLakxUNlRxNmRZc1J6NDBxem44UlFPS0x4N214?=
 =?utf-8?B?RzVXb244UFF4amptMFlmMUwwU3Bua1pRMlRqQkhqTWJNNXhSWWgydmJUYzBS?=
 =?utf-8?B?N2IxamYvVkR2bTFIYlRjQXhMZ05Ic3VBTE4wTDc5NFE1UjhjZFpDanE3anNy?=
 =?utf-8?B?dy9uUWN2bEx3MW9OZENscDAvMWFwTlRHUE1wdHVKb1ZmbU41UHREMmRhN28v?=
 =?utf-8?B?N2ZtVDh1SDcvKzV2eTFsU0d2YWFXSUJMK015Wk1od2FVVkRQWm5yNmwrY0Q4?=
 =?utf-8?B?ZlRtUEJXelBZbEhuL3E3ak1vT2VOaUhRM2tlUkFpQjQvSWQ4WThZZ25yVTZo?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1261dd9-f732-4830-9cd4-08de21eecbd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:24.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMIaI/D9WhfcdebAquqpNmNqvvKvIBYnD+0mdUpnPs2rTdgDwMsaX69yBUUGRImOkhwm9R50s4H6zhLiSLYX0gJO1KzGV4yotlw21ICUD0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  17 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 212 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
 5 files changed, 237 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 25b77007767d5..bf48b05797de7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -892,6 +892,20 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_VRAM)) {
+		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+		if (ret == -EAGAIN)
+			return -EAGAIN;
+		else if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_VRAM);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1130,6 +1144,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_VRAM:
+		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n",
 				   vfid, data->hdr.type);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index f6edca9a0982a..35a12d48dcc12 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -19,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
@@ -505,6 +506,206 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+	}
+
+	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
+					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_packet *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_VRAM, src_vram_offset,
+				   size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	loff_t *offset = &migration->save.vram_offset;
+	struct xe_bo *vram;
+	size_t vram_size, chunk_size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	vram_size = xe_bo_size(vram);
+
+	xe_gt_assert(gt, *offset < vram_size);
+
+	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
+	if (ret)
+		goto fail;
+
+	*offset += chunk_size;
+
+	xe_bo_put(vram);
+
+	if (*offset < vram_size)
+		return -EAGAIN;
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data restore");
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @data: the &xe_sriov_packet containing migration data
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -544,6 +745,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -606,6 +814,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
 
 	migration->save.data_remaining = 0;
+	migration->save.vram_offset = 0;
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
@@ -615,6 +824,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
+
+	if (pf_migration_vram_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_VRAM);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 04b3ed0d2aa23..181207a637b93 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -25,6 +25,9 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9f24878690d9c..f50c64241e9c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
 	struct {
 		/** @save.data_remaining: bitmap of migration types that need to be saved */
 		unsigned long data_remaining;
+		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
+		loff_t vram_offset;
 	} save;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 7789d9e1409c9..86668bd4213e0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
@@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 		return ret;
 
 	for_each_gt(gt, xe, id) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
+
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
 			return ret;
-- 
2.51.2

