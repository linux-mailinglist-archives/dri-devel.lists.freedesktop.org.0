Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506AC5724E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 12:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F76F10E7EE;
	Thu, 13 Nov 2025 11:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmzARtj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98E10E7EC;
 Thu, 13 Nov 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763032896; x=1794568896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3q6WozUYy2jieTlDS2H39m9JlnS+2CxM+mTUv2UTYJs=;
 b=FmzARtj55NulyITYxm0OcDKV5XwjVhcMZOAbhqRMq2hIZ+a9xPrUkl47
 sg5D/biEqMPHQhP7bpsQusgIvowN/3m3/y8ZvkeyAmZeHlFqBWvlFOR7w
 jzHzOLtbGW7cGMJLmo7QPylYJDKtB8ZVnP+GP2FCTE+3U8CLMSSRYYI2H
 XoA5jDwVvcju+op2Cbvr7eqQANtZAHaJ39FX7rVPMZ8KS7UNZSuxhTXgF
 BWFAL+G1AJxOd3+uXOjzaYncC9GYBlvkJ1ajJeSHi8F32lPGAKOeLc3mo
 5bDAmwVVObhIgfrHxZMHI3+sEtT4lprVQzDvNMMa3wGIyI24HI6V2UfqV Q==;
X-CSE-ConnectionGUID: ANOxdLUdT461qSgcHSY2EQ==
X-CSE-MsgGUID: evjHvSFJSnqZupbaqh57uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65144922"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65144922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:21:35 -0800
X-CSE-ConnectionGUID: yCPlUbqZQNi9fHbXIhmLUg==
X-CSE-MsgGUID: sO4Z7g+KSCuzAs4I8y7now==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193729386"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:21:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:21:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:21:36 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:21:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hei5Dz+Eyw85V4gjDdpBP1mMied8hgaBcmAhOnbjMi9tdD0JXmMqZ7d+YSLaZ9rzGg0hLxYCz/nmKqu4R1UfrV8BcO28FaoSyBpjV9ia0jEHfPAN5P6adizf8L81xZr/lKiKuar6vG3Fa9IGMemCJ943CCjdfRKo6dYX1PdYEQxuSZds86uGB5ui3BNdHDQDiZ94FROmsUwB/sxdcCh3WEb6ZJkHqvw8ZpmHuC4n5rdRvUNoYClrd7BSnYMD47R8+cj+3bLM6mF2UhHRbCk8sOMRjD3k2mECV3vne/4WRjOrSEkd5LGJkUzRd68da7QP1A4GQIiSsfgUyXggxxqcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q6WozUYy2jieTlDS2H39m9JlnS+2CxM+mTUv2UTYJs=;
 b=dryDiskNicg+XDHzEAk0UPgbQnFdkI8OMjxBXAAfjDStqfYFyIlS3rItGTbaH80G24NqRHdhLJnWhusCIcCLLStvTIOdfEDLB6PjBqdz7UDZ4/ClU22aVOTnwzzL+J20CL+bw5USCLQnzdpREuudwKL9O9tmh7MdHKa3bpe64Pn5QlWSivN6ChM8zZFd1BxQwn10FftT54l49mW32P78GLpE6yMnxo8hTEkFx3V9pKNjRAl+lDZ1Ed0xHKg5X5MzY37F0Rb/7rZMGEez5YcyqoPyFWyf/abDMcrsiXwrVExtHNb5S2NEUxYctPQi04ITwVFdmUu5EgEyITGUICGEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 IA3PR11MB9445.namprd11.prod.outlook.com (2603:10b6:208:578::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:21:34 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:21:34 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 05/10] drm/i915/alpm: Auxless wake time calculation for
 Xe3p
Thread-Topic: [PATCH v3 05/10] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
Thread-Index: AQHcUwylAC3JnHfJ3U++zcAFQZDrG7Tuiv+AgAHsuLA=
Date: Thu, 13 Nov 2025 11:21:33 +0000
Message-ID: <DS0PR11MB80491E65DFA1F6C49573F779F9CDA@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-6-animesh.manna@intel.com>
 <DM3PPF208195D8D6A30F5E8D8D545F6B678E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D6A30F5E8D8D545F6B678E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|IA3PR11MB9445:EE_
x-ms-office365-filtering-correlation-id: 0c1b398f-cdf3-4b3f-d6da-08de22a6cd6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OFdoSEJRZkRGS1VXQTNZZmdhZXp2OVZyQjBvQ3pxYzVCN3JnaVVBWHhjcHBt?=
 =?utf-8?B?Z0dBU3lvWXk1S0dRdERHTmFqNEtsYzRvRFNXbVZtclJDOUZmYVExTjJrSzls?=
 =?utf-8?B?Z1lWWXlJdXcrd3Z3TFlZT0lNbXdhSDU3MVNGcWlvTElJSGtab0l6RDVtdmNG?=
 =?utf-8?B?dXpYZ0NLMFRJdkVZMHNDNFpnV1FkN0NLUm5NbWFWemsxNWFnQm9FWFhaeG5a?=
 =?utf-8?B?U01iVWY3TGh2SmNMaWZMd3IvSm9tMUxaNDIzVFFOODE4Q3NmcERnTGlwZE16?=
 =?utf-8?B?UDkvVkEvbXBxYWpGV2xjSklEdFZRYzJjVjF6aHRmNnVUWWpjTXJ4REE3aU9Y?=
 =?utf-8?B?bHZqNEdTdVZMNFZoUVlTSlNsU3FHMkp4SG9GVCtwaU1PWFNHUTNydWVJMFds?=
 =?utf-8?B?TXB6bWFhTklIaVBpdTJJY3hoNEc4ZG85a01tMFlXYk0rMW5OZCs0Y3phOGti?=
 =?utf-8?B?ZHFmdW9QK2Q5YXpZS2ZScmEyTFlDK0dBOFZrS0x1OEcrK2NLdXFqczhhZXZO?=
 =?utf-8?B?UGpHYXgydDlJUzJrS3lyaVlaNHlWd3dWV3pNZkpVWFF1T3RUWEExN3VrelVG?=
 =?utf-8?B?YWVtQ1N2WDdZZlRLSUlwT1BHREJEMVcxcjRBeHpnOVBZL1Y3TXQ4YThFVllu?=
 =?utf-8?B?dm85U0ZMQ0tuejZiSnRBbmRVWSt3QTBGa0VHNnhLcnVxUUNtWHF2Z3VQVXhi?=
 =?utf-8?B?WWtMamVTMG1paFlPZHU2R1ZiNEV2N0hIaDJoS1pnNlJ2S21hWDQvNzBmaW1R?=
 =?utf-8?B?ZXNiYkh1YXlvQ2t4Nzg4V1FEdGprSlVmcUhmZ0pFcHp1citobW4zUkdHNjlq?=
 =?utf-8?B?SnA0dW9pTjZGamVSdDY3UkhhRHBFS1VpUnBOUjJ3VmZIeERmQkRNUWNocC9B?=
 =?utf-8?B?WTU2bW1ZMytuQUFsbFd2T0xuWW1nR1ErT2pncmZOTEthanh4TWhJK0dhZEpJ?=
 =?utf-8?B?aHRERDRodkJTaHJJaWFGcHN0UWJSbThPMkp1Qks1SXhidGkxTHBjeEZUcU9x?=
 =?utf-8?B?eFJlOFBxSCt4YTdScnFXNWdsdXNlTWxRMXRxZVp2SkZkdi9jdmFzbFNyNzJB?=
 =?utf-8?B?dmdiazNQM09uODhVbWhZYzhZOGJEZWpMOER3TUhYYTZYbXJvSG1WRHRRSDFi?=
 =?utf-8?B?TVZLZ01jclhNZGFieHZhU3dCcWZtY2wzcnNBMjExcTNnS0oxWTJwQ2E5ZXln?=
 =?utf-8?B?dFZLNHBYTEQ1NG5KSERqYXdGOGF2dlh3MDVSUFovMVh0VUs4TGtMY2tQa0lP?=
 =?utf-8?B?YVJhcEFLTjVlY291WkpYVnBCdk1pSEEwRlB2bnZpSXMwOXdET2prd0M3WlBL?=
 =?utf-8?B?OEF0Q1h1dlBIMXZ5REhaZ0hpODZMUHNLdXNQZmoybVNMV1F4RWU3ZDNjTGlK?=
 =?utf-8?B?b3ZyOE9sNnhyWTlvY0t3YlFUYzl5LzhxL3dEb3M3MjJCNVA5Sm4zQTdLekQ5?=
 =?utf-8?B?aU9VVjZ1ekJZODd3VXV0MTF6M244M1VxRVA0UzJjZTVOclM1bFI3cEFudVlE?=
 =?utf-8?B?dVdFOEVUZGxpNXRLKzFVWFp5TUVZQkJVRyt5RlFpdk9YUG9kQy9IY1o4eUZN?=
 =?utf-8?B?anpQc01Tdlc1eDBraWRma2pEdzk3dU5Zc0Z5Tjh3SWd6TklWck44ZnI3dXZw?=
 =?utf-8?B?WnZUbXkybkg5blUyNUllSUxuVUFhalFoNThXUjJzVzJHUG4xZEtOTHp2K0RC?=
 =?utf-8?B?SjZKeGM1c3dPelF1azRibXJQNHl1NWdLZzVEOXNmY1h4OGVMQkNLaUx6Z3U3?=
 =?utf-8?B?QzZ6bmlYNjQ2THVlZ3NuOHBNUXh6RnFGc3p2QXJ3MUpTb0wyTHVJMlFpQ1BO?=
 =?utf-8?B?QzkwV28zTlRUR2dyVHNOY29WV29xSGdhOTJKeXhwNmdDQXJVaWh2N2tvRnF5?=
 =?utf-8?B?bjg4ang0Ti9YM0lkWnQ4dUVETzR2bitlN2xtRWNLb2pSOUVxdkc0RURxc044?=
 =?utf-8?B?VUFYaXhNdjhjZjBONnRwbWs5ZXZmdkR6eHVRbG8ySVBQc2pNK0hqR0I2STUx?=
 =?utf-8?B?Y1V2c0lmOVl4QStZVDQydjRVV3krMm94R09GOC9aMzNOZTJsYjFoeDRLRXp5?=
 =?utf-8?Q?4aSFOU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZThGa1hoVWgrc0Z3bmdUMzJNRGFhaHpJU1VhMTI5K2FWblBNSmhkdWpHTVQ1?=
 =?utf-8?B?a3dwemJzRFQ4Q003SVFqM092MUwwS21kemEza1hXQjBmRkREV3ZqKzdqaTlq?=
 =?utf-8?B?VGNOakRhRU5vS0FqTFFPRHJQVlhmY2xub1pxM0lSbWFxc3VUUTlFZmVnVlB5?=
 =?utf-8?B?UHhPQlpGdkZjbk0zTTB5aTVISmRMcXFnT3ExOGFLYUtVWlZGc3dLckdPWVdC?=
 =?utf-8?B?YzJyQjRsVWVabE5VVDJNT2NTWGdBRHRyVi9XTlhGS2tjalJpbm1MakxtLzE2?=
 =?utf-8?B?Rno5ZC9USXloSFBwQnlPazM1YmkyUzlrajhReUMwOTRQZ2E3aHhzSHdXYStY?=
 =?utf-8?B?V2dIakNmRmFKcW5RQVBwV0JpSWFybHNiMFliOW1NZzBzY3JhMHdnOU5VZURz?=
 =?utf-8?B?M3V5RlBMUUpTbHpLVFlUR2tpZGxjRlROVmtMTDV6QnJjV2hid3l5RkpzZXFn?=
 =?utf-8?B?STNOaWNRT0h3NUY2NWFESUVndE4xRGQrekJyNHl2enI1YjZhNnhTNWRaejU2?=
 =?utf-8?B?M09scGdTWGRHM1FMclRGUVAyUHM1Q0NEbTlqT0lERUlPc0NvTlB6WHNHY1px?=
 =?utf-8?B?eHhtKy8xSUU1NTVoaHI0QnJNWHNtYjZVVERUVThDblJKczNKbHdSeFMrT1J5?=
 =?utf-8?B?cS9NeGIxQUFKMEJzS2FjYS9rNkg2dk55STFwcGh5Qk9CT3d3TzF1Rm0yTDFE?=
 =?utf-8?B?dnRKZEVFNlV0SldJUzFzQmlRNDJRRjdMYWhpNk9ZWEdXTkR0TXZoK1lodUFJ?=
 =?utf-8?B?d2RicDIzTjVoT1MrM3lzbUhnL2VvaDBrbCtLZFI4dzlPRjYzcUFqTGh3VWk5?=
 =?utf-8?B?WFc3RE9BS3V4V3RONi8vMFc3WlhjbmtJSWltVVdhekZvbDQrQjE0K1ZrSDFz?=
 =?utf-8?B?SlZWSVEveXBiOXI0T3pENFNMbkZBcHRTQjVGUmVuNHJ1SW1xWHZTVjdrblhV?=
 =?utf-8?B?Y1hlZGxLVmREdUFTS2YvcmNLVmJOWTNxMFQ5QnZYV2hOaDJXWERZLzRwSERK?=
 =?utf-8?B?T20vQlNxRW5zK2pvTWl6SVBIZS9ROTNSMnBxTjkxaXVqVnNQV0w3TXh5Vjlm?=
 =?utf-8?B?VVpSdmZyQlovQVFTNWNEQUdOdEVxcVdpclErRHJ0MlZXZ1cxQTFLR3dYQ1JF?=
 =?utf-8?B?SVlQSysvbC9iYzNNdHVhUVM2NjAxdjVFeEdTSWlqVTlOK0xGMTBKRE1rVnJ4?=
 =?utf-8?B?SmZwZExvS1NKdFM2dzJLVklpVmkwbTB5NVZpRlNiU1BYUVVFZHlic1ZHWDBI?=
 =?utf-8?B?KzBhSG4yT0w0dGUyQ2o2ZkRMbkNVVDhJN2dqcDdFZkprbU82Mm5jWFpiWlo1?=
 =?utf-8?B?Mm1RcUw2TStDQjA3VERYWFk1aDYxWnVxVDBnaUFpVHVQWXc0VllvWnkwUTFY?=
 =?utf-8?B?OFRwL3lsdW5TRzlOcE11d3BPS0Q3elI3dGQrOGZBcnVqSXVMYjlQVFEyYXdO?=
 =?utf-8?B?cU1IUHpxQ2k5RzVLMVFGWVR3KzhrdHpsUG9sVGdzNzZDc2t2cVVtNStKKzdZ?=
 =?utf-8?B?aEJhU0NaQVY1a0VvSC9JT0ZOSkNNUGpNcHpSM05NWVdWM0ZwSE9OZDBEUzFu?=
 =?utf-8?B?UWdUak9LQXlRTkJLMUVrMEFpUjQwb1hkZ0JvaXMxa01aektkbldlZFAra3Ns?=
 =?utf-8?B?SzNla1ZtbjRvaWNjMXM5aS95NkVhdU5PR1A4bkQ1RW9hbzJqcm9qbm1JSlBC?=
 =?utf-8?B?QnVOMGxqZCt2ajhOWFcvelRFYU1hYUVCSjNGZElqV2VyaWFFUmtTVElHOXIr?=
 =?utf-8?B?K1pxZTdVYWp1Z3VhQ0xPV2FHM2k5ZitZVklWZ1pPejlibDlyb2tPcmNheTBT?=
 =?utf-8?B?aml5cEcza0RwYS9pWDF1bUFLelJ5bHd2ME85Z2FSalFHblNnWUd4UGZmZFRI?=
 =?utf-8?B?SzJPRjBjZ1JLR3BlRFA5YVF0NUVXV2lMTDYwMmdmbms5MkN6THRCZzBvVXFS?=
 =?utf-8?B?bGtTUzc5ME14Ykh2ODlYbjRNTWU0c0Z1bFUra2M4UG50UitWeUJiYnpTUklG?=
 =?utf-8?B?YU1hY1RKYjhiaytvYmJzTDg5OWNHbHlENWxMK3RDclJLK1NiZmd0UnpCSGxB?=
 =?utf-8?B?N2JXRHlrL3FrdHNLRWJvMzR0d1ZBWlYvcHdGd1FYVElYWjVRanV4elRUM01T?=
 =?utf-8?Q?pbmJBfZlwhG+xU46W42af1raD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1b398f-cdf3-4b3f-d6da-08de22a6cd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 11:21:33.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mP55s+6OI15P/gt7OSminWvpj0Aw9r0GIJrWZMmMEM/Ui1XdNUGXAjg9fAkOfVldzWmp9KJcqJMHqHLyhIiUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9445
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWog
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDEy
LCAyMDI1IDExOjIzIEFNDQo+IFRvOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogTmlrdWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBIb2dhbmRlciwgSm91
bmkNCj4gPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2
MyAwNS8xMF0gZHJtL2k5MTUvYWxwbTogQXV4bGVzcyB3YWtlIHRpbWUgY2FsY3VsYXRpb24NCj4g
Zm9yIFhlM3ANCj4gDQo+ID4gU3ViamVjdDogW1BBVENIIHYzIDA1LzEwXSBkcm0vaTkxNS9hbHBt
OiBBdXhsZXNzIHdha2UgdGltZSBjYWxjdWxhdGlvbg0KPiA+IGZvciBYZTNwDQo+ID4NCj4gPiBB
ZGQgc3VwcG9ydCBmb3IgYXV4bGVzcyB3YWtldGltZSBjYWxjdWxhdGlvbiBmb3IgRFAyLjEgQUxQ
TSBhcw0KPiA+IGRlcGVuZGVudCBwYXJhbWV0ZXIgZ290IGNoYW5nZWQuDQo+ID4NCj4gPiB2MTog
SW5pdGlhbCB2ZXJzaW9uLg0KPiA+IHYyOiBVc2UgaW50ZWxfZHBfaXNfdWhicigpLiBbSmFuaV0N
Cj4gPg0KPiA+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMgfCA2Mw0KPiA+ICsrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA1MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCBiNGI4NzRkZDM3
MjUuLjgxNDcyMjU0YWI3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYWxwbS5jDQo+ID4gQEAgLTEwMCwyMyArMTAwLDY0IEBAIHN0YXRpYyBpbnQgZ2V0
X2xmcHNfaGFsZl9jeWNsZV9jbG9ja3MoY29uc3QNCj4gPiBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZSkNCj4gPg0KPiA+ICBzdGF0aWMgaW50IGdldF90cGh5Ml9wMl90b19wMChj
b25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkgIHsNCj4gPiAtCXJldHVy
biAxMiAqIDEwMDA7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2lu
dGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIERJU1BMQVlfVkVS
KGRpc3BsYXkpID49IDM1ID8gKDQwICogMTAwMCkgOiAoMTIgKiAxMDAwKTsNCj4gPiAgfQ0KPiA+
DQo+ID4gLXN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpDQo+ID4gK3N0YXRpYyBpbnQgZ2V0X2Vz
dGFibGlzaG1lbnRfcGVyaW9kKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gKwkJCQkg
ICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gIHsNCj4g
PiAgCWludCB0MSA9IDUwICogMTAwMDsNCj4gPiAtCWludCB0cHM0ID0gMjUyOw0KPiA+ICsJaW50
IHRwczQgPSBpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpID8gKDM5NiAqIDMyKSA6ICgyNTIg
KiAxMCk7DQo+ID4gIAkvKiBwb3J0X2Nsb2NrIGlzIGxpbmsgcmF0ZSBpbiAxMGtiaXQvcyB1bml0
cyAqLw0KPiA+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNf
c3RhdGUtPnBvcnRfY2xvY2s7DQo+ID4gKwlpbnQgdG1sX3BoeV9sb2NrID0gMTAwMCAqIDEwMDAg
KiB0cHM0IC8gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jayAvIDEwOw0KPiA+ICsJaW50IGx0dHByX2Nv
dW50ID0gMDsNCj4gPiAgCWludCB0Y2RzLCBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gPg0KPiA+
IC0JdGNkcyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRtbF9waHlfbG9jaykgKyAxKSAqIHRt
bF9waHlfbG9jazsNCj4gPiAtCWVzdGFibGlzaG1lbnRfcGVyaW9kID0gKFNJTEVOQ0VfUEVSSU9E
X1RJTUUgKyB0MSArIHRjZHMpOw0KPiA+ICsJaWYgKGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19z
dGF0ZSwgSU5URUxfT1VUUFVUX0VEUCkpIHsNCj4gPiArCQl0Y2RzID0gKDcgKyBESVZfUk9VTkRf
VVAoNjUwMCwgdG1sX3BoeV9sb2NrKSArIDEpICoNCj4gPiB0bWxfcGh5X2xvY2s7DQo+ID4gKwl9
IGVsc2Ugew0KPiA+ICsJCXRjZHMgPSA3ICogdG1sX3BoeV9sb2NrOw0KPiA+ICsJCWx0dHByX2Nv
dW50ID0gZHJtX2RwX2x0dHByX2NvdW50KGludGVsX2RwLQ0KPiA+ID5sdHRwcl9jb21tb25fY2Fw
cyk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKGx0dHByX2NvdW50KSB7DQo+ID4gKwkJaW50
IHRsdyA9IDEzMDAwOw0KPiA+ICsJCWludCB0Y3MgPSAxMDAwMDsNCj4gPiArCQlpbnQgdGxmcHNf
cGVyaW9kID0gZ2V0X2xmcHNfY3ljbGVfdGltZShjcnRjX3N0YXRlKTsNCj4gPiArCQlpbnQgdGRj
cyA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y3MgKw0KPiA+ICsJCQkgICAgKGx0dHBy
X2NvdW50IC0gMSkgKiAodGx3ICsgdGxmcHNfcGVyaW9kKSk7DQo+ID4gKwkJaW50IHRhY2RzID0g
NzAwMDA7DQo+ID4gKwkJaW50IHRkcyA9IChsdHRwcl9jb3VudCAtIDEpICogNyAqIHRtbF9waHlf
bG9jazsNCj4gPiArDQo+ID4gKwkJLyogdGRybCBpcyBzYW1lIGFzIHRjZHMqLw0KPiA+ICsJCWVz
dGFibGlzaG1lbnRfcGVyaW9kID0gdGx3ICsgdGxmcHNfcGVyaW9kICsgdGRjcyArIHRhY2RzICsN
Cj4gPiB0ZHMgKyB0Y2RzOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQkvKiBUT0RPOiBBZGQgYSBj
aGVjayBmb3IgZGF0YSByZWFsaWduIGJ5IERQQ0QgMHgxMTZbM10gKi8NCj4gPiArDQo+ID4gKwkJ
ZXN0YWJsaXNobWVudF9wZXJpb2QgPSAoU0lMRU5DRV9QRVJJT0RfVElNRSArIHQxICsgdGNkcyk7
DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXJldHVybiBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gPiAg
fQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgZ2V0X3N3aXRjaF90b19hY3RpdmUoY29uc3Qgc3RydWN0
IGludGVsX2NydGNfc3RhdGUNCj4gPiArKmNydGNfc3RhdGUpIHsNCj4gPiArCWludCBwb3J0X2Ns
b2NrID0gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4gPiArCWludCBzd2l0Y2hfdG9fYWN0aXZl
Ow0KPiA+ICsNCj4gPiArCWlmIChpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpKSB7DQo+ID4g
KwkJaW50IHN5bWJvbF9jbG9jayA9IHBvcnRfY2xvY2sgLw0KPiA+ICtpbnRlbF9kcF9saW5rX3N5
bWJvbF9zaXplKHBvcnRfY2xvY2spOw0KPiA+ICsNCj4gPiArCQlzd2l0Y2hfdG9fYWN0aXZlID0g
MzIgKiBESVZfUk9VTkRfVVAoKDM5NiArIDMgKyA2NCksDQo+ID4gc3ltYm9sX2Nsb2NrKTsNCj4g
PiArCX0gZWxzZSB7DQo+ID4gKwkJc3dpdGNoX3RvX2FjdGl2ZSA9IDA7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIHN3aXRjaF90b19hY3RpdmU7DQo+ID4gK30NCj4gPiArDQo+ID4gIC8q
DQo+ID4gICAqIEFVWC1MZXNzIFdha2UgVGltZSA9IENFSUxJTkcoICgoUEhZIFAyIHRvIFAwKSAr
IHRMRlBTX1BlcmlvZCwgTWF4Kw0KPiA+ICAgKiB0U2lsZW5jZSwgTWF4KyB0UEhZIEVzdGFibGlz
aG1lbnQgKyB0Q0RTKSAvIHRsaW5lKSBAQCAtMTM2LDEzDQo+ID4gKzE3NywxNSBAQCBzdGF0aWMg
aW50IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChjb25zdCBzdHJ1Y3QNCj4gPiBpbnRlbF9jcnRj
X3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpDQo+ID4gICAqIHRNTF9QSFlfTE9DSyA9IFRQUzQgTGVu
Z3RoICogKCAxMCAvIChMaW5rIFJhdGUgaW4gTUh6KSApDQo+ID4gICAqIFRQUzQgTGVuZ3RoID0g
MjUyIFN5bWJvbHMNCj4gPiAgICovDQo+ID4gLXN0YXRpYyBpbnQgX2xubF9jb21wdXRlX2F1eF9s
ZXNzX3dha2VfdGltZShjb25zdCBzdHJ1Y3QNCj4gPiBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNy
dGNfc3RhdGUpDQo+ID4gK3N0YXRpYyBpbnQgX2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGlt
ZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICsJCQkJCSAgIGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpDQo+ID4gIHsNCj4gPiAgCWludCB0cGh5
Ml9wMl90b19wMCA9IGdldF90cGh5Ml9wMl90b19wMChjcnRjX3N0YXRlKTsNCj4gPiAtCWludCBl
c3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChjcnRjX3N0YXRl
KTsNCj4gPiArCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3RhYmxpc2htZW50X3Bl
cmlvZChpbnRlbF9kcCwNCj4gPiBjcnRjX3N0YXRlKTsNCj4gPiArCWludCBzd2l0Y2hfdG9fYWN0
aXZlID0gZ2V0X3N3aXRjaF90b19hY3RpdmUoY3J0Y19zdGF0ZSk7DQo+ID4NCj4gPiAgCXJldHVy
biBESVZfUk9VTkRfVVAodHBoeTJfcDJfdG9fcDAgKw0KPiA+IGdldF9sZnBzX2N5Y2xlX3RpbWUo
Y3J0Y19zdGF0ZSkgKw0KPiA+IC0JCQkgICAgZXN0YWJsaXNobWVudF9wZXJpb2QsIDEwMDApOw0K
PiA+ICsJCQkgICAgZXN0YWJsaXNobWVudF9wZXJpb2QgKyBzd2l0Y2hfdG9fYWN0aXZlLCAxMDAw
KTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQNCj4gPiBAQCAtMTU0LDcgKzE5Nyw3IEBA
IF9sbmxfY29tcHV0ZV9hdXhfbGVzc19hbHBtX3BhcmFtcyhzdHJ1Y3QNCj4gPiBpbnRlbF9kcCAq
aW50ZWxfZHAsDQo+ID4gIAkJbGZwc19oYWxmX2N5Y2xlOw0KPiA+DQo+ID4gIAlhdXhfbGVzc193
YWtlX3RpbWUgPQ0KPiA+IC0JCV9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoY3J0Y19z
dGF0ZSk7DQo+ID4gKwkJX2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGltZShpbnRlbF9kcCwg
Y3J0Y19zdGF0ZSk7DQo+IA0KPiBObyByZWFsIG5lZWQgdG8gcGFzcyB0aGUgd2hvbGUgaW50ZWxf
ZHAgaGVyZSBhbGwgeW91IG5lZWQgaXMNCj4gbHR0cHJfY29tbW9uX2NhcHMgcGFzcyBqdXN0IHRo
YXQNCg0KRGlkIG5vdCBnZXQgd2hhdCBpcyB0aGUgaXNzdWUgd2l0aCBpbnRlbF9kcCwgQm90aCBj
YXNlcyB0aGUgYXJndW1lbnQgd2lsbCBiZSBzaXplIG9mIGEgcG9pbnRlci4NClRoZXJlIGlzIG5v
IG1lYW5pbmcgb2YgbHR0cHItY2FwcyBmb3IgRURQLCBzbyB1bnRpbCB0aGVyZSBpcyBhIHN0cm9u
ZyBvYmplY3Rpb24vcmVhc29uaW5nIEkgd291bGQgcHJlZmVyIHRvIHBhc3MgaW50ZWxfZHAgaW5z
dGVhZCBvZiBsdHRwci1jYXBzLiANCg0KUmVnYXJkcywNCkFuaW1lc2gNCg0KPiANCj4gUmVnYXJk
cywNCj4gU3VyYWogS2FuZHBhbA0KPiANCj4gPiAgCWF1eF9sZXNzX3dha2VfbGluZXMgPSBpbnRl
bF91c2Vjc190b19zY2FubGluZXMoJmNydGNfc3RhdGUtDQo+ID4gPmh3LmFkanVzdGVkX21vZGUs
DQo+ID4gIAkJCQkJCSAgICAgICBhdXhfbGVzc193YWtlX3RpbWUpOw0KPiA+ICAJc2lsZW5jZV9w
ZXJpb2QgPSBnZXRfc2lsZW5jZV9wZXJpb2Rfc3ltYm9scyhjcnRjX3N0YXRlKTsNCj4gPiAtLQ0K
PiA+IDIuMjkuMA0KDQo=
