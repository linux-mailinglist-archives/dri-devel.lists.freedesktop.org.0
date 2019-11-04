Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C6EE8B7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DBB6E835;
	Mon,  4 Nov 2019 19:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400122.outbound.protection.outlook.com [40.107.140.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E2889309
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 10:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJBtw6YfOxX7Z3Y0wkHY/YtaKKXKlyGZp8ck/6uJ5BsURfmdX1BuNJokOw6SOfN7AetfPkXExcvHYRBptOpZUjs2naiLEmJaG6A/nF9BEQh1OeB4aHqLVfqixxuOdeMfQPX+3lYK3sn1qwRJ5JSguFnP5cMmvEv3xFaKLDUhsriGIovrYg4pu/jb23p/zE8m0OJ69mL9/rgAa+l/UjST/u+ig/WB0aoBe8Uyd5RKRHnxF3fYPE9DgnzoYhL0CRAPD5p0tVuuK0SyDPZJUAcHIhXXxNMd8ax0qd6Sr8iqNnKpTTMqCU5LOwaMqH4hp/ugukLQKYHkbBrEO7UVll85gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAqaGDnp1JrLbyN1d2SlHy4VJuehC5MF/e2SaWICLcM=;
 b=DoeKm1NiwJ0CHFhgdvZvrcUbM7glmyJpvT2hu6OVtHIgaJefJ248I39gZWijBXyvnvzXyy9AdAXLUeT2TAyWd1SR5Yff8c/UIegBcK5G1RjOMBbwm+CycQvf6A2SyBQyLyid9kw56Iw79Pj/xvOGdjDl+2+CVYiRc/1MeUgAfQ18uFewvctJs3X/c9G/5ZE/38Eb65Cx3HhKuA4aLQcwqovQrtuyTqsDBLXcgEYeVWKpnfigrYHlt+C/pvKX5txHooHN10+4hbHu1llrwH9jgtspip3mSI9D0nZDN6WDF2vvmkmmchr3PyjorxpoL0YAxxPxnBBmQ7JgSks4FVGhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1881.jpnprd01.prod.outlook.com (52.133.161.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 10:37:17 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 10:37:17 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: RE: [PATCH 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
Thread-Topic: [PATCH 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
Thread-Index: AQHVjygRmIU8xAEZp0yt4tdj0/9jaad6wvgAgAAWO8A=
Date: Mon, 4 Nov 2019 10:37:17 +0000
Message-ID: <TY1PR01MB17704E6F46C4D505B35F33E1C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <255ad3bd-b2d9-7bd7-0592-5573e672da31@baylibre.com>
In-Reply-To: <255ad3bd-b2d9-7bd7-0592-5573e672da31@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c34c33f-ccde-4bdf-6db6-08d76112f6cd
x-ms-traffictypediagnostic: TY1PR01MB1881:|TY1PR01MB1881:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB188159467CB3A2B39304128CC07F0@TY1PR01MB1881.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(26005)(8676002)(76176011)(81166006)(81156014)(8936002)(71190400001)(71200400001)(305945005)(186003)(14444005)(256004)(476003)(486006)(44832011)(7416002)(7736002)(74316002)(66066001)(86362001)(3846002)(6116002)(2906002)(52536014)(446003)(11346002)(76116006)(229853002)(99286004)(14454004)(316002)(478600001)(66946007)(110136005)(66446008)(66476007)(25786009)(66556008)(64756008)(55016002)(9686003)(6436002)(6506007)(53546011)(7696005)(102836004)(33656002)(54906003)(4326008)(5660300002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1881;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jy9+PLeeah5GYPthZUzMeH/nU/oJ8NhgtIqnrjgSq9UVwNTzkUywWWdkRRHjwP6oR4rqVI3ePF5z0R3woKVaNtlSSB/ZBR7KNZBDAQz4fFI7pFbz9csRqk/IbjSwJBurZbGCjwD/2FYghEGeZLjnU3g9z7Vjjxn2xRh/VZ2Ku58k5nyeSsZ0NHzjKlHIrXD56jjnboNrt4GkTCAiz2KN2iMI/tx6QLlSnv7vYakXLxbe6UF+a/P6vFfb5b9jaWsZrFF7lMjylLnUmoTysaxwzO5JLMNI4h/m0e4GPTfOPKB8RxlsqXmg4Y0wZSH5ZUJKtw2NLwHx74Y39ZNlxrmQqL9YQk60CCa9iii8OjoW5XhueeYEQwNqZyOKUy1ER3+fuaVsnlAofhZJYojjVzMxDqoF46NIGhINsT7iMR3NAOrwgMAY5PRa3Rz2SOwlHkvH
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c34c33f-ccde-4bdf-6db6-08d76112f6cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 10:37:17.2419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ct+jL1nbzA2uVDnk9Zajmmxasw+0oSAD3f1EuHYuSaAsciT3pdpqrHnobMr/wY+PPVxVkllcsEEQliicgYTMrTZweWxDe0ewCDl3fsfR6SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1881
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAqaGDnp1JrLbyN1d2SlHy4VJuehC5MF/e2SaWICLcM=;
 b=qtiyj1J2zbUV3hXrd6z3zR7+32wUQmDdyDKlIGrgnuFqP5vUn0ca9FD+daw1XMEMSQhxjFw4bMhlZ9abMEX0MDQ25baaOW9gsc5Jp+t1yr1zcoujOM5yGpFSNNH2SryWAJWTDcSFsM9KdBEDIdT+/eqADf/YVZ9p2D7IrgKG42U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IE5laWwg
QXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4NCj4gU2VudDogMDQgTm92ZW1iZXIg
MjAxOSAwOToxNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNF0gZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IGJyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2Rlcg0KPiANCj4gSGksDQo+IA0KPiANCj4g
T24gMzAvMTAvMjAxOSAxNDo0MywgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IEluIGFuIGVm
Zm9ydCB0byByZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMgdG8gYWxzbyBzZXJ2ZSB0aGUNCj4gPiBm
dW5jdGlvbiBvZiBMVkRTIGRlY29kZXJzLCB3ZSBlbmRlZCB1cCBkZWZpbmluZyBhIG5ldyAiZ2Vu
ZXJpYyINCj4gPiBjb21wYXRpYmxlIHN0cmluZywgdGhlcmVmb3JlIGFkYXB0IHRoZSBkdC1iaW5k
aW5ncyB0byBmaXQgdGhlDQo+ID4gbmV3IHB1cnBvc2UuDQo+IA0KPiBZb3Ugc2hvdWxkIGNvbnZl
cnQgaXQgdG8gZHQtc2NoZW1hcyBpbiB0aGlzIGNhc2UuDQoNCldpbGwgZG8uDQoNClRoYW5rcywN
CkZhYg0KDQo+IA0KPiBOZWlsDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8g
Q2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnR4dCAgICAgICAgIHwgMTAwICsr
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZk
cy10cmFuc21pdHRlci50eHQgICB8ICA2NiAtLS0tLS0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9sdmRzLWNvZGVjLnR4dA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0DQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMudHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMudHh0DQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi40NWZkODFjDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9sdmRzLWNvZGVjLnR4dA0KPiA+IEBAIC0wLDAgKzEsMTAwIEBADQo+ID4gK1RyYXNucGFyZW50
IExWRFMgZW5jb2RlcnMgYW5kIExWRFMgZGVjb2RlcnMNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArVGhpcyBiaW5kaW5nIHN1cHBv
cnRzIHRyYW5zcGFyZW50IExWRFMgZW5jb2RlcnMgYW5kIExWRFMgZGVjb2RlcnMgdGhhdCBkb24n
dA0KPiA+ICtyZXF1aXJlIGFueSBjb25maWd1cmF0aW9uLg0KPiA+ICsNCj4gPiArTFZEUyBpcyBh
IHBoeXNpY2FsIGxheWVyIHNwZWNpZmljYXRpb24gZGVmaW5lZCBpbiBBTlNJL1RJQS9FSUEtNjQ0
LUEuIE11bHRpcGxlDQo+ID4gK2luY29tcGF0aWJsZSBkYXRhIGxpbmsgbGF5ZXJzIGhhdmUgYmVl
biB1c2VkIG92ZXIgdGltZSB0byB0cmFuc21pdCBpbWFnZSBkYXRhDQo+ID4gK3RvIExWRFMgcGFu
ZWxzLiBUaGlzIGJpbmRpbmcgdGFyZ2V0cyBkZXZpY2VzIGNvbXBhdGlibGUgd2l0aCB0aGUgZm9s
bG93aW5nDQo+ID4gK3NwZWNpZmljYXRpb25zIG9ubHkuDQo+ID4gKw0KPiA+ICtbSkVJREFdICJE
aWdpdGFsIEludGVyZmFjZSBTdGFuZGFyZHMgZm9yIE1vbml0b3IiLCBKRUlEQS01OS0xOTk5LCBG
ZWJydWFyeQ0KPiA+ICsxOTk5IChWZXJzaW9uIDEuMCksIEphcGFuIEVsZWN0cm9uaWMgSW5kdXN0
cnkgRGV2ZWxvcG1lbnQgQXNzb2NpYXRpb24gKEpFSURBKQ0KPiA+ICtbTERJXSAiT3BlbiBMVkRT
IERpc3BsYXkgSW50ZXJmYWNlIiwgTWF5IDE5OTkgKFZlcnNpb24gMC45NSksIE5hdGlvbmFsDQo+
ID4gK1NlbWljb25kdWN0b3INCj4gPiArW1ZFU0FdICJWRVNBIE5vdGVib29rIFBhbmVsIFN0YW5k
YXJkIiwgT2N0b2JlciAyMDA3IChWZXJzaW9uIDEuMCksIFZpZGVvDQo+ID4gK0VsZWN0cm9uaWNz
IFN0YW5kYXJkcyBBc3NvY2lhdGlvbiAoVkVTQSkNCj4gPiArDQo+ID4gK1Rob3NlIGRldmljZXMg
aGF2ZSBiZWVuIG1hcmtldGVkIHVuZGVyIHRoZSBGUEQtTGluayBhbmQgRmxhdExpbmsgYnJhbmQg
bmFtZXMNCj4gPiArYW1vbmcgb3RoZXJzLg0KPiA+ICsNCj4gPiArDQo+ID4gK1JlcXVpcmVkIHBy
b3BlcnRpZXM6DQo+ID4gKw0KPiA+ICstIGNvbXBhdGlibGU6IE11c3QgYmUgImx2ZHMtZW5jb2Rl
ciIgZm9yIExWRFMgZW5jb2RlcnMgb3IgImx2ZHMtZGVjb2RlciIgZm9yDQo+ID4gKyAgICAgICAg
ICAgICAgTFZEUyBkZWNvZGVycy4NCj4gPiArDQo+ID4gKyAgQW55IGVuY29kZXIgY29tcGF0aWJs
ZSB3aXRoIHRoaXMgZ2VuZXJpYyBiaW5kaW5nLCBidXQgd2l0aCBhZGRpdGlvbmFsDQo+ID4gKyAg
cHJvcGVydGllcyBub3QgbGlzdGVkIGhlcmUsIG11c3QgbGlzdCBhIGRldmljZSBzcGVjaWZpYyBj
b21wYXRpYmxlIGZpcnN0DQo+ID4gKyAgZm9sbG93ZWQgYnkgdGhlIGdlbmVyaWMgY29tcGF0aWJs
ZS4NCj4gPiArDQo+ID4gK1JlcXVpcmVkIG5vZGVzOg0KPiA+ICsNCj4gPiArVGhpcyBkZXZpY2Ug
aGFzIHR3byB2aWRlbyBwb3J0cy4gVGhlaXIgY29ubmVjdGlvbnMgYXJlIG1vZGVsZWQgdXNpbmcg
dGhlIE9GDQo+ID4gK2dyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0Lg0KPiA+ICsNCj4gPiArRm9yIExWRFMgZW5jb2Rl
cnM6DQo+ID4gKy0gVmlkZW8gcG9ydCAwIGZvciBwYXJhbGxlbCBpbnB1dA0KPiA+ICstIFZpZGVv
IHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQNCj4gPiArDQo+ID4gK0ZvciBMVkRTIGRlY29kZXJzOg0K
PiA+ICstIFZpZGVvIHBvcnQgMCBmb3IgTFZEUyBpbnB1dA0KPiA+ICstIFZpZGVvIHBvcnQgMSBm
b3IgcGFyYWxsZWwgb3V0cHV0DQo+ID4gKw0KPiA+ICsNCj4gPiArTFZEUyBlbmNvZGVyIGV4YW1w
bGUNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArDQo+ID4gK2x2ZHMtZW5jb2RlciB7
DQo+ID4gKwljb21wYXRpYmxlID0gImx2ZHMtZW5jb2RlciI7DQo+ID4gKw0KPiA+ICsJcG9ydHMg
ew0KPiA+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJCSNzaXplLWNlbGxzID0gPDA+
Ow0KPiA+ICsNCj4gPiArCQlwb3J0QDAgew0KPiA+ICsJCQlyZWcgPSA8MD47DQo+ID4gKw0KPiA+
ICsJCQlsdmRzX2VuY19pbjogZW5kcG9pbnQgew0KPiA+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZkaXNwbGF5X291dF9yZ2I+Ow0KPiA+ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJ
CXBvcnRAMSB7DQo+ID4gKwkJCXJlZyA9IDwxPjsNCj4gPiArDQo+ID4gKwkJCWx2ZHNfZW5jX291
dDogZW5kcG9pbnQgew0KPiA+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX3BhbmVsX2lu
PjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+ICsJfTsNCj4gPiArfTsNCj4gPiArDQo+ID4g
K0xWRFMgZGVjb2RlciBleGFtcGxlDQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0K
PiA+ICtsdmRzLWRlY29kZXIgew0KPiA+ICsJY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIiOw0K
PiA+ICsNCj4gPiArCXBvcnRzIHsNCj4gPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAr
CQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKwkJcG9ydEAwIHsNCj4gPiArCQkJcmVn
ID0gPDA+Ow0KPiA+ICsNCj4gPiArCQkJbHZkc19kZWNfaW46IGVuZHBvaW50IHsNCj4gPiArCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmZGlzcGxheV9vdXRfbHZkcz47DQo+ID4gKwkJCX07DQo+ID4g
KwkJfTsNCj4gPiArDQo+ID4gKwkJcG9ydEAxIHsNCj4gPiArCQkJcmVnID0gPDE+Ow0KPiA+ICsN
Cj4gPiArCQkJbHZkc19kZWNfb3V0OiBlbmRwb2ludCB7DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JnJnYl9wYW5lbF9pbj47DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiArCX07DQo+
ID4gK307DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dA0KPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dA0K
PiA+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDYwMDkxZGIuLjAwMDAwMDAN
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy10cmFuc21pdHRlci50eHQNCj4gPiArKysgL2Rldi9udWxsDQo+ID4gQEAgLTEsNjYg
KzAsMCBAQA0KPiA+IC1QYXJhbGxlbCB0byBMVkRTIEVuY29kZXINCj4gPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gLQ0KPiA+IC1UaGlzIGJpbmRpbmcgc3VwcG9ydHMgdGhlIHBhcmFs
bGVsIHRvIExWRFMgZW5jb2RlcnMgdGhhdCBkb24ndCByZXF1aXJlIGFueQ0KPiA+IC1jb25maWd1
cmF0aW9uLg0KPiA+IC0NCj4gPiAtTFZEUyBpcyBhIHBoeXNpY2FsIGxheWVyIHNwZWNpZmljYXRp
b24gZGVmaW5lZCBpbiBBTlNJL1RJQS9FSUEtNjQ0LUEuIE11bHRpcGxlDQo+ID4gLWluY29tcGF0
aWJsZSBkYXRhIGxpbmsgbGF5ZXJzIGhhdmUgYmVlbiB1c2VkIG92ZXIgdGltZSB0byB0cmFuc21p
dCBpbWFnZSBkYXRhDQo+ID4gLXRvIExWRFMgcGFuZWxzLiBUaGlzIGJpbmRpbmcgdGFyZ2V0cyBk
ZXZpY2VzIGNvbXBhdGlibGUgd2l0aCB0aGUgZm9sbG93aW5nDQo+ID4gLXNwZWNpZmljYXRpb25z
IG9ubHkuDQo+ID4gLQ0KPiA+IC1bSkVJREFdICJEaWdpdGFsIEludGVyZmFjZSBTdGFuZGFyZHMg
Zm9yIE1vbml0b3IiLCBKRUlEQS01OS0xOTk5LCBGZWJydWFyeQ0KPiA+IC0xOTk5IChWZXJzaW9u
IDEuMCksIEphcGFuIEVsZWN0cm9uaWMgSW5kdXN0cnkgRGV2ZWxvcG1lbnQgQXNzb2NpYXRpb24g
KEpFSURBKQ0KPiA+IC1bTERJXSAiT3BlbiBMVkRTIERpc3BsYXkgSW50ZXJmYWNlIiwgTWF5IDE5
OTkgKFZlcnNpb24gMC45NSksIE5hdGlvbmFsDQo+ID4gLVNlbWljb25kdWN0b3INCj4gPiAtW1ZF
U0FdICJWRVNBIE5vdGVib29rIFBhbmVsIFN0YW5kYXJkIiwgT2N0b2JlciAyMDA3IChWZXJzaW9u
IDEuMCksIFZpZGVvDQo+ID4gLUVsZWN0cm9uaWNzIFN0YW5kYXJkcyBBc3NvY2lhdGlvbiAoVkVT
QSkNCj4gPiAtDQo+ID4gLVRob3NlIGRldmljZXMgaGF2ZSBiZWVuIG1hcmtldGVkIHVuZGVyIHRo
ZSBGUEQtTGluayBhbmQgRmxhdExpbmsgYnJhbmQgbmFtZXMNCj4gPiAtYW1vbmcgb3RoZXJzLg0K
PiA+IC0NCj4gPiAtDQo+ID4gLVJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gLQ0KPiA+IC0tIGNv
bXBhdGlibGU6IE11c3QgYmUgImx2ZHMtZW5jb2RlciINCj4gPiAtDQo+ID4gLSAgQW55IGVuY29k
ZXIgY29tcGF0aWJsZSB3aXRoIHRoaXMgZ2VuZXJpYyBiaW5kaW5nLCBidXQgd2l0aCBhZGRpdGlv
bmFsDQo+ID4gLSAgcHJvcGVydGllcyBub3QgbGlzdGVkIGhlcmUsIG11c3QgbGlzdCBhIGRldmlj
ZSBzcGVjaWZpYyBjb21wYXRpYmxlIGZpcnN0DQo+ID4gLSAgZm9sbG93ZWQgYnkgdGhpcyBnZW5l
cmljIGNvbXBhdGlibGUuDQo+ID4gLQ0KPiA+IC1SZXF1aXJlZCBub2RlczoNCj4gPiAtDQo+ID4g
LVRoaXMgZGV2aWNlIGhhcyB0d28gdmlkZW8gcG9ydHMuIFRoZWlyIGNvbm5lY3Rpb25zIGFyZSBt
b2RlbGVkIHVzaW5nIHRoZSBPRg0KPiA+IC1ncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4NCj4gPiAtDQo+ID4gLS0g
VmlkZW8gcG9ydCAwIGZvciBwYXJhbGxlbCBpbnB1dA0KPiA+IC0tIFZpZGVvIHBvcnQgMSBmb3Ig
TFZEUyBvdXRwdXQNCj4gPiAtDQo+ID4gLQ0KPiA+IC1FeGFtcGxlDQo+ID4gLS0tLS0tLS0NCj4g
PiAtDQo+ID4gLWx2ZHMtZW5jb2RlciB7DQo+ID4gLQljb21wYXRpYmxlID0gImx2ZHMtZW5jb2Rl
ciI7DQo+ID4gLQ0KPiA+IC0JcG9ydHMgew0KPiA+IC0JCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiA+IC0JCSNzaXplLWNlbGxzID0gPDA+Ow0KPiA+IC0NCj4gPiAtCQlwb3J0QDAgew0KPiA+IC0J
CQlyZWcgPSA8MD47DQo+ID4gLQ0KPiA+IC0JCQlsdmRzX2VuY19pbjogZW5kcG9pbnQgew0KPiA+
IC0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5X291dF9yZ2I+Ow0KPiA+IC0JCQl9Ow0K
PiA+IC0JCX07DQo+ID4gLQ0KPiA+IC0JCXBvcnRAMSB7DQo+ID4gLQkJCXJlZyA9IDwxPjsNCj4g
PiAtDQo+ID4gLQkJCWx2ZHNfZW5jX291dDogZW5kcG9pbnQgew0KPiA+IC0JCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZsdmRzX3BhbmVsX2luPjsNCj4gPiAtCQkJfTsNCj4gPiAtCQl9Ow0KPiA+IC0J
fTsNCj4gPiAtfTsNCj4gPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
