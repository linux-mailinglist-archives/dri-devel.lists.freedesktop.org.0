Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF488142DD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 08:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC34C10E1F5;
	Fri, 15 Dec 2023 07:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B69910E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 07:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/LXgOKvviuvJ3VPzHjfxdK4+M+w0TglR/L/z2PwjKVwGJVSLd2gXF1asNIBjSFQIck0HpHVTDf2+U+dNZ5HwCRewmnlhhmBogyHMPhaujY0vNNNvTRHrLXFclsO+GJxjO2EjQq9siuvTRV55939I5XvycZAjDK06G0Oz67skYVSwc1c3HXTgxRBPV2dRM8wa9Fmuud/9gaD7cV4PFJ2eyboD2pMRW56rSiW6ZadCxYcfVJbebkd/0m1cIKwtmxC4tRXmRhHaQ7dN+WOj06Oj8AX0cN4dZTyzArId6KhwJI5u2Q3zFDJNQFitSqmX7Syvs/Rk6y7dwIkV7mQbIOsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xEceD3arD9/8Xc6yV7Hyyk6/ZvL/YB6i9WpaytDqzg=;
 b=dKAqYyKU82jG42ytNnMcwZayp6PQsorA05uGgDM75nqn5C5cvww7ve47mp4QNUnmla9T1du3BKqO82hDSPNbcr91NpB6rDVpPw92lPjk7gHQXg2DGGup7ql9eHsPyNP/7eU0WFuOgz6LdPSEiqLh3PdehgfGkSN6QZMcYsPbfnL0fg66jGq1jrdD8bko3ckHMXHXtL2DcF1tzU12bGwcN40lTHEacfP56FVJF7wc9wqzBEXOsHpnKtn8fCxkGeWjrFlw2GK8wjBc2kknnmVGBdk9ygT2k2SIWcx6UeDF3AemmAMrDhsxHSo9D1aHh7xAwXPjhYVRHa48NU1o9hHtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xEceD3arD9/8Xc6yV7Hyyk6/ZvL/YB6i9WpaytDqzg=;
 b=kEBkY+xRv8Rq650mMIMVTZhbAfijTyHoJoL2fgl+JYu0ox4p1qS102xmsDOtY0CcKSFT6JaUrpvx99Wvwn+TeXNhHk5edb1772sLSKH4ZYMGGeMWq2M3PMTCdg97MLCxK8r0r3AtnzZkSsGhMsuBEffD7QWQ8J8VLbTd+UbIXIc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9421.jpnprd01.prod.outlook.com
 (2603:1096:400:1a3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 07:47:10 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 07:47:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAIbOgIAAt8VA
Date: Fri, 15 Dec 2023 07:47:07 +0000
Message-ID: <TYCPR01MB11269E2263C8D2A14F94CE50F8693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
In-Reply-To: <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9421:EE_
x-ms-office365-filtering-correlation-id: aa40d135-474f-453e-dbf4-08dbfd4209bb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxTUxV+mUqTuuOe++lIWFStIfAVEOd3bw601l8PD1Ohsh/8NE4QO1rV3BedasF2eBBRoaNlsGQmVomeqVEjPbAnd1KJGs7/azE/eEm8UMAF9O8A7bcQ3h6HDHgA0kNKbA0ouY0dCYTZxHEjLCENQD5Gu2+UNFo846dzJLsW/a+jCKmCTQ1MFKXP6fG1T5kuJE3vovcN86hoTl6dC+6YsvEDFGNHK7lJ+jRzT/jtap+UBZHjeFYkvr9j1+ynNJ6OXQhX1InAg+1qs/TmWTtoRIdHantCZRbOmAXVYE8OzBm9TXIvYBJ+0RGRsUjZJXv1tuHypXX97ahql0ASqDbYb7X+S62Lb7SSPUc2QwSr2VHFXZwYq0lfBg5tIh6Zd+cUeaD5f1HxHnMesR1uo80YehcVSM3Da90nibALMGy/c8vyhdAe8FL8VHdXPffHnS/km9eIMRw85clTl8wh6hlpxq64V41RWjO4hoe8GL+ZHIunA39n5XjRGySf+bUxLI5CTmWlpGp98DQfmOINvwNyNwEbkOClYBWU4DEow7s+FuK18JC7S/+gY1DH8LiONFHKODAylfd60N3VHhFifZPc4CHmavB1aPbh4RV+ads9H8Xd12+3VwUlIJbDMObPaq1WH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(5660300002)(7416002)(52536014)(4326008)(41300700001)(2906002)(478600001)(8676002)(8936002)(76116006)(66946007)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(33656002)(86362001)(122000001)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3VTN0FaYkZ2Y0cwcXYwSnhkd1NVeUN3QTRxRkhESzUwdTZYNmE3Y3pXT0lE?=
 =?utf-8?B?eTVyZU4yZ0kvSy9wektWNUFIcm1QZmtHNGF3MEdaaUJhVWp1T1MxVGEvMTZO?=
 =?utf-8?B?NyszQjYxS2kxUnRuei84MjdzRnU1L3kwNVM0Q3N4SjNVOTRGVjBROS9qUnFL?=
 =?utf-8?B?aFZvRU15UlBMQm5QS25NUnNwWWo1dkhNaHc4YmpObjBMZ2ZGQkE3V28wZEpo?=
 =?utf-8?B?N0k2aGFsdnR0dGhhemkrcFBpeXpUclBpcU8yakw5T1VSSVdMNHE2UlEzbFdF?=
 =?utf-8?B?WHR6ZVhkWjlNcVo3SFNUUy9ZNFdWUCsrczVFV1lRTXBOZVEyUk0vQlJvM05I?=
 =?utf-8?B?bzcyTkJLN0xoUkZjYUg2UytLclJHSVY0djFHQ1U0VFlVaGoxTTdua0kyVTRQ?=
 =?utf-8?B?b1lVYklHOXFaV1pzQnhoR0ZYZDNPdHlOOEpVNVZGQ2UzdVVyQzVXMGpvM2U1?=
 =?utf-8?B?TzNYRVJhVTlDTlRTREJlVkU2NlMzQSttUkJLeU1uSENJNGR5elg4QzYzcnN1?=
 =?utf-8?B?UTdUM25ianltYytIOE1GRHphYXNsVmkrQy8zUnJ5VWt2YlVaRlNqTlI3Skln?=
 =?utf-8?B?NVBpTWEyOC9jRXZ0eE1jUHNvZTJPSUxuSHFxREhTazMzY2ZyeGpiSjRMWlVl?=
 =?utf-8?B?OWlTdXR0U1lmSlBQSWtyWXZ0WWxCODRaMFQ1M0ZVSUF6b3U3aHpoaDczUWZQ?=
 =?utf-8?B?WFFTamc4OWNyWFRBdnUxNEhNbzBHZXNFMXB1NW9BZTUzdWxHb0hCd0VBNzAr?=
 =?utf-8?B?V2hteTUvWVd1c00wZm1PM2ZJTkJaOGExNGVVRG54VExhR3JTaGpxWjZ4RGNT?=
 =?utf-8?B?Y0oxc0wvYW95cjhNazhhZkkwM0g2dThNV1hBQ0tCMGt6TDBNSmswb0o0bGxv?=
 =?utf-8?B?NFNpeUV5TXVTUVR3bkVKcU5NRUw0QS9ZYlV2TTIzZXNXRktyTnlHemRaWitl?=
 =?utf-8?B?UlFCU1V0ZlptdXNTbVo5SnR1S1lLYVlGbjl5VTh6Q1VmTSsvWHZhRzU5eCtR?=
 =?utf-8?B?dDdOSTNqMktUQ1c4YzB5SkcrOGwvb2l0a1F2ZEduekdFMzJNN2E2T0NpUzla?=
 =?utf-8?B?Y29oR1l0UStjY1NhY2ltZng0UGJtejBkM1ZRcG81S0h0VFQrSjBOUXJtSUlz?=
 =?utf-8?B?b0xzNmtGU0RWdVNUS3gwNUhLNUM0Sk5oWWNtTC9ubENMNGxqbXFobXpWRVZu?=
 =?utf-8?B?UisxZWZ0VG9qdmtkTVRBT1lyQ3o3Um9ncUNEdWloaGpFRDVaemtzUmh0NjM0?=
 =?utf-8?B?ZnpiRTF0dHVlTHhBSVIwclJSQ1ovZE9YK29mOHFKL2VQT2l6WllPOXdBUDc1?=
 =?utf-8?B?MTIwVEMvbzJ0blFpdWVBL3ZibVU4ZXZPM2JYT2NFa01lek1FbHp6UFNXWFBW?=
 =?utf-8?B?dGEvOW5NUGgySUV0ZWRGY2VQWUp5RVdLa2xkRDRWL3MxMVFUbWVpc2J3TGJm?=
 =?utf-8?B?WVFwdm9GUXNvNmwybjZkd1BTcmJBcDBZOTZXWVhNanBBME9tczlnRmxXT0dN?=
 =?utf-8?B?TDZnVnlFTmYvMFlUdEVLdEl4Mlp0a3ZFaVBkUjMyMW5FQVBqeitpNkxJa3Bq?=
 =?utf-8?B?cXZZKzhLTkNTZzRIS3RLSXl4MUtaTUtsNlJpYU9DNTY3R0p6SEltWmxiOFNJ?=
 =?utf-8?B?cDN3Y0daUDB6M1V5cEdsenVrTWpLWC9ZWE91LzVHT0F4OEkzQ2hyT213Y0tG?=
 =?utf-8?B?RUIvbDFxN280V1ltNitEU0krcitYY041d3ZrZFNmZGlEQThqWk5pMDNhSXJC?=
 =?utf-8?B?ckJFajg0MkQrbnU5QVBYVjZ2Y3NZUFZkdW1tdTVLK2hmc29HQkVLdUpSNnNa?=
 =?utf-8?B?NVlxbHBnL1FPR1FIS2I2NzhLYUFleWNFU3ZBV0pOWTc2anY4OUlHV2tNeXFW?=
 =?utf-8?B?UG9MQnlHTkpJT3pUNHQ3R2hmQy96bXVGemRjOEs0Tks0S1E4Y3VlR3NEMGY3?=
 =?utf-8?B?L1hSY0hoa242NU5wbkg5NnU0dlhieG54TG9yV21tWWc3cjdsOHVMd0NxQjVJ?=
 =?utf-8?B?S1JSOGNRYjNhNXNXcHpiblVjQlNxVGxTZEkwWTlGeGxIZitUb2xaY05VaHpR?=
 =?utf-8?B?cGQrUVpuSklGaytpdG9qZXJ4bkd1U21CSmtNNkNkenEvbmJNbEtSVkJVNWJx?=
 =?utf-8?B?VmFvMTBOMW0rUlpBQlNHLzRva3VwV09OdXhkRlRsM1FUWmhOYWU0WnZsMlp3?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa40d135-474f-453e-dbf4-08dbfd4209bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 07:47:07.5506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4k0pMYWFI2cABalYWrh1VNTxXVYiCRqXX0Xuidua2TlQMp0s7ZzCt8wFIRL7SPa+SIGR4OUSDHajeUexKcwP0azNfgsNuAqdgKWX4DfCnjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9421
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lIFJpcGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBCaWp1IERhcw0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTQsIDIwMjMgODo1MCBQTQ0K
PiBTdWJqZWN0OiBSRTogW1BBVENIIHYxNSAzLzVdIGRybTogcmVuZXNhczogQWRkIFJaL0cyTCBE
VSBTdXBwb3J0DQo+IA0KPiBIaSBNYXhpbWUgUmlwYXJkLA0KPiANCj4gDQo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBCaWp1IERhcw0KPiA+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciAxNCwgMjAyMyAzOjI0IFBNDQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2MTUg
My81XSBkcm06IHJlbmVzYXM6IEFkZCBSWi9HMkwgRFUgU3VwcG9ydA0KPiA+DQo+ID4gPg0KPiA+
ID4gPiArDQo+ID4gPiA+ICsJZm9yIChpID0gMDsgaSA8IG51bV9wbGFuZXM7ICsraSkgew0KPiA+
ID4gPiArCQllbnVtIGRybV9wbGFuZV90eXBlIHR5cGUgPSBpIDwgbnVtX2NydGNzDQo+ID4gPiA+
ICsJCQkJCSA/IERSTV9QTEFORV9UWVBFX1BSSU1BUlkNCj4gPiA+ID4gKwkJCQkJIDogRFJNX1BM
QU5FX1RZUEVfT1ZFUkxBWTsNCj4gPiA+ID4gKwkJc3RydWN0IHJ6ZzJsX2R1X3ZzcF9wbGFuZSAq
cGxhbmUgPSAmdnNwLT5wbGFuZXNbaV07DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJcGxhbmUtPnZz
cCA9IHZzcDsNCj4gPiA+ID4gKwkJcGxhbmUtPmluZGV4ID0gaTsNCj4gPiA+ID4gKwkJcmV0ID0g
ZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KCZyY2R1LT5kZGV2LCAmcGxhbmUtDQo+ID5wbGFuZSwN
Cj4gPiA+ID4gKwkJCQkJICAgICAgIGNydGNzLA0KPiAmcnpnMmxfZHVfdnNwX3BsYW5lX2Z1bmNz
LA0KPiA+ID4gPiArCQkJCQkgICAgICAgcnpnMmxfZHVfdnNwX2Zvcm1hdHMsDQo+ID4gPiA+ICsN
Cj4gQVJSQVlfU0laRShyemcybF9kdV92c3BfZm9ybWF0cyksDQo+ID4gPiA+ICsJCQkJCSAgICAg
ICBOVUxMLCB0eXBlLCBOVUxMKTsNCj4gPiA+ID4gKwkJaWYgKHJldCA8IDApDQo+ID4gPiA+ICsJ
CQlyZXR1cm4gcmV0Ow0KPiA+ID4NCj4gPiA+IHlvdSBuZWVkIHRvIHVzZSBkcm1tIHZhcmlhbnQg
aGVyZSB0b28uDQo+ID4NCj4gPiBJIGRpZCByZWJhc2VkIHRvIGxhdGVzdCBkcm1fbWlzY19uZXh0
IGFuZCBJIGRvbid0IGZpbmQgdGhlDQo+ID4gZHJtbV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpDQo+
ID4NCj4gPiBDYW4geW91IHBsZWFzZSBwb2ludCBtZSB0byB0aGUgQVBJPw0KPiANCj4gV2UgY2Fu
bm90IHVzZSBkcm1tX3VuaXZlcnNhbF9wbGFuZV9hbGxvYygpIGluIHRoaXMgYXJjaGl0ZWN0dXJl
Lg0KPiANCj4gcnpnMmxfZHVfdnNwc19pbml0KCkgc3RvcmVzIHRoZSBWU1AgcG9pbnRlciBhbmQg
cGlwZSBpbmRleCBmcm9tIERUIGZpcnN0Lg0KPiANCj4gVGhlbiBhbGwgdGhlIHBsYW5lcyBhcmUg
Y3JlYXRlZCB1c2luZyByemcybF9kdV92c3BfaW5pdCgpDQo+IA0KPiBDUlRDIHVzZXMgVlNQIHBv
aW50ZXIgYW5kIHBpcGVfaW5kZXggdG8gc2V0IHRoZQ0KPiBwbGFuZShyemcybF9kdV9jcnRjX2Ny
ZWF0ZSgpKS4NCj4gDQo+IENSVEMtPnZzcC0+cGxhbmVzW3JjcnRjLT52c3BfcGlwZV0ucGxhbmUN
Cj4gDQoNClRoaW5raW5nIGFnYWluLCBpdCBpcyBwb3NzaWJsZSB0byB1c2UgZHJtbV91bml2ZXJz
YWxfcGxhbmVfYWxsb2MoKSBoZXJlDQoNCkludHJvZHVjZSBhIGxpbmtlZCBsaXN0IFsxXSBhbmQg
dXNlIGFuIEFQSSBbMl0gdG8gcmV0cmlldmUgcGxhbmUNCmJ5IG1hdGNoaW5nIHZzcF9waXBlIGlu
ZGV4IGFnYWluc3QgcGxhbmUtPmluZGV4Lg0KDQpXaXRoIHRoaXMgd2UgZG9uJ3QgbmVlZCBkcm1t
X2tjYWxsb2MoKSBhbnkgbW9yZS4NCg0KSSB3aWxsIGltcGxlbWVudCBhbmQgdGVzdCB0aGlzIGFu
ZCBzZW5kIHYxNiwgaWYgdGhlcmUgYXJlIG5vIGNvbW1lbnRzLg0KDQoNClsxXQ0Kc3RydWN0IHJ6
ZzJsX2R1X3ZzcF9wbGFuZSB7DQoJc3RydWN0IGRybV9wbGFuZSBwbGFuZTsNCglzdHJ1Y3Qgcnpn
MmxfZHVfdnNwICp2c3A7DQoJdW5zaWduZWQgaW50IGluZGV4Ow0KCXN0cnVjdCByemcybF9kdV92
c3BfcGxhbmUgKm5leHQ7DQp9Ow0KDQpbMl0NCnN0cnVjdCBkcm1fcGxhbmUgKnJ6ZzJsX2R1X3Zz
cF9nZXRfZHJtX3BsYW5lKHN0cnVjdCByemcybF9kdV9jcnRjICpjcnRjLA0KCQkJCQkgdW5zaWdu
ZWQgaW50IHBpcGVfaW5kZXgpOw0KDQoNCkNoZWVycywNCkJpanUNCg==
