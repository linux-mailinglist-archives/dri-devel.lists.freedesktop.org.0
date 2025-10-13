Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6BBD2C22
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B71210E052;
	Mon, 13 Oct 2025 11:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPljjMdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D11E10E052;
 Mon, 13 Oct 2025 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760354467; x=1791890467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62WV1O7plScUMMIUdq6zi6ncL3OSzt4lecOhRWwCw9c=;
 b=LPljjMdxt23NylXVPu70EFwPvs4f4Mf7LTQEdAYqXJ+MAR0R4lfF3n3t
 JyxiK3bL5vnLuWbNly1JiUYFPk9Yc1cbNIfT/VxYSTmecY5E4kEAjX8lV
 s5afka5PNVAjrIB0WAUdQfNsP6AkSpGcY81y22GESVBy+AcP4jN8llXy1
 HQzRDaG555/GuzQnKmPuTR1Q61ZcElg9jWDFgWz9Kte7mCtZYF8/6+Qb4
 1G4Ds7A1V5VGDDswQtRiwVtHBKf8r8uZIJjHsDIk1bAVx2m8Ap2BcxYuI
 ZrCvIPKCifL3zSTbTstWqXyE7hKreTFLudxg0DvY+Mf21/YCA9gRwRS7b A==;
X-CSE-ConnectionGUID: FBDJAHuaT+2tbUYUWTC3kQ==
X-CSE-MsgGUID: reAqryj7THK4QTF49GaJvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73594656"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73594656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:21:06 -0700
X-CSE-ConnectionGUID: G1s38RwaSWiP1gwp5m804w==
X-CSE-MsgGUID: /Zx/ZiZlQwa/e0nXDAODlw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:21:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:21:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:21:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ9A2/to14SJVFtqpDXLFqKTRfjM+divFiF7RUmlTevvCeye3Je4sg17rvZ5P0HOZkdbwy4Y+N2d3U4HI9lesj1Yfveyg9pkyfWBlJfwGF5ciSN7y0TM64rXRe7L64FAms7nDUfsaNb1TOHSXnFKCSUNNmHwLaAYtvlyH5H1oYDW6EE6HIFB2aAv8i00bqxRoaxM4nrUOclyrZ5Jw09UgwxA7/x8aKslWOHFzOtgzgZ6YeKCspTLlTmxoYhO2AWrsRnEFRMvWLdY3BpV4Js9GUzczXVIxIg3YHu5eEQRlQIYkUHTCA3qa5Aeh8wE6u0bI3zckbSblpt8r3rfUmRBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv/MKSxIq6gKtiP/yJ8Os4E/v4gFKf6ylg8RqGfQijc=;
 b=dWUP/KohYKJnHCBALgMvHEsesabNNU3z3VgPOPLwo2hAm2m+0myW9kn5WQ3yCZW9XsYmb+IW1Ek/BG1euX6BzB20oXDM9vQmP3Z2AtuBa7FhNJ7UrT0Ad2NCxRDSp/AznRbw0UcRKCLTaUFN67EMgN9BrIDjjPQVfOc0SgYNEniAJeIqTwd5Dqn8CK2SlD9c0U2VL3LvZLYFpDSdQ7jh4d3WfO+Dly4h3BUxmolIgX6OKv9QNbCPsD7vjzKtsNdTKPTqqfLsCWSEN/jNXbTN8vU156LisM2oMcwHvLZQRvUj1NjoaoABXrY4rqkF9eq+ZbPou/w5LsTlkTM/BscAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9448.namprd11.prod.outlook.com (2603:10b6:208:572::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 11:21:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:21:00 +0000
Message-ID: <e3f602b1-e983-4670-9d44-bec2d8b058d3@intel.com>
Date: Mon, 13 Oct 2025 13:20:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/26] drm/xe: Add sa/guc_buf_cache sync interface
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
 <20251011193847.1836454-11-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0126.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6711ca-a7e8-419b-7973-08de0a4a96ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzFiZ1N5M2M1V1Q4RHROSVVjQVNDMGdvdlFBRms2WnNnaEozZU1EU25jUEVL?=
 =?utf-8?B?SWVwTnpYcWRZZTlHWTFrUmkxU3lIZXhXMU5nOTBrd2tTalVnR0t5WFBpcEFM?=
 =?utf-8?B?aWE5cVA2V0hEd3hYYXRGcTRvaTVvbVNjdmdzbHFoQkVRZlRaaXdxOFBLS1Nn?=
 =?utf-8?B?RVdObkVDV0Y3b1hXSGVpL1NOaHRPZkhZYW5memZtWlUrVEp2QW53d3FRT0hG?=
 =?utf-8?B?aTJQU1VQZVdtaVNnMjJSTWFVYXNQZkpjazhGV296Y3ZYK29rdm02VmtTMWd3?=
 =?utf-8?B?QjhUa3FDbnBlQnJGcnJ3dkw3K09PcmxjMmZ3OEFmRXFSNFcrK2xqR1Z1TmEr?=
 =?utf-8?B?ek5ZK2JiQ0tsdVI5QlhhMW9xcEhqOEE1dVZOSHlsSlFUUk5tQy82UHN0dWx0?=
 =?utf-8?B?MUNrbGlQcXhtZGFzdVY1TjYxaTg2U0dEK1VSRmFFVVNuQ1I1MXlDOEd3WW5Z?=
 =?utf-8?B?ZUtyY3ZBcDVmVWk0N2VwTXNxcFA3SWJTSkljWDVHSytOWEhVVkVqTXYwU29P?=
 =?utf-8?B?WGxlWWVVRmt5V1cveWE3bGk5YWYyMzRnblZ0b1Z2ZWpXdTFDdXl5b0xGVmJH?=
 =?utf-8?B?a1BTZklIdGFPVE95V0FSNElhUmVNTFVYMnMvcTkydWl0REs0MFJoR3Rhb2cw?=
 =?utf-8?B?SHhzaERRdzlHRTJTWVRCUHErN0k3Z0JTdGJtcTRQVUhuaE5sKzcyZGUvbU8y?=
 =?utf-8?B?ZnRXWUpCQUxaM2E5VktKRlpDNzdOYlcvbnFUZHlLZkFTYUd3aTB5eEpwZE44?=
 =?utf-8?B?TTcyQ01kMVZQSm91QUpPdDNZQ1o2MS9RODBKbUlHZjBaUHhQMWk3ZWRzZ0dr?=
 =?utf-8?B?MG4za1V1ZVlCNDJGZm1OdW9vQ0VNb1pjaTFPNllqU3RsaklmT2J6SWZOektp?=
 =?utf-8?B?SW5vb0lWUU9STndiV1U3U3Z0blBSOW55RWxTLy9YazlSK0lycHN3WUZ1bUtz?=
 =?utf-8?B?WWtWMHY1Z3FOT1BVc3ZqYWRZaFhmeHRsK3JsUmtkS0hBUFhEaUN4M0pLT0cy?=
 =?utf-8?B?TS9wS1NLWlc4TnQ3eEltaXNmaEZpT1cvTE9XalAwWHgrWmJhbXZrdjJVYTJK?=
 =?utf-8?B?NFJLVU5OK2t5bFVMT2VUOXE5K1VSUzlQVnVxdXRGTnJ0cS9PUjRtQU9XWi9h?=
 =?utf-8?B?dTd4Z3JhZnJQRjdNbit6SEx5UUo2cEtNUFZUVmtmUTNnRW8wQzNodUdiemlD?=
 =?utf-8?B?eitLMVhaTURwVTYxbnR2c2FwbGlGVWh5RHAyNElmTnBWSk93bVpXam4rejdX?=
 =?utf-8?B?NE5LZnVWR0hNMlJCOEhJSzYxYytOVmxVU014M1hZZjZwQW52d1RSck1oZG4z?=
 =?utf-8?B?WHFwUDJwKzJOeHFYeldhR0dkOWZHVU85akxqSTJBdWxLTFVkMVVicFV1SFpw?=
 =?utf-8?B?czZPSEU0bXh3QUNpZStzSjhwY3lvMU1DM2hoRlpuZzNvazZldkZWU1lCYk5r?=
 =?utf-8?B?bk84UE10TkVhYi80SWdLaEg5ZWtSZFJDaXFIR01kZDRQQkZLT0M0SDZKUXN6?=
 =?utf-8?B?NnJXd1ZLTEI0eTFQdzBiMzBlWlVQaGFUdTRjRCszZ0NrRGZkMTNHZlVXaWE1?=
 =?utf-8?B?U3ZTRWtMTER3RHVhQlo1OExveXFWbXhDMHJTUTNIYXZ0dUtubjhNWkdMdEpt?=
 =?utf-8?B?TS9yWnpZUGRTZDZaL1JEZ1VrT2dRcXRxcGlXaFdPblI0Y003RW90RTdXVVlp?=
 =?utf-8?B?Z2psMnJGNGRyWVE2R3lPMXIzeWlZSW5kTGJ0Q21OU3NodDZCZTQ3UzNSdkxU?=
 =?utf-8?B?bUI1WDI4K0c2QmcrK1BuczVCOWpYOW1QR1owNU5HbEk3TS91eGwvZDFPT0Q5?=
 =?utf-8?B?d2o1Mmg0OS9IVi8rZlJaMXRVazZnQlJNZjVXcXV4SzlZenNwZ2dBT2t0c05M?=
 =?utf-8?B?ZXdaNFM2Q2E2bnZxZXhZMUFQUjBwbFRIcDl5YVdZSTk4KzZLOG1nMnRhSnhX?=
 =?utf-8?Q?yjlJbYUXYQB9iwguyNSGY3gqGvrT+1Mt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBGUkZDVVZZVXVsWXA3QTNBL1hEbld2YlVMMU41c0t6b0FqclNGMEQxa2Vk?=
 =?utf-8?B?SzlQeWEzOTg2bFVoWWFIVTMyMUp4SEdGcVZwYnE5WmI2eVVua1JCemF2NW5j?=
 =?utf-8?B?b25QU2RRNHBnNEVUeXBQMGZNVHFQYTlxR1ZXOTNDbEpKL2k3c1NKS3V3cnBY?=
 =?utf-8?B?a0FndTdnQzJvWjI3SG1nck5HVXc1UkVzaUhyMFF4Z0VZaGphZHIrc1c3Rk92?=
 =?utf-8?B?dVdGRzAzQnN3SDZqUHAzQTgyMkM3cVo4bHRIZXNseXpGWmpKbVFvckNwTk4x?=
 =?utf-8?B?cFpwbS9PTVI1L0NxVVNuMk9aOGVZQUhoVUhMaHdodmhnQzkwQlZyTk5xQ1Nt?=
 =?utf-8?B?NmUyZWNDZk1MYUE4TTlBb1ZEU2lTcFJlTjNVRVNaZ0VxeFBlY210Mk01YXhy?=
 =?utf-8?B?bDZGUjFhNFdWUUxWWC9kM0xKSHhhUE9jV2RMS2VRa3JFWEd2QnFqSnhlcG1L?=
 =?utf-8?B?bDRUc1RjeDhzL3A3YVNWUExlM1BQQ2xod1VJSjJJVENPY2R4V1RGTVRzRWVQ?=
 =?utf-8?B?VjZObCsyTi8vTjFCd0VXNkR3Yk0wZHJBSjFTT3lPNTdnam9uN0hrZmgyOS95?=
 =?utf-8?B?TzhtUkV0MGRlNnp4d1BlMUVzVjlVeEJGaXBWZVNGMjN3WjY5MVJuVllyMHJi?=
 =?utf-8?B?Z2x3WkUwSW90amh5Q0lNQXdwOHByTi95dXhsNENwNSsrV25oMkhvVjV6Y1ha?=
 =?utf-8?B?Z2VDVUZuNEQ0NGVIWHNYdGxJV3hjTDdQNCtXRmtQTnBkcmxMcDhIUEx5bEdt?=
 =?utf-8?B?MVF1THc3U3NmSC92TThXYlhpWG1ZWnFFS3d3cmNNS2c4bHB3WGZ6WXJiOEY1?=
 =?utf-8?B?ai9MSS9vVGNsZDNxblgyb1hWRFRLTGxKNmN1OG05OTQzcjNOeE81bG95Zlh4?=
 =?utf-8?B?S0swbExzMnlad1lwQW0zYitVSHVweXZNZnZJSWduMXJRRmcrSXU2NVovTnlY?=
 =?utf-8?B?RmlyWTVyTUNicXYwNkI2VzR3YnlBNWNHTnl2K1VLNlZlT0t6YWUxTVFtM2p0?=
 =?utf-8?B?NXgySVNYTGlNVGZqNlg0SHBiUDVDY2kwbFFRcVZyVzRHVm04N2pVcXNZWHNI?=
 =?utf-8?B?bUpuL3hJWk5UaUN3WG1NbG16aENlSmVQbGs0Q1pMM2U1ZmZrNXVkWHJsSjVG?=
 =?utf-8?B?Ny95MlJxeTI3MmQvNnJWOHk2M0FXN2xjbWdUbDZDdnNhL0k0UkZWTGtBTGIy?=
 =?utf-8?B?Z2NCWFYzOW9uckxqd29YUmkya0hVby9DRkgxRWpXQ0dOdWp4ZzNOZzQ2ZmZS?=
 =?utf-8?B?WGpLYVc4djMrQkcrZDdtOXh3S0hWNUNNdGZMSlJGMHFJMkNNc1VjZUR2S3Rq?=
 =?utf-8?B?eXF2b25mdGU3ajVJRVUyb3Y5d01XS2ZpNks1Um5nNUx5WUFGRDdqMFhxMUVH?=
 =?utf-8?B?dU8yQmVYQWRVcFN5NWtZcFplM3gweHdQMkdXWFB3eFo3RE1ERE1NQjh0ZDB3?=
 =?utf-8?B?RXFQUllwbWxZR3ZRRUwwM21MWUtEdVNUVGtzZzFCSEk2ZHJxKy8rOTZWV0xY?=
 =?utf-8?B?Vkh3ZGNqMGpUczBWVDN0dnVVWUdOWEJmNzBETGRoWDlkU1B6TG9pdkpRSWJY?=
 =?utf-8?B?cEJSTVZHTFlTMDBCRGtYZWRPTXJsL2dHa3hSSFJaSzZYRWZqVmMrNHpXZElk?=
 =?utf-8?B?cmpaNnpibXVuMitaVEFmcXJzZzVraXM5UjlvbGJQcVk5aUpPS2d0aFd1MW1Y?=
 =?utf-8?B?SWxuZ3RMd0VRSld3M3R6M0ErWDB2Yk94ekREajl3ckZxWEtUYjkzZklFR2hu?=
 =?utf-8?B?RHk0U1UwbTBoN1kwOUhLOER0UVRaTTNFbUltT3FZSlpmRnE2VXNwUnltTGl5?=
 =?utf-8?B?NVk1a2RlR1dDRGpLckx5T2Z5SmRhd0hFUFgvV0FTRWMwdXZubTM4b29mQ1g0?=
 =?utf-8?B?RytKNE1HWEhaMVN0bjJqM2dCV2FQYXpOWVZ2eUl2ejRCOTdsVU02Y0p3a1Zw?=
 =?utf-8?B?cllQVFhIWVBMUTRHalE3QU4rR01nWmFSeVY1WWdtUVk5ZWVCSUVrejROVXlT?=
 =?utf-8?B?eXIwbGRXSFR0VER6Nk44M0ZXZWM4K1RoQzZPSlFkcGNvQldGMWorbmlBcy9K?=
 =?utf-8?B?VytaeHNRTUxuV0VjNHRlaU5rRDl4c2Q2cGhLZ1BRUjgvZExIam02dkhhZG01?=
 =?utf-8?B?TDY0RXBOYmFneFlzUjRIMEZBdWlQMVh0M0dMc25TYXJJbzA2WTY2SFMwSWxy?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6711ca-a7e8-419b-7973-08de0a4a96ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:21:00.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rxr5USrmokajFM63M8R3irh64wc3p6L0FRuU2ToxNGX81MQw+a+ReHXEF6qsr6XoX+S37WeIDz5pf1Gv83jS6FK5dsQzGSQirtmoKrBX8vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9448
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
> In upcoming changes the cached buffers are going to be used to read data
> produced by the GuC. Add a counterpart to flush, which synchronizes the
> CPU-side of suballocation with the GPU data and propagate the interface
> to GuC Buffer Cache.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_buf.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
>  drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      |  1 +
>  4 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 502ca3a4ee606..1be26145f0b98 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -127,6 +127,15 @@ u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
>  	return xe_sa_bo_gpu_addr(buf.sa);
>  }
>  
> +/**
> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> + * @buf: the &xe_guc_buf to sync

for convenience, can we return the buf CPU pointer here?

something that I already had in my initial impl [1]

[1] https://patchwork.freedesktop.org/patch/619024/?series=139801&rev=1


> + */
> +void xe_guc_buf_sync(const struct xe_guc_buf buf)
> +{
> +	xe_sa_bo_sync(buf.sa);
> +}
> +
>  /**
>   * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
>   * @buf: the &xe_guc_buf to query
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> index 0d67604d96bdd..fe6b5ffe0d6eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -31,6 +31,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
>  
>  void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
>  u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> +void xe_guc_buf_sync(const struct xe_guc_buf buf);
>  u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
>  u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index fedd017d6dd36..2115789c2bfb7 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
> + * @sa_bo: the &drm_suballoc to flush
> + */
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
>  {
>  	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> @@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
>  			 drm_suballoc_size(sa_bo));
>  }
>  
> +/**
> + * xe_sa_bo_sync() - Copy the data from GPU memory to the sub-allocation.
> + * @sa_bo: the &drm_suballoc to sync
> + */
> +void xe_sa_bo_sync(struct drm_suballoc *sa_bo)
> +{
> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	if (!sa_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
> +			   drm_suballoc_soffset(sa_bo),
> +			   drm_suballoc_size(sa_bo));
> +}
> +
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo,
>  		   struct dma_fence *fence)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 99dbf0eea5402..28fd8bb6450c2 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  }
>  
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> +void xe_sa_bo_sync(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
>  
>  static inline struct xe_sa_manager *

