Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940183C9C6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272F890D7;
	Tue, 11 Jun 2019 11:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31350890D7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:13:36 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3550.eurprd08.prod.outlook.com (20.177.61.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 11:13:33 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 11:13:33 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v2 0/2] Adds slave pipeline support
Thread-Topic: [PATCH v2 0/2] Adds slave pipeline support
Thread-Index: AQHVIEa0RZsFrZpBmE6Oc2PEdiSdtA==
Date: Tue, 11 Jun 2019 11:13:33 +0000
Message-ID: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SL2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:100:2d::17) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dddfe338-f113-4404-0725-08d6ee5dd708
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3550; 
x-ms-traffictypediagnostic: VI1PR08MB3550:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB3550F9A6FA18BE0BB29F2FFD9FED0@VI1PR08MB3550.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(396003)(366004)(346002)(136003)(189003)(199004)(305945005)(256004)(72206003)(6512007)(476003)(6306002)(14454004)(966005)(99286004)(2616005)(478600001)(52116002)(486006)(6636002)(7736002)(6506007)(26005)(68736007)(66066001)(186003)(2501003)(386003)(36756003)(4744005)(25786009)(66446008)(3846002)(81156014)(8676002)(316002)(6116002)(66946007)(66556008)(64756008)(66476007)(73956011)(50226002)(8936002)(6486002)(6436002)(71190400001)(86362001)(2906002)(55236004)(110136005)(54906003)(53936002)(71200400001)(4326008)(81166006)(5660300002)(2201001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3550;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KoVwuAUCOLCZTmNla20ImcCwvoVWGKYQOvkqfpx2s0M2cORnYm8nq52EDPEojXo7x077YQMhZIz7FL2Ia4XbOV6mLJKCu+SWLEuDJeELHl1KfZ6SfmeuxkJW9IWjAgIcuZQm4Q1hqZG7UGitqFAwbiEBfUM4IAec5Oqa7MG5kjP90LXqB2lvdp55WaKXWGiMEmh2k5rmyWmXgMB3Qw6a4Mb/S1Cyh4Z9buD9fEAKjcWcHM5IxLSX6ZciX+Rf2ZKFjRsr82SIvV4U7fXSwIfLDCIiLwgONVoci7W73ItZwbYdeXrIEj/zJiVNbliMuR8CF4m8cAIlBFV2h8x/CwXgankNAFLhhB7xZ14yuciNQON1FKfIzL0OmBpsAKkM/PdEqaLlhcL7BHUfAtzYnfNFFDV6pI+W6bxuJqamSUemtVw=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddfe338-f113-4404-0725-08d6ee5dd708
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 11:13:33.2355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3550
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE+rexGCau0MD0bOEZMoob66efRDzX4iFP7hoYrNH7A=;
 b=mmbk6nB5O3xSu3CMzbkEJ9hK0Cbd8pIFxgoml1wCthQ97Mqwg7je13cArt98aYZ5jqQMClkXB9o6fRhWhbryra0fft1JRhkHc87w6o4v9CfHeLq0cYhXIIkMG9DwagKHKoO6NRN4tyAkXdaMooqFoBeouagrq3Om+2pp/+7WjK0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoaXMgc2VyaWUgYWltcyBhdCBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIHNsYXZlIHBp
cGVsaW5lIG9uIEtvbWVkYQ0KZHJpdmVyLiBBbHNvIGFkZHMgZHJvcF9tYXN0ZXIgdG8gc2h1dGRv
d24gdGhlIGRldmljZSBhbmQgbWFrZSBzdXJlDQphbGwgdGhlIGtvbWVkYSByZXNvdXJjZXMgc2hh
cmVkIGJldHdlZW4gY3J0Y3MgaGF2ZSBiZWVuIHJlbGVhc2VkLg0KDQpDaGFuZ2Ugc2luY2UgdjE6
DQpSZWJhc2VzIHRoZSBjb2RlIGFuZCByZXNvbHZlcyB0aGUgY29uZmxpY3QuDQoNClRoaXMgcGF0
Y2ggc2VyaWVzIGRlcGVuZHMgb246DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvNjA4NTYvDQoNClJlZ2FyZHMsDQpMb3dyeQ0KDQpMb3dyeSBMaSAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpICgyKToNCiAgZHJtL2tvbWVkYTogQWRkIHNsYXZlIHBpcGVsaW5lIHN1cHBv
cnQNCiAgZHJtL2tvbWVkYTogQWRkcyBrb21lZGFfa21zX2Ryb3BfbWFzdGVyDQoNCiBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgICB8IDQxICsrKysrKysr
KysrKysrKysrKysrLS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyAgICB8IDIzICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5oICAgIHwgIDkgKysrKysNCiAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMgICB8IDIyICsrKysrKysrKysrKw0KIC4uLi9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgIHwgIDIgKysNCiAu
Li4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyB8IDE1ICsr
KysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUu
YyAgfCAzMiArKysrKysrKysrKysrKysrLQ0KIDcgZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
