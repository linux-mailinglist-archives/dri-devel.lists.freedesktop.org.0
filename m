Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D4BB514
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F2789E7B;
	Mon, 23 Sep 2019 13:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20137.outbound.protection.outlook.com [40.107.2.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5548E6E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue7R7a4HZaau7RElEm0W36wIc9B07O/hVvqHpbJ1tOq7e92LrR85iQdSBoDZ3awcE0FmhFZgu03XzZwoILl6MksJlTvGlQx+uQ1ii+xgabnx0PzJz4wAobjrIXUERQYNt0zC8+F7ExDN09X89hliqpG64PdUA0tJ2xax3z0J8cEiohgwyZ9gtsrsYdYiMz7E6C6miaTeBrkJnBM6d+sWC0C9sKPXzkpuFzlczi04RFqXIyK69ynS2s827pSHTwKsJV0E+qnwCkNVz58eSgKSyDLnd3MvAn8L9mtD8dGR4GOOcfSOt2Yfy0mbaR00mxI3g5KuqMmJ52+nOkgx0IzWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvquhNSsVtQb+bdWIl5cbds+dAgrB0L/xnIFrbx7OaM=;
 b=NBTugUFqeYNTrmLKpiwA9LZBP4ZGrP4F5C2fH05OIYyFRYFcVRpnrdj9oJNYfmJbXsp29/b241iNi74qOPWTR55wU0F7fWenKPG0/ZuUKGHFIZ/JZ81l7CyKdMUKIbV74EQIe7kn5kElEkkM7UBYkZQoUD+N7fksytc3bo9u2z9ewrlJ/0fEJB7ZhbfUzvTguBbzHG0hj0B4rKaSyX8T0Zj0XIt0sLPlKksnjydum6RFlHcUxqsOX/uskaEWNYuVi3uIyewWanU9jqUWcgJpf01PShNI7CstgiZMZ3caLJcYuv6g60qsJTv+efJyZONSbaQeCPRxHUlMI24j65fn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB3998.eurprd05.prod.outlook.com (52.134.18.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 09:07:31 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::1179:c881:a516:644d]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::1179:c881:a516:644d%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:07:31 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "marcel@ziswiler.com" <marcel@ziswiler.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: add vendor prefix for logic
 technologies limited
Thread-Topic: [PATCH v1 1/2] dt-bindings: add vendor prefix for logic
 technologies limited
Thread-Index: AQHVb4i4IUSP2AwIZ0a1numwyARFt6c4/ZYA
Date: Mon, 23 Sep 2019 09:07:31 +0000
Message-ID: <c01adde46cbae1d1fd96142699964be4cc50b1fb.camel@toradex.com>
References: <20190920075411.15735-1-marcel@ziswiler.com>
In-Reply-To: <20190920075411.15735-1-marcel@ziswiler.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 623a0d77-bed4-45d3-6ddf-08d740057763
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3998; 
x-ms-traffictypediagnostic: VI1PR0502MB3998:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0502MB3998A148721ED8CB3A04AE9AF4850@VI1PR0502MB3998.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(199004)(189003)(966005)(478600001)(2906002)(86362001)(2501003)(14454004)(25786009)(305945005)(2616005)(476003)(64756008)(66556008)(66476007)(66946007)(6506007)(102836004)(99286004)(7736002)(36756003)(11346002)(486006)(186003)(26005)(76176011)(7416002)(6116002)(3846002)(76116006)(91956017)(66446008)(66066001)(6512007)(6486002)(446003)(44832011)(118296001)(6246003)(6436002)(4326008)(6306002)(54906003)(71200400001)(71190400001)(110136005)(316002)(8676002)(5660300002)(229853002)(8936002)(256004)(81156014)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3998;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gPFlSnaogp6aXGBQO3RrjoCJpRHa6scdpe3vSTu/LsDJXvk53snJ2OEIfipfQUFd6Uj3Xph3fG3UydjSaQLjySpjKWelSoL1JvWMwF1lY/9Aw3hZgdZ2MzgszoQSBdpFVLCvW1YNdZAPn8l+bfF3o7B19a+KukhTyLf9QIrlC5zhADcSFQmIxQVN+x2umymMyEBPuKhQZqhZVB1u8BF5sB+sZIp+mJpPhyrICXd8l27/SzNe5zwaE5ubiSAiUlKtNpUme3J+R+jUAWh4qq0TrwIfWzy3Loz3NvcZCxWeYDZPRem1zs9nbI+51uo35ivTITgsycoxWpmoeeAsZTqNGb3r8UzP4mDpkMjhTC4fO6yO4jDVksn7KO9LRP7s0zbye6Jn30MCyFHzzbuQtK9lbPv3U4GFXfOkVuPr4qN4dRw=
Content-ID: <DD1B69EE8639114A9D5A17707CD8BDA9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623a0d77-bed4-45d3-6ddf-08d740057763
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:07:31.6304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQcetqy9A8CW5zDJoD3ovptEgL0XW+2IjYp7o9nhb0jzxuhg28i1dcLIir+gzhQ9zOWyTNNsH6IQ4haL+YOL+qAxWXdcpMEaQcG9qCrzhz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3998
X-Mailman-Approved-At: Mon, 23 Sep 2019 13:17:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvquhNSsVtQb+bdWIl5cbds+dAgrB0L/xnIFrbx7OaM=;
 b=oM22KBNHUgAz/m9JRugOr8SJUorn+wbm8k8CPwc3CnTIwjfKAw5xxEzTMwo/n1g32Vop9iB9tdgM3+/IwZ/g/XOdaXYupKHjrK0EkLZU8Hx3PXqsplOkTX9lqZtydGyn0ZHNFn0IGLgUXSz4JFhkYpgvgWiRvs6VVIuu1sWLuYU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "info@logictechno.com" <info@logictechno.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "icenowy@aosc.io" <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTIwIGF0IDA5OjU0ICswMjAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
PiANCj4gQWRkIHZlbmRvciBwcmVmaXggZm9yIExvZ2ljIFRlY2hub2xvZ2llcyBMaW1pdGVkIFsx
XSB3aGljaCBpcyBhDQo+IENoaW5lc2UNCj4gZGlzcGxheSBtYW51ZmFjdHVyZXIgZS5nLiBkaXN0
cmlidXRlZCBieSBHZXJtYW4gRW5kcmljaCBCYXVlbGVtZW50ZQ0KPiBWZXJ0cmllYnMgR21iSCBb
Ml0uDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb2dpY3RlY2huby5jb20vY29udGFjdC11cy8NCj4gWzJd
IA0KPiBodHRwczovL3d3dy5lbmRyaWNoLmNvbS9pc2k1MF9pc2kzMF90ZnQtZGlzcGxheXMvbHQx
NzA0MTAtMXdoY19pc2kzMA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyY2VsIFppc3dpbGVyIDxt
YXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQoNClJldmlld2VkLWJ5OiBQaGlsaXBwZSBTY2hl
bmtlciA8cGhpbGlwcGUuc2NoZW5rZXJAdG9yYWRleC5jb20+DQoNCj4gDQo+IC0tLQ0KPiANCj4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8
IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwNCj4gaW5kZXggOTY3ZTc4YzVlYzBhLi4xNDQxMTQ2ZjM5NGYgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwNCj4gQEAgLTU0MSw2ICs1NDEsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gICAgICBk
ZXNjcmlwdGlvbjogTGluZWFyIFRlY2hub2xvZ3kgQ29ycG9yYXRpb24NCj4gICAgIl5sb2dpY3Bk
LC4qIjoNCj4gICAgICBkZXNjcmlwdGlvbjogTG9naWMgUEQsIEluYy4NCj4gKyAgIl5sb2dpY3Rl
Y2hubywuKiI6DQo+ICsgICAgZGVzY3JpcHRpb246IExvZ2ljIFRlY2hub2xvZ2llcyBMaW1pdGVk
DQo+ICAgICJebG9uZ2NoZWVyLC4qIjoNCj4gICAgICBkZXNjcmlwdGlvbjogTG9uZ2NoZWVyIFRl
Y2hub2xvZ3kgKFNoYW5naGFpKSBDby4sIEx0ZC4NCj4gICAgIl5sc2ksLioiOg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
