Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92A6327E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0489F73;
	Tue,  9 Jul 2019 07:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A77089F73
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 07:57:37 +0000 (UTC)
Received: from VI1PR08CA0127.eurprd08.prod.outlook.com (2603:10a6:800:d4::29)
 by AM5PR0801MB1842.eurprd08.prod.outlook.com (2603:10a6:203:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Tue, 9 Jul
 2019 07:57:34 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0127.outlook.office365.com
 (2603:10a6:800:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 07:57:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 07:57:32 +0000
Received: ("Tessian outbound 8297bef43b9f:v23");
 Tue, 09 Jul 2019 07:57:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee2f6818f3d694bb
X-CR-MTA-TID: 64aa7808
Received: from 6d84653107b5.2 (cr-mta-lb-1.cr-mta-net [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 146FB70C-6B2D-4E9F-A560-60CA5A9B6CCA.1; 
 Tue, 09 Jul 2019 07:57:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d84653107b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 09 Jul 2019 07:57:19 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 07:57:14 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 07:57:14 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVNivrN+3ktNltckK09VpQIkadOA==
Date: Tue, 9 Jul 2019 07:57:14 +0000
Message-ID: <20190709075640.22012-3-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1e1c7bfa-a3c1-4110-f218-08d704431919
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4816; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|AM5PR0801MB1842:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB184265C0817D04727C77510CB3F10@AM5PR0801MB1842.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(66066001)(305945005)(7736002)(2201001)(64756008)(8676002)(81156014)(81166006)(66946007)(73956011)(66446008)(1076003)(8936002)(186003)(66556008)(86362001)(54906003)(110136005)(66476007)(55236004)(386003)(316002)(76176011)(6506007)(102836004)(71190400001)(71200400001)(52116002)(5660300002)(14454004)(6436002)(103116003)(68736007)(446003)(3846002)(6116002)(478600001)(4326008)(11346002)(36756003)(25786009)(6486002)(53936002)(99286004)(6512007)(50226002)(26005)(2501003)(256004)(486006)(14444005)(2906002)(2616005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: rwaNevanhZYHVQN1D0uu07cLtrR1N4kAfVuYtAE86jL40xYZsf8Kd/qrpA4dZHZxIy+8CjqdqqxwF2tTXrdSQdiaXPsYlPJ2JHi5Fl9LP+1XF7K4R9q3uCkQ3qS5ssYhYAc3O6F3HpdOhL6RRx2lXRboxEIcwK8zPdzy5TX1BAAifi44zNal7row9SmFRpUuO2Sg/aZHa2Ie644Oil9EjCkMaBftKpoQDNhs7ryqLHXzIxN6bKOJiFaPIl9bbUP7NLn6RqsGJ1q2mfQZvjFDcPk6NxxJFDBtmE4Pkpo7w2zlgKRzmP2FXnrBlFeRW2iKUM6A5ALbQsU+AZKCAmvGd3ITUW0zcdFdmbqk/CHgy3sulpBh0421LToEGBAG9LQLFkjpiMES1HHv3EBFYqlOhzDfKjHir7n0ZWUGtws3BrY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(189003)(199004)(336012)(36756003)(66066001)(6512007)(103116003)(7736002)(6486002)(5660300002)(50226002)(305945005)(47776003)(8936002)(2616005)(356004)(4326008)(2501003)(8746002)(446003)(6506007)(1076003)(386003)(26826003)(25786009)(22756006)(316002)(6116002)(23756003)(63350400001)(76130400001)(63370400001)(76176011)(126002)(3846002)(70586007)(86362001)(2906002)(99286004)(186003)(110136005)(486006)(478600001)(54906003)(476003)(14454004)(8676002)(11346002)(14444005)(50466002)(102836004)(81166006)(26005)(70206006)(81156014)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1842;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1131f6e0-b330-490d-da54-08d704430e28
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1842; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: gAHj7/BY7aYGE84CBOiVjiHqwv+rNLwGhXqnovOBY50nNelYFiEnY2zCAduIfKH9Af22V/vj9Gv+ZrpAZ6R2vgrvUKy2Y31Jdsmt1PkfUk27CNDo5blNvnc6ho+9+NVy6yrcE+lnK0SsIYZM4ZNvJBn/LreNfylj2bd18+e9ClyZZbxivOq0dzlLFEvgkIO8IW5HXH3y9o97GmaGfgwJ1QYd6qPJ81aTj8QoSM6D9VNwxK6Z0qiJJSMEP7Wrg2EpLb5ZZ40Kgg6hwYbo083yMQOdURmoAo9bm4TYhmFonIyv9Yjn8EyJ7NCqzTxvrNaOVh0w72QsiQWTglKgceNQ9osKFX3SYaMSgho4/a58jCkyIw+Cd/zKa/2rIRMWXaiV3Gf1oAZPT0Uxptd4HPTTPEGRnsUdwIDGsd7e+ieXcxY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 07:57:32.6114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1c7bfa-a3c1-4110-f218-08d704431919
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1842
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFpahTymf9bTgfzhyGJ3jRVYKfJNc5Y5uo1w/e06EXY=;
 b=8CCMlBZKfDjCeymC0b8lxHXK+3rTJIWCd4vc9XQ0QlBfwvA80SUrJOgVxJZyrr7GCDI0ShY/PiGKTrlk/hQz1s8wnhil5p16vV0aWsrPMBA7bM11jhiD0hpMcg/XkIl+6u1dIStAWxquN9R4NC3Lv8axSmGdAW5j+XSHuDopOWU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFpahTymf9bTgfzhyGJ3jRVYKfJNc5Y5uo1w/e06EXY=;
 b=8CCMlBZKfDjCeymC0b8lxHXK+3rTJIWCd4vc9XQ0QlBfwvA80SUrJOgVxJZyrr7GCDI0ShY/PiGKTrlk/hQz1s8wnhil5p16vV0aWsrPMBA7bM11jhiD0hpMcg/XkIl+6u1dIStAWxquN9R4NC3Lv8axSmGdAW5j+XSHuDopOWU=
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

RDMyIGlzIHNpbXBsZSB2ZXJzaW9uIG9mIEQ3MSwgdGhlIGRpZmZlcmVuY2UgaXM6Ci0gT25seSBo
YXMgb25lIHBpcGVsaW5lCi0gRHJvcCB0aGUgcGVyaXBoIGJsb2NrIGFuZCBtZXJnZSBpdCB0byBH
Q1UKClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vZHJtL2FybS9kaXNwbGF5L2luY2x1
ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgMyArLQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2NvbXBvbmVudC5jICAgIHwgIDIgKy0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9kNzEvZDcxX2Rldi5jICB8IDQzICsrKysrKysrKysrKy0tLS0tLS0KIC4uLi9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8IDEzICsrKysrKwogLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAgIHwgIDEgKwogNSBmaWxlcyBjaGFuZ2Vk
LCA0NCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAppbmRleCAxMDUzYjEx
MzUyZWIuLjE2YThhMmMyMmM0MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCkBAIC0xOCw3ICsxOCw4IEBACiAjZGVmaW5l
IE1BTElEUF9DT1JFX0lEX1NUQVRVUyhfX2NvcmVfaWQpICAgICAoKChfX3UzMikoX19jb3JlX2lk
KSkgJiAweEZGKQoKIC8qIE1hbGktZGlzcGxheSBwcm9kdWN0IElEcyAqLwotI2RlZmluZSBNQUxJ
RFBfRDcxX1BST0RVQ1RfSUQgICAweDAwNzEKKyNkZWZpbmUgTUFMSURQX0Q3MV9QUk9EVUNUX0lE
CTB4MDA3MQorI2RlZmluZSBNQUxJRFBfRDMyX1BST0RVQ1RfSUQJMHgwMDMyCgogdW5pb24ga29t
ZWRhX2NvbmZpZ19pZCB7CiAJc3RydWN0IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCBhNjg5NTRiYjU5NGEu
LjU5M2Y4YjdlOWJiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtMTE3OCw3ICsxMTc4LDcgQEAgc3RhdGlj
IGludCBkNzFfdGltaW5nX2N0cmxyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKCiAJY3RybHIg
PSB0b19jdHJscihjKTsKCi0JY3RybHItPnN1cHBvcnRzX2R1YWxfbGluayA9IHRydWU7CisJY3Ry
bHItPnN1cHBvcnRzX2R1YWxfbGluayA9IGQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rOwogCWN0cmxy
LT5zdXBwb3J0c192cnIgPSB0cnVlOwogCXNldF9yYW5nZSgmY3RybHItPnZmcF9yYW5nZSwgMCwg
MHgzRkYpOwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuYwppbmRleCBlMzgzYTc4MWM5ZTkuLjhmN2M0NGEwYjkxNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwpAQCAtMzcxLDIzICsz
NzEsMzMgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYg
Km1kZXYpCiAJCWdvdG8gZXJyX2NsZWFudXA7CiAJfQoKLQkvKiBwcm9iZSBQRVJJUEggKi8KKwkv
KiBPbmx5IHRoZSBsZWdhY3kgSFcgaGFzIHRoZSBwZXJpcGggYmxvY2ssIHRoZSBuZXdlciBtZXJn
ZXMgdGhlIHBlcmlwaAorCSAqIGludG8gR0NVCisJICovCiAJdmFsdWUgPSBtYWxpZHBfcmVhZDMy
KGQ3MS0+cGVyaXBoX2FkZHIsIEJMS19CTE9DS19JTkZPKTsKLQlpZiAoQkxPQ0tfSU5GT19CTEtf
VFlQRSh2YWx1ZSkgIT0gRDcxX0JMS19UWVBFX1BFUklQSCkgewotCQlEUk1fRVJST1IoImFjY2Vz
cyBibGsgcGVyaXBoIGJ1dCBnb3QgYmxrOiAlZC5cbiIsCi0JCQkgIEJMT0NLX0lORk9fQkxLX1RZ
UEUodmFsdWUpKTsKLQkJZXJyID0gLUVJTlZBTDsKLQkJZ290byBlcnJfY2xlYW51cDsKKwlpZiAo
QkxPQ0tfSU5GT19CTEtfVFlQRSh2YWx1ZSkgIT0gRDcxX0JMS19UWVBFX1BFUklQSCkKKwkJZDcx
LT5wZXJpcGhfYWRkciA9IE5VTEw7CisKKwlpZiAoZDcxLT5wZXJpcGhfYWRkcikgeworCQkvKiBw
cm9iZSBQRVJJUEhFUkFMIGluIGxlZ2FjeSBIVyAqLworCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIo
ZDcxLT5wZXJpcGhfYWRkciwgUEVSSVBIX0NPTkZJR1VSQVRJT05fSUQpOworCisJCWQ3MS0+bWF4
X2xpbmVfc2l6ZQk9IHZhbHVlICYgUEVSSVBIX01BWF9MSU5FX1NJWkUgPyA0MDk2IDogMjA0ODsK
KwkJZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKKwkJZDcxLT5udW1fcmljaF9sYXllcnMJPSB2YWx1
ZSAmIFBFUklQSF9OVU1fUklDSF9MQVlFUlMgPyAyIDogMTsKKwkJZDcxLT5zdXBwb3J0c19kdWFs
X2xpbmsJPSAhISh2YWx1ZSAmIFBFUklQSF9TUExJVF9FTik7CisJCWQ3MS0+aW50ZWdyYXRlc190
YnUJPSAhISh2YWx1ZSAmIFBFUklQSF9UQlVfRU4pOworCX0gZWxzZSB7CisJCXZhbHVlID0gbWFs
aWRwX3JlYWQzMihkNzEtPmdjdV9hZGRyLCBHQ1VfQ09ORklHVVJBVElPTl9JRDApOworCQlkNzEt
Pm1heF9saW5lX3NpemUJPSBHQ1VfTUFYX0xJTkVfU0laRSh2YWx1ZSk7CisJCWQ3MS0+bWF4X3Zz
aXplCQk9IEdDVV9NQVhfTlVNX0xJTkVTKHZhbHVlKTsKKworCQl2YWx1ZSA9IG1hbGlkcF9yZWFk
MzIoZDcxLT5nY3VfYWRkciwgR0NVX0NPTkZJR1VSQVRJT05fSUQxKTsKKwkJZDcxLT5udW1fcmlj
aF9sYXllcnMJPSBHQ1VfTlVNX1JJQ0hfTEFZRVJTKHZhbHVlKTsKKwkJZDcxLT5zdXBwb3J0c19k
dWFsX2xpbmsJPSBHQ1VfRElTUExBWV9TUExJVF9FTih2YWx1ZSk7CisJCWQ3MS0+aW50ZWdyYXRl
c190YnUJPSBHQ1VfRElTUExBWV9UQlVfRU4odmFsdWUpOwogCX0KCi0JdmFsdWUgPSBtYWxpZHBf
cmVhZDMyKGQ3MS0+cGVyaXBoX2FkZHIsIFBFUklQSF9DT05GSUdVUkFUSU9OX0lEKTsKLQotCWQ3
MS0+bWF4X2xpbmVfc2l6ZQk9IHZhbHVlICYgUEVSSVBIX01BWF9MSU5FX1NJWkUgPyA0MDk2IDog
MjA0ODsKLQlkNzEtPm1heF92c2l6ZQkJPSA0MDk2OwotCWQ3MS0+bnVtX3JpY2hfbGF5ZXJzCT0g
dmFsdWUgJiBQRVJJUEhfTlVNX1JJQ0hfTEFZRVJTID8gMiA6IDE7Ci0JZDcxLT5zdXBwb3J0c19k
dWFsX2xpbmsJPSB2YWx1ZSAmIFBFUklQSF9TUExJVF9FTiA/IHRydWUgOiBmYWxzZTsKLQlkNzEt
PmludGVncmF0ZXNfdGJ1CT0gdmFsdWUgJiBQRVJJUEhfVEJVX0VOID8gdHJ1ZSA6IGZhbHNlOwot
CiAJZm9yIChpID0gMDsgaSA8IGQ3MS0+bnVtX3BpcGVsaW5lczsgaSsrKSB7CiAJCXBpcGUgPSBr
b21lZGFfcGlwZWxpbmVfYWRkKG1kZXYsIHNpemVvZihzdHJ1Y3QgZDcxX3BpcGVsaW5lKSwKIAkJ
CQkJICAgJmQ3MV9waXBlbGluZV9mdW5jcyk7CkBAIC0zOTksNyArNDA5LDcgQEAgc3RhdGljIGlu
dCBkNzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJfQoKIAkvKiBs
b29wIHRoZSByZWdpc3RlciBibGtzIGFuZCBwcm9iZSAqLwotCWkgPSAyOyAvKiBleGNsdWRlIEdD
VSBhbmQgUEVSSVBIICovCisJaSA9IDE7IC8qIGV4Y2x1ZGUgR0NVICovCiAJb2Zmc2V0ID0gRDcx
X0JMT0NLX1NJWkU7IC8qIHNraXAgR0NVICovCiAJd2hpbGUgKGkgPCBkNzEtPm51bV9ibG9ja3Mp
IHsKIAkJYmxrX2Jhc2UgPSBtZGV2LT5yZWdfYmFzZSArIChvZmZzZXQgPj4gMik7CkBAIC00MDks
OSArNDE5LDkgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9k
ZXYgKm1kZXYpCiAJCQllcnIgPSBkNzFfcHJvYmVfYmxvY2soZDcxLCAmYmxrLCBibGtfYmFzZSk7
CiAJCQlpZiAoZXJyKQogCQkJCWdvdG8gZXJyX2NsZWFudXA7Ci0JCQlpKys7CiAJCX0KCisJCWkr
KzsKIAkJb2Zmc2V0ICs9IEQ3MV9CTE9DS19TSVpFOwogCX0KCkBAIC01ODcsNiArNTk3LDcgQEAg
ZDcxX2lkZW50aWZ5KHUzMiBfX2lvbWVtICpyZWdfYmFzZSwgc3RydWN0IGtvbWVkYV9jaGlwX2lu
Zm8gKmNoaXApCgogCXN3aXRjaCAocHJvZHVjdF9pZCkgewogCWNhc2UgTUFMSURQX0Q3MV9QUk9E
VUNUX0lEOgorCWNhc2UgTUFMSURQX0QzMl9QUk9EVUNUX0lEOgogCQlmdW5jcyA9ICZkNzFfY2hp
cF9mdW5jczsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCmluZGV4IDJkNWU2ZDAwYjQyYy4uZGE2YmQ1
MzU4MzZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfcmVncy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9yZWdzLmgKQEAgLTcxLDYgKzcxLDE5IEBACiAjZGVmaW5lIEdDVV9DT05UUk9MX01PREUo
eCkJKCh4KSAmIDB4NykKICNkZWZpbmUgR0NVX0NPTlRST0xfU1JTVAlCSVQoMTYpCgorLyogR0NV
X0NPTkZJR1VSQVRJT04gcmVnaXN0ZXJzICovCisjZGVmaW5lIEdDVV9DT05GSUdVUkFUSU9OX0lE
MAkweDEwMAorI2RlZmluZSBHQ1VfQ09ORklHVVJBVElPTl9JRDEJMHgxMDQKKworLyogR0NVIGNv
bmZpZ3VyYXRpb24gKi8KKyNkZWZpbmUgR0NVX01BWF9MSU5FX1NJWkUoeCkJKCh4KSAmIDB4RkZG
RikKKyNkZWZpbmUgR0NVX01BWF9OVU1fTElORVMoeCkJKCh4KSA+PiAxNikKKyNkZWZpbmUgR0NV
X05VTV9SSUNIX0xBWUVSUyh4KQkoKHgpICYgMHg3KQorI2RlZmluZSBHQ1VfTlVNX1BJUEVMSU5F
Uyh4KQkoKCh4KSA+PiAzKSAmIDB4NykKKyNkZWZpbmUgR0NVX05VTV9TQ0FMRVJTKHgpCSgoKHgp
ID4+IDYpICYgMHg3KQorI2RlZmluZSBHQ1VfRElTUExBWV9TUExJVF9FTih4KQkoKCh4KSA+PiAx
NikgJiAweDEpCisjZGVmaW5lIEdDVV9ESVNQTEFZX1RCVV9FTih4KQkoKCh4KSA+PiAxNykgJiAw
eDEpCisKIC8qIEdDVSBvcG1vZGUgKi8KICNkZWZpbmUgSU5BQ1RJVkVfTU9ERQkJMAogI2RlZmlu
ZSBUQlVfQ09OTkVDVF9NT0RFCTEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZHJ2LmMKaW5kZXggYjdhMTA5N2M0NWM0Li5hZDM4YmJjNzQzMWUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCkBAIC0x
MjUsNiArMTI1LDcgQEAgc3RhdGljIGludCBrb21lZGFfcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
a29tZWRhX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJhcm0sbWFsaS1kNzEiLCAu
ZGF0YSA9IGQ3MV9pZGVudGlmeSwgfSwKKwl7IC5jb21wYXRpYmxlID0gImFybSxtYWxpLWQzMiIs
IC5kYXRhID0gZDcxX2lkZW50aWZ5LCB9LAogCXt9LAogfTsKCi0tCjIuMjAuMQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
