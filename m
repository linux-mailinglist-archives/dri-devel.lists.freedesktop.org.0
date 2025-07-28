Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9166B138AF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D45610E139;
	Mon, 28 Jul 2025 10:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNP925kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BC610E133;
 Mon, 28 Jul 2025 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697774; x=1785233774;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VLtSjK+m22BJKS+03OZXsOl8sRtMbYSZO8ldZ14v5PE=;
 b=MNP925kH0LI0b0MCxEzpXtMK7osC58AyQrFG2aRdnYPSG0vu9cYJhxOc
 dWvcW35nvjtbeDzrKPmVMHL7cfiTBxzcxVQOFR6+MJm6o1meR30G/Qxm0
 rN5F2JQzexJAckroCwxoYD/y5DrNWt8IBWhMzYjYPIFC/exNU3UC8qwsV
 2XOdD316OweD7KP9DOO4ANaNIXqpuQkxMy9XXiI25MXjJoo2lXMCtbFFy
 mG+SHT49g5w6LRiUMPnBnyWsXEyYqyJqbjIH26k+IbIoSKUojP+vKDY73
 bfA1IaA9oOp5E2fjfLOlyFgdxCaYGIMA8ZJ7JhOKEFwJQVSEmlkPTu71Q Q==;
X-CSE-ConnectionGUID: fdq+j0jcSGS2nM44mc4jcQ==
X-CSE-MsgGUID: 8BtxiAltS/Cb/EO6BGC7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56032166"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56032166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:14 -0700
X-CSE-ConnectionGUID: elqabpRGRt6sZwYAaJJQow==
X-CSE-MsgGUID: 8hDMIf5oRkCuv1GJjyJmlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162091219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:16:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LD7dSRTGLOAyEe3xHfKw7lwZ6yjhKxv9WNrU31wZxCL1fZb8T0YVV1JysxOfrauwmgLwj1u5l2VlrF5EmDlBFNsX3U+DIeUnad22VkW7Fj6i6rtZuu+85gNSlVYLqUiZaMfZNZQuXSp4jCSe1tN23YFZoatRioZRhFaGBsBTZVuUHQXVF3RZ+xM96ymMFYXYxe4Bcjf1wNzuzvMETS7aaiFDBy00gOHHwkLE6luwWVo3m7oTOtV4jKuxFtjbLW447SyPVmCPZlzRbKCFAxFZpXTWmM/FokxoUwS8YTLd71We3iNtvi6ttUC7ySBOSEdLSNaXEbdBIs9d6eyphBccOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AHu6yY+CV41FJWYdO1PKEWodd+3lr46pvsVWX9tcY8=;
 b=j5dTbvCpfsb95PU9z6YhZD3sq0lLLlhfOb2ZYjMTdJ/tRxtuWmTUwFMqREqXSBUAvoW8wYCy1S7N8i7OhB5Vd5kzPUNMWT0NM4K2kv9RhsOVSk3iyq+unwyCEXL3/4rwgefxoJqLbN/RM/qfdsdkDU9Tacn6khYbSo8g4vxfSvRNoFCuawutylr4Rg0lLxeuQHiAFtFAis1OCK+R9FTXcK1g6AHdBGtSNYrVbDVi72i2H5Iig8qaLuvsdFHXYZOgwmH3ZSd0NQrtY9ut4SqC+EVlJW6ZesdQr+9f8nJNV9IUXgSGnfmMcyh1Ay0504MJcsPPzAHs7xtlfLUgniw33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:16:10 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:16:10 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] drm: Fix initializing format info in drm_framebuffer
Date: Mon, 28 Jul 2025 13:16:00 +0300
Message-ID: <20250728101603.243788-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: baadd011-e949-46df-824d-08ddcdbfc5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGpXQWMwRFF6dGRQTjk1dllYWFhSZGZvSSt3d2IwdlpWeXUrUSsycnZlZXE5?=
 =?utf-8?B?dHpGTFpmblpScnR6aU13ZnRMa1hyL0dPbU4weTFmZGdUUStyS0U5WlpGaGlN?=
 =?utf-8?B?MjVvdWRUUDZNTFY0ekFHZ0VtY2drUFo2ZjJ2ditkM2lOQ0JmOHZWejA1Z2Qw?=
 =?utf-8?B?NFZsdXVodnFZQVhhb081anRnZEhsOEp1SlhxOGNFTG5ESi9ZSEFCa0RKNGY0?=
 =?utf-8?B?cENqVUhTQzhsTTA4VHRCazBRZTZJQ3NEQnBTSU9VM0VYck1XM2pkbk5DZEh2?=
 =?utf-8?B?dGhxbGtranJ4aHR1bXQ1NHB2VHZGdmFWWEJaQklJY0FtRndwbWQzR3pSdUhy?=
 =?utf-8?B?ZTNaSk0wVGlpNFJ5U0tNbEk2dmlQT3E3Q0g2elhvWWRUWU84amk3Sk1vWkZh?=
 =?utf-8?B?akZFcnFVYkkrNTFvL3k0aEcyTnA5VXBaVWN0SlV5M0pIcGIxWWY3blM1c25q?=
 =?utf-8?B?MGNUc3RDSkVFazRUQnNQcDJuZHdlcDNtb3lSNG9tVEhCUlM3eDFxRmJsQUpz?=
 =?utf-8?B?Zkh0L2tFbjdRcmE1enhTSGd1QzR5Z2NzWUhHNmtCQk9NNzZwK0RNRDg1N0xW?=
 =?utf-8?B?T0kxcEVjQTFmOHN4dE1lcnFlT0g0Z3lTUXlKSGdacm1Pa2ZmdTVnVlVYUUVZ?=
 =?utf-8?B?RDdOZDNBdnBMTHVSOTlLdXluQTV6aXIxaWs2TFd2aFhlMXBYYS9IdnZ4NDZB?=
 =?utf-8?B?N2JCZmR2SUIrVCtPSlQ0VnZyU01jY1RHYkFrTXJIcHMvSkFKTnBiVmRMYU5P?=
 =?utf-8?B?SnYvcGVRQUxiS1hGem51TVVML21XTjFmemNuNkI1WW9ZQlYyUFlLYlJ1cUtq?=
 =?utf-8?B?KzdqTkxLSUNldnArNVc0clFXYVBZMUxmWFZ5dVFlb1ZOM1lKZXE1MkttMTNW?=
 =?utf-8?B?OHRmM1B0cW1pcld2OGRWMnlTRGtxWjExaVcyRFo2dFhsazFYQzkvUUdFT1k2?=
 =?utf-8?B?WU44dkFHQWdySm9MbjdPaHE2Y1NPd2RPU2RNMnZVWWIwRmVKWGZBaWFWSG9F?=
 =?utf-8?B?ZmVDcnpKMUJwNDZVaVU4bTlGQ2QxeE50TnNqbGttWG9PMnRiRllTTEtmdkg3?=
 =?utf-8?B?Y3k0YStyT1J6T1RVUzJ3ZlVBZEFNSXduLy9YT0diNG9LdlhFUmxDWHhRczZq?=
 =?utf-8?B?QkVKbmhNTkQzYmZvMFVCRUhZdXE4RXpPa1FMTzlFcDF0S0xUQWF3ZDdudU9M?=
 =?utf-8?B?L2ZNSHJsbkRSNU9nV1dEOHRxMzV2NkNleHNuMXF3MlRFU3VOanNtZzV0aFZp?=
 =?utf-8?B?Y0IzU2VDU2xpbU1QazN3TUR5VFRvbU9OVWhKTlVFbGxsTDVISkxoZzVZemJp?=
 =?utf-8?B?WEdqREhJZWU1WUdveUlFeENlajFzL0xXa0pncEVhOC9XZUhaUUM1TUo0ckV6?=
 =?utf-8?B?OGR1cE5ieVhLZjBOV0lRc0luOXlEUEVOTjh0aVZjYXY5MnNIQS8vd1JuZ2dt?=
 =?utf-8?B?dGdZdytvN3hoU0RUL2dXb0JXZG5ROVl6Q2dFVEZBMWdOY0l0ZzAvOXpZSGFm?=
 =?utf-8?B?RjVPNVVMUW05Rnk0cDJvdXZDeXBwWWhhK3pHOWJtUTlNMmNZUkpPZWptdWM1?=
 =?utf-8?B?RXJHL1BNQjZtNkJNeVhUTzVFdWRoai9HU2lTbW84b2FDYzFudzNNQlF4WWdt?=
 =?utf-8?B?T2hwQlRyS0pVTi9Mc1duQzFOUWJ1ZHB2YjZLZWYxWEIxTEZWWjhMcGtEdkxu?=
 =?utf-8?B?WFQzZENBWmtDWTFWVE9xdjJOM1V4VFpLMlI3aDU2MjZ5VjdLNHdTdmJJU1d0?=
 =?utf-8?B?NThaamdkT25SOCtoREMwVE91Qk50aS9Kd1EyYkxJUWRGZk1uZUZnRmFJd3Rx?=
 =?utf-8?B?VlZ2eWdXL0x3UGtyMW5pMjJWcDlBcXljakNNazY0T3hRZ2lZRGVXNDZET2lZ?=
 =?utf-8?B?Q3dMUjhTQWNlMW5oa3o3TjcyWm9uMGNPQ05ISHgrd2RqdlA0aGNhSTR0WjhW?=
 =?utf-8?Q?Dt7Up5Ayr+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFUTmI1T3IxVkphVUpWVW5CaER4V3FYcWFnclp2RkdTd0ZKdERINitOK0lY?=
 =?utf-8?B?N01hYXFvUUJBRHdEV3pESTJUR3Z3Y2lQWWpXUUdncURvVm14OVFRMDF3TmhV?=
 =?utf-8?B?NXZTNEVJRXBLMW9NU1pheEpGM3M4bHphQ014a3BMSXNFNzNpMFhRVWk5WXl2?=
 =?utf-8?B?czNBRGpQd3BWVmVzVTlFSHFsQnR6SWkvc3ZWSUFZME55QUFRaXZ5Z1VpTDVr?=
 =?utf-8?B?bE1Fb2g0SWp5WlNEQjVYTG1kYUk3WTFOR2tPNXBDbkZWTGtOVms2REVqS0JJ?=
 =?utf-8?B?R1BwWnhITXNhcTVBL0hxOHlUMWswRDhKanVVYTlJUm9qSVVZbDJSMUFpajF0?=
 =?utf-8?B?Q3VNNGhidnlMWmQxMk55SWJKc0dqRGlpOTI2N3BJcXMwQkViVWJHdS9seDQ2?=
 =?utf-8?B?TkJ2RzdPOXFzQ3dTU0VJNTVKbERnRjk4aEQzOGt4azFkMng4UHlwdytDOHZj?=
 =?utf-8?B?WUl2WERaUkNEeGNQRHhnT29CbzhQWTd4SXRTeVhnQzRjSDZiUmVtaERSbG1k?=
 =?utf-8?B?YXhYb080WlZ2ek1YOXJ2UVdUYXU1STJIemNaekkwWEF6UGg1OWNoOGY3LzNu?=
 =?utf-8?B?a2pSU25keStNeUNkQXNLSlFsZ2U5VmVaL1laZDh5bXZpNnQ1RXN4Y3Ewb2lX?=
 =?utf-8?B?eExiUFhMbVE0RDE5Y1FtVmhiMUNNOGFRWXBRRWpjeElqTnZXaVFyYjVyOUYv?=
 =?utf-8?B?S1FGa2xSTW8vZUpVQkJHU0VkYXFvcENLcGxPL3BsdlNBUjR6ZzQra1N1RjEx?=
 =?utf-8?B?ZFRHY1lUNkVFNnQ4SW9vd081T3JpSDN6cmZUSU5kL2RPUkI3ZzFxaXc3ajkz?=
 =?utf-8?B?Z1lqMDF3VldobnJMaENGTmd1TjVHM1J4Y3oyUVdnKzR6MEJCUFUxcUNXaEpp?=
 =?utf-8?B?dEdHMjhaRkVydmExNk9sYkFlOWNzRlRnYkZRcXMzMWRsKzVoekRNKytUUUU4?=
 =?utf-8?B?WE9HWnhtSzh6ZW55TnlxODZ6LzVBVis3azVua1lnZ1FNZmg4R2RCMGhlS25G?=
 =?utf-8?B?anJWT3JHam1zMzdnQnNnS3Qya1pHOEJieTBxOTV2RnBha2xDOVRJTkNKZTk2?=
 =?utf-8?B?R1Baakd1SURpRy9aNm1EYXphNUV5Z1pBczF0THhLYjhTL0pwQTNkZVVlajhX?=
 =?utf-8?B?c2o1UWpaU2o3bHhGWmpJeVVmT0tjQjBITFlXeGJrc2poWFcwUjdSNTZtcTk1?=
 =?utf-8?B?dCt1dFcrNTlSS1ozL1dTeTB2ODRxQkRrL1dEMUtxa01iaTNsLy85cEJyUmhu?=
 =?utf-8?B?Sjcxb3k4cDNWQVhQa3dRM1VTbyt5VjNUNkF4bG5OZzVRVVpNRk94QUlDSkJX?=
 =?utf-8?B?Zm0rc1kwaVpST1Z1ZGFmMGtMbStRdU1JczdGOEVUeUs4YXdPYVhKU2FQbkRt?=
 =?utf-8?B?NjVHV0t2U2xHNGRqV1lUVmMzQ2FyVnB2OE1UM0crVkJ0dm94ODRWSUxTZGdx?=
 =?utf-8?B?VHhzYms0UThhcW13aXBhQVdKR0xDWitzbStWRWZjcE1PaWZvaStVSUY4czNO?=
 =?utf-8?B?Smt0VGRsYlVqVFhZbjZXUFgxeHZoalEzRTNxbGtWQjdRak1udlZKaTI5RnlN?=
 =?utf-8?B?cHlpMnZqS1FCUWFpUkVtbkpvWVg4L0ZZUUUzbDBscCtOUlUvL1I1RG9LUGV0?=
 =?utf-8?B?REtSaTA4UzRwaEZKMmdxcTBLSTZOYVZCRGk0eWhoWnRNZ0U5TFFBZW1ubWRI?=
 =?utf-8?B?dFp0blNSYnZGa21hQ2ExTXNueUUwcW5XTEUrRWIya2dJT0tqaEVoVk5YUGcr?=
 =?utf-8?B?dlFSZVlMaUJQeGx5RE1EWmJYOUYwemlmOEhmRVlIWlFXMWdaTjlXYW5wdS83?=
 =?utf-8?B?Q3dRVlllNXhLazJWQ0JhRjBacE4vMk5DVE5oU2ZSTXI0cWNJMmZIek5LZlZM?=
 =?utf-8?B?cFFPT3VaazB5T3JQb0VUelArbWZPWlFtTVgwOUE1UkxNNERxMkFGU1RheHha?=
 =?utf-8?B?MDVSUmkxbnJiRzBSSkpncUZaa2NSeW5HcW8xMjl4bmZwcHZXeWlMMFB1RS9s?=
 =?utf-8?B?UGZZdE1yV2pESEt2TFM3REFoU1licnBJbzJ3cHlwK0FzUUVkK1R5YVdpNWlN?=
 =?utf-8?B?ZDNUeGM4Z0NkZXFyRWVIR2FzRFBRNWoxaUpjWDRPV1dkRkY1KzJJZG5tenJN?=
 =?utf-8?B?R0xwUTVqaW9kTEJ1T3Rsa2J1R2xPcUtrcTNwa2RFRjVZZElzeW0xSU92THZn?=
 =?utf-8?Q?0p1JCWgBsefNoYMf/kmDKQ2V3ckG1o1ogUGSe2EOItH1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baadd011-e949-46df-824d-08ddcdbfc5e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:16:10.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o6vLAtJF0IG9/FBJlykuqgxLc3JZ+z9N1Z05/L/CaZEIITUvvdrJnq5QgJrQY1sTNGdQ7GDOeN/4kEC7fraJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

This patchset fixes initializing the format info in drm_framebuffer by
drm_helper_mode_fill_fb_struct() in the omap, nouveau, radeon drivers
after patch [1] in patchset [2], the latter one missing the conversion
of these 3 drivers. This patchset converts the 3 drivers similarly to
the other drivers converted by [2].

This patchset was only compile tested.

[1] https://lore.kernel.org/all/20250701090722.13645-20-ville.syrjala@linux.intel.com
[2] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org

Imre Deak (3):
  drm/omap: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/nouveau: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/radeon: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()

 drivers/gpu/drm/nouveau/nouveau_display.c |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_display.h |  3 +++
 drivers/gpu/drm/omapdrm/omap_fb.c         | 23 ++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_fb.h         |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  5 ++++-
 drivers/gpu/drm/radeon/radeon_display.c   |  5 +++--
 drivers/gpu/drm/radeon/radeon_fbdev.c     | 11 ++++++-----
 drivers/gpu/drm/radeon/radeon_mode.h      |  2 ++
 8 files changed, 33 insertions(+), 27 deletions(-)

-- 
2.49.1

