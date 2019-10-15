Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5AD6D1D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 04:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DAB6E5D9;
	Tue, 15 Oct 2019 02:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40087.outbound.protection.outlook.com [40.107.4.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE30C6E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 02:11:08 +0000 (UTC)
Received: from AM4PR08CA0062.eurprd08.prod.outlook.com (2603:10a6:205:2::33)
 by VI1PR08MB3357.eurprd08.prod.outlook.com (2603:10a6:803:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 02:11:04 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM4PR08CA0062.outlook.office365.com
 (2603:10a6:205:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 02:11:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 02:11:02 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Tue, 15 Oct 2019 02:10:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb5f4b8550791a4d
X-CR-MTA-TID: 64aa7808
Received: from 30e84cc9cbdb.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCCEB9F9-2B11-484C-A267-3F11C8DFBDA3.1; 
 Tue, 15 Oct 2019 02:10:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30e84cc9cbdb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 15 Oct 2019 02:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQkKI0McIJUInssDoX1UckINkqsP2pVLVpKsj0PocsoDOh19B0DMaJlKoJfAUahZyL1msoFNP35QcDWstuO65iYztsgFJLSHHu1frVLTT/2Ein65Xtu6Zpq+ub1e0XDKkybmaJGMpXthsTrxbdGGZ1PEuFW+d6CXy5xelA+LI2+xASwG4cPLMjSDiy6OZ7vEkbILh5zHj/MfMN7iM1dvBC1mXZvHXVFIH+L4cFt9wEn7e/Bwjia4IrTgxDoiLw4/RUPafmeMHe3Nxm9Bd75gBn1WBvXPYV0wXNnR2RnDWbSSyvEK7AOu2PzcYBbSvKoMX/TZBjKJ65t0Zk5LdMg/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyUW4Zl2E6lY9bQXwmH72tV+7kAhIQ9vDJpnPnK6F8E=;
 b=k9QDRv50pQoTZICdWlA6HlUZAnd2WYJPMYBDjJ/jC3pHd1JGO0ZnWZYN7hZ/biZV2sfHahe91FOKDXv1yjJu+tkRYROMKOhISbqrAaR7xgaji0gDz+yr0ifLCWapIL8R8B36jl/VTQjqmZ7pYwfCLYW32oiFJDy1/G0xl1+dHk3lhu3a55bQoo8otnHhNUWhT7pgTd4UyIbSVQhIyPBguF+KaeC6ZvFAqe43Q0Y2ArEjnov86sYBEIOjV/Jfrp+MowbZb4dTHQEc1zm1kKjOpH3F7e6cl9jupfQjaNUl09h7ZoNjhU2qsktuf/IeTffOmo6WmL4Q/pcRhrhNhyLm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 02:10:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 02:10:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v4 1/4] drm: Add a new helper drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v4 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVgv3BWlwKETCEA0mEVRVx1dwUKA==
Date: Tue, 15 Oct 2019 02:10:45 +0000
Message-ID: <20191015021016.327-2-james.qian.wang@arm.com>
References: <20191015021016.327-1-james.qian.wang@arm.com>
In-Reply-To: <20191015021016.327-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 361cfa0d-94d7-49c6-1e8e-08d75114eda0
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|VI1PR08MB3357:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3357391244F0E33B320758DCB3930@VI1PR08MB3357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(189003)(199004)(66066001)(476003)(76176011)(110136005)(54906003)(66946007)(64756008)(66476007)(66446008)(71200400001)(66556008)(26005)(103116003)(2201001)(86362001)(6512007)(186003)(71190400001)(316002)(36756003)(6506007)(446003)(11346002)(386003)(2616005)(486006)(2906002)(256004)(52116002)(55236004)(102836004)(2171002)(8936002)(14454004)(478600001)(6486002)(81156014)(81166006)(305945005)(50226002)(2501003)(4326008)(8676002)(7736002)(5660300002)(1076003)(6116002)(3846002)(25786009)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YvWjXFyzqCm+tq74pRLpBY80nNyqUBV0PKWsr1UCGW3qGFHwsOR8k3lv7D2VNFpuWp+mCZGiWzT0kMSlK758jNdbTmfGJMW8D15q7ic4edgbBGv6DwHio2o69yTO4lp18ZOUn/L3cR4//8uMbnZC0zAJqL4IKBS0GxqrCoU5gw/iQhr4kSuqeaFUi2gB3krl8I3PlW9YAWTXas1cle1fASTwJJH+KUnlcVQYWKF3bcBiBfqcJ1pGmIa2p9+Qiw9sQdtzwRVxZryVBjIa9f2sHkeePEVn/Aq015VsG9D6ZKjgGJpKMPDAhppatQLu12bN25E5s4SW9dbHU9iMeQOJn702tj2Ku0CJVR2nwSRRfnOctvRuCRH2LU74nWm148SU4ui3/J43ii/xs+SZDfa3f5grQDkyaI4Gq2Vt9GqGoAw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(2906002)(2501003)(70206006)(356004)(5660300002)(76130400001)(70586007)(103116003)(36756003)(23756003)(36906005)(305945005)(316002)(54906003)(8746002)(81156014)(81166006)(6512007)(8676002)(6486002)(110136005)(7736002)(3846002)(50226002)(8936002)(76176011)(6116002)(99286004)(63350400001)(186003)(26005)(50466002)(386003)(6506007)(26826003)(86362001)(476003)(11346002)(66066001)(2616005)(107886003)(4326008)(336012)(446003)(47776003)(2171002)(126002)(486006)(102836004)(2201001)(25786009)(22756006)(1076003)(478600001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3357;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c26dfc5-12b1-4e5f-ba3a-08d75114e385
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLJmY2hhJJyhLRc8/b6VVEVXxQmiBz/4zkSKN9jBvD4HqUaCBAfrZbPcI4C+C8e22McvLBA7TGRUiSMlT5AcXhusPEou3N2P40Drg0VXTX45XMmcIGCzZ+3Vgsav7ZEKB9syvLltLn+qsksk8OgrBDI8yYb42VoSuEo+auiKdbdOOww8NbqtPRLQ2tGr6tu8xYAV4Agu2kJ0pHHZDlvvZWdjrxzI+NqvCR7QvWxLaU8PM+Jj+PEJ94v+263SUadNIJ6neF2eQ0u9vighz5ZLnOu6v8JpNluzH9uV4BPm7xRux9Wls5R+FDgSs9t0zfEovPGlOeOubMenqU7eQb5xf6fTsbGabIRWlVwRhMGgXKDeS+pJuHK8nndPKaDw7E1x4OhsdZrESR32ODr6wSUKIknfPtmzim9EB1MWKShwiA4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 02:11:02.3373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361cfa0d-94d7-49c6-1e8e-08d75114eda0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3357
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyUW4Zl2E6lY9bQXwmH72tV+7kAhIQ9vDJpnPnK6F8E=;
 b=VvBzXKS3AJbdg3FvOp59ypxot0pIzwlA2HJsF8G8XD5BL0nEbRVLD8wzZt6v8YTYWZ0yxLDS6n/RR19BpEgP0+A6k1Myc8wdV7YpvOu78F/O7dOmvzMTAn/sUpBlRuxkjXVPVwAR1T5XtJ2zVTao7mj/0z2bVih6NYGdk5MwAKU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyUW4Zl2E6lY9bQXwmH72tV+7kAhIQ9vDJpnPnK6F8E=;
 b=VvBzXKS3AJbdg3FvOp59ypxot0pIzwlA2HJsF8G8XD5BL0nEbRVLD8wzZt6v8YTYWZ0yxLDS6n/RR19BpEgP0+A6k1Myc8wdV7YpvOu78F/O7dOmvzMTAn/sUpBlRuxkjXVPVwAR1T5XtJ2zVTao7mj/0z2bVih6NYGdk5MwAKU=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bwpjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBj
b21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5CmhhcmR3YXJlLgoKVjQ6IEFkZHJlc3MgTWloYWks
IERhbmllbCBhbmQgSWxpYSdzIHJldmlldyBjb21tZW50cy4KClNpZ25lZC1vZmYtYnk6IGphbWVz
IHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNv
bT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNv
bT4KUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwogMiBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwpp
bmRleCA0Y2U1YzZkOGRlOTkuLmE2ZDc4YjI0NzcxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb2xvcl9tZ210LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMKQEAgLTEzMiw2ICsxMzIsMzIgQEAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVp
bnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pCiB9CiBFWFBPUlRfU1lN
Qk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7CiAKKy8qKgorICogZHJtX2NvbG9yX2N0bV9zMzFf
MzJfdG9fcW1fbgorICoKKyAqIEB1c2VyX2lucHV0OiBpbnB1dCB2YWx1ZQorICogQG06IG51bWJl
ciBvZiBpbnRlZ2VyIGJpdHMsIGRvZXNuJ3QgaW5jbHVkZSBzaWduLWJpdCwgb25seSBzdXBwb3J0
IG0gPD0gMzEKKyAqIEBuOiBudW1iZXIgb2YgZnJhY3Rpb25hbCBiaXRzLCBvbmx5IHN1cHBvcnQg
biA8PSAzMgorICoKKyAqIENvbnZlcnQgYW5kIGNsYW1wIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0
byBRbS5uIChzaWduZWQgMidzIGNvbXBsZW1lbnQpLiBUaGUKKyAqIGhpZ2hlciBiaXRzIHRoYXQg
YWJvdmUgbSArIG4gKyAxIGFyZSBlcXVhbCBvciBjbGVhcmVkIHRvIHNpZ24tYml0IEJJVChtK24r
MSkuCisgKi8KK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3Qg
dXNlcl9pbnB1dCwKKwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKQoreworCXU2NCBt
YWcgPSAodXNlcl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7CisJYm9vbCBuZWdh
dGl2ZSA9ICEhKHVzZXJfaW5wdXQgJiBCSVRfVUxMKDYzKSk7CisJczY0IHZhbDsKKworCVdBUk5f
T04obSA+IDMxIHx8IG4gPiAzMik7CisKKwkvKiB0aGUgcmFuZ2Ugb2Ygc2lnbmVkIDIncyBjb21w
bGVtZW50IGlzIFstMl5uK20sIDJebittIC0gMV0gKi8KKwl2YWwgPSBjbGFtcF92YWwobWFnLCAw
LCBuZWdhdGl2ZSA/IEJJVF9VTEwobiArIG0pIDogQklUX1VMTChuICsgbSkgLSAxKTsKKworCXJl
dHVybiBuZWdhdGl2ZSA/IC12YWwgOiB2YWw7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9j
dG1fczMxXzMyX3RvX3FtX24pOworCiAvKioKICAqIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210
IC0gZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQgcHJvcGVydGllcwogICogQGNydGM6IERSTSBDUlRD
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2NvbG9yX21nbXQuaAppbmRleCBkMWM2NjJkOTJhYjcuLjYwZmVhNTUwMTg4NiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1f
Y29sb3JfbWdtdC5oCkBAIC0zMCw2ICszMCw4IEBAIHN0cnVjdCBkcm1fY3J0YzsKIHN0cnVjdCBk
cm1fcGxhbmU7CiAKIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2Vy
X2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsKK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1f
czMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwKKwkJCQkgICAgICB1aW50MzJfdCBt
LCB1aW50MzJfdCBuKTsKIAogdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCiAJCQkJdWludCBkZWdhbW1hX2x1dF9zaXplLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
