Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139EC3A937
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 12:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61710E012;
	Thu,  6 Nov 2025 11:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3m+vHaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B610E012;
 Thu,  6 Nov 2025 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762428621; x=1793964621;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+/i63CJds7wqrdV81IXLQn3mGouqBnJ50Aat1FipRwA=;
 b=b3m+vHaa0d0ddFlZZXrNPRQEdUx1WxGDjcs7KeDBBNAqd99eZ78kPgym
 dKj0AlHfkGMyxSPA4Yjqw+AQaNqqOIoT+SnZoSqibv5q2UqZzoGl7/5hu
 rM22Pd/W2Y+/hiwWAGw4TUWxpW1xtUNTxvjZyi+M8YpDaSPl4sldj7Jcr
 IQFJYv+8IgidVp8z4U0wfaOEjSYZTnN77jYGoZvqqQeVuN54GuJAtVDY7
 idev3rs2klatWEvodv4hx5vjBJwqp7ldEJTvHX4xWnaoNlvssX4wMTxEV
 V9f0CjrhHa/KZofxrx5cv0o21DiQYQ21kzzm0jznVvsu0mfzzAwda32jT w==;
X-CSE-ConnectionGUID: dydapZdaSaeOT7dAXs5EMg==
X-CSE-MsgGUID: lnqvB7wsSLyTuk98dM00xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75247492"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75247492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:30:21 -0800
X-CSE-ConnectionGUID: i6ryKwuYSlWniYj6fz7VTQ==
X-CSE-MsgGUID: rsnBx7M/RUWRmQd5JN7OFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188453996"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:30:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:30:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 03:30:20 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:30:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAcX6LE955w8jJML61U+4yVuxPz45MXa/isszt1w2SfxiOiBp9QZ00+lBLNpYgC3uIfNyQTFGtMf9m9Y0fs7uun4YI+Td62b5+L5/dBwHNcyccqZQSLlSDIXMu2XG5t1i5ly4NqmNGryhbhvwoiuobVS8jf/vWk5lYSIfB5FQgnmnWw+YL5sRJwwklOfDhAl/ouTW88ISP2oR78ENazkDicw+T1FK99ni3gHG8FZ9IuCYgEX9Houg65bXAoI1mn68U/zNZ4IJs1XfaJ2OExvFCy0KtOn1Dr6wkGbW7t6Si7DZtNPRQtMuhhrWGc7bt18gMJXDhYVd7OdmzxmtdhCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoC4SNQpHvFvOtJ0khylMOVyUaRY+NK4l+HOgtqz8JU=;
 b=iOkIYNXIDJ0HPTgEHhUHUb+ZT0QLKS3CMfJODTREsN4la3UFdgvTJ4at4wYhE15/UNsH52REO0v78r2/XAGjXjbPStLLmVSzZ0aa+kUXI6DgEa+5AkEimmft3B/1GUXNh/kr6RXoFH9fwY5PRPD+zPG6WYTndNCa3hX1+8eFHQh4S2BDm+LG0NVCKoW2G08QN9knyYkGouRj6yoLqZfHAOX8LsSUMvl6eVMrF7hCMTEo7hOOjsjx8bdQJygCvlbH7MgS+iMIcTc8X7LmMkP6QIDjETw0OfwCsY8+V7JGOUJPiaJEHXsY/dgjjDNRUd6/n8mvqYj77IlgXctkOilq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 11:30:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 11:30:18 +0000
Date: Thu, 6 Nov 2025 12:30:14 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v4 06/28] drm/xe/pf: Add helpers for migration data
 packet allocation / free
Message-ID: <zrizafnlgpnuxdtg3vw67ndac3hbhethbczhgia7225fete7v2@nrw2bwtyquwq>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-7-michal.winiarski@intel.com>
 <8098e7d1-79ab-41f1-8036-4feacf87a941@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8098e7d1-79ab-41f1-8036-4feacf87a941@intel.com>
X-ClientProxiedBy: BE1P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc4812f-2c7b-46ad-2743-08de1d27dcf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjJmRC9vTGhsMGw1RXNXVnFENTRSZjdhTlo5cXRhRU82WnlyT09OUFJSa1ZX?=
 =?utf-8?B?cXphZW5BNXJnOTJ2QkdzcDZjc1lYa3NwdU93L0NhOTlGQ01YaTk4WjlNT01C?=
 =?utf-8?B?QVB0eHliUlp3TzgvdW5VbEdFdDlLZnJJNU0yQmhiUWw3bkZYTllHdG5mUUpT?=
 =?utf-8?B?UUw0NzBwVlJ2ZzFsRUM2dTNINitkRWVQRTgvYk1icWNXZFd3MkplRHhtRXYz?=
 =?utf-8?B?dy9aaXlJR05PcUJhWWdxV3NLU3hiZnJLdlh2ampwRmR3R2VMOG02VU1yOHov?=
 =?utf-8?B?OGVXNVZVejNGL0tkaXNaekt1SFR0TzlJbGdMQVBHSVVmUW90MDhQaHQwL2tN?=
 =?utf-8?B?NmlweEozV1Fnc25ia3c5eUVYL1MzTnBmYnh6WktSNWlmSVR5bitPaGM2WUg5?=
 =?utf-8?B?cFl5ZWpiMHZmRXZvTm4yWUdSb1M2Q0o4dW1ZMno4U29NZGRCMnRySS9MVVNX?=
 =?utf-8?B?elZOdHNnKzhPZVl5NzhiNnF4Wm1NWUdHWTZ6OXgwZjF2SkV2LzMySHl5cW9P?=
 =?utf-8?B?SVVxWk1nMzFlalNoTFFQd3pxYmVta01yUEpuZ25RdTE3UmlpVk05NVE5cXoy?=
 =?utf-8?B?WjhCTldNZGpIelpSak11anB4eUp2TjR6QTZ3QXdXd0tpdGJ5cVF3bkRzWUpO?=
 =?utf-8?B?Z0lNNXpFdFBaMEJZK2JsL3Rna050U2grKzRPQ3V0aW00L1l6cEtzZ2NZbVoy?=
 =?utf-8?B?d3hLdVY3UkJ5TWhDSXVpalIzOCtGMVFCYTZ4aHZwRG5ML2hpV0FLUmh4cVdy?=
 =?utf-8?B?VVFqdlVRbmF0RnFINy9PZXpnSEloUWxvKzlCNmpHei9ZM281VElacE5lQU1X?=
 =?utf-8?B?K0dnNnB1d1JjbGxUc2xqVzR0RXRKNGdXZWxnT2tMYURObURkY2JCK3ZhT2dK?=
 =?utf-8?B?eUJOVUROVTBXbjFickhaYVgxUGkrUnJ6U1RtWXJGYjZsdnJzWDgrcUJENUZn?=
 =?utf-8?B?djhoaVVQOTFrSHRaN3ZvbUVxalN3N2hvVUxlNDFxTGVlNWdzN0Y4WGlIaXZj?=
 =?utf-8?B?ZTNkVXFJK1V6YytjdlBNd1BzL2tBNXp3ZGRsVFZRc1FHVStjckxrMDROMDg4?=
 =?utf-8?B?ODcvR2IzSGdLS2VwLzNGOTUrd2xhanZsc3EwMzZPYjVZL3poUnpJQzBLV2ta?=
 =?utf-8?B?MllwUmRQdGdaWlN4ZVRPZDh5V2k5bXlKeFc4d0N4b3pVMkRMZmpmUHh6eFZE?=
 =?utf-8?B?aEptWkV5dUkrSytUajlUbkxSYll5NkdDaG5ZSnBYYzFvZVMzcVVnNUNlSkZp?=
 =?utf-8?B?c05pRGwrMlRnWVY4U3ZaeW42Q2JBRFIxU0lWU0tsVXU0VWh1SC9JMkVSdXhJ?=
 =?utf-8?B?WnQ2UkhzdjlhY2t5VG1UeW1PWkhPTzFyTUsyTk5yM0FFZk1oZzhhSi81SE8r?=
 =?utf-8?B?WCtuNS9pNGZtL1BxQVk0U21VZTd5ODhhcGh5dUlRU1lTSG5xaDhvcUVuRitC?=
 =?utf-8?B?aURzd3BXVW9kd1k1VlNOcWhWZC96akIySzJkT0VZZUpBNmtXUW5QQTV4WmU1?=
 =?utf-8?B?bmZxV2pCSlBDaXFOYSsvT0h2VDVsd09GaGFKOUN5YU1UaS9JOTVSL2pmeTF6?=
 =?utf-8?B?QklVRHk2K25lQ1RPcGNXSUxuSnVWOHV2RzBpYzV3UkhxTWJQQ0U2VXErYU51?=
 =?utf-8?B?aEgyNFBxT1JLY1UxWWZ2WDI1YlBteFlHbTJDWmllMjk5RjBLS0docS9NWDNx?=
 =?utf-8?B?aXZ4VENvSnEzLzJZWHUrZlFsQVIxeFhtcjBCVG11cDJ0K3RRaGU1dVZxMEts?=
 =?utf-8?B?M3hac3pQVXQ3YzRrQ1doQmlCYlFOV3hKOXZ6RWludUVjRXpHazcrR3dNOWJW?=
 =?utf-8?B?emR0aXdZTVpyVlJ0YmFLZ2RHelR6ZGdsc0NaQzZ3MnJqU0JtVVFhenB4VDJY?=
 =?utf-8?B?aDFLZWU4Q3lOMkk1bFMrd2F2U25nL2U0Nm1ESitMU2szMFdHTGRQRFNZcVhl?=
 =?utf-8?Q?nfK7p/TYlrWY3lIFC+q3o9tneWTAnAd6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTB1QTI4NlJ1VlBlUTJlZkxaK045ZDF3bWtCTmhoSVovbGw4L2tqak11T2N3?=
 =?utf-8?B?ZjdIQnpKdkZuY3RzQyt0STJoMyswQVErSTdFcURkRzkycmQvelN6dnZJUno2?=
 =?utf-8?B?RkxqTTlQdXlKSVRRYk9CcXdaMHFGZ2c1Um44dGhYS2RwRHFmVktDam9RdzM3?=
 =?utf-8?B?SzRBYXdhbCtvUVArSEZIZnp6QmNRMkVoSVFJdlZwSmdiMHJDdy8raWVlS0Uw?=
 =?utf-8?B?dUd3MTBhUjBlUStRc1E5SDIyMk1LOVFzYW9MY3NsTjFOU0k0SWlSSll0ay9s?=
 =?utf-8?B?ajZ1Z1c5OVdxc2tqNFZsUlM0c3BiNW9nUTZ2SFQ2RDd4T01hb2lMMG54OEF2?=
 =?utf-8?B?eiticEoySE5iUmdrSitJZ2IzL3RnQmlPQUxCYU1weWtZUGhaODBoY1hMZXNK?=
 =?utf-8?B?WUZQSGpOZ1BpVWtHVENLY2RqSWIyMG44LzFmaDJ3T0R0OUk0dElOYXQxYUxm?=
 =?utf-8?B?bWVoUXZSZGtlNVc4M2w0OG83bkIvSEJBbGpFNVR3Z2dvVnBoNFoxcVBEZ1ln?=
 =?utf-8?B?WnpMYUo1Q3ZLSlh5MWFia2xFU2g1N2RnL2l4Vm9TL2RYU2t4cktCbzdFMERa?=
 =?utf-8?B?YzREdEQyb05jNVRRdGJibmFqSTEyR2NkZUxVYUlSVWhQemlSQmtnRG9zNWhv?=
 =?utf-8?B?ajg2djdUWjFLM29qbWVDTTN4czh0UHNzekNMNGo4WC9oN1p0NG1uWWljeFZM?=
 =?utf-8?B?eWk3SCt0Qi9NV2d2RGM3TkMyaTlUWDBITjRPQjFwUnpOMU1pVFNHQW9UYzlC?=
 =?utf-8?B?Qi9PQThKaGxNY3FsMGhmUm8rYjJDVGo1NGxsRFF4dkhPRTA3YTBENGZzRTY1?=
 =?utf-8?B?eVZ3aVAxRGo3RC9pSnhoNnBYWDc4a2pkNDducTBvczV0MDBFZ2hlNnlPWjRv?=
 =?utf-8?B?a2J2c20yK2xCY3NPS2lSUHI4U3laR2plRGRLaTZheE9OOU41aHZxdGdlWHEr?=
 =?utf-8?B?UmJ5MElPaWxYaFM4ZFhmN3dlTUlFM0l1cGtTbUlRald0UVk5cjdva1dUWkpZ?=
 =?utf-8?B?RVFKdHdncmdUSXk1UzBXcGEydUR1N3FBUVhrUHpNYkdnTkcxT2IvVXBla0Vq?=
 =?utf-8?B?Vi9CZHFwNm4xU0thdnVVeDFLZHFGSEh5Rkt2dDhhNVZSNXlBWnFId2N5Rngw?=
 =?utf-8?B?Z1QxVXd1VGRsbURRTS85MzQ0QkxBdHoyajNJU0c4YUwza3Nicm56Wnh0ZFdr?=
 =?utf-8?B?OTZXd1FWOXpJdWJVckQ0aC9TUGxQWDFRMmRzUEM5VVZ6UUEwYVFEaDRhZjN4?=
 =?utf-8?B?WVlObFdHL1hIaUt1VU5IemJOVERRVytYSHRHRjJKbXdMWWpka1JHWHBSUnRn?=
 =?utf-8?B?SlBOYUV5cWROYnJCOEZDTHkvdnpyeTBXSUhEQnMzMVk3bDl4TkFUOXA4cWtZ?=
 =?utf-8?B?dFNXT0NIbHlWUjJBVG55QTNtQW1tTG5KZ0RPVHhhYTRDdjF0WTRHR0V6OW54?=
 =?utf-8?B?UGl2cjBXMHprV0VwRDdwM0twWjY1UitrUzdLVHNvOU02b0U1S3hoTDZLTGEw?=
 =?utf-8?B?V05IRGxGc1ZyTnRBSlptNUpPMFBjUEtZeEt5cjVTQmpKckpnWjF6MHUyWmR3?=
 =?utf-8?B?aFk1di9YYjUwb1pqZFlNZWZDMmx2NGJxL2ZPNVB4Ly94Wk9KTTNaZjlBNTdn?=
 =?utf-8?B?WjBhakJ4ZFl1UnpNU2FJcUdvZkVOTUJLY0N2SmVMNW92LzJsMERuY2NIbEtF?=
 =?utf-8?B?eTZ0V0hiU004V3g0WHFuakdmUVZTSFExTkRDQXo1aGgwMUhTTzBGL1VGQ3Aw?=
 =?utf-8?B?UHNRZGxsNzE4cFk0WDJ1b2hUZGNiOGY1Ly9CQmkvamp5YUJPNU42RjBjTHdC?=
 =?utf-8?B?VU5vQ3A4Mmg3M1BuS1pVSTc3NUR2eFFFSy9RUmV2Ynl5YUpxM1VLN3lBNkxU?=
 =?utf-8?B?OW1Jbk5odEI2dThDU0ZxMGRPbkxqRTJiTlpPamM3OXJMcDAvTVUvK0tSU1ZW?=
 =?utf-8?B?T0dEeE9XYWRhN3ZoTkVwSDZXTWxXNEtXWG5pcWYvSnE4UXhIZ2FkV2xsa2dk?=
 =?utf-8?B?YlRDWVdzTFlJcUJIT3ptVVF4WkRLczNwQkoweUIxaTlRLzdQSEV4SWJIMnUz?=
 =?utf-8?B?S0hSWVRqVVNrQk5EK0FCM2lCR0pWcitEd2wybGRaQzhoSnFKaDdDdjFWTi9v?=
 =?utf-8?B?aHJnc28xcG1VNGhiOExrKytyRjhtUVNOZWF3Tk8xR1AzdnIrcHNnVzNyUVJy?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc4812f-2c7b-46ad-2743-08de1d27dcf0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:30:18.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf5XLTZhwJM5KTtSSw2FSBGHazm6r0/Z7NlayDwDHdgNvy7tNkDGRkiqmXpadNsml4yLqmL3wy6buL7eqHFJZiNqizaO4bem6+qntnV3g0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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

On Wed, Nov 05, 2025 at 10:12:07PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/5/2025 4:10 PM, Michał Winiarski wrote:
> > Now that it's possible to free the packets - connect the restore
> > handling logic with the ring.
> > The helpers will also be used in upcoming changes that will start
> > producing migration data packets.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  11 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  33 ++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 129 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_packet.h          |  30 ++++
> >  6 files changed, 202 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index cb6b30fd8c2d8..e4b273b025d2a 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_lmtt_2l.o \
> >  	xe_lmtt_ml.o \
> >  	xe_pci_sriov.o \
> > +	xe_sriov_packet.o \
> >  	xe_sriov_pf.o \
> >  	xe_sriov_pf_control.o \
> >  	xe_sriov_pf_debugfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index db57f9d9b491f..25937592bc42f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -18,6 +18,7 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_packet.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> > @@ -852,6 +853,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> > +
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > @@ -1074,6 +1077,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> >  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> > +
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> > @@ -1108,6 +1113,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  
> >  	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> >  
> > +	xe_sriov_packet_free(data);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1201,8 +1208,10 @@ int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid
> >   */
> >  int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> > +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED)) {
> > +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> >  		return -EIO;
> > +	}
> >  
> >  	pf_exit_vf_restore_wait_data(gt, vfid);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index d9ca9ea737dcc..c492677db28d9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -14,6 +14,7 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_packet.h"
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
> > +	struct xe_sriov_packet *data;
> > +
> > +	if (ptr_ring_empty(&migration->ring))
> > +		return;
> > +
> > +	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
> > +
> > +	while ((data = ptr_ring_consume(&migration->ring)))
> > +		xe_sriov_packet_free(data);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> >   * @gt: the &xe_gt
> > @@ -544,8 +564,10 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> >  	data = ptr_ring_consume(&migration->ring);
> >  	if (data) {
> >  		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> > -		if (ret)
> > +		if (ret) {
> > +			xe_sriov_packet_free(data);
> >  			return ERR_PTR(ret);
> > +		}
> >  
> >  		return data;
> >  	}
> > @@ -559,11 +581,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> >  	return ERR_PTR(-EAGAIN);
> >  }
> >  
> > +static void pf_mig_packet_destroy(void *ptr)
> 
> it's not a "pf" call, but 'destroy' callback, so maybe:
> 
> 	destroy_pf_packet()

Ok.

> 
> > +{
> > +	struct xe_sriov_packet *data = ptr;
> > +
> > +	xe_sriov_packet_free(data);
> > +}
> > +
> >  static void action_ring_cleanup(void *arg)
> >  {
> >  	struct ptr_ring *r = arg;
> >  
> > -	ptr_ring_cleanup(r, NULL);
> > +	ptr_ring_cleanup(r, pf_mig_packet_destroy);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index b29d34a835b71..b4c7b5dc9e914 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
> >  
> >  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> >  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
> >  
> >  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_packet *data);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
> > new file mode 100644
> > index 0000000000000..2cdcfb2073d00
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
> > @@ -0,0 +1,129 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_sriov_packet.h"
> > +
> > +static bool pkt_needs_bo(struct xe_sriov_packet *data)
> > +{
> > +	return data->type == XE_SRIOV_PACKET_TYPE_VRAM;
> > +}
> > +
> > +/**
> > + * xe_sriov_packet_alloc() - Allocate migration data packet
> > + * @xe: the &xe_device
> > + *
> > + * Only allocates the "outer" structure, without initializing the migration
> > + * data backing storage.
> > + *
> > + * Return: Pointer to &xe_sriov_packet on success,
> > + *         NULL in case of error.
> > + */
> > +struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_sriov_packet *data;
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
> > + * xe_sriov_packet_free() - Free migration data packet.
> > + * @data: the &xe_sriov_packet
> > + */
> > +void xe_sriov_packet_free(struct xe_sriov_packet *data)
> > +{
> > +	if (IS_ERR_OR_NULL(data))
> > +		return;
> > +
> > +	if (pkt_needs_bo(data))
> > +		xe_bo_unpin_map_no_vm(data->bo);
> > +	else
> > +		kvfree(data->buff);
> > +
> > +	kfree(data);
> > +}
> > +
> > +static int mig_pkt_init(struct xe_sriov_packet *data)
> 
> nit: no need for "mig_" prefix, see above pkt_needs_bo()

Ok.

> 
> > +{
> > +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> 
> xe_device_get_gt() may return NULL and this will make static code analyzers unhappy
> 
> either we should check here gt again, or maybe store the valid (struct xe_gt *) in the data,
> as we already have (struct xe_device *data.xe)

Ok.

> 
> > +
> > +	if (data->size == 0)
> > +		return 0;
> > +
> > +	if (pkt_needs_bo(data)) {
> > +		struct xe_bo *bo;
> > +
> > +		bo = xe_bo_create_pin_map_novm(data->xe, gt->tile, PAGE_ALIGN(data->size),
> > +					       ttm_bo_type_kernel,
> > +					       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED, false);
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
> > +#define XE_SRIOV_PACKET_SUPPORTED_VERSION 1
> 
> nit: add new line here

Ok.

> 
> > +/**
> > + * xe_sriov_packet_init() - Initialize migration packet header and backing storage.
> > + * @data: the &xe_sriov_packet
> > + * @tile_id: tile identifier
> > + * @gt_id: GT identifier
> > + * @type: &xe_sriov_packet_type
> > + * @offset: offset of data packet payload (within wider resource)
> > + * @size: size of data packet payload
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
> > +			 enum xe_sriov_packet_type type, loff_t offset, size_t size)
> > +{
> > +	data->version = XE_SRIOV_PACKET_SUPPORTED_VERSION;
> > +	data->type = type;
> > +	data->tile = tile_id;
> > +	data->gt = gt_id;
> 
> shouldn't we validate the tile_id / gt_id here?
> 
> we do have valid data->xe here, so we can try:
> 
> 	data->gt = xe_device_get_gt(data->xe, gt_id);
> 	if (data->gt)
> 		return -ENODEV;
> 	data->hdr.gt_id = gt_id;
> 	...

this call is only used on the save part, so there's not much point in
validating it as tile_id / gt_id comes from the driver itself.

> 
> 
> > +	data->offset = offset;
> > +	data->size = size;
> > +	data->remaining = size;
> > +
> > +	return mig_pkt_init(data);
> > +}
> > +
> > +/**
> > + * xe_sriov_packet_init_from_hdr() - Initialize migration packet backing storage based on header.
> > + * @data: the &xe_sriov_packet
> > + *
> > + * Header data is expected to be filled prior to calling this function.
> 
> maybe add some asserts to enforce that and check data->hdr.size and other fields?

Ok.

> 
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
> > +{
> > +	if (data->version != XE_SRIOV_PACKET_SUPPORTED_VERSION)
> > +		return -EINVAL;
> > +
> > +	data->remaining = data->size;
> > +
> > +	return mig_pkt_init(data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
> > new file mode 100644
> > index 0000000000000..2c5a49897d763
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PACKET_H_
> > +#define _XE_SRIOV_PACKET_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> 
> also
> 
>    struct xe_sriov_packet;

Ok.

> 
> > +
> > +enum xe_sriov_packet_type {
> > +	/* Skipping 0 to catch uninitialized data */
> > +	XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
> > +	XE_SRIOV_PACKET_TYPE_TRAILER,
> > +	XE_SRIOV_PACKET_TYPE_GGTT,
> > +	XE_SRIOV_PACKET_TYPE_MMIO,
> > +	XE_SRIOV_PACKET_TYPE_GUC,
> > +	XE_SRIOV_PACKET_TYPE_VRAM,
> > +};
> 
> shouldn't this enum be in xe_sriov_packet_types.h too ?

Well, there's no xe_sriov_packet_types.h in this revision ;)
But yeah - I'll move it there.

Thanks,
-Michał

> 
> > +
> > +struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe);
> > +void xe_sriov_packet_free(struct xe_sriov_packet *data);
> > +
> > +int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
> > +			 enum xe_sriov_packet_type, loff_t offset, size_t size);
> > +int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
> > +
> > +#endif
> 
