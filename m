Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473746C45F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046610E8C6;
	Wed, 22 Mar 2023 09:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB610E8C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1Ap/sZb7VaZJZJ2BW0rsT//+K7GgDqzsCjUbSgPZa50FCFmZ+qT4VsN+KhKTLD2TegdiflVNZM2nKwRRqBcHqFb81aARtgjYChliW6wD8UxQJvs1jk0nTR8Uta3R2YV7AC6Ddz5XqxaHo1e8bg1lLKXKiq1iKGBNn6Ep81EQS6rdAtTx+MAerO9Dt8QGpZ7LcZKX9peHehYPZrDWsQ8GnPFPl0doPq8Scs6NCP+aIETSJJFdUVmnWXeLu79a/QOYyVQfFd7RRVO4uzYoNIUc+rz+1vyCqWC/7kcn9if7VipUB2A1hBmuyWaJ1e7Dh0SzxXSEXx+7+Ctj6b5oUhvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ajxnTBBNXVbxqg6dW+05pOgZ9pJhoNdKThD7b9LZ5k=;
 b=By0jPGoH42WuqprldgL4lzK5gbTWCR6FdB1LcHJ+NolY2Azs18xhCJCeph5ZjboXrEtaqa69Q55nmHXIPutEjeLj5ELpjDfjt/C+7LmgfWTiVaoGXBAiN+5R4q5dZ0F6Et7x8+Bwf/tj1fMQjIKpcwV/pnRCAqcXSdjYD3nZ8okZrEFrfPg2Q0y++TwRd0UJNZ4qSb8dt1i5SgC6/jnRtej7KIQUbKWRr5SR2ev7qzIqA142tZ86e2zjohiIQVHUoEN0SEmuQUv/xQpMtlWtQAYV1JPONvCQf6KUJW9r9PpZtMXfdR66lwSaZv9n9ch1futJq5RAqPCRon9K2xbZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ajxnTBBNXVbxqg6dW+05pOgZ9pJhoNdKThD7b9LZ5k=;
 b=ZKjWol2T+Vofhc1ZD6Bbfhs1RW1Q6BtqcgUWjo3b4DCicbSM2rRVv09CV/vEc157hyJHMStE0Tt+0KI3bnPnoxg09b2ZNiHUfUgLKnqZb2t/b2FoIqYkBsdEpxgFY9aYXD8hQcjahxRGOkxhE+ULpMPMTDIfc83TnF2BFcX9pUw=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by PAWPR04MB10005.eurprd04.prod.outlook.com (2603:10a6:102:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:14:58 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:14:58 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: RE: [PATCH] backlight: pwm_bl: Disable PWM on shutdown and suspend
 disabled PWM emiting inactive state")
Thread-Topic: [PATCH] backlight: pwm_bl: Disable PWM on shutdown and suspend
 disabled PWM emiting inactive state")
Thread-Index: AQHZXJuBqX6ThIV36kGpqxCOispUwa8Ggnmw
Date: Wed, 22 Mar 2023 09:14:58 +0000
Message-ID: <DB9PR04MB8477D4BBF1B31035789DA08680869@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
 <DB9PR04MB8477FD24740251860648786380869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322085129.jxxz55tbcxkc6usd@pengutronix.de>
In-Reply-To: <20230322085129.jxxz55tbcxkc6usd@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8477:EE_|PAWPR04MB10005:EE_
x-ms-office365-filtering-correlation-id: 63a50a71-ce09-478c-39fb-08db2ab5e89a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iQAEkMFmqpAfnMPe143/VsfyDVp2c3Sfi2oivGtSYoEVBBze41w/jigfCXygOHWR528ZmR3tXRTUYC+wwHIm8YgPpSU8xbtqMmyYFqwMD47UNmA58P6EohSHsV8NF8IZWQ6YGVxWbVfus4EWc9to+YXOOPXEEJdewGRqioIxy0ANIts4WOf4k2ilVrrvCxMommFW5x75ah0p8R/aZM9J7g1L2QBOSe3RMCUcAOAhAVZlNJwexzXuaokk36RwsZJ0y3xQ1z5/kmsixIvQMtWTXHCPcu2U1k+lp7AoedMBS3UR9t0MtjWhziLG0RqIn3C2mTKbvQIBsDBwtsLlawrdtS+mHzcDg0qULb0LY8YoWGTgWDqWeFF8KfwCE7Hy1vAvhV57vUOiWN003O9AQVUWAh4HUTcRFvfA2AbBzqJkNx2MKgCGHNr9sM5qCrzT31mobYIb3S108YcRZ6XaBiXhv/gAVrczEjNvPHj+qktWsmrNC3oFzszqA7+QFOb/3L3zKdEhtnY/gFDC7igC9TRE7NiIBIkn5zkXXp61JWpuKqfr7j4pTxELWW3iQ2YPu/OIPA9GJouWXkhjDgL4omCuOFsyk0f82NPqEOnYfQmO5S/UENzoZRVN2cr7WMV+fhub1ySE7QorWFi5POnO6FiiX2jKVqnu4UzGdDKnEovR4VSjISUrZWpWlv64KtcAaqBy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB8477.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(186003)(9686003)(66574015)(7696005)(966005)(478600001)(26005)(6506007)(83380400001)(54906003)(71200400001)(8676002)(316002)(66556008)(66446008)(66476007)(64756008)(66946007)(76116006)(6916009)(52536014)(8936002)(7416002)(5660300002)(41300700001)(122000001)(4326008)(2906002)(38100700002)(15650500001)(55016003)(86362001)(33656002)(38070700005)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2dpNEtnSlZsNWhSMXFXVTN2bnhmeU5mZllpMEN0UG5TNi8wbGVydkZzcnhB?=
 =?utf-8?B?TlVucWdvRGFldTg1M2c4bis0aEUrWkthc0FrSDBiaFJ5amxueGVQQUt3N29z?=
 =?utf-8?B?akpYK1laU3k5ZGZLVlRxMXl1QUpDc0tXZjdZd01qNXNjSUNuTkVkTDdOaGwx?=
 =?utf-8?B?ZndNbkpnZmd0aFNOL1FyK1dsQVBVWmw4VEZjQXV6cTdIbVNqL2tyWENjREVk?=
 =?utf-8?B?a0YwdWpTb1djWTV2TTc2RXlBK2RudFhaRzI4OGM1S0M3b01rdUVDTTBVYlI5?=
 =?utf-8?B?bGs0R3pQeUZxZ2ErcFZhaGZiZW1DL2lWUkc3UENtRXh5RmZQaThxaVhLdktw?=
 =?utf-8?B?aE1HY0YrVDM1MVpMN0gzV3RTWnNZVG9iTnBEUEhVRGFPTjJFaGJudFVRcU1V?=
 =?utf-8?B?NU9qNXJzWDNERTRTZlNlcmsyTkFCOVB3Z1J4Ryt2NmlSeEdtcmdubGk4ejd4?=
 =?utf-8?B?TEJ4ZWdYbjRwb1BPbGNzMUNVRU51VGc4Z3RaQzd5b3ZpYkUveWErVWN1Zk5S?=
 =?utf-8?B?c1lUSjI3QUhhVEJuM0QzaVQ5VGFyV1FBRUF2ZnY3Ni9tRGUvd05jSitNNEwr?=
 =?utf-8?B?ZEdPVzIrbjVpaXUxUit2Qi9LdFBuRmM1Nk9tR3pGMWo4cHJEalpvMmxMb3Rq?=
 =?utf-8?B?OFRHcTkvZDlJSy8zd3dvOW1oangrc2JNMHNGdkpLdUNrQlJFSHQ5Rk16Y0dT?=
 =?utf-8?B?RFVhWXlPaXVybEU2MlRVYUVCNTFFVXRYOFZUOHZKN2M5ZHp0eGgzcE9RbGZO?=
 =?utf-8?B?WXV5SVFxUVVKZnZBeVZoMmxqTlZ0SXhsV1ZYRzFEdGFtd25paExoQzdzUkQz?=
 =?utf-8?B?S3pvdWgrajl2OGlpNU03MUxRdTNXREtndjFkMmVvUVIzcEw4RjdVYUhXVmhy?=
 =?utf-8?B?ZHBSNlYwK1Vsd2FDMnlNdk1jRjhoNjMwZDFQb2o1M1g1THFxSjNISzE2T1Zz?=
 =?utf-8?B?WmQ2MncrcVZYU24xUFVFRXpjRzFsb21ycXZsZUJiSDNRNUlyWlZhbVdZMW9n?=
 =?utf-8?B?M0FPYXB6dTFGbElUZ1VRdVhMUCthbjltdXFjdGFmZS9pM3Q1RFhQRGd5dzJs?=
 =?utf-8?B?eS9zSmpVcVFSaC9YVktEdmRBd0YrR2ZuUnh4bzZ3RkR5SkFyL2J4MmxoSjBC?=
 =?utf-8?B?d1BaM0ZLaytLUklkRkR1eFB6QVdkQVhzQWV3V3E0aDJORDdoZXJzdXdvMTdN?=
 =?utf-8?B?ZHBlc0tzZ0FUVjgyeS9EV2craHlQclNYTXVib3F5aThOdnAzVDFKN1dwNnkw?=
 =?utf-8?B?dUZ2eXRRNDlJTkhUbmVxZWR0OS9GMmdDK0E5b3MwMGlmUzQ3d1ZES1FuOGMv?=
 =?utf-8?B?TjJldUY2VVVlRzRiSlJxTXFxdU9xVnB5SFk1VCtjRkRLSlFLNVlrRU1ndlgw?=
 =?utf-8?B?c09ZVWxwckRxWlBQYlZ6eTFWczBLOFkwZmJNcC9HdG5BVjhndUtuM1ZORmc1?=
 =?utf-8?B?ckE5NVV2cno1cno4MHJteVRuM096alAxdWEyTjUzWEY0WkJ0MDRiS3lrZU14?=
 =?utf-8?B?YmNHTXFvL1RhY3cxaGF2QkhGZDJPYnZIQkM4UjkxbVR6c3ZEeUxITi94MThp?=
 =?utf-8?B?TzdRUm4vckV1WUkzOFg3VStnd3BsdUpOUjQ2VmhRZjhKQS9LdzFVa3VFMnJG?=
 =?utf-8?B?YzZaTU1tYkNCNlYyOCtyeGxmNVpuQVlyV25HVnVHTXlkbmU0UUV4cktiTytt?=
 =?utf-8?B?MDByWHFsVy81bDhiSXBaVTVZMU5FQ0p1cHgzM04vQnNiYTZuL3FHaS9ta09M?=
 =?utf-8?B?UTZWVmNJUTdwVFBXT05JdER3alZtMHJkM2Z1QStSR1paVUMxMHpjSTMzOVZU?=
 =?utf-8?B?dzVWanJTa3hvMjh2T21ZenNiYzcvSDYvcEhxbjZwckFxZ2dwdll3Q2FoQnQy?=
 =?utf-8?B?VVM1dEJvS0ozVWJ5ZWxyUzdZbUc4Qk1jR1RrTE40ckxEMW9zUGhPUDdxN0Jo?=
 =?utf-8?B?aGJ4bG1MYmFZUkZ6dlgvNWZnaTh2b0Q2V0plRXhUSjVpcGpEa3V3aGFFZnA3?=
 =?utf-8?B?ZTZkNjlYTjl4ZUptbE1JS3FWZ0VoZmpJUkVmU3JadHZ1T0M4VkdvdjRpMzNj?=
 =?utf-8?B?L2Y4bTlHUGp2TEsxekhLSjFjR1JxUStSMGhtTk9abW9Ya0x5SnFNTFhUY0M0?=
 =?utf-8?Q?Ys992+zZtdS6xiY3++s/YL68v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a50a71-ce09-478c-39fb-08db2ab5e89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 09:14:58.2613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8h/VfLutqdmWDHddtAm5GDu/7olnBHUeHRj6BxcABnY2+wmmLOWhKhoetcUX61bT22H27KUYGch27Zfd4LvLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10005
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 Jacky Bai <ping.bai@nxp.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Ying Liu <victor.liu@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
Pg0KPiBTZW50OiAyMDIz5bm0M+aciDIy5pelIDE2OjUxDQo+IA0KPiBTaW5jZSBjb21taXQgMDBl
N2U2OThiZmYxICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbmZpZ3VyZSBwd20gb25seSBvbmNlDQo+
IHBlciBiYWNrbGlnaHQgdG9nZ2xlIikgY2FsbGluZyBwd21fYmFja2xpZ2h0X3Bvd2VyX29mZigp
IGRvZXNuJ3QgZGlzYWJsZSB0aGUNCj4gUFdNIGFueSBtb3JlLiBIb3dldmVyIHRoaXMgaXMgbmVj
ZXNzYXJ5IHRvIHN1c3BlbmQsIGJlY2F1c2UgUFdNIGRyaXZlcnMNCj4gdXN1YWxseSByZWZ1c2Ug
dG8gc3VzcGVuZCBpZiB0aGV5IGFyZSBzdGlsbCBlbmFibGVkLg0KPiANCj4gQWxzbyBhZGFwdCBz
aHV0ZG93biB0byBkaXNhYmxlIHRoZSBQV00gZm9yIHNpbWlsYXIgcmVhc29ucy4NCj4gDQo+IEZp
eGVzOiAwMGU3ZTY5OGJmZjEgKCJiYWNrbGlnaHQ6IHB3bV9ibDogQ29uZmlndXJlIHB3bSBvbmx5
IG9uY2UgcGVyDQo+IGJhY2tsaWdodCB0b2dnbGUiKQ0KPiBSZXBvcnRlZC1ieTogQWlzaGVuZyBE
b25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KVGhhbmtzIGZvciB0aGUg
cXVpY2sgZml4Lg0KVGVzdGVkLWJ5OiBBaXNoZW5nIERvbmcgPGFzaGVuZy5kb25nQG54cC5jb20+
DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiAtLS0NCj4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQg
MDg6MTA6NTRBTSArMDAwMCwgQWlzaGVuZyBEb25nIHdyb3RlOg0KPiA+ID4gRnJvbTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gPiA+IFNlbnQ6
IDIwMjPlubQz5pyIMjLml6UgMTU6MDQNCj4gPiA+DQo+ID4gPiBIZWxsbywNCj4gPiA+DQo+ID4g
PiBobW0sIHRoZSBzdWJqZWN0IGlzIHdyb25nLCB0aGlzIGlzIGFib3V0IGNvbW1pdCBkZWFlZWRh
MjA1MWYNCj4gPiA+ICgiYmFja2xpZ2h0OiBwd21fYmw6IERvbid0IHJlbHkgb24gYSBkaXNhYmxl
ZCBQV00gZW1pdGluZyBpbmFjdGl2ZQ0KPiA+ID4gc3RhdGUiKSBhbmQgbm90IDAwZTdlNjk4YmZm
MSAoImJhY2tsaWdodDogcHdtX2JsOiBDb25maWd1cmUgcHdtIG9ubHkNCj4gPiA+IG9uY2UgcGVy
IGJhY2tsaWdodCB0b2dnbGUiKS4gSSBmaXhlZCBpdCBhY2NvcmRpbmdseS4NCj4gPg0KPiA+IEkg
anVzdCBkb3VibGUgY2hlY2tlZCB0aGF0IG9ubHkgcmV2ZXJ0IGRlYWVlZGEyMDUxZiBjYW4ndCBm
aXggdGhlIGlzc3VlLg0KPiA+IEkgaGF2ZSB0byByZXZlcnQgMDBlN2U2OThiZmYxIGFzIHdlbGwu
DQo+IA0KPiBBaCwgSSBzZWUsIGJlY2F1c2Ugb2YgMDBlN2U2OThiZmYxIHRoZSBwd20gaXNuJ3Qg
bW9kaWZpZWQgYW55IG1vcmUgaWYgb25seQ0KPiBwd21fYmFja2xpZ2h0X3Bvd2VyX29mZigpIChi
dXQgbm90IHB3bV9iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cygpKSBpcyBjYWxsZWQuDQo+IEJ1dCB0
aGF0IGlzIHdoYXQgdGhlIHN1c3BlbmQgY2FsbGJhY2sgKGFuZCBhbHNvIHNodXRkb3duKSBkb2Vz
Lg0KPiANCj4gPiA+IE9uIFdlZCwgTWFyIDIyLCAyMDIzIGF0IDA1OjEzOjI0QU0gKzAwMDAsIEFp
c2hlbmcgRG9uZyB3cm90ZToNCj4gPiA+ID4gSXQgc2VlbXMgdGhpcyBwYXRjaCBjaGFuZ2VkIHRo
ZSBiZWhhdmlvciBvZiBwd21fYmFja2xpZ2h0X3N1c3BlbmQNCj4gPiA+ID4gYSBsaXR0bGUgYml0
IGluDQo+ID4gPiA+IHB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKCkgdGhhdCBwd20gc3RhdGUga2Vl
cCB1bmNoYW5nZWQgZHVyaW5nDQo+ID4gPiBzdXNwZW5kLg0KPiA+ID4gPiBUaGVuIHB3bV9pbXhf
dHBtX3N1c3BlbmQoKSB3aWxsIHJldHVybiAtRWJ1c3kgZHVlIHRvDQo+ID4gPiB0cG0tPmVuYWJs
ZV9jb3VudCA+IDAuDQo+ID4gPiA+IFdhcyB0aGlzIGludGVuZGVkIGJlaGF2aW9yPyBTaG91bGQg
d2UgZml4IHB3bSBjb3JlIG9yIHRoZSBkcml2ZXI/DQo+ID4gPg0KPiA+ID4gQSBJIHNlZS4gVGhl
IHByb2JsZW0gaXMgdGhlIGNvbWJpbmF0aW9uIG9mIHRoZSBmb2xsb3dpbmcgZmFjdHM6DQo+ID4g
Pg0KPiA+ID4gIC0gU29tZSBQV01zIGRvbid0IGVtaXQgYSBjb25zdGFudCBpbmFjdGl2ZSBzaWdu
YWwgd2hlbiBkaXNhYmxlZCwgc28gYQ0KPiA+ID4gICAgY29uc3VtZXIgd2hvIHdhbnRzIGEgY29u
c3RhbnQgaW5hY3RpdmUgc2lnbmFsIG11c3Qgbm90IGRpc2FibGUgdGhlDQo+ID4gPiAgICBQV00u
DQo+ID4gPg0KPiA+ID4gIC0gQSB1c2VkIFBXTSBpcyBzdXBwb3NlZCB0byBiZSBkaXNhYmxlZCBi
eSBpdHMgY29uc3VtZXIgb24gc3VzcGVuZC4NCj4gPiA+ICAgIChUaGlzIGlzIHJpZ2h0IElNSE8g
YmVjYXVzZSBvbiBzdXNwZW5kIHRoZSBQV00gaXMgbGlrZWx5IHRvIHN0b3ANCj4gPiA+ICAgIG9z
Y2lsbGF0aW5nIGFuZCBpZiB0aGUgY29uc3VtZXIgcmVxdWVzdGVkIHNvbWUgb3V0cHV0IHdhdmUg
Zm9ybSBhDQo+ID4gPiAgICBzdXNwZW5kIHVzdWFsbHkgc3RvcHMgdG8gYWRoZXJlIHRvIHRoZSBj
b25zdW1lcidzIHJlcXVlc3QuKQ0KPiA+ID4NCj4gPiA+IFNvIHRoZSBvcHRpb25zIHRvIGZpeCB0
aGlzIGFyZSAoaW4gb3JkZXIgb2YgbXkgcHJlZmVyZW5jZSk6DQo+ID4gPg0KPiA+ID4gIGEpIElt
cHJvdmUgdGhlIGNoZWNrIGluIHRoZSBwd21fYmwgZHJpdmVyIHdoZW4gaXQncyBzYWZlIHRvIGRp
c2FibGUgdGhlDQo+ID4gPiAgICAgUFdNLg0KPiA+ID4NCj4gPiA+ICBiKSBEaXNhYmxlIHRoZSBQ
V00gb24gc3VzcGVuZCBpbiB0aGUgcHdtX2JsIGRyaXZlci4NCj4gPiA+DQo+ID4gPiAgYykgSWYg
dGhlIHB3bS1pbXgtdHBtJ3MgUFdNIG91dHB1dCBpcyBjb25maWd1cmVkIHdpdGggZHV0eV9jeWNs
ZSA9IDANCj4gYW5kDQo+ID4gPiAgICAgaXMga25vd24gbm90IHRvIGNvbnRpbnVlIGRyaXZpbmcg
YSBjb25zdGFudCBpbmFjdGl2ZSBzaWduYWwgb24NCj4gPiA+ICAgICBzdXNwZW5kLCBpdCBtaWdo
dCBjb250aW51ZSB0byBzdXNwZW5kLg0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgYSkgaXMgbm90IHBv
c3NpYmxlIGluIGdlbmVyYWwuIFRvIGRldGVybWluZSB0aGF0OiBXaGljaA0KPiA+ID4gbWFjaGlu
ZSBkbyB5b3UgZXhwZXJpZW5jZSB0aGlzIHJlZ3Jlc3Npb24gb24/DQo+ID4NCj4gPiBJbXg3dWxw
IGV2ay4NCj4gDQo+IE9LLCBzbyBhIGJhY2tsaWdodCB3aXRoIG5laXRoZXIgYW4gZW5hYmxlLWdw
aW8gbm9yIGEgcmVndWxhdG9yLiBTbyB0aGlzIGlzIGENCj4gY29uZmlndXJhdGlvbiB3aGVyZSB0
aGUgUFdNIGlzbid0IGRpc2FibGVkIGFueSBtb3JlIHdoZW4NCj4gYnJpZ2h0bmVzcz0wIGlzIHNl
dC4gSWZmIHRoZSBkcml2ZXIgZW1pdHMgaXRzIGluYWN0aXZlIHN0YXRlIHdoZW4gZGlzYWJsZWQg
KGZvcg0KPiBib3RoIHBvbGFyaXRpZXMpLCBpdCBtaWdodCBkaXNhYmxlIGlmIC5kdXR5X2N5Y2xl
ID0gMCBpcyByZXF1ZXN0ZWQgdG8gc2FmZSBzb21lDQo+IHBvd2VyLg0KPiANCj4gPiA+IGIpIGlz
IHRoZSByaWdodCBvbmUgZnJvbSB0aGUgUFdNIGZyYW1ld29yaydzIFBPVi4gSWYgeW91IGhhdmUg
YSBQV00NCj4gPiA+IGxpa2UNCj4gPiA+IHB3bS1pbXgyNyB0aGF0IG1pZ2h0IHJlc3VsdCBpbiB0
aGUgYmFja2xpZ2h0IGdvaW5nIG9uIG9uIHN1c3BlbmQuDQo+ID4gPiBUaGF0J3MgYmFkLCBidXQg
Y29tcGFyZWQgdG8gdGhlIHByZS1kZWFlZWRhMjA1MWYgc3RhdGUgaXQncyBzdGlsbCBhbg0KPiA+
ID4gaW1wcm92ZW1lbnQgKGFzIHRoZXJlIHRoZSBiYWNrbGlnaHQgd2VudCBvbiBvbiBkaXNhYmxl
ICphbmQqIHN1c3BlbmQpLg0KPiA+ID4gRGVwZW5kaW5nIG9uIHRoZSBtYWNoaW5lIHRoZSBiYWNr
bGlnaHQgbWlnaHQgb3IgbWlnaHQgbm90IGdvIG9mZg0KPiA+ID4gYWdhaW4gbGF0ZXIgd2hlbiBz
dXNwZW5kIHByb2dyZXNzZXMuDQo+ID4gPg0KPiA+DQo+ID4gVGhpcyBzZWVtcyBsaWtlIHRoZSBw
cmV2aW91cyB3b3JraW5nIGJlaGF2aW9yIG9uIG14N3VscCB3aXRob3V0IHRoaXMgcGF0Y2guDQo+
ID4gV291bGQgeW91IGhlbHAgbWFrZSBhIHBhdGNoIHRvIGZpeCBpdD8NCj4gDQo+IFN1cmUuIEkg
ZXhwZWN0IHRoaXMgZml4ZXMgeW91ciBpc3N1ZSwgYnV0IEkgZGlkbid0IHRlc3QgaXQuIFNvIGlm
IHlvdSBnaXZlIGl0IGEgc2hvdA0KPiB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0KPiANCj4gQmVzdCBy
ZWdhcmRzDQo+IFV3ZQ0KPiANCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwg
MTcgKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMNCj4g
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYw0KPiBpbmRleCBmYjM4ODE0OGQ5OGYu
LjU3NzcxNGU0MTY5NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdt
X2JsLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMNCj4gQEAgLTY0
Myw4ICs2NDMsMTMgQEAgc3RhdGljIHZvaWQgcHdtX2JhY2tsaWdodF9zaHV0ZG93bihzdHJ1Y3QN
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpibCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBwd21fYmxfZGF0
YSAqcGIgPSBibF9nZXRfZGF0YShibCk7DQo+ICsJc3RydWN0IHB3bV9zdGF0ZSBzdGF0ZTsNCj4g
DQo+ICAJcHdtX2JhY2tsaWdodF9wb3dlcl9vZmYocGIpOw0KPiArCXB3bV9nZXRfc3RhdGUocGIt
PnB3bSwgJnN0YXRlKTsNCj4gKwlzdGF0ZS5kdXR5X2N5Y2xlID0gMDsNCj4gKwlzdGF0ZS5lbmFi
bGVkID0gZmFsc2U7DQo+ICsJcHdtX2FwcGx5X3N0YXRlKHBiLT5wd20sICZzdGF0ZSk7DQo+ICB9
DQo+IA0KPiAgI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiBAQCAtNjUyLDEyICs2NTcsMjQgQEAg
c3RhdGljIGludCBwd21fYmFja2xpZ2h0X3N1c3BlbmQoc3RydWN0IGRldmljZQ0KPiAqZGV2KSAg
ew0KPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiAgCXN0cnVjdCBwd21fYmxfZGF0YSAqcGIgPSBibF9nZXRfZGF0YShibCk7DQo+ICsJc3Ry
dWN0IHB3bV9zdGF0ZSBzdGF0ZTsNCj4gDQo+ICAJaWYgKHBiLT5ub3RpZnkpDQo+ICAJCXBiLT5u
b3RpZnkocGItPmRldiwgMCk7DQo+IA0KPiAgCXB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHBiKTsN
Cj4gDQo+ICsJLyoNCj4gKwkgKiBOb3RlIHRoYXQgZGlzYWJsaW5nIHRoZSBQV00gZG9lc24ndCBn
dWFyYW50ZWUgdGhhdCB0aGUgb3V0cHV0IHN0YXlzDQo+ICsJICogYXQgaXRzIGluYWN0aXZlIHN0
YXRlLiBIb3dldmVyIHdpdGhvdXQgdGhlIFBXTSBkaXNhYmxlZCwgdGhlIFBXTQ0KPiArCSAqIGRy
aXZlciByZWZ1c2VzIHRvIHN1c3BlbmQuIFNvIGRpc2FibGUgaGVyZSBldmVuIHRob3VnaCB0aGlz
IG1pZ2h0DQo+ICsJICogZW5hYmxlIHRoZSBiYWNrbGlnaHQgb24gcG9vcmx5IGRlc2lnbmVkIGJv
YXJkcy4NCj4gKwkgKi8NCj4gKwlwd21fZ2V0X3N0YXRlKHBiLT5wd20sICZzdGF0ZSk7DQo+ICsJ
c3RhdGUuZHV0eV9jeWNsZSA9IDA7DQo+ICsJc3RhdGUuZW5hYmxlZCA9IGZhbHNlOw0KPiArCXB3
bV9hcHBseV9zdGF0ZShwYi0+cHdtLCAmc3RhdGUpOw0KPiArDQo+ICAJaWYgKHBiLT5ub3RpZnlf
YWZ0ZXIpDQo+ICAJCXBiLT5ub3RpZnlfYWZ0ZXIocGItPmRldiwgMCk7DQo+IA0KPiAtLQ0KPiAy
LjM5LjINCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnDQo+IHwNCj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlv
bnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwNCg==
