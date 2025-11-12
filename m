Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29423C50A20
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3A10E699;
	Wed, 12 Nov 2025 05:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKObS+2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D46A10E699;
 Wed, 12 Nov 2025 05:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762926372; x=1794462372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zEPTTFAmGk+3IJOtTSfY4aGWAuSxKemZTcqbaZSa/Qs=;
 b=mKObS+2i+GuppfB+V4rY9+PS0uZcyogNHCwBZVjAGdr6ipdkXlQGYHey
 2maCFQNum1UgVukAf+pdnedj5FhGCaMAVZo6I+9DzTZUyxCnwMJTo4f8M
 Lm5/GtfNsv5kb9PAQ/dcYOdotYt3+yQ4BTlAlRc5q+vk1x9c43EwOnJmD
 lGktwJ4iX3D2fG9hxZidI4E3HOLqoIJ7ZCNChPvBxXmZwboQcJS6K9YOf
 1hh5PTipCHLtq+7gPQ+4bvGKB0pqi9UZTaXkz7aDNVMPM//mH0w8NFFsu
 Mm7mKX+yF3pN/bRzAq0sfmDCHcPJVIsnYTjC73qvFrfbcqswQZdiZto9j Q==;
X-CSE-ConnectionGUID: NgonRYHoTbqz/hFfVjPhuA==
X-CSE-MsgGUID: aA7ZMSIWRlig/92y/W3Mkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65078970"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="65078970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:46:09 -0800
X-CSE-ConnectionGUID: cLM3WdjqQg6vxj9boOLHlg==
X-CSE-MsgGUID: 5bnZcayUQ4OAM3qgBOoeKg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:46:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:46:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:46:08 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:46:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myI52GY63cySud+Nsw7hngYNR3RVA5/DBp6dzDdCyCx6wwhFAs5tJUSi+3yxVvzxxIBvmmPoXWzDqTkGYDvafNdq4LDsIgkmJD/td6eWXZb+ZN2BjbKKbrMUk914Vx2kgvKdzU1nDNFw6Ih7ZmPDgE3fxsWHYS295LwF8M0PGPBu5k2cH0Phx+WKZhVpXqK2sFbEA3AzL0rdtgrYcLDcJ4jYADxGrxEMXm0OjEvnxzrxw3K6gU9tAwACdN8So2Tqb4Xfqo6i0IbOWuTxG9IvBoMbaCtmlgNsAzauV8fxkY7t3zhewejopxKOy4LHiuRKElCO/6nFYg/pSvECDgjnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEPTTFAmGk+3IJOtTSfY4aGWAuSxKemZTcqbaZSa/Qs=;
 b=NjsqvaF6kE8yFms5BcvOLWZGK6e72Z8uSsUYstI1W4cjwRUJGGeOF5tYYrTTgQH9bemTxXkvTyYje//lGSWTFRV0KT5/ueKg25lkDCnx1d3fABq7tFVxXWCbMXQx0cu+FEH3IESjUcYoVrD1Npd8EPMaYR2QiL+KaI7Hen961fh6yi8bixx5efcadjIaNFhHciS4R5g+gr14+OzsBB153dhX5etCAhpQcRSY9erTZaxBFu2QKdln8Q5ZE6ymHcRVxeOR+LCzhXq/nRlyVSkWlewbbGiQZg3ZoG3tovNo62MZJi+MMBjGHuUeVdHVL76Sz/ViL/VNeFVkyrtf3qPnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5088.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 05:46:00 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:46:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Topic: [PATCH v3 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Index: AQHcUwyfoc3mrEx/zk2gWdT0uQcxdrTuiPbQ
Date: Wed, 12 Nov 2025 05:45:59 +0000
Message-ID: <DM3PPF208195D8DEC5D31A263A57599F7AAE3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-4-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-4-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 33294a51-6550-424d-32d1-08de21aec248
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZW56dHlLWmlzd2JwaGYrVXNwYm1zSGJsNnpaeHZ5MXNUSlROaHhJZTVRVXI5?=
 =?utf-8?B?ZHdYTEpRTkFCVytWcngyWVNJZzh6cVg3Z3FhL25hRVpiSllFWDdqMVN0a3I4?=
 =?utf-8?B?Q00wZlY3NnlmWkZ3bmoxeUgrVUtKcjd3dFhBY2tRRVVCcUFFbkdXL2hxditj?=
 =?utf-8?B?Yk9vNGFaZ1d4cTdCWE5SeGZpTTZhTi9JbVBLd1F1MmVTZDZYV3JJZUVxZ3Ax?=
 =?utf-8?B?ZHN6QkJ2M2xpaExYRUlSd2F0bkNoeWk0NUJ5UHVOK2NUWHZlSE9xKy9SZnpa?=
 =?utf-8?B?bm5wZlN5WlhKb3A0dWZhUkpXTGpUM0thTmdRd0ZzOFVxK3RKSVpSMDNwcXAw?=
 =?utf-8?B?eE9od1dZYytxamJ6ay9FTUVFREFxT3crZlhObXlHSlE5cWtCWmlIVEZFZEFv?=
 =?utf-8?B?bjkwcUNTNEhnR0prd3RMaUJQdG81MFRvejVPcCtBUlJ4cS9JRlRUQmN3RjlX?=
 =?utf-8?B?dDhsNFptMlpITTYrUVo5YVBMYTVNRWxhbU44OE1DS0ozYWI2RFpCaUw5Njhz?=
 =?utf-8?B?RjJSRVQzbk9XNUk0VHJwVmU5RVJlQ1ZkcTRma0lScTQvMmlOc3Q2aFJySVBv?=
 =?utf-8?B?aUFSUUtzb25FVUt5Y1J5dktvWnFEMXZ4VEl3aE1NajN2QmN3KzJZWDJJR0xq?=
 =?utf-8?B?VjMzTVpRampGaEh0ODRQVlVlRGxWbzd4VmpUS0xPUlcveEdRZjk2MFVwMlRm?=
 =?utf-8?B?RFRKZ09EWUphNHJ6WDVhazdyWTl1czBoVFBkZktBRVBsdTM4eGM0Vm9TckNG?=
 =?utf-8?B?c2w5cUxHb3NlSmw1Qlc3VW5SYlovbjlVejZHUVIrOHorZCtVcytJdElVbUZw?=
 =?utf-8?B?bUlWWGRuSkExWTUwOUljUURWUFczdmVMTzRkclhZY0YyaXZsb2tnN0Uza3Fx?=
 =?utf-8?B?VUZPbGFhTmtNVkFhMld1KzFheUFMeW5ocjFCNFJSOGNQcHdKbE1WWUxlUmlI?=
 =?utf-8?B?dml2NTFCQUxDb0NZUDJlOVE2SGVNUjZQWUQ0K3FtL252K3Uza210bVVtUHVH?=
 =?utf-8?B?eGV1OEpMemJjSHZuaWk2RDRlbHIvWmViQnM1dGlPMVg0L3BkL3NYZlNHYWVH?=
 =?utf-8?B?TDBwUFAranFuNGNvamF5cHFPOUxpT1FFWlpydXp4aU5yVENtM1pzMk8wM0ZZ?=
 =?utf-8?B?c3NYeHVKYTV2UWNqVGdTWm9GTnF3SUdVTkd4V0lMQi9rRG1qSnpsVmlHT0Rq?=
 =?utf-8?B?aG9kV2c2QUZRUlFJbGY3a2h6SmFiR0tWdnlsVkEydmMwNmVieS94eUVYeFJC?=
 =?utf-8?B?a1Vyait4bjJKb2cwZkg3Z0c3MDRPSXFXMkMzMmliWkhNODBkbDNpbDFzYVVH?=
 =?utf-8?B?YTJYeEVKL0xZdzBkb2k5T3BaY25PdjliVFo2Z0JvS1RkclMyNUxZVUR4NkZ2?=
 =?utf-8?B?OXpBLzlDT0pJdUFGWUtmUUgyVSszK2ZBU1N3Tmthc2gzWEt1UXRGUW9Hczdr?=
 =?utf-8?B?eVRsT0EzTnBOdTVrNU1jelZtV0tGdXJKelp6WEFzcE04cEVNNmtDdWNNdW9H?=
 =?utf-8?B?MHNYZU14dEN1MlpVWnFkL1RkQTMvNGVDbWlwYnN6NU1QZGlTUWVBUEowYWpr?=
 =?utf-8?B?aDRBUkJENUVwbzduSWZVUDlKRDNQQUdhU1ZYWWVRZE5laEhQQ1E3WlNCSlNZ?=
 =?utf-8?B?UnVIYWVYaGFRSkFsZkp5MmN2Nk5VUTNsWURuRTFIMTZtL2JDclhIZmxQd1NN?=
 =?utf-8?B?VFROSmJCRWVsaU16czl1b0NYOU5tTE5seGRpMlVzampiSFhpLzduL1FoOXN0?=
 =?utf-8?B?bkZNb2hMa3VWUmVPZFJaSFFFRmNUdXM4OXcvamhjMTFyZWY1eVJacFZzcktk?=
 =?utf-8?B?aDc4TXg1M0pQY0xTa1lRdkVsV3lNTzZWMUtkNEhZTXdCK21UVDNCcTUwUktY?=
 =?utf-8?B?OTVqVTFUM0pxU1kwMXdCdlBXaDNyZGdrVXpiQzB1N2RCNjJ0YnlZTlY4bXJz?=
 =?utf-8?B?RUp1T3E1Y0JlV0N0VHhIMDdEZFMxWDZnMndiSXQ3VXI4WFZOeVhGdDV1TWdv?=
 =?utf-8?B?US9lSytWN2J1c29WdkV5TWc0U0VaNW1uWDRqUWZJMVU4NjhuNUMydFc3Ny82?=
 =?utf-8?Q?XjfeFo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGVjc3gwNFdneVdHYldOUDNRM04zbWV0dzl0ejJYbmV1Y1ZpY2RrUmswZk5S?=
 =?utf-8?B?MlZyc3JBSVRucmJGRkxCMFA4QmJ6aVllMm56U0ZtVE5USFdFVXlTM25NKy82?=
 =?utf-8?B?UUlKYUxLajJzUElpa3NOWjc0TEVrSWJhV0VzZ012cExoeEYrcEFMRXN4SXZo?=
 =?utf-8?B?VFp3NERDTVVlU3ViQXhRNWVwdHdwYXdCaTljNG1DanA1YktZQ0thc3ZWUk9q?=
 =?utf-8?B?ZHc1K3lXL1lPU2kybXhDaGt2d3NzWVVHcG1vem1zK0hRMzJTOWRiaG85NSs0?=
 =?utf-8?B?N09ucXQzTGRiR0dtaFZvUVJlUElYRVN2U2YyWll3UjhiVFlsQ3NLZkVLMVE4?=
 =?utf-8?B?dEo2Yk9PRUNyNkk4RTM3SEVwWVZqcmJPdXJSL2l3T3NVeHQxOUpVOHVMUzZ4?=
 =?utf-8?B?S0VHNE15LzBxVkhkaVlmcG1tMXhobmtpNHdMZUxITmx0REpId3gwbFYwOFl3?=
 =?utf-8?B?cUluWkJzbHZyMXBMMHRLSHh5dk95bTRvTVRPcWV0WTFRWlliaDZjc1U1dmVw?=
 =?utf-8?B?eE51cnZkQldaRS80MVg3NTZHMFNrSFdRNExPaE1rek1leUliSkxZeURjdU04?=
 =?utf-8?B?Qjd5NDVSL2tFaTR5cTNkamZ5MHBQZmRGNkVRcXJxVU1BeUdOazU0RnRCeU5K?=
 =?utf-8?B?enludU52ajZzS0lRYmRYYlNxbUk5ZXF3a25qSEl6RFZzYVl3VGVHSHlpWlR1?=
 =?utf-8?B?MHhZZ2FjZE1HOExGUjNOVEhFR1ppcm9IRENJTEZ0cEc1dGhpTjVzamRxT0FI?=
 =?utf-8?B?czlPRGVDaEVTU2RKZ3lXMGUrMEZnYjRmL0Zlb1hFYkVDT3NrcVQvbE40cmtq?=
 =?utf-8?B?RjB1M1ZVbHBOSVNSSEZhMFdxTHNhT0hySXBXRkswS1laWW1Mc0k1WVgyd1Ay?=
 =?utf-8?B?WURRS2NzUktYZ1RoaFQ3alI2R3hyNlg1amJRRXFYK1NLdGtsZHhYejhUV0U0?=
 =?utf-8?B?VkUwS2hTRGU0M3RFbnE3ak5rckpYTGdtUUdjelQzOS9POVdpYUMrMlJjOFpx?=
 =?utf-8?B?azZFMUhuMVRzWFN4OTc2eUNGSkFKd2wzcGJoMWFCSlByYk9QOUgxSUF5bWp0?=
 =?utf-8?B?bXo5YmVQS3R5MjdjMzBHZFc2K01IVnNlc0p4T0dZUjNzNG9vc3F3Q1pBcW5K?=
 =?utf-8?B?TmdqSGRRVTRmVC92ZUFkbTJqVnc0YUF5clJEWnQvT0lwSHpvSytHdUgzaTN1?=
 =?utf-8?B?NUwrRGlrWXJtUXdpd01WOFRWWGtMcjFMd0FRMkpWRHgxWDh1V2cvc2ZnMXBI?=
 =?utf-8?B?UlZodWR0UEd2cFRZUXdTeWo5VTVjMjRydkVPZkpWSFJoaUNMRmJHTWc5T1o3?=
 =?utf-8?B?Wk1ZUU9OTENRWWNpVm9SQ3VQYXI0NHBhSlNiblNXVVZEbXByTWVzN2ZWUEgy?=
 =?utf-8?B?MGtyVkRQUDN6S0EvZWJFRFlSYUduWWJWZnl1am9zdG5LTHIzTFh1SHpIWW5T?=
 =?utf-8?B?U1hlWWcwaFNheFJpYkFyREY4SzRQWS9aQjZ3cS90SjhKK1BOWHIwaWVKcTFX?=
 =?utf-8?B?NHlkalZOV0RTZlpoRTEzSFZ5b2thMGZ1RlU2Yng0UlBLMFBUYXk5aUhnRGdN?=
 =?utf-8?B?VXJpODBBaUJ2ak9temd0NFZ2WEt6Y1RzZkpBdDhkNG9WNGQ3TURtMDhxaSs0?=
 =?utf-8?B?ckZwZUxqTFRjamZZelREVURUWVMwUTg0UnpwZlhaMXV2TnBMUWdjZHlNeXFt?=
 =?utf-8?B?Z3VRS1plbEU0OGs1Uml0b05mOGRucUN5eTFlWE5ob2x6emxtWmhRVFZTRElO?=
 =?utf-8?B?MWlHSm84S01wdm9RcGxvNlh2SHZQcFZiWlR6ZDhMK25NczdieTBrUEpoczl0?=
 =?utf-8?B?SWpXdkRQYmZnSnZZWklwcUFNUmkxeWpkS2x0YUdNVHRlb0lnMUFCV0YzRzdV?=
 =?utf-8?B?THBGdGtIZWtKWFlmWmNDcjhnY2d6azFUZUp2NzNCTVhOem1mc1pvRFRiTnow?=
 =?utf-8?B?RXM2U3krbWQ2VzZVbk9OaHJSTnloM1Nva043SU1pNzNuemNxVkxaNlpRdVVZ?=
 =?utf-8?B?NUw4aENEUnh6dGJFRkJaaU1zajZGN2IyOVNDSmFIS1RsRC8wbDNxVUw2bWpK?=
 =?utf-8?B?NTRmREhOUmdBdEdhRjBGakFmNnFHQXl0MjdnbWxLVk1LQlA4aFBFeDB4M1d2?=
 =?utf-8?Q?UUC3pvfENBOGw3ncco7L71ZqB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33294a51-6550-424d-32d1-08de21aec248
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:46:00.0361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwRtDdwjjpe8j04Otjq8YJ7gEBMi5owYurxyd0tTIAXqAIjRALtywLYND5Q4b6BeIaMhfr8fpDgQ7PhtZql6Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDMvMTBdIGRybS9pOTE1L2FscG06IEVuYWJsZSBkZWJ1Z2Zz
IGZvciBEUDIuMQ0KPiANCj4gRW5hYmxlIEFsUE0gZGVidWcgaW5mbyB0aHJvdWdoIGxvYmYgZGVi
dWcgaW5mby4NCg0KKiBBTFBNDQoNCldpdGggdGhhdCBmaXhlZA0KUmV2aWV3ZWQtYnk6IFN1cmFq
IEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IA0KPiB2MjogY29zbWV0aWMg
Y2hhbmdlLiBbU3VyYWpdDQo+IHYzOiBVc2UgY29tbW9uIGFwaSBpbnN0ZWFkIG9mIERJU1BMQVlf
VkVSIGNoZWNrIGluIG11bHRpcGxlIHBsYWNlcy4gW0phbmldDQo+IA0KPiBDYzogSm91bmkgSMO2
Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1l
c2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgNCArLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCAxNGFjZDY3MTdlNTkuLjNlMjcx
ZGU1NTA0YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMNCj4gQEAgLTU1MSwxMSArNTUxLDkgQEANCj4gREVGSU5FX1NJTVBMRV9BVFRSSUJVVEUoaTkx
NV9lZHBfbG9iZl9kZWJ1Z19mb3BzLA0KPiANCj4gIHZvaWQgaW50ZWxfYWxwbV9sb2JmX2RlYnVn
ZnNfYWRkKHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvcikgIHsNCj4gLQlzdHJ1Y3Qg
aW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY29ubmVjdG9yKTsNCj4g
IAlzdHJ1Y3QgZGVudHJ5ICpyb290ID0gY29ubmVjdG9yLT5iYXNlLmRlYnVnZnNfZW50cnk7DQo+
IA0KPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDIwIHx8DQo+IC0JICAgIGNvbm5lY3Rv
ci0+YmFzZS5jb25uZWN0b3JfdHlwZSAhPQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiAr
CWlmICghaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkKGNvbm5lY3RvcikpDQo+ICAJCXJldHVy
bjsNCj4gDQo+ICAJZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9lZHBfbG9iZl9kZWJ1ZyIsIDA2
NDQsIHJvb3QsDQo+IC0tDQo+IDIuMjkuMA0KDQo=
