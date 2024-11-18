Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16D9D0A72
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 08:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9155910E32F;
	Mon, 18 Nov 2024 07:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPsqxZWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9C10E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731916650; x=1763452650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6vv1pewCLmC6jLinwzBn3cqBY1wKkFY8SatdE18SSRY=;
 b=NPsqxZWaSGGjjWpP50ULYBLC9IcG5pJtTjgbyKmska12V+8pd7omfQn6
 KzfPSwKzs1/NqVtZE7aWOYZjxmDicffFa6mV+U30NmEgal7VryMV2jwWK
 4VInHKM8lrBuw220HHpuTwtF/u14M5AGN2SsHWBSNFMiLOIRfby8MroLH
 ndFYZQc4JEDqNuTVmK2N2bANtTVgO7j87XxqxsmhfqN7d/VUOgN9v1sCq
 SvFLB8Xg9wSNyCiapBqx8yvI2GJ025BuB7E4sYjo+D1Vlvgn+awldupIv
 v/C2Q0Ss8j95URbjOu1SvUP0zvs3aAkd2pahzzjK+9oxe8SMyylPy0PQj A==;
X-CSE-ConnectionGUID: rxTwB/KpQaqrW62pSFQt8A==
X-CSE-MsgGUID: BOJVKlXXTG6E+Y9TVeg89g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31989932"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31989932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 23:57:29 -0800
X-CSE-ConnectionGUID: TlumULZMQ6ep9pzjuYu1Qg==
X-CSE-MsgGUID: sn59UinSQD28zzq8gcOcCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="120000150"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2024 23:57:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 23:57:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 23:57:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 23:57:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HphBQtQaw6qy7iTJr0frl6Gb660uQaCNzoDeyLPUSHGXLsstHhuR8ljRjBq9zl3H11/qedAi6ee7fkgkcjzJbqy+0dJJO1Gc+Vzs3dMzShUftkuMpkK9fHtOLGE40EPlYc/QiHGGriSVdPEC91I+ZsSNsCkd4XsyzzYtBejeLDGOBCFKlex8hnFp4GgXfKw+oPCUq0GTTyzfwegZ479xqGoY7n4tqlNSfAnuGkKpGaR9SRxIVBNxsKjpOGI5NnwJ57SmXRRYitauhKuoEfC4PFPHTSTG59gVA3lci8PPfjihjkho63qe5lcaVcjKoqkTrDYcnLD7u1sA5mI2gJLDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vv1pewCLmC6jLinwzBn3cqBY1wKkFY8SatdE18SSRY=;
 b=mzcZg5BOkZglDcgdz4R1cFTy1LTkI/j1NRqZ/iXULBiv5YbvAi9E6RxIWQvazOPQCAWc2VwN8P2xpsTRp5apPHrnCxKROM0Inf6pCcOpTSCgy9k7XH6HZPdzKKklvls1wggTyJjlbCq8sckOFu4VDQmgqOcZrEYNdKM+/vtsJ6hsBQdFdMWbC1zdjSw1bmLEVEq22RZEz3EzA4lNvMzxN56R1lLcznIzRJ4FQrLLZA6l7+wEPZeO58k170WL6TbxhOQ08yyBjNdFb/DoL7bmwglxFP1kZ1Xz3IWY/k7tRMrvtvt4tfNsydPUN2vgNx/fZJrcESgsOIuMrUpGF+eiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 07:57:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:57:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUwgAK8GwCABQI3cIAeUOCAgAErI0A=
Date: Mon, 18 Nov 2024 07:57:15 +0000
Message-ID: <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
In-Reply-To: <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA0PR11MB4526:EE_
x-ms-office365-filtering-correlation-id: 01550011-a274-4f56-90e4-08dd07a69df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnF2c2NuSHpjWER4RE5JbXJMckJkRDNrVVZPV1VDN2VialA4SHVpaGNPVFZ2?=
 =?utf-8?B?YWdZZjI3a1E2ZkJKdXpPc1RVRXllcWF0T3k0NzEwNTlxMTlCVEhLQmNmSjRv?=
 =?utf-8?B?YTFhTE9OUHFJM2JienVqejduN0MzS3p2MUJLVTJDMGIydmVxV0taUEVsZ3hk?=
 =?utf-8?B?TUJFOTlBUHBDNEt4QTZnd1d2MlhScVMrY1h4TzVsY0l4ZlJXZS85YXhkZVNh?=
 =?utf-8?B?a1h1WndJL1FGTzZrRGI5bHBHblpBMFgzV0Q5MU9qU04xNVkxZmpaaUZxK0pH?=
 =?utf-8?B?Wk9qdTdYY2tBMGhrVTd0ZVkwZ1J6ajZjcDZVK1VWZ0F4YUsrTkRjc2l6WUlB?=
 =?utf-8?B?Vkh0WW8vTlhSSnpFdGNPK1hEa1A5OHMvbUpmdXZiRlluZFBjRENDekdUdXht?=
 =?utf-8?B?NXY1YkFHbXBrL2orUVM2Qy9uNlhzZnBXdElpZmIzMTZBQUlRa2xhK0VQMzdq?=
 =?utf-8?B?WGVvS1praitDRjBGMm4wN1h0TzBWSXJQbHpDUnRScFpramd4K2dJL05Ta1Mv?=
 =?utf-8?B?bjJoUEZCK0JvS2YwWktMTDdEa09wNDVRWC8wV3lxVWR6UnRsc3d2SEZ3TnhD?=
 =?utf-8?B?UjJjT3czNjlDbytnWCtlQXJNMVN4cjNLMG1oZ3IxMUVIeGNWS0lFWEk5bitH?=
 =?utf-8?B?cGZmWGVaVUdmVVdNMlFyaWdkc3I0UVRLTlY4cWtuUDRXeFJyd0RRNG5ablpH?=
 =?utf-8?B?Z2xtMkVSWDZ5a1Z2VzU5WlJrcjNFdFdNT0xZTzZzbHVDUFdKK3o0cVNYZFY5?=
 =?utf-8?B?OUpHNHJtNGNZcXowd3k1Zmc3dEZ4TDNhZFhodTM2ZEhjSU9HYWc2THNIRHND?=
 =?utf-8?B?Z0JFcDAvSm5ZUS9FWWo3clRHWmNQZ3RaQitYbVE0aENjTiszQi96TURJQTFn?=
 =?utf-8?B?bWVnNFJnKzc4L0tmTlF4bWxvc3FidnlSb1ZrL3czbUVKTXp2bHBrYktic0pH?=
 =?utf-8?B?ZXA5QTJVaUc4MzRRWWhaVDhXQ21PZDAvVS9xNFg1TUJ3Smg0VnEwTlo5bjFL?=
 =?utf-8?B?TzFZNHdPQWRwemhCcnFabER2Z0xTYWRCay95Yk00MWduM1VYL0t4VDZGaWVT?=
 =?utf-8?B?eWxqbUlWelM3dVdHV05RVmM1SXBlT0ZhaVlqRWJwemJoUzdLa3FVdngzbXB2?=
 =?utf-8?B?WVpPcnkxc1pyMTBjQmtsazNpeldUa0dZTjVUclpyK3NuaDVOQmttcGQxNGVK?=
 =?utf-8?B?UDNxZ1ZiOURsWlVwWHh0empKWHB5QzdSNzgvSkZDdU80SmJyRDBRT2R5TUxG?=
 =?utf-8?B?cThtekxQOHhFWnQ0LzNSc2R6V1JIcEFWejhuNVZZRlBvNFpjeFBpckVacGxp?=
 =?utf-8?B?T2UxUmJxS0I5aXljenRoUDB3UDA0dlQvMkFSTTdKeUM4R0ptN0l1dU94Q09L?=
 =?utf-8?B?dXhTV1lvaUZnelh6MDF0dE9DREVXdWNTbERMeDR1V3h5Q3IxcTBJNjBOYzc0?=
 =?utf-8?B?U1hoVG1aSFZIUTZocWMwaUJoaXFTeEhSOTI0Z1MzQWxzbWlMZEJuaXJGUDR5?=
 =?utf-8?B?bWhNQ1RqUzZ6VENxRThZeUY4Z3BVWE1xaDJUTXJJaFdBdUw0RlVtcjh5eXky?=
 =?utf-8?B?OWVuK3FkZTUvQlN5TjZ3ZVJ4RGUxaWFoMUtoUDRuTmtEQ3kwTEJNL0lwMVFW?=
 =?utf-8?B?RVptdnM5UERLTE5wSjBEZDRyR0dKaVRWVFgrVjdxSVBXSm1iWGJjY3JVVUky?=
 =?utf-8?B?azBERTZ2WWxGRTh2L2Rncm9WaWt3NWxBNE8yRDNBV2laZnVXMmlDZnk5Z3lM?=
 =?utf-8?B?ZHJrV21XbDlRalYxb0VoMUlyajl0TTEyZ2dQZ3dhL0tyektLRldiMC9TdVR3?=
 =?utf-8?Q?nTjW5cW71KNYuToPT0A75N6YEmwEPGPhKwrFY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThETlB6M1p5OGtXUWJ2QzIzK1JheHJud1hJeTJ3dk5FWUF3NW1Zam5wYjFU?=
 =?utf-8?B?VDF4eWsrMWpPWlBEa0pBTWFUaEtEN05DdTFSVGR4TEJSNE9vbU1mOXhaVEZh?=
 =?utf-8?B?dUtnNHJkLzJyMk9KMkVDeURkb09yazVyKzRlRFV1eWVDOWF5VHVVWTBKWE8r?=
 =?utf-8?B?V0pUZUQxYk90ZHJhL2ZQK0VHRE1rc2pHeWNWTGp1K2NXeGVrbS9WRkVPdFhs?=
 =?utf-8?B?Mnd4dzAvZkd6ZGY2WlhrOFJrSkduaXQwMi84QjNUbVRpL3BRclcxVVR2Q1RN?=
 =?utf-8?B?ejJNa0tmMHdnQXdtWEQwbS9OSUkzSUgzM2pCaGJQWDZ3QjVCTUVLejFNdkdH?=
 =?utf-8?B?R2daZndpMW5xbVBibHRuRTZ2dHBOMEJWVXlldGR0bjdlazNSRmJDZjhNWmVL?=
 =?utf-8?B?Sjg4eHB2UTVaRm5tNm9BeUhZVU1zWVJycHk2U3hBeXV3MCswNGdNNTdnYUJW?=
 =?utf-8?B?VnlYcWxLenZTZm5WdHAyd09aZXVDbmt3THM4OG9DbzkwaEpYOXE4VDJMTUtS?=
 =?utf-8?B?STlibUVJaFRmQzRBNmNsR0t4eUhySE5MZFJ0anRIMDR6ZEhRcWJOTlM3aUw5?=
 =?utf-8?B?aEdYUjdYS3pBczM0WFJpbndwVCtJbFJ6Mlk4STZXdUIwK0craTlFNG5mWEJX?=
 =?utf-8?B?dmZ5WUxpeGYzeUVJM1UyZW1VcUVPRUtycG1ENDAvV3ZXay8vUUx2RWZIY0Vo?=
 =?utf-8?B?WHZ5NkM5RHBOb1RLU3JnRFdEOVF2QWpCdm93bG5vNTR3aC9wNlNib3RvRXd1?=
 =?utf-8?B?Q1htU0tzbVdLSTFuZEhJd0F3dnpqQUplRTRmN3VBN0NSN3kwQnVhWityNDRM?=
 =?utf-8?B?ZVBIMHBGekgrSys2NDUydTVCdXNWNEtSRXA2V295aGlLQWR4ZnN5WFpUWEFj?=
 =?utf-8?B?cFZrRHBkVThhbGZSSzZVYzZtZ3lUbndzZ1U1M2I5WTljZVZqM094cUt4L2d3?=
 =?utf-8?B?TDg4WjFMSms0KzRhcXlKcURaUEY0Q05kYkZ4d1oxOGRoMTUzMWZmRG5GV2tr?=
 =?utf-8?B?MEtPeWpmQnEwSjJzUzFkbGQva3oydjk5S2JoVUJCSWpWak1Nb0hBelRWaThI?=
 =?utf-8?B?M3pLWjRJUTlFRVlWMkdUa0xEaW54aTkwWVg4emp1cTdlc202cnJIMnUvbVBE?=
 =?utf-8?B?ektqV0NPQTkyUUl2cW9xS2ljT2FTU20rTm9pcGRUSGRIdFBjb3MrY3dWLzV3?=
 =?utf-8?B?NFdyM2hCWUt5eG1JKzdDMU0vSVk4aXRDbjRsakdvTFFBK1ZJWUlhWllZZlE3?=
 =?utf-8?B?UWNjQmpWcVdhR0U0MUh5dlBrbHNORklmdUI0ckJWMVlnVklLZnd1a2g1K3I3?=
 =?utf-8?B?TnhzM3ZNL08yTUNLbUtYT3JKU0VCZ0dhbUxlNXAxcjkwaGpxeTZaajJsdlpS?=
 =?utf-8?B?MkVBYmdTa2lPNnZLeldKa3hvKzc0dVhERHEzUkdWUmtVZ2Nqa0E2K2tNTnN4?=
 =?utf-8?B?MWNEOGRoWVdUbnZ3RXBlWS9KTE9LWHFNclczL3JmQlhrcnVpNVVDYzBWYlpl?=
 =?utf-8?B?aTljSEhBQmtONDdCUnM4bytVMWw2SDFCQk91aitscEd2UWZSaHJzZFFSMHJs?=
 =?utf-8?B?emhmS1Z2cEpMV0lkTS9PRE1vMnpEVGtXTlVtUW1JNWFaSmFRc2Z3bE9qb2Zu?=
 =?utf-8?B?Wkx6djJNWDZSbkhnU1UrcDJ0cEdzOEZWcHQwNEtYT1N0NFJUaFA0S2RQMmNu?=
 =?utf-8?B?dHkydTByOEt3bGxLRE13UmRnRlRwSEp2eEl0cmRRMDVSaU92QnpvRVVPN2ow?=
 =?utf-8?B?UHRQT1IyTnZod2hWeSs4cUJtV0hrbTlwdGxqc0U0dGREaGNBN3luc0dvZFpF?=
 =?utf-8?B?UGhQcVpJTDRCM25DaHhoeFZUa1E5aEowaFlpUUd5dHNJMkhTbTd2aGpHNG55?=
 =?utf-8?B?WGU5elVXaUdPZlhDanZBTk5mNDZLM3BRNlRzd3BaS2hQN3JHV1o3K2RGbzUy?=
 =?utf-8?B?eXMySlVpNGR1NHhBL05zc2x1cFhzTU9ZUytXVHJSNTNzcVFoZVpZUGtrMXFF?=
 =?utf-8?B?NUpHUyt4NmV2L3l0eUEyb283bittaHg4RWd2S2s4NG1ZOXdwMjV6ai9jaEpX?=
 =?utf-8?B?akpIcGxxOXZvTHg4Umxuc25Qalh3WFJLbllHaDR0c3VZMnY3Y0tEamVCQWJ0?=
 =?utf-8?Q?y9WkBh/8aV3za3SCNJltn2fHG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01550011-a274-4f56-90e4-08dd07a69df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 07:57:15.2113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHUnosp6k4vFxu2go4tA1LaVnDsJk3glKGnZwHmjjWqhCZ+HMX8Zjga+TNW6Zid9wo2wmT9sp0tknwnnu45UiY9BajMkbs1qR+2pp7jv6rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gDQo+IE9uIDEwLzI5LzI0IDA5OjE4LCBLYXNpcmVkZHksIFZpdmVrIHdyb3RlOg0KPiA+Pj4+
IEJUVywgaXMgYW55IERHMiBHUFUgc3VpdGFibGUgZm9yIHRlc3Rpbmcgb2YgdGhpcyBwYXRjaHNl
dD8gV2lsbCBJIGJlDQo+ID4+Pj4gYWJsZSB0byB0ZXN0IGl0IHVzaW5nIGEgcmVndWxhciBjb25z
dW1lciBBNzUwIGNhcmQ/DQo+ID4+PiBZZXMsIHlvdSBjYW4gdGVzdCB3aXRoIGFueSBERzIgZEdQ
VSBhcyBsb25nIGFzIHlvdSBjYW4gcGFzc3Rocm91Z2ggaXQgdG8NCj4gPj4gdGhlDQo+ID4+PiBH
dWVzdCBWTS4gQW5kLCBpZiB0aGVyZSBpcyBhbiBpR1BVIGF2YWlsYWJsZSBvbiB0aGUgSG9zdCwg
eW91IGNhbiB1c2UNCj4gPj4gR1RLL1NETCBVSQ0KPiA+Pj4gZm9yIGxvY2FsIGRpc3BsYXkgb3Ig
U3BpY2UgVUkgZm9yIHJlbW90ZSBkaXNwbGF5IGlmIHRoZXJlIGlzIG5vIGlHUFUgb24gdGhlDQo+
ID4+IEhvc3QuDQo+ID4+PiBUaGlzIGlzIGV4YWN0bHkgaG93IEkgc3RhcnRlZCB0ZXN0aW5nIHRo
aXMgcGF0Y2ggc2VyaWVzIGJ1dCBJIGFtIG5vdw0KPiA+PiBwcmVkb21pbmFudGx5DQo+ID4+PiB0
ZXN0aW5nIHRoaXMgc2VyaWVzIHdpdGggU1JJT1YgZW5hYmxlZCBpR1BVcyBhbmQgZEdQVXMuDQo+
ID4+IFdhcyBob3BpbmcgdG8gdHJ5IG91dCBTUi1JT1Ygb24gQTc1MCBpZiBpdCdzIGV2ZW4gcG9z
c2libGUgYXQgYWxsLg0KPiA+IEFGQUlLLCBTUklPViBpcyBub3Qgc3VwcG9ydGVkIG9uIGFueSB2
ZXJzaW9ucyBvZiBERzIgaW5jbHVkaW5nIEE3NTAuDQo+IA0KPiBJJ20gaGF2aW5nIHRyb3VibGUg
d2l0aCBnZXR0aW5nIGl0IHRvIHdvcmsuDQo+IA0KPiBNeSB0ZXN0aW5nIHNldHVwOg0KPiANCj4g
MS4gUGFzc3Rocm91Z2hlZCBBNzUwIHRoYXQgdXNlcyBYRSBkcml2ZXINCkkgdGVzdGVkIHN1Y2Nl
c3NmdWxseSB3aXRoIGJvdGggaTkxNSBhbmQgWGUgYnV0IERHMiBpcyBvZmZpY2lhbGx5IHN1cHBv
cnRlZA0Kb25seSB3aXRoIGk5MTUuIFhlIG9mZmljaWFsbHkgc3VwcG9ydHMgTE5MIGFuZCBuZXdl
ciBwbGF0Zm9ybXMuIEZvciBvbGRlciBwbGF0Zm9ybXMsDQpNZXNhIHRocm93cyB0aGUgZm9sbG93
aW5nIHdhcm5pbmc6DQpNRVNBOiB3YXJuaW5nOiBTdXBwb3J0IGZvciB0aGlzIHBsYXRmb3JtIGlz
IGV4cGVyaW1lbnRhbCB3aXRoIFhlIEtNRCwgYnVnIHJlcG9ydHMgbWF5IGJlIGlnbm9yZWQuDQoN
Cj4gMi4gUmFwdG9yTGFrZSBpR1BVIG9uIGhvc3QgdXNlZCBmb3IgdmlydGlvLWdwdSwgdXNlcyBp
OTE1IGRyaXZlcg0KSSBhbSB0ZXN0aW5nIHdpdGggYSBzaW1pbGFyIHNldHVwOiBSUEwtUCBpR1BV
ICsgREcyDQoNCj4gMy4gUUVNVSBsYXRlc3QgbWFzdGVyIGJyYW5jaCArIHlvdXIgUUVNVSB2Zmlv
X2RtYWJ1Zl8yIHBhdGNoZXMgYXBwbGllZA0KPiBvbiB0b3ANCkkganVzdCB0cmllZCB3aXRoIGxh
dGVzdCBRZW11IG1hc3RlciBhbmQgaXQgYXBwZWFycyB0byBiZSB2ZXJ5IHNsdWdnaXNoIGluIG15
DQplbnZpcm9ubWVudCAoRmVkb3JhIDM5IEd1ZXN0IGFuZCBGZWRvcmEgMzkgSG9zdCkuIEJ1dCwg
ZmV3IG1vbnRocyBvbGQNClFlbXUgbWFzdGVyICsgdmZpb19kbWFidWZfMiBwYXRjaGVzIChhY3R1
YWxseSwgdGhlc2UgcGF0Y2hlcyBhcmUgbm90IG5lZWRlZA0KdG8gdGVzdCB0aGlzIHBhdGNoIHNl
cmllcyB3aXRoIEdUSy9TREwpIHNlZW1zIHRvIHdvcmsgT0sgZm9yIG1lLiBBbmQsIGhlcmUgYXJl
DQp0aGUgcmVsZXZhbnQgUWVtdSBsYXVuY2ggb3B0aW9ucyBJIGFtIHVzaW5nOg0KcWVtdS1zeXN0
ZW0teDg2XzY0IC1tIDQwOTZtIC1lbmFibGUta3ZtIC1jcHUgaG9zdCxob3N0LXBoeXMtYml0cz1v
bixob3N0LXBoeXMtYml0cy1saW1pdD0zOS4uLi4NCi1kZXZpY2UgdmZpby1wY2ksaG9zdD0wMDAw
OjAzOjAwLjAgLWRldmljZSB2aXJ0aW8tdmdhLG1heF9vdXRwdXRzPTEseHJlcz0xOTIwLHlyZXM9
MTA4MCxibG9iPXRydWUNCi1kaXNwbGF5IGd0ayxnbD1vbiAtb2JqZWN0IG1lbW9yeS1iYWNrZW5k
LW1lbWZkLGlkPW1lbTEsc2l6ZT00MDk2TSAtbWFjaGluZSBtZW1vcnktYmFja2VuZD1tZW0xLi4u
Li4uLg0KDQo+IDQuIExhdGVzdCBsaW51eC1uZXh0IGtlcm5lbCBvbiBob3N0DQo+IDUuIExhdGVz
dCBsaW51eC1uZXh0IGtlcm5lbCBvbiBndWVzdCArIHRoaXMgdjIgYXBwbGllZA0KSSBqdXN0IHRl
c3RlZCBzdWNjZXNzZnVsbHkgd2l0aCB0b2RheSdzIGRybS10aXAgKDYuMTIpICsgdjIgb2YgdGhp
cyBzZXJpZXMuDQoNCj4gDQo+IEluIGd1ZXN0IEknbSBydW5uaW5nIHRoaXM6DQo+IA0KPiAgIHNl
YXRkLWxhdW5jaCAtLSB3ZXN0b24gLS1kcm0tZGV2aWNlPWNhcmQxIC0tYWRkaXRpb25hbC1kZXZp
Y2VzPWNhcmQwDQo+IA0KPiB3aGVyZSBjYXJkMSBpcyBBNzUwIGFuZCBjYXJkMCBpcyB2aXJ0aW8t
Z3B1Lg0KPiANCj4gSSBhZGRlZCBwcmludGsncyBhbmQgc2VlIHRoYXQgdmlydGlvLWdwdSBpbXBv
cnRzIEE3NTAgZG1hLWJ1ZiBhbmQgZ2V0cw0KPiBYRSdzIFNHVCwgYnV0IG5vdGhpbmcgc2hvd3Mg
b24gdGhlIFFFTVUgZGlzcGxheS4NCkNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRoaXMgdGVzdCBhZ2Fp
biB3aXRoIGk5MTUgaW5zdGVhZCBvZiBYZT8gQWxzbywgYXJlIHRoZXJlDQphbnkgZXJyb3JzIHNl
ZW4gaW4gR3Vlc3Qgb3IgSG9zdCBsb2dzPw0KDQo+IEkgdHJpZWQgYm90aCBHVEsgYW5kIFNQSUNF
IGRpc3BsYXlzLg0KR1RLIHNob3VsZCBiZSBzaW1wbGVyIGdpdmVuIHRoYXQgdGhlcmUgYXJlIG90
aGVyIGNvbXBvbmVudHMgKEdzdHJlYW1lciwgZXRjKQ0KbmVlZGVkIGZvciBTUElDRSB0aGF0IGhh
dmUgdGhlaXIgb3duIHNldCBvZiBkZXBlbmRlbmNpZXMuDQoNCj4gSWYgSSBjb25uZWN0IEhETUkg
ZGlzcGxheSB0byBwYXNzdGhyb3VnaGVkIEE3NTAgd2hpbGUNCj4gcnVubmluZyB3ZXN0b24gY29t
bWFuZCBhYm92ZSwgdGhlbiBJIGdldCB3ZXN0b24gd29ya2luZyBvbiB0aGUgQTc1MA0KPiBIRE1J
DQo+IGRpc3BsYXkgYW5kIHN0aWxsIG5vdGhpbmcgaXMgc2hvd24gb24gdmlydGlvLWdwdSBkaXNw
bGF5Lg0KSSB0cmllZCB0aGlzIGV4YWN0IHNhbWUgdGVzdCBhbmQgaXQgc2VlbXMgdG8gd29yayBP
SyBmb3IgbWUuIENvdWxkIHlvdSBwbGVhc2UgYWxzbyB0ZXN0DQpHbm9tZSArIFdheWxhbmQ6DQpY
REdfU0VTU0lPTl9UWVBFPXdheWxhbmQgZGJ1cy1ydW4tc2Vzc2lvbiAtLSAvdXNyL2Jpbi9nbm9t
ZS1zaGVsbCAtLXdheWxhbmQgLS1uby14MTEgJg0KDQpOb3RlIHRoYXQsIGZvciBXZXN0b24sIHRo
ZSBwcmltYXJ5IGRldmljZSAoZHJtLWRldmljZT0pIG5lZWRzIHRvIHN1cHBvcnQgS01TIGFuZA0K
aGF2ZSBhdC1sZWFzdCBvbmUgY29ubmVjdG9yIGNvbm5lY3RlZC4gRm9yIEdub21lICsgV2F5bGFu
ZCwgdGhlcmUgaXMgbm8gc3VjaA0KcmVxdWlyZW1lbnQgYXMgdGhlIHByaW1hcnkgZGV2aWNlIGNh
biB3b3JrIHdpdGggZHVtbXkgYmFja2VuZCBhbmQgYmUgdXNlZA0Kb25seSBmb3IgcmVuZGVyaW5n
LiBUaGVyZWZvcmUsIHRvIHRlc3QgR25vbWUgd2l0aCBERzIgaW4gR3Vlc3QsIEkgdHlwaWNhbGx5
IGRvDQptb2Rwcm9iZSBpOTE1IGVuYWJsZV9ndWM9MyBkaXNhYmxlX2Rpc3BsYXk9dHJ1ZQ0KDQo+
IA0KPiBJIGFsc28gaGFkIHRvIGZvcmNlIHZpcnRpby1ncHUgZHJpdmVyIHRvIGFsd2F5cyBwcm9i
ZSBiZWZvcmUgWEUsDQo+IG90aGVyd2lzZSB2aXJ0aW8tZ3B1IGdldHMgUENJIHJlYWQgZXJyb3Jz
IGFuZCBmYWlscyB0byBwcm9iZSBiZWNhdXNlIGl0DQo+IGZhaWxzIHRvIGRldGVjdCB2aXJ0aW8g
ZmVhdHVyZXMuDQpUaGF0IGlzIGNvbmNlcm5pbmcuIEkgZ3Vlc3Mgd2UnbGwgbmVlZCB0byBpbnZl
c3RpZ2F0ZSBob3cgdG8gZml4IHRoaXMgcHJvcGVybHkuDQpBcyBwYXJ0IG9mIG15IHRlc3RzLCBJ
IHR5cGljYWxseSBibGFja2xpc3QgWGUgYW5kIGk5MTUgYW5kIGxvYWQgdGhlbSBsYXRlcg0KYWZ0
ZXIgYm9vdGluZyB0byB0aGUgY21kIGxpbmUgYW5kIGJlZm9yZSBsYXVuY2hpbmcgdGhlIGNvbXBv
c2l0b3JzLg0KDQo+IA0KPiBBbSBJIGRvaW5nIGFueXRoaW5nIHdyb25nPyBTdWdnZXN0aW9ucyBh
cmUgd2VsY29tZS4NCkNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciBRZW11IGxhdW5jaCBwYXJh
bWV0ZXJzPyBJJ2xsIHRyeSB0byByZWNyZWF0ZSB0aGUNCmlzc3VlIHlvdSBhcmUgc2VlaW5nLg0K
DQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
