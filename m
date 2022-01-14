Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B548E678
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D12C10EA7C;
	Fri, 14 Jan 2022 08:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB010EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNIFkSlG5xR8XlsrjeAgWioiXPqwsE4J+7XCk5qFYWkMaC7clJ+ei2AkDN9uEX3E1JHnE8d1yJJEK74/tbchMVDcnfoqeKL8W7nEfp+UTUrzcL0ncaUJwCg3LU6FwqdRc679u7h6ebmIfrWRd01UJkJorNpoEk921d7dW8piWI7KIrG7oVye+bMzJZLoYEJONSIF47JpU7aK3sfCLrFlnAEhTzXsAaWr9v/G2r40I9A6DITE8crkutaP0WSP0UImdA6vCOjj0ldqxsPuKT/fNwEnSwn5HLRydbw6gU/wO403Yye062nlKpiSAM1Agqc4nAIxD4aLXwjXWlZvq7w7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2NxeqCjqYtu2cOP6gk1YMjFMOq/c4Y/8XcZ6Uzu22w=;
 b=NSc+Cx4TK725vQyB3PA2i72hRx6ORaKpRH+Gy+wHX05WmEwDOo1gs0y1J/LOXet1339qbN/secJj+9TxeiIREEn/Qdc6fOWT2+Lu7FZpUBNqKWtWegLeVIJ1fHStP0A+nW07YyI1R9XC8xWffydQcC9lTHq1PdBPHxRPKpBfCkqM40Cr7FaFXIVbQ9vAjp/JTdvAY3+12SCMYxodd5QG0GIyGYmHehEtfdzi5eIum567w93sIWhyQa6AaiSBPn2ax/72hS/eS3uvKRAH+hG/1jg/MADzsVMKZmdS5H87I0oXYbR8pZpoeZCsky6k26UOirndemFuzWpuvSJaDWiCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2NxeqCjqYtu2cOP6gk1YMjFMOq/c4Y/8XcZ6Uzu22w=;
 b=NNSPCHm+jrfvwd2YMPL185QzxeRDL/POExXRV+a/SOJ72yPfV9dOJvbiq3R665HKkzRs7qTuLKAgkwqR8SyWNE7ET/7WD/mf7WOmx2LreD5jKZNcyJ6H+OcGXaCRt44FfmbKaiY6Rdkl+sIwK5leuBFdOBvaWMuX34OP0Y9aCqs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5085.jpnprd01.prod.outlook.com (2603:1096:404:12d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 08:29:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 08:29:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Fabio Estevam
 <festevam@gmail.com>
Subject: RE: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Topic: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqAAFPAUAABnsh4AAABPrEA==
Date: Fri, 14 Jan 2022 08:29:28 +0000
Message-ID: <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
In-Reply-To: <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 458717cd-86f1-47bd-f25e-08d9d737fb36
x-ms-traffictypediagnostic: TYAPR01MB5085:EE_
x-microsoft-antispam-prvs: <TYAPR01MB50855B2F0A648CFC2A38A3F986549@TYAPR01MB5085.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqozZSDCOV67Gm0rQj/tzYvWMOJgwhZQjwPqGoK2s5B6l2f7SYnADBL+WI3qOcBJbsVtyxRtKqvvjzmG5o0hYwntTZAddjq0z5NpC7KHHHlmOkq5G3t0QqiNkw1OM8v25yGmOCisWfXR0829fbCIBJQRDbCs0GpymuDjzyYpBSL8mFzMC76AjbxreDNx+WQ6M8rE0xzKmrthg+sAH32S4aSiQTANWxmnwu6EeBXXuDOXMBfbY8jkrSxOY7a+GN2YefUPy3wsXDY70W05786l1330qQDMWGoHOR3jFoy7RcvUqdqMJaPqzR4GqOYbjkZ1MTHX1SRvBBASTRy/Ew5yCHcjyLfub6plCz8Fz79XO3e+/ZmtaW9+Op62ueqlRiGOr4dp4K3S3/qj8rwImKQnsny6afPEbaZ92MCxuCKUXcb3xldKJyf7gE4bzx9inGXoVJh+dCH2335Fzz4fN4Pg90ud/xinCtDJ7fRiQA78eWq+jKxRh1gcHEtEhHmCSZKDrRGBMM/f6t0LbNsrrbSM/Wj+EaHrRkH/vzeO1o8+A/GSJex/iJ2dwCDODPhvTmCYeRiZuhdR8B9SEWTq06aY7XIh/zgRLRs7sbtK+WXQIFKNGcLS7d+6N0GJubnWmle9mpfchX7altrqOhcp67AIjfbxS/hLx3GhtTGYSVckbFQnPNxvUOvtZ8JamEnTeM+SVBJl5aDqWimQFUqBhUzDGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(9686003)(64756008)(33656002)(122000001)(2906002)(55016003)(66556008)(83380400001)(5660300002)(66946007)(76116006)(8936002)(66476007)(26005)(7696005)(4326008)(53546011)(8676002)(86362001)(110136005)(54906003)(186003)(52536014)(7416002)(508600001)(71200400001)(38100700002)(316002)(38070700005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUJMSW1kZzdZNmJGUk5RSXdyK0FlZFJBNjk0c1l4cnBQSDZUNWEzbkVBYi9H?=
 =?utf-8?B?SmZSWjdGRUYwcUJ5WjdHbDdPWk0yQTJwQ2NnWS9lYXdkV3FoejNaNWdlbUd0?=
 =?utf-8?B?T1V6UmRycWNsN3lwaThoejM0cVp0Wk9ERG1QOHBYNmVoREt1UWZRV0dHM1Qr?=
 =?utf-8?B?K0JBZjFDR1o2cWdaWTlnMkgvaGYvMGZocWN0TTFKUVVJL0p0SldGZ09kMXRx?=
 =?utf-8?B?K1dYdTU4elVYTDBZZjlValg0QWZLajBWSlkwNlZrMElxWTFEMVYyZVdQaFRj?=
 =?utf-8?B?WDBoQ1o1SVJpakNzbWdKdlpSNWNZWFB4VkQ3SFRSSjd1TXJIOXEvZHhZZm9s?=
 =?utf-8?B?SktZVVFnZ0VOa0JxZzAzVTAzSDVzbTV6KzZkTER3Qmg4QTZSZDdhbjhQblhz?=
 =?utf-8?B?bmVkU1JUbFdWQ1M1d0h6R0hZOEZRTUF2YTZZcHRwbXNEV1Jjd1NkTjF5Z29P?=
 =?utf-8?B?Mm9jclFyaEdtVmlxTGtCN2ZvSzRGM2VmcmMzRVpNbnhJK3pDME0wK2x5ZlhU?=
 =?utf-8?B?elBoWjdEREdkdmdONEI2L1F0YWFYRWJkTjFWNXRrT0lPblFvQlpyaTI0ZjI2?=
 =?utf-8?B?WS80aEhJQThQS2o0RGVTWG52OERFV0JBdjFXREU0WmdvejNBR01tRXlSMTZK?=
 =?utf-8?B?dXljUi80N0k2TEMwcTZoa3dvSnZyZG9FSlF3VUo0RzZBbXdMbjVNS1ZId1pv?=
 =?utf-8?B?ZzljRml1U2szTmtmRXIzaWluVWdyWmVkV0lJd3RIZlZPR3JiOTc2VlorWUto?=
 =?utf-8?B?eG1XY0FSK3Z2Y0M2WG94VmQ3c2o1aFFlVjZuM05rSkhhMkNNeWVxQzA3N1RS?=
 =?utf-8?B?d01va2FNMzZoR1VQanVIUGhvVFRaOTdjVUFWUXoyeHd5OEVoSEw3SC9pZzE1?=
 =?utf-8?B?dTk3cThBdU1qeWRzelRHS1pnUzJQYXlrMWFJenJVUkY1b1Y4UEFOUjcwVWVB?=
 =?utf-8?B?Ri9rQTlQRXk0Vm9idU9XRXBMVUVTUU1FZGIwRFJBTDFla21XOTJjeUpvakFp?=
 =?utf-8?B?ZnBpMUpJRzVJOTJCODRZQjREUVNpdTA2RGNNZm1sTTU3OW1PRXJ6SFUxL0hy?=
 =?utf-8?B?VGkvQXlvSm42b0prSWpNcHVLbEVEckhQcERKNnkyWnR5TU5DelJZQjRjNXBp?=
 =?utf-8?B?MWl2WCtFYVE5SDdSYVJJOGtmL21ONHhBYXlYbTdyZnZ5K2w3ZC9wdy8xU2Nt?=
 =?utf-8?B?V2EzWXM3T1VDWTBuUUhvcUNyT3ZrT1djRmRSMzdaTWdZN1E4b2h1R0dPRHV4?=
 =?utf-8?B?WndYNW5kSE51MUJzVnpabWhkeU5ETjBxMUZjYnFMbTZpWS93bTVsVHp4K0E5?=
 =?utf-8?B?L2sya3hZWWdDdkdFRDIwWXJHbzF1RHk0UWYySnJxekpFMGdEUy9ydzNWeEFU?=
 =?utf-8?B?MzkxaUJlaDVkWWNRTzhESGt0MzNTeXBLdzBIK05ubEhyTVN2VnhiSDl1eXdl?=
 =?utf-8?B?Q3dnTzIyRFZvOTJKV3Y2elVpNWpEbk5IalArbktKSFZqekxlOVdPUllrZ0xM?=
 =?utf-8?B?bUc0dWVTYkoxc1BHUjFESXhadjd1YndwVkpJQngwQWp4cFFRK3BuVUtXL3pF?=
 =?utf-8?B?bjh5RUkvd3M4aVBRc1lTejlQMUpSeTZFcXZqTjJaMnVwN1FENmxPWGxLSzZ5?=
 =?utf-8?B?SUlzdnorK1FjY3hrc0lkKzNDdmlTQzArdytYcGVUMU90c1V6K2R0dGU3VS9J?=
 =?utf-8?B?bEI4NW0wN2xzSTc1bC9uYi9nN3lVVzZ3cGpUOHpJb1N2bjRXTGJTeEJZSkoz?=
 =?utf-8?B?cCtubVRiSmtIdWVQMEd3TktEY2VFSXhaeFN4TEdTc20rMjZZbEtLcFVtdHRT?=
 =?utf-8?B?MW1SeThsYytjM3hZcTFlZndOSWJRdEZ0SEU3TklFQjBINGZobTFlUTlXN2FV?=
 =?utf-8?B?ckZBS2FRdEhDOUc3aWVsZlptaTcyeGU2cDVjdkNIWlFWbXVSK3c1NHdRUnU1?=
 =?utf-8?B?cEI5alNoZmhvdGwxOVIwWmNsMXYxMDdSR2NrNDRjb1lqRTI3TW5IWUUyaDYv?=
 =?utf-8?B?aE9yZEVvUHhqdmpmK2hEa0VMcVdyZlhXMmR5RThRbzVtV2hzVkEvSEdnQTRP?=
 =?utf-8?B?OWRBVEhJak1UYXBqNDBVWDVTcU5FRVAwMTdBNnNEMDRNSC9Qbi95U243NnI3?=
 =?utf-8?B?WHFDck52RTNNM3l1MmRSa3RWSmc1Mis4bVcrNXhUOEdMMVZuT1dXZ3Rtd0I2?=
 =?utf-8?B?L0pJYzllQWNnaUtPTG9QK3pXNThNVC9DU1hoTUZyYW9OUmgrL1NzSTBva0JT?=
 =?utf-8?B?N0hKKzNxZTAwTm1KUFZOTlpRYjJBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458717cd-86f1-47bd-f25e-08d9d737fb36
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 08:29:28.6866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkRIH6okYWSx32Po354SCheBN4IoksQKmGGOreNxTN6CRIb0QhWYOVBbZc/KLpVAZOIv/4CrTMtoEU8cHmy38x3n872h+W+zt3ShzsOzmDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5085
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
Cc: "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCiANCisgcmVuZXNhcy1zb2MNCg0KPiBTdWJqZWN0OiBSZTogZHdfaGRtaSBpcyBz
aG93aW5nIHdyb25nIGNvbG91ciBhZnRlciBjb21taXQNCj4gN2NkNzA2NTZkMTI4NWI3OSgiZHJt
L2JyaWRnZTogZGlzcGxheS1jb25uZWN0b3I6IGltcGxlbWVudCBidXMgZm10cw0KPiBjYWxsYmFj
a3MiKQ0KPiANCj4gSGksDQo+IA0KPiBPbiAxMy8wMS8yMDIyIDIxOjAxLCBGYWJpbyBFc3RldmFt
IHdyb3RlOg0KPiA+IEhpIEJpanUsDQo+ID4NCj4gPiBPbiBUaHUsIEphbiAxMywgMjAyMiBhdCAy
OjQ1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4+DQo+ID4+IEhpIEFsbCwNCj4gPj4NCj4gPj4gUlovRzJ7SCwgTSwgTn0gU29DIGhhcyBkd19o
ZG1pIElQIGFuZCBpdCB3YXMgd29ya2luZyBvayhjb2xvdXIpIHRpbGwNCj4gPj4gdGhlIGNvbW1p
dA0KPiA+PiA3Y2Q3MDY1NmQxMjg1Yjc5KCJkcm0vYnJpZGdlOiBkaXNwbGF5LWNvbm5lY3Rvcjog
aW1wbGVtZW50IGJ1cyBmbXRzDQo+IGNhbGxiYWNrcyIpLg0KPiA+Pg0KPiA+PiBBZnRlciB0aGlz
IHBhdGNoLCB0aGUgc2NyZWVuIGJlY29tZXMgZ3JlZW5pc2gobWF5IGJlIGl0IGlzIHNldHRpbmcg
aXQNCj4gaW50byBZVVYgZm9ybWF0Pz8pLg0KPiA+Pg0KPiA+PiBCeSBjaGVja2luZyB0aGUgY29k
ZSwgcHJldmlvdXNseSBpdCB1c2VkIHRvIGNhbGwgZ2V0X2lucHV0X2ZtdCBjYWxsYmFjaw0KPiBh
bmQgc2V0IGNvbG91ciBhcyBSR0IyNC4NCj4gPj4NCj4gPj4gQWZ0ZXIgdGhpcyBjb21taXQsIGl0
IGNhbGxzIGdldF9vdXRwdXRfZm10X2NhbGxiY2sgYW5kIHJldHVybnMgMw0KPiA+PiBvdXRwdXRm
b3JtYXRzKFlVVjE2LCBZVVYyNCBhbmQgUkdCMjQpIEFuZCBnZXRfaW5wdXRfZm10IGNhbGxiYWNr
LCBJIHNlZQ0KPiB0aGUgb3V0cHV0Zm9ybWF0IGFzIFlVVjE2IGluc3RlYWQgb2YgUkdCMjQuDQo+
ID4+DQo+ID4+IE5vdCBzdXJlLCBJIGFtIHRoZSBvbmx5IG9uZSBzZWVpbmcgdGhpcyBpc3N1ZSB3
aXRoIGR3X0hETUkgZHJpdmVyLg0KPiANCj4gVGhpcyBwYXRjaCB3YXMgaW50cm9kdWNlZCB0byBt
YWludGFpbiB0aGUgYnJpZGdlIGNvbG9yIGZvcm1hdCBuZWdvdGlhdGlvbg0KPiBhZnRlciB1c2lu
ZyBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IsIGJ1dCBpdCBzZWVtcyBpdCBiZWhhdmVz
DQo+IGluY29ycmVjdGx5IGlmIHRoZSBmaXJzdCBicmlkZ2UgZG9lc24ndCBpbXBsZW1lbnQgdGhl
IG5lZ290aWF0aW9uDQo+IGNhbGxiYWNrcy4NCj4gDQo+IExldCBtZSBjaGVjayB0aGUgY29kZSB0
byBzZWUgaG93IHRvIGZpeCB0aGF0Lg0KDQpUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbiwgSSBh
bSBoYXBweSB0byB0ZXN0IHRoZSBwYXRjaC9maXguDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4g
Pg0KPiA+IEkgaGF2ZSB0ZXN0ZWQgbGludXgtbmV4dCAyMDIyMDExMiBvbiBhIGlteDZxLXNhYnJl
c2QgYm9hcmQsIHdoaWNoIHNob3dzOg0KPiA+DQo+ID4gZHdoZG1pLWlteCAxMjAwMDAuaGRtaTog
RGV0ZWN0ZWQgSERNSSBUWCBjb250cm9sbGVyIHYxLjMwYSB3aXRoIEhEQ1ANCj4gPiAoRFdDIEhE
TUkgM0QgVFggUEhZKQ0KPiA+DQo+ID4gVGhlIGNvbG9ycyBhcmUgc2hvd24gY29ycmVjdGx5IGhl
cmUuDQo+ID4NCj4gDQo+IFRoZSBpbXggZG9lc24ndCB1c2UgRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SIHNvIHRoZSBuZWdvdGlhdGlvbg0KPiBmYWlscyBhbmQgdXNlIHRoZSBSR0IgZmFs
bGJhY2sgaW5wdXQgJiBvdXRwdXQgZm9ybWF0Lg0KPiANCj4gQW55d2F5IHRoYW5rcyBmb3IgdGVz
dGluZw0KPiANCj4gTmVpbA0K
