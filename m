Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FFC1AC8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 06:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2896E338;
	Mon, 30 Sep 2019 04:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A706E338
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:55:08 +0000 (UTC)
Received: from VI1PR08CA0258.eurprd08.prod.outlook.com (2603:10a6:803:dc::31)
 by AM0PR08MB4354.eurprd08.prod.outlook.com (2603:10a6:208:13e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 04:55:04 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by VI1PR08CA0258.outlook.office365.com
 (2603:10a6:803:dc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 04:55:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 04:55:02 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 04:54:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49372420f580918c
X-CR-MTA-TID: 64aa7808
Received: from 1a833b181f9a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E05B2CF-92EB-4741-9304-3812FB11AC36.1; 
 Mon, 30 Sep 2019 04:54:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a833b181f9a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 04:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXXg5Aj4ydTNg8KZOMRJpf9t3WHJIaLbF1ObLa5fDP7ju6V+vMH/woTnbDyZiC8qDY7GvJ06aUEp5A1o+Oc2TMmnfGD1BRula2uf7zr9gJWw6zuUO5JTGZPRBEa73NN73SZ3bFUoJIJf99RAt7iTPKFuR9Yp9rdSut2jYDgaqaYKonyP/zNr7QyE57mRHjmuEK4DPtrRDM+SzaIh5cxPZexHhBv5sB9QM3uFgAz40H8K4f6oad771IRkCmGhp0Nvnu9FqPdDuE9gVDnmorta0zMX76O53C6f7xhiaUo6/+FfZbscpOlckWXEc5XB6fp9MSJaZZsHqKWXU7Kyjbh1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpK8QoVPwkG2dNMzEgnGMuEmaJOfHjkcn0pIVo7kdrg=;
 b=CQEJ9/b7oyiZJ5hpfFRsQi4ViT4bmcAGCgtk/iWa8Tk/k3RjFNY5NaEkt6PUhFA7WoJJvnSHPCQySyvIofPXxOhdamaSvbvoTWARVhv7yQ8PQvLK21bPfMT5yL8+ey5IcJRtThzgnMvxcnaL9tsKnvz6DqrK/BHNjDBPkHx7JW6/Grtupz9tsj7RRlxVd6kKnXEjTOYM4aQCvMQNlEG9gB6n5tuChJcrQCAZOIEvmCmNzIg9LSYUawmqP5tZU9fSvVtwfH1T4/fxw9duFhEZ6n0JTK9KEQJaeU4tJkIVVq65Qec+kd5c7nFylYqAXpqdtRP2TZ6ygferaA+1DKo7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4671.eurprd08.prod.outlook.com (10.255.115.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 04:54:48 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 04:54:48 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 3/3] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH 3/3] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Index: AQHVd0svDPRxDROFCUC/H9BR83IxGw==
Date: Mon, 30 Sep 2019 04:54:47 +0000
Message-ID: <20190930045408.8053-4-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3e4d56d4-7621-4712-4d07-08d745625a8a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4671:|VE1PR08MB4671:|AM0PR08MB4354:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4354B90BAB89B4D2B76E3177B3820@AM0PR08MB4354.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(25786009)(52116002)(55236004)(11346002)(50226002)(486006)(6506007)(8676002)(8936002)(6512007)(99286004)(102836004)(6116002)(6486002)(3846002)(1076003)(2906002)(81166006)(5660300002)(86362001)(2616005)(476003)(446003)(386003)(6436002)(76176011)(81156014)(186003)(54906003)(110136005)(26005)(316002)(14454004)(2201001)(478600001)(66066001)(66446008)(64756008)(66556008)(103116003)(66476007)(66946007)(2501003)(4326008)(36756003)(71200400001)(14444005)(7736002)(71190400001)(305945005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4671;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oqyqqcr56s1qtHTfzZE8GuHOFdkB5o9iP9mUEhbm1ywYUX4XtznzDABwHvy1uDH8KKSJ+oSQKdrAJXnXcVUh1Fma/UxJGLB8XJyFdm7ngtudt2zw2wf84Dw+IywhCsyOC2a2UFOGI9hflpptIiF/pekY4XcEHb7FBJvAb7J3juGPadcjcGXG9rOts8QRTOU9LyeKIDd2U9m3MFNotk6jlU5eyPxc2s0+GtdgqJpiuYUJfIMBxD73vzGcImvywpGMHIkel3VG10VeM4pxYZCCC7zfD5fOnULfdyRoD3nXTSzp+/nqS8GHAdAAU7AnKfRS0u+ksmASecy1jgKmIbqs3QKL3vjc3y3VWo0CQwEcFmunGXT9Yk0eNtXQk5tYdaDtq6jRUNxsiMiN+ZY6QLnFQx/sYqt//jh5u7m6QxJCpTU=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4671
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39850400004)(346002)(396003)(136003)(189003)(199004)(76176011)(2906002)(26005)(70586007)(54906003)(6116002)(386003)(6506007)(70206006)(6512007)(102836004)(66066001)(3846002)(47776003)(76130400001)(99286004)(478600001)(26826003)(6486002)(25786009)(14454004)(316002)(110136005)(186003)(103116003)(50466002)(81156014)(81166006)(4326008)(14444005)(2201001)(8936002)(486006)(126002)(86362001)(63350400001)(50226002)(22756006)(1076003)(305945005)(8746002)(2501003)(5660300002)(7736002)(8676002)(446003)(11346002)(2616005)(356004)(36756003)(336012)(23756003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4354;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cf3335d8-2038-4123-9958-08d7456251bd
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CMWBRLDwfXBWqZ7gtud56gE/mSJHYZELkc+cn/jzV/qhlaHb6uiSm3DpK/K4nOOEMF5/AI8iXX25dUfg/pfDTMQ78hc4TZ6EYZbfI4l+mdRd7wTmLo4vbaNYxmbY/O3mpFKPX7Ynfk41RF/fhHiGUDjjNqpMcmGjBnfAkwclfVBVjGd5/mjMZIjteFhyNmq0DhY3aWe70wIfI3hpWRcBf0sTWyFODbpXOYbJESPPqdlQhf2DbjvRN3NmwBc0/9DxF6x0JuJsW0aW5lKYwNO7jCGjCQuYZ8AcZfWSqxkz5w6845+Pf40M2bHbAE1tXwLM7Ele3vjKucozQOHOTPtYUGUT0OrUDGy0Jmo/GiOlWdGWb2NIK/4tO0lXxfI0iyyfiONI+8Fzjia3cENWcCj4MukxH8jUEiFr3ORipfaUxw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 04:55:02.3848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4d56d4-7621-4712-4d07-08d745625a8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpK8QoVPwkG2dNMzEgnGMuEmaJOfHjkcn0pIVo7kdrg=;
 b=IyLXX6vFn7bz19n3soGni8pfNpBphGEszKMwbKTkhxq3zEPmXnraaED74gGn00yklRUksq0CC6Z1JRvAcBKQ8ZWTDWp3cPAXSEoizoa3GjlfiufKxoSDZvI+2CgGN/B8JB5JwY4boWg3rb81m3jXrKgqVg4DXdyuTUMhVcP2xhk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpK8QoVPwkG2dNMzEgnGMuEmaJOfHjkcn0pIVo7kdrg=;
 b=IyLXX6vFn7bz19n3soGni8pfNpBphGEszKMwbKTkhxq3zEPmXnraaED74gGn00yklRUksq0CC6Z1JRvAcBKQ8ZWTDWp3cPAXSEoizoa3GjlfiufKxoSDZvI+2CgGN/B8JB5JwY4boWg3rb81m3jXrKgqVg4DXdyuTUMhVcP2xhk=
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
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAyICsr
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMyArKysK
IC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA2ICsrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXggYzNk
MjljMGIwNTFiLi5lN2U1YThlNDQzMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTk0MiwxNSArOTQyLDM5
IEBAIHN0YXRpYyBpbnQgZDcxX21lcmdlcl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAkJ
CSAgICAgIHN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpzdGF0ZSkKIHsKKwlzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7CiAJc3RydWN0IGtv
bWVkYV9pbXByb2Nfc3RhdGUgKnN0ID0gdG9faW1wcm9jX3N0KHN0YXRlKTsKKwlzdHJ1Y3QgZDcx
X3BpcGVsaW5lICpwaXBlID0gdG9fZDcxX3BpcGVsaW5lKGMtPnBpcGVsaW5lKTsKIAl1MzIgX19p
b21lbSAqcmVnID0gYy0+cmVnOwogCXUzMiBpbmRleDsKKwl1MzIgbWFzayA9IDAsIGN0cmwgPSAw
OwogCiAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwgaW5kZXgpCiAJCW1hbGlkcF93cml0
ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICogNCwKIAkJCSAgICAgICB0b19kNzFfaW5w
dXRfaWQoc3RhdGUsIGluZGV4KSk7CiAKIAltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBI
Vl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7CisKKwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdt
dF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxfRlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJ
aWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRv
dV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZG
UywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOworCQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsg
LyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAoY3J0Y19zdC0+Y3RtKSB7CisJCQltYWxp
ZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9DT0VGRjAsCisJCQkJCSAgIEtPTUVEQV9O
X0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29lZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NU
UkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQorCX0KKworCWlmIChtYXNrKQorCQltYWxp
ZHBfd3JpdGUzMl9tYXNrKHJlZywgQkxLX0NPTlRST0wsIG1hc2ssIGN0cmwpOwogfQogCiBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsIHN0cnVj
dCBzZXFfZmlsZSAqc2YpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMKaW5kZXggOWNhNWRiZmQwNzIzLi4zM2Y3MzYyZGNjNmUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTU4
OCw2ICs1ODgsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmttcywKIAogCWNydGMtPnBvcnQgPSBrY3J0Yy0+bWFzdGVyLT5vZl9vdXRwdXRfcG9y
dDsKIAorCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIHRydWUsIEtPTUVEQV9D
T0xPUl9MVVRfU0laRSk7CisKIAlyZXR1cm4gZXJyOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCA4NDAxY2Mw
Y2RmZTcuLjIxYTUwZThjZTBiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC0xMSw2ICsxMSw3IEBACiAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4K
ICNpbmNsdWRlICJtYWxpZHBfdXRpbHMuaCIKKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5o
IgogCiAjZGVmaW5lIEtPTUVEQV9NQVhfUElQRUxJTkVTCQkyCiAjZGVmaW5lIEtPTUVEQV9QSVBF
TElORV9NQVhfTEFZRVJTCTQKQEAgLTMyNCw2ICszMjUsOCBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJv
YyB7CiBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7CiAJc3RydWN0IGtvbWVkYV9jb21wb25l
bnRfc3RhdGUgYmFzZTsKIAl1MTYgaHNpemUsIHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tP
TUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMyIGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZG
U107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3Rh
dGUuYwppbmRleCAwYmE5YzZhYTM3MDguLjRhNDBiMzdlYjFhNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jCkBAIC03NTYsNiArNzU2LDEyIEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9pbXByb2MgKmltcHJvYywKIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKIAlzdC0+dnNp
emUgPSBkZmxvdy0+aW5faDsKIAorCWlmIChrY3J0Y19zdC0+YmFzZS5jb2xvcl9tZ210X2NoYW5n
ZWQpIHsKKwkJZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKGtjcnRjX3N0LT5iYXNlLmdhbW1hX2x1
dCwKKwkJCQkJIHN0LT5mZ2FtbWFfY29lZmZzKTsKKwkJZHJtX2N0bV90b19jb2VmZnMoa2NydGNf
c3QtPmJhc2UuY3RtLCBzdC0+Y3RtX2NvZWZmcyk7CisJfQorCiAJa29tZWRhX2NvbXBvbmVudF9h
ZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0LCAwKTsKIAlrb21lZGFfY29tcG9uZW50
X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwgJmltcHJvYy0+YmFzZSwgMCk7CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
