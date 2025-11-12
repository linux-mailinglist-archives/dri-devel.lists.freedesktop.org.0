Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F59C50A16
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6026510E69B;
	Wed, 12 Nov 2025 05:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGeJ3q6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62410E69A;
 Wed, 12 Nov 2025 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762926281; x=1794462281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r7bCHn3Hrp+p/bNutld0gvH66l6KXSvFsSliSGezkk8=;
 b=XGeJ3q6nONd+vuI55b0PHO5/LjnaqE+XKtyYU1yHS/d8wOl3z/PuFoY2
 N5mMbxvTXlFG/7iUhyDUuSOFX2fVseSExe71u1spQ9eeDvzqAUYT2seYW
 rd9QR3qKMjCPoDV47oHNlnEF0/j50UoxdnXLdjtqkdrzrEiqr0CiwjQUJ
 h0j7cunObw1l324THz/VfM7IDZcMF7lHarPCddjX8HqtjY+yUdTzrekWV
 gC1smUA/ZGNQZcCHoeTodw4UbEKC5xk8cZibtvN6VPl4nRkqglR2cN2nt
 04JEg+5cVO6TmadfIAwnr1iVGvdvduwbkLvoPftSUa6Yjj/Mv7T5y1+m6 g==;
X-CSE-ConnectionGUID: jX3oyP0lRL+aQfA9Tb8Y1Q==
X-CSE-MsgGUID: MwYYlsoFQaaroReGWO9eCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64865238"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="64865238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:44:41 -0800
X-CSE-ConnectionGUID: XRMBA+GfTQGXv1Gjw/5aGw==
X-CSE-MsgGUID: PBm2df9DQkanpowf8lckGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="219853402"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:44:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:44:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:44:40 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:44:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCIQmejmuQ+jAJSbt/z/cea42bqDodYubJtbZ2h0JaExsl7zfkSVoyGqI0acpOU5sCMKihpqZV/irW3ZD0cKrPBVGuQWJ9ZO/zvOkoxdXZzAnj8pHZmjirYl5lhqmD1uyBbQFVIPtIkBZFgmssegLbpAACgInxaptg81JlkcLV70iw3oj+GmQ9BxXxUh2sDVES7rXtBOJ/OV3S3BF8CnUVTZXFfzbQuNn6VeKAVhMUmTl5LBrFlR/CxMjZkcOZwhbc5K7fVcDSKtUVmIP3sp3BiG7f1/6wR/feviwNjOf3Uz/byn79ObEcCy6uuLyD2zY471AkxZ4njxrdi8KImIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7bCHn3Hrp+p/bNutld0gvH66l6KXSvFsSliSGezkk8=;
 b=X3wdiXCCaDeS1sMnL9DF8prvqYEev03F99RnzbJUMfKgPFnoYCmHKVsm07WLI11uLRuOqbmmEpV6zquOrXkE5c6xwoKbhMfSfxF0sTYVm/gJho0+USkpA2KF/WNS1R6sUNwqh/XW5yDdJVgaDaJkSNMP+zPQNBC21mCyyFS70GrErVTIEe8HVFOu0zWpmN0CdC24XS2aeId0Jp4a/JIzA4vr80vUkjtFPiE0yv7BlEQds2Iqfskf04F08pArkmUlEBBBmBrTWNbt1kh/gR/p4Auo4ekotqTqSgysu5qJFSpFEkiI/7n367SwrD901RcXq5vTpnaogelizj/fWC8EUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB8198.namprd11.prod.outlook.com
 (2603:10b6:208:453::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 05:44:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:44:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 02/10] drm/i915/alpm: alpm_init() for DP2.1
Thread-Topic: [PATCH v3 02/10] drm/i915/alpm: alpm_init() for DP2.1
Thread-Index: AQHcUwygBWC4xVy+jUmTQA+b096yMrTuiGJw
Date: Wed, 12 Nov 2025 05:44:38 +0000
Message-ID: <DM3PPF208195D8D4B6EA8B1F93F78CF0C07E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-3-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-3-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB8198:EE_
x-ms-office365-filtering-correlation-id: 9cc18739-c75e-44cf-878a-08de21ae91c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cWNrUzR0QmpCNGtJOWNjYkVCNDErTC9yVGxuYWRVcjUyMmlvS3lrYTgzdVNI?=
 =?utf-8?B?bVJsdWhoTGU2MU5jQksyc21URlU1SFp0d2JaZlZ2UjhBam5qQ0h4RVJReURq?=
 =?utf-8?B?eDBzYUpJeWI4MWF3dDZaMHhRc2pSWkFlV2FsRm1BaXYyVXA1eGNqSlFId1cw?=
 =?utf-8?B?Ky9OVG5vc25YWG1tOG1kaCtmOHZJN2M3MVhCYWJpblYrMmE0V1dzNHFLNVhX?=
 =?utf-8?B?S0p4Y056S1FKTFpGMThCV0VmMFh4N1llbit6Wm9QV0ZCT0loVXhwb3lnNHEv?=
 =?utf-8?B?SzJKRk1saWxaUXJvTkVuaDRZVDRhSU55RUNtbHFPK2Z4K1Ywdk96V0lqNFJW?=
 =?utf-8?B?Q09wWmlvdFBSZm1zcXk4cUZQWDc5OGJxTmNPSmdFSFhkRkJaMUFVTHhRb3FK?=
 =?utf-8?B?M29sMERYRkdZNDRGSHZBYUdNZFRnME01bThuTEV4QW9PZlpXUnZCYTM2WU45?=
 =?utf-8?B?Z3dVUDN1RG5qcUc0UWpwVHFMelRUWlJyN0w3eWNEYzVmZGYvcnJycm14LzNa?=
 =?utf-8?B?S2Yya2tsNm9ZWFBPV2dGd2ZTVXBIREdCUEdkamZDeHpSWWF2SC9VYk9sOFlH?=
 =?utf-8?B?d0ZkQmhnbkd5YjljTzlJUWlrSFRPVmxUVXc2TGNsWWtyTU5UUndEUFhxSExT?=
 =?utf-8?B?TkIyQ0JMNklLc1NKUm0xZ2ZuSWpHTlpNTm9zUzFFbWl6VTJpYXFjVkpjZHYv?=
 =?utf-8?B?NVhzVXRnL3U1bGdMR0hiZzNCQlM2M0xqWlhlU0tQQ05nMmhtZ3N4QW5vdkhI?=
 =?utf-8?B?L29qN2cxMVBxWmZUZHpOUkVvelhvRndWQjA5UGE4NDg4N2ZMS29NblNLMk5p?=
 =?utf-8?B?VkloM1Jva3VKYnE5TFdyWG9obkJka2dmcnJBdml3TWw0QlNvQ0J4aHczUzZl?=
 =?utf-8?B?a0dVSWkrZEIydnFVanhqYUZWWTR4QUNySmptVFZoU0tmd2dNUEIrU2U1RUdJ?=
 =?utf-8?B?aFZ3RU4wU3QzT3dGdVVKQlp4TmtzMFdwTy96bXh5dDVWNHM5OUhobFprT01s?=
 =?utf-8?B?elZ5L3RRTWtIM0dHcjl5L3J0TjF6TVI2SWZlMWl0SDV1b250ZG82b01KUVh2?=
 =?utf-8?B?V2VxRjdkRHlOWmZ4NjBYVW5ZSXFBeEVkZTFvSVRiZ09vOGJYR29xV0p2U3Z3?=
 =?utf-8?B?b050OWRWalF1eDh1Z1hBM3gwajI4Wlh4ZUJLYm9RR1h4dUY2bWlPcEhhcS8v?=
 =?utf-8?B?MHgrSFFlbjV1b21BNEViMkVZdE1EVGlkcVpkMmRkcGh4QTVCcEJpN0ZNWUpC?=
 =?utf-8?B?SE5OSS9vM3V0dFhPSllrcFNuOE85MzNYUXFiMktkeFhZcnVEaXhpdVlGc3NY?=
 =?utf-8?B?aVVUaWg3SnFQanM3aTZOUFMyTlpGQ2xRVW1HUzZhaWpFLzBud1FLRkdqWU5V?=
 =?utf-8?B?c0pGMEJxWHBhUHc1cWY2b0RhOWg1VUJBTWVnQURqVkhuUkhNcG5WVUJrMVk5?=
 =?utf-8?B?VERkYUhzZWFqcWhXQzAxK0hHaDVralREQUZLRDB3SXBnLzFxeW5BVDhhQ3JF?=
 =?utf-8?B?VDRBRDl1a3BjK2U2akx3b2VWbzJmT1FaRXNNZ2JxdXlFb1hseUxNVGEwc2JM?=
 =?utf-8?B?bXZGdGVHb1A3R0k2OU1JZTZUUUJzTnJ3dGhZbDBVMm1hdHhMMzVDM01QdElB?=
 =?utf-8?B?QzltTGFBd3dpa2xmUERZZmhmS2pxUzQ1YUgvQWpPSUpzZ0x5MDZ2ZExuWXl0?=
 =?utf-8?B?RnRwRmM5N0Q5V2cxeitUKzV5eVM5YTNNQ0o5SU9NMmhYRmEvaTB0OVFnK3RN?=
 =?utf-8?B?SGIvN0FaWC9VbXlESkZORVNwMm9CTTNLVkI1K1dEYTBBWWF3d1BkS1Z3b2U4?=
 =?utf-8?B?QzdjR2tSWmMwMkd4dlFwWjM0a1FacnlWV05tMHNLVzlOQ3hWano2eEFrTSt5?=
 =?utf-8?B?NWVwUWkycUJld3NKSXNjN1JrNUhySUJsTURNak03SGFCaFo1WUJTY3ZJQXRm?=
 =?utf-8?B?ZDBaZFU1Z0NvNytjdjVxYTE0NkVOeU82MmhKS3pDSE5qdkVzcy9uVlFNcm90?=
 =?utf-8?B?UGxMYlVWM1lHV2JoRTRVTEdoTjVaL2Y3OG1SK2NkRXNmeGFxajdpMzE5bGIz?=
 =?utf-8?Q?ApII+P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFZTaGlRc0JVYlJWOEFvMlBQYlRidG4zL1BXLzZZT21Tb2RyVGNhSjR3d1Jo?=
 =?utf-8?B?ZzAvTGhSMEc3OVkvQmJTVy8vQWhnUVZGMDFHNllsSmd6dlBqYjc1OEdEZFZ0?=
 =?utf-8?B?NEVvMTZVbHpzeTBuVjNIWmYxZkxXbEpXNElySEd6emNwWHRHVnVGbndqOUZ5?=
 =?utf-8?B?K3U0ZlhGUXJBSXVER284VDlIeUowb1FHYUZIT3NKRTFnOUw3TisvWXBJNGJy?=
 =?utf-8?B?d3BhQWF0MlEvanR5OUhsNFQyV2l6SVJnMjlVeWMzN2FqK1Z6M2pOcm80ZVJj?=
 =?utf-8?B?b3ROSnlUOVRISFgyRVhpUlh5TmhWNUowVGhkTGFiOVBHUkFtQ05ZRlZ5VlVq?=
 =?utf-8?B?RGIrbzNVZk5pMDhzVzE2a2NEL1k1TzY5dGo4K2YrMHhabGh4NTA4WE56SXdX?=
 =?utf-8?B?VzMyYkdwZTB3ck03V2NQYjNaV00rei9RRjNLNUVWa1BWQUVja05LWmViNUhQ?=
 =?utf-8?B?S1JxMFIxYkpzZVdKbWQ4TzVVVEJtYUJaV2dJeEF2aGVOMTRjblNPVjkyeTV4?=
 =?utf-8?B?VkpRUEpPSm9Ga283Mm1laW8vUjE4cE1GZXZ5U2RRSUw3engrekN2T1dVSEdT?=
 =?utf-8?B?WnF3N0I0eG5sNWRJdDQwd092eVZERHFTUnpoSGpUY28rZXRxejFQMmlsdHJj?=
 =?utf-8?B?NW4wRXVSSlhwazUrdkRhOXJNTGY4VnBBQ2gxaXFzVjFVR0dkZzlzbnJoV1Rj?=
 =?utf-8?B?UU5wclVwbTc3aVRUcitNWWV3L3N3cEY3OUZYbEFvQ2hXbDA3bTErUzc1MXJl?=
 =?utf-8?B?eGsrTzFzZm15b2N1b29vcDZyQUxUWEVXSFVaNGN2WEt5dTJRRkdpTzNlc3Rv?=
 =?utf-8?B?YnFrVzJORTFnYS84MFNJZ2hzYUZ0bkQ5ODAxcnpNYVoyZ2lSbUZidmw0bjMx?=
 =?utf-8?B?dW9PM29JNmZzYlo4dCs2T0VNcld5a3MxMllvc25uaHYwMzljYXpUWUZnZytk?=
 =?utf-8?B?aE96d2tFUFRjTmYzZkN3bThpa09JRVFVOHBNMGlPVVdMdVhqelBPSnQwWlNm?=
 =?utf-8?B?R251N3dWQU8vRkx6SFh1YjNFSSszQ09zRXE2ZEM1WUhCakJPWjlUQTRYbjRF?=
 =?utf-8?B?UlVib2dWd2pMWTdlK1pCU3lKU3BWWlo5VzhpWDEyRTkzU1k3MHQ3cStEbGd5?=
 =?utf-8?B?N29pV09wRmltaWUyNWs4TlAzN3FRREpHUjhtVldUdUU4TVpqSWRhN3cwaytW?=
 =?utf-8?B?bVlqeDE3Q29oU1h5Y3F2Y0tCN01oK2c1dXB3SEkySEFpaytrRlduMjIxd2pt?=
 =?utf-8?B?SS9KK2ljTFRTRUNaclNVSzRwZE1BSW95eFIvMzBQVEJTL1JuSmJhYmJ1bUNt?=
 =?utf-8?B?cnhWak43OXdZY1M1cUU2NnZRTVUxSmJOUXJpUnhtQkxiWmxXY3h0em55Wktr?=
 =?utf-8?B?VENoUzFtVWpCSjRvQ0o4eCsvcXpKZS9zL3NUUlUwUE80Mll5UHY4Uml0ZWc4?=
 =?utf-8?B?NmJ3REhETysweE5seUNwLzI3WTR4TW9nY1A3L05jOXdwZ0NySVo4SWJ1SjhO?=
 =?utf-8?B?QTVUcVNCNmtKajd2WVFRWlV2d25DUmh1QVhrckFUclBDYkFEQ25oenRqcEcv?=
 =?utf-8?B?UDlwbC9NcE0wQTZLTmNuNEtTRnkrVlh2U1J3bGlCeXR3amluWnpEUG56VE41?=
 =?utf-8?B?WDJvM2pncG5hdVV0ZE80UEFCamdkV1U2akJsSzR6eWZUbnhIZHY0eVMxMm83?=
 =?utf-8?B?S2dLdXRnL0VPN1dQWlg4Z0hGN0hRQVB0Q0VtYzVvY3ZHOGhiczJ6N2ZqQVRo?=
 =?utf-8?B?cDV6Tkwvb3JxRittd0RHK3NqRFlqSlk3WnpQU2lsMGcwT2pCakh1dC8rdTJk?=
 =?utf-8?B?T29HU25VaGt0TStSaHB2ZnZlN3lqd2JlTHVNdlBUaW9uT3REbEJlSU5tRnlD?=
 =?utf-8?B?VVk3eldNdk5DV00zaFEvM1AwTDZiK2pmbVQ5MUh6anB4dXhiRFRYM1lRd3l6?=
 =?utf-8?B?TGRiWldEQmt2Mm1QR2F4QjVUbGhlTmpEQ20rQ3FzU09JQk1xek5FdTZsSmpB?=
 =?utf-8?B?SmRNZkg3cVdoMFlJQUpHbzEwYXBYWU5QWlgyL3ZtclBZTmhad1RiaUNoWklt?=
 =?utf-8?B?OFBpd0lqQkdqUFh6cVJrRDAyVDg2a0ZoRkFZemtvREVWcHJvNDBONitDQVBP?=
 =?utf-8?Q?SXx3gB847duZARul5niBX8rsh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc18739-c75e-44cf-878a-08de21ae91c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:44:38.6292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw8NSmDCMGHGRTaxlLd67UuwLPbUSrT5ZBlk4uznOwr1bDK2B7c7BaFTABFdr07acaNd3kYmggUM2PH1xoIdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDIvMTBdIGRybS9pOTE1L2FscG06IGFscG1faW5pdCgpIGZv
ciBEUDIuMQ0KPiANCj4gSW5pdGlhbGl6ZSBhbHBtIGZvciBEUDIuMSBhbmQgc2VwYXJhdGUgb3V0
IGFscG0gbXV0ZXgtaW5pdCBmcm9tIGFscG0taW5pdC4NCg0KS2VlcCBhY3JvbnltcyBjYXBpdGFs
aXplZCB3aGVyZXZlciBwb3NzaWJsZQ0KDQo+IA0KPiB2MTogSW5pdGlhbCB2ZXJzaW9uLg0KPiB2
MjogU2VwYXJhdGUgb3V0IG11dGV4LWluaXQuIFtKYW5pXQ0KPiB2MzogUmVmYWN0b3IgZnVydGhl
ciB0byBhdm9pZCBESVNQTEFZX1ZFUiBjaGVjayBpbiBtdWx0aXBsZSBwbGFjZXMuIFtKYW5pXQ0K
DQpZb3UgZG9u4oCZdCBuZWVkIHRvIG1lbnRpb24gdjE6IEluaXRpYWwgdmVyc2lvbiBzdGFydCBm
cm9tIHYyDQpXaXRoIHRoZXNlIGZpeGVkDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3Vy
YWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5p
bWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMgfCAxNiArKysrKysrKysrKysrKy0tDQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oIHwgIDMgKystDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICB8ICA4ICsrKysrKystDQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCA2MzcyZjUzM2Y2NWIuLjE0
YWNkNjcxN2U1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9h
bHBtLmMNCj4gQEAgLTQxLDcgKzQxLDIwIEBAIGJvb2wgaW50ZWxfYWxwbV9pc19hbHBtX2F1eF9s
ZXNzKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+ICAJCShjcnRjX3N0YXRlLT5oYXNf
bG9iZiAmJg0KPiBpbnRlbF9hbHBtX2F1eF9sZXNzX3dha2Vfc3VwcG9ydGVkKGludGVsX2RwKSk7
DQo+ICB9DQo+IA0KPiAtdm9pZCBpbnRlbF9hbHBtX2luaXQoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCkNCj4gK2Jvb2wgaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkKHN0cnVjdCBpbnRlbF9j
b25uZWN0b3IgKmNvbm5lY3Rvcikgew0KPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5
ID0gdG9faW50ZWxfZGlzcGxheShjb25uZWN0b3IpOw0KPiArDQo+ICsJaWYgKCEoKGNvbm5lY3Rv
ci0+YmFzZS5jb25uZWN0b3JfdHlwZSA9PQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBv
cnQgJiYNCj4gKwkgICAgICAgRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUpIHx8DQo+ICsJICAg
IChjb25uZWN0b3ItPmJhc2UuY29ubmVjdG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9S
X2VEUCAmJg0KPiArCSAgICAgRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMjApKSkNCj4gKwkJcmV0
dXJuIGZhbHNlOw0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgaW50
ZWxfYWxwbV9nZXRfc2lua19jYXBhYmlsaXR5KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+
ICB7DQo+ICAJdTggZHBjZDsNCj4gDQo+IEBAIC00OSw3ICs2Miw2IEBAIHZvaWQgaW50ZWxfYWxw
bV9pbml0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ICAJCXJldHVybjsNCj4gDQo+ICAJ
aW50ZWxfZHAtPmFscG1fZHBjZCA9IGRwY2Q7DQo+IC0JbXV0ZXhfaW5pdCgmaW50ZWxfZHAtPmFs
cG0ubG9jayk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBnZXRfc2lsZW5jZV9wZXJpb2Rfc3lt
Ym9scyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSkgZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gaW5kZXggNTM1OTliNDY0
ZGVhLi5iY2MzNTRhNDZhMWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5oDQo+IEBAIC0xNSw3ICsxNSw4IEBAIHN0cnVjdCBpbnRlbF9jb25uZWN0b3I7
ICBzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlOw0KPiBzdHJ1Y3QgaW50ZWxfY3J0YzsNCj4gDQo+
IC12b2lkIGludGVsX2FscG1faW5pdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTsNCj4gK2Jv
b2wgaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkKHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNv
bm5lY3Rvcik7DQo+ICt2b2lkIGludGVsX2FscG1fZ2V0X3NpbmtfY2FwYWJpbGl0eShzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwKTsNCj4gIGJvb2wgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiAgCQkJICAgICAgIHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlKTsgIHZvaWQNCj4gaW50ZWxfYWxwbV9sb2JmX2NvbXB1dGVfY29u
ZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMNCj4gaW5kZXggMGVjODJmY2JjZjQ4Li44MWRkNWJmN2UzYzUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gQEAgLTYwNzQs
NiArNjA3NCw5IEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPiAqX2Nv
bm5lY3RvciwNCj4gIAlpZiAocmV0ID09IDEpDQo+ICAJCWNvbm5lY3Rvci0+YmFzZS5lcG9jaF9j
b3VudGVyKys7DQo+IA0KPiArCWlmIChpbnRlbF9hbHBtX3NvdXJjZV9zdXBwb3J0ZWQoY29ubmVj
dG9yKSkNCj4gKwkJaW50ZWxfYWxwbV9nZXRfc2lua19jYXBhYmlsaXR5KGludGVsX2RwKTsNCj4g
Kw0KPiAgCWlmICghaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkNCj4gIAkJaW50ZWxfcHNyX2lu
aXRfZHBjZChpbnRlbF9kcCk7DQo+IA0KPiBAQCAtNjcxNiw3ICs2NzE5LDcgQEAgc3RhdGljIGJv
b2wgaW50ZWxfZWRwX2luaXRfY29ubmVjdG9yKHN0cnVjdA0KPiBpbnRlbF9kcCAqaW50ZWxfZHAs
DQo+ICAJICovDQo+ICAJaW50ZWxfaHBkX2VuYWJsZV9kZXRlY3Rpb24oZW5jb2Rlcik7DQo+IA0K
PiAtCWludGVsX2FscG1faW5pdChpbnRlbF9kcCk7DQo+ICsJaW50ZWxfYWxwbV9nZXRfc2lua19j
YXBhYmlsaXR5KGludGVsX2RwKTsNCj4gDQo+ICAJLyogQ2FjaGUgRFBDRCBhbmQgRURJRCBmb3Ig
ZWRwLiAqLw0KPiAgCWhhc19kcGNkID0gaW50ZWxfZWRwX2luaXRfZHBjZChpbnRlbF9kcCwgY29u
bmVjdG9yKTsgQEAgLTY5MzIsNg0KPiArNjkzNSw5IEBAIGludGVsX2RwX2luaXRfY29ubmVjdG9y
KHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0LA0KPiANCj4gIAlpbnRlbF9wc3Jf
aW5pdChpbnRlbF9kcCk7DQo+IA0KPiArCWlmIChpbnRlbF9hbHBtX3NvdXJjZV9zdXBwb3J0ZWQo
Y29ubmVjdG9yKSkNCj4gKwkJbXV0ZXhfaW5pdCgmaW50ZWxfZHAtPmFscG0ubG9jayk7DQo+ICsN
Cj4gIAlyZXR1cm4gdHJ1ZTsNCj4gDQo+ICBmYWlsOg0KPiAtLQ0KPiAyLjI5LjANCg0K
