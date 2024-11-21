Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5C9D45B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 03:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8234410E82A;
	Thu, 21 Nov 2024 02:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2115.outbound.protection.partner.outlook.cn [139.219.17.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CA810E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 02:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDqRIhl2+n1T0WRcREj7KXbnQyxIogMnxGJNolStMf7uwm7EDQrGdqgZ8bXJx0OqRNz0yPD6Z8oviHFnxeuoNZMCDRfNycq2BoBXJnMuE48slKPxX8qiUNFPdCtCnOdPetmv3eOTkpzn/3rc68phIaAxPRL3xbTcGqcFHuqpiUnr0ZlIu7UtJo9ZNqVRPMPpUXLpIcUyn+O9uUWrFVmRnj8SsCzhaTrJT9ndFWgMxLScyk3uKbJFZoSDTJrOUZXiCHpePXuaQEiQ7OizhWO7h4M3lUiEZKWheOVh7dC8/IkdHnzxgSU0+XItt+Cn8vAyG9hTZtOCopG3sdceGwX+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=errUcm+oMQYMFbM7h1pFii/gjCVdagt4XEyzW412ScA=;
 b=bKFZ29YK7cqdHO/I9SYJwXbAHUn9KVc8Nzt2Vio9uG/BqOil2TAjuQ2ldGnZTvbFrsI6VCB0Pw/69sORKt3UKIbyMP/Dks7M6SAaBc9flLcNEGGz+mxVnv/UrkOQQ3y2HtXtFO0wKrpzT91q7j8Ic0blbo8h8mHNkd8jgQmsCxFxu7ELaLOD4HWbNhJds1jXK9QqeOp4iXEawplpdHOAtVMLtUhmMI/aBYcXQQkrGEAWlnlzqCVjEfWiiHTiWqegDzNT4ORGWs+Kr8ggvovjTQ+llb3msYAUBQuXQu69BfQC0iQNSbZzY8qQuRrWck7qLGg/upz6iCIQPrlwZXxfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1131.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 02:15:33 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Thu, 21 Nov 2024 02:15:33 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "andy.yan@rock-chips.com"
 <andy.yan@rock-chips.com>, William Qiu <william.qiu@starfivetech.com>, Xingyu
 Wu <xingyu.wu@starfivetech.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Changhuang Liang
 <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Thread-Topic: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Thread-Index: AQHbOxRIKgffTjzmOU62HBjB5Tje/bK/yCiAgAEucPA=
Date: Thu, 21 Nov 2024 02:15:33 +0000
Message-ID: <NTZPR01MB1050A2F29632FFC065AEEDCBEE22A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-4-keith.zhao@starfivetech.com>
 <410ebbd0-2304-4d9e-8d4a-5e63ab29ada8@kernel.org>
In-Reply-To: <410ebbd0-2304-4d9e-8d4a-5e63ab29ada8@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB1131:EE_
x-ms-office365-filtering-correlation-id: bdf9ddf2-3203-4e9b-084f-08dd09d26157
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: QKel9U38bLRyDXA7xcIjOzzQ7JupbvNtuaU95+eiMLL8TCX/MgpfX7OMMN553z9CIn9UKNW2M7AqmgWK93Epcpbtfc63O5ytY/VVwF9gr6ZA3RdFB55deNzYuay4bZ91Zb+sU1Ye6c/wS+tmE2A5dhFZpatwJhHgTf9xnauwf0T8z8aRPoHouHm8gVV+4NdXKL6b8LRkqsg38ByiLGwIdfTiGKFXjjAp0F/tZwS+GJRIa8m3kTyTzBwO+ymT0FfY5bXKS0ifSKkiSJJENV7iSWwK9s1egLXf3FMr9k1i0GnAMMVkAoYF8vFHeAnnloDeuuahz3RJGtbiLHjPcCcky9Npkea9uS7A4TeKwQDHnJ0n+JvK8n2E8JDgBJiCh5fFLek2HgvHhuSL86RJkCUPDY2zaXIl5MR+ncexFmOC/4Xsmg80HwzXukTT/tFHQ8j14dtaKo+O+dZir2yspbBjM4kGDEIbce4SNUzbgT8EXYHbFeEEcWteruONXA/CnQroaeJ1G/EiNckYnYieTopAI8K4cTPTRpi61K9hFR0I3Z2bO7P+CmDCaavp6y+DFmHaCgvhnnU3THKSRcw7fAs6yd+EexAvgh8UFB7CyW1PtluLceN/BqOJD2fopX9+GpJC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWpzVW9QR0xKbWYxWUFiYVJ5THpPOForSENOM291aStjYU8zVVZTNHhPTlBj?=
 =?utf-8?B?Wm5lTUQwd3dPVWNMdmxyNlRZVE5adXp2OU1qemJuNWZKVk1aQjZTejI1Z2xp?=
 =?utf-8?B?eGJ0VjZwRjA2QVNFVUJQUnVYOGx3Z1J2S0tqVGI0djdhdEtCOVhPVGR1MXpC?=
 =?utf-8?B?R3h6ak1YRWFMRkdhWTAzT0l0TzFPUThYcnZGelRobkpqN1hrSzlQS1V6K2ZU?=
 =?utf-8?B?MDN6anZ6VnRReUthdGRqYm5VUjVxYXlSVWpPRytGOXJweTh0bk02aWJYeEhC?=
 =?utf-8?B?cXdXREtJNjBTOWk4UWdlMVRyMzIyZHpEVlMxaWtaZDRwSmpndUdkSkc4bEls?=
 =?utf-8?B?T3pKQUhCaUFielRKR0VMQlpsb0tmNEZJU1hYeVpULzlkMjJnNXBCbEhVcGUx?=
 =?utf-8?B?Ulh5L0ZHeXdYaG1WQU1rd09zSkhxbFFHK3ZiQXRyV1N4M2tLRmFUVzNtSUNL?=
 =?utf-8?B?NXE2NTVZMXBQSElsNzlZcVM4K3JJeGdsSE1qVTBIaWpzK2F5cjNycXNlYm9S?=
 =?utf-8?B?QWFNMEZhbU40VDV1MjZxd25tQXdhOU9ROGthNHQyUmx4cXNjK0h5RjR6OVFN?=
 =?utf-8?B?aFRmTGUxK1g0QkdYa2ljTVBHRDU3eXZ1UmIzcW03OVE1cFhNdXZkYXV0TDVi?=
 =?utf-8?B?dDhsUUx5cjNZdk1lZDlVd3pRVUd4L09jY0NtYnFOU0lTb0NBN0libVdSaDVk?=
 =?utf-8?B?SVg1ekd4cFd6aVBNcm5KY3hkV1ByTjVCb0dvaXJlZG51bXpNd1ZCUFdKYUFv?=
 =?utf-8?B?a3Q5VUR5VjdnNXZxUVRYWEZwRXpoeDhVV1VjRm9LdlJxcmlNSVRUQUNQWEN0?=
 =?utf-8?B?d2U0Z0VkVXlVcmpBTWNZNmpKL2NNS3RjK1pVYWwzT2ZSMldSakd6VFBZTVNi?=
 =?utf-8?B?blhWUjhVbTlNWGVXQlJMajhaYkhIS2F3WXFoQzdKUkdDd2VZeHc3Z25iQWJa?=
 =?utf-8?B?TjZOS3I2Z3RTY0tqdnR1ZDUyMXJ2N3htY3J0Rm9JZjE3RUp3ZVB2S2VLTmtL?=
 =?utf-8?B?Mmg1K1FJZTlCV1JsQVN3UDBvbHpYQ1FwNFkwL2t2NGVOOTJLQjZQNFF6dG1w?=
 =?utf-8?B?WTQxdkplc1cxMGZRUlRDdXRMQjJWUytINXBGdXVpaEtBRUFlOXRWU010eUxv?=
 =?utf-8?B?dDgvNzgySW1XbHdSNmVESWZ3cm1icEhBRnd6b2czRWthNkNDak5uUEdTZU1m?=
 =?utf-8?B?bysxVCtrVytrYk1BQi9OQi9VY3pPdWw3eFF2bjhzM1RTS1NrL3ZsNUJzOEs1?=
 =?utf-8?B?WkdsMitrQ1R4YmZHeGxPc1piREhDZWd0Y1RrM1dVM3NsK3FNNTNtVEFIaDJS?=
 =?utf-8?B?TUVxYlBiSUVzQXViVDNOOFcxUGZGR0VpOFdVS0p4ZHBMcjcwNE1PV1o3c0tt?=
 =?utf-8?B?ZnVlbWJBTWR3ZlFWYWtkU3pCR05jeFBQSWNBR0dpbEx2ekRHejNUWGtmRkU5?=
 =?utf-8?B?Wnp6L2krbGc5OFJESmdSUGVaYVJ6c0dlVDlrb0ZXelZOZHBvUnNKSmZDcFdX?=
 =?utf-8?B?MGJtN2xOL1dTYlRnRS9pWHA4bVFBM24wQzlDT29yYU9lMWxhMUllelZMUXds?=
 =?utf-8?B?ektjaVlPaHk4U3V2b1RoTlNHUDJneFl6TTR5TUxnSGpwTU9PYnh0MUtPV2gr?=
 =?utf-8?B?Qzh3Y3dvL1hkUmh6SDd2WWRxWEdFZVNWSEQ0NTdyakpTNE9LUFgybmNjbGpq?=
 =?utf-8?B?bGFCV0pNdkt5RlhFY1F0ZEYwZThWS1RpeXdQMWZkMEZ0ZFd4RERKcHZZVjdj?=
 =?utf-8?B?bjRQUXF5dEVHWVY5RHdsdndtV1lRNllrS1pZMjNvUS94dWVMNkNHZnA0R0RX?=
 =?utf-8?B?RitGbWdwOWNhNUNJV09zUmRBcVVJRXQ3VnZiVG1Vc1VqSXdsL3NhVVB1YVU5?=
 =?utf-8?B?U0l0blJ2dzlrSWIrZ2FZcGZPRndTaVZ6Nm92dnY5dS9HRmJ4eGtSQTNjN21T?=
 =?utf-8?B?K0Z1SWJKYWptOEE0aGszZitFNlVabUd2eTRhWCs1cmJsWnhyTUdSTDZ1cTB2?=
 =?utf-8?B?d2NqYTgzMTlyMXV2bzgzbXl0bkJDblRhTmh1NnYyWFhsNlgwc29obDZFdGNx?=
 =?utf-8?B?TGlsbjRPOG5nNGlRKzVodmlMZXNaN2p6QVVQdjhzVm5nNStyZUFCMElSekpK?=
 =?utf-8?B?SU9nU1lXeTlIVUtrQ3F0UEVvL1ViVDgvT2VzQUFtcTNvd2srVTZvbVg0RHVp?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf9ddf2-3203-4e9b-084f-08dd09d26157
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 02:15:33.7160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sN2dqa812Wth2Ru8zcBkWkd98zps8CSTWzd1TlJUvrxUS/gXTC9jqC2IMjqotixLYILsc2j1vdBsFqXcjGaRbHE05B3O/719LlZo36vBvng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1131
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI05bm0MTHmnIgyMOaXpSAxNTozOA0K
PiBUbzogS2VpdGggWmhhbyA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBy
Zm9zc0BrZXJuZWwub3JnOw0KPiBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpv
bmFzQGt3aWJvby5zZTsNCj4gamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb207DQo+IG1yaXBhcmRAa2VybmVsLm9yZzsgdHppbW1lcm1hbm5A
c3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207DQo+IHNpbW9uYUBmZndsbC5jaDsgcm9iaEBrZXJu
ZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IGhqY0By
b2NrLWNoaXBzLmNvbTsgaGVpa29Ac250ZWNoLmRlOyBhbmR5LnlhbkByb2NrLWNoaXBzLmNvbTsg
V2lsbGlhbSBRaXUNCj4gPHdpbGxpYW0ucWl1QHN0YXJmaXZldGVjaC5jb20+OyBYaW5neXUgV3Ug
PHhpbmd5dS53dUBzdGFyZml2ZXRlY2guY29tPjsNCj4ga2VybmVsQGVzbWlsLmRrOyBwYXVsLndh
bG1zbGV5QHNpZml2ZS5jb207IHBhbG1lckBkYWJiZWx0LmNvbTsNCj4gYW91QGVlY3MuYmVya2Vs
ZXkuZWR1OyBwLnphYmVsQHBlbmd1dHJvbml4LmRlOyBDaGFuZ2h1YW5nIExpYW5nDQo+IDxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+OyBKYWNrIFpodSA8amFjay56aHVAc3RhcmZp
dmV0ZWNoLmNvbT47DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NSAzLzldIGRybTogYnJpZGdlOiBpbm5vLWhkbWk6IGFkZCBpbm5vIGJyaWRn
ZSBkcml2ZXIuDQo+IA0KPiBPbiAyMC8xMS8yMDI0IDA3OjE4LCBrZWl0aCB6aGFvIHdyb3RlOg0K
PiA+ICsJLyogVW5tdXRlIGhvdHBsdWcgaW50ZXJydXB0ICovDQo+ID4gKwloZG1pX21vZGIoaGRt
aSwgSERNSV9TVEFUVVMsIG1fTUFTS19JTlRfSE9UUExVRywNCj4gPiArdl9NQVNLX0lOVF9IT1RQ
TFVHKDEpKTsNCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGhk
bWktPmRldiwgaXJxLCBpbm5vX2hkbWlfaGFyZGlycSwNCj4gPiArCQkJCQlpbm5vX2hkbWlfaXJx
LCBJUlFGX1NIQVJFRCwNCj4gPiArCQkJCQlkZXZfbmFtZShoZG1pLT5kZXYpLCBoZG1pKTsNCj4g
PiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoaW5ub19oZG1p
X2JpbmQpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiS2VpdGggWmhhbyA8a2VpdGh6aGFv
QHN0YXJmaXZldGVjaC5jb20+Iik7DQo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiSU5OTyBIRE1J
IHRyYW5zbWl0dGVyIGRyaXZlciIpOw0KPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7IE1PRFVM
RV9BTElBUygicGxhdGZvcm06aW5uby1oZG1pIik7DQo+IA0KPiBZb3Ugc2hvdWxkIG5vdCBuZWVk
IE1PRFVMRV9BTElBUygpIGluIG5vcm1hbCBjYXNlcy4gSWYgeW91IG5lZWQgaXQsIHVzdWFsbHkg
aXQNCj4gbWVhbnMgeW91ciBkZXZpY2UgSUQgdGFibGUgaXMgd3JvbmcgKGUuZy4gbWlzc2VzIGVp
dGhlciBlbnRyaWVzIG9yDQo+IE1PRFVMRV9ERVZJQ0VfVEFCTEUoKSkuIE1PRFVMRV9BTElBUygp
IGlzIG5vdCBhIHN1YnN0aXR1dGUgZm9yIGluY29tcGxldGUNCj4gSUQgdGFibGUuDQo+IA0KVGhh
bmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24hIA0KSSB3aWxsIHJldmlldyB0aGUgZGV2aWNlIElE
IHRhYmxlIHRvIGVuc3VyZSBpdHMgY29tcGxldGVuZXNzIA0KYW5kIGF2b2lkIHVzaW5nIE1PRFVM
RV9BTElBUygpLg0KDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
