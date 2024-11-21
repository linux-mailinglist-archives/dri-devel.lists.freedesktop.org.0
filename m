Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA109D4A39
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A4B10E8CE;
	Thu, 21 Nov 2024 09:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0381910E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 09:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPcZXLzSXjz52fWavcUUZYztiRbldBrx/pcjX7DLlFQKLKC85bUwtaYaxSvdhUcWUKZh7JGd8/GbuRG98YsK4yo6pUtTqgGvCYbltp2M3qlk61/mMUfXiKJDaYQm4Z2I8W9VNpyIVxw0eoatxAwP696pJ2l5P69H6vbvxuxlEmSjraoAEeagceagxvoAmxBwifzDKNOKz0n+QxrfCoUVAcgSSl8KnYM0ibw3jMWGqxJoSvLqQxT8GUXViLfcjP+/oRYiPACPrvymaTHuXmp437jfBQC2iZZEQwcg5CRSc4s7x45Ws9Gdv8SoGM6sk/yYNzIK40n6r0I3ai7mHIh1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhOcB2CCCEvEWQeZ5vooAbhLHjqiMRKijwNPh0X0Phw=;
 b=DoWjvmj0grfbq510KefrIqlqxeTTZr1aEjxytranoa2Rg80y3kAHKkT8v6ATgrN88Xkk9XhKzRTy+7Ud7K0g44G0+V1AKbURtXxlEvVz/KUb+uaMAIpChcuoaVuYBj+IVSccIi51K4EfgMi9vXDPN5eHfiZ6TNZ6Vv5dP7caHkym+7r468IR857+UIb5S2jKGGRPIgv9Nof5IzWxYzVD5/d5yICK0rE3QjcHGdOJwgwyTUL053iCd7HbMMHfr/kCDGfWV7krLZNS8dlcM/hUCY82Mntkd0TAemtp55YJsMfYiTNaT7LcG3dJPmtd2jOo7LYQdIXi58NnlO0QST81LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB0988.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.31; Thu, 21 Nov
 2024 09:52:05 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Thu, 21 Nov 2024 09:52:05 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
Subject: RE: [PATCH v5 1/9] dt-bindings: display: bindings for starfive, JH7110
 display pipeline
Thread-Topic: [PATCH v5 1/9] dt-bindings: display: bindings for
 starfive,JH7110 display pipeline
Thread-Index: AQHbOxRFFLKYPidskECS0hN3ZbYuBbLBZwGAgAAM1oA=
Date: Thu, 21 Nov 2024 09:52:05 +0000
Message-ID: <NTZPR01MB10509AE97BDC01764FB1222BEE22A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-2-keith.zhao@starfivetech.com>
 <fza6u77alzm6ovzptkh7isztycn72pzae2f62kqeyj3f7ognou@lmp7cg4tr3yw>
In-Reply-To: <fza6u77alzm6ovzptkh7isztycn72pzae2f62kqeyj3f7ognou@lmp7cg4tr3yw>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB0988:EE_
x-ms-office365-filtering-correlation-id: f56f6a9e-ef47-45de-c8db-08dd0a122821
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|41320700013|366016|38070700018; 
x-microsoft-antispam-message-info: OZRSCktvOItKIxknYdfTo/LEu+4Rwa6Pu86OQXQfI1lcdbFlTHFRqtYwqkKha79PQaSMAUj87zaIH77VkROsIlL1sM1jMFQgrGTzbyjfN3cHpC0dkZ0nRhen/ni63VVbyKOOda4Er3lOYvQ161agAiWXJZpAeDYmM5JjpTzDlhr+idEHXNeaf6EGtHt8qDxVZbN6F0swLjxEWQW5C87rRM7CPZ6NiadnAZ28hl0oxfcMH1uVBJvCXUH4XsCETim85Gep6bOoczpbQ2v7BdbAFAgGQklvhqx2DT6fHbGwWk7kfIneuUoylwud97JsxJ8RpfsijLv3WAE2Uybo9m+BA76r5E8cUeEKHN6qHB+C2GTX5aSh7ts4rEC5r6SG8N7fDTp0HYZ3aCMSrmtE61QtFp8/9KB6xYCOVZGvc2jGk95Hb7xbJg0hfEcU0npZNO273tVz2TDrTSe6WNNvDJ1ASo1J0bbZbkaHpgeKf4AssIq7fAa4ppmMADhg8zxPJ3ux/bjEjJA4YXsuUGummuq3gvwLTv5VHj7/yj++JARJM5UKsu/aw7kccJx4mUV/w/OaSXj/sFWoqlcFNjg9jxtwn0F5MmOGzs7xQL77ugHrw6zPwC+V2gMlECbnLRhB4Px/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUN4cjRqK25heEVwS1RzcE9vRnB6aWlYR3Y5SlBSd3FEZEY0STc0SE0wVnpy?=
 =?utf-8?B?dU14K2huYStQbG92c05NSHhFR2FGSG1lR0ttQkZBbXlDN0FvU0txUFh3ZzMv?=
 =?utf-8?B?Q0JEMXNMLzFjNHgyTmlkZ1lTOUlmZVBaaFp5ekF6Q3dIUGlNMDFwSVVXTk9p?=
 =?utf-8?B?dkY0ai9TWjhyT1hWc2xXNURIVmxJUWcxVFlYUGdKb0U0NEZnM2FCMWFQSHRY?=
 =?utf-8?B?aXZCWjArVmd5S0d4Z09mWHFMeUVlUFkvMXVqZFkrOWdKemN6NTNmalJQRFlH?=
 =?utf-8?B?Z21OTVlaV1VzcjVpeENlVmp3bEdXSnQyRE80V1E0SHh4eXdxZElzbXlncDZW?=
 =?utf-8?B?WnZLaHJHMERpK1drZnFyaG8wRHFlMXJzRXp4VFFwYUJqMjNLckFaNWZ5Vnpq?=
 =?utf-8?B?K1hadUxMYWFWeDZhc0hDcG02SVRCOXExZVVyNkw2ZmJISGdpVXdWaE85UTVX?=
 =?utf-8?B?eHlKYlRzellnUTMydmlkWkFINXRyc3VxNWdjR1pQMG9nYm9ybUdUdXY2S0dO?=
 =?utf-8?B?SjN4MHRNVk5JNUh3cFhvOXBhbVVIUDMwYVZFOUZYeldkaE8wY0c5R1ZvY2JL?=
 =?utf-8?B?bTZOZ3FKSVlMZHN1TGlnM3dycTFXYzhlRXBOdlF2cEROYjFiQm96cy84NnZj?=
 =?utf-8?B?V21XaVdPRlNmOWV0VGljbGZIdEVCblZsUUdSOVNiLzZuc3lxWGpKZk9jMktZ?=
 =?utf-8?B?c3VYMFdFVTBMYUV3TUNHS0xwY1E5bm03WWlUSFdGbW9Ea1U4Vm1TMEVtaXFU?=
 =?utf-8?B?eDh0N3V2SWl3UUdSM0dSUmh2bktZWEhGV2FqaVJ3YVBteCs4ZEFRNUI4SU5L?=
 =?utf-8?B?Y2pxY1ZELzd6ZXpkaW15eGhYVkhsSytscTNXcUowTW9BRDlGajJDeThrQmJp?=
 =?utf-8?B?VHc4UEJJbjVOTkxoSDQ5RjA0TFpuVFIrc05PS1RKeW9EODVZbXdFTlQ1RXlz?=
 =?utf-8?B?bUFpc210WHI2YmFlSlVxM2ZEQisrMEhVMnJHRnovb0ZYWitFVmlLczE0UTdJ?=
 =?utf-8?B?OEtweEJqeitTdUhYZVdXcEpYRFU1U3E1c2k4ZG5CZlA3MzZYNW9oK3pXTWda?=
 =?utf-8?B?UXY3YmdNSEp0b21yZUwzWWt2RjdtWXBLRVhJeG5uYW45ZkxUNjJ2UVMzdUNz?=
 =?utf-8?B?ZmROMzZPanMrdUZReER4VG8wN2x3ZE5aVmo5TnFHZVdtRSt3RzJxZFJRdHln?=
 =?utf-8?B?b25LRU40dTVtVklyR3p4TkFnalNGanNyTkpjWDZLb01tWkZCR3Y3eWpqanh3?=
 =?utf-8?B?RlhNQk5HWU01MVk5LzIyeXo2ZUVJU2NiVHRrMWlnanp3V1FGeGFIQ1FOaDhw?=
 =?utf-8?B?bUt6SVJUczdhdlEzNzdPanFmSHZSaG9GK04ydy9nOXhBY0pMelRFcnFvK1ho?=
 =?utf-8?B?VTVJa003U0hpdWpnckFiSk5QQzROakxmRlE0QTdZYUtzMEpodCsyVW40OEcx?=
 =?utf-8?B?TkcyU252eGxuemxOdUlpN3JiMWQ0ZlNsdlpDZWhTdDBaLzREeWFsZHA5VVhx?=
 =?utf-8?B?Q1hzWWtvbmZRd3hLNXBienZldEswRjdEczdjTW1nM2ppU3NhakwxWlZzbUts?=
 =?utf-8?B?c3JYa3RYYXQ2MVA5blZrcnNTNG5nOUFRcmRnSXUrTitCbC8valh2TmNkVW5O?=
 =?utf-8?B?UDh0S2dGQlBuTFpRckt1Qnh1Skg2MTNCdjRmcVlnaW9HMW5nUWFRMkdJTzlO?=
 =?utf-8?B?ZWQxTFJyL0EyYm5ENHBZdGNtU0NtK2lGeVdaV3RlV040V2VrNXBodTl4ckFz?=
 =?utf-8?B?Mlloc3o0OG9zZnRoR0xpTU91eW4zYjdWeWhuZDMyY0NvWTlaVHNFRllNWEp0?=
 =?utf-8?B?S0d4amhFeGZ1clFrNFpTZ2VvckU0Rk1DWlVWUzJaYzc1ZSt5QkgwVUhGeE91?=
 =?utf-8?B?UVNwa0hWOFVRQ1pPbDNqcjZ4YkJsbXFxakZXUEg4TCtiUXZoajJPalViMmx1?=
 =?utf-8?B?bzRiemIrVnRWVGhVb2o3Q0g2Ry8xWHZ4N1orai9vUWY5NDRmWUVjZVI4QWh0?=
 =?utf-8?B?cU9rWE1iNk5qZDhHblBCYk16QmJpOGYwNWlzMVdwdHNGbFAyNTJqRjgzNitZ?=
 =?utf-8?B?VUIyOGwybStqdDBsYzJnaWh4SnFkVDlWYkdaSGZ4QnoxUDdXRTZMVnk2ejVp?=
 =?utf-8?Q?RXrcgPl4S4OVGyLVrwbyeFyiA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: f56f6a9e-ef47-45de-c8db-08dd0a122821
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 09:52:05.5409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFyjgV7VAoJkKamufcrkH98B/nHA2Q2k/3H1o9i2o+3VD8SJ4kNwL3ruCUOueoFccVmls1nyec8IrRYXcvINFPVscklWdkR57ci1X6vtMJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0988
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
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI05bm0MTHmnIgyMeaXpSAxNjoyMw0K
PiBUbzogS2VpdGggWmhhbyA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPiBDYzogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBy
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
UmU6IFtQQVRDSCB2NSAxLzldIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBiaW5kaW5ncyBmb3Igc3Rh
cmZpdmUsSkg3MTEwDQo+IGRpc3BsYXkgcGlwZWxpbmUNCj4gDQo+IE9uIFdlZCwgTm92IDIwLCAy
MDI0IGF0IDAyOjE4OjQwUE0gKzA4MDAsIGtlaXRoIHpoYW8gd3JvdGU6DQo+ID4gLSBBZGRlZCBi
aW5kaW5ncyB0byBzdXBwb3J0IHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBvbiB0aGUgSkg3MTEwIFNv
Qy4NCj4gDQo+IFBsZWFzZSBkbyBub3QgdXNlICJUaGlzIGNvbW1pdC9wYXRjaC9jaGFuZ2UiIChp
bXBsaWVkKSBhbmQgcGFzdCB0ZW5zZSwgYnV0DQo+IGltcGVyYXRpdmUgbW9vZC4gU2VlIGxvbmdl
ciBleHBsYW5hdGlvbiBoZXJlOg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4xNy4xL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGkNCj4gbmctcGF0Y2hl
cy5yc3QjTDk1DQo+IA0KPiA+DQo+ID4gLSBJbmNsdWRlZCB0aGUgREM4MjAwIGRpc3BsYXkgY29u
dHJvbGxlciBhbmQgSW5ubyBIRE1JIGNvbnRyb2xsZXIuDQo+ID4NCj4gPiAtIENyZWF0ZWQgaW5u
b3NpbGljb24saW5uby1oZG1pLnlhbWwgc2NoZW1hIGNvbnRhaW5pbmcgY29tbW9uIHByb3BlcnRp
ZXMNCj4gPiAgIGZvciB0aGUgSW5ubyBEZXNpZ25XYXJlIEhETUkgVFggY29udHJvbGxlci4NCj4g
PiAgIFRoaXMgaXNuJ3QgYSBmdWxsIGRldmljZSB0cmVlIGJpbmRpbmcgc3BlY2lmaWNhdGlvbiwN
Cj4gPiAgIGJ1dCBpcyBpbnRlbmRlZCB0byBiZSByZWZlcmVuY2VkIGJ5IHBsYXRmb3JtLXNwZWNp
ZmljIGJpbmRpbmdzDQo+ID4gICBmb3IgdGhlIElQIGNvcmUuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBrZWl0aCB6aGFvIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gLS0tDQo+
ID4gIC4uLi9kaXNwbGF5L2JyaWRnZS9pbm5vc2lsaWNvbixpbm5vLWhkbWkueWFtbCB8ICA0NSAr
KysrKw0KPiA+IC4uLi9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLGlubm8taGRtaS55YW1sICB8
ICAyNyArLS0NCj4gPiAgLi4uL3N0YXJmaXZlL3N0YXJmaXZlLGpoNzExMC1kYzgyMDAueWFtbCAg
ICAgIHwgMTc2ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vc3RhcmZpdmUvc3RhcmZpdmUs
amg3MTEwLWlubm8taGRtaS55YW1sICAgfCAgOTEgKysrKysrKysrDQo+ID4gIC4uLi9zb2Mvc3Rh
cmZpdmUvc3RhcmZpdmUsamg3MTEwLXN5c2Nvbi55YW1sICB8ICAgMSArDQo+IA0KPiBJIGRvIG5v
dCBzZWUgaG93IHlvdSBhZGRyZXNzZWQgbXkgZmVlZGJhY2suIEkgYXNrZWQgeW91IHRvIHNwbGl0
IHRoZSBwYXRjaC4NCj4gV2hlcmUgaXMgdGhlIHNwbGl0Pw0KDQpPaCBzb3JyeSwgSSBoYWQgYSBi
aXQgb2YgYSBtaXN1bmRlcnN0YW5kaW5nIGhlcmUgYmVmb3JlLg0KIllvdXIgcGF0Y2ggaXMgZGlm
ZmljdWx0IHRvIHJldmlldy4gU3BsaXQgY2hhbmdpbmcgZXhpc3RpbmcgYmluZGluZ3MgKGFuZCBk
ZWZpbmluZyBjb21tb24gcGFydCkgdG8gYSBzZXBhcmF0ZSBwYXRjaC4iDQouLi4uLi4NClNwbGl0
IGNoYW5naW5nIGV4aXN0aW5nIGJpbmRpbmdzIChhbmQgZGVmaW5pbmcgY29tbW9uIHBhcnQpIHRv
IGEgc2VwYXJhdGUgImJpbmRpbmdzIi4gDQouLi4uLi4uDQoNCg0KPiANCj4gWW91ciBhbnN3ZXIg
dG8gbXkgcmVxdWVzdCB0byBzcGxpdCB3YXMgIkJhY2tncm91bmQgaXMgLi4uIiwgeWVhaCwgc28g
d2hhdD8gWW91DQo+IGFyZSBub3QgZ29pbmcgdG8gc3BsaXQ/DQo+IA0KQmFzZWQgb24gdGhlIG1p
c3VuZGVyc3RhbmRpbmcgb2YgdGhpcyBpZGVhLCBpdCBsZWQgdG8gbm90IHNwbGl0dGluZyB0aGUg
cGF0Y2ggdGhpcyB0aW1lLiBOb3cgSSB1bmRlcnN0YW5kLg0KV2lsbCBzcGxpdCBpdCAuDQo+IA0K
PiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDgg
Kw0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDMyMyBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkgIGNyZWF0ZSBtb2RlDQo+ID4gMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2lubm9zaWxpY29uLGlubm8taGRtaQ0KPiA+IC55YW1s
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9zdGFyZml2ZS9zdGFyZml2ZSxqaDcxMTAtZGM4DQo+ID4gMjAwLnlhbWwgIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N0YXJmaXZlL3N0YXJmaXZlLGpoNzExMC1pbm4NCj4gPiBvLWhkbWkueWFtbA0KPiA+
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2lubm9zaWxpY29uLGlubm8taGQNCj4gPiBtaS55YW1sDQo+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaW5ub3NpbGlj
b24saW5uby1oZA0KPiA+IG1pLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uZjI1NDNhZWJjMzEyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pbm5v
c2lsaWNvbixpbm4NCj4gPiArKysgby1oZG1pLnlhbWwNCj4gPiBAQCAtMCwwICsxLDQ1IEBADQo+
ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xh
dXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvaW5ub3NpbGljb24saW5uby1oZG1pLnlhDQo+
ID4gK21sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBDb21tb24gUHJvcGVydGllcyBmb3IgSW5u
b3NpbGljb24gSERNSSBUWCBJUA0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBr
ZWl0aCB6aGFvIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gKw0KPiA+ICtkZXNj
cmlwdGlvbjogfA0KPiANCj4gRG8gbm90IG5lZWQgJ3wnIHVubGVzcyB5b3UgbmVlZCB0byBwcmVz
ZXJ2ZSBmb3JtYXR0aW5nLg0KPiANCkkgd2lsbCByZW1vdmUgdGhlICd8JyBzaW5jZSBpdCdzIG5v
dCBuZWNlc3NhcnkgZm9yIHByZXNlcnZpbmcgZm9ybWF0dGluZy4NCkFuZCBoZXJlIGlzIHRoZSBy
ZWFzb24gd2h5IGFkZCAnfCcgYmVmb3JlLiANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjEyL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2Uvc3lub3BzeXMsZHctaGRtaS55YW1sI0wxMg0KDQo+IA0KPiANCj4gPiArICBJbm5v
c2lsaWNvbiBIRE1JIFRYIGlzIGFuIEhETUkgdHJhbnNtaXNzaW9uIGRldmljZSBpbnRlZ3JhdGVk
IGludG8gdGhlDQo+IHphcCBTb0MuDQo+IA0KPiBLZWVwIGFuZCBleHRlbmQuDQpPayANCj4gDQo+
ID4gKyAgVGhpcyBkb2N1bWVudCBzcGVjaWZpZXMgdGhlIGRldmljZSB0cmVlIHByb3BlcnRpZXMg
Zm9yIHRoZSBJTk5PIEhETUkgSVANCj4gY29yZS4NCj4gDQo+IEtlZXAuLi4gYnV0IHdoYXQgaXMg
SU5OTyBIRE1JIElQIGNvcmU/IEFub3RoZXIgbmFtZT8gRGlmZmVyZW50IGJsb2NrPw0KPiANCj4g
DQo+ID4gKyAgSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVmZXJlbmNlZCBieSBwbGF0Zm9ybS1zcGVj
aWZpYyBkZXZpY2UgdHJlZQ0KPiA+ICsgYmluZGluZ3MsICB3aGljaCB3aWxsIGRldGVybWluZSB0
aGUgbmVjZXNzaXR5IG9mIGVhY2ggcHJvcGVydHkuDQo+IA0KPiBOb3QgbXVjaCBpbXByb3ZlZCBo
ZXJlLiBMYXN0IHR3byBzZW50ZW5jZXMgYXJlIGFsbW9zdCB1c2VsZXNzLiBBZ2FpbiAtDQo+IGRv
Y3VtZW50IHRoZSBoYXJkd2FyZS4gRHJvcCB0aGlzIHNlbnRlbmNlLg0KPiANCj4gSSBhbHJlYWR5
IGNvbXBsYWluZWQgYWJvdXQgdGhpcy4gSSBhbHJlYWR5IGNvbXBsYWluZWQgdGhhdCB5b3Uga2Vl
cCBpZ25vcmluZyBteQ0KPiBjb21tZW50cyBhbmQgdGhpcyBkb2VzIG5vdCBpbXByb3ZlIG11Y2gu
DQo+IA0KPiBTaW5jZSB5b3UgZGlkIG5vdCBpbXBsZW1lbnQgbXkgbWFpbiBmZWVkYmFjayBJIGFt
IGdvaW5nIHRvIE5BSyB0aGUgcmVzdA0KPiBleGNlcHQgb25lIG1vcmUgdGhpbmc6DQoNCkkgYXBw
cmVjaWF0ZSB5b3VyIHBhdGllbmNlLCANCkkgd2lsbCBub3QgcmVmZXIgdG8gdGhlIGV4aXN0aW5n
IFlBTUwgZmlsZXMgaW4gdGhlIG1haW4gYnJhbmNoIGZvciB3cml0aW5nIGFueW1vcmU7IA0KSSB3
aWxsIG9ubHkgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbnMNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjEyL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2Uvc3lub3BzeXMsZHctaGRtaS55YW1sI0wxOA0KDQo+IA0KDQo+IC4uLg0K
PiANCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAg
IGNvbnN0OiAic3RhcmZpdmUsamg3MTEwLWlubm8taGRtaSINCj4gDQo+IEkgY291bGQgbm90IGJl
IG1vcmUgc3BlY2lmaWMgaW4gbXkgcHJldmlvdXMgZmVlZGJhY2suIEltcHJvdmVtZW50cz8gTm8u
DQo+IFN0b3Agd2FzdGluZyBvdXIgdGltZS4NCj4gDQpUaGlzIG1vZGlmaWNhdGlvbiB3YXMgb3Zl
cmxvb2tlZCB3aGVuIG1lcmdpbmcsIHNvcnJ5IGFnYWluLiBUaGFuayB5b3UgZm9yIHlvdXIgZmVl
ZGJhY2suIA0KPiBOQUsuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
