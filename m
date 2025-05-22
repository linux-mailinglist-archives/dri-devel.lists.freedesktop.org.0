Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF58AC0AC2
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69FC10EB47;
	Thu, 22 May 2025 11:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjWsxPi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11B510EC57;
 Thu, 22 May 2025 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747914434; x=1779450434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4+vpx8cSxqk+UQyXA1BsgNAyEx9DnpLAcy126TdzT24=;
 b=NjWsxPi1qfWvbzFX/nQJAPCnc7ziHd2iAHrIXfip8sSwApCKPfuGYr4w
 wUkt4FhYhROZbNtoWExAvj94LhAMwLUM2CznyQH09OD4aaCOrmSiQKs8j
 sTVSBThZpZDoV5Ay4jlRZVrgYmMEHBt6PiyG5006T4gd8Ng6lXTZJKcTG
 jKyKJND01qfXz7pEimpWu9iGhaOmxhVLdPPSYCbFwcBH26OknODA0n0Dw
 AaLRTzCiAVdCoRQn7koN1mDpEImDe7NS0WXZocUaA2R7ugyeQ3VNyYort
 SQMANcBMfZzuywEflz0tQNDNusc1Uk8eXEPgizllE8VJYKqnvDveRfNb5 A==;
X-CSE-ConnectionGUID: e7FRuzqbSUC11L0LjmXs2g==
X-CSE-MsgGUID: qu+F8aKqT2yxZ9Z0yRLYcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49927788"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49927788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:47:13 -0700
X-CSE-ConnectionGUID: SD+PtVBBTj6uP+nMh6hUPg==
X-CSE-MsgGUID: 3ONgdV3XTPGlDeWO0crj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140421175"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:47:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 04:47:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 04:47:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 04:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El0SQTCIeO+nhREvkVZZmaCjMiTD0OWqcYUzQY1R+HFoHtEB5gInh8sCFkUYO6d88JP/CCLhf/OJDo0UvRSFnJR5ZvX82F4b78NXMquD9Yv6OA1iwVsDyaVecUoWVXSVBu8m7odaijzUnHeN6yW/QkXna8gjs7xLUjokqvCrny7FPUwve0xi6lLlKyihvUyCfKgX8GTCpZxO+gmV0wdEJCRsSDe51fDIbjCXmyNKNIh6xxZXrMJMNjnMLsaASjT+3jHDpinzI/P0VY9Md1K3GSa1rMuJEXJhwXvWR5tahvjSVISI9zqePP0bV9874dzq4ghtq75RfeU5mKGvoOycTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+vpx8cSxqk+UQyXA1BsgNAyEx9DnpLAcy126TdzT24=;
 b=p8HgQ5+MvoNT1NuhQmxaSJMDXaO5JJPCqrckxgTct+/xQILWP+xemoUkbEEFOxbXNCSSkUscjiuAWMc0gAdlx72uXS5AuDvfisR7OB8DBO0VLJUP9cQPZNZOMBwPvjau5JFl2QUh+kNM+Rey657SMpv2oekplu8kJdEXQu8m0HjGGpYjbST9Jf1dCYeknrwrybvuAIgI2z/RRrvCxhYxfOIqtacoPLV3zCc0+Ab6PI0hNmY6VA8xD378ebc5+4smNeLAJ4/aKZRgJ/qH8Tv+lqsOE6lFcvJ8gOVPzjvzi5bouba3nw7FcsvaR2FqTA3Dw02O5W8AmEXhlQo1ZJNZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Thu, 22 May 2025 11:46:28 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 11:46:28 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>
CC: Xaver Hugl <xaver.hugl@gmail.com>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "leo.liu@amd.com" <leo.liu@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "pekka.paalanen@collabora.com"
 <pekka.paalanen@collabora.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
Thread-Topic: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color
 pipeline
Thread-Index: AQHbnqrw1SNp8UUBX0a7R4KKj+Uk3LPWVxwAgACwKQCAALKSAIADOIOAgAFXiwCAAYL1AIAA+n0AgAAY/DA=
Date: Thu, 22 May 2025 11:46:28 +0000
Message-ID: <DM4PR11MB6360BFEB29C19FEC1F07FF85F499A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
 <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
 <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
 <b3bf99cc-f6f4-46ce-aa00-fea74b3179b1@amd.com>
 <f92df258-653d-49ba-b8f6-a1b677744a1e@amd.com>
 <8pzKUkjgb0fIlD3_edy0Wpl9vY-0Uuukcn3texesI1Bl0cLolExOvVoMdUwVv42T5K_o_U_wUY-saxXag2WhjKa7_Rh-EuORqZfWBUDczLo=@emersion.fr>
In-Reply-To: <8pzKUkjgb0fIlD3_edy0Wpl9vY-0Uuukcn3texesI1Bl0cLolExOvVoMdUwVv42T5K_o_U_wUY-saxXag2WhjKa7_Rh-EuORqZfWBUDczLo=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CO1PR11MB4849:EE_
x-ms-office365-filtering-correlation-id: c4941fcb-c616-48a2-3bc8-08dd992649f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bDdsUUVkUUsyVStLNC9xcW9xcTlmaXh1Y0dtYWtqVFJJViswODVwWHE0ckRM?=
 =?utf-8?B?d1pJUzZCKzEwOWUxdTVzZzljZWlraHEwSlQxRjlreU9lczB5bGR2Mjd2djU3?=
 =?utf-8?B?L1pPdmdWa1RHUVlETFJDbWZxVFRxRmJsbDgzWGRNVU91OGo1YXk1Mis4T2Za?=
 =?utf-8?B?b1Z3UDRuR0tnVG5UelFYZDhXSXMydlN1YkZ3Sk1LRnViZThEeTdBeFJQVVJ1?=
 =?utf-8?B?cVdBRCtSNnVydGZHdElKWnpKU2RkOThCTWVDRkRrTlQ2OGZhQmRnMHZHK3cw?=
 =?utf-8?B?SGJvRHF2YTZEbzJSemx3d1FyNEFMRitaWVNicVpISThIZmJkZ0VvZktzOXR6?=
 =?utf-8?B?UFVQMWdhQ0YxMUZaenRSSDRnMk1zSWE2Z2lZZysvRmpmMlBUaXNhSGEzcXZs?=
 =?utf-8?B?cHpISEx5SmNXSW00dlRjNndDZFFjVHRVOWxudngvQnhBYWE5R1Y3NWNRNXpr?=
 =?utf-8?B?WEVPT2lpUGQydCt4NzV2Njg3NGxITlk3QTFIbm1OQTc3N29tb2lSWkRlNVZw?=
 =?utf-8?B?S3YzaVBWaWYvT2ZPcHcrSHEwRWY1SGNwZlduc09xT1NBb1NhejRYT2dVV1la?=
 =?utf-8?B?SHJiMmtjdWE0MkZTNVNEK0pVWTJQa3U4UDJkNkl6M0JBajV3Q1UwR3FGSEgy?=
 =?utf-8?B?VUQvWXV0cDBQbzVmNlY5REpacGt4SFNneDZ5T0hiaWV2WTl2dVMzcHdrV2Fy?=
 =?utf-8?B?d1RBREN4VTFXd0I3a2VzaHNsN294dmxtV2huZGpTNXhHa3lDSUN3ektzVm1n?=
 =?utf-8?B?TnNta2ZFRldWL2ttSkRTUmNIQUFYQ2ZHZHNrTUtSd0RsSGJDdTVxZCtjb1RT?=
 =?utf-8?B?N2lMdGNqb0lmdHNTUCtVRVFBWDhjMFJadjhCN2pZRC9walU4bFdjZG9UcUox?=
 =?utf-8?B?bkpQSU4zWVIzNytJaXo5c1Izd0ZFMm5IaFNlNVF5M3FSZUVmNDZISjJXeXB5?=
 =?utf-8?B?bHpJUmRSTWsvMktQQTNsclRrdzBYVkVucWpwb1RRZlIrOUZSNEJORThCWUUx?=
 =?utf-8?B?ZzlCZ0xCMjYzMjBiRTBHKzdCTUVrVnBjdVJBVGZsZVdsaHVWc01FVXdSSXhI?=
 =?utf-8?B?MVYzSXVJWVgyYzE4eEhXUDV6eHNqVWIxS1Z5RVArZEZ4cEIyWEc3U2dCNGZH?=
 =?utf-8?B?czE2MWFKTXVQeXNPTElhbno3c0tObFg4RXVTWFVoakNoOWpFdDV6Z1FyOHNX?=
 =?utf-8?B?SnlPaWdkVFlOQnJ0Z1hXN1g1LzBUZFk5em1HQy95NmdPREFnTWRucUhQTTFm?=
 =?utf-8?B?N0prOWZtWDFCSGovaERoTmMvbDJrVlRJMjM1S0s3SlRzbTF1MmtlU2c3WjFI?=
 =?utf-8?B?MEJKSGh4VkFsa2VnaHk5Zi9rbGJKekJaTmRGYVpzL2h5a3dBMCtXcnNBa1l1?=
 =?utf-8?B?NmFVMlArcVdLSmZqT3RyNkd6RVdxdGdXNlJMYWg3ZEkzaHVLdG5WZUsrQ3Yy?=
 =?utf-8?B?TWpFV1dwb0M5ZCs0ZHc5dTF2QkFDL2hHMHNTRXR5eVo2QWl1d1ZVRzRKa1lR?=
 =?utf-8?B?S0NOcUt0dURuZGw4QjhBbGgyS3AzNGJ3dXIzbldDUEZNRmZXcC9mSWs0L1Fh?=
 =?utf-8?B?bDRYdUxvTXg4aGN1ejJjaXBpcmZhT0xPTi9mK1ZVT2R1WHB2V2lLSk5ESnN0?=
 =?utf-8?B?YWJmUWxGbjRDeVAveFJMOGVvNld3Kys4UVZMOTlzdXZkazdsd0gvSURTcWRU?=
 =?utf-8?B?UnBSNmNZRjA4aGZvczlvQlBvalZqcDJCN3NyS3pmdEpST2hKczJNcEJURVZm?=
 =?utf-8?B?dnhqS3RSWFZGVE94UWJpUDNISFVWQ0VoVFZFeG9TdklRTU5ycXZuSWQzVDE0?=
 =?utf-8?B?Qk9LRVZNQ0xwNk9ucDhWWXZjZjZ4djVicGRVUk52UnhzcFM3RG5TejNDQ0tH?=
 =?utf-8?B?WHYwVEp0Q1k5VzNUOE82L1hlYmE5SEpjQU0wN0ZPQk9TVENETUxoY1FyT3NB?=
 =?utf-8?B?NUNYQ2YxQVhFOENJbmJ3MThzVHhuenBhYS9rQkZ0RGRDdTVqeExvSHNUQ2g1?=
 =?utf-8?B?SUFPc0VFU0dRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNkZzdwc1dEWUFCbkEySjdoUWE1KzlQYkpyQWd3QlR1U2lDRE9VUXExUXRa?=
 =?utf-8?B?U0NYY0VFNy82OTJwN2x1SHhZYlREMk9pcnBlWTZhK0xUQ2FvcVlGeitZQ3FS?=
 =?utf-8?B?S1NXNk9OTzJHc2RpZVhORFlVaHNWd0JuYnZocnRyWHRORjhxZ0x6WUIvTlln?=
 =?utf-8?B?Q2M3YTBqL240eDk5UE5vSFltRzc5bkNGMkMzQ0dna3lBaXJ5TVAzdXJyY0s1?=
 =?utf-8?B?dG9KM0U0d2QrOEZocjJackRqQnE3Y3RZa0pDbWdzU0s1UW94OUdpR1hFQVRt?=
 =?utf-8?B?bFpFeiswYmY4MnNQVTFLWElUZjRseVRwNmZZcHBiN1JnZzIreHNoNFZ5ckJE?=
 =?utf-8?B?YzROSmZkeHJ2eFJaMGZtNVZES3l2aUZVaUV3RTh3NHNneGtGdDhmUHJTWjdC?=
 =?utf-8?B?bkNYTzZNM25NYTRNY3hTRXg1ZnV1WmdUdUdsRDlRQjV6T1V4KzZWZDZPMzJQ?=
 =?utf-8?B?RURzZnRSTVA4OUZ6THNDaG9VM2xYL2RGN3JyS1pIWWVXajBRaE5hdTUva3Ay?=
 =?utf-8?B?ejFNbW5COU9SdkhZamRTOEkwcE5NNHFSaml4bzlNa1VIY0Z1Vm9FYnNBM1p6?=
 =?utf-8?B?ODdVVjBRVkl6cWlGVi9vNkNES1h2enpxWXpuR0pOeHRScUdSTEFkWGNuaW0r?=
 =?utf-8?B?Rk1pUUIrTml1UXhXMkFySnBwOFVsRmpsZjRQZWF1RVI3RmVINkVXUW12aFp2?=
 =?utf-8?B?WUwvemlzVllna1NsMW5VTnJBeVR0MHN6Y2tYYlR5Y0NIQzB1R2YyeEJUZ2pt?=
 =?utf-8?B?Ly9rU3hOTWRLMk8yZWlKb01KOVpyZEpUUlZoYkJkNmhld2g0aFEvekVRanZS?=
 =?utf-8?B?K1JNTDhveDc0VlpaU2laZ3VYMGt3V0pEWXVmUHJBZk5yOTZJVzdSa1c1elJZ?=
 =?utf-8?B?VUxvWnhzWmZtSk1vNEdDNzhlci9GN2NvYXdGQ2t1MTdkNEtRdE9BQ0IzL0FD?=
 =?utf-8?B?WCtsVVJTNXpTOUM3c2lDekNuZ09kdVlRa0ZvSVVCa28xRUxVNjBIQUxLTFZ1?=
 =?utf-8?B?Zjk0MUxDc0s0K0JSQWFlWlEyVE5IMzhaSFY4eHZsTldpR1BTRy8vWTZmRUZl?=
 =?utf-8?B?U0Fkbk85UE5BNVR3L0NNZFdTZ2xaNkhVbWwrNnFrRXBhSjFQYWsxUlJHc1JH?=
 =?utf-8?B?SmZGR0hSM0cvRXpGNGc1U09nSUt0U205NXgvUWtUVVBoRWR3RkptMFBBc1Rh?=
 =?utf-8?B?VlU4OTd2WFIyUXk1RlJuMWgrWEkyc2NQZjJ1RXJmNVdiQXhOaXBobUt5ZnM5?=
 =?utf-8?B?d01Ia2JLOXBYNkZrZ3grTGJzYW5TYlVydXlVcGRTN012eXFLcm8xZktLRmNm?=
 =?utf-8?B?SGlJaFBzMXlKQkFseFd6VytQQUlPbC9BdGZvWmVQUmFBdGowajVHUXdEUjFm?=
 =?utf-8?B?NUlhdy84WVp3SjVFM2tFNWNjWGZFL21NRU5RWGN4RFhkWEVGcVBicVpOaHZt?=
 =?utf-8?B?MThTSUpPQWZUeXJRL1hrcnIwNFB3azdnWmJSMzN3RnZxbzVhcjhTb0ZkQzZi?=
 =?utf-8?B?cDVmV1RCRHVkdzJETUdraHBKUWFDTFNCcmhvdDN4c3FZS0Y1S083RVpneS9R?=
 =?utf-8?B?eVU2VkprbWhid09wZ0JxdVRwbWhhUDlzaEsrd3dESTNWVzlRazFhbnpLMVN5?=
 =?utf-8?B?c1hKUlVYeUI5UWlzWHFZZ1BpMXo3bEVxSHZUZGl5VGtYbktrelRNK3Y1VEJR?=
 =?utf-8?B?bmpaUWJqcEcrZ05OeklUYkZvaFNEYjNiakpma1ROd0pXbHdwUG1SNllGL2ll?=
 =?utf-8?B?UjJ3aklEazdNaWVLQTF6MnJZY0I2NCtXSjk4K1pJYk1wUjJxQXJQRWhNcTgw?=
 =?utf-8?B?SGJ0ZWVsK2tBckpLTVV4d0ZxaXdHNzZDMm1TYTQvUHFZWDFRNFROdnZRd3ZI?=
 =?utf-8?B?MkdBS3pIRjk1MEtkSFNOSXpRV0lxcktDTlJaWmxHY2xMMmYwNFRtQ1BWUTAv?=
 =?utf-8?B?cUhYUHlLOExQTm5HUGFpUTY3RWpoZW9HcnUyam1EYWcvckowdWR3RGxTcHRQ?=
 =?utf-8?B?ZlFsTDNTeFUvRHVxTitoNnlsTXBpRmMrVjBIeFFrcUtwWVAzSE9OT3NxUTZv?=
 =?utf-8?B?TUlaNmlZdGVHR3hYM01SbVl1SWlOK1dzbEEzUGczUVo0czZUUFA1ZFRTV0ZI?=
 =?utf-8?Q?IT3WBdNN2XH0AcMcfLsn7Nc74?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4941fcb-c616-48a2-3bc8-08dd992649f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 11:46:28.4954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slNr0qhb6EMpZ+3dawIMbFisnIpuvHIYGXOCOxyY1EM0G+6jKfXl+jgoyGLslTGoWH1DeckymRGd5AyuAydrHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2ltb24gU2VyIDxjb250
YWN0QGVtZXJzaW9uLmZyPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIyLCAyMDI1IDM6NDUgUE0N
Cj4gVG86IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPiBDYzogWGF2
ZXIgSHVnbCA8eGF2ZXIuaHVnbEBnbWFpbC5jb20+OyBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQu
Y29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyB3YXlsYW5kLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGxlby5saXVAYW1kLmNvbTsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207DQo+IHBla2th
LnBhYWxhbmVuQGNvbGxhYm9yYS5jb207IG13ZW5AaWdhbGlhLmNvbTsgamFkYWhsQHJlZGhhdC5j
b207DQo+IHNlYmFzdGlhbi53aWNrQHJlZGhhdC5jb207IHNoYXNoYW5rLnNoYXJtYUBhbWQuY29t
OyBhZ29pbnNAbnZpZGlhLmNvbTsNCj4gam9zaHVhQGZyb2dnaS5lczsgbWRhZW56ZXJAcmVkaGF0
LmNvbTsgYWxlaXhwb2xAa2RlLm9yZzsNCj4gdmljdG9yaWFAc3lzdGVtNzYuY29tOyBkYW5pZWxA
ZmZ3bGwuY2g7IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgcXVpY19u
YXNlZXJAcXVpY2luYy5jb207DQo+IHF1aWNfY2JyYWdhQHF1aWNpbmMuY29tOyBxdWljX2FiaGlu
YXZrQHF1aWNpbmMuY29tOyBtYXJjYW5AbWFyY2FuLnN0Ow0KPiBMaXZpdS5EdWRhdUBhcm0uY29t
OyBzYXNoYW1jaW50b3NoQGdvb2dsZS5jb207IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4gPGNo
YWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+OyBsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29t
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjggNDAvNDNdIGRybS9jb2xvcm9wOiBBZGQgM0QgTFVU
IHN1cHBvcnQgdG8gY29sb3IgcGlwZWxpbmUNCj4gDQo+IE9uIFdlZG5lc2RheSwgTWF5IDIxc3Qs
IDIwMjUgYXQgMjE6MTgsIEhhcnJ5IFdlbnRsYW5kDQo+IDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
PiB3cm90ZToNCj4gDQo+ID4gT24gMjAyNS0wNS0yMCAxNjoxMywgSGFycnkgV2VudGxhbmQgd3Jv
dGU6DQo+ID4NCj4gPiA+IE9uIDIwMjUtMDUtMTkgMTk6NDMsIFNpbW9uIFNlciB3cm90ZToNCj4g
PiA+DQo+ID4gPiA+IE9uIFN1bmRheSwgTWF5IDE4dGgsIDIwMjUgYXQgMDA6MzIsIFhhdmVyIEh1
Z2wgeGF2ZXIuaHVnbEBnbWFpbC5jb20NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gPiBX
ZSBjYW4gYWx3YXlzIG1ha2UgdGhlIHByb3BlcnR5IG11dGFibGUgb24gZHJpdmVycyB0aGF0DQo+
ID4gPiA+ID4gPiBzdXBwb3J0IGl0IGluDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IHRoZSBmdXR1
cmUsIG11Y2ggbGlrZSB0aGUgenBvcyBwcm9wZXJ0eS4gSSB0aGluayB3ZSBzaG91bGQNCj4gPiA+
ID4gPiA+IGtlZXAgaXQgaW1tdXRhYmxlIGZvciBub3cuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBT
dXJlLCBidXQgSSBkb24ndCBzZWUgYW55IHJlYXNvbiBmb3IgaW1tdXRhYmlsaXR5IHdpdGggYW4g
ZW51bQ0KPiA+ID4gPiA+IHByb3BlcnR5IC0gaXQgY2FuIGp1c3QgbGltaXQgdGhlIHBvc3NpYmxl
IHZhbHVlcyB0byB3aGF0IGl0DQo+ID4gPiA+ID4gc3VwcG9ydHMsIGFuZCB0aGF0IGNhbiBiZSBv
bmx5IG9uZSB2YWx1ZS4gRWl0aGVyIHdheSwgaXQncyBub3QgYSBiaWcgaXNzdWUuDQo+ID4gPiA+
DQo+ID4gPiA+IEltbXV0YWJpbGl0eSBpcyBhIGNsZWFyIGluZGljYXRpb24gdGhhdCBhIHByb3Bl
cnR5IGhhcyBhIGZpeGVkDQo+ID4gPiA+IHJlYWQtb25seSB2YWx1ZSB3aGljaCBjYW4ndCBiZSBz
d2l0Y2hlZCBieSB1c2VyLXNwYWNlLiBUaGF0J3MgYWxzbw0KPiA+ID4gPiB0aGUgcGF0dGVybiB1
c2VkIGV2ZXJ5d2hlcmUgaW4gdGhlIEtNUyB1QVBJLCBzbyBJIHRoaW5rIGl0J3MNCj4gPiA+ID4g
YmV0dGVyIHRvIHJlbWFpbiBjb25zaXN0ZW50IGhlcmUuDQo+ID4gPg0KPiA+ID4gSSB3YXMgZW52
aXNpb25pbmcgdGhpcyB0byBiZSBhIGRyaXZlci1jYXBzIHRoaW5nLCBidXQgSSBhZ3JlZSBpZiB3
ZQ0KPiA+ID4gbWFrZSB0aGlzIG11dGFibGUgaXQgY2FuIHN0aWxsIHNlcnZlIHRoYXQgZnVuY3Rp
b24gYnV0IHdpdGgNCj4gPiA+IGRpZmZlcmVudC9mdXR1cmUgSFcgcG9zc2libHkgc3VwcG9ydCBv
dGhlciBpbnRlcnBvbGF0aW9uIHNjaGVtZXMuDQo+ID4NCj4gPiBXb3VsZCBjaGFuZ2luZyB0aGlz
IGVudW0gcHJvcGVydHkgZnJvbSBJTU1VVEFCTEUgdG8gTVVUQUJMRSBpbiB0aGUNCj4gPiBmdXR1
cmUgKGZvciBkcml2ZXJzIHRoYXQgc3VwcG9ydCBtdWx0aXBsZSB0eXBlcykgYnJlYWsgYW55IHVz
ZXJzcGFjZQ0KPiA+IHRoYXQgYXNzdW1lcyBJTU1VVEFCTEU/DQo+IA0KPiBJIGRvbid0IHRoaW5r
IGl0IHdvdWxkLCBzZWUgdGhlIHpwb3MgcHJvcGVydHkuDQoNCkkgYWdyZWUsIHNob3VsZCBiZSBv
ayBhcyBsb25nIGFzIGRyaXZlciBzdXBwb3J0cy4gRG9lc24ndCBicmVhayBhbnkgVUFQSSBjb250
cmFjdCBoZXJlLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCg==
