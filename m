Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8046C4A32E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3C10E4CE;
	Tue, 11 Nov 2025 01:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSTchlBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305E10E4CF;
 Tue, 11 Nov 2025 01:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823187; x=1794359187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9/IDBOvHy20fXXHlRAJuC/xhYosLVIUAHmH+zLTJSnc=;
 b=FSTchlBQGjQC4k5h31QVh4mkJn/1TKPI4VPi5aiKOUzo05DLGt94XJ4B
 N5Frvkn1p53YEHdLH0JisgnfN/aZhwNlRbn8hUvlUX5VJice7am9GfRln
 HRTPhkQnJTaVLWjIL22LtcKScPr0rcg+VqJt69swullUMx/838oxpO9PL
 2hXgzBRpupI5ctR5psLwwH6+bCiG+Z+QH5fI69VKOQbJphsThyj13tB7l
 Fr10AwDH4ue+UXAjj3N6zhdUuz4Z1N43XZlMKM6KBGET1xPaiuzzQRyOU
 e1BpZIw+EqUAcGDzW17TX7rPxoj8YSPi5t1SHuGMpMDdcOIdTfE8+oCd1 w==;
X-CSE-ConnectionGUID: DjIpz0FDRHGUb3T6IF0Feg==
X-CSE-MsgGUID: StcjxeayT7aMuX2Q9PLRLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="87510888"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="87510888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:26 -0800
X-CSE-ConnectionGUID: SnfvUEAtSCWSWzgXnbzh6Q==
X-CSE-MsgGUID: 1CGYN+/LTbqPLtm/aSe8KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460394"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoIxnKjnu9dzY6K+dKWYbZEPQ3Ls/BQXrLG3MBn4pZeSHiYsrmCqgiz0P58RaULnGH+bByhitD2oyuJAgrXw8+vW881r+26ly18eTeNdbO2FUQR5qRU9pUhY/U/8BXTNSwLSrcCM9+PJC8AwVvzW1ECaFWcRonvPdg6Ouv5dxI/Ith8ljC7awkXrzmKVSgu9f5n8f95bvyQZrF40+XJlrmrjPuBVUyZrm0gyMntmZRAkC9ODKDBBAexR6riua7SsOSiMyqUKqxcwRnMNquQ+ZodMcTFpZRIrwQFoGdbTpRnIQ72TyuNE2CKITHsTby/SfUEDbS+cveHkKJFp/59hRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm4RxDakM3dzD1s7yP3qdOW/gv3IwhxKL7+q0lbnXzA=;
 b=ECYLFltLzrtCjFpvU4PCA6OC4lqEOxgLwZ2mooZEWDhYXU2stnBR3fMSlNumplWg2K8YyEAub3m383gZPjmO+fj7OU4/0VbjWEYjj8OfVI/fqJ04LsBUOa/O31qAb2nZimp0VtNgbbcn+53tmjP5fn3hyg9qkhlKX4itwCPEmzQzQX9W+2kJ6YlsifH6wGumh3eWE29aEdF5RdJaZHXe4seYF4xbfsiskDa7bsFXpK96GnanCd6/eDe3qPMCr8io1ooA207oFP6+pHsMOHC9jrZDhxP6vQvaGjDweP2DM5RsDaAiZ8/jq6YrRlS9DgRZTP22OF5MJbntWBdFV69wNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:23 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 18/28] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Tue, 11 Nov 2025 02:04:29 +0100
Message-ID: <20251111010439.347045-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2479fc-72b5-4bcc-c0fb-08de20be8813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWRadTVuRjNIWkQyejJpSkVDUjVSVW1CQllSeHgvMVRhWDdKNjhOb0s4ZHlw?=
 =?utf-8?B?S2dMZURLdGY4bGVQcXVkK1JNUU5WZC9lRjBWMjc2VkFnZG1FcW9ZY1dKdFZo?=
 =?utf-8?B?blJPY1E1a284NXkxZWJmOTJUM25RWnFra3hPVHBlRkw2bm5KUVZrV2FQbklz?=
 =?utf-8?B?Njh0Q25GZjhDSTAveDRxRzhnTnZZYzc4UTRIYkJHN0JsZFpIdXJZKzFDVFJ0?=
 =?utf-8?B?VHpvQXBLNmV5K2JJcWdNQ0lnVktZYm5TL3o2anZ4cHU1U0ROSmlWZW5veWZj?=
 =?utf-8?B?bFo3SXhFTE9vd3JMdTlJL2M2TW4wcWpmenc2SlhsK1hJZDlsU25IUWlBT0JU?=
 =?utf-8?B?aFhEZk1iWDRvcHluK1RnYlFROFJkVVUwb0xUQzZEMHNzaVJSNVpCQVhrcWVH?=
 =?utf-8?B?ck1KZnppR25ucnprakp5c29OQkhPandSWlMwMXUydlV3d3pZdDB3cDE3Y0hs?=
 =?utf-8?B?cWhRYndUL0FvRStCZTA4a0d3bUFya3E3b3k0UVlLWHBPTVExRDZQZC94VUlK?=
 =?utf-8?B?eXhHeGFqeDhDWURyVVJHeWtyeStlZ25nUk1MQlh4bzd4NVJ3NHpjMEFXdXhn?=
 =?utf-8?B?ODhKc2kvOG00NFlOUDRtQXNncndQWmViaENNZWpNbUdHMittSU83NHdRTXpj?=
 =?utf-8?B?Yld2OUtIVmhnQnFUdUxmbWMrZHdlcVpXdDIzV3pXYng5TVJ1K2tUOWlsd0VI?=
 =?utf-8?B?L1JOR2xmTExQUGNWRm9POE43MFdCR1hXVy9GcWFDcWR2b1lOYm5WcFRQNXlv?=
 =?utf-8?B?MXFiUlM3R0VCNndVTU5PUUUvVVh6aXRWQUVtVUJKblkvTUJaNWZ1Z29JWXg5?=
 =?utf-8?B?ZndCWnl6M3VYbVFhSHVrN3RKQmtLcWp2OGFSamRacVNRU0VpOS9yaFh5S1Jy?=
 =?utf-8?B?THdhUkYvUjk0dmRNM0k1Y2Rmb3dGdTY3QWJSeUgwOEZXalNQcUhNME5IN1p5?=
 =?utf-8?B?K0FiSHpLMDZaVU5XM0VHYWtMM3VIQ0IzbElzcUxvL0JOeVFGRnhjVUhpU1B0?=
 =?utf-8?B?aEZpUE5jbzR2V3hFWXZoMnUrdVZYMGNKWGs0emFmYndveml4MTJMNFh1RXhi?=
 =?utf-8?B?Z3MyeU5SM2tlNjI5aERORVV5bkJzaCt1SUh0UFJobmdkbmpJMHVvanBSTkR1?=
 =?utf-8?B?V1hMKys2djludWJtV2Z0RUk3V3BFcTVaWnJEbEdxMlVnZk5WTXVIMXVUTXA4?=
 =?utf-8?B?ZjltdkF1V0oxNlRualhZNGtXTEF3eTBzNlV3NFJVcU5HTTV5U2VWVHk0Titp?=
 =?utf-8?B?b2tiWERpRytwbTArWUNBQ0UwczFKTmQ3c0dFSlR6eGhLME5KdDZmWURpQ2lZ?=
 =?utf-8?B?cWVwZXpNZXdYbmZnMGxFa0k0QThBclFCSGtFMFZJRC9qWU5KcUlZTlJlTzdj?=
 =?utf-8?B?L1VLVXpnZnRTUzhBeks2ZC8yVllxUjFLdFVyeVZPZTNlZUdna05Ia1Q3Wi95?=
 =?utf-8?B?Y3VNTmpmUW5jRFd2ZVcyMUJSbWozR2FLbnpTZzZ2cndQbzZSZU5lQW91MUs5?=
 =?utf-8?B?Y1VnWm9SQmlYZDdxUUl1dkY0NzNkU0cyTGJqWlhodWdRNDRRWW1jUHhWUVVz?=
 =?utf-8?B?N2xnZWpZYmtSVWRVYnJUbjZ3NzZ3RXZ6M1FWM21XMmNsdXpyT2wzQktGUDVH?=
 =?utf-8?B?elN0T3NicUNHL29rVVJBYXZ1TWYwMHhpVGJSVXJSaGhieSs3RUdyN3pPdHV3?=
 =?utf-8?B?ekFnd0FHZzBkY1J3dHBxL00ySzZjbEJuUy9YVnRDME5oZ2NPeG9XL2kxSjAz?=
 =?utf-8?B?R2FVTHVwUE9MVUhjdTNxclpnb0tONHo5WGwyaWN3NElyRDhIV2M4bG1pMWR5?=
 =?utf-8?B?dTNlUkt2V1hkTVpKVlRJdHZhcUZXQ2t4MDZYUEtCa2hUWGFtYWRRRmJzcmtw?=
 =?utf-8?B?RkltcTlCN0NzcW02ZFhvOEkyMUhFanN2ZE1vdm1yN2pwN25lcDNLbERRS3A1?=
 =?utf-8?B?eUNLWnNKNFdkV3R0ZzIrd3dYa3ROOTl2QkhueWptbjdKYWR6WlV0QjdSTVUx?=
 =?utf-8?Q?P1Q44JdIzTxpI8FepGRkTd8Zbjs5ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1hWVlhlcjF5d000U0JibktiYk1icEw0WkZRTnR1OEwxdFpxSUVVa3paYTF2?=
 =?utf-8?B?RjlSRWxZb1A4SlN3S2MyRlJvRGF6VDAvcnNrRFJHNWN2OWJTS2g1amxtYkZT?=
 =?utf-8?B?SWNGem1vbmo0YnY0RmFTems1clQvUUUwVUd5MkIzd0RGalIvYk9GOEltM3BP?=
 =?utf-8?B?cVFPWHFQOTlVTUZ4NDJmWEdHeU16dDdPV1FpRm1pVjhnMHgvbUdZVktaZVdi?=
 =?utf-8?B?VCtrby96M0c4d0NpSUMzcGFvT3FVcmE3Um9udVlVQWd5a0NwZEZMNWF4T0dJ?=
 =?utf-8?B?YmdKQ2tUQ0ZiSW1ydVIybEZiNkhxcHh1VHdpa2hYQVpySmtzNFZIYTRXdmlL?=
 =?utf-8?B?Ukg1eVFKc2V5Q1N0ckV1WXlnamh0NFpFbkQyN3dkWnhKVEkrMzgyenJ6cVl4?=
 =?utf-8?B?V1RKeGJMUVB2VjJsR2oyclhrYWJsWVlDOTI2RVM3c0RHeTg5d0luWXB3VThH?=
 =?utf-8?B?VFpONUxFU21iZnBKTnRvYS9wWFJDRFI5ZkxGOGZBU2tLNVR4UlhUdkYrWTF3?=
 =?utf-8?B?WlF2U2UzNTlKTU8yVEJrbFNzVVJXdkpJMUtKOWVlblR6SUgzRVFPYlp0V3VW?=
 =?utf-8?B?NHF2dW9MMnl6WmJ3anY3QUhWQnEyVUM3ZlpsWitpTmFaRkl5Z3d2NWlMV3BU?=
 =?utf-8?B?Z0NXMGxZeW5Ua3dsM3NzUWYxMVVLTHlOMXhJU094ajQ2NGpTSkRUcGl0Q2hE?=
 =?utf-8?B?Z2w4NVJiMGFaeXFuR3QwVFROZnl1TXFycnl6Yzc3RS9lNzNaV0srY3pQMnJP?=
 =?utf-8?B?WGxyUXFsNlNKbjBrYkNPZTFUd296UDA2SnJaTzk0Ry9iWHNHbExQdk9aYXU0?=
 =?utf-8?B?QTZtYU1nRVVvNld5ZTBtejl3MFphaEFFNWhIVVB5YXVIeDNKRlF5bjBORnc1?=
 =?utf-8?B?bVJwcDhSRVJtZEFDKzU3NW9aZCsyTGN4QWlYWGFFN3E5U2JYRE1kbGtMVTJ2?=
 =?utf-8?B?RkQyK2Z1UjZpV2VwN3dBYUZkSjRBVnB6QWNtR2RKdXNxWDNmWmtqWVA5Vmdj?=
 =?utf-8?B?aUxEcWFYWFpISm9WSmpNQVpPQ2lFZGIzR25SY1JYaGpGeUl3MHpZRnJCQm5Q?=
 =?utf-8?B?L3R0dUY2Vm1iUzRJUVJURTNzTTVjdXlOWnRTNGp4UU9JVGRrZVVTa3UxMitz?=
 =?utf-8?B?WFVsMlZDMmY2MWhaVWpkcDM4L1dEL1M1VElnRDZja3ZOeXdpMW13cUF4b2Rt?=
 =?utf-8?B?NnltdVBKZCsxRHZtSm5HL1hLRzZuaVJtTys1aDhYeTJIckJOMWlHcDhaMFVW?=
 =?utf-8?B?bjlHZGJQamlpOWdDU1lzNWJNell3YTkxVTFtbVFOQUJialI2c2FxYzBYNUlQ?=
 =?utf-8?B?UXJZRzFZb1ZLck9PdXd1MEpWMnZPbXppMlBxOEl4Z2JzOUJNTHhRT3VWTjA0?=
 =?utf-8?B?UTR2c1hwWVdhZ0NzSU8vUGdYd2J0RFlCdmhxTHVaY294QWRDNHFpaTZqNXVt?=
 =?utf-8?B?U2hBTll5VnZOV3R6TFcycVZFU20vMk5ja1JXa0p2NTZWMmNRWVFXazVoMGRy?=
 =?utf-8?B?eEdOY3VCQ3dnZGVvbFVKOEVsbTFKMmdQQVgxY1FKQTh5VDhCYlNXZ1grcHJ0?=
 =?utf-8?B?bEJ5RHVVNG5oTUVKY2tuRndST1ZOb1BUU0NaSHpoclp4VVRIcy96djg0aWRx?=
 =?utf-8?B?SWdTaEVQZ3NxdDArMUhYbGJJTWxZZU50aXhramZDT0EwNmQ0bEdKbG9OUkFj?=
 =?utf-8?B?bVpBbklwL3d0QllxVXVuTGZxL2YzMU9PeWpUbytvdEpkQkxhYmdQQUliZUty?=
 =?utf-8?B?L1RlMUZRdUcxZDE3TWhzb0tBMzBFeWxrbkt0Q3VsUERER3lnTERqUUM5aHRX?=
 =?utf-8?B?a1dyWUdtOWRwbTU2cEk5SVc2clNNaFZYdkRSTXdvdWwxMTFRSU5IeEFvTnZK?=
 =?utf-8?B?WGtuZzgwZXJabklwWUZWK09sNkovZjUwOHozNjlIb0sxWmpBalIvUHhZTGtt?=
 =?utf-8?B?QzFtZVdWeEhMS0NxMkd2N1huYUxYZTA4c0RXZmY5bXBwNE9DWFg3UkxyVDRn?=
 =?utf-8?B?TXZ5SnFCTkc4V3RoeEVpbHhEc2hmdnVzbHJzUGdLUmpEaXptNG4zQmphcWJs?=
 =?utf-8?B?VjRaVS9xbHNQaFVDOVBzWndTcXNNSXI2VWdpYm9xTFgvMDJZajdyamlyQjNZ?=
 =?utf-8?B?UG42bDd1b0lOSURreEt3OGRFU3Zicmp2NGx6Vkthc3o2dVY5djVTSWFlbHB0?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2479fc-72b5-4bcc-c0fb-08de20be8813
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:23.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyjcQvWycIhq4e5eoIRCvzunSUyQYuA+QdhdMPfci8tmqIi7mttaASIxCZ8n1H2uSNwiGW5aOUpst6M0DY/N8WnN+Tq6KcqSc23lwuEK1vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 111 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 7527aed8c7c57..16524bc18b1b2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -868,6 +868,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GGTT)) {
+		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GGTT);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1097,6 +1109,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	int ret = 0;
 
 	switch (data->hdr.type) {
+	case XE_SRIOV_PACKET_TYPE_GGTT:
+		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index b065383331e6a..3a6c2008ff96d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,9 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_ggtt.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -42,6 +45,104 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+static ssize_t pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_ggtt_save(gt, vfid, NULL, 0);
+}
+
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_ggtt_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data restore");
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
+				vfid, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -280,6 +381,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -345,6 +453,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+
+	if (pf_migration_ggtt_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1cba651b521fe..2d221b6409b33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -19,6 +19,9 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

