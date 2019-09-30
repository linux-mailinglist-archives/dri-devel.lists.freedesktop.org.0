Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B607C1AC7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 06:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19786E334;
	Mon, 30 Sep 2019 04:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02B86E334
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:55:00 +0000 (UTC)
Received: from VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) by VI1PR08MB3583.eurprd08.prod.outlook.com
 (2603:10a6:803:84::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 04:54:56 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR0802CA0019.outlook.office365.com
 (2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 04:54:56 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 04:54:53 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 30 Sep 2019 04:54:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 824b97fff89316d1
X-CR-MTA-TID: 64aa7808
Received: from d5dd76d7e6d0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FE777CD-0CB5-4C4C-BDA6-25D9613B6C2E.1; 
 Mon, 30 Sep 2019 04:54:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5dd76d7e6d0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 04:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8nuF3kg6g72EXC91iWZ7gG6ziPxNQdLCV9RWqoch+rSfoYp2v+EnHSJt+4JxkjDZ3ouE+LFtO3fiXCNOSsIMDQ9XO8IUfmblIGFJGNshZANzvCDd6Y4gMlGSLCxxalkATHuA4JAld7rjxCFpCDypslDLw6/uwHMvQ23RbmA9aik/shSl06dUjHclDPbydTLSqAYaFVH16PvQc9pQPhZy5E8sNrr7ZU1DUyrPIqUnP45GwYyzQuigvZm9iw5iaqzE+D3E0G+WSnl+6jkKGDgp1++BJf6t4wKEl6VU7HbJx8Uc0vVKNjRd+5aTSs7fA1pJ9PNfXyds4f+FrV/xHDM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvbEac7OETtKJD9fllmHTJ/Fl/DPCKR8vUreA20Jicw=;
 b=Ka7ivca9vb+82L612XlrH8c+B26at/6HKFb+1omtxZYykFlZZISKQm6pFV0CC8/Dv5MO5730u+rtIjgRqqqLY0i8LAfDW4XSLdUXGhsrPmSKkB99XqdfD2kPznlFPyh1dsoew9/0PsHb8TejzLHry1ZjY26zirNSi04A/qFEEWRZpBaq1e7Vhu9idBWFT6kVURUdM8VxwFKUsVTe+ZzfOdxSQdU+H/fB4Xs4Umzdq9RaS7NdwmL+3qA3aaO8QYMIP4/+NAJrp8wKuefxVJ7BJnP5YYqY37HH8xpCyNd339fFXEE8KjorjanK7XZQeStXHSGp1l3hmvWblL/rRbl18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4671.eurprd08.prod.outlook.com (10.255.115.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 04:54:41 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 04:54:41 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVd0sr2eIkvH1CKkK4ZygjJg2yVg==
Date: Mon, 30 Sep 2019 04:54:41 +0000
Message-ID: <20190930045408.8053-3-james.qian.wang@arm.com>
References: <20190930045408.8053-1-james.qian.wang@arm.com>
In-Reply-To: <20190930045408.8053-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bb4daf03-89ea-4e4b-68db-08d745625667
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4671:|VE1PR08MB4671:|VI1PR08MB3583:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB35836B61B2603481FFF97890B3820@VI1PR08MB3583.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(25786009)(52116002)(55236004)(11346002)(50226002)(486006)(6506007)(8676002)(8936002)(6512007)(99286004)(102836004)(6116002)(6486002)(3846002)(1076003)(2906002)(81166006)(5660300002)(86362001)(2616005)(476003)(446003)(386003)(6436002)(76176011)(81156014)(186003)(54906003)(110136005)(26005)(316002)(14454004)(2201001)(478600001)(66066001)(66446008)(64756008)(66556008)(103116003)(66476007)(66946007)(2501003)(4326008)(36756003)(71200400001)(7736002)(71190400001)(305945005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4671;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6dBgWVlXMfRMwCCEFy6F9eSikyP7EJwgv5VvV/2Cbcod7A9KzusJ1nRYQLXZ8ZnU0cuJaBhbOUg51Lomb2jGGvoWDiHf1jKso8jFFchoOWRB87NLxNHObfRP1SrvCRSW4SgwNCipYQZCHl11J03gz/mVdGGHbQPT1sahUKv6jGhAt1iQuiwhF4Zxc+5ibYYQWiY4PLdGcW2V37n9Qe3f1GrGm0+/QskSCTv8xptzIdksqhjxuW657D15Q//zyG6e/nXAFAWS+gCxzKh/+G/fNjUkpZPMwenj+HILFDzLB11mxFOPksROyCXHG81pZ+yNz+71qwvyV8Of+PTHleuIlESCuodrVb9xytPYKN7gxslgXsm+Eg3Uc8t7uD1BRtYOmrYyYC51LMiRt2RkwFSp6o+zk/ORMqOYl46FHtwNpvY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4671
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(376002)(396003)(136003)(199004)(189003)(70586007)(476003)(63350400001)(14454004)(50466002)(11346002)(25786009)(446003)(2616005)(47776003)(336012)(356004)(26826003)(126002)(103116003)(66066001)(2501003)(478600001)(486006)(1076003)(23756003)(5660300002)(76130400001)(305945005)(7736002)(70206006)(81166006)(81156014)(6116002)(36756003)(316002)(8676002)(3846002)(36906005)(50226002)(8746002)(8936002)(26005)(76176011)(110136005)(54906003)(6486002)(99286004)(102836004)(22756006)(2906002)(386003)(6506007)(4326008)(2201001)(86362001)(6512007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3583;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0cd0d40-c547-484a-7e98-08d745624df2
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGT9ug1C3fAf8BFRviQOKbWetgwe+lVY4cjYZ2nakfg7m6mtSSywGcFRmqth5wre8OY+ALF8w1Pu+dqB3cfOD/uboHwdiucqQrEcY7n6Evg9Ii1yg3F/KkPoUDv+8oJ7VtrZW9al1lagjIRdbw7tST5AXOP9BS7zC7UYB5YtyI2JI7UCr9bnNZPT1EXWAgfqcvU+CBZ4rMts7MC4CIdFpgcMb0gKQ9nBMpHH88qPoom0RtFe9dFwFFI1apoaTOFxInhkmp0FKPdhGpnBNgu4wZon3kQT9f6AdnmS5aSN83FT0FBLxUgdXLE+9SqQhiSXYr8+vzzKFBxtwgU9O/yt+sz90qmlNooUP9P5lPMfpSZ1dEeL4S55BqcfTXZ02gxF0altW4Z3mpLIzDDBXoVQtFZu+Wm/g5aKTTrF0oUImkM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 04:54:53.9891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4daf03-89ea-4e4b-68db-08d745625667
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvbEac7OETtKJD9fllmHTJ/Fl/DPCKR8vUreA20Jicw=;
 b=fKZfMyduqFWv/HNLuIlfp7fyuTxrhglD+scnYh0Pfvcj2RQBioz39GMqoZUoo2FmuayGrR4aTNz1A+VUDHB7F2UQQEj60NdVOmNSPDZfP1gRIJRagC3phMEgjzHKYLtVUbUw0d3ukQc0mBnrw4JqMWXTGD2sbLgWJZVp99ZWOyI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvbEac7OETtKJD9fllmHTJ/Fl/DPCKR8vUreA20Jicw=;
 b=fKZfMyduqFWv/HNLuIlfp7fyuTxrhglD+scnYh0Pfvcj2RQBioz39GMqoZUoo2FmuayGrR4aTNz1A+VUDHB7F2UQQEj60NdVOmNSPDZfP1gRIJRagC3phMEgjzHKYLtVUbUw0d3ukQc0mBnrw4JqMWXTGD2sbLgWJZVp99ZWOyI=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtX2NvbG9yX2N0bSBTMzEuMzIgc2ln
bi1tYWduaXR1ZGUKdmFsdWUgdG8ga29tZWRhIHJlcXVpcmVkIFEyLjEyIDIncyBjb21wbGVtZW50
CgpTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY29sb3JfbWdtdC5jICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwogLi4uL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jCmluZGV4IGMxODBjZTcwYzI2Yy4uYzkyYzgy
ZWViZGRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5jCkBAIC0xMTcsMyArMTE3LDMwIEBAIHZvaWQgZHJtX2x1dF90
b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAq
Y29lZmZzKQogewogCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsIHNlY3Rvcl90
YmwsIEFSUkFZX1NJWkUoc2VjdG9yX3RibCkpOwogfQorCisvKiBDb252ZXJ0IGZyb20gUzMxLjMy
IHNpZ24tbWFnbml0dWRlIHRvIEhXIFEyLjEyIDIncyBjb21wbGVtZW50ICovCitzdGF0aWMgczMy
IGRybV9jdG1fczMxXzMyX3RvX3EyXzEyKHU2NCBpbnB1dCkKK3sKKwl1NjQgbWFnID0gKGlucHV0
ICYgfkJJVF9VTEwoNjMpKSA+PiAyMDsKKwlib29sIG5lZ2F0aXZlID0gISEoaW5wdXQgJiBCSVRf
VUxMKDYzKSk7CisJdTMyIHZhbDsKKworCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMnMgY29tcGxl
bWVudCBpcyBbLTJebiwgMl5uIC0gMV0gKi8KKwl2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdh
dGl2ZSA/IEJJVCgxNCkgOiBCSVQoMTQpIC0gMSk7CisKKwlyZXR1cm4gbmVnYXRpdmUgPyAwIC0g
dmFsIDogdmFsOworfQorCit2b2lkIGRybV9jdG1fdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqY3RtX2Jsb2IsIHUzMiAqY29lZmZzKQoreworCXN0cnVjdCBkcm1fY29sb3JfY3Rt
ICpjdG07CisJdTMyIGk7CisKKwlpZiAoIWN0bV9ibG9iKQorCQlyZXR1cm47CisKKwljdG0gPSBj
dG1fYmxvYi0+ZGF0YTsKKworCWZvciAoaSA9IDA7IGkgPCBLT01FREFfTl9DVE1fQ09FRkZTOyBp
KyspCisJCWNvZWZmc1tpXSA9IGRybV9jdG1fczMxXzMyX3RvX3EyXzEyKGN0bS0+bWF0cml4W2ld
KTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NvbG9yX21nbXQuaAppbmRleCAwOGFiNjkyODE2NDguLjJmNDY2ODQ2NjExMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdt
dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9y
X21nbXQuaApAQCAtMTgsNiArMTgsNyBAQAogI2RlZmluZSBLT01FREFfTl9DVE1fQ09FRkZTCQk5
CiAKIHZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxv
YiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKTsKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpOwogCiBjb25zdCBzMzIg
KmtvbWVkYV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29s
b3JfcmFuZ2UpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
