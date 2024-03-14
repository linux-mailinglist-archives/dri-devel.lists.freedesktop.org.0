Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470E87B73F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 06:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951810F4B0;
	Thu, 14 Mar 2024 05:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ABeaYarB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="c1xsmqKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3DB10F469
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 05:20:13 +0000 (UTC)
X-UUID: 84f08606e1c211ee935d6952f98a51a9-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tGab3COrtIAoBhOwKhrdLkTdMXozpm80dSeTAcEChC8=; 
 b=ABeaYarBCdKybpc/qLdoosdzVnD6HA59k8IU94EJcV7wKZD7y9DT8yBrF4RSKk0YXY7amHlzOqDwRo18gAUnxQSJ26qGWtqwg1ajKX1T0KTiusVu6V2QD3If3CTmPzP5fNsNSWsugTeRnG6lKwyjXrejBIKWEZ8BzXzZYVZGKkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:e27c88f4-b913-4d52-82c0-0728bf3c49d3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:9d206390-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 84f08606e1c211ee935d6952f98a51a9-20240314
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1009919820; Thu, 14 Mar 2024 13:20:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 13:20:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 13:20:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHf0Htcg360+PL7lhUu0EBIqKBkkeaK+eOUcIZodLLyjrO/OQQ2GU33LCdJaqTmvZxLItGuKgcBAdYoK2BVrto9Lxk4XMaAj7Cb7XdoBn4n7o5UXqSxJxUVR60LyEJiZMlcedoZyFv1vtL4Y/sqz9Ot/1mijsGPe+izGVx0KoYrRAPBIgJVub/7iWKDq6EttM888MBNPt0b03DHbJ5i51TA5QFCoNkqpk8iCsIh87EDSBiXkM65VcCFnMdpGaOdaZPEdOu+wDM5NX0D0Clgjsi/ShfCXw5D4biUIKUzzNVDZGqpXztfQ8ieYrCe810CubpWRqTylfC+ioihdjVmvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=je43hGm3bwrW1gJ+THEl/S7y03vXNgpd7d2fkuzeeE8=;
 b=LU5vd9QROgtW/cvxsfjIzNCxZyIo0n5t8AqNJQBvFTaVN97StbLGlnluZVsQUH+4krHX8VFL8iydGDrWoshnbRf98x8URenQofR7IoHiP5TaVhvog6ZS/5oV2K2gYFSnZY1Rr9+UNaxi9SZd40Nl5VvyyM++cnpEo6+bE/0hlLOmH64+L+KQXgu6qH9Um9nJbKqSW2o54gQ4W8utp83tqUST1RbxTxdzRW12l5YR0Nxps6gLzQ9QpMf+SYi7+dnFepwKO03a4+VEzRScRrYiQtDpQyY1fIOMZAMvrBCfTLu0IwucQtxuoqbJYj9Z9M3lRZMGJPxRLZEpxh9Li5mLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=je43hGm3bwrW1gJ+THEl/S7y03vXNgpd7d2fkuzeeE8=;
 b=c1xsmqKWrdG3lGi1uy9ZZqTv/YAOH5V84NV6UNMFaCB0Y6SgrJCBu9RDpy7USYOCStpw9aeCGXX4mN8VccBVA+ausAqJ58apszEEHBt72rkEWGewzxG/ZOhjBMfvjhsgbi4jQ2gNX3Z6+02RQEFI4kGLhS7v9C6F5gFCJWZbvBc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8284.apcprd03.prod.outlook.com (2603:1096:405:1f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 05:20:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7362.031; Thu, 14 Mar 2024
 05:20:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH 03/11] drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
Thread-Topic: [PATCH 03/11] drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
Thread-Index: AQHaaJEaYcFrYaXMPUaYetOo/s2SJLE2zWUA
Date: Thu, 14 Mar 2024 05:20:03 +0000
Message-ID: <9da7a26fa7cbed3db16e18fca483eabe1f70c9ed.camel@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-4-shawn.sung@mediatek.com>
In-Reply-To: <20240226085059.26850-4-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8284:EE_
x-ms-office365-filtering-correlation-id: cbcb8ed1-66e3-4c72-bb71-08dc43e6671b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aI1uC3J6dqT8CTDoBD4gddXAGnwwrKH+yRhmlkcMzZnLHgsFU22dCFkKCo5DXGI3uMv7LLnAAB6aiKIPYk74MXDBtJ3UIJ0HIJQ3ZOOLwMfrQXZgu/lDMlCXEsesoZjs52kxb27CmiuuN3KMKuxv3qrdRe4tuNnmI+RhHerR3mUSlhb6Jv8Y+/7tSjeGrW4TcaT1BasTrEIcrQ0mhn/Orc+5MNVIGkESxV+f6rH6iCXNTALRoEl9MslUlDt0AIBjsWUmyidX62Tg/4n9ymiyaC2KpMqFesKPBXqNqwZDyotmwSgeMgG3OngVanal6w0hLy/COBtSIzY2SiuRBflzpRjQX26w2+1UekepX8BE5gyoFEdANBE5cVmgXkYZH9wq43GPk7x9rwO6OOKLT029UIHbD9sA+pOKBOTT8KtsrayO+3OjcIhK95nbLP0pcvpEAv3V76O0X0OpxO5Xw8SKOJw5mRBSW9yEk5Xi9q+/s5vGJcRnqgUYf2QMo907EZunrn+zpKHxAcQT+G4Y5VlolJgFAJliLdLrSKWuL6tbCW6roQbasCa5/zyh234GFf9c5oi8e4SJLz8Y3WHf7788+JBIuLDqyqdywOTxE7uhArEOS/ZAShshlpN48LdpQpm0WYbgt5Ce/Exmm/4tFtW34VILexrjrGTja12FWqjuu7erao+AbyHw/QaTj0xMIkRkVIXXm2hJOOqnz6gxd+J12+sKy5L0lJFUaVMY8uldK/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnYzcWdmZXlEei9ONmlDZDQ0aEZrTWZtazUrcE1vYXE4NVVqNEJMNE9FT3JW?=
 =?utf-8?B?MWxCTk9wL1ZuSXplK3RsVE5WUHNTSWdFZGQzZVpzWWtKY3R3NTZuWjk1eDF3?=
 =?utf-8?B?NHB4UEQrNHhCR2plRTVsekF1bEhIcGRpRkd2NXdEMXNpNTVMV0lyRzVhb1NH?=
 =?utf-8?B?OU5Db2hzUE96Uk1vSEFzdkpBbHpGaTRVcVlZc3p4OUNmM09rbmxFSVhaYzRl?=
 =?utf-8?B?UTkyN01ld1lQdk9xNkNac0Fsb0R3MGE2Vk1rdExNclg2ckJyakxWM1JiWWU5?=
 =?utf-8?B?a1czT29IVFFFY1RBanpzTFRicWhOeFI1WktieDhkWW1SUWpNek1KZG9GZVZo?=
 =?utf-8?B?Z0tiekNDR1czeGJnRTVOM2NaVi9ZL2JkeEtUMkRHK09QdklDTVZYaVdNM2l3?=
 =?utf-8?B?ZDBKdGtYZnRDUVJHY2FtWGxia1hsVC91dVlLVWVqS2ZrRkk2eEdVR3AxbDRM?=
 =?utf-8?B?b2Z2UUJJMTJ5SjNwaDdXdzc4bHF6UlU1TFB4S1JNeWNwTVJ0TGpaQ1NUOVhF?=
 =?utf-8?B?S3k0UEVDeXpLMzZuSWFlWW5tUWRyckdjZ1NIZ2RSdXQ1NWM3WDZvM3RKcUhT?=
 =?utf-8?B?Y2VNazFWNUVVeGNBbVI0WUhyK0x0VWNKUlprdzNVR3R2cjlVZTk5b2s5MG5u?=
 =?utf-8?B?RHpEdk5QOW5MY0FiNVg0bzVHMisyZnRnenh4OHg2UU5LVk1vbyt4TExYY2lB?=
 =?utf-8?B?N3NISDduaVYzRVcwYVY2NlBNb0ZvdVZGbkp2WlY3UENPWkdhTHQ1RGduN2NY?=
 =?utf-8?B?VTBjaVZhbjNRQnBVZFFibHF0T1J1WVlxUGVYVzc1anpRRFVGTnBUa3M4aThZ?=
 =?utf-8?B?d0dHaGhpVWRjWkVtOGpZSFNiT2ZCUDFsVllxbW1rRTlTSkdMNVdqVnZJbGRZ?=
 =?utf-8?B?Q3hKMzV3TXN0aUdiaTllcll6K2o0aDFMVXdJaURHMlZ6eTFmTUFsNHQ0bDRk?=
 =?utf-8?B?V3pHbXlLWFAxcUY2K3Fma1F1WnB4VXUwS09XMEQxYWNZMVRZNytVZXBOcnlk?=
 =?utf-8?B?V3ZiZGpwaHF2RGtYQWh0aVlBSGRXVnNkZi9zc0lacU9jUkxmL3Uwc3NZU0JG?=
 =?utf-8?B?YVZLZmJnTUtiSyttcVUrSTlIVGxaUVVEVFVzQTY2ckluR2Z4TlpKM1lIa1py?=
 =?utf-8?B?SWdBQWcvc0daTEZzWStjbmFaWGQxVG9NamduTXljTWVacE9MRnlvN0duSjZK?=
 =?utf-8?B?TjB1YVdnNXc3b21kd2theW9wRVhnSjhuZ3NxNWZSQ2pmYTZHbUVJR2I2Zmsr?=
 =?utf-8?B?b2Y4NllCclhhWnJYRlFlWmpDMUx6eFZTWWUxQnB0L2xVNkc3SWcveGZ3Tlhz?=
 =?utf-8?B?cm85ekZTOUZSQ3o0QzNkNTNVSDVpc1hPeWo1cXpUaHhsalU5M1gvM1VxbkZH?=
 =?utf-8?B?UTQ2TlVmQnpFbHhscE54bTJ1djRqbXRNN3psWVFkT200aXB4WnZHZWJ4dHFG?=
 =?utf-8?B?UzZ3Qk5HVUFQbGxGUmp2SzVNTG55WExmR3Zaa2V0TkhOc2h2RTJseXZRdGxj?=
 =?utf-8?B?dkZDUHpYYlVacXk1SkdhNjdzbkllUjJtY290Y3loSlMvenV5cURaMm4rT0Zw?=
 =?utf-8?B?NkhYdm1nd0xOTCtxNVdTeEFyNmdTMU0yRHFzQmdiRGZncEJCaE5oN1lPTkZs?=
 =?utf-8?B?VlZWK2JNYUdVbHdtalR1RzlVd0taWDZQQ3g5WE0rSzhnUzlQTThHcnZhaEtJ?=
 =?utf-8?B?a2wyejNucGJTelVIZnA3Uytid3c1d3ZZQVRkekVTR05yTWVQK21oM0tvR2JS?=
 =?utf-8?B?Qk9KeG1jNzVMMTM1bk1ibjFtUW14OUp6SjVycThGREJvb2NWSnluWEVpdjc5?=
 =?utf-8?B?czRmeGRkWHk2SkRqV1kwVWxQVWFCRFBzNVZLOGxjRzc3YWtNMWRueUJrNmZU?=
 =?utf-8?B?RHZGb3NhakIybXFxNFJSdDN4djAyaXI0MWF6R2JaQUZzdVVGa1ZQMjRjMXgv?=
 =?utf-8?B?OVZJQldjaSt4OXZZamlOTWpua3lVQktpWXBxY1pURnkvaksvdEVsSm96a0N0?=
 =?utf-8?B?ak14cG4rbnVvd1p5ZGIzdkhreUE3amYvczkwUjZiU1RERmFmRC9UQ2hSUEJt?=
 =?utf-8?B?c3gyRGtVUGo2U0ZrenMvYkJORzQ2N3JhODRoZ1ZnaS9GTjBXZnpYb1RxaHQ5?=
 =?utf-8?Q?Gb9Gm4WrL7gsMq0qn69K7WQ5e?=
Content-ID: <44089815EA922E40BE65820F08ACB657@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcb8ed1-66e3-4c72-bb71-08dc43e6671b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 05:20:03.0971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3AuLjrSQs1oBpDkyzXYHLdRFPMFxVxx807HcQIOkF45P1s+rgD8YM5cdynZLI4kAelMBJqZwsFbQBiBsbo4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8284
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_2129293765.1639372031"
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

--__=_Part_Boundary_005_2129293765.1639372031
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBNb24sIDIwMjQtMDItMjYgYXQgMTY6NTAgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgYWxsICJtdGtfZHJtX3BsYW5l
IiB0byAibXRrX3BsYW5lIjoNCj4gLSBUbyBhbGlnbiB0aGUgbmFtaW5nIHJ1bGUNCj4gLSBUbyBy
ZWR1Y2UgdGhlIGNvZGUgc2l6ZQ0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXdu
LnN1bmdAbWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyB8IDYgKysrLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oIHwgNCArKy0tDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBpbmRleCBjYmRiNzA2NzdkMzAuLjQz
MTM3YzQ2ZmMxNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFu
ZS5jDQo+IEBAIC05Myw4ICs5Myw4IEBAIHN0YXRpYyBib29sIG10a19wbGFuZV9mb3JtYXRfbW9k
X3N1cHBvcnRlZChzdHJ1Y3QNCj4gZHJtX3BsYW5lICpwbGFuZSwNCj4gIAlyZXR1cm4gdHJ1ZTsN
Cj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgbXRrX2RybV9wbGFuZV9kZXN0cm95X3N0YXRlKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAtCQkJCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpz
dGF0ZSkNCj4gK3N0YXRpYyB2b2lkIG10a19wbGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLA0KPiArCQkJCSAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkN
Cj4gIHsNCj4gIAlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lfc3RhdGUoc3RhdGUp
Ow0KPiAgCWtmcmVlKHRvX210a19wbGFuZV9zdGF0ZShzdGF0ZSkpOw0KPiBAQCAtMjQxLDcgKzI0
MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzDQo+IG10a19wbGFuZV9m
dW5jcyA9IHsNCj4gIAkuZGVzdHJveSA9IGRybV9wbGFuZV9jbGVhbnVwLA0KPiAgCS5yZXNldCA9
IG10a19wbGFuZV9yZXNldCwNCj4gIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IG10a19wbGFu
ZV9kdXBsaWNhdGVfc3RhdGUsDQo+IC0JLmF0b21pY19kZXN0cm95X3N0YXRlID0gbXRrX2RybV9w
bGFuZV9kZXN0cm95X3N0YXRlLA0KPiArCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IG10a19wbGFu
ZV9kZXN0cm95X3N0YXRlLA0KPiAgCS5mb3JtYXRfbW9kX3N1cHBvcnRlZCA9IG10a19wbGFuZV9m
b3JtYXRfbW9kX3N1cHBvcnRlZCwNCj4gIH07DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5oDQo+IGluZGV4IDk5YWZmN2RhMDgzMS4uMjMxYmI3YWFjOTQ3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmgNCj4gQEAg
LTQsOCArNCw4IEBADQo+ICAgKiBBdXRob3I6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+
ICAgKi8NCj4gIA0KPiAtI2lmbmRlZiBfTVRLX0RSTV9QTEFORV9IXw0KPiAtI2RlZmluZSBfTVRL
X0RSTV9QTEFORV9IXw0KPiArI2lmbmRlZiBfTVRLX1BMQU5FX0hfDQo+ICsjZGVmaW5lIF9NVEtf
UExBTkVfSF8NCj4gIA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPiAgI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+DQo=

--__=_Part_Boundary_005_2129293765.1639372031
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMDItMjYmIzMyO2F0JiMzMjsxNjo1MCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjthbGwmIzMyOyZxdW90O210a19kcm1fcGxh
bmUmcXVvdDsmIzMyO3RvJiMzMjsmcXVvdDttdGtfcGxhbmUmcXVvdDs6DQomZ3Q7JiMzMjstJiMz
MjtUbyYjMzI7YWxpZ24mIzMyO3RoZSYjMzI7bmFtaW5nJiMzMjtydWxlDQomZ3Q7JiMzMjstJiMz
MjtUbyYjMzI7cmVkdWNlJiMzMjt0aGUmIzMyO2NvZGUmIzMyO3NpemUNCg0KUmV2aWV3ZWQtYnk6
JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYj
MzI7Jmx0Ow0KJmd0OyYjMzI7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xl
LmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jJiMzMjt8JiMzMjs2JiMzMjsrKystLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuaCYjMzI7fCYjMzI7NCYj
MzI7KystLQ0KJmd0OyYjMzI7JiMzMjsyJiMzMjtmaWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMy
O2luc2VydGlvbnMoKyksJiMzMjs1JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
cGxhbmUuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFu
ZS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7Y2JkYjcwNjc3ZDMwLi40MzEzN2M0NmZjMTQmIzMyOzEw
MDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X3BsYW5lLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9wbGFuZS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTkzLDgmIzMyOys5Myw4JiMzMjtAQCYjMzI7
c3RhdGljJiMzMjtib29sJiMzMjttdGtfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWQoc3RydWN0
DQomZ3Q7JiMzMjtkcm1fcGxhbmUmIzMyOypwbGFuZSwNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMz
Mjt0cnVlOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LXN0YXRp
YyYjMzI7dm9pZCYjMzI7bXRrX2RybV9wbGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdCYjMzI7ZHJt
X3BsYW5lJiMzMjsqcGxhbmUsDQomZ3Q7JiMzMjstc3RydWN0JiMzMjtkcm1fcGxhbmVfc3RhdGUm
IzMyOypzdGF0ZSkNCiZndDsmIzMyOytzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19wbGFuZV9kZXN0
cm95X3N0YXRlKHN0cnVjdCYjMzI7ZHJtX3BsYW5lJiMzMjsqcGxhbmUsDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RybV9wbGFuZV9zdGF0ZSYjMzI7KnN0YXRlKQ0K
Jmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO19fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVf
ZGVzdHJveV9zdGF0ZShzdGF0ZSk7DQomZ3Q7JiMzMjsmIzMyO2tmcmVlKHRvX210a19wbGFuZV9z
dGF0ZShzdGF0ZSkpOw0KJmd0OyYjMzI7QEAmIzMyOy0yNDEsNyYjMzI7KzI0MSw3JiMzMjtAQCYj
MzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtkcm1fcGxhbmVfZnVuY3MNCiZndDsm
IzMyO210a19wbGFuZV9mdW5jcyYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsuZGVzdHJveSYj
MzI7PSYjMzI7ZHJtX3BsYW5lX2NsZWFudXAsDQomZ3Q7JiMzMjsmIzMyOy5yZXNldCYjMzI7PSYj
MzI7bXRrX3BsYW5lX3Jlc2V0LA0KJmd0OyYjMzI7JiMzMjsuYXRvbWljX2R1cGxpY2F0ZV9zdGF0
ZSYjMzI7PSYjMzI7bXRrX3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZSwNCiZndDsmIzMyOy0uYXRvbWlj
X2Rlc3Ryb3lfc3RhdGUmIzMyOz0mIzMyO210a19kcm1fcGxhbmVfZGVzdHJveV9zdGF0ZSwNCiZn
dDsmIzMyOysuYXRvbWljX2Rlc3Ryb3lfc3RhdGUmIzMyOz0mIzMyO210a19wbGFuZV9kZXN0cm95
X3N0YXRlLA0KJmd0OyYjMzI7JiMzMjsuZm9ybWF0X21vZF9zdXBwb3J0ZWQmIzMyOz0mIzMyO210
a19wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZCwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5oDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX3BsYW5lLmgNCiZndDsmIzMyO2luZGV4JiMzMjs5OWFmZjdkYTA4MzEuLjIzMWJi
N2FhYzk0NyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fcGxhbmUuaA0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmgNCiZndDsmIzMyO0BAJiMzMjstNCw4JiMzMjsrNCw4
JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyO0F1dGhvcjomIzMyO0NLJiMzMjtIdSYj
MzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyYjMzI7JiMzMjsqLw0KJmd0
OyYjMzI7JiMzMjsNCiZndDsmIzMyOy0jaWZuZGVmJiMzMjtfTVRLX0RSTV9QTEFORV9IXw0KJmd0
OyYjMzI7LSNkZWZpbmUmIzMyO19NVEtfRFJNX1BMQU5FX0hfDQomZ3Q7JiMzMjsrI2lmbmRlZiYj
MzI7X01US19QTEFORV9IXw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO19NVEtfUExBTkVfSF8NCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7ZHJtL2RybV9jcnRj
LmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvdHlwZXMuaCZndDsN
Cg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
PioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRo
aXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpk
aXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBU
aGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_2129293765.1639372031--

