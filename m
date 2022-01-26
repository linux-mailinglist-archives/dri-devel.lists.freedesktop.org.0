Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A949C3DF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 07:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEEC10E2A6;
	Wed, 26 Jan 2022 06:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635A210E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 06:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJoljr+58stjfZ5PN587DJCRQWJP71cr+RP9kgTgL++PUDLMOJsRoUS4xhC7DDI3QMj3cvAofCJu/hqdUKuE7pPfc0r9LwxwIhHRP70W8BfSoKMktAQb8gfTpW89mQHZdfFmRwCg0on+o9ZAxcFANeR2APTN09gOwSrpyYP+jzl1F0bnpu0uDRCnnVfWgxhwqqz5HUQ1iunEi+XWr6cSTm1WIHOolJLDsL9n22JeEvL9jTExe1esXYdfa/iVhz23Yjm73Azx53T0L0kGcZBaX7g+C28rNSEHWultBnrzEdAYleP8fSQNoWO7E/7IMLbyZWBZ/nNNYfaKavbAmv78EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP64EFNmGi5z8bOJwCAJiHIgtD11NQvygf2jrzNfFbU=;
 b=gJgfQLopiYiOHHWSm6aLothHOviCjoTsFy/Ez4YsHhiLFKI4LsZOimeoNXMSxdYI7KyOMM4RLOzgH0+PvHi7kKkXruDSpH2hIZtB3KtojS79FOx9Fv+m2EgTzQGIj/AZaoCtcjebVsGoEphiL/8mVz+YXtSP4gwb5TtkSUTCtzarIJ1Nkm8Dxt/sDUkR0kkVjFq/rq30+UJMw/ohazWBFt2i/mYO/JQLKzfc3LViOf6Ol6nofce50GrZCv1rv7LvddB5tGYc5U2PnrJjdOGZk17t5VWDWunXd10GZOIzELJWrE6Ctd0BbScoWWy/fLnY85hCyUWemGnNJ+jS7ANvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP64EFNmGi5z8bOJwCAJiHIgtD11NQvygf2jrzNfFbU=;
 b=ZmnrjFUN8uJM9zxd77td5Uaps6XJKTmm1BwNs9zg9IMI78ZCsjzSXroPpO9S4BX9l6Y4xGCeqmXFwE6IyTUIuHmRvBiNAgq+o2taHxmSBmkAghq7Y9wkYuA2f3XXi0haKkRU/bTPLEMBQHRVF4y/vY53WVTh+P9D2O241bT9ykA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYXPR01MB1823.jpnprd01.prod.outlook.com (2603:1096:403:11::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 06:55:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 06:55:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Thread-Topic: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Thread-Index: AQHYB9xdBYnK1xJ91Um+ElqRSTpeP6xiUBmAgA5g/ACAATU8AIACqE4AgABkWfA=
Date: Wed, 26 Jan 2022 06:55:06 +0000
Message-ID: <OS0PR01MB59228A7CEFAB85F2495972F386209@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
 <Ye1dhPKT2FGgXKLO@pendragon.ideasonboard.com>
 <CAMuHMdWWQeumgcHMNnG7Zntxnc0y=B6C_V_cYVYk2L45vujywg@mail.gmail.com>
 <YfCbmohm5bX1jMhb@pendragon.ideasonboard.com>
In-Reply-To: <YfCbmohm5bX1jMhb@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad7b745a-151b-48c7-2a7b-08d9e098c930
x-ms-traffictypediagnostic: TYXPR01MB1823:EE_
x-microsoft-antispam-prvs: <TYXPR01MB182397C6590F7922922EC06186209@TYXPR01MB1823.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Js2kmEOMJ/GNA41MlPGkB/NFMnGOdX6H1jPY3JnbvOkLzQl9ymIIv+mubYmgWn44JlXAeDMun7MsFTeE7vKG2QtDt9ubid+6KevgeyAN4F0PzhqeDZpWdJ3qfUaxrLMBzr0hpccqhFVAgDCZ76wDCz7xLq4RvvZLAYf1Jo1X269CBv9EtpBaIIO8phW+cX03sL7IHEieauMYWUu9xftft7GRRE0cA0u8tvOLVMgok0XaKfy78LqEfsZEprnG4Geb5mTNhhir/dILGGlEDiukYPiAosP/n4jM8yok2nP4pgPdk0vmVKo6cGVC+ctAbC8oRlktvYTR2lfrvAqUmzKvdtiV2Borfyqa+oD09UKzhMZ1Dnrwu0JLurOi0aExyu8CgEEP53m4t6oz6eVXHOBBEuNO1abcRj8dZjXX8dpa6iyLntSP0bGe3gvfa+5BSWbvTVvO2cGwyfhrGfZiQXxzZzRh1YnqJpE1EpoWOl9FrBoogxNZaG9pjj2lBtuD0F6ml02wuxHrqimdynF1nT2gdMvup1pAI8565bkqP3Aek7TCYkDYurCHtBUutuK4dKG6rT9vW9DI4F51mipyyj3fYODnQ2W3ReE59p+66Uty+eGIp2N0JfMsVRRgnqCfLgpMc9preM89qA03Vl/63BEIm/sJx+T4+JZyellySPRSTOSNEA+/WoHdj/bvU4qIgRTTdqKvVkkBDj+CNJ+HTG3HfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(83380400001)(86362001)(66556008)(66476007)(122000001)(7696005)(71200400001)(9686003)(107886003)(52536014)(5660300002)(64756008)(66446008)(66946007)(76116006)(55016003)(508600001)(26005)(186003)(110136005)(33656002)(6506007)(316002)(4326008)(38070700005)(8676002)(53546011)(38100700002)(54906003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW1oaXNSdmVHQ3QvRGlqMUhOMFBvK0FBQUQ0RFI2MmVLV1J3SlpNcm5ZUjQ3?=
 =?utf-8?B?WkFqaTFoK0Rwc0hiT2N4L3VheDc4M3VoK2tiVzEyZ3FmNHdmY2p2aFdTNEdN?=
 =?utf-8?B?UVpKd042d01BZ3NpOVNGd3pvQlFPWFB0aHBWajBRVXNIMHEzL2ZRL2pmSnly?=
 =?utf-8?B?cC9LSEFDUWZBK1ozcTFlVEx4aXNZL0w5alk5cnBINnZGOUVVUkNPOC9xMmVX?=
 =?utf-8?B?N2lIWGxPdE40TmJhNjVMNHFKeFFueVRmQ2REMVJnZ1BIWUJjUDI0dHV3VFVW?=
 =?utf-8?B?R3dNcVBhd2R3NFNGOGlxQ1pxakVncVFHRmlOZmpVb0NVRE0ycnY4YVhrU3VH?=
 =?utf-8?B?L1l6b00wditDb2JiNjhNT3NwQ0RYQ0MwSmdTZXdQbk5TWXBadVcwNllZRFFU?=
 =?utf-8?B?RFlRdWE5QS94blZSSlhlQzNIT01hdzEvR3JaMUdZZ0hMblI2UnZPbHhHOXJx?=
 =?utf-8?B?enY1U0hzeHBOSGQ3Z2F0RUwrYXUrVVFKK05PWXZwVk9mZkVYNUZVeVB4MDVB?=
 =?utf-8?B?OUhaQldCRkgwWElaNlNncHdDRU9YekJQVzZuL2xnbDhzVTFOL3hsS2wxb1pl?=
 =?utf-8?B?K0RpMkJIU1U4Nk4xSnJzZlcvSlhPNXBYb1VxVkVQd1B5WktaYi82TDRWSW9o?=
 =?utf-8?B?S1RLYnQwVVJWcjd0Q3E1WFF5bnM4ZURCWDFOMGNUUlBnd0JQZk1UbEFoajhO?=
 =?utf-8?B?M3ZIaUpuNTZwOVVYUW4vR2E3R2lZMnVmdFpBTFQ1TEJnT1crOWhHRVZ3YUhQ?=
 =?utf-8?B?VDQzVGFSa3h6TldFWndmVlJzWk4rNGJUeG9WcWFiUkZrNXJScGc4L3BsVkRK?=
 =?utf-8?B?OFQ5Zlh1WnNGQS9RTHcvZEE4dlJvaGd6RVpUQ0FIb3B1clhxN3ZxbzVkd2Z2?=
 =?utf-8?B?VjYrWTBSLy91UDl0c1gxWmh2ODhqaVpCMm1wdVV2N01IWWtNVG83THFNRVRh?=
 =?utf-8?B?UFA0L3dYeXY5SXdQTU5zUXVVYnI4TFBkbzNjakVTTDBFMXBpVHJXVlcvbVdJ?=
 =?utf-8?B?dlJtZW5iVGFIM0dKNnpHeVJ5QUs5TGNxaVF3cDZ0elhFNXBxdG9CbkI3am42?=
 =?utf-8?B?NHVHczlHMTNRWW9QRytwaWVQb3JpOUZNem5FRUdoVm1Vc2plZXYzajUvZmVT?=
 =?utf-8?B?bCtyY1pSY0V4RmcxK0lNWmwralpVSVFWcWtjY1kvUFg2NEVRUXJmVnlQSUpq?=
 =?utf-8?B?SUtUZFZhdDgwaC9oR3haaUY0WWt4M04zdGpqVCtjaDVUYTBLNjBmOWdUVXJR?=
 =?utf-8?B?QjlmUU5aYURtQmdlc1Z0dm1BeHIydWVpandSa3hTUkladUpTOTBvb2d1blo2?=
 =?utf-8?B?dGRhUjB1UmFuNk5PUDc5ZVQyNERDQldHYXdWRml3aWlyUmxZN0p6OVpoR2Fw?=
 =?utf-8?B?eVZOVEEzajlaQVNUT1U1aHRQaU9XeHdkeXJoUkk4b1NkbWJPalhKSVJyMGlx?=
 =?utf-8?B?eE5ncjgxdzA4TE5IajJJRzJWa3p5L3Q4bTJkaUhnTnZab01RVEhaajFDRVl3?=
 =?utf-8?B?REt5YkdJRDRqUE1BcUZIYlMxdjIyNmpqcjhvVjVrOXY1Zld4V2tOTWhhYWtR?=
 =?utf-8?B?a01OL1VUcEx5SVExb2hHaXk3SCtOVk5NcUsydERza2ptMFB6SzQyQU5RcnFM?=
 =?utf-8?B?QkxsTTZjZ2hvUUNLcUkycm01NHZMOGE3cHdZSTkxM2JEUVY2R1ZlSjBaZnF5?=
 =?utf-8?B?cE1yTDNUbHBWcjRnNWI5RVBib09wUWF6N2xPVit4YW81TndIU3FYMWRXQjlN?=
 =?utf-8?B?T0FIaXliejIyZndhTjk4SEZWSVNURzJFRzFXSDF4RkJ0NzUyRGR1UHUrWmtD?=
 =?utf-8?B?WkdTdE1tSDErM0tkeEFRNjhkUkJXMzhvRDcrK1JIb2xkN3lXREhOTm5aR0V0?=
 =?utf-8?B?TjM4dnUvSTQwb1NiZ3JWSC9GbmM1MkZPYU0vaHJpUmJXcjBOSGtRcXF4OU1q?=
 =?utf-8?B?MGRWTGY1WlhYWU9XZHJkMDhITW9ZeEJZWkFlcTJMak9CQ2txTWpobFVEYTJV?=
 =?utf-8?B?QnNSMjB2UDM0RnNDZEsrZXp0eVdObHhuZ3loZWg4Q0hqZWhtMlY5cDhLNy9G?=
 =?utf-8?B?MW50MjJPSFhvTWZrWU00T0hTQlFNSWhHWEE1M3ByS0NFb3FvRFpmS3pwckFh?=
 =?utf-8?B?NG1JMEFWR0VZTFJHUEQyM2xIRVJLYmkvTGhqR2J6dGZKZlk1T3luQnREVHhy?=
 =?utf-8?B?QnpaaFB1OGw5ZHl2MTJ4Q0NUUFJCWk50UzhDcjJ1R3RlZDd6VEdVenQ0ZmFx?=
 =?utf-8?B?YU9lOTZjbGFSb2M0cDA1QldtMjdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7b745a-151b-48c7-2a7b-08d9e098c930
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 06:55:06.3726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdAV1nm2j7kP6XrijazMvy31i10XRTta7XR0WIz5cw2KgKKEy52dOnxw1VQvA67zLdVYNJhNnwRM+vRN3Xa40Cgl6WhFCuV3VZz09SuNtQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1823
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1JGQyAxMC8yOF0gZHJtOiByY2FyLWR1OiBv
ZjogSW5jcmVhc2UgYnVmZiBzaXplIGZvcg0KPiBjb21wYXRpYmxlIHZhcmlhYmxlDQo+IA0KPiBI
aSBHZWVydCwNCj4gDQo+IE9uIE1vbiwgSmFuIDI0LCAyMDIyIGF0IDA5OjE4OjUyQU0gKzAxMDAs
IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiBPbiBTdW4sIEphbiAyMywgMjAyMiBhdCAy
OjUyIFBNIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiBPbiBGcmksIEphbiAxNCwgMjAy
MiBhdCAxMToxNzoxOUFNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPiA+
IE9uIFdlZCwgSmFuIDEyLCAyMDIyIGF0IDY6NDYgUE0gQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+
ID4gSW5jcmVhc2UgYnVmZiBzaXplIGZvciBjb21wYXRpYmxlIHZhcmlhYmxlIHRvIGF2b2lkIHN0
YWNrDQo+ID4gPiA+ID4gY29ycnVwdGlvbiB3aXRoIFJaL0cyTCBTb0MncyhyZW5lc2FzLGR1LXI5
YTA3ZzA0NGwpIHdoaWNoDQo+ID4gPiA+ID4gcmVxdWlyZXMgYSBidWZmIHNpemUgbW9yZSB0aGFu
IHRoZSBjdXJyZW50IGFsbG9jYXRlZCBzaXplLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPg0K
PiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9vZi5jDQo+ID4gPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9vZi5jDQo+ID4gPiA+ID4gQEAgLTIwMCw3ICsy
MDAsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmNhcl9kdV9vZl9sdmRzX3BhdGNoKGNvbnN0DQo+
IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkcykNCj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbHZkc19ub2RlOw0KPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGRldmljZV9u
b2RlICpzb2Nfbm9kZTsNCj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZHVf
bm9kZTsNCj4gPiA+ID4gPiAtICAgICAgIGNoYXIgY29tcGF0aWJsZVsyMl07DQo+ID4gPiA+ID4g
KyAgICAgICBjaGFyIGNvbXBhdGlibGVbMjRdOw0KPiA+ID4gPiA+ICAgICAgICAgY29uc3QgY2hh
ciAqc29jX25hbWU7DQo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiA+ID4g
PiAgICAgICAgIGludCByZXQ7DQo+ID4gPiA+DQo+ID4gPiA+IFdoYXQgYWJvdXQgY2hhbmdpbmcg
dGhlIGNvZGUgdG8gdXNlIGthc3ByaW50ZigpIGluc3RlYWQsIHRvDQo+ID4gPiA+IHByZXZlbnQg
dGhpcyBmcm9tIGV2ZXIgaGFwcGVuaW5nIGFnYWluPw0KPiA+ID4NCj4gPiA+IE9yIG1heWJlIGl0
J3MgdGltZSB0byBkcm9wIHRoaXMgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBjb2RlIGFsdG9nZXRo
ZXINCj4gPw0KPiA+DQo+ID4gVGhlIGxhc3QgUi1DYXIgR2VuMiBEVFMgd2FzIGNvbnZlcnRlZCBp
biBjb21taXQgZWRiMGMzYWZmZTUyMTRhMg0KPiA+ICgiQVJNOiBkdHM6IHI4YTc3OTM6IENvbnZl
cnQgdG8gbmV3IExWRFMgRFQgYmluZGluZ3MiKSBpbiB2NC4xNy4NCj4gPiBUaGUgbGFzdCBSWi9H
MSBEVFMgd2FzIGNvbnZlcnRlZCBpbiBjb21taXQgNmE2YTc5NzYyNWI1ZmU4NSAoIkFSTToNCj4g
PiBkdHM6IHI4YTc3NDM6IENvbnZlcnQgdG8gbmV3IExWRFMgRFQgYmluZGluZ3MiKSBpbiB2NS4w
Lg0KPiA+DQo+ID4gQm90aCBhcmUgb2xkZXIgdGhhbiBjb21taXQgNTgyNTYxNDNjZmY3YzJlMCAo
ImNsazogcmVuZXNhczogUmVtb3ZlDQo+ID4gUi1DYXIgR2VuMiBsZWdhY3kgRFQgY2xvY2sgc3Vw
cG9ydCIpIGluIHY1LjUsIHNvIEknZCBzYXkgbGV0J3MgZ2V0IHJpZA0KPiA+IG9mIGl0Lg0KPiAN
Cj4gTGV0J3MgZG8gc28gdGhlbi4gQmlqdSwgd291bGQgeW91IGRyb3AgdGhlIGNvbXBhdCBjb2Rl
IGluIHYyLCBvciB3b3VsZCB5b3UNCj4gbGlrZSBtZSB0byBzZW5kIHBhdGNoZXMgPw0KDQpQbGVh
c2UgZHJvcCB0aGlzIHBhdGNoIGFuZCBmZWVsIGZyZWUgdG8gc2VuZCBwYXRjaGVzLCBhcyBJIGFt
IGJ1c3kgd2l0aCBicmluZw0KdXAgb2YgUlovRzJVTCBTb0MuDQoNClJlZ2FyZHMsDQpCaWp1DQo=
