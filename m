Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BFF41DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F66F88E;
	Fri,  8 Nov 2019 08:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400094.outbound.protection.outlook.com [40.107.140.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2327E6E4F8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 19:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/yErBdpq7mLxS6kyUj0/FawySvdRbBf58tUm/AAE/Yb8VbbM87FMoGMGaykcQjRa9BYJIFHaoULUFUE41UuayeTl9BPrNA2Rgh9Ap7ZPqubuyKab1fi9of5JEwRiq/WwbL4ZBsMdD4B++wmgIHWcIQutv+wvwjIKePfm0Mlcqvwn5npiWFL+mwkN1CBK9ihkFsbHofTBtWjeUmngRLZ6225yNQsrcdFQfo527VdmLwjfh5jqNc2KORKHg5dJfkizAP2CAn4YT8GWw/xcQQ/ypaOBPAudkY37MYpjVS0BYaDhRaIxORn3dtlCf6sQK5/b1f5dgzi9SFYBFJB0DYP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZZn+saoiIsyX8sU3FRJhuPouRvDo8p9bY2Nh0PbrDo=;
 b=Y+3ij+xOtbhc7P6dGulZ5K9rUGsvivvrB9yx2PMMgoimLDqwzJKZgxIdrNq5AlWfpWgAHQLs7DORFZ5m+uTAF8ocKo208MkCCHVYlcDx9NeratVL3hXLynj7KaNd+PlpIHrM94mEneoNmjeQbX+58MpuvDMtYyDu+jZddABeEEd0JslbYEzT1uftubSbR7K8e6MUJ1axNwJKm/oUplhNWdZZzKPvb5moT7HcZZar9j6m4wbwyBeU41TeBLP5UfbSZA6ZuYMBc+9ZppzYC4d5yNwVEYjE/mrU+5oG4cqmNZQ3W4g6Gu6Cug+mG5iHsKjmQ63u+KX7lu6hyMPFjnKUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1804.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Thu, 7 Nov 2019 19:42:32 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 19:42:31 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Topic: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Index: AQHVkzESR2xpe9fL00q33GVpoGbh06d7hZaAgADCn0CAAIh/AIADTzOw
Date: Thu, 7 Nov 2019 19:42:30 +0000
Message-ID: <TY1PR01MB177056A1C63DDE5EEE8329BBC0780@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
 <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
In-Reply-To: <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 841ce889-04c9-4095-d13c-08d763baa166
x-ms-traffictypediagnostic: TY1PR01MB1804:|TY1PR01MB1804:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1804DF3C73B4225032C72C52C0780@TY1PR01MB1804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(71190400001)(7736002)(71200400001)(76116006)(52536014)(14444005)(256004)(5660300002)(6436002)(6116002)(99286004)(229853002)(25786009)(66446008)(64756008)(66556008)(54906003)(66946007)(66476007)(4326008)(86362001)(305945005)(55016002)(316002)(6306002)(3846002)(9686003)(6506007)(14454004)(76176011)(478600001)(33656002)(6246003)(186003)(26005)(7696005)(7416002)(11346002)(81166006)(102836004)(8936002)(2906002)(53546011)(81156014)(8676002)(966005)(476003)(74316002)(66066001)(446003)(44832011)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1804;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RF/h1kngdgXH3O6TparFa0NeeMLejIjXL3D9OKlEWwLL+RHGuoxcAw8wsospTv1eCQP8vmRqrJk55hYv5dlqMb63VyRVVyR2zaLJTUCVLduk7AvZL8W3F1nKj5NluyMYUZJT4BoZ6CU8WljwryIcbGs88msyOnCaFvn4D5uKbD1vDux2CsjPl7qQApHZI+HcFOVxpdqdnY1b6KXocreAlOyAoLO//UquFbDIV/Qncp1dDrrp7of3Y5V870NbWjUd/ILBGyvCQeJurRBUk6ybojDQAdeC5dn9G84sstFCg9efr1lEKTnj0wyXCtuV2IhmozF7aXZQchAJ1kGy7uDaaC/GyBSyFz1O8PDoChscIz/qio7qtQg8guknH+9yRCZqH7pZEF2/reMI/iNZjdLiYB9dsxkRR49oIT7BisegQ5d33Spy4ZvRIY4g6HVCLIW3hG+NJD2pD7dwUrKi4EC2iH+NHPQY9vstMWoSQ9RCNUY=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841ce889-04c9-4095-d13c-08d763baa166
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 19:42:31.3124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N27/aI72mzHxPxu3nqz8DIofsL0ecn36fRf9B+mLrrncdoKiwkDqOOeEDCsAsfuyeYRVvfzBJk6Z4lkyz74DMXFAc5X1ON/YYLEmILRL3/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1804
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZZn+saoiIsyX8sU3FRJhuPouRvDo8p9bY2Nh0PbrDo=;
 b=iN6YmSCfAEBiOWpNYCnZ3T9XTNnzxk9Cwwdq7I8fJ7I3+PxF9dGFZg0AR35548RIQfoA29BwtesFGcukdB/239FXqreBcAR6nj6Yn3p85irpogmaVgTtBlEIYMF8STfnPvI4TGl8vthnn1OutKo49V6AmqJQR9uzUttMTGHetHU=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>, "open list:MEDIA
 DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMDUgTm92ZW1iZXIgMjAxOSAx
NzowOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6
IGJyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2Rlcg0KPiANCj4gT24gVHVlLCBOb3YgNSwgMjAx
OSBhdCAzOjMzIEFNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhlbGxvIFJvYiwNCj4gPg0KPiA+IFRoYW5rIHlvdSBm
b3IgeW91ciBmZWVkYmFjayENCj4gPg0KPiA+ID4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IDA0IE5vdmVtYmVyIDIwMTkgMjE6MjMNCj4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi80XSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBS
ZXB1cnBvc2UgbHZkcy1lbmNvZGVyDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBOb3YgNCwgMjAxOSBh
dCAxMDo1OCBBTSBGYWJyaXppbyBDYXN0cm8NCj4gPiA+IDxmYWJyaXppby5jYXN0cm9AYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBJbiBhbiBlZmZvcnQgdG8gcmVwdXJw
b3NlIGx2ZHMtZW5jb2Rlci5jIHRvIGFsc28gc2VydmUgdGhlDQo+ID4gPiA+IGZ1bmN0aW9uIG9m
IExWRFMgZGVjb2RlcnMsIHdlIGVuZGVkIHVwIGRlZmluaW5nIGEgbmV3ICJnZW5lcmljIg0KPiA+
ID4gPiBjb21wYXRpYmxlIHN0cmluZywgdGhlcmVmb3JlIGFkYXB0IHRoZSBkdC1iaW5kaW5ncyB0
byBmaXQgdGhlDQo+ID4gPiA+IG5ldyBwdXJwb3NlLiBBbHNvLCBjb252ZXJ0IHRoZSBkdC1iaW5k
aW5ncyBmcm9tIC50eHQgdG8gLnlhbWwNCj4gPiA+ID4gd2hpbGUgYXQgaXQuDQo+ID4gPg0KPiA+
ID4gIkFsc28sIC4uLiB3aGlsZSBhdCBpdC4iIGlzIGEgc2lnbiBmb3Igc3BsaXQgaW50byAyIHBh
dGNoZXMuDQo+ID4NCj4gPiBXaWxsIHNwbGl0IGludG8gMiBwYXRjaGVzDQo+ID4NCj4gPiA+DQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gdjEtPnYyOg0KPiA+
ID4gPiAqIENvbnZlcnRlZCB0byBkdC1zY2hlbWEgYXMgcGVyIE5laWwncyBjb21tZW50DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMu
eWFtbCAgICAgICAgfCAxMTcgKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQgICB8ICA2NiAtLS0tLS0t
LS0tLS0NCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDY2IGRl
bGV0aW9ucygtKQ0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwNCj4gPiA+ID4g
IGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9s
dmRzLWNvZGVjLnlhbWwNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbA0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwLi5mZjc5YmMyDQo+ID4gPiA+IC0tLSAvZGV2L251
bGwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbA0KPiA+ID4gPiBAQCAtMCwwICsxLDExNyBAQA0KPiA+
ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ID4gPiArJVlBTUwg
MS4yDQo+ID4gPiA+ICstLS0NCj4gPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sIw0KPiA+ID4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK3RpdGxlOiBUcmFzbnBhcmVudCBMVkRTIGVuY29kZXJzIGFuZCBMVkRTIGRlY29k
ZXJzDQo+ID4gPg0KPiA+ID4gVHlwbw0KPiA+DQo+ID4gV2lsbCBmaXgNCj4gPg0KPiA+ID4NCj4g
PiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gTGF1cmVudCBQaW5j
aGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+
ICsNCj4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgIFRoaXMgYmluZGluZyBzdXBw
b3J0cyB0cmFuc3BhcmVudCBMVkRTIGVuY29kZXJzIGFuZCBMVkRTIGRlY29kZXJzIHRoYXQgZG9u
J3QNCj4gPiA+ID4gKyAgcmVxdWlyZSBhbnkgY29uZmlndXJhdGlvbi4NCj4gPiA+ID4gKw0KPiA+
ID4gPiArICBMVkRTIGlzIGEgcGh5c2ljYWwgbGF5ZXIgc3BlY2lmaWNhdGlvbiBkZWZpbmVkIGlu
IEFOU0kvVElBL0VJQS02NDQtQS4gTXVsdGlwbGUNCj4gPiA+ID4gKyAgaW5jb21wYXRpYmxlIGRh
dGEgbGluayBsYXllcnMgaGF2ZSBiZWVuIHVzZWQgb3ZlciB0aW1lIHRvIHRyYW5zbWl0IGltYWdl
IGRhdGENCj4gPiA+ID4gKyAgdG8gTFZEUyBwYW5lbHMuIFRoaXMgYmluZGluZyB0YXJnZXRzIGRl
dmljZXMgY29tcGF0aWJsZSB3aXRoIHRoZSBmb2xsb3dpbmcNCj4gPiA+ID4gKyAgc3BlY2lmaWNh
dGlvbnMgb25seS4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICBbSkVJREFdICJEaWdpdGFsIEludGVy
ZmFjZSBTdGFuZGFyZHMgZm9yIE1vbml0b3IiLCBKRUlEQS01OS0xOTk5LCBGZWJydWFyeQ0KPiA+
ID4gPiArICAxOTk5IChWZXJzaW9uIDEuMCksIEphcGFuIEVsZWN0cm9uaWMgSW5kdXN0cnkgRGV2
ZWxvcG1lbnQgQXNzb2NpYXRpb24gKEpFSURBKQ0KPiA+ID4gPiArICBbTERJXSAiT3BlbiBMVkRT
IERpc3BsYXkgSW50ZXJmYWNlIiwgTWF5IDE5OTkgKFZlcnNpb24gMC45NSksIE5hdGlvbmFsDQo+
ID4gPiA+ICsgIFNlbWljb25kdWN0b3INCj4gPiA+ID4gKyAgW1ZFU0FdICJWRVNBIE5vdGVib29r
IFBhbmVsIFN0YW5kYXJkIiwgT2N0b2JlciAyMDA3IChWZXJzaW9uIDEuMCksIFZpZGVvDQo+ID4g
PiA+ICsgIEVsZWN0cm9uaWNzIFN0YW5kYXJkcyBBc3NvY2lhdGlvbiAoVkVTQSkNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICBUaG9zZSBkZXZpY2VzIGhhdmUgYmVlbiBtYXJrZXRlZCB1bmRlciB0aGUg
RlBELUxpbmsgYW5kIEZsYXRMaW5rIGJyYW5kIG5hbWVzDQo+ID4gPiA+ICsgIGFtb25nIG90aGVy
cy4NCj4gPiA+ID4gKw0KPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ID4gKyAgY29tcGF0aWJs
ZToNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAgQW55IGVuY29k
ZXIgb3IgZGVjb2RlciBjb21wYXRpYmxlIHdpdGggdGhpcyBnZW5lcmljIGJpbmRpbmcsIGJ1dCB3
aXRoDQo+ID4gPiA+ICsgICAgICBhZGRpdGlvbmFsIHByb3BlcnRpZXMgbm90IGxpc3RlZCBoZXJl
LCBtdXN0IGRlZmluZSBpdHMgb3duIGJpbmRpbmcgYW5kDQo+ID4gPiA+ICsgICAgICBsaXN0IGEg
ZGV2aWNlIHNwZWNpZmljIGNvbXBhdGlibGUgZmlyc3QgZm9sbG93ZWQgYnkgdGhlIGdlbmVyaWMg
Y29tcGF0aWJsZQ0KPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiArICAgICAgLSBlbnVtOg0K
PiA+ID4NCj4gPiA+IFlvdSBjYW4gZHJvcCAnaXRlbXMnIHdoZW4gdGhlcmUncyBvbmx5IDEuDQo+
ID4NCj4gPiBXaWxsIGRyb3ANCj4gPg0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICAgLSBsdmRzLWVu
Y29kZXIgIyBmb3IgTFZEUyBlbmNvZGVycw0KPiA+ID4gPiArICAgICAgICAtIGx2ZHMtZGVjb2Rl
ciAjIGZvciBMVkRTIGRlY29kZXJzDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcG9ydHM6DQo+ID4g
PiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+
ID4gKyAgICAgIFRoaXMgZGV2aWNlIGhhcyB0d28gdmlkZW8gcG9ydHMuIFRoZWlyIGNvbm5lY3Rp
b25zIGFyZSBtb2RlbGVkIHVzaW5nIHRoZQ0KPiA+ID4gPiArICAgICAgT0YgZ3JhcGggYmluZGlu
Z3Mgc3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50
eHQNCj4gPiA+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAgcG9ydEAwOg0KPiA+
ID4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246
IHwNCj4gPiA+ID4gKyAgICAgICAgICBXaXRoIExWRFMgZW5jb2RlcnMgcG9ydCAwIGlzIGZvciBw
YXJhbGxlbCBpbnB1dA0KPiA+ID4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBwb3J0
IDAgaXMgZm9yIExWRFMgaW5wdXQNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgcG9ydEAxOg0K
PiA+ID4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gKyAgICAgICAgZGVzY3JpcHRp
b246IHwNCj4gPiA+ID4gKyAgICAgICAgICBXaXRoIExWRFMgZW5jb2RlcnMgcG9ydCAxIGlzIGZv
ciBMVkRTIG91dHB1dA0KPiA+ID4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBwb3J0
IDEgaXMgZm9yIHBhcmFsbGVsIG91dHB1dA0KPiA+ID4NCj4gPiA+IHBvcnRAKiBhcmUgcmVxdWly
ZWQsIHJpZ2h0Pw0KPiA+DQo+ID4gWWVzLCBwb3J0QDAgYW5kIHBvcnRAMSBhcmUgYm90aCByZXF1
aXJlZCwgc2ltaWxhcmx5IHRvOg0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1sDQo+ID4gdGhlcmVmb3JlIEkgaGF2ZSBwdXQgInBv
cnRzIiB1bmRlciAicmVxdWlyZWQiLCBpbiBhIHNpbWlsYXIgZmFzaGlvbi4NCj4gPiBXaGF0J3Mg
dGhlIHJpZ2h0IHdheSBvZiBzcGVjaWZ5aW5nIHRoaXM/DQo+IA0KPiBTYW1lIGFzIGFueSBvdGhl
ciBwcm9wZXJ0eToNCj4gDQo+IHJlcXVpcmVkOg0KPiAgIC0gcG9ydEAwDQo+ICAgLSBwb3J0QDEN
Cj4gDQo+IEF0IHRoZSBjb3JyZWN0IGxldmVsIG9mIGNvdXJzZS4NCg0KR290Y2hhDQoNCldpbGwg
c2VuZCB2MyBzaG9ydGx5Lg0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gUm9iDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
