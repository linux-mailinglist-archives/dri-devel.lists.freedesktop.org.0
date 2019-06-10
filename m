Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2B3B2CC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 12:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F147890B6;
	Mon, 10 Jun 2019 10:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0EE890B6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:15:52 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4975.eurprd08.prod.outlook.com (10.255.158.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Mon, 10 Jun 2019 10:15:49 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.026; Mon, 10 Jun 2019
 10:15:49 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 0/3] drm/komeda: Add layer split support
Thread-Topic: [PATCH v2 0/3] drm/komeda: Add layer split support
Thread-Index: AQHVH3V5MpmoS19BK0+4wpZnVdW8Dg==
Date: Mon, 10 Jun 2019 10:15:49 +0000
Message-ID: <20190610101528.25942-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf33004-061c-4004-abf2-08d6ed8c9c17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4975; 
x-ms-traffictypediagnostic: VE1PR08MB4975:
x-ms-exchange-purlcount: 2
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB49757334C17D80EDFD5DB6ECB3130@VE1PR08MB4975.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(189003)(3846002)(8676002)(81156014)(316002)(110136005)(103116003)(53936002)(186003)(26005)(81166006)(6436002)(71200400001)(55236004)(68736007)(2501003)(4326008)(6306002)(66946007)(2906002)(478600001)(8936002)(99286004)(25786009)(50226002)(966005)(6512007)(66066001)(305945005)(6506007)(386003)(486006)(5660300002)(54906003)(2201001)(66476007)(66446008)(102836004)(66556008)(64756008)(6116002)(52116002)(7736002)(476003)(6486002)(36756003)(2616005)(86362001)(73956011)(256004)(1076003)(14454004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4975;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4Qihnmqckd7TuLVuWIc/fCD3FIaZ9SNMowHU5ODfyANnWj07mAyPG93iGRgRcFLIPYxR4GHvvHzLjomqsh4+he1szs680kplIkVZG5UKhvV4c1TJF6H6WPhukfipFhuiE29onEXQpI1Ho14iWWXArr0Vp69PSQObsn2R9vMFZD1cXl7snOru82wkUonwOb976m91RWaVNm+HOV7QoQqdGvid71QHu9aD4DwOE+BSR6qbHMx49EQq2Ryb03WZcmwyuug2h2mHA+JTV4y5bgt71DM81bfPN2xhEUjYFUHJBXvtG//rMk48Qx0jsUMqc7wARU8jZLFqVOgTSbxjsj7z83xehN0Qgakf4v5Y2kcsUUGvKvL6aVMusfmCb7z4WaSeS+4C3MtUQ5RycIRnQGLkq/h/8mIC5QK67Nv0GO5q5D0=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf33004-061c-4004-abf2-08d6ed8c9c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 10:15:49.3333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4975
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAl7DjD2PKrxucr7PykQE96DtPiGvt4RIskZTqhJ4qA=;
 b=V4nZ6bgClRFilG2ZqcU4DYA4k1HKUXWMfvgvQxnpa1AUAo2OrzRPcGga0329KhlS+G8bFUkg2aaQOrFD1gzEXnIwqQytoLuzFQtM6Ie5R9EW8bdys71zDpj5nwFzQN4q5Hobd1NEyE/YR55qLR+NKBNHnNAzDWRK1c3aolvalSM=
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
ZWxpbmVzLiBrb21lZGEgc3VwcG9ydHMgdHdvIHR5cGVzIG9mDQpsYXllciBzcGxpdDoNCg0KLSBu
b25lLXNjYWxpbmcgc3BsaXQ6DQogICAgICAgICAgICAgLyBsYXllci1sZWZ0IC0+IFwNCiAgcGxh
bmVfc3RhdGUgICAgICAgICAgICAgICAgICBjb21waXotPiAuLi4NCiAgICAgICAgICAgICBcIGxh
eWVyLXJpZ2h0LT4gLw0KDQotIHNjYWxpbmcgc3BsaXQ6DQogICAgICAgICAgICAgLyBsYXllci1s
ZWZ0IC0+IHNjYWxlci0+XA0KIHBsYW5lX3N0YXRlICAgICAgICAgICAgICAgICAgICAgICAgICBt
ZXJnZXIgLT4gY29tcGl6LT4gLi4uDQogICAgICAgICAgICAgXCBsYXllci1yaWdodC0+IHNjYWxl
ci0+Lw0KDQpTaW5jZSBtZXJnZXIgb25seSBzdXBwb3J0cyBzY2FsZXIgYXMgaW5wdXQsIHNvIGZv
ciBub25lLXNjYWxpbmcgc3BsaXQsIHR3bw0KbGF5ZXIgZGF0YSBmbG93cyB3aWxsIGJlIG91dHB1
dCB0byBjb21waXogZGlyZWN0bHkuIGZvciBzY2FsaW5nX3NwbGl0LCB0d28NCmRhdGEgZmxvd3Mg
d2lsbCBiZSBtZXJnZWQgYnkgbWVyZ2VyIGZpcnN0bHksIHRoZW4gbWVyZ2VyIG91dHB1dHMgb25l
IG1lcmdlZA0KZGF0YSBmbG93IHRvIGNvbXBpei4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5k
cyBvbjoNCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDc2Ny8N
Ci0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDgzOC8NCg0KdjI6
IFJlYmFzZSBhbmQgYWRkcmVzc2VkIExpdml1J3MgY29tbWVudHMNCg0KamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOg0KICBkcm0va29tZWRhOiBBZGQgY29tcG9uZW50
IGtvbWVkYV9tZXJnZXINCiAgZHJtL2tvbWVkYTogQWRkIHNwbGl0IHN1cHBvcnQgZm9yIHNjYWxl
cg0KICBkcm0va29tZWRhOiBBZGQgbGF5ZXIgc3BsaXQgc3VwcG9ydA0KDQogLi4uL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgMTIxICsrKysrKy0NCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAgIDggKw0KIC4uLi9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAyMiArLQ0KIC4uLi9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jICB8ICAyNiArLQ0KIC4uLi9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICA0OSArKy0NCiAuLi4vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAzMTggKysrKysrKysrKysr
KysrKystDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwg
IDMzICstDQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcHJpdmF0ZV9vYmouYyAgIHwg
IDQ5ICsrKw0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jICB8
ICAgMiArLQ0KIDkgZmlsZXMgY2hhbmdlZCwgNjAwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9u
cygtKQ0KDQotLQ0KMi4xNy4xDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
