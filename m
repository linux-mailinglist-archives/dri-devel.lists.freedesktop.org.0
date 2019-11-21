Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0A9104B1E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EAD6EAF1;
	Thu, 21 Nov 2019 07:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5A96EAF1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:06 +0000 (UTC)
Received: from VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) by AM0PR08MB3361.eurprd08.prod.outlook.com
 (2603:10a6:208:db::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 21 Nov
 2019 07:13:04 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR0802CA0041.outlook.office365.com
 (2603:10a6:800:a9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:03 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 07:13:03 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Thu, 21 Nov 2019 07:13:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4880ec7cc266765
X-CR-MTA-TID: 64aa7808
Received: from 4a9d07b44583.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 721367F0-2AB1-468E-B7FD-1618019B0634.1; 
 Thu, 21 Nov 2019 07:12:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a9d07b44583.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 07:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjUnlFdCBcaGrQBGCq5G3f7DrS7NoBTwinxP3R/V/jDNIHwiXx4A5t3W69Zmj4+Ag6N/XcbPw66EMowMK15Z8ZTF/VZPEgYXkE5dA/L2K8dJUxl/BfIh2o190EyGZMs9JNm4CPayuxtMarOWO1UtErRycWnvQtRLdolqa4boJpCcIDbftDQ+eM+oQOsgxP5B+dOq8CLPfcXV2ZoPUmxyCajqCNjzVWLZ7wSxtTkjVOb8NhyoalTreYZJapc4kfzjHTyvXlPdOJ7VQgBEnANtecwvHh8wPVv/jijN5vn6yjOlkMC1e6u60tzXsOOarSyHdAHD7wMO1R+7vZMq46/Hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=MnBfew00yZpA4AwFWJ8RhyNGxDtEHeQZKEd5RgFA3bBbsck2VqYdkfa/bnOr+tVdWeJun/HkVU6IFdZYvmTiVfEyVh0Vb3PqpTgjYCz4IcKFMrdp5aJ7Vf4MMibEkUEZL63rlurvzH1FRIHcxBdgLzOioBdDNlKLMRCn/dfDNZ2kTWuC3pjHRX6umYrJ9CALp9korgGNs1aM1GdbObULfjSNbgeHETluInOMTex4eQANfHL7nQSURq/XBU2Q8SR26eDUS0sANFLEQdRQHxTF+uLeUzXr/SuV0ydNJ1Uljn+7kDhpnMhmMChZ9NlMwtAmNbKR68xeHmugg87qYw0v5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5069.eurprd08.prod.outlook.com (20.179.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 07:12:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 07:12:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Topic: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Index: AQHVoDsY3wS7JXHxKU+92h5A5rXdAA==
Date: Thu, 21 Nov 2019 07:12:55 +0000
Message-ID: <20191121071205.27511-7-james.qian.wang@arm.com>
References: <20191121071205.27511-1-james.qian.wang@arm.com>
In-Reply-To: <20191121071205.27511-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a277b613-0530-4fe6-b36b-08d76e52401d
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VE1PR08MB5069:|AM0PR08MB3361:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB336111EB4D19FA4C86B5E5FDB34E0@AM0PR08MB3361.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(386003)(6636002)(55236004)(102836004)(6506007)(76176011)(256004)(52116002)(2906002)(14444005)(50226002)(7736002)(305945005)(66446008)(186003)(81166006)(81156014)(8676002)(8936002)(66946007)(6512007)(26005)(2616005)(71200400001)(6486002)(446003)(478600001)(11346002)(71190400001)(6436002)(64756008)(66476007)(66556008)(86362001)(66066001)(4326008)(36756003)(2501003)(6116002)(316002)(3846002)(14454004)(103116003)(99286004)(54906003)(110136005)(25786009)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5069;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ZVL6Pefp/KpI9j1dlD5MFMEhTYbRJjNoxdsrboCru2D98uw0JOKWty9FQk00nMhsyDsLFLTGIw8o54K6BCyqasvYfsUkFKP4DIqIxtjh4JdK8mbSthEBmB6dQGVGUHFlZ8m8vwH1nrwnAbJLuyAZMqi2n3esi36xiU/u/8GtS35FztUYiOXJWR+Fy73nea/g55p1bdw+ehde/k4wRgbr1+qtZ7WHiJTYgZU7gKF4TPWgqWAA8gGj1KQlESWfOlbf/wukThzWPvHAUWx95SnemXfGHFADrpSv3UJEPjf5bBI8P6iWrVJmdL+qWB1tAbvmutAiXSvhtoELdcEgSDsGeQ2X5k706+zqpNj3ZerTsfZL2Nd4+hEbct0Gfau3e6qag/eG5FC46Thal7hv6WZiFBIKAhJoHbJ+A8ZCxqBBQENq9byqZZSYp8rEhNAWx7ww
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1110001)(339900001)(189003)(199004)(54906003)(26826003)(23756003)(478600001)(356004)(103116003)(3846002)(36756003)(2906002)(66066001)(2616005)(47776003)(6116002)(11346002)(446003)(14454004)(25786009)(70586007)(70206006)(8676002)(8936002)(81166006)(8746002)(50226002)(1076003)(336012)(81156014)(7736002)(2501003)(4326008)(36906005)(305945005)(76176011)(6486002)(22756006)(86362001)(105606002)(50466002)(110136005)(76130400001)(102836004)(6512007)(99286004)(5660300002)(14444005)(186003)(6636002)(386003)(6506007)(316002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3361;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 16cc174f-07f0-41f1-9f65-08d76e523b10
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSWLjB7NLP+nPyjnqqW6oqFZKytDuIgJDTFgIgopt8P4bcPEWzVLoRXhewwEv+M7K014zV055zKnbZbV0t5u4BuWyuS8sJ/qAhyle2GFF6U+fVX0cDC3EIfheQacSOCzEvBhFu3AECEC96Ork2SPAgJ6txvPYZi9nTDA5KoX+z6Tyzo7mAl4orrkWb5irFrdx1s6wd9Ij/Mi6qNB7JOPIOsnxv078jB1bhBopS+DnHdF6Fqv/LVCNsAyt+rrRKejQuTbjV9Xqd42UxlQXfDNVpntdlUalD8Nu2iL3V+hpn9KnHjOy2nNfxW19Cokz3odRd9Mz8eebaVkwVL2GM+Ai6uA/TZRpGsObC7AiFqHJBrAHWrM7pWlp8MLDSDVk8OMzr0QO5ijLlmAsms9oU/XSjgrQCxSBh+4Z6KowLNcmFzco465ZSSaypWXm8mOfWjc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 07:13:03.7696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a277b613-0530-4fe6-b36b-08d76e52401d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3361
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=7vm3jIUmTSObHMUF7FSiImwjCcYyCxLDOxmQfOrTXDprYk0Q2yyFcHaCJ9PVC3/MXrlq7ffjxsmD4UnxDmJFVvIHvKt6rPKzVx5JrOIMqCfKk9YoiGD6wlRMCvSMDmEuEKfDnbGLpUqY+Ps6QdqTvW9OKToI09GOyXFH/3rv3rA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=7vm3jIUmTSObHMUF7FSiImwjCcYyCxLDOxmQfOrTXDprYk0Q2yyFcHaCJ9PVC3/MXrlq7ffjxsmD4UnxDmJFVvIHvKt6rPKzVx5JrOIMqCfKk9YoiGD6wlRMCvSMDmEuEKfDnbGLpUqY+Ps6QdqTvW9OKToI09GOyXFH/3rv3rA=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHNvbWUgcmVzdHJpY3Rpb25zIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSwg
ZXhwb3NlIGl0IHZpYQpjb25maWdfaWQgdG8gdXNlci4KClNpZ25lZC1vZmYtYnk6IEphbWVzIFFp
YW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5o
IHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5j
ICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFs
aWRwX3Byb2R1Y3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlk
cF9wcm9kdWN0LmgKaW5kZXggMTA1M2IxMTM1MmViLi45NmUyZTQwMTYyNTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaApA
QCAtMjcsNyArMjcsOCBAQCB1bmlvbiBrb21lZGFfY29uZmlnX2lkIHsKIAkJCW5fc2NhbGVyczoy
LCAvKiBudW1iZXIgb2Ygc2NhbGVycyBwZXIgcGlwZWxpbmUgKi8KIAkJCW5fbGF5ZXJzOjMsIC8q
IG51bWJlciBvZiBsYXllcnMgcGVyIHBpcGVsaW5lICovCiAJCQluX3JpY2hzOjMsIC8qIG51bWJl
ciBvZiByaWNoIGxheWVycyBwZXIgcGlwZWxpbmUgKi8KLQkJCXJlc2VydmVkX2JpdHM6NjsKKwkJ
CXNpZGVfYnlfc2lkZToxLCAvKiBpZiBIVyB3b3JrcyBvbiBzaWRlX2J5X3NpZGUgbW9kZSAqLwor
CQkJcmVzZXJ2ZWRfYml0czo1OwogCX07CiAJX191MzIgdmFsdWU7CiB9OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRleCBjM2ZhNDgzNWNi
OGQuLjRkZDQ2OTlkNGUzZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMKQEAgLTgzLDYgKzgzLDcgQEAgY29uZmlnX2lkX3Nob3coc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQog
CW1lbXNldCgmY29uZmlnX2lkLCAwLCBzaXplb2YoY29uZmlnX2lkKSk7CiAKIAljb25maWdfaWQu
bWF4X2xpbmVfc3ogPSBwaXBlLT5sYXllcnNbMF0tPmhzaXplX2luLmVuZDsKKwljb25maWdfaWQu
c2lkZV9ieV9zaWRlID0gbWRldi0+c2lkZV9ieV9zaWRlOwogCWNvbmZpZ19pZC5uX3BpcGVsaW5l
cyA9IG1kZXYtPm5fcGlwZWxpbmVzOwogCWNvbmZpZ19pZC5uX3NjYWxlcnMgPSBwaXBlLT5uX3Nj
YWxlcnM7CiAJY29uZmlnX2lkLm5fbGF5ZXJzID0gcGlwZS0+bl9sYXllcnM7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
