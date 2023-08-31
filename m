Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1E78E6CD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22510E170;
	Thu, 31 Aug 2023 06:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EB710E170
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUgzC5KENvc2ACnjQeI8AfUzUVd2/xSyCeqU6qz0nGpeQRFS6Au+wdNl2+i0c/cmLnDWQdRX0z2OgwmsZAnI/JoZ6z7UGmuT4qPxlCjgyiy0oObLNvSbMpzfxazgmp8VhqmNW89836+PrExuLq9hJqe64py/h05JjirUbtEpj3FJGDp0DvvRsAWC5naUVDsIR4M5EDGU4TIdhyCIgfVf1ioFrbduQatvE3Lo3EBl6VVq8zJO0RzVZ6pej98SxHWob6Okl3TvINA6r3hpkRDmOn7gd+o6MiliT8FVG6Uy5Ow2hPz8oYzKL4w/lYVnCuRhNsr/tWt12mfMh7FiFGwGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ey2SzDuoDK16x+LVbuFOmlHnpmrYIe01aU5HwqJo0Qo=;
 b=Bo6hLDyBT5oeaMSDXlYGmcnsCDe1A3ADTtoekQKkqNivFp/O2hXP8vn4O46HS/viOvqkOO9Il3rw7BoaexD/WquScxwJofHbuoHgebqRdQWnFa3np9pM0MKE8rvMJTOK7qGHHH0OhCAKQkZWvKO2L2Ny1GUhmo042BvwXeM+OjlqcHv3Bip5itViTR0hf72DSp2SErsnbIBteRQGMiKAYo97pItDd9XDJH4YuBbW5N1ryUw+LXWpdhzKBryJ43JYVpcHRSc1cEsgf42cd7jJelvfvMkq1IA9gMPDov489qSxOxpwlshRC7RgFBB/7sA4gDtq4pj/gfQpCsAEUs+opA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey2SzDuoDK16x+LVbuFOmlHnpmrYIe01aU5HwqJo0Qo=;
 b=YKgW/d4nMg9jVO34WXqwHzTL7RGEF3TWd9prQjM4PKF5SB80/FhnjuxLuh6FReXdlBcRzumtVNtfPfgLs8jB6a900NwVK46l2TQf/zVJkMuzREZZ7NS8H6a8bkh/xo1cB+QjeavDUOeZig+LZ2aMSIRyViXnjAtSeORSdOekEqQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5313.jpnprd01.prod.outlook.com (2603:1096:604:a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 06:52:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 06:52:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v5 3/3] drm/bridge/analogix/anx78xx: Drop conditionals
 around of_node pointers
Thread-Topic: [PATCH v5 3/3] drm/bridge/analogix/anx78xx: Drop conditionals
 around of_node pointers
Thread-Index: AQHZ22SiHqyri3DqDUeI32d/HgCl3rADTg6AgACpn+A=
Date: Thu, 31 Aug 2023 06:52:06 +0000
Message-ID: <OS0PR01MB59227C007AF3C2BD18E10B3F86E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
 <20230830170819.309269-4-biju.das.jz@bp.renesas.com>
 <20230830204159.GA1928@pendragon.ideasonboard.com>
In-Reply-To: <20230830204159.GA1928@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5313:EE_
x-ms-office365-filtering-correlation-id: d95b24bc-02eb-43c4-7348-08dba9eeca1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vv2WhDVfGbgHu8Sd25NSSIw9A7fiL+7Acb7XeoWGiNEt/cGijVof0fgcCtgv11kutvPv9EETz5yx7hgVm32WO/EqYvc6l8uvtThsgx+FThMYDybYfUt+ItJk1gAvV9Z7dEQ8lgncoekn2Jp68J5xl/R4iCfnX1ubkhrH+JvXzdcAJTaTCxRoWa1B+v6wWDX3hJCfZQ2LlMfDp4xF1ds8shbt2FX1E80+BWvLcEVOe2agwHUYbnjMYY5UIaMbZ/wOpBgM3+uEukc6SkH+YljbS8q974y/xyLxoctmzHWd/bCqzM3s48HoQSuQMMQfFPrX0ZQ1pTE5O90BRCDZFp5V66PC5+KDwDsjFhZrzKDAVVM9HQjiZG5YYRbro2eVOku3RV0zQs5rBurncOFDO/QEIjyLQ/1S9DBpPW0ny/e/wBm2QYQ9oPgP1XLZqbX1YCJWRZPyVlnpxJ5AFWWoAeXXpgqKdF6qSTIw8kFCM1fxKe63NlOBHNI+K2QrH+AjN0gNdyc4YG58i4/Bw+hEJH7tVJuUzikLyUI+lONwq4FDtUtu2oMjZCHftnZGgxVrJF5ZNdZyrC2TQrn8CpfLLGKozTQK2BBRvk/MBD5ilhCEaDyRX2+6hJanFuUcHemgpThQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(122000001)(478600001)(83380400001)(26005)(9686003)(71200400001)(55016003)(6506007)(7696005)(5660300002)(8676002)(2906002)(52536014)(33656002)(7416002)(54906003)(6916009)(316002)(4326008)(76116006)(64756008)(66556008)(66446008)(66946007)(66476007)(41300700001)(8936002)(86362001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alpuaHpHUnc0UVBCMnJzWVo3V3pRYzVscVBiV2JlOGM4QVN1QzhWZUhwb3k4?=
 =?utf-8?B?VElkVmsyNnFudVQwYkhZM2lLUDlzNTFvblhwQnpjb0lxWjdoK1hYbmdGUjcy?=
 =?utf-8?B?MFJSWWUrYTdtd1l1LzNMaWNZM0plRTFrc3l6VkF3UlhNa0hOc3ZLUkN1d2U3?=
 =?utf-8?B?WUFjR2Q2dGdUeHJicWR5d0dudkZna0tRZjlycnM4ZVErVTc0dUtvZzJobE1L?=
 =?utf-8?B?WWJGckJBV2toVmZteEs5ZERHNkRXMFBOMEVQekR0UmhBWUtqRERpN3llMk5O?=
 =?utf-8?B?T0REbENLK1c3WXRXc2hIVytZSWM4WVBGSkdUY1NGSFVMSjJHNzIvWkpQOHpR?=
 =?utf-8?B?dkVUVFMxeEpIU3Z5aGExTmYwVXoySmNsLzBMNmpzUm16M0lzbnNPaDFKM0RE?=
 =?utf-8?B?ZGUrc1EvRlBKSnU0VkhYV3VONk1ZVm9xeGFUbVFvd28vTHJHNUxlOElQaU0r?=
 =?utf-8?B?blFmbTA4TCtUNm9iSStKdjJGRkh5andESEErOUZlN09Oekh2cVhDbENiejBs?=
 =?utf-8?B?bkZPcWdiRlZyVzI1enBxMEQwdUhpdGZ3Z2hBemZZSkRNcmFOKzFVZU5TbE95?=
 =?utf-8?B?TDkxV2hnYnJUSU01S3NVM0RPSzdSTDZSYXlmSG9KRjZud3BoM0NDSXJ4dExl?=
 =?utf-8?B?YmlWVnIzOXJiSWszWmwxYzlwS0JHWWlZV3BnMTF3M0NTOXU2d2Zld1NKRGc5?=
 =?utf-8?B?N3VHSngzTDE0RGNFMXM2MWc1UStwdUNZZzJjeE9tV0cwNnVHTnRXRjg0c1Zl?=
 =?utf-8?B?TEVCc0tVUEZrR3o1Rk13bUtFQXlpSVgwOW1zMk5wSkRtdDEwUDNuL09aK2pU?=
 =?utf-8?B?YjVseEM0K2dSZkFGcjIxTWR6dFhNd0kydVB1bGJRbVp3SThBUVFRUWRPTXRF?=
 =?utf-8?B?V3BYWWRNcWpUcEJPR0dFYzc3WWp5bElRUnhCbmtvVUdDbjZobENCY0FUbTZy?=
 =?utf-8?B?SWgwNjY3RUtVZlJLbUNadFJ6UDdjOFRKOU13KzJxZkVZcVpsYVRiWGowTisz?=
 =?utf-8?B?TWpNZUg1OHNqOW9ldXpsMjhMYjB5Znp5d1hMb0ZrZmIxd3ZxMEczQnJoZ0ZO?=
 =?utf-8?B?OFVQSitHbVpFOWl2ZlJqa3lUek85RklpVXVTdFpTc1llWnNjSkgvaFh5NHE0?=
 =?utf-8?B?bFdkNXl5c0FMNlM4OGpYYUcyVzZMaEdrTjRtT0h5NDN5aFJqQUY5ZTYyaFJJ?=
 =?utf-8?B?bWNzU3gwazFCeVR6RGI0a0xRd3V4cDBTL25tcHd0d09yMjBqUlRsdXZJMU9n?=
 =?utf-8?B?VDNkajVidTlRWDR6aHJjUUR5N3hQUVcrSnN2dU5kM3lTWU1WNWx4djRZTHM0?=
 =?utf-8?B?Q2VqaEg0eEI2bXlTdmhrMUVxVHJKOFhkWkptTWFaOSs3UGJUSGlyZ1VLa2Mw?=
 =?utf-8?B?MXpmTnI0WTJ4eFpqd3lYQW1Mcm1qQXlLVTE2N051a2xYdUdLSVJLRW9vREor?=
 =?utf-8?B?Mnppa3hUVkQweXNoeGxNVGN5YWpwVGJuTjkvZHZJaUJzVFZGMEthYndOU1Vi?=
 =?utf-8?B?T0tjMnVBM0dEUmhHMCtZTE82UTgzK1hvWmhkalZsWGwrTHhDVHlTVWpGeUpm?=
 =?utf-8?B?OFdxRU9yRTFaNHUyTVczRy9ISG4xQjZBcnhyUkhwUVh2ZWk4anh0cU1FM3JT?=
 =?utf-8?B?cFpIMkE5U2pvdU9ieHJma2s2K2ZFeE9qZ0NGQWFvQkNHUEVFOWRqRFdxdXl2?=
 =?utf-8?B?R3RlYUJacjBOOVFCZXprdFN2L3o5NTdpVWtFYmFibjA5UzZGVllPVzRMcHBO?=
 =?utf-8?B?c2p5MzFTL2RrenhidzYySnlYaHJ2TkdYdGFiWXZXanV2WVdkOC9wYnRSdUpO?=
 =?utf-8?B?MmxUQ0FHYzBCb1RpMGhWQ09hbFFJeUhVc2d5MVFDMTdSZVVMakpjamo0dUox?=
 =?utf-8?B?UkM4SmM1SDRVOTY0ODZRMFJ0OWxJalRheE9qU2RTTi9RTW1mY2tLM00wZktJ?=
 =?utf-8?B?cnRnUk5EQ01lY0JFVjRqUk1HMGgrbmQ0OUJ3VHpQdjdxcFFGMFFGKy9tK1JS?=
 =?utf-8?B?eGRnVEQvL0pOTmxOalNoNGxYU3FKbnBkZE9RNW1VajhUc291cmYyaEpJRjF4?=
 =?utf-8?B?TVBUNm5kVUoxQzFjZGQ1NEJBcXlub1FiZXFTK21INnE3ai9lVk05S2wwc0lO?=
 =?utf-8?B?bjMwWW9RWWVOSmtMeVFmVnpFNWZBKy9yZmRTa0xod1JvaElyT1o5Q1JIblNY?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b24bc-02eb-43c4-7348-08dba9eeca1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 06:52:06.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lF55nVy/7NbNgPdYJw7U3BIUBuvhvb2p7yIvHJrYXNA0C8nlG8CWemxbTaH0PruKCgn6rUAttpv369ViGYv5HJRFOh3Wr3N65UTIMBsqTGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5313
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAzLzNdIGRybS9icmlkZ2UvYW5hbG9naXgvYW54Nzh4eDogRHJvcCBjb25kaXRp
b25hbHMNCj4gYXJvdW5kIG9mX25vZGUgcG9pbnRlcnMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDA2
OjA4OjE5UE0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhhdmluZyBjb25kaXRpb25hbCBh
cm91bmQgdGhlIG9mX25vZGUgcG9pbnRlcnMgdHVybnMgb3V0IHRvIG1ha2UNCj4gPiBkcml2ZXIg
Y29kZSB1c2UgdWdseSAjaWZkZWYgYW5kICNpZiBibG9ja3MuIFNvIGRyb3AgdGhlIGNvbmRpdGlv
bmFscy4NCj4gDQo+IEhvdyBhYm91dCBkb2luZyB0aGlzIGZvciBhbGwgYnJpZGdlIGRyaXZlcnMg
aW4gb25lIGdvID8NCg0KSSB3aWxsIHNlbmQgc2VwYXJhdGUgcGF0Y2ggZm9yIHRoYXQgb25lIGxh
dGVyLg0KDQpXaWxsIHNlbmQgVjYgd2l0aCBjaGFuZ2VzIHN1Z2dlc3RlZCBmb3IgcGF0Y2gjMiBm
aXJzdCBhbmQgdGhlbiB3aWxsIGludmVzdGlnYXRlIGNyZWF0aW5nIHBhdGNoIGZvciBkcm9wcGlu
ZyBjb25kaXRpb25hbHMgZm9yIHJlbWFpbmluZyBicmlkZ2UgZHJpdmVycy4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IA0KPiA+IFN1Z2dlc3RlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NToNCj4gPiAgKiBTcGxpdCBmcm9tIHBhdGNo
IzINCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eC1hbng3OHh4LmMgfCAyIC0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54Nzh4eC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2Fu
YWxvZ2l4LWFueDc4eHguYw0KPiA+IGluZGV4IDYxNjlkYjczZDJmZS4uYWQ4MjQxNzU4ODk2IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgt
YW54Nzh4eC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1hbng3OHh4LmMNCj4gPiBAQCAtMTIzMSw5ICsxMjMxLDcgQEAgc3RhdGljIGludCBhbng3
OHh4X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+ID4NCj4gPiAg
CW11dGV4X2luaXQoJmFueDc4eHgtPmxvY2spOw0KPiA+DQo+ID4gLSNpZiBJU19FTkFCTEVEKENP
TkZJR19PRikNCj4gPiAgCWFueDc4eHgtPmJyaWRnZS5vZl9ub2RlID0gY2xpZW50LT5kZXYub2Zf
bm9kZTsgLSNlbmRpZg0KPiA+DQo+ID4gIAlhbng3OHh4LT5jbGllbnQgPSBjbGllbnQ7DQo+ID4g
IAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBhbng3OHh4KTsNCj4gDQo+IC0tDQo+IFJlZ2Fy
ZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
