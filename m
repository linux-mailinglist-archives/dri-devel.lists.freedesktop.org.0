Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0723186
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD298911D;
	Mon, 20 May 2019 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835788911D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:44:37 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4767.eurprd08.prod.outlook.com (10.255.113.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 10:44:34 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 10:44:34 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/3] drm/komeda: Add layer split support
Thread-Topic: [PATCH 0/3] drm/komeda: Add layer split support
Thread-Index: AQHVDvkDtOK3o4B/4UaUGSTqkjSQfg==
Date: Mon, 20 May 2019 10:44:34 +0000
Message-ID: <20190520104411.6092-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0057.apcprd03.prod.outlook.com
 (2603:1096:203:52::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f663c2d-3d67-48f3-0238-08d6dd1025c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4767; 
x-ms-traffictypediagnostic: VE1PR08MB4767:
x-ms-exchange-purlcount: 2
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB476783FD36E2FDAE2CB53859B3060@VE1PR08MB4767.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(366004)(346002)(376002)(199004)(189003)(66476007)(81156014)(316002)(68736007)(476003)(81166006)(8936002)(53936002)(66066001)(256004)(8676002)(55236004)(4326008)(110136005)(52116002)(386003)(6506007)(14454004)(2906002)(73956011)(66556008)(64756008)(6116002)(3846002)(71190400001)(54906003)(50226002)(102836004)(71200400001)(66946007)(99286004)(486006)(6486002)(36756003)(186003)(25786009)(66446008)(5660300002)(7736002)(2616005)(6512007)(103116003)(1076003)(6436002)(305945005)(86362001)(2201001)(2501003)(478600001)(26005)(6306002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4767;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /fD8r90wiCNa9av2x53sWMyD2VJd1k04M9C7dAHM8HUlrvpnTpH4/9+FBHs3cH5r/1MQ7p/piEKisRBez7NyyT9kC4cpBy2MR/YuctxMDS7yubGk8HGQddrjHWAl59uLMBrFZwKMpdcw4+9R4ZmQOn664RhpOrOPM9OcgUQh7jsYWU9Dvv3QqnvR7p6YlTJYTnWMDJ8CGum/Og9SXhVSZRs5hWMvqptc0VFfOdw+6ll6omc5mv9RHhNsSi8XLAfTsAi3C/yIaCsjzBRqcXOoTse4VWkYzDL+R6rJRPY94o/iFCM9tK12uhiIC1nOKNs99c6VSlgrjDnU4U54jIUM9tSUUDF8JqsrZoWNOcFlYOKjfxivUoGksAw7dj0pKsfqtzFFUgM/wuS/O1nVwCYpKb+IXL4Qe8e73TE9+EGFtoE=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f663c2d-3d67-48f3-0238-08d6dd1025c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 10:44:34.7136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4767
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VvXcfuTQRrLIHnhLaFP4e3YQmqf87JBYLKxNXczcqA=;
 b=CQFaKgimWW/htVmdh992QnI9DsJ7WlqNlnIsVoa9bErC5rccbdr2Q94+1mPDNE4B7mM5tR1QtY7f0UtMACpZ5Ihi23D99Jxjhgh4mHI+YUDvAUvbbn/gjt+MlcyUoy/f+owOPBndo3ePsF7yQGv9pS9+twqwW7uf257Q+qA8OSw=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIGxheWUgc3BsaXQgc3VwcG9ydCBmb3Iga29tZWRhLg0KDQpG
b3IgbGF5ZXIgc3BsaXQsIGEgcGxhbmUgc3RhdGUgd2lsbCBiZSBzcGxpdCB0byB0d28gZGF0YSBm
bG93cyBhbmQgaGFuZGxlZA0KYnkgdHdvIHNlcGFyYXRlZCBrb21lZGEgbGF5ZXIgaW5wdXQgcGlw
ZWxpbmVzLiBrb21lZGEgc3VwcG9ydHMgdHdvIHR5cGVzIG9mDQpsYXllciBzcGxpdDoNCi0gbm9u
ZS1zY2FsaW5nIHNwbGl0Og0KICAgICAgICAgICAgIC8gbGF5ZXItbGVmdCAtPiBcDQogIHBsYW5l
X3N0YXRlICAgICAgICAgICAgICAgICAgY29tcGl6LT4gLi4uDQogICAgICAgICAgICAgXCBsYXll
ci1yaWdodC0+IC8NCg0KLSBzY2FsaW5nIHNwbGl0Og0KICAgICAgICAgICAgIC8gbGF5ZXItbGVm
dCAtPiBzY2FsZXItPlwNCiBwbGFuZV9zdGF0ZSAgICAgICAgICAgICAgICAgICAgICAgICAgbWVy
Z2VyIC0+IGNvbXBpei0+IC4uLg0KICAgICAgICAgICAgIFwgbGF5ZXItcmlnaHQtPiBzY2FsZXIt
Pi8NCg0KU2luY2UgbWVyZ2VyIG9ubHkgc3VwcG9ydHMgc2NhbGVyIGFzIGlucHV0LCBzbyBmb3Ig
bm9uZS1zY2FsaW5nIHNwbGl0LCB0d28NCmxheWVyIGRhdGEgZmxvd3Mgd2lsbCBiZSBvdXRwdXQg
dG8gY29tcGl6IGRpcmVjdGx5LiBmb3Igc2NhbGluZ19zcGxpdCwgdHdvDQpkYXRhIGZsb3dzIHdp
bGwgYmUgbWVyZ2VkIGJ5IG1lcmdlciBmaXJzdGx5LCB0aGVuIG1lcmdlciBvdXRwdXRzIG9uZSBt
ZXJnZWQNCmRhdGEgZmxvdyB0byBjb21waXouDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGRlcGVuZHMg
b246DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA3NjcvDQot
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4MzgvDQoNCkphbWVz
IFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToNCiAgZHJtL2tvbWVkYTogQWRk
IGNvbXBvbmVudCBrb21lZGFfbWVyZ2VyDQogIGRybS9rb21lZGE6IEFkZCBzcGxpdCBzdXBwb3J0
IGZvciBzY2FsZXINCiAgZHJtL2tvbWVkYTogQWRkIGxheWVyIHNwbGl0IHN1cHBvcnQNCg0KIC4u
Li9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDEyMSArKysrKyst
DQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyAgIHwgICA4ICsN
CiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgfCAgMjIgKy0N
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgfCAgMjYgKy0N
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgNDkgKyst
DQogLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMzIxICsr
KysrKysrKysrKysrKysrLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGxhbmUuYyB8ICAzMiArLQ0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3ByaXZhdGVf
b2JqLmMgICB8ICA0OSArKysNCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25u
ZWN0b3IuYyAgfCAgIDIgKy0NCiA5IGZpbGVzIGNoYW5nZWQsIDYwMiBpbnNlcnRpb25zKCspLCAy
OCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
