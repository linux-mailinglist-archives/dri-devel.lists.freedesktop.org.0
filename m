Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02A6327B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0807C89F27;
	Tue,  9 Jul 2019 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323F89F27
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 07:57:26 +0000 (UTC)
Received: from VI1PR0802CA0048.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::34) by AM5PR0802MB2594.eurprd08.prod.outlook.com
 (2603:10a6:203:99::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.16; Tue, 9 Jul
 2019 07:57:22 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR0802CA0048.outlook.office365.com
 (2603:10a6:800:a9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 07:57:22 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 07:57:20 +0000
Received: ("Tessian outbound 4988ae2fa87d:v23");
 Tue, 09 Jul 2019 07:57:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2820ea00e32ee9bc
X-CR-MTA-TID: 64aa7808
Received: from 193ae1e554a6.1 (cr-mta-lb-1.cr-mta-net [104.47.14.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A110F030-A904-480F-9A8E-034CD3BEC591.1; 
 Tue, 09 Jul 2019 07:57:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 193ae1e554a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jul 2019 07:57:11 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 07:57:08 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 07:57:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/2] drm/komeda: Update the chip identify
Thread-Topic: [PATCH 1/2] drm/komeda: Update the chip identify
Thread-Index: AQHVNivobgJj65WOAkiCXqprcqpsKg==
Date: Tue, 9 Jul 2019 07:57:08 +0000
Message-ID: <20190709075640.22012-2-james.qian.wang@arm.com>
References: <20190709075640.22012-1-james.qian.wang@arm.com>
In-Reply-To: <20190709075640.22012-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ac02bdd9-ba01-4a62-3083-08d7044311d8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4958:|AM5PR0802MB2594:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2594A343210B84611381C289B3F10@AM5PR0802MB2594.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(199004)(189003)(68736007)(66446008)(66476007)(66556008)(64756008)(1076003)(50226002)(71190400001)(486006)(2201001)(86362001)(316002)(5660300002)(2501003)(66946007)(73956011)(71200400001)(256004)(14444005)(36756003)(8936002)(15650500001)(476003)(110136005)(2616005)(81166006)(54906003)(6436002)(14454004)(81156014)(6116002)(99286004)(25786009)(305945005)(11346002)(446003)(7736002)(6486002)(478600001)(8676002)(55236004)(386003)(4326008)(6506007)(52116002)(103116003)(66066001)(76176011)(6512007)(102836004)(26005)(3846002)(53936002)(2906002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: nn1xxeuFX+iGbIhjzx8OUWhG+EUKf4KTFJRwLh6NmeLjNEzZUD/6uaF7Y33KqCmc+erEW1AFw3+ne6sRGHzQE+/a4p9BMc+4GFZFo9qyW+YAID1c2sqBEYDQy0hfVN2oLzY/EABjw+DLoQl15TX0ZFCjf6HTRG5zbpAxf6ptGTdbDkmomCj+5VzXGJMfqJplOGwFkKJrRIRzlvKVq+q6U15Wgl38gbZQM4wJ7UqBSObAqBOzp7tltryKBk2DlxtPQRbBc72C+a7vWx5c6vz1264/xLBSiffPmukt1+ARe7ZkgNPTF+OBShEULSRYRD4YORNAyUeF+FPcs32os3SqW3O0bnVOAf1yf7JTgpB7Rc1jNEZAxW3GLOhlZJNa6SeuHweBKf93S2RbP/EXKd3PH8JAaQio9PN1R7uDxsB/6xI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(189003)(199004)(478600001)(2201001)(103116003)(50466002)(5660300002)(54906003)(316002)(22756006)(50226002)(15650500001)(36756003)(110136005)(86362001)(26826003)(2501003)(4326008)(356004)(25786009)(14444005)(3846002)(6512007)(6486002)(63350400001)(446003)(70586007)(8676002)(81156014)(81166006)(305945005)(70206006)(6506007)(386003)(14454004)(8746002)(76176011)(7736002)(1076003)(76130400001)(102836004)(66066001)(2906002)(186003)(26005)(336012)(99286004)(23756003)(11346002)(2616005)(486006)(126002)(47776003)(63370400001)(6116002)(476003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2594;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4a6365bb-ddd1-4034-6631-08d704430a83
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2594; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: e+Gum+KNLQifgs7xobs7mPS5oizOm5R2LoVtSuuE5W6xAG3GS4zULgF6osntqWnuIJGpuyfjoV00cgnAJoVK7dze+bLpKgfTXTXAlvyO8xHTH2+k9ZOmOlKgg3ZUSWPRo1DcdfRihDqqnQQ1Z91oWbJ8aWv/V0DZCaURDUWn0fUloW7o1Wv+NQBL/UNUinKSfR/iuMYQsup81piiqThpWHEUJusfaVJDMHA9nTUlM+7bTCpxj/kc8kld3xkdoQfrbVc+Mw2XmWu0tLvKld3t57PgY8diUE8/1g9eMB2Q+Q6GSymWnKXyJsR2ZPJOFCoppqvNKX0lHpVSBzpKplAz+w9wgHIlyJg4Bn0i5JMmThF24wPGNUfPJaZPt4io9XPae75eu+K1+1rIeHSJB5eGJR25A4FGw1SGwidFfxtl9eM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 07:57:20.4334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac02bdd9-ba01-4a62-3083-08d7044311d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV9IoxJ7ddWRK+HAqdXme3VwFGlebhBmisAzraI/pqM=;
 b=aYj/GOlBWAlz1gqPsIZh544rvD6eXOvEOj8YM/Ml4fZz5aDMikzPfE4riVBjcNH2pCqAHgCPiauLj0svywjipC5KnUeQoxo/zIffwQhm9WjNieKyDg8wHTdJ9+YQueTN1wcLOilmOagp5TzaF29ve52e8/vr8f2BooA6hkoG7PA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV9IoxJ7ddWRK+HAqdXme3VwFGlebhBmisAzraI/pqM=;
 b=aYj/GOlBWAlz1gqPsIZh544rvD6eXOvEOj8YM/Ml4fZz5aDMikzPfE4riVBjcNH2pCqAHgCPiauLj0svywjipC5KnUeQoxo/zIffwQhm9WjNieKyDg8wHTdJ9+YQueTN1wcLOilmOagp5TzaF29ve52e8/vr8f2BooA6hkoG7PA=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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

MS4gRHJvcCBrb21lZGEtQ09SRSBwcm9kdWN0IGlkIGNvbXBhcmlzb24gYW5kIHB1dCBpdCBpbnRv
IHRoZSBkNzFfaWRlbnRpZnkKMi4gVXBkYXRlIHBpcGVsaW5lIG5vZGUgRFQtYmluZGluZzoKICAg
Ki4gU2tpcCB0aGUgbmVlZGxlc3MgcGlwZWxpbmUgRFQgbm9kZS4KICAgKi4gUmV0dXJuIGZhaWwg
aWYgdGhlIGVzc2VudGlhbCBwaXBlbGluZSBEVCBub2RlIHdhcyBtaXNzaW5nLgoKV2l0aCB0aGVz
ZSBjaGFuZ2VzLCBmb3Igb25lIGZhbWlseSBjaGlwcyBubyBuZWVkIHRvIGNoYW5nZSB0aGUgRFQu
CgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfZGV2LmMgIHwgMjcgKysrKysrLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8IDYyICsrKysrKysrKystLS0tLS0tLS0KIC4uLi9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8IDE0ICstLS0tCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAgfCAgOSArLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCmluZGV4IDdlN2M5ZTkz
NWVhZi4uZTM4M2E3ODFjOWU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2Rldi5jCkBAIC01NzgsMTAgKzU3OCwyNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgZDcxX2NoaXBfZnVuY3MgPSB7CiBjb25zdCBzdHJ1Y3Qg
a29tZWRhX2Rldl9mdW5jcyAqCiBkNzFfaWRlbnRpZnkodTMyIF9faW9tZW0gKnJlZ19iYXNlLCBz
dHJ1Y3Qga29tZWRhX2NoaXBfaW5mbyAqY2hpcCkKIHsKLQljaGlwLT5hcmNoX2lkCT0gbWFsaWRw
X3JlYWQzMihyZWdfYmFzZSwgR0xCX0FSQ0hfSUQpOwotCWNoaXAtPmNvcmVfaWQJPSBtYWxpZHBf
cmVhZDMyKHJlZ19iYXNlLCBHTEJfQ09SRV9JRCk7Ci0JY2hpcC0+Y29yZV9pbmZvCT0gbWFsaWRw
X3JlYWQzMihyZWdfYmFzZSwgR0xCX0NPUkVfSU5GTyk7Ci0JY2hpcC0+YnVzX3dpZHRoCT0gRDcx
X0JVU19XSURUSF8xNl9CWVRFUzsKKwljb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5jcyAqZnVu
Y3M7CisJdTMyIHByb2R1Y3RfaWQ7CgotCXJldHVybiAmZDcxX2NoaXBfZnVuY3M7CisJY2hpcC0+
Y29yZV9pZCA9IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9DT1JFX0lEKTsKKworCXByb2R1
Y3RfaWQgPSBNQUxJRFBfQ09SRV9JRF9QUk9EVUNUX0lEKGNoaXAtPmNvcmVfaWQpOworCisJc3dp
dGNoIChwcm9kdWN0X2lkKSB7CisJY2FzZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQ6CisJCWZ1bmNz
ID0gJmQ3MV9jaGlwX2Z1bmNzOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlmdW5jcyA9IE5VTEw7
CisJCURSTV9FUlJPUigiVW5zdXBwb3J0ZWQgcHJvZHVjdDogMHgleFxuIiwgcHJvZHVjdF9pZCk7
CisJfQorCisJaWYgKGZ1bmNzKSB7CisJCWNoaXAtPmFyY2hfaWQJPSBtYWxpZHBfcmVhZDMyKHJl
Z19iYXNlLCBHTEJfQVJDSF9JRCk7CisJCWNoaXAtPmNvcmVfaW5mbwk9IG1hbGlkcF9yZWFkMzIo
cmVnX2Jhc2UsIEdMQl9DT1JFX0lORk8pOworCQljaGlwLT5idXNfd2lkdGgJPSBENzFfQlVTX1dJ
RFRIXzE2X0JZVEVTOworCX0KKworCXJldHVybiBmdW5jczsKIH0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKaW5kZXggMmFlZTczNWE2ODNmLi5k
ZDRhMGJhMWMzN2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jCkBAIC0xMjUsMjMgKzEyNSwxNiBAQCBzdGF0aWMgaW50IHRvX2NvbG9yX2Zv
cm1hdChjb25zdCBjaGFyICpzdHIpCiAJcmV0dXJuIGZvcm1hdDsKIH0KCi1zdGF0aWMgaW50IGtv
bWVkYV9wYXJzZV9waXBlX2R0KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wKQorc3RhdGljIGludCBrb21lZGFfcGFyc2VfcGlwZV9kdChzdHJ1Y3Qga29tZWRh
X3BpcGVsaW5lICpwaXBlKQogewotCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGU7CisJc3Ry
dWN0IGRldmljZV9ub2RlICpucCA9IHBpcGUtPm9mX25vZGU7CiAJc3RydWN0IGNsayAqY2xrOwot
CXUzMiBwaXBlX2lkOwotCWludCByZXQgPSAwLCBjb2xvcl9mb3JtYXQ7CisJdTMyIGNvbG9yX2Zv
cm1hdDsKIAljb25zdCBjaGFyICpzdHI7CgotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5w
LCAicmVnIiwgJnBpcGVfaWQpOwotCWlmIChyZXQgIT0gMCB8fCBwaXBlX2lkID49IG1kZXYtPm5f
cGlwZWxpbmVzKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCXBpcGUgPSBtZGV2LT5waXBlbGluZXNb
cGlwZV9pZF07Ci0KIAljbGsgPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsICJweGNsayIpOwogCWlm
IChJU19FUlIoY2xrKSkgewotCQlEUk1fRVJST1IoImdldCBweGNsayBmb3IgcGlwZWxpbmUgJWQg
ZmFpbGVkIVxuIiwgcGlwZV9pZCk7CisJCURSTV9FUlJPUigiZ2V0IHB4Y2xrIGZvciBwaXBlbGlu
ZSAlZCBmYWlsZWQhXG4iLCBwaXBlLT5pZCk7CiAJCXJldHVybiBQVFJfRVJSKGNsayk7CiAJfQog
CXBpcGUtPnB4bGNsayA9IGNsazsKQEAgLTE2Myw3ICsxNTYsNiBAQCBzdGF0aWMgaW50IGtvbWVk
YV9wYXJzZV9waXBlX2R0KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wKQogCQlvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZChucCwgS09NRURBX09GX1BPUlRfT1VU
UFVUKTsKCiAJcGlwZS0+ZHVhbF9saW5rID0gcGlwZS0+b2Zfb3V0cHV0X2xpbmtzWzBdICYmIHBp
cGUtPm9mX291dHB1dF9saW5rc1sxXTsKLQlwaXBlLT5vZl9ub2RlID0gbnA7CgogCXJldHVybiAw
OwogfQpAQCAtMTcyLDcgKzE2NCw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3BhcnNlX2R0KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiB7CiAJc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwogCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqY2hpbGQsICpucCA9IGRldi0+b2Zfbm9kZTsKLQlpbnQgcmV0OworCXN0cnVjdCBr
b21lZGFfcGlwZWxpbmUgKnBpcGU7CisJdTMyIHBpcGVfaWQgPSBVMzJfTUFYOworCWludCByZXQg
PSAtMTsKCiAJbWRldi0+aXJxICA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7CiAJaWYgKG1k
ZXYtPmlycSA8IDApIHsKQEAgLTE4MSwzMiArMTc1LDQ2IEBAIHN0YXRpYyBpbnQga29tZWRhX3Bh
cnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJfQoK
IAlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsKLQkJaWYgKG9m
X25vZGVfY21wKGNoaWxkLT5uYW1lLCAicGlwZWxpbmUiKSA9PSAwKSB7Ci0JCQlyZXQgPSBrb21l
ZGFfcGFyc2VfcGlwZV9kdChtZGV2LCBjaGlsZCk7Ci0JCQlpZiAocmV0KSB7Ci0JCQkJRFJNX0VS
Uk9SKCJwYXJzZSBwaXBlbGluZSBkdCBlcnJvciFcbiIpOworCQlpZiAob2Zfbm9kZV9uYW1lX2Vx
KGNoaWxkLCAicGlwZWxpbmUiKSkgeworCQkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoY2hp
bGQsICJyZWciLCAmcGlwZV9pZCk7CisJCQlpZiAocGlwZV9pZCA+PSBtZGV2LT5uX3BpcGVsaW5l
cykgeworCQkJCURSTV9XQVJOKCJTa2lwIHRoZSByZWRhbmR1bnQgRFQgbm9kZTogcGlwZWxpbmUt
JXUuXG4iLAorCQkJCQkgcGlwZV9pZCk7CiAJCQkJb2Zfbm9kZV9wdXQoY2hpbGQpOwotCQkJCWJy
ZWFrOworCQkJCWNvbnRpbnVlOwogCQkJfQorCQkJbWRldi0+cGlwZWxpbmVzW3BpcGVfaWRdLT5v
Zl9ub2RlID0gY2hpbGQ7CisJCX0KKwl9CisKKwlmb3IgKHBpcGVfaWQgPSAwOyBwaXBlX2lkIDwg
bWRldi0+bl9waXBlbGluZXM7IHBpcGVfaWQrKykgeworCQlwaXBlID0gbWRldi0+cGlwZWxpbmVz
W3BpcGVfaWRdOworCisJCWlmICghcGlwZS0+b2Zfbm9kZSkgeworCQkJRFJNX0VSUk9SKCJPbWl0
IERUIG5vZGUgZm9yIHBpcGVsaW5lLSVkLlxuIiwgcGlwZS0+aWQpOworCQkJcmV0dXJuIC1FSU5W
QUw7CiAJCX0KKwkJcmV0ID0ga29tZWRhX3BhcnNlX3BpcGVfZHQocGlwZSk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gcmV0OwogCX0KCiAJbWRldi0+c2lkZV9ieV9zaWRlID0gIW9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAic2lkZV9ieV9zaWRlX21hc3RlciIsCi0JCQkJCSZtZGV2LT5zaWRlX2J5
X3NpZGVfbWFzdGVyKTsKKwkJCQkJCSAgICZtZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyKTsKCi0J
cmV0dXJuIHJldDsKKwlyZXR1cm4gMDsKIH0KCiBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rl
dl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKLQljb25zdCBzdHJ1Y3Qga29tZWRhX3By
b2R1Y3RfZGF0YSAqcHJvZHVjdDsKKwlrb21lZGFfaWRlbnRpZnlfZnVuYyBrb21lZGFfaWRlbnRp
Znk7CiAJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXY7CiAJc3RydWN0IHJlc291cmNlICppb19yZXM7
CiAJaW50IGVyciA9IDA7CgotCXByb2R1Y3QgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2
KTsKLQlpZiAoIXByb2R1Y3QpCisJa29tZWRhX2lkZW50aWZ5ID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7CisJaWYgKCFrb21lZGFfaWRlbnRpZnkpCiAJCXJldHVybiBFUlJfUFRSKC1F
Tk9ERVYpOwoKIAlpb19yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJD
RV9NRU0sIDApOwpAQCAtMjQwLDExICsyNDgsOSBAQCBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRh
X2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQoKIAljbGtfcHJlcGFyZV9lbmFibGUobWRl
di0+YWNsayk7CgotCW1kZXYtPmZ1bmNzID0gcHJvZHVjdC0+aWRlbnRpZnkobWRldi0+cmVnX2Jh
c2UsICZtZGV2LT5jaGlwKTsKLQlpZiAoIWtvbWVkYV9wcm9kdWN0X21hdGNoKG1kZXYsIHByb2R1
Y3QtPnByb2R1Y3RfaWQpKSB7Ci0JCURSTV9FUlJPUigiRFQgY29uZmlndXJlZCAleCBtaXNtYXRj
aCB3aXRoIHJlYWwgSFcgJXguXG4iLAotCQkJICBwcm9kdWN0LT5wcm9kdWN0X2lkLAotCQkJICBN
QUxJRFBfQ09SRV9JRF9QUk9EVUNUX0lEKG1kZXYtPmNoaXAuY29yZV9pZCkpOworCW1kZXYtPmZ1
bmNzID0ga29tZWRhX2lkZW50aWZ5KG1kZXYtPnJlZ19iYXNlLCAmbWRldi0+Y2hpcCk7CisJaWYg
KCFtZGV2LT5mdW5jcykgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpZGVudGlmeSB0aGUgSFcu
XG4iKTsKIAkJZXJyID0gLUVOT0RFVjsKIAkJZ290byBkaXNhYmxlX2NsazsKIAl9CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGM3MGNj
MjVkMjQ2Zi4uZjkxYTExM2IwZmRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtNTEsMTEgKzUxLDYgQEAKCiAjZGVmaW5lIEtPTUVE
QV9XQVJOX0VWRU5UUwlLT01FREFfRVJSX0NTQ0UKCi0vKiBtYWxpZHAgZGV2aWNlIGlkICovCi1l
bnVtIHsKLQlNQUxJX0Q3MSA9IDAsCi19OwotCiAvKiBwaXBlbGluZSBEVCBwb3J0cyAqLwogZW51
bSB7CiAJS09NRURBX09GX1BPUlRfT1VUUFVUCQk9IDAsCkBAIC02OSwxMiArNjQsNiBAQCBzdHJ1
Y3Qga29tZWRhX2NoaXBfaW5mbyB7CiAJdTMyIGJ1c193aWR0aDsKIH07Cgotc3RydWN0IGtvbWVk
YV9wcm9kdWN0X2RhdGEgewotCXUzMiBwcm9kdWN0X2lkOwotCWNvbnN0IHN0cnVjdCBrb21lZGFf
ZGV2X2Z1bmNzICooKmlkZW50aWZ5KSh1MzIgX19pb21lbSAqcmVnLAotCQkJCQkgICAgIHN0cnVj
dCBrb21lZGFfY2hpcF9pbmZvICppbmZvKTsKLX07Ci0KIHN0cnVjdCBrb21lZGFfZGV2OwoKIHN0
cnVjdCBrb21lZGFfZXZlbnRzIHsKQEAgLTIxOSw2ICsyMDgsOSBAQCBrb21lZGFfcHJvZHVjdF9t
YXRjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgdTMyIHRhcmdldCkKIAlyZXR1cm4gTUFMSURQ
X0NPUkVfSURfUFJPRFVDVF9JRChtZGV2LT5jaGlwLmNvcmVfaWQpID09IHRhcmdldDsKIH0KCit0
eXBlZGVmIGNvbnN0IHN0cnVjdCBrb21lZGFfZGV2X2Z1bmNzICoKKygqa29tZWRhX2lkZW50aWZ5
X2Z1bmMpKHUzMiBfX2lvbWVtICpyZWcsIHN0cnVjdCBrb21lZGFfY2hpcF9pbmZvICpjaGlwKTsK
KwogY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKgogZDcxX2lkZW50aWZ5KHUzMiBfX2lv
bWVtICpyZWcsIHN0cnVjdCBrb21lZGFfY2hpcF9pbmZvICpjaGlwKTsKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCmluZGV4IGQ2YzIyMjJjNWQz
My4uYjdhMTA5N2M0NWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kcnYuYwpAQCAtMTIzLDE1ICsxMjMsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9w
bGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsK
IH0KCi1zdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2RhdGEga29tZWRhX3Byb2R1
Y3RzW10gPSB7Ci0JW01BTElfRDcxXSA9IHsKLQkJLnByb2R1Y3RfaWQgPSBNQUxJRFBfRDcxX1BS
T0RVQ1RfSUQsCi0JCS5pZGVudGlmeSA9IGQ3MV9pZGVudGlmeSwKLQl9LAotfTsKLQogc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga29tZWRhX29mX21hdGNoW10gPSB7Ci0JeyAuY29t
cGF0aWJsZSA9ICJhcm0sbWFsaS1kNzEiLCAuZGF0YSA9ICZrb21lZGFfcHJvZHVjdHNbTUFMSV9E
NzFdLCB9LAorCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRl
bnRpZnksIH0sCiAJe30sCiB9OwoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
