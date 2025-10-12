Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B12BD09D0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27F410E04D;
	Sun, 12 Oct 2025 18:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de4C4baI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0110E04D;
 Sun, 12 Oct 2025 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760293937; x=1791829937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H1YAMw1qXfNE/MiyWhrefyH6lQNMnCz0zRNiCgAiBUk=;
 b=de4C4baIvluU74CTOqoq+Dw+ZqkrzsMWuNHm4renfjoZZzr4eNzf9OGY
 zE9uyrsADZly6SWB77THB72u+9z2mltAtJaJpoEhLRLOowilDyeSKuRWC
 mLWn437+YKySUpFOUYYP/CoE5cvJHyfHZE3fNJgQkxhrk6uWsgmZj5ePa
 MlFSWCdlXUyqPTLBM+DFIZNCMzJSJwVSeCmbFvhxazkGu1Xz5/jZ1TSo5
 +X/D7YNRO5v44LZ9d3tx22OlVQ2lk27bpWgpuM06vNEssxtFyumG5z1Sg
 G9s8OhFH3rUHCQLsM48pIiLNKBetysW43HnaObtNBC0A57kodI2Rd+NF8 g==;
X-CSE-ConnectionGUID: /ePtpdCSSPq0cB3NuDSXKg==
X-CSE-MsgGUID: e279sUgASGSX92JJBleJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="79886306"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="79886306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:32:17 -0700
X-CSE-ConnectionGUID: zvWeovgIQjiHjWpOM2hvBA==
X-CSE-MsgGUID: +07EVr37TC2VGFa71uYTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="185680283"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:32:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:32:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 11:32:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHnKpYZFD6TDtuA5gAwM1T1WmzjgPvkm7iR6WxlFJAmDIdECJdsfC7LhN4QGwgb2CrOZ4TpM6eh27h2TR8E61VJIUWPnDKHendoeZO+XPppH1SXnJ/hB21qEpmgr37EolbtJQl6i/Q9CpDqb0fyfda2nYYnjI8O+vOCHUk/rYJngFka8RZDEK+jaoUe5+INFct3iXZnPdM8W90xYAcbVrqhlGvPHY+1EoOj2yhPcy4taCCWnZ2nPV4o4RK3OIsgdbzTjAxlET2hQnENlnvT6n7Raip6YCIgv/gsA3UVBCTQraP7VVf3GCMWWnlCZG9g40yggqO+eSbRuI28C0YV+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UqlnZVEW9XPPOtpN0sHtavlv5fpHxmVMkb+5WnT1KQ=;
 b=YkVu/91/WDecmD8R/eIkZEfRQa4aSaX19FBAPKWZxiArUTMg56Pg2nSEynVc5kvtSHghru9BhUymAUk5pDRXvugtwqz0LC9DmDAhrABl4iH4tvVA2K1yuzQeDTK4rTq7ivQB9McqbmcDjPG8cnq37nAkCxgpvcSM230Ih1561FVeqIQ7qHA9kp7MNycZaj+YH6C4bkMBjQZ0aqmAep3R6ANO1McXRCZduPe9lLX+ldoMo1hndEYlsBf/y6yMI80Bjby0pBkZYXw5DkywzkamsuIBJE18cwRlxs2kZTUkiS7I3IaRWKfv+UtxTNDJ3LY5ksDss/bNRcNaw3KkGFtlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 18:32:13 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 18:32:13 +0000
Message-ID: <8d7f5004-c38a-48d6-a469-f32e0ec805fe@intel.com>
Date: Sun, 12 Oct 2025 20:31:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/26] drm/xe/pf: Remove GuC version check for migration
 support
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-2-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: ba30972c-ae27-471c-9bef-08de09bda023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVVqV3NXUndoeHhGU1NmaFNPWXpOSm9ZS3UwRGlod1cyNHhzcDU3dUZDSFB0?=
 =?utf-8?B?dHlhdS9leFhteWdGRy9RVEREOUt6eWNpRnJnd1JBNWt5dC9kazBsL3R2MXpv?=
 =?utf-8?B?SzUwSHRRYXFaNXNLSWU5UFcvZGpabElVNUNxNlIwRElnRUlRWHV5VTBXS0VU?=
 =?utf-8?B?MStZcVZ2T3VCYVQxNG5jQWxNZkQwMnBud1dlYmZsSER3MXBuVXNiSlBtSnRZ?=
 =?utf-8?B?RE5wZWZCR0F3QTVtSXRKQmtLQVhqQlBhSzlCMzB5cFNiS3dibmM4cDFiZzdC?=
 =?utf-8?B?bEs4czFtdzF0dTFtMFVLblp5V1haTmZJM3l0Wm1RNWxpVjd1U3MzcStTRGNl?=
 =?utf-8?B?MG5BSjUwL2tqTlV6aVl3dXBnYjNXSzdnem8zUStEMFp6b2haR1BYa3htSjdQ?=
 =?utf-8?B?a0JpVzRHMGdKeXFCTittcUk2ZUt0MGI1MGZvbW43N3drV1N4UUI5QkxnQk0v?=
 =?utf-8?B?MktVUHNMa2hmTldNVHhmdnNWVnJ6M0lRcWlwZ0xWNDVoKzRJQWRiaU1iWnow?=
 =?utf-8?B?U3pGQWxmNGJBbmdIc285S2xsSmNGRzAxM0lLZ3NtSkhBVlVFam9qOTZxMHRJ?=
 =?utf-8?B?RmhaRXk0R3BMWlFaZzBtR1o5OG5rdm92aWZMb1RrdndHUjMzazJwL2VEcUpB?=
 =?utf-8?B?dHpHUERGejMvejhpNFgyMm1veWxQaHNNVDdMeVJROHJWWE90UURIY21qbC9v?=
 =?utf-8?B?WUI3NWcwNHUvdGJmNUc3cmdtdHRiTkdmTHhkVS9zVUg5MlVJb01ORm1iMjV4?=
 =?utf-8?B?YmhWNUdjajVKM2lYZ0I3VDc3d1BJYzhjcUlEMnpwQ29xajBCMnNaTnZ5T1k1?=
 =?utf-8?B?TVZObnJqejZrTnVJVkt6bGdOczFlL3N2Q2Y2RGcwYWxSaUxWSzBrdmpUYzFK?=
 =?utf-8?B?Z0x3cjVwOWtrTndlRHU5cnkrd1puano5M1NiUUo0amJpU1g2SVBxUllKQ0ph?=
 =?utf-8?B?U01rY3BOY3RqVFo0VGZQV3ZNWlh2bGJ4cERweGJvRklGUWJ1SERELzllcjhM?=
 =?utf-8?B?YzJkMkttYXorR1BWYjVNMUdYNzJ5TDNHK2Z3VFlwRDlkbjhQYitNSjhlYUQr?=
 =?utf-8?B?SEtWbGlmNG5mOENmZUpNQytYNTQrWDZWOGNsZFRyMjY1eGtadGxxRmlueHVL?=
 =?utf-8?B?UTU3K3A5QXJCTEdoa2MxVE1VQm92QzAzWWEvL2pEM0M1U1hPUkl5WVNnQnpz?=
 =?utf-8?B?TDZud08zQWpwd3pGY2h2TDhhVjBEL0R4bzUyS2RGZ2FYSDN2em9yeUpEOWQz?=
 =?utf-8?B?VllMTzZaQnlzQmRKRStJM250aUpGUjRvam5KbFd4YkZDSEJFZ3Y3R0tkcjln?=
 =?utf-8?B?MmhpMFAzTXdqTW1OczNkVWlFQlRDVlBvbjJaSG5tSFdxZzlUWFZvNk1KekU2?=
 =?utf-8?B?d3A0OTYwQ3k4V0RnbmZoRExIRGMwUnc2aUFCd2taTTZ4elduZWpZV2NuTHVy?=
 =?utf-8?B?MFRyL3FUVTR5MDBkRGFEOC9mZ1VyclA1S05PTTg4aXdEcHhvWnIrTWxUaHo0?=
 =?utf-8?B?dUoySm4rdGFpTm1VbDJNOXVPYnhWVEZibjU1OFNoaVhObi9HVzhnUUpuSDRL?=
 =?utf-8?B?SWdEdEFKVHBXMDllVzNCSjR5eVlTcjlzcXZrTVMxZGdkbW9adWptMjVBUVVG?=
 =?utf-8?B?VHNyOHR0TnM5UjZJT3NuWE51MGJOTkY1SWZuaXliYk05Yk9aSlhSMC9hQkV6?=
 =?utf-8?B?T003TXBSMGd1ajFrdlk1QzdyVEdTL2VOYXYweDdJdmltOGNERnBqT0FZTGNH?=
 =?utf-8?B?ZlhLUHUzajc0bGdGc0pvbW5WODhnbzNJL3YwK2R6N3hWMDRwZDlaa3RaWUQ4?=
 =?utf-8?B?TlI1QWc2cEVHZ3lqVkM0RnRhQ25udHY2eGZEdUZaOG96WC9NaEpDZzNPZTJR?=
 =?utf-8?B?MWZzVkxRUzNabjhVa1BLRUdkWjYxQnJ6eGFjVWJqOHNzaHF2ZVZjVkhXTFFV?=
 =?utf-8?B?Z2lFdEwyaUh5ZHRhNWQ2YjhlNmp6R0l4eTh1U2pCVjExRkxhcVJ2VDR5Vkd4?=
 =?utf-8?Q?8yEYcuBrH1i1KNuRWCnDUjECXVmV/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clYwem1sV01ZaHZOT0VuNGowaXNUd3ZYUFJTOFhhVGJxbk5VVVJLNjVUb2JP?=
 =?utf-8?B?ME1XRDE5b3dkNzJUNHpkOGJKNmIzUHZpT1pmQi92MUVTUWkyN2NlRVN1TkZH?=
 =?utf-8?B?aEFqbFMzQzFQWjdYOFRmd2FRTUNhMlhXYnRRVGp3akRmZUZwaFE2OXlkSVUv?=
 =?utf-8?B?TjlyUDMwSktITmpsYUhSTENmcHVjTEFiRlVvZkQvTG9tU1FldktySmx2STV2?=
 =?utf-8?B?WUgzVXl2ck1IdHdvSk41YzlJblUxUk9SRWZsZnBDaklTTTdBWlJxclVFK1M0?=
 =?utf-8?B?Ry95bjRDQWtwQzd1ZnU1b1ZPb1Y5eEZWcnNWZTdmdCtSdlJKZGN2K0h6VDRN?=
 =?utf-8?B?QXV1eDk1amczWUkrU2d5QWZXZDFlOXdJRDRVOVpGQnNTNEpmSDU0NTJ2NDE3?=
 =?utf-8?B?Q3BuSithRzgvRGo5KzJyKzVQT1hnbHNINkUybG41OHZkaFNiT3pxOENmWGtZ?=
 =?utf-8?B?UjM0bXM0bld3OWtMR2ordXNacWMrSUlNelV2ajh0RjBydW5wTUNCbXZiWTJ6?=
 =?utf-8?B?anV0UWpzOS8vYzRDbDBJc25RRVBCUXlFdzVXdGZMeWprNC9XejI5eDhZaXVn?=
 =?utf-8?B?eUs1R2huUyt5b0xsQ0VtRjFyeXhuaFd1T3liUlZwUjhseGpUcmt1UVZCZENL?=
 =?utf-8?B?VmVTd3JmV3ZRQzNRWitWVlVkS1JLSHBGWmV0OWRVTWNjY09kUE9KUUVYVFJ1?=
 =?utf-8?B?TTRqTzU4YU1NRXRIdTlhNy9jNnJmNHY1QWVyVnZCVTFaMEJ1UnlOWkw2c1Bx?=
 =?utf-8?B?NzBSWmR6N25mVVFmR3RvbG5JYUpFQnRFMUxZWjloS3FZR243YmNudzZWbTVi?=
 =?utf-8?B?NTdUM0JHRGh6SDNiZG1HbzNwT0ZkWXJOelNDaEtGT3JLRjY4Q05yU1JSb2V3?=
 =?utf-8?B?R0pPMUdzOXUrU2c4eGc3VW5KNHh6dFFodENZWW9WRi8vNlNrc0xZRVo2ZEtB?=
 =?utf-8?B?eVZDWjNNZE56b1o1dzhtRzhQM0xkS3o0MFF5TERhNjlpZFJ5R0Z4Nm55K2F2?=
 =?utf-8?B?NnFKYVlXVTRHY200S0tMRkNTV2lGYjVuaTFOekozR2FwOUhxMFp4NWlXU1Ev?=
 =?utf-8?B?cnlMTXJzOVF1dG52bFB3KzlIZExYNGw1N2RzdXVWQzhiSDkwSGlweWpLUXFM?=
 =?utf-8?B?NlFwVE1jYndBUkxhbkNtTXlhWklqVTRMSENBbEtPRkpoVFZsVkdWaEtRdit6?=
 =?utf-8?B?WHE3N1FvUzhubUYyYVdPZDZHNWRaeGUyUG1uRlk5ZDBNSFVrWERxYTdKK1ZF?=
 =?utf-8?B?QzE5Y2syOHp4blZoclVvSXhLWG1ySjJuVEFXRCtzMmJhQ0hzcU90SVF3dlgv?=
 =?utf-8?B?eExhMlhlaWZoR3BBZ2JsaWRQQlk1Zy9YbWFMMGxZNmEybHZwdjdqUjdmUHZx?=
 =?utf-8?B?SFlzZWJEQ0d3YS9EUGI1TDZrY1lWYk5sWWYzb0pDN2xJdEdnejVuWHozV1dV?=
 =?utf-8?B?NVBLb09HY1RGckdBaWZ6dDdkL3A0cFhJNnRPT0tCU21QdzJGM0U1TnQ0VEl1?=
 =?utf-8?B?Zm13N3FjaTVTMVZmYzkzNEZjM3J5eHBibjZLU0l4ZDNWb2MvNDdKWklVMUw2?=
 =?utf-8?B?UlNQZndkR1RtTUVYdnRVV1JyajllWm00aFNqYWpmTndyTlAvYXhsWDJKSHFW?=
 =?utf-8?B?UDR4Zk52cmQ3ZlY2TXlVNks1M2FZRW9KZUFEL0JlSzJ1OFozS1dZd3ZVSUpr?=
 =?utf-8?B?UkhGZU43MFRzYUljeWVocktBZEVLOWdJa3NmUkZ2UmVXL2JtVjdyR1JMR21w?=
 =?utf-8?B?d3dHbEs2MzY5UFZLTUVSOGQ2andvdTFEdVAwbFJ6bFFQMjRHVGJlOGZObXBZ?=
 =?utf-8?B?RjZ5ejNUMDkxeHh1VTJlK3JKcTEydDZpUnVlYlhROVBVY2k0N01keXNUa2Nk?=
 =?utf-8?B?c2tUVGRnNmhYSTM5VXdZU3lYNWRkSWxhdlNxWWhsamdISGxVc1U4VmJXVzlw?=
 =?utf-8?B?b0VJK3YzSVhqT1NsNGdCR2RRbFdveVcrWmhWVTNyNzdSL1g0REVSRVBXdTFw?=
 =?utf-8?B?cWc4MmdoTjhwQzRqdXBWb08wc2RuVWtJL1MvUCtZWjFoY2NXRFErek1MbzN6?=
 =?utf-8?B?NEVOMjFya3pMSUFrTUY3Z1lKVWVvV0lEWnJ2ajNPQXY1WG9KSTVROE9zMytt?=
 =?utf-8?B?M2dQZVNrN3lobHBJZGVMMzVQcStMUHlySVpqZjgwRXJlVStGTGp0R05FeXVK?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba30972c-ae27-471c-9bef-08de09bda023
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 18:32:13.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANgI8kNKRYUYvLkTyMXr4C7NBInAYO/f1OV/qpbYKamxCKuZ+1uhkg+dM5itHwygvyScn9aiPAUHiZQBWoI7+0UZtAhoc8AKzobSAmZREBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
> version to v70.29.2"), the minimum GuC version required by the driver
> is v70.29.2, which should already include everything that we need for
> migration.
> Remove the version check.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 44cc612b0a752..a5bf327ef8889 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  
>  static bool pf_check_migration_support(struct xe_gt *gt)
>  {
> -	/* GuC 70.25 with save/restore v2 is required */
> -	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
> -

alternatively we can move this assert to guc_action_vf_save_restore()
to double check we try that on older firmware, but either way,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  	/* XXX: for now this is for feature enabling only */
>  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
>  }

