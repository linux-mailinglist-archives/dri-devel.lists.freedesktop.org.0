Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0467BED3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 13:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A214D89CA1;
	Wed, 31 Jul 2019 11:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D8889CA1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 11:05:08 +0000 (UTC)
Received: from AM4PR08CA0071.eurprd08.prod.outlook.com (2603:10a6:205:2::42)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 11:05:04 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by AM4PR08CA0071.outlook.office365.com
 (2603:10a6:205:2::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Wed, 31 Jul 2019 11:05:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:05:02 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Wed, 31 Jul 2019 11:04:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a8608357a0b1067
X-CR-MTA-TID: 64aa7808
Received: from 9c97919290da.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63DA46EF-32F2-486B-ABFD-399FFB8C0405.1; 
 Wed, 31 Jul 2019 11:04:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c97919290da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 31 Jul 2019 11:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly9bw8+PoyxEMVCZideNgyBWMsNV0d7jDXx7wDYJkbwZ64bfoTavp63Jbi2hwZ/fagof2oCxBApO+DtyTM7Cvoy5hGo2JhG4rFXsAZMJ978pWYVq2Rw/bZ0Psk7cf1Wf8jpTqAFymEtoNSaE7ptrYnxnxSYkzLW7yrKZXdBNHIHA4r3w6L4gfkmlhx52guPNDOVnGk9dnqZlNVD1LVnACmAPcQvD9/uH5dF8yaRCUZL1Fl/zYsYy7Gda06VLWdFJmhkcTCTDlwR7cRYa1vw2bUx/8Q4LZMr9wCB5wz1PdDeK/QuN0sDbQYFRX+YhNp48xwtt4XsUtLBvtznoqB0jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=KE10ntXsIELeWem4U5mPYUKK/io3cEt7AAgMwc2un6/99Yx5VnQKRWZ5aYzJBXTT7z+67ndVEGuyU8o25fndPCMxomDEdsqP+McNoRMg6cKFK26esMWUhNDR5DRtmxm/TqPs7BVok4SPHUz8xN2FeYdZLtowfHlvLzQfpNR4lytWh3G9xVgzCPVBnMkjIsMp1Jd30fkXUYNlBlHFRMlXyN5dDBc/Fgiigj8b/2UiA3gH1HCky0WrWnm0rtO3MwNDHhhdGNacDkwSl6vrb9jzO73MlBt/UJKr0WiCykQKKe+VBhtpa5E3ENWCeQH9e0a+Ghbw8KaNQILOg/aAFXe/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3277.eurprd08.prod.outlook.com (52.134.30.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 11:04:45 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:45 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Brian Starkey <Brian.Starkey@arm.com>
Subject: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/CyrPm3jrEukClo/Nxj8QL5w==
Date: Wed, 31 Jul 2019 11:04:45 +0000
Message-ID: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21477bb5-9cc2-44dc-2a23-08d715a6efd0
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3277; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3277:|AM5PR0801MB1843:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18431DE9182D70A449A91AD29FDF0@AM5PR0801MB1843.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(199004)(7736002)(305945005)(50226002)(64756008)(66946007)(66476007)(66556008)(66446008)(8676002)(81156014)(81166006)(68736007)(6486002)(6436002)(26005)(8936002)(186003)(6636002)(36756003)(2201001)(76176011)(14454004)(316002)(110136005)(54906003)(7416002)(256004)(14444005)(99286004)(71200400001)(52116002)(71190400001)(55236004)(5660300002)(478600001)(66066001)(102836004)(386003)(6506007)(2906002)(476003)(11346002)(2616005)(6116002)(3846002)(4326008)(6512007)(25786009)(446003)(53936002)(86362001)(486006)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3277;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: WXmqDohCEA/7fkuqz1RlAaKhUO2FNDYypqCPHSPtxeKhQORsDfncdEfO19B634W/mx5bssmCdeeCg7UUn6yjLbjjRHx/hDJgg408/FvSPzGPgipPADzSOyst3x+H+Bw2FvgV56M1eKqVo7ZcztsYp2FW7vcMPUP9cl6KgBLgeT6Pc22bacP24soXxfFXihhzqsKc1q9XWrFqsntRf33qDuKtUIsD8b3uz0yEbseUuOqFYu4UvU+YPVwwFZn0riQv4Nq2Maki+28yzGHZUCxuWtY+L18TyC5PsBGpuDam1CHp0mculguYH/vn4JSMpNGOLBrXA79X/g5uMZPqzFTUWJkr+jV8x5X1l3luOvYTFiyDLw92EThQRV5VIkObmpdTkIqEq/O6c76tmowEe9wnhvC9jYvQtF4UIWMXQG7q4oI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(189003)(199004)(3846002)(70586007)(36756003)(386003)(6116002)(6506007)(99286004)(126002)(102836004)(70206006)(11346002)(2616005)(110136005)(478600001)(6486002)(76130400001)(47776003)(50466002)(5660300002)(316002)(8746002)(76176011)(54906003)(63370400001)(63350400001)(446003)(36906005)(336012)(50226002)(486006)(186003)(86362001)(8936002)(476003)(2501003)(26005)(66066001)(2201001)(2906002)(14454004)(23756003)(7736002)(14444005)(22756006)(26826003)(356004)(6512007)(4326008)(81156014)(81166006)(6636002)(8676002)(305945005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1843;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b45b6f3b-2ebb-41b7-1031-08d715a6e52a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1843; 
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: VkmdnpS495q27WAE+ro1N/PNX67kTjoaUCntIOPGX5f/AdIgkFu4OJ6q1XZ1fG8Lki4iHRL+nB9wRYnOS/GnyPeocipdRvt0l/SCZRvDzjQk3DIk7Fz+tyg1pbUP9rNwH6xqhT49Lz8m+pSNwqEVM1r9T0GImIsBDRp77EToE4U/rDny6K8UppuGLN2jO+Ts9sO0uf3D0k4/Ha4vNVWvKikVC+ddgCMyRvEOu1J5Ted9rwxqiYj58qV7gtXMQKloJPCvQHM3qsYamReOpgB/nhQB3jqvZBI90EmzWkhMGYjceE21j0UhTdLkdQZ/txVPaDqURwiefKPqshQyu9QBywNwUfZoREjakZ3PAmrkXK5lmQdHLxi2ch/+FAmwUXbP+mmtYW4pWxTOLIGjkKPQpH0nkwg6l3qYeP1F3DsCpyI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:05:02.7615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21477bb5-9cc2-44dc-2a23-08d715a6efd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=91A3RoJk96bpl7g//6O2VxMd1wj5EZtgGEX/wfhXEaQ72izJWr967s5rd5NkdfJt8opNxMMbE1j5Zjyeq6XrGpsKZjswPDJ35ki7220MloByiE86xei3PA6naiQ5uS9aQRGSbgcQkxE+cV/vull+VPBWih03AfRSINeCulbjU/8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCF/l5FgpgxkKlm4BN4LzygTov7mP1C51bKkYdE5yEg=;
 b=91A3RoJk96bpl7g//6O2VxMd1wj5EZtgGEX/wfhXEaQ72izJWr967s5rd5NkdfJt8opNxMMbE1j5Zjyeq6XrGpsKZjswPDJ35ki7220MloByiE86xei3PA6naiQ5uS9aQRGSbgcQkxE+cV/vull+VPBWih03AfRSINeCulbjU/8=
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

RHVyaW5nIGl0IHNpZ25hbHMgdGhlIGNvbXBsZXRpb24gb2YgYSB3cml0ZWJhY2sgam9iLCBhZnRl
ciByZWxlYXNpbmcKdGhlIG91dF9mZW5jZSwgd2UnZCBjbGVhciB0aGUgcG9pbnRlci4KCkNoZWNr
IGlmIGZlbmNlIGxlZnQgb3ZlciBpbiBkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKCksIHJlbGVh
c2UgaXQuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxs
b3dyeS5saUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgfCAy
MyArKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0
ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKaW5kZXggZmYxMzhiNi4u
NDNkOWUzYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCkBAIC0zMjQsNiArMzI0LDkgQEAgdm9p
ZCBkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKHN0cnVjdCBkcm1fd3JpdGViYWNrX2pvYiAqam9i
KQogCWlmIChqb2ItPmZiKQogCQlkcm1fZnJhbWVidWZmZXJfcHV0KGpvYi0+ZmIpOwogCisJaWYg
KGpvYi0+b3V0X2ZlbmNlKQorCQlkbWFfZmVuY2VfcHV0KGpvYi0+b3V0X2ZlbmNlKTsKKwogCWtm
cmVlKGpvYik7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2IpOwpA
QCAtMzY2LDI1ICszNjksMjkgQEAgc3RhdGljIHZvaWQgY2xlYW51cF93b3JrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykKIHsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCXN0cnVjdCBkcm1fd3Jp
dGViYWNrX2pvYiAqam9iOworCXN0cnVjdCBkbWFfZmVuY2UgKm91dF9mZW5jZTsKIAogCXNwaW5f
bG9ja19pcnFzYXZlKCZ3Yl9jb25uZWN0b3ItPmpvYl9sb2NrLCBmbGFncyk7CiAJam9iID0gbGlz
dF9maXJzdF9lbnRyeV9vcl9udWxsKCZ3Yl9jb25uZWN0b3ItPmpvYl9xdWV1ZSwKIAkJCQkgICAg
ICAgc3RydWN0IGRybV93cml0ZWJhY2tfam9iLAogCQkJCSAgICAgICBsaXN0X2VudHJ5KTsKLQlp
ZiAoam9iKSB7CisJaWYgKGpvYikKIAkJbGlzdF9kZWwoJmpvYi0+bGlzdF9lbnRyeSk7Ci0JCWlm
IChqb2ItPm91dF9mZW5jZSkgewotCQkJaWYgKHN0YXR1cykKLQkJCQlkbWFfZmVuY2Vfc2V0X2Vy
cm9yKGpvYi0+b3V0X2ZlbmNlLCBzdGF0dXMpOwotCQkJZG1hX2ZlbmNlX3NpZ25hbChqb2ItPm91
dF9mZW5jZSk7Ci0JCQlkbWFfZmVuY2VfcHV0KGpvYi0+b3V0X2ZlbmNlKTsKLQkJfQotCX0KKwog
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJndiX2Nvbm5lY3Rvci0+am9iX2xvY2ssIGZsYWdzKTsK
IAogCWlmIChXQVJOX09OKCFqb2IpKQogCQlyZXR1cm47CiAKKwlvdXRfZmVuY2UgPSBqb2ItPm91
dF9mZW5jZTsKKwlpZiAob3V0X2ZlbmNlKSB7CisJCWlmIChzdGF0dXMpCisJCQlkbWFfZmVuY2Vf
c2V0X2Vycm9yKG91dF9mZW5jZSwgc3RhdHVzKTsKKwkJZG1hX2ZlbmNlX3NpZ25hbChvdXRfZmVu
Y2UpOworCQlkbWFfZmVuY2VfcHV0KG91dF9mZW5jZSk7CisJCWpvYi0+b3V0X2ZlbmNlID0gTlVM
TDsKKwl9CisKIAlJTklUX1dPUksoJmpvYi0+Y2xlYW51cF93b3JrLCBjbGVhbnVwX3dvcmspOwog
CXF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZqb2ItPmNsZWFudXBfd29yayk7CiB9Ci0tIAox
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
