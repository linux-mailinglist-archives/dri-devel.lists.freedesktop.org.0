Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFC91180
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814B6EA85;
	Sat, 17 Aug 2019 15:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400101.outbound.protection.outlook.com [40.107.140.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902246E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:49:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4thBny2TbXy0Vp7rqcQOSEEst2nFh7Yo/BsHebwrTIsL3lZkxL4SlohJcfpuPCQF2iAXBUPtXvaDcPRj1DL2Yr2GUaYV9NGNl7/q/fzAUt5ylS/MwJC5iiXjRz/b62MRdMPbBnd2XOJ1lIVovdw4zdN7Z7jaGts+xo11adJHhW3/+3E5b6zmNdJElDEyZTjuyuZKORmNywuadJceoCTZEFncl38WBjT5bCikVVQiLfEXIlgAx7thQSjJ5zACZFSCkigW1mtqo1x7zzO34lPM1KJ8yMmR8MMWxEhG8JVvXln2mnB1W8E2gckiPiHznghmfoGf4P02CKLspSIG8Dkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J6J8ysDaXHvcb+fJF+dmhcVHPzrVWbllg1pk0hU1cc=;
 b=iy4HfYSPWwpaDH8He7fTW4L+dhbRPXKY0A3BOcL/4jHO2MtFCAGO9bOIJ9G9i4Uqdqnybj3Hrspgz6mUztdPQq9+IiietQZWF9z0zwfPMYSPa+t/SbDGiNPXqS8QK7x1ZfusI5kTD9R1v0cDf5XFVn/4t5d474Uy8JpUDdCCB0TDcohnIkfThNiHttpZuuJh/e3Vg5oOKZj9J37osv1Sg+GufRxBNklXkRIZxtCY+Q7Wg19dicnKeFMtNWqo+d18jeUy7aj1M1w4t44IJxJr2SdsI6Je+/eRl9MhPsiBAwmu3BuhqT/3W5QOWgP62R6S5GGkjPRcPFXV9mRaJooYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1705.jpnprd01.prod.outlook.com (52.133.164.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 13:49:10 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:49:10 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Topic: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Index: AQHVU1lR1gJ71LUS4EifTwZDwmXYxab8HCOAgAAdRRA=
Date: Thu, 15 Aug 2019 13:49:09 +0000
Message-ID: <TY1PR01MB1770F80560B2B2DFEE2F3BB7C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815120315.GL5011@pendragon.ideasonboard.com>
In-Reply-To: <20190815120315.GL5011@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: accc042c-a348-4be1-0c2a-08d721875969
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1705; 
x-ms-traffictypediagnostic: TY1PR01MB1705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1705C945E198916CAFA79D1BC0AC0@TY1PR01MB1705.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(7416002)(52536014)(8676002)(86362001)(6506007)(8936002)(81156014)(25786009)(66066001)(53546011)(71190400001)(11346002)(81166006)(476003)(66556008)(64756008)(66446008)(76116006)(186003)(26005)(2906002)(33656002)(256004)(5024004)(7736002)(66946007)(6916009)(305945005)(102836004)(446003)(5660300002)(66476007)(74316002)(71200400001)(7696005)(6116002)(3846002)(6436002)(76176011)(53936002)(44832011)(486006)(99286004)(54906003)(55016002)(316002)(9686003)(478600001)(6246003)(4326008)(14454004)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1705;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U4g6LICR1tpLGFY0A56AXJrerIDlW8Bvpa2Y9fhiaNmQZs38X7AVtGnRmyY6Wgtt619UhsifAwH+yM6lfbUSQLpSiZs5X3sWavhMljfCIA1D3o5bl+ydJGmjL/nGDJBa+SP0ZFb5w037Rv1+39ESt0wzs+kQfpVRXBq43C5stCbjis23nXsC803xN0RODMzpsAV8Vsu4GhOV8PG+u7MXHYGYrvUQbMx1MEV/zO55JHdU5bAIrXNKjnTGK8zpjQ2hn9M4bTIczc0XKkWpkyK/KbLDkCXyMMM5p+7/hpS2l0gQKZ/ucT5kbxytv9rVfzSe1vtpF4XN84OEk5jWIou8sdNGADsCnpp3CHznZg0+adj2fBwYg3Mz3+ybXEQxPMCD83+AuDvCrnloiAV1jw8me3kiu95wNlNzWTmTwI0Z1Xs=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: accc042c-a348-4be1-0c2a-08d721875969
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:49:09.8104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUU/8wp9oV+loqH4+kYEXLMET94hevh9QOT82KwHxIJYhXT+nIj0HVXc3wJfm5Tl0pniQ9A63w/9zJtViTrt+WaenVK0c15ZIgVFIjCF5LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1705
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J6J8ysDaXHvcb+fJF+dmhcVHPzrVWbllg1pk0hU1cc=;
 b=h//n2EikSg8hMoyxqC3hDQRF3DVNbw1wD5xPtRhQ9ZAPqJ5e+j9NM3Hvmz7eR0RgJC8qVe2leaXNpfY9P9TEAY9Cbd0D1xs0whYceuilmnafvO4+OQgfi3lGJK9vJ7QGdROxAnf2USKQUJnHb0J4yjmj80NLt/xS8TqUY3zs8ZU=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206
IGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1z
b2Mtb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTGF1cmVudCBQaW5jaGFydA0K
PiBTZW50OiAxNSBBdWd1c3QgMjAxOSAxMzowMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDUv
OV0gZHJtL3BhbmVsOiBBZGQgdGltaW5ncyBmaWVsZCB0byBkcm1fcGFuZWwNCj4gDQo+IEhpIEZh
YnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUsIEF1
ZyAxNSwgMjAxOSBhdCAxMjowNDoyOVBNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+
ID4gV2UgbmVlZCB0byBrbm93IGlmIHRoZSBwYW5lbCBzdXBwb3J0cyBkdWFsLWxpbmssIHNpbWls
YXJseQ0KPiA+IHRvIGJyaWRnZXMsIHRoZXJlZm9yZSBhZGQgYSByZWZlcmVuY2UgdG8gZHJtX3Rp
bWluZ3MgaW4NCj4gPiBkcm1fcGFuZWwuDQo+IA0KPiBQYW5lbHMgbWF5IGFsc28gbmVlZCB0byBy
ZXBvcnQgc2V0dXAvaG9sZCB0aW1lLCBzbyBpdCdzIG5vdCBhYm91dA0KPiBkdWFsLWxpbmsgb25s
eS4gSSB3b3VsZCBtYWtlIHRoaXMgZXhwbGljaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpP
aw0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2Fz
dHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICogbmV3
IHBhdGNoDQo+ID4NCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggfCAzICsrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaA0KPiA+IGluZGV4
IDhjNzM4YzAuLmNkNmZmMDcgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVs
LmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaA0KPiA+IEBAIC0yNiw2ICsyNiw3
IEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9saXN0Lmg+DQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3RpbWluZ3MuaD4NCj4gDQo+IFlv
dSBjYW4ganVzdCBhZGQgYSBmb3J3YXJkLWRlY2xhcmF0aW9uIG9mIHN0cnVjdCBkcm1fdGltaW5n
Lg0KDQpPaw0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPg0KPiA+ICBzdHJ1Y3QgZGV2aWNlX25v
ZGU7DQo+ID4gIHN0cnVjdCBkcm1fY29ubmVjdG9yOw0KPiA+IEBAIC04MSw2ICs4Miw3IEBAIHN0
cnVjdCBkcm1fcGFuZWxfZnVuY3Mgew0KPiA+ICAgKiBzdHJ1Y3QgZHJtX3BhbmVsIC0gRFJNIHBh
bmVsIG9iamVjdA0KPiA+ICAgKiBAZHJtOiBEUk0gZGV2aWNlIG93bmluZyB0aGUgcGFuZWwNCj4g
PiAgICogQGNvbm5lY3RvcjogRFJNIGNvbm5lY3RvciB0aGF0IHRoZSBwYW5lbCBpcyBhdHRhY2hl
ZCB0bw0KPiA+ICsgKiBAdGltaW5nczogdGltaW5nIGluZm9ybWF0aW9uDQo+ID4gICAqIEBkZXY6
IHBhcmVudCBkZXZpY2Ugb2YgdGhlIHBhbmVsDQo+ID4gICAqIEBsaW5rOiBsaW5rIGZyb20gcGFu
ZWwgZGV2aWNlIChzdXBwbGllcikgdG8gRFJNIGRldmljZSAoY29uc3VtZXIpDQo+ID4gICAqIEBm
dW5jczogb3BlcmF0aW9ucyB0aGF0IGNhbiBiZSBwZXJmb3JtZWQgb24gdGhlIHBhbmVsDQo+ID4g
QEAgLTg5LDYgKzkxLDcgQEAgc3RydWN0IGRybV9wYW5lbF9mdW5jcyB7DQo+ID4gIHN0cnVjdCBk
cm1fcGFuZWwgew0KPiA+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybTsNCj4gPiAgCXN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQo+ID4gKwljb25zdCBzdHJ1Y3QgZHJtX3RpbWluZ3Mg
KnRpbWluZ3M7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4NCj4gPiAgCWNvbnN0IHN0
cnVjdCBkcm1fcGFuZWxfZnVuY3MgKmZ1bmNzOw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+
IExhdXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
