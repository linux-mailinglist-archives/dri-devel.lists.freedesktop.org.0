Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A98C0DA95
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E8D10E472;
	Mon, 27 Oct 2025 12:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLHKyApN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFF010E470;
 Mon, 27 Oct 2025 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761569247; x=1793105247;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0wyiEL0NIOz7J53UQmDpMABtf68tw53biP2VpgrH+M4=;
 b=PLHKyApNp5KT4mmIGeqOCrQtkpW+sC6xqcnsEzV13L+Y14HlyHe0k0Rg
 crzPM3zjs2F0nskXhfvfZwPAFd3i7E2qiJda0mmPvuz3U51EldDH5XKYP
 mlq2Z8jh0W9OIDHwzlVvsdALA+BsMV8LoKD2+FQe9bejYTxhyLhfEadcx
 r0pPry3oMgqjo5SExsLKiIGguxYJbCZTTVCaF8im8L4oqNmhSGWymFssI
 stsH1Eq9FC8X9eY8adHp/IdikDNrlx3M5XHsM4OYLCTFIWgFsMtTfhnvM
 C/uZ4qMKRXZyWSBhpbkMZWI4X1f+mONaS03aFrQHFWS7Wyxi64i4XSVB+ w==;
X-CSE-ConnectionGUID: PHuXhFUtQ3a0bO9kV9FM+A==
X-CSE-MsgGUID: tgzp2Tj/RPmkHL1FKM1SMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66259378"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="66259378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:47:26 -0700
X-CSE-ConnectionGUID: CjzQri6sTWC7qooJs1LniA==
X-CSE-MsgGUID: yK9LtNelSzeFDmfceE6fLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189073457"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:47:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:47:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 05:47:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjboEsy5X3U3DKS7iwxE7/dB04ZewzVx/Dw5+w/h06jin4TNfwJhAtvYNWIRyYyAUwBkZ3aoJiiKwOtnKKqF6gVzAPZk8svG1nVy39Ji17AnypF7+XMs12v4A8W2j38KAgbTithEZqbPgcIWfVCNFSv86S/0Jv0SyLMeWJmNmSb6JfYqqcO1RXqLvrJnRULjoRytbWOujwgak3WsdkPyMy/CPLjw5Dm4/CAlr3TGS8uzYyxpH26HkjedbadXaFqpd2IZTxOwuQtlS1vXD/GekwxKHi9Q1cyVW66mwubnvUSkqhj4pLicMA5H6dPS/kGIWIHG8ydjEOYXrzYza39RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIBgJZrCOPkQ7em7dwb4BAuEiwLD21YsfjqXLmiWbwI=;
 b=lGA100D/2ZZrGL9VC1xnJswrVWUsnGUxSeucTWadR/yRSdNjvmlUOLVgNJpDux7SPwBMyNZZOfjG/tBVESviFqOlCZpi9XetsC5AgutW+o98hj4XGvjx/banw6X/0S7OPO4qPYh+KJWN+sEpZyQsUuKMKynIq/wHD95xIYaNHVg+stcmbUTk1xrZmUMHj1j6XEsyxH5hUWZqtwhmB2wfoU00eomDz0HmrHVfI3Jmg3PkdG0K2B5iAc0Wk+iaG/xek0D1ycIvPpSSZTCzlitoIIr9gVAqHIL9zIsk0l51FeyWih5yuBAX7ti14SRU9Kgl/Jrsi26hP1sB5ykb8aC3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Mon, 27 Oct 2025 12:47:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:47:22 +0000
Date: Mon, 27 Oct 2025 13:47:19 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 05/26] drm/xe/pf: Add helpers for migration data
 allocation / free
Message-ID: <gsh5pvk4m3gosm3bbfnxkalj2jdd6xp3rq5qtu52ffqrhoudf7@kjovamtfgyxc>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-6-michal.winiarski@intel.com>
 <830ac907-684d-439e-9612-e8d2f32d97b6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830ac907-684d-439e-9612-e8d2f32d97b6@intel.com>
X-ClientProxiedBy: BE1P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f86489-6b03-46a5-225b-08de1556f8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUlCdnFOYlhKM0dXTTBCMENFWXVuTFRLa3hBZE9zL28zbWxFNWZtanFvU0xv?=
 =?utf-8?B?YVBBL0VtYjdhUTZsSmNBaWZPUEFQQXlWR3ROdURlQ20reHY3aVdGNUpLNWRE?=
 =?utf-8?B?QXJ0d2piWkk2NktwalgwMXlrQXloSWFpSGo1NExrODRxbDF5ak9TSjNESHdO?=
 =?utf-8?B?ZU5hZGtZZkM4ZEZFcTRaSGYvUERwTitTbEdBakZVc2lxa0dxdmZmdmNTcDlt?=
 =?utf-8?B?RUg4VUxyQWxpMFpWWEF0ZlRVY2VSQWtJR0ZYZ1ZTZ3Vuc1BiZmw2RlVyQWwx?=
 =?utf-8?B?a0xjeXNROEdsU1J6bGR4dkJ3eDRTQTQrTWlkZVNHMnFDbVNNV1Nicm5mTDc4?=
 =?utf-8?B?clgxOXVoWWVTczdoZzFBQ3d1UmdPRmJaVW96V0p0UTRVSi8rM0ZhWmtQT3Jj?=
 =?utf-8?B?emJteWxSVnhNUW9wZXNNdWpLS3JkV25NMm1rVEgwamJBOHgzZGFkZVUyVkZt?=
 =?utf-8?B?K21QZ1BkUlp1RjNndkJhYm1CUnBtSk1acWJ1M2xvOG9PM1pDVEJjQ1MvblJQ?=
 =?utf-8?B?ek5wMFhPMzJhamQ4dy81dGdzdUJDcDA2MUhsVm4xM2hlZTJiVUJmdE9TSDFK?=
 =?utf-8?B?YU5FblhzcHFmNUxnZmZvOUhpWkpmTWtZZmFGK0tESEFaTFJ1OUxYcHRuVlBz?=
 =?utf-8?B?SWpvSjVmZjBZRUZFcGI2SFJkZ2VRQ2V4bGVDTHFJZ1Rldy9OUHZLZUdjSS9r?=
 =?utf-8?B?TmN6bDF6QTVNUkZHdy9vdDhsbUh0aUUyMmQ0UEdvM25hYTBvY3FEcHZ1SEly?=
 =?utf-8?B?bURPZ2ZsbHBoSU5DOU9WNVBISTU3MEc5blJ6MlROUXZhSW5yUDdoODl0OTJh?=
 =?utf-8?B?MGJTWEZmK0xIVjlKdXA4cmY4VXdIM0F1RUE4bXBqZnp6WWg3UkpYRmI3V1lz?=
 =?utf-8?B?cFZTbkRsL1o0QTNUa2ltU01UeWduOEJRQWk3Tkp6NyszMG5vK1locmdqbEZ6?=
 =?utf-8?B?WXpaYWtiaTErV0N5ZEJCL2JZMHFGczJxSlBleXp4c3N2aGFaQUExeTRPRVhl?=
 =?utf-8?B?Q1V0ektjSDE4dXVjOXFFeFpjbEgzaDRjWVM1TGRFSytMc2szWE9TWDBEMHM0?=
 =?utf-8?B?UjJjRVA1bUxmUlFPQW5jUC84WU9FSDdUY0dFOWhNVmVzRG9ZRlBwR1p2OVZh?=
 =?utf-8?B?bEtyaitzRTU2eHpTZmQ1cWVWa2FZd3VtOU9IUG5NdGZTWHdUTktCRm5ZM3JJ?=
 =?utf-8?B?OG4ydS9sZzhUOWRpcFNkYlJ2N1BoRHppanZDSTk3bUFFR0VLbjZvZCt5YlZ2?=
 =?utf-8?B?bWJxOUxsRkF5aHkyNnVQOFViZHE2NjhHNEhHMnp0R1M4NjRhWDdBcGR3TVN4?=
 =?utf-8?B?OE5JVnBKQzlQenBTdTFuamtiT3g2V3hCOU84bDNLSGFmcGxBemJMRGxaazdH?=
 =?utf-8?B?T2VOdUN5K3RVKzgzaTMzRkFYR0tGVk9xZTBscVNJSWxYdnZCeHptTVYxeDhH?=
 =?utf-8?B?YnVjWHEyTkcxOWFXTm9Lby9ZR3R3aDF4aVQ2SGhZVXQ0N3Z2dXdXVk5LeXlD?=
 =?utf-8?B?Ymc5M2pURzIwb2lCQXcza1lUaXlBYXQ4K3ZSaEhFeWdvM1FBYXZjblZLSG40?=
 =?utf-8?B?S0IzalBkSXpxV05CdXIyQ0hzTlpRN0dUSnVMVDdlQnZDRytSdlBwUmR0bTRW?=
 =?utf-8?B?cmdVaU1jb2RPMy93ZHBkUGgvSTJuVmg2bXErUmlxZHhDYW9xeGU4OEFpSHlu?=
 =?utf-8?B?Q2p6Nnh1czRnYXRsVnI1U0kwU3pkZHlUSWtQZUJMSEFDVmRydFZpMEQ0a1Zi?=
 =?utf-8?B?cTdJQzdNRGEzd3JWM1h2eEVxZzRxVmJoV0l6alZRdSsvTUREMVNxUGUvZjdM?=
 =?utf-8?B?ZXlKVWUwdnBYcnVNc21wbm1vN1Z0NVVucW15YVpSZG5VekxFTElYTEFadW9T?=
 =?utf-8?B?d0lRYlpMK1pzcVFBZzRqS1JkRURJb2RsWVlYcU5MZ2hkSklpWTVDYzZOUnFG?=
 =?utf-8?B?ZnFUY3hBdy9IaWtTZEZHMnR3cXNQcG9RM0pNTHUrUnRMZDJEZkdDQnZnMXhG?=
 =?utf-8?B?eGlZUjhvQ0g2dHJibmp5MC9JT2twdWFRT3FRZXpqMEF1bVl3eDhRNldnUndi?=
 =?utf-8?Q?d9dqjO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJaVGxLbVJrS21vdXd4N29GTDE4V0w0Wjl2Zm95bzdzOTNSWDIyMmU1RHlS?=
 =?utf-8?B?ZkRqUUhkZzF4SHpzam40R0FRQlJKdVRnNVc0V2xNRjRPbDdLbkZtRWc5S3JS?=
 =?utf-8?B?eENLc1Y4Y01wV29hSHJ4SmxXckkzb3RoaFZDdTBCMzhKQmZHN05CUGtua3NC?=
 =?utf-8?B?eUZidzNWMWdTanNnOFFTZzJEM0Ywd1hiYzQvVVNvTjZrcXZhSWRxTVI3SUdY?=
 =?utf-8?B?WFk2dW52VkhEcGI1VzRiYVA1TkF1ckdJdnlST01HY1ovaDdNamd3S3B1UVpT?=
 =?utf-8?B?Y2phdDZ2S0hQVTltQnhXRXhiZHg2NS9YdXB3MFhkMndpQjR3WnA4RHV1TFRn?=
 =?utf-8?B?MFlkbGZLL2s4Z2hFZVM1SC84cHZUOEhOd3p5VVVrVERqM3RwYU1US3AxckF0?=
 =?utf-8?B?Q2tyTTNlYzJGaHZtVGwxRjhPWkh6UlJPaE93T3hCT2drRXJtNEpZM0xUWjZU?=
 =?utf-8?B?dCtqd2QvblVDbHV5S21OM0hTTDFNeWNVd0g2VEl0d0dhRWpSaE45cFI2UVN3?=
 =?utf-8?B?NWFWTU5ZU3ptQlpMbElEcjdMNWkvdEhsRk9qUDZPbWdIclFkUUR1UDhWMFRC?=
 =?utf-8?B?N1Z5QnNHMlNBYVBSY3lKT25SaWFoNG93L0pzSWtaN0ljZGJxZ3dzVTdITnp4?=
 =?utf-8?B?dmRmU2hCSVArTmhaamM0QXdBM0VzRDdvMjZSWW1yaHlXbUZ1eXVDcnc2ZDNo?=
 =?utf-8?B?SDFkUk9zUnp6VWRBcndjd0g2NFZTekZWNU1DQXg5b0NOUTlFbldWZ2FxVTIv?=
 =?utf-8?B?RXJNUkxvLzVBeExEOXNiRit2Wnp2YlhFa1FpZHAraGZveGRGL0R4SjdVRkJq?=
 =?utf-8?B?WjJ3SjN1U0FjUUhMMmtBZnZucUE4SE5RT1hERTIzS05VY0Zjamc5YjJTS3hS?=
 =?utf-8?B?ZGtadTlFbThuKzUrU0E5M2swWlZ0VUpXRUFhOTN6Y2FKUlZVVUtPNCtVOWlR?=
 =?utf-8?B?RE9YUnlwei9YVTI1Ymc3Qkd2WmVPRDY4a0RtOVdxMFBPd2RKdHZ3dktqMTI5?=
 =?utf-8?B?NTY2VWI3Z1ZyT3Z4SXdNOHRZL1VkVlMrTjNOcFZhMnZhWXhmYXhEMmx4Ykp1?=
 =?utf-8?B?Wk1YNmVKQXlMak9ITkJUSVorcDhScUNTQ05pNUI3TzNEUWxkbDhNNThia0VV?=
 =?utf-8?B?MFdiYVc2TWk2dTZnM3lrQlJENStMVnJlaDJORzhBWXhEQjB2WGdCdStVSDJj?=
 =?utf-8?B?cDl2WEVjSmNKTHpJejJBMzBUUkNvaHNiU0tJMGw1cHFPQU1iQjZCUExscWN0?=
 =?utf-8?B?c2NYaE92STdSK1BaSFJhT25uNlBsVzl2Z1lPMy9ERXUwbHN5Y2RJam01WGtz?=
 =?utf-8?B?bjhBRXFOL1dIVGdVdjFwVkF1aTdFcU0rVDlEcDV3ZTJralE2YUtuRzNLMTF0?=
 =?utf-8?B?R0dneE1sbGpJejR5bURPWEJwM2VSQ2xmMzVuNFYyaVhvSnhYRExpQUF5dnk4?=
 =?utf-8?B?YVp6d3poeDhSYVR3RG9vcllORnhvNDkyN3E3a1JUQ2VWZTdGUUhMWGdsR3Q1?=
 =?utf-8?B?T2RueUR6bDJxelA3azlFYjVXMk1oaDNDN1h6VW5hZ2xScGxVaXREcnFjemFJ?=
 =?utf-8?B?Sk5Lb0NYTXliUXVncWUxTHZ4WXFaSDJmOU5WdUltOWFLQXR3UmNnbmphM0JV?=
 =?utf-8?B?dTJYUnh1ZjY5ZGhrMUpKMWhqTjJxdXpSTXlKWGR5TjNwVlNZOGVJRHM1Vmp2?=
 =?utf-8?B?QmZuWG10NHowVnZwaDFwVzhZeTViNVNDb3dIQ0xtSDBGNnhTWjhsY1NzV2lL?=
 =?utf-8?B?eGdkRlBmTXZjekNIc2dHQW5MOXpqdHlSTFJZTG5sSVdxWkhmWlhDbzFGaGtL?=
 =?utf-8?B?MjR1UmRhbk01MGRWSjNEU1JmYlY1SHhwTXEweFVUUUZReTc2OVVuS2lTalVN?=
 =?utf-8?B?SUpVQmRJUi9YM3liaHNCOGNPVUJVTXk1aEREZkFpSDN4R0dzM0RpSzVFVmEx?=
 =?utf-8?B?ZGJFdmxFVjd0VVVqZDkrMEl3b1pieFo4MkNPQ1puRkhjajhpNkNQd2hrR2Q3?=
 =?utf-8?B?RXFxL1U1S1IwazBBVzNWK2c1NGF1L2VJUGdGSDVnSzAwVlNHcDdEeHdxRGNn?=
 =?utf-8?B?VXFUSG5JTzB0dXBSWXY5cXNFLzZ5eXp3LzJ6WFFDck80SW5DMGIxUkJQaUh5?=
 =?utf-8?B?dStOUmQvNzBqRUh1TS8wTXp1RldPaWVERGdYbFVRb0IvZ2p3TldaMWcyQWx3?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f86489-6b03-46a5-225b-08de1556f8e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:47:22.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/dypi9GdRLDaLcS+EAszVlKYhmdx8iGUpRzJpAsZedyTiMRWmZA0o77bpSkwUGaQTYajAH6c7Ba0koqZBom13Mp3L0KD9UY128vdEf3yg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
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

On Thu, Oct 23, 2025 at 12:18:09AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Now that it's possible to free the packets - connect the restore
> > handling logic with the ring.
> > The helpers will also be used in upcoming changes that will start producing
> > migration data packets.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  29 +++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 127 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  31 +++++
> >  6 files changed, 195 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 89e5b26c27975..3d72db9e528e4 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -173,6 +173,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_lmtt_2l.o \
> >  	xe_lmtt_ml.o \
> >  	xe_pci_sriov.o \
> > +	xe_sriov_migration_data.o \
> >  	xe_sriov_pf.o \
> >  	xe_sriov_pf_control.o \
> >  	xe_sriov_pf_debugfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index cad73fdaee93c..dd9bc9c99f78c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -18,6 +18,7 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> > @@ -851,6 +852,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> > +
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > @@ -1045,6 +1048,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> >  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> > +
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> > @@ -1078,6 +1083,8 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  
> >  	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> >  
> > +	xe_sriov_migration_data_free(data);
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index b6ffd982d6007..8ba72165759b3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -14,6 +14,7 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_migration.h"
> >  
> >  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > @@ -418,6 +419,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> >  	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + */
> > +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	if (ptr_ring_empty(&migration->ring))
> > +		return;
> > +
> > +	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
> > +
> > +	while ((data = ptr_ring_consume(&migration->ring)))
> > +		xe_sriov_migration_data_free(data);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> >   * @gt: the &xe_gt
> > @@ -543,11 +563,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> >  	return ERR_PTR(-EAGAIN);
> >  }
> >  
> > +static void pf_mig_data_destroy(void *ptr)
> > +{
> > +	struct xe_sriov_migration_data *data = ptr;
> > +
> > +	xe_sriov_migration_data_free(data);
> > +}
> > +
> >  static void action_ring_cleanup(struct drm_device *dev, void *arg)
> >  {
> >  	struct ptr_ring *r = arg;
> >  
> > -	ptr_ring_cleanup(r, NULL);
> > +	ptr_ring_cleanup(r, pf_mig_data_destroy);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 9e67f18ded205..1ed2248f0a17e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
> >  
> >  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> >  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
> >  
> >  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_migration_data *data);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > new file mode 100644
> > index 0000000000000..b04f9be3b7fed
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_sriov_migration_data.h"
> > +
> > +static bool data_needs_bo(struct xe_sriov_migration_data *data)
> > +{
> > +	return data->type == XE_SRIOV_MIGRATION_DATA_TYPE_VRAM;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data() - Allocate migration data packet
> > + * @xe: the &xe_device
> > + *
> > + * Only allocates the "outer" structure, without initializing the migration
> > + * data backing storage.
> > + *
> > + * Return: Pointer to &xe_sriov_migration_data on success,
> > + *         NULL in case of error.
> > + */
> > +struct xe_sriov_migration_data *
> 
> no line split

Ok.

> 
> > +xe_sriov_migration_data_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return NULL;
> > +
> > +	data->xe = xe;
> > +	data->hdr_remaining = sizeof(data->hdr);
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_free() - Free migration data packet.
> > + * @data: the &xe_sriov_migration_data packet
> > + */
> > +void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
> > +{
> > +	if (data_needs_bo(data))
> > +		xe_bo_unpin_map_no_vm(data->bo);
> > +	else
> > +		kvfree(data->buff);
> > +
> > +	kfree(data);
> > +}
> > +
> > +static int mig_data_init(struct xe_sriov_migration_data *data)
> > +{
> > +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> > +
> > +	if (data->size == 0)
> > +		return 0;
> > +
> > +	if (data_needs_bo(data)) {
> 
> 		struct xe_bo *bo;
> then
> 		bo = ...
> 
> so will not have that long line

Ok.

> 
> > +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> > +							     PAGE_ALIGN(data->size),
> > +							     ttm_bo_type_kernel,
> > +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> > +							     false);
> > +		if (IS_ERR(bo))
> > +			return PTR_ERR(bo);
> > +
> > +		data->bo = bo;
> > +		data->vaddr = bo->vmap.vaddr;
> > +	} else {
> > +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> > +
> > +		if (!buff)
> > +			return -ENOMEM;
> > +
> > +		data->buff = buff;
> > +		data->vaddr = buff;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +#define XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION 1
> > +/**
> > + * xe_sriov_migration_data_init() - Initialize the migration data header and backing storage.
> > + * @data: the &xe_sriov_migration_data packet
> > + * @tile_id: tile identifier
> > + * @gt_id: GT identifier
> > + * @type: &xe_sriov_migration_data_type
> > + * @offset: offset of data packet payload (within wider resource)
> > + * @size: size of data packet payload
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> > +				 enum xe_sriov_migration_data_type type, loff_t offset, size_t size)
> > +{
> > +	data->version = XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION;
> > +	data->type = type;
> > +	data->tile = tile_id;
> > +	data->gt = gt_id;
> > +	data->offset = offset;
> > +	data->size = size;
> > +	data->remaining = size;
> > +
> > +	return mig_data_init(data);
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_init() - Initialize the migration data backing storage based on header.
> > + * @data: the &xe_sriov_migration_data packet
> > + *
> > + * Header data is expected to be filled prior to calling this function.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
> > +{
> > +	if (data->version != XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION)
> > +		return -EINVAL;
> > +
> > +	data->remaining = data->size;
> > +
> > +	return mig_data_init(data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > new file mode 100644
> > index 0000000000000..ef65dccddc035
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_MIGRATION_DATA_H_
> > +#define _XE_SRIOV_MIGRATION_DATA_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> > +
> > +enum xe_sriov_migration_data_type {
> > +	/* Skipping 0 to catch uninitialized data */
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_GGTT,
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_MMIO,
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_GUC,
> > +	XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> > +};
> > +
> > +struct xe_sriov_migration_data *
> 
> no need for line split here

Ok.

> > +xe_sriov_migration_data_alloc(struct xe_device *xe);
> > +void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
> > +
> > +int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> > +				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
> > +int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> > +
> > +#endif
> 
> just few nits, otherwise LGTM
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
