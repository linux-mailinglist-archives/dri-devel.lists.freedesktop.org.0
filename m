Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFB39BBD42
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 19:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0410E3EE;
	Mon,  4 Nov 2024 18:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eqg7LfCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17E010E3EE;
 Mon,  4 Nov 2024 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730744817; x=1762280817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cf0ITiwdb2n02ZwoxkES4enc7j63KZWKytFv6kS1nZU=;
 b=Eqg7LfCTIrED6pRi1OPtGlp8FvTS66DaBk8nGVcJhNOabVuciZoumnr7
 mXu1jwPgJrm5BGxKuMzsImzDpz3JPDta6M3jZiZAbXq4Pnot4oZK99Orz
 NplYFAbbCgx+mJbOzOZoylmVPa0x8zI27s+A6+5ceI26EcjLeLtZQmFcD
 7JddMPtSzprD7rKVT6MpJOsRf63jGwrIz7BHqT1aIkGM1KYzCkgzRWDYp
 TAhD2lcqgCDALvwC3NNG9h1e9DgnAcBrAjc/YOf6bZ5lpU1gGeRb0q2Mn
 i73owMkh2ZvsSzNkJjQgQ6u47BOt2nhSgt25cY6vAk/Xq+rJSqdpfLh++ Q==;
X-CSE-ConnectionGUID: eD6GL9LmTjmGh+P1F6ab3Q==
X-CSE-MsgGUID: +dLxMR6GTn6PZun4orBX8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="47965654"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="47965654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:26:56 -0800
X-CSE-ConnectionGUID: 9dNwzBpkTZ+QNKS+xKm9RQ==
X-CSE-MsgGUID: TOg+Zi5mQISPEHES/tQhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83622329"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 10:26:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 10:26:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 10:26:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 10:26:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdK4YlLM7Rl3V5gl8OqzzwQKY2ffY2W+3lJ21lkUFH5a0dvozPHu+TeHI6g/dQ4s0cgzVu73iJCZgmL/jZ4Z94aqVqZQ7YmPo9NlqfoujIpZb9M91uzI2J5wnepg5tw6XXBHPAQBg0/rvzMW8jl+QKI574CIV8gQVhYtjgj06Y46d7JKiCIepuD4a/dj3MzgarUgkqMxEwRG7cvQDU6+o0Nh49qUXeKpi5By456oCpkCH63VGT292xoB5/uzHo3ECGF6D8OL0wqjLK9Q11TICVCncFQXVZLfla9RecETM+9JlwB01qnu2sI9gCq1sJ/Frv+O9mkq0eFkSiSjshMTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf0ITiwdb2n02ZwoxkES4enc7j63KZWKytFv6kS1nZU=;
 b=E9FaKMoI04vsNCkyk3DXSjf0ubROEkbpVczh1x5w2LO1pc9z82Co1TlB5GRJ0pFhlBTKPhflTwo6Bwm6vJT3wp7rEYy1Vgnsw0dGVZU6iVU3tjAh/6l2Gj+2gAJlFj3HKbzZmfDthhkfIezxL61ibQXE9qqqwMGK/k4kDEHfOba1xfu0msfZ52WI3SLZzGghcaPO4ev93N3kzqOTRwfixZ1Uhjow5fv0udyPvA5rOLiVRwoEoxmZR1bTaHD34EfBPQ4EPbx2WnDJtYud+1zXndxCSl/YgNau/RzN+MJPgacCv6Ls4anDn0G9NoCBAujjFVfRDZplcrefArvrsF1g+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6611.namprd11.prod.outlook.com (2603:10b6:510:1ce::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Mon, 4 Nov 2024 18:26:47 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 18:26:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v1] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
Thread-Topic: [PATCH v1] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
Thread-Index: AQHbKxyKbrqQPpgMUE+1Z457MohcMLKnd/uA
Date: Mon, 4 Nov 2024 18:26:47 +0000
Message-ID: <1057f05882eecaa736ecab1b693b34f77bc946f9.camel@intel.com>
References: <20241030223846.2272374-1-zhanjun.dong@intel.com>
In-Reply-To: <20241030223846.2272374-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6611:EE_
x-ms-office365-filtering-correlation-id: 62c8e296-e22c-4428-0912-08dcfcfe3e38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RnRwalBiVWtRd1RWY3BRRCtoZmZtamp1RUxkZVpQY1oySERua3ZiT3I3d1Jv?=
 =?utf-8?B?UldGUUhGUElRbXFHZmNvbmk2RkNzQXFTTzFjampDeWRHSzRpWDdaaUZPamtV?=
 =?utf-8?B?TWJxNGNQdW5oUTBpMXE0Y0RIdzlEOHJITkYwZE5TTTZTRmVVS3NHbWU0TW9T?=
 =?utf-8?B?Z0w5ZFZFVUdmdTJ5cVFpbWsyRHljWlM5eVh5MXVQTWVSZjBkd091WC9nS0VQ?=
 =?utf-8?B?WlQxM3BNeHFsbTRXcHRkZ0xXSm1nSU1MTmo0NHA5cVRrU3RybExMZkR2Z2JV?=
 =?utf-8?B?TW5mZWhVWnJmeUMvQnRqY0poMEFBQVpqZFQzVWRHb3d2c0xoTk9DTUx4RU5z?=
 =?utf-8?B?RmgyRGJ2cTRJS2Q4SXhTNnF0enRoYWZLQ0x5T0cwS2w4NlgyT2F4QlBnTlZw?=
 =?utf-8?B?NTYzMmgxMSsxU1BaaVlZNHduZmszRmhVRXJJSkx4akNrdW80UlB3NmxNVmZn?=
 =?utf-8?B?bkt4MmVnWFQ3akFlVDNvOXJPRC9HR1J3dy8rUG5wU3ZuZStoQ09uU3V2MmQ0?=
 =?utf-8?B?Ny83VlNNbFZqdk9qNnlyd0hBMzg4K3F5WGQ2N2lUMVQzL1puRGI3SGE4eFNU?=
 =?utf-8?B?dW5aazl2MFJFblhzYklLRFNiOHJWQTVKNEVYam8yZk8wUGFmeDlZT2prV2Nn?=
 =?utf-8?B?RWhqWHhqd1FWSytTM2cwYzhwV3d3YUlQZjE4ZTV6VkY2ZkNYYzBNVUg0YWpP?=
 =?utf-8?B?aS9WanJRSUhrT29BMStCd3liUTNacjk5YThPazZyN0VGRXAwYVFHT2w4SFdW?=
 =?utf-8?B?SnduY0hBeGNDVFZyTFlnV0FiL3pSY0ZETkphWS9BcHVPQmhZTnp0cXUwc2xl?=
 =?utf-8?B?S0dqRGZxVWJVQ2szd202YjIwTVh1ckdsMFEwMTBYR3VxMmNic2VQejBwMmJN?=
 =?utf-8?B?WVhSbXFpUlJFWkRtRG85bjBsRVprQXJXMlF0d05lNHQyaDgvdlZSTXBCcjdC?=
 =?utf-8?B?TzRsTlk5VjFoRHNMRVlDMk01b0M3bDdWWnR2U2M5bW5DanErSUFaSnMzL2Y2?=
 =?utf-8?B?T2dnY0pZby84UWQzS2RUU25MZFo4MUk3TUFjZE1HM1p5cHl4VnVmZmNXMU1Z?=
 =?utf-8?B?S1RYZXJuR2dreHBUcmc0WCt1SW9tRUlGNzg5YXl3c1pSUTcyMFNCdEJ4T2FI?=
 =?utf-8?B?NkhoNFVpVDJVRlR1ZlF0dXIrRVlRNS9wZ2duOFRuSHcrRHc1OXJlM3JqZ28z?=
 =?utf-8?B?NVREUnVtR3VNZUgveE9xYlVNNWlnWHJDcEV4ZnZTb3FVK3k3dVpGUkZjelpM?=
 =?utf-8?B?S2xJdW4za0VsN2U0UXpMVmhVWVdCbGtiWjdxZEVLd0diK2tPWVBEd3M3Zjk3?=
 =?utf-8?B?emQwNTVya044MlQ1eWxQSHo4cklhNjU4UHo5ZHZYZlRqZTVzRGhpTFdQajJB?=
 =?utf-8?B?cmRvMWdWVjM4T3lUNHZQYzZsbUpVSmx2QysvZkovZjNMbjRFN0tza1RlWVpS?=
 =?utf-8?B?ZnNDblRaaEJMay9rSWU2SjkwbC9yOUlOSGw5SkQwMHFjZ1JMWmlNVm40a1hM?=
 =?utf-8?B?Y3NJbWMySWhNWEFJb1IzWGo3dk9LeVBjSzI5bWxGKzEyQklXL1FqakpsbVRr?=
 =?utf-8?B?aGtTVEdvd3Q2OU5VSndKeXhVTHdYSk10ZkRCeUdOenpDRzJzUWFLZGczbW9v?=
 =?utf-8?B?T3Y4Z1loQTBXVENvNVVvRUFyVmQrOGNiSUxOa2x4aDF5aVdXM3huYnM3SUwx?=
 =?utf-8?B?UnhWbURJTGI3YnhVY21JMVRuOFh3WFMzWmtQNWRpbDNEK3VyblZzL3d3bVdJ?=
 =?utf-8?B?MHIzVEZoNHBYTllMZkdYdTRnNUJjQVVHeXVVeENxd2pza2hDU25VK1o5M2JY?=
 =?utf-8?Q?83XsXf8uW6Ca7Wv8IUGileMZkzDlupwAXnIBo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U283czI4VHJXblhSdUVtRk9kMW5oTzBhVnRNbjBTVkE0WjdKUUZmdysrb3FI?=
 =?utf-8?B?OFRZcXVkY2pVT2lUeFI0eU5rZ1VVSXFVbC91V3pPamtieUNnSjRxQStNTjNW?=
 =?utf-8?B?OEY2NXNaTW11bjluLzd1bTZqWHc0dHF6YkttV0EvQkpNekxab2U4T3pEMDVi?=
 =?utf-8?B?WTRINDNNMVEwblNmR2kxaVRVWGp1ZWNNWjc3L2VvMk1TVlhXTndxa0hCenQ5?=
 =?utf-8?B?RDNQT3l6VTZOS2NaVUhFbFBpQXZROUFGSzFXS2Urdy9WRVZVZ01DYWZOVmFM?=
 =?utf-8?B?d2tzcHVWSC9uOU9MdHJqSC9QZzdhUVZtZnI2NDJodXF6dGZTSVIrMXZWb0Zr?=
 =?utf-8?B?T0FkeWY5K2R0L0JyQm9rdlAzQTNUK05vQXBQMUtNRzNMUTVGL09YeEN6Q20w?=
 =?utf-8?B?akNUUEpQZDlaTU5nK0JmUnp3RFViTHZ1TlJySUhWOGo5ZVJNRXNCa2pRRkFp?=
 =?utf-8?B?eE1wbXNFdjlOd1dQd1dsS0ZabEZBeWo0c01XTFRONnE2Tjh3d2VHeFFnbDJY?=
 =?utf-8?B?N3ZOKyt6YVlsdEJQZ1JCVFkrQ0d0T0NEamtsMmdZU3dWdlBhSlVJMk4rRXdY?=
 =?utf-8?B?TjNTNWsvRGYxcjBhY3NPQUpaNlVtaWQwZUdvRTVGbjMwTWp5N3JIOGdZbFcx?=
 =?utf-8?B?UldscUdENW9UWWNYWFBKTEZDNG1wR1AweTBORW1ycXY2ZytsK0dkcXluRWdi?=
 =?utf-8?B?TzE4Z2NJY2FDYTh1WWdDazF5WUFia2UyNDJYL0ZEVUJoSXJGQ1FNMUZ4bGZt?=
 =?utf-8?B?N0M4ZFd2ajB6QkN2Rld6SEI3TngvSnBZbDVLNGRicjUwSVlQR3ZkTStoUEhq?=
 =?utf-8?B?VEdDd1A0MnhVbVBLQ01ZbHZVbzZjVTE3SWdzNzE3cFRTRDFLY3MrZzg4SWJE?=
 =?utf-8?B?NWtaZkZJUEdvekMwT1JWcFZwWXNsNHNtTDZVdnRhV3J0NEIwNHR5cWlDZFFN?=
 =?utf-8?B?SERBd1lMMTlWaFJYRzRkRmpFRWxERDc0dXRPVytFWEo5SGNQT2lpK290VHpr?=
 =?utf-8?B?Mmd3MWVNdW5iTkx0MDkrTE5xR3VnTEUzaEM1eXROK1BldDRNOG9XelZQUUZy?=
 =?utf-8?B?R0dNVzVnd1FkTk1od2c4M0tVQi9SVkNnR3B0eW16SFhVOEl6bGdETGl0RkI2?=
 =?utf-8?B?K0ZKb1lzejFiY1J4TWZzUUZZc2s4VWRnamx2Z3RpZHMwK0xSR1p5S0lETWVH?=
 =?utf-8?B?NCtzbkk0ak1OZjYvcFpRTmwvZ3lHVWJYeW1JSlRaNm9IUmRYWVc1S2UrdE1M?=
 =?utf-8?B?MG9LVVJsNUJLMk42STVpa2UxdzBBVFAyNnVsdnJEQ1IrSUFNRXl4bWtEK29F?=
 =?utf-8?B?L0IzUGFiN1dqVTV5WmZlMlJoeFIyT05JNlVjN0p3ajFxbk03ajRaOE93R1pW?=
 =?utf-8?B?dEhDaUJtYStDV1JVQWlWT2R2WlVLbGxsUEU4QVlFQjl4SW1UbXhuT05sOEov?=
 =?utf-8?B?UURkTTF3ZE0vaDFkVzBmdmVrNUhPSkhPMVNMMU5sYUV4YncvWWc1Y3l5QWdw?=
 =?utf-8?B?anZzNEdMSUpQTnM3Si9Ic0J3NEg3MGZFVHIwV05sVHc2Nlc3Q0lFdzhmUzVw?=
 =?utf-8?B?bGx4SEhDdkdwSG01SUNxNWl4b2dUYnZBdm9kK3A4NXFrU0NwZ25ad0hVMGtC?=
 =?utf-8?B?VEJUN0xvOWkzdHhNTkcrdGpQaTdWbFBhZjJqc3plc05TRHJ6WHFVWGNHdHIr?=
 =?utf-8?B?c3dZazZ6dE9xMHlKTVV1TEhwNUlNUFQ3K3ZBamNyQ0lHaWFNbXlxT3BiQXZ1?=
 =?utf-8?B?MHpZbEJINDFEa2l2TmRYck5CK3l6a01JZjk1ZDRFSUgvS3RwU3c1cmdZdFI4?=
 =?utf-8?B?RTZpYUpjdmNIbFo5MEdsK1Y0TDdtYTVnY2ZHRHROaG5PSEIrZjBuRFd5RThu?=
 =?utf-8?B?NENnaTlOblBmU2x3c1pBOXlNNUQyS2JlbEV3WXpyejVwdC9iRDFEK2ozWTRm?=
 =?utf-8?B?OWRaYUZEcC80MzZEWmhIMXIxSTh6eDVHU2FyQ0VHM0pKbko1Q3k0dkVIZm1p?=
 =?utf-8?B?QkVVdjNRNEh0Ulpid3dwN0tlc1U4ZjhXZTl5STJGbFlwNDNRYXhGR3FGV2po?=
 =?utf-8?B?TjM2OVh4ZkR5ZjBGNlRXek5RYzVRZ25HM21ZaG5BbFYvZmJKN2svNU13ZlA3?=
 =?utf-8?B?SHFhWHBvMk1seVlKR2Y0b2pSa3hMbkR5cm5IYlE5ZzRHeEUvd0Q2Rmg5TDRI?=
 =?utf-8?Q?smkgFH0pzZLPzC6907wrur8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EE783ED2DB16A4E84BB550FD904341F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c8e296-e22c-4428-0912-08dcfcfe3e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 18:26:47.5496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUBK6Qw69IPC3Dj9w7wrDHJEPI/ri+QDvmIQ9eVaqoI7qlUkhmlUs7qtC8fdkqTokdXsS68tnSZDP7bnh9c8OUeYeNS6vOCHG6gtEXVjyyQGmxvdGXHnHviq3BJJooex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6611
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

SnVzdCBzb21lIG1pbm9yIG5pdHMgb24gaGVhZGVyLiBPdGhlcndpc2UsIExHVE06DQoNClJldmll
d2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4N
Cg0KT24gV2VkLCAyMDI0LTEwLTMwIGF0IDE1OjM4IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6
DQo+IEd1QyB0byBob3N0IGNvbW11bmljYXRpb24gaXMgaW50ZXJydXB0IGRyaXZlbiwgdGhlIGhh
bmRsaW5nIGhhcyAzDQo+IHBhcnRzOiBpbnRlcnJ1cHQgY29udGV4dCwgdGFza2xldCBhbmQgcmVx
dWVzdCBxdWV1ZSB3b3JrZXIuDQo+IER1cmluZyBHdUMgcmVzZXQgcHJlcGFyZSwgaW50ZXJydXB0
IGlzIGRpc2FibGVkIGJlZm9yZSBkZXN0cm95DQo+IGNvbnRleHRzIHN0ZXBzIHN0YXJ0LiBUaGUg
SVJRIGFuZCB3b3JrZXIgZmx1c2hlZCB0byBmaW5pc2gNCmFsYW46ICJhbmQgd29ya2VyIGFyZSBm
bHVzaGVkIHRvIGZpbmlzaCINCj4gaW4gcHJvZ3Jlc3MgbWVzc2FnZSBoYW5kbGluZyBpZiB0aGVy
ZSBhcmUuIFRoZSB0YXNrbGV0IGZsdXNoIGlzDQphbGFuOiAiYW55IG91dHN0YW5kaW5nIGluLXBy
b2dyZXNzIG1lc3NhZ2UgaGFuZGxpbmcuIEJ1dCwgdGhlIHRhc2tsZXQNCmZsdXNoLi4uIg0KPiBt
aXNzaW5nLCBpdCBtaWdodCBjYXVzZXMgMiByYWNlIGNvbmRpdGlvbnM6DQo+IDEuIFRhc2tsZXQg
cnVucyBhZnRlciBJUlEgZmx1c2hlZCwgYWRkIHJlcXVlc3QgdG8gcXVldWUgYWZ0ZXIgd29ya2Vy
DQo+IGZsdXNoIHN0YXJ0ZWQsIGNhdXNlcyB1bmV4cGVjdGVkIEcySCBtZXNzYWdlIHJlcXVlc3Qg
cHJvY2Vzc2luZywNCj4gbWVhbndoaWxlLCByZXNldCBwcmVwYXJlIGNvZGUgYWxyZWFkeSBnZXQg
dGhlIGNvbnRleHQgZGVzdHJveWVkLg0KPiBUaGlzIHdpbGwgY2F1c2VzIGVycm9yIHJlcG9ydGVk
IGFib3V0IGJhZCBjb250ZXh0IHN0YXRlLg0KPiAyLiBUYXNrbGV0IHJ1bnMgYWZ0ZXIgaW50ZWxf
Z3VjX3N1Ym1pc3Npb25fcmVzZXRfcHJlcGFyZSwNCj4gY3RfdHJ5X3JlY2VpdmVfbWVzc2FnZSBz
dGFydCB0byBydW4sIHdoaWxlIGludGVsX3VjX3Jlc2V0X3ByZXBhcmUNCj4gYWxyZWFkeSBmaW5p
c2hlZCBndWMgc2FuaXRpemUgYW5kIHNldCBjdC0+ZW5hYmxlIHRvIGZhbHNlLiBUaGlzIHdpbGwN
Cj4gY2F1c2VzIHdhcm5pbmcgb24gaW5jb3JyZWN0IGN0LT5lbmFibGUgc3RhdGUuDQo+IA0KPiBB
ZGQgdGhlIG1pc3NpbmcgdGFza2xldCBmbHVzaCB0byBmbHVzaCBhbGwgMyBwYXJ0cy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4g
Q2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IENjOiBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfc3VibWlzc2lvbi5j
IHwgNCArKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19zdWJtaXNzaW9u
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfc3VibWlzc2lvbi5j
DQo+IGluZGV4IDllZGU2ZjI0MGQ3OS4uMzUzYTkxNjdjOWE0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfc3VibWlzc2lvbi5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gQEAgLTE2
ODgsNiArMTY4OCwxMCBAQCB2b2lkIGludGVsX2d1Y19zdWJtaXNzaW9uX3Jlc2V0X3ByZXBhcmUo
c3RydWN0DQo+IGludGVsX2d1YyAqZ3VjKQ0KDQphbGFuOiBpIHN0aWxsIGZlZWwgbGlrZSB3ZSBz
aG91bGQgYmUganVzdCBraWxsaW5nIG9mZiB0aGUgZ3VjIGF0IHRoaXMNCnBvaW50ICh2aWEgR1Rf
UkVTVFQpIGJlZm9yZSBhbnkgb2YgdGhlIGZvbGxvd2luZyByZXNldCBwcmVwIHNlcXVlbmNlcy4N
CkJ1dCBhcyBwZXIgb2ZmbGluZSBjb252ZXJzYXRpb24sIHdlIGFncmVlZCB0aGF0IG1pZ2h0IGJl
IHRvbyBpbnRydXNpdmUNCmEgY2hhbmdlIGZvciBpOTE1IHdoaWxlIG5ldyBkZXNpZ24gaWRlYXMg
YXJlIGJlaW5nIGNvbmNlbnRyYXRlZCBvbiBYZS4NCg0KDQo+IMKgwqDCoMKgwqDCoMKgwqBzcGlu
X2xvY2tfaXJxKGd1Y190b19ndChndWMpLT5pcnFfbG9jayk7DQo+IMKgwqDCoMKgwqDCoMKgwqBz
cGluX3VubG9ja19pcnEoZ3VjX3RvX2d0KGd1YyktPmlycV9sb2NrKTsNCj4gwqANCj4gK8KgwqDC
oMKgwqDCoMKgLyogRmx1c2ggdGFza2xldCAqLw0KPiArwqDCoMKgwqDCoMKgwqB0YXNrbGV0X2Rp
c2FibGUoJmd1Yy0+Y3QucmVjZWl2ZV90YXNrbGV0KTsNCj4gK8KgwqDCoMKgwqDCoMKgdGFza2xl
dF9lbmFibGUoJmd1Yy0+Y3QucmVjZWl2ZV90YXNrbGV0KTsNCj4gKw0KPiDCoMKgwqDCoMKgwqDC
oMKgZ3VjX2ZsdXNoX3N1Ym1pc3Npb25zKGd1Yyk7DQo+IMKgwqDCoMKgwqDCoMKgwqBndWNfZmx1
c2hfZGVzdHJveWVkX2NvbnRleHRzKGd1Yyk7DQo+IMKgwqDCoMKgwqDCoMKgwqBmbHVzaF93b3Jr
KCZndWMtPmN0LnJlcXVlc3RzLndvcmtlcik7DQoNCg==
