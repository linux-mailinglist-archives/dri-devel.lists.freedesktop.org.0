Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F55F2D7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6869D6E25D;
	Thu,  4 Jul 2019 06:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFC46E25D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:30:48 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5229.eurprd08.prod.outlook.com (10.255.27.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:30:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:30:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/6] arm/komeda: Add side_by_side support
Thread-Topic: [PATCH 0/6] arm/komeda: Add side_by_side support
Thread-Index: AQHVMjIDC/ZcHd3edEanzROZCyvHmQ==
Date: Thu, 4 Jul 2019 06:30:46 +0000
Message-ID: <20190704063011.7431-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:2e::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a969773-981a-4a5b-f69d-08d70049258d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5229; 
x-ms-traffictypediagnostic: VE1PR08MB5229:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR08MB5229AC11A06FF7475B7A2F5EB3FA0@VE1PR08MB5229.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(189003)(199004)(6506007)(66066001)(110136005)(386003)(54906003)(103116003)(2906002)(316002)(186003)(86362001)(2201001)(52116002)(55236004)(99286004)(26005)(102836004)(6486002)(50226002)(25786009)(478600001)(71200400001)(71190400001)(6512007)(6436002)(6306002)(4326008)(68736007)(53936002)(14454004)(2616005)(966005)(476003)(486006)(36756003)(81166006)(8676002)(256004)(14444005)(81156014)(8936002)(305945005)(7736002)(66946007)(6116002)(73956011)(66476007)(66556008)(64756008)(66446008)(3846002)(2501003)(5660300002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5229;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fWMASs9OPmis2MdD3Y/pkkNKMlfFX4fXI9Nh4wl7x/y1gvkYO7iPghoFQgRAjHKS20dDr5hvztpeGpMAoGDrNYuop2AzaC7wVBIfhJMyxCVKg90T0f/f26Eafsn88mUJl2yPl/DuWAw22LhII+dVjShi2AwSgw4xna2Vd8UJaPF8OnwEzwDNq121dBu0+TcgkR6ZYttMJt/mqTNevCgQiUINLr9bff0anAbZ2MLVgUQbvZmGXPyQSJu03TZF2onlMBdaTswM31LyIWL8OJXKXeFZPXHcjueM7DVJX2YJqQeYwDE+ocUuIweH+AXEDJdoPGX+2sXHkMZ9utvEdY8Y1PaTiHaVSAw+m1PG98JH0icQhyKJiFuvhkIIR5iVWWu1F8EImWaRJaBk0nWj/bS96110KBL4U0ht7HXHh7tbB24=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a969773-981a-4a5b-f69d-08d70049258d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:30:46.2036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA9r2LAEqNmQCjJFLocOWL30qRGVdGyGxVj95VNJ/Do=;
 b=cxk323EEEgaQyZDv+l8kjfGFaRUTSelx8ZjegVIBm0ZlLNEl9nEb/Z1WuvLaoScVwntx9ouZRoNtcPu77t6Z3ELzdoUQQr09e2/92yFOnLtAIgm8ZBJe+BuqwJjqIVLbzOToPD75uMY8IZQpcqP4xCf/tRR9EfGcqoAT/GiBlo8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29tZWRhIEhXIGNhbiBzdXBwb3J0IHNpZGUgYnkgc2lkZSwgd2hpY2ggc3BsaXRzIHRoZSBpbnRl
cm5hbCBkaXNwbGF5CnByb2Nlc3NpbmcgdG8gdHdvIHNpbmdsZSBoYWx2ZXMgKExFRlQvUklHSFQp
IGFuZCBoYW5kbGUgdGhlbSBieSB0d28KcGlwZWxpbmVzIHNlcGFyYXRlbHkgYW5kIHNpbXVsdGFu
ZW91c2x5LgpBbmQgc2luY2UgYSBzaW5wbGUgcGlwZWxpbmUgb25seSBoYW5kbGVzIGhhbGYgdGhl
IHBpeGVsIHByb2Nlc3NvciwgdGhlCm1haW4gZW5naW5lIGNsb2NrIHJlcXVpcmVtZW50IGNhbiBi
ZSBoYWx2ZWQuCgpUaGUgZGF0YSBmbG93IG9mIHNpZGVfYnlfc2lkZSBhcyBibG93OgoKIHNsYXZl
LmxheWVyMCAtPlwgICAgICAgICAgICAgICAgICAvLT4gc2xhdmUud2JfbGF5ZXIgLT4gbWVtLmZi
LnJpZ2h0X3BhcnQKICAgICAuLi4gICAgICAgICAtPiBzbGF2ZS5jb21waXogLT4KIHNsYXZlLmxh
eWVyMyAtPi8gICAgICAgICAgICAgICAgICBcLT4gc2xhdmUuaW1wcm9jZXNzb3ItPgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXCAgIC8t
PiBvdXRwdXQtbGluazAKIG1hc3Rlci5sYXllcjAgLT5cICAgICAgICAgICAgICAgICAgIC8tPiBt
YXN0ZXIuaW1wcm9jZXNzb3IgLT5cLT4gb3V0cHV0LWxpbmsxCiAgICAgLi4uICAgICAgICAgIC0+
IG1hc3Rlci5jb21waXogLT4KIG1hc3Rlci5sYXllcjMgLT4vICAgICAgICAgICAgICAgICAgIFwt
PiBtYXN0ZXIud2JfbGF5ZXIgLT4gbWVtLmZiLmxlZnRfcGFydAoKRGVwZW5kcyBvbjoKLSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYyMjgwLwoKSmFtZXMgUWlhbiBX
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDYpOgogIGRybS9rb21lZGE6IEFkZCBzaWRlIGJ5
IHNpZGUgYXNzZW1ibGluZwogIGRybS9rb21lZGE6IEFkZCBzaWRlIGJ5IHNpZGUgcGxhbmVfc3Rh
dGUgc3BsaXQKICBkcm0va29tZWRhOiBCdWlsZCBzaWRlIGJ5IHNpZGUgZGlzcGxheSBvdXRwdXQg
cGlwZWxpbmUKICBkcm0va29tZWRhOiBBZGQgc2lkZSBieSBzaWRlIHN1cHBvcnQgZm9yIHdyaXRl
YmFjawogIGRybS9rb21lZGE6IFVwZGF0ZSB3cml0ZWJhY2sgc2lnbmFsIGZvciBzaWRlX2J5X3Np
ZGUKICBkcm0va29tZWRhOiBFeHBvc2Ugc2lkZV9ieV9zaWRlIGJ5IHN5c2ZzL2NvbmZpZ19pZAoK
IC4uLi9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oICB8ICAgMyArLQog
Li4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgICA0ICsKIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICA1MSArKy0tCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCAgIDQgKwogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwgICA5ICsKIC4uLi9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAgOCArCiAuLi4vZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgfCAgNTAgKysrLQogLi4uL2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDM5ICsrLQogLi4uL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMjc3ICsrKysrKysrKysr
KysrKysrLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwg
ICA3ICstCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAg
MTEgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDQxNyBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMo
LSkKCi0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
