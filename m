Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5DACC647
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C40C10E925;
	Tue,  3 Jun 2025 12:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfqasDAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575D10E90D;
 Tue,  3 Jun 2025 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952973; x=1780488973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=m8nCTvAPM4InrRKlRIkmLvJKgJKvoT60gLwcklTIiHM=;
 b=WfqasDAFz8WTYn0wWupGe28bB52IVnNeaWHATQJQda1MYskym0SGy5Hv
 3pNIWmnxqhB1p2qiCVHgJjNTIhKfdZywIrjg6ADcID58JhfxZFOacWdUG
 mllh03cHP8MA9yxGzXXVRfi/oOatTnZ89AnfYskladf6yzK5fWMpFPH2m
 OcyDE22qyT2CKGJK8viDmqHdED1Sxv/iCj8HzS3fmxGGcp3Q1VoSIxkBJ
 M3QGr6nEMoxCyIr3cmcA/WEa2DtnYxsu74j7yh0UJDQGcDAC5gH/Sus6E
 /yRh9Gs7rfPplWB6BkA43uKmjpGoz71dF1bPxXHbC68aC5gjldtuhYjwj g==;
X-CSE-ConnectionGUID: Y5JM9CDPTqygG8n2P8q+Bg==
X-CSE-MsgGUID: mkktX4snScGumpVUGjFrnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50862486"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50862486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:11 -0700
X-CSE-ConnectionGUID: 3jOfLpiaSRm8hzPWAFIChw==
X-CSE-MsgGUID: 3iHHwXdVRAeMg4/upVqS7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145814797"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:16:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:16:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIVpQcdA81Fe9SVK8oKdhGTuBk7scY62mc5QEhLGIUGMjyOrrtE5jLFB3wCHLy0uBqsXlL3ch44giGnN0YsJyAcIEsk7w+oU7zHetjIotZtKu4e1Iq2PyP56m5hE+vPyhvGQ8qds4LjISmebrAuppMD/2Dy5qiz47dWgc1SUA2LtC8akKs7S/cveaZwpigtAiEtfMhX6pfLoQmejfyiuDYRPgCdUZkgR/ir7jmtnG5xQebBfbcMSWJmpX1IIKX0FFNHuYJvoFtQO9HisOeLKYKqrLvUgnwYUSyImQLRw7zJPegPB7LH134KK8xXmzLY6HA38aP+GQ7UAXjuUe1g65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgK8idPDnOc8nGmgd68KRGPqiQTTWA4IuLckusRlBkA=;
 b=odoASDkj09Ab16RD6E9KNgtWT+1CGjUfETZfeS26IKQGG7DvkfOQ3aLiWhtq3ceoIVzB+Z7xN1Z3FL+0tmZ1dFEdmfIuuHDASft5SvsvyJNzK49pTgopyII2Az7m9VfwosMXaZ50gh07qEAf8W72P3FQ451VWli+vkBYpKQIoKq0knYvc4tk2MgJ0A1zFl7naJa0oHRhpVmS0M1xkOfoYOhou//BpUMURk0qhuhcfWdfYp5ussAUgtDLQN3+s1dytnNnStBJdiknsv1QP9yAPKzgr5n60xVcNBdNOOcEYkkvC+r32kN6rYdMq2CvYBYGQ4W3lH/ZFBvwlerDUv82VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:15:58 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:15:58 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 3/4] drm/dp: Add an EDID quirk for the DPCD register access
 probe
Date: Tue, 3 Jun 2025 15:15:42 +0300
Message-ID: <20250603121543.17842-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250603121543.17842-1-imre.deak@intel.com>
References: <20250603121543.17842-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6f9715-6a6a-433e-a9c6-08dda29865be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEVJUUhGMnk0V29IVmZzY24vNTdIS05ISkhTdnVwcXVab0hwTmZSbU9IQmgx?=
 =?utf-8?B?RUZFUlVEZE5Ha2xkVjVOaXR1a1o5dE5nenRISmVLT3RxeHFlMVI0KzBhK2JZ?=
 =?utf-8?B?V2FrM3hhV285VWJnNGRYaFBvTlNZV3NvR3hWanB2RjlvcWlWdEZtSTJKQTRR?=
 =?utf-8?B?bml1djh0NFl1RmlCRVJlc01qUXJKcHBnSWZlMHp4bmtueGxvR09FeklPWnV6?=
 =?utf-8?B?RTNsSzJwa0tFMkZ0UTBvUkJzVk5BbTZFYzdiaEZKNElxT3hIY1k4RmdBV3cy?=
 =?utf-8?B?Tkl3N1Z4cTJnSjJObWoxKzNPVkNHa2ZSRnpUSUNpRmtIckhUeC9KR1R3c28y?=
 =?utf-8?B?UVBNeTNvTE1FVmZOY25sekcvUkNoNDNBcEJ5R3pYYk1zai83aGtmaFdtOHpB?=
 =?utf-8?B?WjNxeGpwaGx3d0RpYklmRXYzVk9HR1VQYTVzMWlQdWVqZU5DR0dxL1ZJeVgx?=
 =?utf-8?B?QjRvMGtlRWRPRSthQW5CT0ZhY29tQnZLd1dOU0Z0bFlJY2padmlTdGdpQTlT?=
 =?utf-8?B?My82S05TdTN3MWN0Y2xQTXV1NERUdVBFeUlpdnI2SkhaVnlPUUh5QmxIakhl?=
 =?utf-8?B?MmNTbGExck4rM0RzRFhIeFIxRjNHOXF5RXJKZkxGbVQ1RE9vR1RhdnBSS2FK?=
 =?utf-8?B?bmdlQm9MOEZ4cGFBcERONmIycG1ObXlsRThwWk01bklPY1VDK2RaK0NpVVN1?=
 =?utf-8?B?cTdRbnk5MHNKN2V1WHFIdlJYQ3NGcE5qQWVGQi9Iekd4VzFjZXFueFpTRDR4?=
 =?utf-8?B?OGY2WlMvckQrLzJ1VlVYRy8zWWVoTWtZQ09IcGFGa3ZydXZnN1dZMUcrcHNo?=
 =?utf-8?B?eW9VVmJSanZKNFZpbkh0NzEzWlNWUVdteUp5dUc2SldlVDRTV2JpMUtYQlhh?=
 =?utf-8?B?WFp2RUpUR2padGtHWHNpVUNGczNJd05NWlh0eGJFTGJuN3RZUzZWQ1JNMnM0?=
 =?utf-8?B?RzBBRWlMbG9DaWFOMS8rN0E5YU5qWFAwY2pGQ1BnNW40c1pHaWQrSXhyelBj?=
 =?utf-8?B?T3QzYXpkTU93RzZYbml5M2FNUkxWekFleDRudWZNeHMyeUhhODlhZGt4ZG9i?=
 =?utf-8?B?VXVkMXdrdXZFTzRZaHpXR0p0TDhPd1ZVc1ZpdkU5REJwM0xRK1Z5SFR0NS8x?=
 =?utf-8?B?S0txTXVNVlQ3MW9uY1VDQjM0eHd6bVZRM3JPc05ZU2ZhM0dCN1VvTzNROUVT?=
 =?utf-8?B?NjFVcjdsRW1FS0ZOdmloZlcyaTFWYkwzRFNDSk45Q3lZYzhwTUlvSDkxK1Y5?=
 =?utf-8?B?ZVdDM3pWUVVjV2p4d0UyQ0dhRG95M3YvbW4xdlFjeWtPTGt4WGd2YTA3Y0JW?=
 =?utf-8?B?OWdvR1FkU3FnS3I4ZzZRUlVFQnh0aTJyTkZEcFRCcVNSUlV4dFdSSTVTTVRn?=
 =?utf-8?B?cHQ3N05rNVdPcWFVdFZuZFMrUDNJcjNVNm5zZ1ZJY2ZmOGg1YWpGcWp3UG1w?=
 =?utf-8?B?RlY1QjZPUTc5QWdxVWxxRHZKZ1piTjBGb0ZCWFRxUVNJQm52MjYvRjRScm1o?=
 =?utf-8?B?N2RCNzlwMkk5UUZ1Q2RWOUpDZFFWS3VrZTlISFNjY0dRaWdzVC9yYWM5Vzd3?=
 =?utf-8?B?cFNyVzNqSmJ2SzlnUC9jNUZlZzM3VURweWpIR2xOUm5TKzFEaUNUYVBlKzVw?=
 =?utf-8?B?SDdzUmpkeE9EQVgybzNva0pZMjRsMkY2aEtveGp0TC9pNzNPL2NUK1R2b0Jr?=
 =?utf-8?B?ZGphdENqekRzazdCNklRQVZZRFdGVVd0YmF3dWQ4NE1SY1BsSHFoZU1FL09B?=
 =?utf-8?B?RnQwSGJ3REI0aWpXWnYvMmxIZEtiaWFrS3BlY2JmR2doM1doMmt2QXRJMVg0?=
 =?utf-8?B?aWxWejFFQVBlQVYyV1EyNlNFd1pSajYxWEVtekpyRHN4d0tweXIwK291TlJD?=
 =?utf-8?B?ZU9vQk5yVU55MWRNT0lVV0tiUnpBTkhYWERMVDJrdHptU1FZQ2hiNjZSSVNi?=
 =?utf-8?Q?YzMKqyjmULg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2NPb21iSVFGVFA3ejhxeXpiSEF1VU5VU2tMbkhoQ0NlS0ZjYzZuZ1lPTk9z?=
 =?utf-8?B?c0xJZGJvZzRKTTBxbk05L1ByUFRGQStDQ3lMeDVsazJHVmIrWGlacHFLUzZ0?=
 =?utf-8?B?bTNEdlBIZDlVNmZXQWdDMXZKdlNwalkzSUdxdkk4WXBneUNmMG9hTlR5ZzYv?=
 =?utf-8?B?emw3WmxoTG5zZWNhL1IyNEl2eDY5ZW5XLzFVVEhnUzBSczEwbndqb1VPeFVx?=
 =?utf-8?B?QnBDZVQrekg5Vk1sbXU4cWhLR25JekRBYzlicmJpSnRPQmNQSjdhdVpQaWk5?=
 =?utf-8?B?RkQxMGhyS0ROY3JlMER6NDRVTlBseDJ2d0hPSkpOOVE2MmhoUFVBRlRIZ3M5?=
 =?utf-8?B?SytyVXZpYkoxRWg1RVFhbTZycjQwandqdVB4WVRvWTlFekVmckdack5LMDBs?=
 =?utf-8?B?aG40RGRFVXhxMXhrYWNqc05VN1RVVzNHNHk5WklWMWdJT3Mvc2p1cVRDa29H?=
 =?utf-8?B?VUtYb0o2QWp1dDFwY0xQZWNHT3k1YlMvSEVKUjN4VjZMZlZmRXJRdFZDMkVI?=
 =?utf-8?B?U3FIclpXSlUwd0IrY3d5ckRkMCtUZk5mWHI4WlhnS0w5Y09PaXhRVFVKZFVN?=
 =?utf-8?B?NFBKMnE1YmJYQnppN2RlbTQ2bTByK0l5ZzdwZnd6UVQwS0xRQkJ1dDh1ZWZi?=
 =?utf-8?B?dy9Takx2WVdQV1ozNFR6d3p0bCs2Si9wSDk5bEhLMTdlN1c5di9rY3p5a2dZ?=
 =?utf-8?B?RWxIUW8xWWx3K2I0d0J4ZG1pTzFRdy9KQXdTZTVrWk0zbnYrVzZWNkZYNk9w?=
 =?utf-8?B?OVFObXZCQ1UxSmdWN2lVdUo5YXZ1clY2dWxDMFRSMWpsQ2Q5QmpLa1A3TXlV?=
 =?utf-8?B?MHNIOHk1ZHpmR3NNbDllZ1lpeWxCSkJtUUpZSEptVk9ONkV0V3hncjFsVVA5?=
 =?utf-8?B?dDFvSnNGZ2ZML2p5MGQzUjMreUkyZFBmMFBpekxZcDdaSERPL1FhdHZjOEhQ?=
 =?utf-8?B?ZVdPZGNhcjE4YTNxcWRKeTZscmhIenFYY1dvOEJ6SU5pd010ZUtBZVdNOXZV?=
 =?utf-8?B?emI3NVE4NDVzam5rVWl0K0wya1NLUDJYYklxREpKNUVrQzNWS0pNV3BoTVJq?=
 =?utf-8?B?Nmxkam5DbWsraUp3MWtkQVcrSW14Q2tUKzJIQVp1dU1IelIxQkl4ell0OUk3?=
 =?utf-8?B?SmFvbmZSVW9aaGx2V09yVjhJNnBCSW1HNmpqRUI3dUVlYmxid3NwNDZEMWpI?=
 =?utf-8?B?Y3E1K1VWQWRUR1NBc0J6MEhxZkRnNmRFdDUwQm5QRHU5OU1pRVVGSkF4K0hR?=
 =?utf-8?B?RllDOUQxVEk1ZUpmbDc3Y0tydkFZNklSUkVuTEcwSnN2aUZHMWs0NHFKUmZW?=
 =?utf-8?B?SVpWU1hNbUNwVkdMMStHdWNaa0R1eEszZ3dFdzNMS0dVYmsybUdNY21lTG9R?=
 =?utf-8?B?dnZzMk00WFFrZFNhb2t1eHg0MDZkb2p1dDdyaDVmbEJUMzNSdFFjSHF3UFZl?=
 =?utf-8?B?ZEFoQU42dVc2bXp0d3lxYzIrejdxakE1U1UzR0hlRnhGTy9RQ3VBN3ZOcG9Y?=
 =?utf-8?B?WkZKSGxpZkZKYzN6QTdWMC9QR2FpT09vTFJ4d2RRMHFLUGtzMjgwTnQ1djRJ?=
 =?utf-8?B?Y0dUd0p6YVpTYWxZYzBWQVNwR0dORVhDNm1qdTBNUk1WaU1ncHFLTUZTRllh?=
 =?utf-8?B?MllPUTkrcmIzRkpsRzVRRjRBY3Q0MTZsdDVIeVcyVGxlR1pwMjNva1M3UkRk?=
 =?utf-8?B?SDRIL0Q0c1F5M29lQjBwRSswMXdmWFFlMVQ5WDN6NXk5WHVUU281NGVzd05p?=
 =?utf-8?B?cXNtSEltR1hIR28yeG9mVG1IbmhWYXV0OXFhYi9QeXRFcVAxQmJQRm5PaFZ1?=
 =?utf-8?B?WmdTWUJwUzZTRkZRSGpqL3ZwREhrQTRkSXVHc2RNb3R6Um84MHkvd0s3TExZ?=
 =?utf-8?B?eUVvS01NN0x4SXRXaFBEdkp3K3N6ZVM1Um96U056V0VkTW1KaHpNbW5RdzFL?=
 =?utf-8?B?U1FUWXdlbWh5akVjUXRhMjlWTm16NzUzb3FXNUcxbHNBZkd5WUMzUlBselRT?=
 =?utf-8?B?QXJqZSs4bnAxMWFoR00xY2kwcHNwd3hIejQ5QzVqYzllcmNmQTZSTzYraERs?=
 =?utf-8?B?V2tCSERncmFJWEhJVmc0OW1CeHN0MGhkNWUxb2pzK1UycFFIWXptWjB5d3cr?=
 =?utf-8?Q?OtlGQKmsau1VVcKWWM0IWtBp3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6f9715-6a6a-433e-a9c6-08dda29865be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:15:58.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzhPXX6Hzm9dUgFyqRlSLX6LJodHNjBgatXmRZ91ojFtQqpLYT9B1WMEbtevyLSVi2LoKJXh0rO+LxIhHytY5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. Add an EDID quirk for this. Leave
the quirk enabled by default, allowing it to be disabled after the
monitor is detected.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 15 ++++++++++++++-
 drivers/gpu/drm/drm_edid.c              |  3 +++
 include/drm/display/drm_dp_helper.h     |  6 ++++++
 include/drm/drm_edid.h                  |  3 ++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d4..4f2e919c6f7a6 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -691,6 +691,19 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPCD access is done
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable the probing if required
+ */
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
+{
+	mutex_lock(&aux->hw_mutex);
+	aux->dpcd_probe_disabled = !enable;
+	mutex_unlock(&aux->hw_mutex);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -724,7 +737,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	if (!aux->is_remote) {
+	if (!aux->is_remote && !aux->dpcd_probe_disabled) {
 		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e867315253493..9250b425ae230 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -255,6 +255,9 @@ static const struct edid_quirk {
 };
 
 static const struct edid_quirk global_edid_quirk_list[] = {
+	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
+	DRM_EDID_QUIRK(drm_edid_encode_panel_id('H', 'W', 'P', 0x2869), PANEL_NAME_ANY,
+		       BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
 };
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e4ca35143ff96..75fa9548aefa0 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -523,10 +523,16 @@ struct drm_dp_aux {
 	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
 	 */
 	bool no_zero_sized;
+
+	/**
+	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
+	 */
+	bool dpcd_probe_disabled;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size);
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 3d8e168521c82..a878805c81d97 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -110,7 +110,8 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
 enum drm_edid_quirk {
-	DRM_EDID_QUIRK_NONE,
+	/* Do a dummy read before DPCD accesses, to prevent corruption. */
+	DRM_EDID_QUIRK_DP_DPCD_PROBE,
 };
 
 struct detailed_data_monitor_range {
-- 
2.44.2

