Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5E182ADB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8436EA7A;
	Thu, 12 Mar 2020 08:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85E6EA38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 06:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8ZtrOkbFZ9eS1Il8Lbe5yQygynfeqt3TJIFSrWqSnCvr00vvV+gbVqnQ2PPBsTqIZ+JTOyIUUhEcKXV0UgmcwhP9TPLlveaVHk6mNC/TEa9aUW4a8ek2ZbrzkaIKRdgC0aBix6IsXpi3LjLGiVNQkt0bVf/lZnRR77nBr2dKIFPkwvEWGQ38Vxv9r0eJ3cibAZkVaxv82SS55h50+ODssEORlPKGoEGVfzg6r3dlQobv4OTCvq89HHJVnMRuPb5TIPn3imWxaDM3Zt5i26qDUQEKJruO95zBIbJf2W6BdCeNvNCfa3wHg7D4u2ZqkZgYhv/R+9aEWxS5fI+luu56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pijApoQi0HlJ/dnb2YhgymVPosk+HKcA08dXgC2L7k=;
 b=O6BeDE5ueubwLr6a+qi5i/KXc4ILgKVVJMOXEuwXiyiQKtIbNIuFm6suSR4wIcPYfvh0o2ntORAndmb6XGCd6yRTadWMKX5zTzz8dSgzrgDgCpg52xd/AAefN8d36qnKYdnxiRNsaYei+P34F9DqvdlhQxWfK9UC9xeMvrdZMfCs/KrHV9XtrwS/XPbgRJGmzsOOzubwu+yr1S60GkLOen89KZiIrUYDpWG/0Q68GNLh5w52NclEGO/tgSrH9b5Rnn2Kn2ktTzpUlqhOimnranzyAHu88fAehJ7mEPZTrKPRZ9LBVp4bzVglJ/E7Uii55YpAJddylXk/cvrQG4qBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pijApoQi0HlJ/dnb2YhgymVPosk+HKcA08dXgC2L7k=;
 b=jKxcS2ayoljYNISIKZii8DkGdx/Lz61ujIszEhrmL823a8psVu5hwCuB0/wdb9BhsQek9fzGApKeMVDXNvZRzS1fMhBghPROGTDaRAsxwGUS3wDM3YiiNX5zIP3PUq7u5iBuCFBIRuGTc3I+WrRZ119enwWFzb1DtJXCMdnkplQ=
Received: from BYAPR02MB4056.namprd02.prod.outlook.com (2603:10b6:a02:fa::20)
 by BYAPR02MB5750.namprd02.prod.outlook.com (2603:10b6:a03:11a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Thu, 12 Mar
 2020 06:39:37 +0000
Received: from BYAPR02MB4056.namprd02.prod.outlook.com
 ([fe80::d9a7:a7c:c8e4:bc09]) by BYAPR02MB4056.namprd02.prod.outlook.com
 ([fe80::d9a7:a7c:c8e4:bc09%5]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 06:39:37 +0000
From: Rohit Visavalia <RVISAVAL@xilinx.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, Devarsh Thakkar <DEVARSHT@xilinx.com>
Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Topic: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Index: AQHV679WeVrf3O3SQkeitn5ZLHO5bqguuqpwgAgodoCAAAdrAIANpFUA
Date: Thu, 12 Mar 2020 06:39:37 +0000
Message-ID: <BYAPR02MB4056A1136D4354043D95B2E9B3FD0@BYAPR02MB4056.namprd02.prod.outlook.com>
References: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
 <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
 <BYAPR02MB5382500BD847244DC731B454BCE40@BYAPR02MB5382.namprd02.prod.outlook.com>
 <CAKb7UvgGAmuHC=CGGcZ9PV6Qxn=cEwBTuB10GqBT1GfbR0UvHA@mail.gmail.com>
In-Reply-To: <CAKb7UvgGAmuHC=CGGcZ9PV6Qxn=cEwBTuB10GqBT1GfbR0UvHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=RVISAVAL@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7b51c9d4-164a-4a0c-ca94-08d7c6502297
x-ms-traffictypediagnostic: BYAPR02MB5750:|BYAPR02MB5750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB57501D9391FD2F36342630A8B3FD0@BYAPR02MB5750.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(199004)(316002)(52536014)(66556008)(2906002)(66476007)(66446008)(66946007)(66574012)(64756008)(76116006)(110136005)(33656002)(26005)(5660300002)(6636002)(54906003)(86362001)(107886003)(478600001)(8676002)(9686003)(55016002)(6506007)(53546011)(81166006)(8936002)(186003)(4326008)(7696005)(71200400001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5750;
 H:BYAPR02MB4056.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1RmU4Ten//MHQFpZGmYSBBjWRu8lMSIobxlq4j/xheP765BS+0ncFKK/IE1pD1I4lvZbpITd0gYc7trQIDScdAAQW20IoTpuXa37AF5xewt8XyH8GZs7MGqiFqka4eosKWA8vr+ZANDxZbMugdtzOYDd6oPeYSe5OZAXaVDP6yHL2PVmwrDvQbVU2E4FrOkySRyhK26rXOXHJKW0eYA+teUwAAIlx8H6OqL2uwmT1fTDMQz/t2Jm9KLNXp/WaV9G6eKvW6J0Pee3HUZZg8BskLsKK+50Obj4Ii1N/hsBN5Br8e1PAF1djWFzU/Ft9wF8l8zJN27VlIGyUZ9DHgz2s1+Gzm1EmA6eijAlflQ33kO2D3r/LaR1ckKTVBeld8c4AN1sgPVVLax1VaiXu/B58iqs/ePBecR0XANYS2eW9dSsc1RcfObV/sr9Cp4Swxw
x-ms-exchange-antispam-messagedata: SAFpA8nd6Ym9xJqMw/oIHUMPC5SXkvptP/Jc/eJTKjftDOxXOSpTTCC16SIcggfdpHDEZh4mD2Q4+1Q/fzVpWH9XyujHWmU0Ces4gcPvIXN98Su10JmcJ5DyRV3QK/t2xIhAJnNqsja/C9Zv3MrzRQ==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b51c9d4-164a-4a0c-ca94-08d7c6502297
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 06:39:37.4541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euaU3p28tPsZ47CQr+CM9Ffn26IjImgy3jF/agz69ROR3ZqcZVxjT8C7CJxFklOZElIwuK+M4RWYicoLgWCjaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5750
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Ranganathan Sk <rsk@xilinx.com>, Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSWxpYSBNaXJraW4sDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KQnkgb2xkLWZhc2hp
b25lZCB3YXkgeW91IG1lYW4gdG8gc2F5IHVzaW5nIGRybU1vZGVDcnRjU2V0R2FtbWEoKT8gSWYg
eWVzIHRoZW4sIGl0IHNob3dzIGVycm9yIGFzICJmYWlsZWQgdG8gc2V0IGdhbW1hOiBGdW5jdGlv
biBubyBpbXBsZW1lbnRlZCIgaWYgYW55IHBsYXRmb3JtIHNwZWNpZmljIGRybSBoYXMgbm8gZ2Ft
bWEgcHJvcGVydHkgaW1wbGVtZW50ZWQuDQoNCkN1cnJlbnQgY29kZSBzaG93cyBlcnJvciB3aGls
ZSBydW5uaW5nIG1vZGV0ZXN0IGZvciBYaWxpbnggZHJtIGFzIGl0IGRvZXNuJ3Qgc3VwcG9ydHMg
Z2FtbWEgcHJvcGVydHkgYW5kIGlkZWFsbHkgaXQgc2hvdWxkIG5vdCBzaG93IGVycm9yIGFzIGdh
bW1hIGlzIG9wdGlvbmFsIHByb3BlcnR5LCBzbyBpdCBkb2Vzbid0IHNlcnZlIHRoZSBwdXJwb3Nl
IG9mIG9wdGlvbmFsIHByb3BlcnR5Lg0KDQpQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIG1pc3Np
bmcgYW55dGhpbmcuDQoNClRoYW5rcw0KUm9oaXQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBJbGlhIE1pcmtpbiBbbWFpbHRvOmltaXJraW5AYWx1bS5taXQuZWR1XQ0K
PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAzLCAyMDIwIDc6MDggUE0NCj4gVG86IERldmFyc2ggVGhh
a2thciA8REVWQVJTSFRAeGlsaW54LmNvbT4NCj4gQ2M6IFJvaGl0IFZpc2F2YWxpYSA8UlZJU0FW
QUxAeGlsaW54LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tOyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPjsgSHl1bg0KPiBLd29uIDxoeXVua0B4aWxpbnguY29tPjsgUmFuZ2FuYXRo
YW4gU2sgPHJza0B4aWxpbnguY29tPjsgRGhhdmFsDQo+IFJhamVzaGJoYWkgU2hhaCA8ZHNoYWhA
eGlsaW54LmNvbT47IFZhcnVua3VtYXIgQWxsYWdhZGFwYQ0KPiA8VkFSVU5LVU1AeGlsaW54LmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBsaWJkcm1dIG1vZGV0ZXN0OiBjYWxsIGRybU1vZGVD
cnRjU2V0R2FtbWEoKSBvbmx5IGlmDQo+IGFkZF9wcm9wZXJ0eV9vcHRpb25hbCByZXR1cm5zIHRy
dWUNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBQcmV0dHkgc3VyZSB0aGUgY3VycmVudCBj
b2RlIGlzIHJpZ2h0LiBJZiB0aGUgR0FNTUFfTFVUIHByb3BlcnR5IGNhbid0IGJlIHNldCwNCj4g
aXQgdHJpZXMgdG8gc2V0IGdhbW1hIHRoZSBvbGQtZmFzaGlvbmVkIHdheS4NCj4gDQo+IE9uIFR1
ZSwgTWFyIDMsIDIwMjAgYXQgODoxMiBBTSBEZXZhcnNoIFRoYWtrYXIgPERFVkFSU0hUQHhpbGlu
eC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUm9oaXQsDQo+ID4NCj4gPiBUaGlzIG1ha2Vz
IHNlbnNlIHRvIG1lIGFzIGdhbW1hIHdhcyBpbXBsZW1lbnRlZCBhcyBvcHRpb25hbCBwcm9wZXJ0
eS4NCj4gPiBSZXZpZXdlZC1CeTogIkRldmFyc2ggVGhha2thciA8ZGV2YXJzaC50aGFra2FyQHhp
bGlueC5jb20+Ig0KPiA+DQo+ID4gQGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tLCBAaW1pcmtp
bkBhbHVtLm1pdC5lZHUsIEBWaWxsZSBTeXJqw6Rsw6QsDQo+IENvdWxkIHlvdSBwbGVhc2UgYWNr
IGFuZCBoZWxwIG1lcmdlIHRoaXMgcGF0Y2ggaWYgaXQgYWxzbyBsb29rIGdvb2QgdG8geW91ID8N
Cj4gPg0KPiA+IFJlZ2FyZHMsDQo+ID4gRGV2YXJzaA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUm9oaXQgVmlzYXZhbGlhDQo+ID4gPiBTZW50OiAy
NyBGZWJydWFyeSAyMDIwIDAwOjQwDQo+ID4gPiBUbzogUm9oaXQgVmlzYXZhbGlhIDxSVklTQVZB
TEB4aWxpbnguY29tPjsNCj4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlt
aXJraW5AYWx1bS5taXQuZWR1Ow0KPiA+ID4gZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20NCj4g
PiA+IENjOiBIeXVuIEt3b24gPGh5dW5rQHhpbGlueC5jb20+OyBSYW5nYW5hdGhhbiBTayA8cnNr
QHhpbGlueC5jb20+Ow0KPiA+ID4gRGhhdmFsIFJhamVzaGJoYWkgU2hhaCA8ZHNoYWhAeGlsaW54
LmNvbT47IFZhcnVua3VtYXIgQWxsYWdhZGFwYQ0KPiA+ID4gPFZBUlVOS1VNQHhpbGlueC5jb20+
OyBEZXZhcnNoIFRoYWtrYXIgPERFVkFSU0hUQHhpbGlueC5jb20+DQo+ID4gPiBTdWJqZWN0OiBS
RTogW1BBVENIIGxpYmRybV0gbW9kZXRlc3Q6IGNhbGwgZHJtTW9kZUNydGNTZXRHYW1tYSgpDQo+
ID4gPiBvbmx5IGlmIGFkZF9wcm9wZXJ0eV9vcHRpb25hbCByZXR1cm5zIHRydWUNCj4gPiA+DQo+
ID4gPiBHZW50bGUgcmVtaW5kZXIuDQo+ID4gPg0KPiA+ID4gKyBJbGlhIE1pcmtpbiwgK0VtaWwg
VmVsaWtvdi4NCj4gPiA+DQo+ID4gPiBUaGFua3MgJiBSZWdhcmRzLA0KPiA+ID4gUm9oaXQNCj4g
PiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFJv
aGl0IFZpc2F2YWxpYSBbbWFpbHRvOnJvaGl0LnZpc2F2YWxpYUB4aWxpbnguY29tXQ0KPiA+ID4g
PiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNSwgMjAyMCAzOjA4IFBNDQo+ID4gPiA+IFRvOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+IENjOiBIeXVuIEt3b24gPGh5
dW5rQHhpbGlueC5jb20+OyBSYW5nYW5hdGhhbiBTayA8cnNrQHhpbGlueC5jb20+Ow0KPiA+ID4g
PiBEaGF2YWwgUmFqZXNoYmhhaSBTaGFoIDxkc2hhaEB4aWxpbnguY29tPjsgVmFydW5rdW1hciBB
bGxhZ2FkYXBhDQo+ID4gPiA+IDxWQVJVTktVTUB4aWxpbnguY29tPjsgRGV2YXJzaCBUaGFra2Fy
IDxERVZBUlNIVEB4aWxpbnguY29tPjsNCj4gPiA+ID4gUm9oaXQgVmlzYXZhbGlhIDxSVklTQVZB
TEB4aWxpbnguY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggbGliZHJtXSBtb2RldGVzdDog
Y2FsbCBkcm1Nb2RlQ3J0Y1NldEdhbW1hKCkgb25seQ0KPiA+ID4gPiBpZiBhZGRfcHJvcGVydHlf
b3B0aW9uYWwgcmV0dXJucyB0cnVlDQo+ID4gPiA+DQo+ID4gPiA+IGdhbW1hIGlzIGEgb3B0aW9u
YWwgcHJvcGVydHkgdGhlbiBhbHNvIGl0IHByaW50cyBlcnJvciBtZXNzYWdlLCBzbw0KPiA+ID4g
PiBzZXQgZ2FtbWEgb25seSBpZiBhZGRfcHJvcGVydHlfb3B0aW9uYWwoKSByZXR1cm5zIHRydWUu
DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvaGl0IFZpc2F2YWxpYSA8cm9oaXQu
dmlzYXZhbGlhQHhpbGlueC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgdGVzdHMvbW9kZXRl
c3QvbW9kZXRlc3QuYyB8IDIgKy0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
bW9kZXRlc3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMNCj4gPiA+ID4g
aW5kZXggYjkwN2FiMy4uMzc5YjllYSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvdGVzdHMvbW9kZXRl
c3QvbW9kZXRlc3QuYw0KPiA+ID4gPiArKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jDQo+
ID4gPiA+IEBAIC0xMTM4LDcgKzExMzgsNyBAQCBzdGF0aWMgdm9pZCBzZXRfZ2FtbWEoc3RydWN0
IGRldmljZSAqZGV2LA0KPiA+ID4gPiB1bnNpZ25lZCBjcnRjX2lkLCB1bnNpZ25lZCBmb3VyY2Mp
DQo+ID4gPiA+DQo+ID4gPiA+ICAgICBhZGRfcHJvcGVydHlfb3B0aW9uYWwoZGV2LCBjcnRjX2lk
LCAiREVHQU1NQV9MVVQiLCAwKTsNCj4gPiA+ID4gICAgIGFkZF9wcm9wZXJ0eV9vcHRpb25hbChk
ZXYsIGNydGNfaWQsICJDVE0iLCAwKTsNCj4gPiA+ID4gLSAgIGlmICghYWRkX3Byb3BlcnR5X29w
dGlvbmFsKGRldiwgY3J0Y19pZCwgIkdBTU1BX0xVVCIsIGJsb2JfaWQpKSB7DQo+ID4gPiA+ICsg
ICBpZiAoYWRkX3Byb3BlcnR5X29wdGlvbmFsKGRldiwgY3J0Y19pZCwgIkdBTU1BX0xVVCIsIGJs
b2JfaWQpKQ0KPiA+ID4gPiArIHsNCj4gPiA+ID4gICAgICAgICAgICAgdWludDE2X3QgclsyNTZd
LCBnWzI1Nl0sIGJbMjU2XTsNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgICAgICAgZm9yIChpID0g
MDsgaSA8IDI1NjsgaSsrKSB7DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuNy40DQo+ID4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
