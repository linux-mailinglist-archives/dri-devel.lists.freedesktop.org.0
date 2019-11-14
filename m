Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96FFC1AC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E2F6E43F;
	Thu, 14 Nov 2019 08:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30071.outbound.protection.outlook.com [40.107.3.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D04A6E43F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:37:56 +0000 (UTC)
Received: from VI1PR0802CA0016.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::26) by VI1PR08MB3230.eurprd08.prod.outlook.com
 (2603:10a6:803:3e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Thu, 14 Nov
 2019 08:37:54 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR0802CA0016.outlook.office365.com
 (2603:10a6:800:aa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Thu, 14 Nov 2019 08:37:54 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:37:53 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Thu, 14 Nov 2019 08:37:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1345366ad8226f6
X-CR-MTA-TID: 64aa7808
Received: from dd3debd63a60.1 (cr-mta-lb-1.cr-mta-net [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93E11345-17E2-48F0-A2AB-35C6EB4C1C3A.1; 
 Thu, 14 Nov 2019 08:37:46 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd3debd63a60.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaTbobBjPYl1M+1N7VGauGIwbJptptuWTx3iMmqLpd7vgaWNnVKGnJcdeHMuATr08VJ0uqGtyvd+Wy2G0wA6bnpmj7sVbIwxDyd/e8ThFnrpShKraxW2X4Riq3G7JITSWZOMyWadEKQrHlpwmsAQuC64vvoNMUDbds9ytzUUKYOV5ROenLSFV8Fsrv1bDrwDB1XRRd2lx8WFyyndagcgtDtEPMKpsQ853S4XIBpdFnAnFZtjZlNX8tXbsw/SEB2R+HdfwTQk7Cw2Ti406SoYmitvQBhnAgUItXnW0NTixGsd+4T90zHux04C7rZA5X775xA5OyZ/B3ykfTsmR/skEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+a5Psi7mCFZ/4vt4yM7Jk/O+MZAzQ5WNcQIh0wvKA=;
 b=gUShl2LaT2/iO9ZcfUllMbZWle+L8hXF2ArMb0NhVw1vHhL+G4RuXVPU7PCSsoLUlpMD+2BgC9PzvG0SB2EVvGqxYd83haw4EQ8tirWF9B+DNVMOX7z3tgp/AbTv9IbeB4TEzxNNcOf5JOda+pZPY4d5dTn/pis1F9+UKzgZ4JAlV1+dMnkd5+vdJsTlYp+JImUBs95csdqizvM/CtezgzwiN2kDAzCl3Lb9zWtne/3ofKUwkBfCrz7K7tDMh2ho8BDUHr7f+TEiR0Jv7E4XjJXviguo8kX1W78OeB3Y8CRpFuoJ7WHWrKSYHe40ED4T42h0shj4TdTmGreu9Nj6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4768.eurprd08.prod.outlook.com (10.255.114.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Thu, 14 Nov 2019 08:37:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 08:37:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 4/6] drm/komeda: Add side by side support for writeback
Thread-Topic: [PATCH v3 4/6] drm/komeda: Add side by side support for writeback
Thread-Index: AQHVmsbJAUP90/z/aUK+AT3UlbeKyQ==
Date: Thu, 14 Nov 2019 08:37:45 +0000
Message-ID: <20191114083658.27237-5-james.qian.wang@arm.com>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
In-Reply-To: <20191114083658.27237-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d3f7a1e-2959-4214-6ce2-08d768ddf11a
X-MS-TrafficTypeDiagnostic: VE1PR08MB4768:|VE1PR08MB4768:|VI1PR08MB3230:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB323075285C59832CC7B7FA29B3710@VI1PR08MB3230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:785;OLM:785;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(189003)(199004)(71200400001)(71190400001)(36756003)(305945005)(2906002)(7736002)(110136005)(54906003)(6116002)(316002)(3846002)(99286004)(103116003)(446003)(11346002)(6486002)(8936002)(2616005)(476003)(6436002)(66476007)(66556008)(64756008)(66446008)(66946007)(478600001)(6512007)(50226002)(66066001)(486006)(14454004)(2501003)(5660300002)(76176011)(52116002)(256004)(14444005)(386003)(55236004)(25786009)(6636002)(102836004)(6506007)(8676002)(4326008)(26005)(81156014)(81166006)(1076003)(186003)(2201001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4768;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oOY6FzM6hdZTUvcgfTojVJ5vEBWcT5yHj5U2wl/PvpK4XcPepIw40kZOZGqjuvmrwxCvPYo3c+UGBq1ui/VwcYhB7zaftNXQmG89+muH8AW7UrxP/5/r8ym88s+Zt6GyvUMhx94nJGoGGu7OgIW7CeokSAvYrHe7wHio0FKtGPU9wa6XBUjavhYg98s/aiSglYIFbZwbDtiWz8868fJUdBrrZ0FwgMqRj2qpP1TnimRscoEBDIR2ogvxD9R7k9Ld72UH0sRTK3Qw49Kf5sRnUqcuNhF65Y+Iy61WpKRvfBSVmQO+2fLtn1U9ruIb3k/KuOeUVgkb0aCKl/lf37MTnG9DtlLxaVFNP0qoClHZu4yn9/xR+IMr9Vk07TOgE4fI4/O/ACYir65tB29Z4qrST0/yKMDUCPy6Zbs/1nr9ROvZBKhTbgw58t7RL/HLf/EG
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(1110001)(339900001)(189003)(199004)(76176011)(186003)(2201001)(26005)(36906005)(6636002)(2906002)(486006)(66066001)(14454004)(70586007)(6506007)(102836004)(14444005)(105606002)(36756003)(70206006)(5660300002)(6486002)(86362001)(76130400001)(26826003)(1076003)(386003)(478600001)(476003)(81156014)(81166006)(2501003)(25786009)(8746002)(336012)(8936002)(305945005)(446003)(7736002)(50226002)(11346002)(99286004)(23756003)(103116003)(4326008)(22756006)(6512007)(54906003)(126002)(110136005)(2616005)(47776003)(316002)(3846002)(6116002)(356004)(8676002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3230;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 15078e7f-8e87-402d-ae93-08d768ddebc0
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyDogK6fjRLx6kHBBT5d3EZN7+vl6L6xqTKI70x/UwqR//HlrS2cEmrBRl7t5H+YXVhn+wk/AfQ3dOvzDVUxzNz9+SK7QMnCLxUDDT14YMfcimuPvUAht7lc+8GPb2qgXWU91uNAB/on7WofOHY9uT6CWIDsMBdwF3cnXBZA3erpXrOuMxmuT9HemiKy6xDa1iFavcV3nfvKtMfzW7Kj58UdIWhLo9TwvxHJm1rqPMPuKKIDKTB4QV0hRl6Jf7GKE43p7I+NQ6CtARZrvMrrz3p+YXeSGYJA4KF2T7g+p46A/XacbeRrSEsudgIFEQVVGWgG55TFuQZwOP0oP63IUxfBPdz8F7Q1Ofdr/MQdxiymLSGSD8FdWfXHET/JOvLkGxxD/p3BhKdwBmd0iH21esB9YJ/mkgLlO1HHMZ9Crs3riJ6wgBlHuQGJ9wORxDWb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:37:53.7205 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3f7a1e-2959-4214-6ce2-08d768ddf11a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3230
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+a5Psi7mCFZ/4vt4yM7Jk/O+MZAzQ5WNcQIh0wvKA=;
 b=jlJb+NgWuAA+RGJY/eCb4GbyucGJT/0JIWHx+zdskEESUOmZd3rY+wJA4J/IrNuKIwUjC0anfAzrWQ0TMks5s7mahSyII+ma5zdb0nFtXN6ezZoXAl7skQ0Y6iu6x+q25UI+imthZ8oO2EnPPhfMwrUwQ+MSUKTOY1wkRL0ajXo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+a5Psi7mCFZ/4vt4yM7Jk/O+MZAzQ5WNcQIh0wvKA=;
 b=jlJb+NgWuAA+RGJY/eCb4GbyucGJT/0JIWHx+zdskEESUOmZd3rY+wJA4J/IrNuKIwUjC0anfAzrWQ0TMks5s7mahSyII+ma5zdb0nFtXN6ezZoXAl7skQ0Y6iu6x+q25UI+imthZ8oO2EnPPhfMwrUwQ+MSUKTOY1wkRL0ajXo=
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
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gc2lkZSBieSBzaWRlIG1vZGUsIHRoZSBtYXN0ZXIgcGlwZWxpbmUgd3JpdGViYWNrIHRoZSBs
ZWZ0IGZyYW1lIGFuZCB0aGUKc2xhdmUgd3JpdGViYWNrIHRoZSByaWdodCBwYXJ0LCB0aGUgZGF0
YSBmbG93IGFzIGJlbG93OgoKICBzbGF2ZS5jb21waXogLT4gc2xhdmUud2JfbGF5ZXIgLT4gZmIg
KHJpZ2h0LXBhcnQpCiAgbWFzdGVyLmNvbXBpeiAtPiBtYXN0ZXIud2JfbGF5ZXIgLT4gZmIgKGxl
ZnQtcGFydCkKClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgNCArKwogLi4uL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogLi4uL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDYgKystCiAzIGZpbGVz
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCA1
OWE4MWI0NDc2ZGYuLjc2NjIxYTk3MjgwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC01NjQsNiArNTY0LDEwIEBA
IGludCBrb21lZGFfYnVpbGRfd2Jfc3BsaXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIg
KndiX2xheWVyLAogCQkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdCwK
IAkJCQkgICAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCwKIAkJCQkgICAgc3Ry
dWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdyk7CitpbnQga29tZWRhX2J1aWxkX3diX3Ni
c19kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YywKKwkJCQkgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0LAorCQkJCSAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRl
ICprY3J0Y19zdCwKKwkJCQkgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqd2JfZGZsb3cp
OwogCiBpbnQga29tZWRhX2J1aWxkX2Rpc3BsYXlfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfY3J0
YyAqa2NydGMsCiAJCQkJICAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCk7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwppbmRleCA0ZGJmNzE0NTVkMWQuLmFiNGQ5YWQ3OTA4MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jCkBAIC0xMzc3LDYgKzEzNzcsNDggQEAgaW50IGtvbWVkYV9idWlsZF93
Yl9zcGxpdF9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9sYXllciAqd2JfbGF5ZXIsCiAJcmV0dXJu
IGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZSh3Yl9sYXllciwgY29ubl9zdCwgZGZsb3cpOwogfQog
CisvKiB3cml0ZWJhY2sgc2lkZSBieSBzaWRlIHNwbGl0IGRhdGEgcGF0aDoKKyAqCisgKiBzbGF2
ZS5jb21waXogLT4gc2xhdmUud2JfbGF5ZXIgLSA+IGZiIChyaWdodC1wYXJ0KQorICogbWFzdGVy
LmNvbXBpeiAtPiBtYXN0ZXIud2JfbGF5ZXIgLT4gZmIgKGxlZnQtcGFydCkKKyAqLworaW50IGtv
bWVkYV9idWlsZF93Yl9zYnNfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMsCisJ
CQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdCwKKwkJCQkgIHN0cnVjdCBr
b21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QsCisJCQkJICBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxv
d19jZmcgKndiX2RmbG93KQoreworCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlciA9IGtj
cnRjLT5tYXN0ZXI7CisJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqc2xhdmUgPSBrY3J0Yy0+c2xh
dmU7CisJc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnIG1fZGZsb3csIHNfZGZsb3c7CisJaW50
IGVycjsKKworCWlmICh3Yl9kZmxvdy0+ZW5fc2NhbGluZyB8fCB3Yl9kZmxvdy0+ZW5faW1nX2Vu
aGFuY2VtZW50KSB7CisJCURSTV9ERUJVR19BVE9NSUMoInNicyBkb2Vzbid0IHN1cHBvcnQgV0Jf
c2NhbGluZ1xuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCW1lbWNweSgmbV9kZmxvdywg
d2JfZGZsb3csIHNpemVvZigqd2JfZGZsb3cpKTsKKwltZW1jcHkoJnNfZGZsb3csIHdiX2RmbG93
LCBzaXplb2YoKndiX2RmbG93KSk7CisKKwkvKiBtYXN0ZXIgd3JpdGVvdXQgdGhlIGxlZnQgcGFy
dCAqLworCW1fZGZsb3cuaW5fdyA+Pj0gMTsKKwltX2RmbG93Lm91dF93ID4+PSAxOworCW1fZGZs
b3cuaW5wdXQuY29tcG9uZW50ID0gJm1hc3Rlci0+Y29tcGl6LT5iYXNlOworCisJLyogc2xhdmUg
d3JpdGVvdXQgdGhlIHJpZ2h0IHBhcnQgKi8KKwlzX2RmbG93LmluX3cgPj49IDE7CisJc19kZmxv
dy5vdXRfdyA+Pj0gMTsKKwlzX2RmbG93LmluX3ggKz0gbV9kZmxvdy5pbl93OworCXNfZGZsb3cu
b3V0X3ggKz0gbV9kZmxvdy5vdXRfdzsKKwlzX2RmbG93LmlucHV0LmNvbXBvbmVudCA9ICZzbGF2
ZS0+Y29tcGl6LT5iYXNlOworCisJZXJyID0ga29tZWRhX3diX2xheWVyX3ZhbGlkYXRlKG1hc3Rl
ci0+d2JfbGF5ZXIsIGNvbm5fc3QsICZtX2RmbG93KTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJy
OworCisJcmV0dXJuIGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZShzbGF2ZS0+d2JfbGF5ZXIsIGNv
bm5fc3QsICZzX2RmbG93KTsKK30KKwogLyogYnVpbGQgZGlzcGxheSBvdXRwdXQgZGF0YSBmbG93
LCB0aGUgZGF0YSBwYXRoIGlzOgogICogY29tcGl6IC0+IGltcHJvYyAtPiB0aW1pbmdfY3RybHIK
ICAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCAxN2VhMDIxNDg4YWEuLjQ0ZTYyODc0NzY1NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKQEAgLTM3LDYgKzM3LDcgQEAga29tZWRhX3diX2VuY29kZXJfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAkJCSAgICAgICBzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKmNydGNfc3QsCiAJCQkgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3Rh
dGUgKmNvbm5fc3QpCiB7CisJc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YyA9IHRvX2tjcnRjKGNy
dGNfc3QtPmNydGMpOwogCXN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QgPSB0b19r
Y3J0Y19zdChjcnRjX3N0KTsKIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKndyaXRlYmFja19q
b2IgPSBjb25uX3N0LT53cml0ZWJhY2tfam9iOwogCXN0cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xh
eWVyOwpAQCAtNjUsNyArNjYsMTAgQEAga29tZWRhX3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0J
aWYgKGRmbG93LmVuX3NwbGl0KQorCWlmIChrY3J0Yy0+c2lkZV9ieV9zaWRlKQorCQllcnIgPSBr
b21lZGFfYnVpbGRfd2Jfc2JzX2RhdGFfZmxvdyhrY3J0YywKKwkJCQljb25uX3N0LCBrY3J0Y19z
dCwgJmRmbG93KTsKKwllbHNlIGlmIChkZmxvdy5lbl9zcGxpdCkKIAkJZXJyID0ga29tZWRhX2J1
aWxkX3diX3NwbGl0X2RhdGFfZmxvdyh3Yl9sYXllciwKIAkJCQljb25uX3N0LCBrY3J0Y19zdCwg
JmRmbG93KTsKIAllbHNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
