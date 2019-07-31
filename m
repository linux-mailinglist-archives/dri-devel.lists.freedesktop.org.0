Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC857BECF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 13:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771BF89A0F;
	Wed, 31 Jul 2019 11:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00041.outbound.protection.outlook.com [40.107.0.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75189A0F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 11:04:55 +0000 (UTC)
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 11:04:51 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Wed, 31 Jul 2019 11:04:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:04:49 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Wed, 31 Jul 2019 11:04:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9813a73c8c05fd17
X-CR-MTA-TID: 64aa7808
Received: from 1952a4c4541f.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EA3A515-25E7-4990-AF13-FC4F6E15AB07.1; 
 Wed, 31 Jul 2019 11:04:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1952a4c4541f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Jul 2019 11:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBXMYppGLsEC3wRlnaA8ubca+Glr/RMSNdaBNam1tBbVOxko/efRF6PBzDBpudBZJKuxIq2x+gdZJEPVcQx8cST2D3b0VoWpNf+QPN+DgPaZcKZHyRvyJZ/GcAupBQkp0yaTzDsTGF8rU3GptpojWesI+exTQxENtGzaNXQ0KnOk/5mNmaQBWc5rGApYKKapMs4FeKrIXJqe67mhKDPvt5SNemCb4N/ipWYYhO9+xTRI+aN1CHi6Ytot00sYoFWbJMsi3u3Z2MyZasl4uuB5hml71s1E+jrOVYLVkAVLxGC8SzzDDvOMRNjLQlYENfDEPlMO6NzhzaHHIFMslCgpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=BeQbBj/wAwLa6085sQlDd81sPzlv3Gq54Yv/fY7XnqLIIgmNfob1aE6m0yVRpex4LvYJTATcIu1FE24nOi7qi14xm0gt1dGxaBvm65EoTsYGnm6PA1jk5CPpJoG+BNEcvnNpdWnpVjMoS3FYxQLjovypChz1rK39FWJWqQTYncXTQ2YrEfIAhJOaNR0VNRJnkIMomsBuCLjXKRgx+j79tF2KgJp3AVtQAsqC1yccAXp12HxDRncLoBqK3H/br+LB7C95m3hXrdRIpwGIRgx0kf6RedXJL/KFL0ejeIQ39XbCeZgym542Yj5Jgx0NYWNbyLYoi8TDyGyxYO3Ptjdtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3405.eurprd08.prod.outlook.com (20.177.58.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 31 Jul 2019 11:04:32 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:31 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Brian Starkey <Brian.Starkey@arm.com>
Subject: [PATCH v1 0/2] Free the writeback_job when it with an empty fb
Thread-Topic: [PATCH v1 0/2] Free the writeback_job when it with an empty fb
Thread-Index: AQHVR4+6JELUa+Im3kWvDFA/sbxmXA==
Date: Wed, 31 Jul 2019 11:04:30 +0000
Message-ID: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 192dac53-fc50-4c7e-abfb-08d715a6e7eb
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3405; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3405:|AM0PR08MB4946:
X-Microsoft-Antispam-PRVS: <AM0PR08MB49467995248FD5617E136C589FDF0@AM0PR08MB4946.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(476003)(5660300002)(2616005)(6116002)(99286004)(6436002)(81166006)(68736007)(86362001)(4326008)(50226002)(3846002)(81156014)(26005)(8676002)(52116002)(256004)(8936002)(305945005)(7416002)(7736002)(4744005)(6486002)(66476007)(6512007)(71190400001)(66946007)(54906003)(2501003)(66066001)(386003)(71200400001)(6506007)(486006)(102836004)(316002)(110136005)(25786009)(2201001)(2906002)(55236004)(6636002)(64756008)(53936002)(478600001)(36756003)(186003)(66556008)(66446008)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3405;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 7vMiZ1bBdI+EIYlm6xc3REPKy0dA//uWXYpAEVu8OsckJArgXgIY3XcOFPEjv0wnxF473j31gVwjNRVJOWMHvrwwA/YJOEkuQozQdcAy1Cq2Rk+JGdlS450nFjk6fAr2Uwu7a9aC5Zr0ty67s+zF8ahG87dCnVEGyh5b/R7kmB6/xuo/F8Dp3n2wHPonlBpZ2ybkOb7UQ49oxLumd5ukwHqXyv73fGAe9nCfKUN+AxKP1Y9LA8XDZO8D0K1AkUzhyDQpextEseCSd/bN8hHinNlM2bc9nDeZrE2tuw2fOCuQN7m/5fJmyP5tK69ts9G8GDid8JlvZo2VrSb2KxcReIGFwN+yjefQDN1C4zd07C5WaGP+rTzpxSdAxkAmfX4LmThR7AwXKQpCSTT9L9sJij8cug3K4LGTsT39JPhZzzs=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3405
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(189003)(199004)(5660300002)(3846002)(6116002)(305945005)(478600001)(2616005)(23756003)(6506007)(50466002)(2501003)(126002)(476003)(22756006)(76130400001)(336012)(186003)(356004)(86362001)(6486002)(4744005)(386003)(63350400001)(63370400001)(486006)(70206006)(70586007)(26826003)(110136005)(54906003)(102836004)(8676002)(81156014)(81166006)(2201001)(14454004)(50226002)(2906002)(36756003)(25786009)(8746002)(8936002)(316002)(7736002)(26005)(47776003)(4326008)(6512007)(99286004)(6636002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4946;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2d94ce51-6bd6-40f6-b62b-08d715a6dc7f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR08MB4946; 
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: QjpzfhXWEYf9l7NxdLHS2czwSe4uhLla0+E/I5HukjoEE8LmFzn7377gh4P2JLLO26chOkAqObaLxTfFGMBrRCB8B24fquVT51rC1OoQchvfOnbWhv/XUm75Z14jZdjY1dcLL4jFv1s3tE+oEkWI1v1bsWnhUQ+wQe+Uh1sv10CQ2E9So1esGP7uZdC88FhqPDnw07gUAcg3KiLYRItqHnQGbG9gXIqka0uvDTQ7rbkjRTXLdX+8X0hP5CNeNyyqk2j5tPgZZUXCu/H6XYCMwlTp9oU/iwdi1i68e5Q+y1VfthRddaD6vdhpypKcMp2M17rPrRZvHA2WlW88+RiJqoVmSLs/n9f77puFGxPHKQaWPnO/3/qj6Cjqbz1uDGP3tJF4Fdz569atF27cBstUd8rS3XwQMtQGhQhWp8Bqm08=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:04:49.5390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192dac53-fc50-4c7e-abfb-08d715a6e7eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4946
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=RjaCkRkeKWh/8MoIGXiFFbd7u9HAJqN58hIHEyE477CjmIhVLZ4tkTorNwTXCVfwXaGNzK+Fxi363gNcviJQZlf0+mtM8ljUP0WTUcQqeL3565ZLnqs4dqPWnD16v4RGM8CzOQ9gxscGYfgyWUzXna/iv1wF7Em4iyKoDTC3XF8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fRKO5B+iXys2I/dDjPX0hvKxMcB9c/OLV5KJdllFGw=;
 b=RjaCkRkeKWh/8MoIGXiFFbd7u9HAJqN58hIHEyE477CjmIhVLZ4tkTorNwTXCVfwXaGNzK+Fxi363gNcviJQZlf0+mtM8ljUP0WTUcQqeL3565ZLnqs4dqPWnD16v4RGM8CzOQ9gxscGYfgyWUzXna/iv1wF7Em4iyKoDTC3XF8=
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHNlcmllIGFpbXMgYXQgYWRkaW5nIHRoZSBjaGVjayBhbmQgZnJlZSB0aGUgd3Jp
dGViYWNrX2pvYiB3aGVuIGl0CndpdGggYW4gZW1wdHkgZmIgaW4gZHJtX2F0b21pY19jb25uZWN0
b3JfY2hlY2soKS4KCkFsc28gZGlkIHNvbWUgcmVmaW5lIGluIGRybV93cml0ZWJhY2tfc2lnbmFs
X2NvbXBsZXRpb24oKSB0byBjbGVhciB0aGUKZmVuY2UgcG9pbnRlciB3aGVuIHdyaXRlYmFjayBq
b2Igc2lnbmFsZWQuCgpUaGlzIHBhdGNoc2V0IGlzIGJhc2VkIGF0IHRoZSBkcm0tbWlzYy1maXhl
cyBicmFuY2guCgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToKICBkcm06IEZy
ZWUgdGhlIHdyaXRlYmFja19qb2Igd2hlbiBpdCB3aXRoIGFuIGVtcHR5IGZiCiAgZHJtOiBDbGVh
ciB0aGUgZmVuY2UgcG9pbnRlciB3aGVuIHdyaXRlYmFjayBqb2Igc2lnbmFsZWQKCiAuLi4vZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgICB8ICAzICstLQogZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jICAgICAgICAgICAgICAgICAgICAgICB8IDEz
ICsrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyAgICAgICAgICAg
ICAgICAgICAgfCAyMyArKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X3R4cC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKystLS0KIDYgZmlsZXMg
Y2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMS45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
