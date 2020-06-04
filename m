Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061F1EE146
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7229D6E03C;
	Thu,  4 Jun 2020 09:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0939489829
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwgdLsn9SeO68Hum6n+/v8DdvEPFXM+kBoDHBLqd+tpHrCT9PL7cOwNgIUzab93/2b0a4y/5Gb2d/dwRwIcbKWxm/bRaz1QT8T5DZqTBjdSO3ZMyWh41xUrf7LUdE3OvdYrXszSL3dpXbQ+CdMM+7vw+Ry2DSSuqRl1F4hje3iqDdFhoPo+jZb9XNe7ezmRx+twFFjJtR3eLVVfjb7PzbFs/CMMtAD6EEa9iOGbsYezwwwKFDOjV3bscsPIJim5bi9Rr7MbpmKuKcPWxflVAD8g6mNzARlBS+oFReeBsuuK5RxehDWqC1YmSVWDNt2Rt2RqHcJFAt+y3+hk1fulnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnLD9kR/Xfr1aBSktpECKCINzLkUO2YAK8aXWNZFLVk=;
 b=XQa5O6twY95sZT9i1RGyA9qSsbc25h+75xIv4EvmJGROd+GpiiPIKo6coCs33DOURWjpGvwZ5lp+Qf854Dq4CX2HNR2Y9dq1ZzKj2B7lE/6T9txyxZHmZ9pDT9ybfhGJQkk0cJOkrF9jm9rbVUVQUGAE9jLoHd+ytyKJHmrLK4Byj4yIZwv5Q8WnItbyIE1PzInIsUzUFRZLj1/Dm9DOxbOp7DLJz0SRf1vT7ZrilWGPz/y4ZPnwqVWRQ4676JGgEd1BBP6KiEwwVFO9AcUoTYnYuPFLrcPjYkki1soWiO+WKOORtmXLk6uh1tSm5NEQ9YMqfuewvRYoTF5xpmE3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnLD9kR/Xfr1aBSktpECKCINzLkUO2YAK8aXWNZFLVk=;
 b=BJB10rZUFPujX8tS0Ag6qaev0fOfI+pHQfcRM/7PBSXoCj9T4Un7zvB4g0OcAOQO5dG4U+Z0twiGkdLz50SfVqeI9CgOrRPC8ddcfKKnt3aDvhmFbT/QYGa00RH2IDSVfiNvehcEJC+tnf4g/GEPFUFx8fMrR4qEzG3QuNQDGgY=
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 by DB8PR04MB5609.eurprd04.prod.outlook.com (2603:10a6:10:b1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 09:28:18 +0000
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d]) by DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d%9]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 09:28:18 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Emil Velikov
 <emil.l.velikov@gmail.com>
Subject: RE: [EXT] Re: [PATCH 1/7] drm/rockchip: prepare common code for cdns
 and rk dpi/dp driver
Thread-Topic: [EXT] Re: [PATCH 1/7] drm/rockchip: prepare common code for cdns
 and rk dpi/dp driver
Thread-Index: AQHWN8j3MEPaPKEBXEGWedZy8NsCIKjFW3wAgACgCgCAAjlDsA==
Date: Thu, 4 Jun 2020 09:28:18 +0000
Message-ID: <DB8PR04MB682817AED57AF25816BF9147F4890@DB8PR04MB6828.eurprd04.prod.outlook.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
 <d3d707cf37e7928a839071242c752779061cc094.1590982881.git.Sandor.yu@nxp.com>
 <CACvgo52NeUSQV5p8+4DkCjpkv12cs8fCkQqy4MFn8pVaorVaHg@mail.gmail.com>
 <20200602232840.GP6547@pendragon.ideasonboard.com>
In-Reply-To: <20200602232840.GP6547@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de17f62d-687f-4245-50ec-08d808699dfd
x-ms-traffictypediagnostic: DB8PR04MB5609:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB56097F7E8AC2C02FF44EC5F1F4890@DB8PR04MB5609.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OCbDprBvSbxrzs58aIyeixKFbpcatDuWKjL4pzCBVpmJRP4tqFOxvmsEHpeZaez+P6AYCedOjA3s/CB2CbNUILfWs73qrGg6v7ftrJWO/jS1n/545VnvaGNV4ww/AOzhsPFXD0LEzwsk+lP9T50MbHHsH8VR+vr71LaSoUL51Lb8c6WZm1iEbr7oQMThQHzrKFf3XYF0dBXSInvTP7qoRI5PQpIgNRKYAB/4Sn/hPPwfT3uHta9evGXoQsVZ7wXtWvl5d/M8+ABgt4gk1oRvCz1OAwKhM9bM3u8jszXureslgCwSevWzeyudJepQl6Ku
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6828.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(316002)(86362001)(44832011)(71200400001)(2906002)(110136005)(5660300002)(9686003)(66556008)(7416002)(55016002)(66446008)(64756008)(26005)(66476007)(4326008)(54906003)(8936002)(76116006)(66946007)(66574014)(7696005)(186003)(52536014)(83380400001)(6506007)(33656002)(8676002)(478600001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PKOn/5JbtdGHHjOpZrotIpZwWpv0hUcd+vyzfHDdjGpINHNKbSERYiR83Hoyb84jD+Hi21DaKNdHm5b0XVI0tpUpqEniqkpQJQ5drcM2VZnFX24qadjqrHNIgpKZWvWfwu3oMk1CVlmwOlwPLBB1Mn9tFE+DMd4pXxtwKDDsjtoUbi9hiH26H4BhR6rq3NR7mGiVsToYDvyv9kmKXsug62nK/Q5BjsYdfWfYr2P356dKjri1Pw1s1uEhxa4F/KCoz0Eq304qJznJPU4gHVCzQaIEqSA1JfsUo/W+Nf+Mxh9KqncVf7wnBOD6z6U4PdgbH4xeZBZN3RAMiSVmfUl8l0oofr5QeGg2l1pzCcGDyTBezUEHUR0yY9kfYEdJXsly2HR90K1quGQ+Af+3GdMB7RfgGGn/8eeVef9R8PH57qv2vlUrDcuze/TYxpn+5MAUFLLDuQefmj2xrkRXS65gZQw8rnt/Jupo4mzU7tDlo2w=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de17f62d-687f-4245-50ec-08d808699dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 09:28:18.6763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YI8p/rJdfH058IagDFDePN32T+o73TWmqmo07Gi9aemT8wdHTszRx9GvKrxoHVZ3UE7xZpsh7/P5sbvbQRq4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5609
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "Linux-Kernel@Vger.
 Kernel. Org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, dl-linux-imx <linux-imx@nxp.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 "dkos@cadence.com" <dkos@cadence.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bmUgMywgMjAyMCA3OjI5IEFNDQo+IFRvOiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4NCj4gQ2M6IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPjsNCj4gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPjsgSm9uYXMgS2FybG1hbg0KPiA8am9uYXNAa3dpYm9vLnNlPjsgSmVy
bmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PjsgSGVpa28gU3TDvGJuZXINCj4g
PGhlaWtvQHNudGVjaC5kZT47IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5jb20+Ow0KPiBk
a29zQGNhZGVuY2UuY29tOyBNTCBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+Ow0KPiBsaW51eC1yb2NrY2hpcCA8bGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFk
Lm9yZz47IExpbnV4LUtlcm5lbEBWZ2VyLg0KPiBLZXJuZWwuIE9yZyA8bGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IExBS01MDQo+IDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc+OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhU
XSBSZTogW1BBVENIIDEvN10gZHJtL3JvY2tjaGlwOiBwcmVwYXJlIGNvbW1vbiBjb2RlIGZvciBj
ZG5zDQo+IGFuZCByayBkcGkvZHAgZHJpdmVyDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4g
DQo+IE9uIFR1ZSwgSnVuIDAyLCAyMDIwIGF0IDAyOjU1OjUyUE0gKzAxMDAsIEVtaWwgVmVsaWtv
diB3cm90ZToNCj4gPiBPbiBNb24sIDEgSnVuIDIwMjAgYXQgMDc6MjksIDxzYW5kb3IueXVAbnhw
LmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gRnJvbTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhw
LmNvbT4NCj4gPiA+DQo+ID4gPiAtIEV4dHJhY3RlZCBjb21tb24gZmllbGRzIGZyb20gY2RuX2Rw
X2RldmljZSB0byBhIG5ldw0KPiBjZG5zX21oZHBfZGV2aWNlDQo+ID4gPiAgIHN0cnVjdHVyZSB3
aGljaCB3aWxsIGJlIHVzZWQgYnkgdHdvIHNlcGFyYXRlIGRyaXZlcnMgbGF0ZXIgb24uDQo+ID4g
PiAtIE1vdmVkIHNvbWUgZGF0YXR5cGVzIChhdWRpb19mb3JtYXQsIGF1ZGlvX2luZm8sDQo+IHZp
Y19weGxfZW5jb2RpbmdfZm9ybWF0LA0KPiA+ID4gICB2aWRlb19pbmZvKSBmcm9tIGNkbi1kcC1j
b3JlLmMgdG8gY2RuLWRwLXJlZy5oLg0KPiA+ID4gLSBDaGFuZ2VkIHByZWZpeGVzIGZyb20gY2Ru
X2RwIHRvIGNkbnNfbWhkcA0KPiA+ID4gICAgIGNkbiAtPiBjZG5zIHRvIG1hdGNoIHRoZSBvdGhl
ciBDYWRlbmNlJ3MgZHJpdmVycw0KPiA+ID4gICAgIGRwIC0+IG1oZHAgdG8gZGlzdGluZ3Vpc2gg
aXQgZnJvbSBhICJqdXN0IGEgRFAiIGFzIHRoZSBJUCB1bmRlcm5lYXRoDQo+ID4gPiAgICAgICB0
aGlzIHJlZ2lzdGVycyBtYXAgY2FuIGJlIGEgSERNSSAod2hpY2ggaXMgaW50ZXJuYWxseSBkaWZm
ZXJlbnQsDQo+ID4gPiAgICAgICBidXQgdGhlIGludGVyZmFjZSBmb3IgY29tbWFuZHMsIGV2ZW50
cyBpcyBwcmV0dHkgbXVjaCB0aGUgc2FtZSkuDQo+ID4gPiAtIE1vZGlmaWVkIGNkbi1kcC1jb3Jl
LmMgdG8gdXNlIHRoZSBuZXcgZHJpdmVyIHN0cnVjdHVyZSBhbmQgbmV3IGZ1bmN0aW9uDQo+ID4g
PiAgIG5hbWVzLg0KPiA+ID4gLSB3cml0ZWwgYW5kIHJlYWRsIGFyZSByZXBsYWNlZCBieSBjZG5z
X21oZHBfYnVzX3dyaXRlIGFuZA0KPiA+ID4gICBjZG5zX21oZHBfYnVzX3JlYWQuDQo+ID4gPg0K
PiA+IFRoZSBoaWdoLWxldmVsIGlkZWEgaXMgZ3JlYXQgLSBzcGxpdCwgcmVmYWN0b3IgYW5kIHJl
dXNlIHRoZSBleGlzdGluZyBkcml2ZXJzLg0KPiA+DQo+ID4gQWx0aG91Z2ggbG9va2luZyBhdCB0
aGUgcGF0Y2hlcyB0aGVtc2VsdmVzIC0gdGhleSBzZWVtcyB0byBiZSBkb2luZw0KPiA+IG11bHRp
cGxlIHRoaW5ncyBhdCBvbmNlLg0KPiA+IEFzIGluZGljYXRlZCBieSB0aGUgZXh0ZW5zaXZlIGxp
c3QgaW4gdGhlIGNvbW1pdCBsb2cuDQo+ID4NCj4gPiBJIHdvdWxkIHN1Z2dlc3Qgc3BsaXR0aW5n
IHRob3NlIHVwIGEgYml0LCByb3VnaGx5IGluIGxpbmUgb2YgdGhlDQo+ID4gaXRlbWlzYXRpb24g
YXMgcGVyIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPg0KPiA+IEhlcmUgaXMgb25lIGhhbmQgd2F2
eSB3YXkgdG8gY2h1bmsgdGhpcyBwYXRjaDoNCj4gPiAgMSkgdXNlIHB1dF91bmFsbGlnbmVkKg0K
PiA+ICAyKSAndXNlIGxvY2FsIHZhcmlhYmxlIGRldicgc3R5bGUgb2YgY2hhbmdlcyAoYXMgc2Vl
bSBpbg0KPiA+IGNkbl9kcF9jbGtfZW5hYmxlKQ0KPiA+ICAzKSBhZGQgd3JpdGVsL3JlYWRsIHdy
YXBwZXJzDQo+ID4gIDQpIGhvb2t1cCBzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSwga2VlcCBkcC0+
bWhkcCBkZXRhaWwgaW50ZXJuYWwuDQo+ID4gVGhlIGNkbi1kcC1yZWcuaCBmdW5jdGlvbiBuYW1l
cy9zaWduYXR1cmVzIHdpbGwgc3RheSB0aGUgc2FtZS4NCj4gPiAgNSkgZmluYWxpemUgdGhlIGhl
bHBlcnMgLSB1c2UgbWhkcCBkaXJlY3RseSwgcmVuYW1lDQo+IA0KPiBJIHNlY29uZCB0aGlzLCBv
dGhlcndpc2UgcmV2aWV3IGlzIHZlcnkgaGFyZC4NCj4gDQpJIHdpbGwgc3BsaXQgdGhlIHBhdGNo
IGxhdGVyLCB0aGFua3MuDQoNCj4gPiBFeGFtcGxlczoNCj4gPiA0KQ0KPiA+ICBzdGF0aWMgaW50
IGNkbl9kcF9tYWlsYm94X3JlYWQoc3RydWN0IGNkbl9kcF9kZXZpY2UgKmRwKSAgew0KPiA+ICsi
ICBzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCA9IGRwLT5taGRwOw0KPiA+ICAgIGludCB2
YWwsIHJldDsNCj4gPg0KPiA+IC0gIHJldCA9IHJlYWR4X3BvbGxfdGltZW91dChyZWFkbCwgZHAt
PnJlZ3MgKyBNQUlMQk9YX0VNUFRZX0FERFIsDQo+ID4gKyAgcmV0ID0gcmVhZHhfcG9sbF90aW1l
b3V0KHJlYWRsLCBtaGRwLT5yZWdzX2Jhc2UgKw0KPiA+ICsgTUFJTEJPWF9FTVBUWV9BRERSLA0K
PiA+IC4uLg0KPiA+ICAgIHJldHVybiBmYW5jeV9yZWFkbChkcCwgTUFJTEJPWDBfUkRfREFUQSkg
JiAweGZmOyAgfQ0KPiA+DQo+ID4gNSkNCj4gPiAtc3RhdGljIGludCBjZG5fZHBfbWFpbGJveF9y
ZWFkKHN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCkNCj4gPiArc3RhdGljIGludCBtaGRwX21haWxi
b3hfcmVhZChzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCkNCj4gPiAgew0KPiA+IC0gIHN0
cnVjdCBjZG5zX21oZHBfZGV2aWNlICptaGRwID0gZHAtPm1oZHA7DQo+ID4gICAgaW50IHZhbCwg
cmV0Ow0KPiA+IC4uLg0KPiA+IC0gIHJldHVybiBmYW5jeV9yZWFkbChkcCwgTUFJTEJPWDBfUkRf
REFUQSkgJiAweGZmOw0KPiA+ICsgIHJldHVybiBjZG5zX21oZHBfYnVzX3JlYWQobWhkcCwgTUFJ
TEJPWDBfUkRfREFUQSkgJiAweGZmOw0KPiA+ICB9DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiAN
Cj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
