Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4512470A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB266E316;
	Wed, 18 Dec 2019 12:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410115.outbound.protection.outlook.com [40.107.141.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB82891AA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:00:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtKEasdgiXZt+wSQBxMq/9G8YYFW0AOpTl7ITMZa9LC+o8OeI3Ancp1woglyrrqcFNfuVpPg9ey08k76Al4S1LcHUaIpg0+8+xxEuW0FKoNnavgpmLtnLhPR2r6B93JAu24t8WKIcbIEGGgInNHOASfnSvWX9PJ2bXtaW/O79iKG3vbYM1vfZ09Lz3THkPmf5srZa+Tl3Wpok6BorJbX2erY2+y/mykdBdh8uP8/MBbaL/Pk2jJ77e9ii9b+vW0mMM/C2QQ/AWJdWr37fAwOtBNGPs5gXrNu4T05eg0VK6LLMMVc9OUZu5r9w1LcilJQdyGn6YSdPPF6gJ+qsyD3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPCeBQ1wGlWQ+st006T1iVkz5oXvHd1UHdDfF1cr3yE=;
 b=fBzktjZyA+RZiXUFiu1cO/kTb5AI5AEanoM67AMAy5Z6FumcP+khxzjZWgXH8Fspph7IG+UEPknP7WfpW99SUQQU4EJyQURsG0e5VLjAJb65xU3s9b//1SpZmFCVsGLUaWNQltzCy1RoNp5O1XAal/u23HBr9gpI4NZUIlHUf2br91eeU0ADjLlRc8oflCvYbJwdTc7R5URQQw73H2JTN9v5Q1cHVfs95poLfi0K8YUQA3k1hV4x8zSaPD+9lX1UALQqQYmEciAJw+BEfzFFYfQdrbwTETFROJ9+s89n09NTTDRGi6y/ezc/RRn5pqK0tNE64ZWUU9WaRJVL/H/kgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPCeBQ1wGlWQ+st006T1iVkz5oXvHd1UHdDfF1cr3yE=;
 b=AxP3R+j6f/pk5tqNsOrG/9kN/owJGNC5A+d+KijJ/1slbodFrKqamc/KkBsciDzJyFZqMhdOxmOjR82vgN2m3EEV5k65JIEZ4RS3ZOs6XPSoaZqhkU/Pj18KO8OA7dVDxgTHgGKblDd+ENDlItZAqC2QecpE30vPm2/ddXEuiTE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1514.jpnprd01.prod.outlook.com (52.133.161.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 12:00:50 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 12:00:49 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Topic: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Index: AQHVmjpQshhfnt50Ik69GSb05e3v8ae4fAYAgAXgh5CAABfsAIAAAEyggAAEpYCAABUQAIAAiR2QgAAR3gCAANeNoA==
Date: Wed, 18 Dec 2019 12:00:49 +0000
Message-ID: <TY1PR01MB17709A9984949B5AEDBD761FC0530@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
 <20191217135414.GA4741@pendragon.ideasonboard.com>
 <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20191217230856.GE4874@pendragon.ideasonboard.com>
In-Reply-To: <20191217230856.GE4874@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 51b4532f-68cd-4330-b28e-08d783b1ecb0
x-ms-traffictypediagnostic: TY1PR01MB1514:|TY1PR01MB1514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1514C9C086F156E1FADD0A39C0530@TY1PR01MB1514.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(7416002)(478600001)(6916009)(4326008)(7696005)(33656002)(9686003)(81166006)(81156014)(86362001)(55016002)(8936002)(8676002)(316002)(2906002)(44832011)(52536014)(71200400001)(5660300002)(53546011)(54906003)(26005)(186003)(66476007)(64756008)(66446008)(66556008)(66946007)(6506007)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1514;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2XBsI9JHhR6VYS5wmW4KMRq5NAIJI30IwDyhcGVBDaFXrNH66qkCk7J71+FU89RFf6OS3tmmR6Z+1segozIzKt4ukIDuQFq0fBv99V1fv/hWHt6zrPQwlMj74JlLAp3vEqfNXKaT1HlW2b8ZOBJ8Mv6UGoBKVXqXxz/MMjF8n3CY1v/a8poZxH1/pMB7ctVwxL0cvx3LZaDxlB3g1qBul4jNLObvvAnnGjT9QKB+HXd2Z17PGSeP9T4k05mAVoY7Djj/irmMbLDOJzpc7xc2TETtWgiqQEgQLM5MHqywsiGa+8zMMT45wRCFj64EiJZnkO1lGQFJIUB2r7K/fsyc1Z0RJv2AIn7bL2JQ2D5m21wPJFHigwabYG85WOKnTV0Usi35TuWeTxGP5p3cqa22xyJavUjVxNmpfy7MZWJtAGVciWxdB1R4cAM7+xnwuA1w
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b4532f-68cd-4330-b28e-08d783b1ecb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:00:49.7378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IEY1UFRVVIBogv1cu/cD4CUyyC/kLiegx0dPeN7+mt9Gs/cjE1bK1tlpuRKorxH8yIHJUBPJrqEZDMTNoMUCCBrmfYJWwMdTuGdsNnmRvs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1514
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJl
bmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGlu
Y2hhcnQNCj4gU2VudDogMTcgRGVjZW1iZXIgMjAxOSAyMzowOQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDA2LzEzXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBBZGQgImx2ZHMtZGVjb2RlciIg
c3VwcG9ydA0KPiANCj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTA6MDY6MTRQTSArMDAwMCwg
RmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IE9uIDE3IERlY2VtYmVyIDIwMTkgMTM6NTQsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIERlYyAxNywgMjAxOSBhdCAwMToz
ODo1MVBNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPj4gT24gVHVlLCBE
ZWMgMTcsIDIwMTkgYXQgMTozMSBQTSBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gPj4+IE9u
IDE3IERlY2VtYmVyIDIwMTkgMTI6MjEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+
Pj4+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDEyOjAzIFBNIEZhYnJpemlvIENhc3RybyB3cm90
ZToNCj4gPiA+Pj4+PiBPbiAxMyBEZWNlbWJlciAyMDE5IDE3OjExLCBMYXVyZW50IFBpbmNoYXJ0
IHdyb3RlOg0KPiA+ID4+Pj4+PiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwMzo1MToyNVBNICsw
MDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gPj4+Pj4+PiBBZGQgc3VwcG9ydCBmb3Ig
dHJhbnNwYXJlbnQgTFZEUyBkZWNvZGVycyBieSBhZGRpbmcgYSBuZXcNCj4gPiA+Pj4+Pj4+IGNv
bXBhdGlibGUgc3RyaW5nICgibHZkcy1kZWNvZGVyIikgdG8gdGhlIGRyaXZlci4NCj4gPiA+Pj4+
Pj4+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIG1lbWJlciBjb25uZWN0b3JfdHlwZSB0byBzdHJ1Y3Qg
bHZkc19jb2RlYywNCj4gPiA+Pj4+Pj4+IGFuZCB0aGF0J3MgYmVjYXVzZSBMVkRTIGRlY29kZXJz
IGhhdmUgYSBkaWZmZXJlbnQgY29ubmVjdG9yIHR5cGUNCj4gPiA+Pj4+Pj4+IGZyb20gTFZEUyBl
bmNvZGVycy4gV2UgZmlsbCB0aGlzIG5ldyBtZW1iZXIgdXAgd2l0aCB0aGUgZGF0YQ0KPiA+ID4+
Pj4+Pj4gbWF0Y2hpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+ID4+Pj4+Pj4NCj4gPiA+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jDQo+ID4gPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2x2ZHMtY29kZWMuYw0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEBAIC02NSw2
ICs2Nyw3IEBAIHN0YXRpYyBpbnQgbHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiA+ID4+Pj4+Pj4gICAgIGlmICghbHZkc19jb2RlYykNCj4gPiA+Pj4+Pj4+
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+ICsg
ICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOw0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+PiBJJ20gbm93IGdldHRpbmcg
YSBjb21waWxhdGlvbiBmYWlsdXJlIGhlcmU6DQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jOiBJbiBmdW5jdGlvbiDigJhsdmRzX2NvZGVj
X3Byb2Jl4oCZOg0KPiA+ID4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMu
Yzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlmZmVyZW50
IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtDQo+IGNhc3RdDQo+ID4gPj4+Pj4+ICAgbHZk
c19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgm
cGRldi0+ZGV2KTsNCj4gPiA+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
Cj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gVGhlIGZpeCBzaG91bGQgYmUgc2ltcGxlOg0KPiA+ID4+
Pj4+Pg0KPiA+ID4+Pj4+PiAgICAgICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1aW50
cHRyX3Qpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ID4gPj4+Pj4+DQo+ID4gPj4+
Pj4+IEknbSBib3RoZXJlZCBieSB0aGUgZmFjdCB0aGF0IEkndmUgY29tcGlsZWQgdGhpcyBiZWZv
cmUgd2l0aG91dCBhbnkNCj4gPiA+Pj4+Pj4gaXNzdWUsIHNvIHRoaXMgcmVhbGx5IHB1enpsZXMg
bWUuIERvIHlvdSBnZXQgdGhlIHNhbWUgd2FybmluZyA/DQo+ID4gPj4+Pj4NCj4gPiA+Pj4+PiBU
aGUgd2FybmluZyBhcHBlYXJzIHdoZW4gY29tcGlsaW5nIGZvciBhcm02NCwgdW5kZXJzdGFuZGFi
bHkgc28uDQo+ID4gPj4+Pj4gV2UgbXVzdCBoYXZlIGNvbXBpbGVkIHRoaXMgZm9yIGFybSBvbmx5
IHRoZSBmaXJzdCB0aW1lIGFyb3VuZC4NCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IEkgdGhpbmsgdGhl
IHJpZ2h0IHdheSB0byBzb2x2ZSB0aGlzIGlzIHRvIGVpdGhlciBjYXN0IHRvICh1MzIpKHVpbnRw
dHJfdCkgb3IgKHUzMikodW5zaWduZWQgbG9uZykuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSnVzdCBj
YXN0aW5nIHRvIHVpbnRwdHJfdCBzaG91bGQgYmUgc3VmZmljaWVudC4NCj4gPiA+Pj4NCj4gPiA+
Pj4gSXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHRoZSBjb21waWxlciwgYnV0IEkgaGF2ZSBz
ZWVuIGV4YW1wbGVzIHdoZXJlIHBlb3BsZQ0KPiA+ID4+PiBwcmVmZXJyZWQgdG8gYmUgZXhwbGlj
aXQsIGxpa2UgaW46DQo+ID4gPj4+IGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMN
Cj4gPiA+Pj4gZHJpdmVycy9sZWRzL2xlZHMtcG04MDU4LmMNCj4gPiA+Pj4NCj4gPiA+Pj4gU2lu
Y2UgdGhlIGtlcm5lbCBpcyBpbmNyZWFzaW5nIGl0cyB0aWdodG5lc3Mgd2l0aCByZXNwZWN0IHRv
IHdhcm5pbmdzLCBJIHBlcnNvbmFsbHkgcHJlZmVyDQo+ID4gPj4+ICh1MzIpKHVpbnRwdHJfdCks
IGV2ZW4gdGhvdWdoIG5vdCBzdHJpY3RseSBuZWNlc3NhcnksIGJ1dCBJIGFtIGZpbmUgd2l0aCAo
dWludHB0cl90KSBpZiB5b3UNCj4gPiA+Pj4gZG9uJ3QgbGlrZSAodTMyKSh1aW50cHRyX3QpLg0K
PiA+ID4+DQo+ID4gPj4gSXQgZGVwZW5kcy4gSSB0cnkgdG8gaGF2ZSBhcyBmZXcgY2FzdHMgYXMg
cG9zc2libGUgKCJjYXN0cyBhcmUgZXZpbCIpLg0KPiA+ID4+DQo+ID4gPj4gV2hpbGUgYWRkaW5n
IHRoZSBleHRyYSAodTMyKSBjYXN0IG1ha2VzIGl0IGNsZWFyZXIgdGhhdCB0aGUgaW50ZW5kZWQN
Cj4gPiA+PiByZXN1bHQgaXMgYSB1MzIgKGZvciBub3cpLCBpdCB3aWxsIGNhdXNlIHNpbGVudCB0
cnVuY2F0aW9uIG9uIDY0LWJpdCBpZg0KPiA+ID4+IGNvbm5lY3Rvcl90eXBlIGlzIGV2ZXIgZW5s
YXJnZWQgdG8gdW5zaWduZWQgbG9uZywgYW5kIGxhcmdlciB2YWx1ZXMgYXJlDQo+ID4gPj4gdXNl
ZC4NCj4gPiA+Pg0KPiA+ID4+IEluIHRoaXMgcGFydGljdWxhciBjYXNlIHRoaXMgaXMgdW5saWtl
bHksIHRob3VnaCwgYXMgdW5zaWduZWQgbG9uZyB3b3VsZA0KPiA+ID4+IHN0aWxsIGJlIDMyLWJp
dCBvbiAzMi1iaXQgcGxhdGZvcm1zLCBzbyB0aGUgbGFyZ2VyIHZhbHVlcyBjYW5ub3QgYmUNCj4g
PiA+PiB1c2VkLg0KPiA+ID4NCj4gPiA+IEkgYWxzbyB0cnkgdG8gYWRkIGFzIGZldyBjYXN0cyBh
cyBwb3NzaWJsZSwgc28gKHVpbnRwdHJfdCkgd291bGQgYmUgbXkNCj4gPiA+IHByZWZlcmVuY2Uu
DQo+ID4gPg0KPiA+ID4gRmFicml6aW8sIGNvdWxkIHlvdSBzdWJtaXQgYSBuZXcgdmVyc2lvbiBv
ZiB0aGlzIHBhdGNoIHdpdGggdGhlIHByb2JsZW0NCj4gPiA+IGZpeGVkIChhbmQgd2l0aCB0aGUg
Y2FzdHMgeW91IGRlY2lkZSB0byB1c2UsIGJ1dCB1c2luZyB1aW50cHRyX3QgaW5zdGVhZA0KPiA+
ID4gb2YgdW5zaWduZWQgbG9uZyBpbiBhbnkgY2FzZSkgPw0KPiA+DQo+ID4gV2lsbCBzZW5kIGEg
bmV3IHZlcnNpb24gdG9tb3Jyb3cgd2l0aCAodWludHB0cl90KQ0KPiANCj4gRG9uZSBhcyB2NC4x
IDotKQ0KDQpUaGFuayB5b3UhDQoNCkZhYg0KDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
