Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941908AE28
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5911D6E62A;
	Tue, 13 Aug 2019 04:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579846E62A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:56:14 +0000 (UTC)
Received: from VI1PR08CA0134.eurprd08.prod.outlook.com (2603:10a6:800:d5::12)
 by DB6PR0801MB1847.eurprd08.prod.outlook.com (2603:10a6:4:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.21; Tue, 13 Aug
 2019 04:56:10 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0134.outlook.office365.com
 (2603:10a6:800:d5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Tue, 13 Aug 2019 04:56:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 04:56:08 +0000
Received: ("Tessian outbound 220137ab7b0b:v26");
 Tue, 13 Aug 2019 04:56:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a53dbed5f9ca5ff
X-CR-MTA-TID: 64aa7808
Received: from 032befcf3b01.2 (cr-mta-lb-1.cr-mta-net [104.47.2.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23EAD7A8-D7CB-48CE-B2E2-F8833D4456C3.1; 
 Tue, 13 Aug 2019 04:55:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 032befcf3b01.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 13 Aug 2019 04:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR7grlPu2KTqaA3qjgt/pZgds1RmFR1O1GZybKZuETt4WmOqpkBHYBHyot3cNl56uSE7FtIRHk/+EK1WgyfEnrWUcQ66U0ip8Udb72fhoh0H9f8r+CWUP8iZJvTTBIGNxv1nmCHeYeoRMOfHAMYW5YrqWu73SlhALsP0ppD8CLT7jLAtS/yc/TRUshOWDv83vxzSDVZi2myJq/D/4qk/1FlcYaXjP8zXfEQdIQewI+frGn0aOVFd9TIuXfJ2/+wg+dUuGqTgKACbWdxUlHBX4+83Ua25ZApVzO+bttxYEgqbnEopM6VmRBylVINWPMs1RxyGUNYwcEw/YETvcGDEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq3aalZnurXi5SJDyY6FLUSB8PWic1GXGYoqGxQPtVQ=;
 b=Oo+LFETCj2ONnMznRMWw4L8AZcmXTZbOvMMsnGCquobTaY26iNS9AwLfB3XgLBNSS66i6LzXzoh99IlYCXfHkcwgtPJTVl5W0S48FCUGfl6+KMK34JGrdSMhMK4uANI07RpANcxK18fuqODSlo2xo41g+OobUvyNxMZ2NYKBNxE+FxxCX9+X6brnsIkTcX7TEWfLLC0JlUjLHIDC4nWcZbpMmJMBTh/fzN7AN4fchCdklP62sni1QDXbfEpj+seqK8fZYQMcjLH4L23It6bxOfIJ+rVQhSMDUHnd2+YZs7AlWlUtMOzHTFjkzc245aaLJ/TzpEeyBHP0ABN7BMpcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 04:55:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 04:55:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 0/4] drm/komeda: Enable layer/plane color mgmt
Thread-Topic: [PATCH v2 0/4] drm/komeda: Enable layer/plane color mgmt
Thread-Index: AQHVUZNk2pA6XccCe02wqaw3fxQuDQ==
Date: Tue, 13 Aug 2019 04:55:55 +0000
Message-ID: <20190813045536.28239-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7910816a-58ba-4d73-fbc0-08d71faa8e43
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|DB6PR0801MB1847:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1847DCA1B219E0434E502948B3D20@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(50226002)(5660300002)(2201001)(110136005)(26005)(316002)(66066001)(6116002)(3846002)(305945005)(2906002)(7736002)(103116003)(71190400001)(71200400001)(8676002)(1076003)(54906003)(55236004)(66946007)(478600001)(81156014)(14454004)(386003)(6506007)(4326008)(36756003)(52116002)(2616005)(102836004)(25786009)(256004)(81166006)(186003)(6486002)(64756008)(66556008)(66476007)(99286004)(2501003)(6512007)(6436002)(86362001)(66446008)(8936002)(486006)(476003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: lSy4l6VBTwUM7ZIwdYdd+1shqrEq1OyurCrthzb/e64ds4jaCsOjdENOzarZAZcMRHaybAidgcdadNqG0xkOBU3om1P+c6oIdWFzmvoEd5PPfba8sE81q4+lcMq7YglkXHcLI97mvYO1V4AHOKm2w4TJbVoaVzev3qHKk1/p8KAv/HT8WaiqnmlzZRw03fyOtdJEb4+31G5QpA7zzJxeQQXcVd41EGXFRMcKUVlGqyxkYklZRcQQQfK3SK6pfBfEKR8euZVZFcPURSnRnC6zkfCXmw9ZiazK2jRiYBrW/fPwhEoJn52ZyvZa+fWX6zicTBZAMuhXKc+B10mzMpn2UBR+2aL6uGPJ0pP43CyY4WUCspRfwcQOM1pIsKAI7+Vrn8b/Oy56PdSRHjE0iH9E5rLfoEpyZnFRgWPTZNrOQeg=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(189003)(199004)(126002)(63350400001)(2616005)(63370400001)(336012)(186003)(305945005)(14454004)(102836004)(26005)(7736002)(5660300002)(6506007)(70206006)(23756003)(70586007)(386003)(486006)(4326008)(36906005)(36756003)(476003)(316002)(76130400001)(2906002)(110136005)(81156014)(81166006)(99286004)(8676002)(103116003)(22756006)(54906003)(1076003)(66066001)(25786009)(26826003)(356004)(47776003)(50226002)(3846002)(2501003)(6486002)(8936002)(478600001)(8746002)(6116002)(50466002)(6512007)(2201001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: add636b4-a6b0-4566-ec32-08d71faa864c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1847; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: sOWmnrBOyt2wk1Cvtfgt9u0b/TvrBM30gSqWWVX/egkfuDKZsevq8QcJiItvyXQW1T7xXhoA6ikKUDEV5Arg3Gn659Q4Yk/RWRpqsgmAT1FazJqiSu/HmzrbeB+lhni1t9lcME4PSbxAv/Umc/BU46diGuBoJjBliw3vdsF/c5xl6nT+K+UtcKUjljTeZLLwKCs5NJL2ACQbOeuTP4XAnGGLiEF9okMkQ8CbjeTJDG5vqc062XfxdMtmH1QoF/bk0V8olOvbXIMi4RnclWPNS+OYaXr7IdV04s0bL/nZ2t73+/nQ2zmR0pPikd1Q0Hbd1Eu+CSUohmgkpNvhrTI/oNgEcY595ufn7hu2+q98aDVo9Q9HwNq3B67mFKNtqpE13kt04Xc3T0xJjx/Z3R7LgdkHX4iv/mlkDH4xcpNLcjY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 04:56:08.6614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7910816a-58ba-4d73-fbc0-08d71faa8e43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq3aalZnurXi5SJDyY6FLUSB8PWic1GXGYoqGxQPtVQ=;
 b=XZfxW7Ito1RfXmnB+/2cdPzi8Qgfj8Ts7NwMGbSXP8jz/e2kfRdn4NewComCgTQA+cijb2WRkHjGH4ZoRcFwNJmCaMHZkk4k57I/BxL5w7V0ncWlte5rUQlXNGrCHHCEbrwYs5jQcbZ+pBUoLa3/2K2n65xnVWmiyQxZQ57Kk1M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq3aalZnurXi5SJDyY6FLUSB8PWic1GXGYoqGxQPtVQ=;
 b=XZfxW7Ito1RfXmnB+/2cdPzi8Qgfj8Ts7NwMGbSXP8jz/e2kfRdn4NewComCgTQA+cijb2WRkHjGH4ZoRcFwNJmCaMHZkk4k57I/BxL5w7V0ncWlte5rUQlXNGrCHHCEbrwYs5jQcbZ+pBUoLa3/2K2n65xnVWmiyQxZQ57Kk1M=
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

VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlZCBsYXllci9wbGFuZSBjb2xvciBtYW5hZ2VtZW50IGZv
ciBrb21lZGEgZHJpdmVyCgp2MjogUmViYXNlIGl0IG9uIGRybS1taXNjLW5leHQKCmphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICg0KToKICBkcm0va29tZWRhOiBJbnRyb2R1
Y2Uga29tZWRhX2NvZWZmc190YWJsZS9tYW5hZ2VyCiAgZHJtL2tvbWVkYTogSW50cm9kdWNlIGtv
bWVkYV9jb2xvcl9tYW5hZ2VyL3N0YXRlCiAgZHJtOiBJbmNyZWFzZSBEUk1fT0JKRUNUX01BWF9Q
Uk9QRVJUWSB0byAzMgogIGRybS9rb21lZGE6IEVuYWJsZSBMYXllciBjb2xvciBtYW5hZ2VtZW50
IGZvciBrb21lZGEKCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxl
ICAgfCAgIDEgKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAg
IHwgIDY0ICsrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
ZGV2LmMgIHwgICA1ICstCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9k
ZXYuaCAgfCAgIDIgKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvZWZmcy5j
ICAgIHwgMTE5ICsrKysrKysrKysrKysrKysrCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29lZmZzLmggICAgfCAgNzQgKysrKysrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKwogLi4uL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAgIHwgIDMyICsrKystCiAuLi4v
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgIDQgKy0KIC4uLi9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA1MyArKysrKysrLQog
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgIDEyICsrCiAu
Li4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wcml2YXRlX29iai5jICAgfCAgIDQgKwogaW5j
bHVkZS9kcm0vZHJtX21vZGVfb2JqZWN0LmggICAgICAgICAgICAgICAgIHwgICAyICstCiAxMyBm
aWxlcyBjaGFuZ2VkLCA0OTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2Vm
ZnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvZWZmcy5oCgotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
