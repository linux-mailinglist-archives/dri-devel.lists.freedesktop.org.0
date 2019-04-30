Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5DF067
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 08:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C3589349;
	Tue, 30 Apr 2019 06:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5AD89349
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:19:41 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3130.eurprd08.prod.outlook.com (52.134.110.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 06:19:25 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::90f3:99ab:9445:1187]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::90f3:99ab:9445:1187%3]) with mapi id 15.20.1856.008; Tue, 30 Apr 2019
 06:19:25 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v1 0/2] drm/komeda: Add SMMU support on Komeda driver
Thread-Topic: [PATCH v1 0/2] drm/komeda: Add SMMU support on Komeda driver
Thread-Index: AQHU/xyoEzxyzFw260iTS8/Rf+MrxQ==
Date: Tue, 30 Apr 2019 06:19:24 +0000
Message-ID: <1556605118-22700-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::34) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8969a0aa-c562-4642-6a1c-08d6cd33ca81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB3130; 
x-ms-traffictypediagnostic: DB7PR08MB3130:
x-ms-exchange-purlcount: 3
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB31300B291E445B9DAAE8F1959F3A0@DB7PR08MB3130.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(6436002)(36756003)(110136005)(386003)(97736004)(8676002)(81156014)(81166006)(14454004)(26005)(3846002)(478600001)(5660300002)(8936002)(54906003)(2501003)(55236004)(102836004)(6486002)(25786009)(6506007)(6116002)(4326008)(256004)(316002)(966005)(68736007)(305945005)(66066001)(7736002)(86362001)(72206003)(2201001)(486006)(2616005)(2906002)(6306002)(6512007)(73956011)(66946007)(53936002)(476003)(6636002)(50226002)(66446008)(4744005)(66476007)(52116002)(71200400001)(71190400001)(186003)(64756008)(99286004)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3130;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sD5ZCMsBrOwvopU4dnKGWZtfXwqk+OL3YZC2nuLexmgHZOl4dUsWWOv4sDRJmzbEM5OllePjRAFkGYxhEa2PSaN0+22L8e6KLS93lbD1WthmHUS4Ha2QnQiXOmNBOyHSxIwY+IYOTppFYGgCYEtGOsCe6sOZLQWkAlYgREKkruNM3CdUtBFtzlkzXLpuQQUfBPrEhEOIuIbFLCLXqvcYZ41IAqgNLTv/UhYvNBv1yUZYcx6Ch8B5OpDibq020jJeRIf67sNyME7QJHMo+CJhy2L9BnX9qTgN2kvvG6fIBZHT9Mk8wBwW+qF/g34ilyifWxdtTx6b17f7rfrP02MZo8JSlRZjjEWRjhKuvEwjaCEoOrXvbuJ+Hc1ulrj25uTLo036js1jXn+jbxY4bhbzeJvnsnd+7/lzyT0ZJDXZkEg=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8969a0aa-c562-4642-6a1c-08d6cd33ca81
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 06:19:24.9102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRfCslS5BivaJdQ4r8y29b9HXjtsBhEvUGgi3eov+C4=;
 b=mM563E5ndDL39aWGryqD3wmMUj9yW0vHp7tTLYhPMwk/3BMPpS7AGI32L7zGYPYC9q8W9TgBtvevM95v0Dt4I6MElciZgi6/081FxLppUv1oPZyug56EppWKS88+3VKx/babfH2nKSJUCpzZ5UMsHNilm+Qe9a/RtEFHlhhguQA=
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

SGksDQoNClRoaXMgc2VyaWUgYWltcyBhdCBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIFNNTVUgb24g
S29tZWRhIGRyaXZlci4NCkFsc28gdXBkYXRlcyB0aGUgZGV2aWNlLXRyZWUgZG9jIGFib3V0IGhv
dyB0byBlbmFibGUgU01NVSBieSBkZXZpY2V0cmVlLg0KDQpUaGlzIHBhdGNoIHNlcmllcyBkZXBl
bmRzIG9uOg0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NzEw
Lw0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5MDAwLw0KLSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5MDAyLw0KDQpUaGFua3Ms
DQpMb3dyeQ0KDQpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToNCiAgZHJtL2tv
bWVkYTogQWRkcyBTTU1VIHN1cHBvcnQNCiAgZHQvYmluZGluZ3M6IGRybS9rb21lZGE6IEFkZHMg
U01NVSBzdXBwb3J0IGZvciBENzEgZGV2aWNldHJlZQ0KDQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9hcm0sa29tZWRhLnR4dCAgICAgfCAgNyArKysrDQogLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgfCAgNSArKysNCiBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgICB8IDQ5ICsrKysrKysrKysr
KysrKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYyAgICB8IDE3ICsrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmggICAgfCAgNyArKysrDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ZyYW1lYnVmZmVyLmMgICAgfCAgMiArDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2ZyYW1lYnVmZmVyLmggICAgfCAgMiArDQogNyBmaWxlcyBjaGFuZ2VkLCA4OSBp
bnNlcnRpb25zKCspDQoNCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
