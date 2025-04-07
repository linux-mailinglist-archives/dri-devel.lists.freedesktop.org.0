Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10772A7DA36
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9010E3CE;
	Mon,  7 Apr 2025 09:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NP99+H4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36F510E32D;
 Mon,  7 Apr 2025 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019334; x=1775555334;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uA6VCl3DnorlvPXJsjR+JOde1FUNOo8OOSRT8WGF/7E=;
 b=NP99+H4xiTkb1hc0vfxd9xG3QuXNOpwGKDImNbS+ltU2QdlLdX4frMK3
 IIlqKjMEZ4q4H04mT8RAqcVn7nHcmSrObtgv1RzDGzu5gXTSU4QRl6KfZ
 ruCsZmXbSMwooZ6NfRqWGjJnAb6V8CAnRjojbDJLXmsJY/m4PhQZITRHF
 whieg6BmshbK9cqPLkl6Y/3375M0m6wNZxT0bqAMfEQRsfBQgQTxCXSQc
 0QnaZFt7uSHq4w3TaXByMhKxOK/w2bCPXyboeLoou81nyKMtewc9ubHGK
 YawAUVpj5xGJuLzA5+MW7G6heKAShSakVP0TzU9UA9Lu8wILaWb1q8cde A==;
X-CSE-ConnectionGUID: +AkpXcFgSieFnrY84sqXZg==
X-CSE-MsgGUID: HuUuaU1ORzeXPkoXqyovSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56059188"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56059188"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:48:53 -0700
X-CSE-ConnectionGUID: PGdPD04mQYe7WLyUpyNIzg==
X-CSE-MsgGUID: uDnF3sdjTemrHdcAVshVJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="132046085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2025 02:48:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 02:48:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 02:48:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 02:48:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsTTeH9kdf+4at8OkWUMKe3ZS5Q4GgzieAWtme29RUiBtxVXEDccbRQFI2S93XhnWs5ftDFDSIkhamN8w4GKBrNrAAnJp9UgJcsdGgZ/TaXVRA2jh4uMTZ63hkkfkjNHG7zUEWEYmv4CzTc51vGgx0pGjRbJcP8i4k0r9hXiFQeSwLZQtm5ZR4xdtNtlSy6sWebCHSz2Urv3U0zVAmy5FWDHx9sr+/njkGdt6m2Fwd5S8As35UqxyRjiZhvy8ossyZToEi5HN0hUnypLj8exyp7cPqF5WYkjwXseuqp50vUC4i8jOWIaMcPpA2/Tprl1xXj5Hcc2GsWw8zLVOpibww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA6VCl3DnorlvPXJsjR+JOde1FUNOo8OOSRT8WGF/7E=;
 b=EtbjdX2980bVK73eA5xZFyMBGsxDVDr0i0ez2m/AkV/40xVZz8W3/lb90JhXfWmNUJFuJPMhlPZhnZpUy8WBygh5R0q+BfH1xTuglHWFDRPS4ULopFbsw7CoxsRG67qClo680jyoVM36wo23gbcPKhCtzJ8rTcQQd3PRJf/IEegqiLVilGHUxdWo838kIMjfT6nTZZ5u90GHop8P/5OmFW+xN/Bgm7m2frX0SJBxX0cL7jR+IZatqN5lAZIZtOqcLqRcszCgRxQhCDioZ5NUJ3ThFRrAN5GZ9ZRpMMjPEuMO7jYvac5UCDmn9tsVJddh8rPKACIv96N/v7JIzqSKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 09:48:36 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 09:48:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
Thread-Topic: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
Thread-Index: AQHbn/wMMQcghdOFh0eLt6W4qQhOVLOSeeaAgAWKMSA=
Date: Mon, 7 Apr 2025 09:48:36 +0000
Message-ID: <IA0PR11MB7307BDABFF7240506458F172BAAA2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <CAFZQkGzKbpNHnhrC9NyeGG2_Ky_hn-KuDozYmxAHvT7ggZxLXQ@mail.gmail.com>
In-Reply-To: <CAFZQkGzKbpNHnhrC9NyeGG2_Ky_hn-KuDozYmxAHvT7ggZxLXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA4PR11MB8989:EE_
x-ms-office365-filtering-correlation-id: 08df873e-9bfb-4204-9727-08dd75b95e0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?amxPd3VRdCtJb09ZdHhYNHp0MjlXZ1djTldYdVJSdUR0M1FVTzFLRk4wamha?=
 =?utf-8?B?VUUxVzdpbTdobzI5NEFNa25NK3dBR1dIQzF1emhRalNURTlDa0cyV3d0QTdr?=
 =?utf-8?B?VHBYMG5nTzBEVURjZlNCenFFM3IwaUk5cUlONGdGVEhXbmlGRWdRUDlXSGh0?=
 =?utf-8?B?TFEvTFMxSXJ0QUtiK094MTJpV0VtM1lrSWZsUXY3dTBhTVRwM0QrT0VDMEIw?=
 =?utf-8?B?RzBaWThPakFYSHpoMGxLcEt0M1hVOWZ3L0YvYWhlVEZrK0lNd0VqTDlVQXdt?=
 =?utf-8?B?dm9tQURFOVN2dVpFRDhXK1ZxSjVKMTdPcWFPUHh3dEsrNEgrQ011N0I5cnUw?=
 =?utf-8?B?aUFDKzNHL3d5RWZIUEFQd2F0eHFBN3B3RkhaMjF6VEVtajVhWGt3QWJFVE8x?=
 =?utf-8?B?UTFmSnUrQzhGTjhHZFlDTldwVTJKWkZZKzJ4ZXVEN3gwdGtTZVdZc2dFZFUy?=
 =?utf-8?B?UFhkK3RwZTFaS01wcGd6aTFpQ0VIVkxoazZlVEJSODdTRzdlUkNXaXNMeC9r?=
 =?utf-8?B?LzFhNUtWcmx3eE5zM2FuRkhPMVhRUkZGd2dwWGx5Y2NabDlOY200L2NzRXBK?=
 =?utf-8?B?d1lDWGR5UFlaMWh1eEsycGhDa2JmQzNFa2NEUkUyLzhHSncrMHJHQ3ZFcDZS?=
 =?utf-8?B?QlU5K1l6SDNMNlR3d0hxUGw1WTJTS1lIMUJsKzJTbGFEaEg5blBPRHA5ZjZV?=
 =?utf-8?B?K0lWRlAyVFRFSDJBalNieXBSNkNnOWIrQlhqVGRhcEExRU9mc0RlODl4R3Ex?=
 =?utf-8?B?dVRRd09lZHhNTm1abDdNYXpWekxFOXlKT3lwQ24ydURtQmpWanhYMmVGZEQv?=
 =?utf-8?B?bzVCbXhlQ3N3ZXFRL2duMmxBWmNZaUkrbithKzJRQ1R5S3hYVlQzYmJaSGpa?=
 =?utf-8?B?dHRDWkplTTh4NUlYbVlibnNsQXdLT0RnOEZDalJtcUNSZ2k1Y01YOEZoSmJw?=
 =?utf-8?B?U3o0c01HRDZ5MFlLNC8vSlNWWlVTR212UURVa29yTmRZTWo2dmNTdXY5QjhU?=
 =?utf-8?B?c2cwVnUybUVVdGhlaENHMlFyRWVUNUZYR3Z0Mm9DSmpNYncrejRKTno0czFU?=
 =?utf-8?B?MjN0TEdyM2UxdDBvL0RDWnBGbFBWbkFTcFQxdG80a1VkTm50VWtmTHQ2Z1Ez?=
 =?utf-8?B?aWkwS3ZhNEZrWk11a2NBeUdyOVk2ZGxIWk14akhaZ0NqSUlWL3FLazZ2YWhS?=
 =?utf-8?B?ZjRFTFlOSDY4TGxaenp0azYrVnN6TmZlRGx2M0NkTHhaeGc5UTRuekdTdW9q?=
 =?utf-8?B?MVZZbFdEUU5RVENQeThvbE5SdlpxVFV5cEprMXdLR0tQNzFRSnVFVjlQTmpq?=
 =?utf-8?B?WENLNENVckRvZEFqUW83RTBEU2RaYnpJUEttcVIyaEJicVhiNkQzWExnK01L?=
 =?utf-8?B?Y0JxcHBPaFZxdDU4Tzk4YWlUVVBPUzZvbm1BUnI4VnovKzYwWXFyM09Nd2VU?=
 =?utf-8?B?bFlRK1daWVdVcXNhMU9XV1dub1pLUjNhUzBoK3VtZy9FSHFsNW84dk95cXNl?=
 =?utf-8?B?VVlDVithTXN2VlFSWmFDOGd6TDRzS1BJbExlQmgveWNGM2sxK2ljSG55TERJ?=
 =?utf-8?B?cS9ZR3JPTmNJVWtIblZhTnp6Y0M4WjRvODVORzlkTUtzVnZmS3VnRmN2d2xw?=
 =?utf-8?B?Ykl2bWNtajN2SzRhbW02b3hNaFBzRUxWVjZPSGtQazduK2lYMjZham12NkZi?=
 =?utf-8?B?ZW9oeTRXc2FJYnM2MnJWYnZyRXpTUzVXdTZLL3JGL1dxcldST0pEcVJCd1Ar?=
 =?utf-8?B?TUhEd2NON2tlTEhZNkNyVnRnNUpjK09iTHRCR3lQNEdXQnc4RUJkdmZuL3g0?=
 =?utf-8?B?OWJqYTZQUEwyQXl3cGErS0ZYc2ZsOWZZdTU5Q1p1Z1dKQXF3OHhvdVFKNVhB?=
 =?utf-8?B?REFLWVp6MG95SWZrbS9aeVh4RTNkNUZMYzhoYW5Gc3VmUWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWNBVGNaUVBVMmxpTUlEMDZqUzIwV0dwcnBrOVlUbEFTZjBjRkREYVZXNnFT?=
 =?utf-8?B?WWcyczVRaTdpNmJiejdYSm1Yb2xGYVlpUXV4WStyei92TjFYVytQaVlOaXBv?=
 =?utf-8?B?S1FCNDJYcGpJL0lLd3NESjBrRGlBQTNhS2lWL3BMQUJuc2ZjNnV2c2hROGw3?=
 =?utf-8?B?WGNJUWxvdys2TGFITFJXTldldFgxT1l4MVQ2VG82NkloNXl0VzFBdkkvL1BY?=
 =?utf-8?B?UXcwMGVtdnR5NTVFQWtwVVlOUU9aZS83Nm5DSm9GUFhCUEFWUEVkNXYrRVFM?=
 =?utf-8?B?TnVXODM0MTF6OE5icllYWmlzZ1A0bGorV1pBcllmWjN4dVdoSFJ1S1FkS24w?=
 =?utf-8?B?ODhXUVE3QlRnQm5PWmUzNkdDajhqam5BY3VWb1MxTDVEcmJiVmVUbDJlRDZ4?=
 =?utf-8?B?bjFnKzhYVDBpOW0yNWcwejJGNDhOeXNhT1ZKRnN1MDl5eVJHYmRpcDkyRThU?=
 =?utf-8?B?dGZrZURMUVQwdVdGWU5oTElTNW91OFlONFlvTnp6ZXlUK3ZiZjYrRjE4bk42?=
 =?utf-8?B?cEVBVUJtdkZEdE1YZU1nMlpCb2ZZU2hWS05VcURKUXRmUEdxN1M1ZkVMZHJr?=
 =?utf-8?B?S1B2ZUhYR0tzR0NydDE4MUdNTys2c0pqUEF5aUdGb25SSVlUd3BmTzZucG9H?=
 =?utf-8?B?bWJ0VEdmbitEVERMVXRYQ2ZFWWpoeUVNVTBiWDdmTUs3czU0Y0NiQmswTjE2?=
 =?utf-8?B?NDVMbmxvM051ZFVMUG91MURSUzlmWmNkckJFR2kwNFVXNFJCUEJCRHBpYmE4?=
 =?utf-8?B?dUNlcDR6S09reUVtN3l0Z0NGRGh0M0RCamFiY1FVMy84UkZaWXNrTTJqbDg0?=
 =?utf-8?B?VUsxdVYveVRZTU82U2Y4Ym1zY2ZielFuTzk1aGg3N3A0TFQ1aGRIUnNucGph?=
 =?utf-8?B?aEw3bDZ3NytqRFN2anNjWERGVlFMK1AwcjdyRlBYYm5TeU1XeTIybHZZMmZn?=
 =?utf-8?B?cHQzaXRtNjRzdlVSd0FGZGRUVDlrRnBWaVppbE1xWUVtbVM1NUp2ZXdUWHpu?=
 =?utf-8?B?OXYwYm5RdFUrMjFDdk9LeFFyRkdtL29RSm1ZZEc0NytYdHlKVGt3Y29VdzJC?=
 =?utf-8?B?SkZJM2FPdzJ1TzJuQkFsT0ZDWU1pSzFIQnFnV3l4aEFWa2hpMXIxbndaUHY3?=
 =?utf-8?B?N2FweDU2amVpZUptUEw4bE9ZbDAxeDZuNk1BYXlMbzJRczFDbDhBTkhac1Jh?=
 =?utf-8?B?YkkwTjE2ZnBHNzYzcFpLMWljT3FTcjZYTVorVDgvZWlBZkx2aXBsaWxKQnJu?=
 =?utf-8?B?SWpPby80TVdmenhwMGk3MmQzTitKOEsySnQ4VVJoWUppS1dJaVNUS1R1Q3Yw?=
 =?utf-8?B?R0pibEJQR2FkVkQ2TUd4YXcxa3JPMzF5ZFhIdjc0SklEUGQzSWVlbVpTeXlD?=
 =?utf-8?B?Y2p6UTlyTHRoY2EyVzQwc2NFVTV0SFVFL0VBS2d1b0dUZkRURjFyUDNLSzVH?=
 =?utf-8?B?MGxDSTBiRmNyUGdQaHNOYWJJRVRRRy9xRGowOXZmNjQvQVR5eTR4a3A3L2lJ?=
 =?utf-8?B?ZkE0bGVpckp0RmV4MlNidjh4em5KTWVjTTRpNlNDQXJpQ0s4ZWF5U0QvM3My?=
 =?utf-8?B?OFJnRFlKTUlwWHFxVUJYbEZnSjJGbkQxT2Q3MExPRHZURWVJUWFuWm0rYkF2?=
 =?utf-8?B?Mk40eUxDMng4M1hwQmpRSVhYVjhjeU9ad1o5UzAybWhwRWZsUnpzRHMrd1Mx?=
 =?utf-8?B?WHQ4d2tXV3FhNjR1NG5UdURBcGg3RVhnUE8rRlJjeW5rS0IzRmdiQ29MK2pS?=
 =?utf-8?B?MTZpWE1BVGNlRHJHL1lyWk1MckFlWUFCczY2aTJIUlNyTUJadUhTS0pQNllH?=
 =?utf-8?B?bFNJYjRWOVlRcWpiSUtOMVppQzdtS203U1NaV1Z3eUR1R053aytRWm9sMkJz?=
 =?utf-8?B?RkVpSmVGNlNrVThVeGFKekV2SnExZGJOaXczTGFxSXZRclMwbTJlekpPSHlq?=
 =?utf-8?B?ZnA3dEZPRHNjMFJuUVdLTlN5UnZEcm5NOElvQTZ6M01acFV0ZWNsUlc5OU5Y?=
 =?utf-8?B?Y2JrZFgzcklkbDRLMlh2YW5jSks3ZzR0ak1CUElmZ25MQmszeGZ0ZUQ5Uk1N?=
 =?utf-8?B?THlFVHpQeTdaQnpaUXNHYVU2ckJvTUIwelVKS2R2M0lVUXpkZm1YSkNUT1ln?=
 =?utf-8?Q?6YE7WVXCnOrjHKTNkf+KnOOq5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08df873e-9bfb-4204-9727-08dd75b95e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 09:48:36.3527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u00DeT0rxJjiW7atb3lnmSBCRfT31PFyQRcn4yaIye9OxmP4dzFuF4gfH/dll0WZORU8x4SvW4dXyx7CE1Zheg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYYXZlciBIdWdsIDx4YXZlci5o
dWdsQGtkZS5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgNCwgMjAyNSAyOjQxIEFNDQo+IFRv
OiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPjsgQm9yYWgsDQo+IENoYWl0YW55YSBLdW1hciA8Y2hhaXRh
bnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IFN5cmphbGEsIFZpbGxlDQo+IDx2aWxsZS5zeXJq
YWxhQGludGVsLmNvbT47IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+OyBLdW1hciwNCj4gTmF2ZWVuMSA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDAvNV0gRXhwb3NlIG1vZGlmaWVycy9mb3JtYXRzIHN1cHBv
cnRlZCBieSBhc3luYyBmbGlwcw0KPiANCj4gQW0gRnIuLCAyOC4gTcOkcnogMjAyNSB1bSAxNjo1
NiBVaHIgc2NocmllYiBBcnVuIFIgTXVydGh5DQo+IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT46
DQo+ID4NCj4gPiBBbGwgb2YgdGhlIGZvcm1hdHMvbW9kaWZpZXJzIHN1cHBvcnRlZCBieSB0aGUg
cGxhbmUgZHVyaW5nIHN5bmNocm9ub3VzDQo+ID4gZmxpcHMgYXJlIG5vciBzdXBwb3J0ZWQgYnkg
YXN5bmNocm9ub3VzIGZsaXBzLiBUaGUgZm9ybWF0cy9tb2RpZmllcnMNCj4gPiBleHBvc2VkIHRv
IHVzZXIgYnkgSU5fRk9STUFUUyBleHBvc2VzIGFsbCBmb3JtYXRzL21vZGlmaWVycyBzdXBwb3J0
ZWQNCj4gPiBieSBwbGFuZSBhbmQgdGhpcyBsaXN0IHZhcmllcyBmb3IgYXN5bmMgZmxpcHMuIElm
IHRoZSBhc3luYyBmbGlwDQo+ID4gc3VwcG9ydGVkIGZvcm1hdHMvbW9kaWZpZXJzIGFyZSBleHBv
c2VkIHRvIHRoZSB1c2VyLCB1c2VyIGJhc2VkIG9uDQo+ID4gdGhpcyBsaXN0IGNhbiB0YWtlIGRl
Y2lzaW9uIHRvIHByb2NlZWQgb3Igbm90IGFuZCBhdm9pZCBmbGlwIGZhaWx1cmVzDQo+ID4gZHVy
aW5nIGFzeW5jIGZsaXBzLg0KPiA+IERpc2N1c3Npb24gYXJvdW5kIHRoaXMgY2FuIGJlIGxvY2F0
ZWQgQA0KPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJn
ZV9yZXF1ZXN0cy8yOTYxOCNub3RlXzINCj4gPiA0ODcxMjMgTXV0dGVyIGltcGxlbWVudGF0aW9u
IGZvciBJTl9GT1JNQVJUU19BU1lOQyB1bmRlciByZXZpZXcgQA0KPiA+IGh0dHBzOi8vZ2l0bGFi
Lmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvLS9tZXJnZV9yZXF1ZXN0cy80MDYzDQo+ID4gWG9yZy9t
b2Rlc2V0dGluZyBwYXRjaA0KPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3Jn
L3hzZXJ2ZXIvLS9tZXJnZV9yZXF1ZXN0cy8xODE2DQo+IA0KPiBIaSwgdGhlIEFQSSBhbmQgaW1w
bGVtZW50YXRpb24gbG9vayBnb29kIHRvIG1lLiBJIGFsc28gdGVzdGVkIGl0IHdpdGggS1dpbg0K
PiAoaHR0cHM6Ly9pbnZlbnQua2RlLm9yZy9wbGFzbWEva3dpbi8tL21lcmdlX3JlcXVlc3RzLzcy
NzcpIGFuZCBpdCB3b3JrcyBhcw0KPiBleHBlY3RlZC4NCg0KQ2FuIEkgaGF2ZSB5b3VyIEFja2Vk
LWJ5OiBmb3IgdGhpcyBzZXJpZXM/DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0
aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
