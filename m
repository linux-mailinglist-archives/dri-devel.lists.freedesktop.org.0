Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018397EE5F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC756ECE9;
	Fri,  2 Aug 2019 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952AE6ECE9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:08:13 +0000 (UTC)
Received: from HE1PR0802CA0007.eurprd08.prod.outlook.com (2603:10a6:3:bd::17)
 by DB8PR08MB4953.eurprd08.prod.outlook.com (2603:10a6:10:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Fri, 2 Aug
 2019 08:08:09 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by HE1PR0802CA0007.outlook.office365.com
 (2603:10a6:3:bd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Fri, 2 Aug 2019 08:08:08 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 08:08:07 +0000
Received: ("Tessian outbound 578a71fe5eaa:v26");
 Fri, 02 Aug 2019 08:08:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb6cc2a9bdecefa3
X-CR-MTA-TID: 64aa7808
Received: from 438896da951e.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99A17835-FF15-4A49-8162-01C2CC564A72.1; 
 Fri, 02 Aug 2019 08:07:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 438896da951e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 02 Aug 2019 08:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUF+4XvWWyzFlrsTPBId4hYVd9REpfVTpwubQH/b77DSiGP4X0GylUcX1rZ4aHCyMOwD7Tx0ACxcVZFI9avDsaQ54CwioOFQMnibnVxtK8ZsgeNtJecl5NzBf9qw4RqhyZkJUiWPkk3I056epU+/oa4E2Gn+9jFwdtx5tDLDf+qprwWlNzpnmIF4UrEQUud1bg/pMm7jWzVLsxdoimprKahn4xwpLbjX5h2OjyovFkgHyi5aARZY9E+Ipp7b3fQ1rahKnzmjPURMQfSwS/hrC5DoxKsTCo03rORcmT57qJkNCB1pui4dUr/T9SCuUPw7raLjAVzuShzmU+clIo+dtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhCwJGFi0O694knrT3lvkfD5Jvkl/qoUo/6cShKWVAY=;
 b=f7T/FsCNfSt0LUaNYKegsE/uqZQJqINl6o2pk1Bj3vubVYRPfmAABgCih6wObCzjcLPlbxi0+N8OraEllPsRKdRwooXxY7Ua04dEwNdKgWGklI3kYTPyCypnkslZINPkoyyYyC20YJn57quVkMkTSx2x2nX71gwL54676w4u6g4M00BaVjk5F/sO1Oy+aXbDfr0LhAHExnKWB/fmMw1oR5uUvrLKhMdnIIZBUXmf4JU/IPilUKrfJf5PxkZRaK5SyUk4mqYzgL0y93og/RuzSWUna1H9UQjNQVP1TXC4/vZxxoYEsq+8GpAqcDXiX1t9aa9djRpQXIOXNXR1W17Nfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3102.eurprd08.prod.outlook.com (52.133.15.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 08:07:52 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 08:07:52 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Initialize and enable output polling on Komeda
Thread-Topic: [PATCH] drm/komeda: Initialize and enable output polling on
 Komeda
Thread-Index: AQHVSQliwT6n8KpuCU6FxpOSkLMZqQ==
Date: Fri, 2 Aug 2019 08:07:52 +0000
Message-ID: <1564733249-24329-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0038.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::26) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 26e5e70e-740e-4e45-dd82-08d717208d85
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3102; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3102:|DB8PR08MB4953:
X-Microsoft-Antispam-PRVS: <DB8PR08MB49539C6AEB33C41C4BE9724C9FD90@DB8PR08MB4953.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1201;OLM:1201;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(199004)(189003)(186003)(26005)(8936002)(8676002)(102836004)(55236004)(52116002)(6506007)(386003)(256004)(5024004)(66066001)(81156014)(81166006)(6636002)(64756008)(66446008)(7736002)(66476007)(305945005)(86362001)(68736007)(53936002)(99286004)(2616005)(476003)(14454004)(4326008)(25786009)(478600001)(66556008)(66946007)(486006)(50226002)(6436002)(54906003)(3846002)(6512007)(2906002)(316002)(110136005)(2501003)(6486002)(6116002)(5660300002)(71200400001)(71190400001)(2201001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3102;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 6pdKlfsUqRz3yCXj6tRWg/eHtJi8tvhbyVGDIN1ZFsqmt+7+NTEF53dExSFsuIF0WqYBMnKY1aLsqvSYkpjGmcjKD7FClPQ+I5qqsyw2+xdxPCalP/vlc5K0rehB2nCnJA7dx+L9efh4SpbPaj6NBRtvEd/UwPyaRX93g6tEmPFmXGXmqi1yvEk/9JBJQrFCN3ZzT0MylAM906dWRsmeB6x9qkfc+TwP2hhT3H/kkTuAP/F17ICYoYhYJ/QHJ8TSm19wINmULTJXxt9NYZowN4PadrljhOIndBB1x+22FG9HyyNlSxNkvuwXD4+hmJM/YffkRJb6oneFr1xCSOUlyjeL1KFz+Z3ygaV+RnZAiKGdxT4+XnDvxOgs/VBHMoH38IVjVmdljacp2P/5Y2B3a2cA86dS0f3s+q42tJQlxyc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3102
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(2980300002)(189003)(199004)(305945005)(8936002)(14454004)(2201001)(356004)(6486002)(26826003)(22756006)(81156014)(81166006)(99286004)(8676002)(478600001)(50226002)(8746002)(4326008)(23756003)(25786009)(6512007)(486006)(6636002)(336012)(2501003)(5024004)(316002)(186003)(7736002)(26005)(36906005)(76130400001)(2616005)(5660300002)(3846002)(102836004)(70206006)(2906002)(54906003)(126002)(86362001)(386003)(110136005)(66066001)(6116002)(476003)(6506007)(36756003)(63370400001)(50466002)(70586007)(47776003)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4953;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9e0bbf13-e159-47c7-ef55-08d71720844c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4953; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: AclucVf1dDWhSW+ggP6zel3+eAGR3vOWXe6znFRr5FJBxi22PVGaCPCdQiCR1Dydz2i89fLsEbHuy8WnqmX9yASg06BklEXIYabWFXjmFAgLJwJ68QHmNF0rDyUV/COzEINCVRZ04FH1AqV7nHaxoj00iYDc4KHJn2GCP7xDvP5S35YDaw5AsCb9ZVQZ9nE5JfAhdkpPZqt0mAHN6JS0t4jHj6QNcfW+ynfTUMlJlQ9MNPQ8hFPvp7Hz5kgMKQqRwpUmnWf3BbP9lxFK+Ou7kvuwljJu1ACrCrMSUsZUbaeO6Jua3D2QzEzFAXBQPvKlIZ0esLVomGeK+61ZTGZw2hCPe9KHP8gtsufLXwZzKhRnquzulx2nD6aq4XctuZUzHYYfh88p6UJb3EcNJojcn+J8GBy7JRTTUklxoSpzwUg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 08:08:07.6186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e5e70e-740e-4e45-dd82-08d717208d85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhCwJGFi0O694knrT3lvkfD5Jvkl/qoUo/6cShKWVAY=;
 b=1AkdTzxpRFJs6i2Zq/rIVoRCMIoGCi/oTA/5kt+5WGSU2Fqyatzc1506XSYryoEcJtlCmzJ/rjoQY70bEVWk8p2hOCzCWMKLb79HkDsHTaEKYWW5gsSCzFU6iJHraM1yAs6zy3y9ObY+ErroMNZJ4HusUCzbnPsENsqGKw3t1vY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhCwJGFi0O694knrT3lvkfD5Jvkl/qoUo/6cShKWVAY=;
 b=1AkdTzxpRFJs6i2Zq/rIVoRCMIoGCi/oTA/5kt+5WGSU2Fqyatzc1506XSYryoEcJtlCmzJ/rjoQY70bEVWk8p2hOCzCWMKLb79HkDsHTaEKYWW5gsSCzFU6iJHraM1yAs6zy3y9ObY+ErroMNZJ4HusUCzbnPsENsqGKw3t1vY=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKSW5pdGlhbGl6ZSBhbmQgZW5hYmxlIG91dHB1dCBwb2xsaW5nIG9uIEtvbWVkYS4KCkNoYW5n
ZXMgc2luY2UgdjE6CjEuIEVuYWJsZSB0aGUgcG9sbGluZyBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhl
IGRyaXZlcjsKMi4gRGlzYWJsZSB0aGUgcG9sbGluZyBhZnRlciB1bnJlZ2lzdGVyaW5nIHRoZSBk
cml2ZXIuCgpDaGFuZ2VzIHNpbmNlIHYyOgoxLiBJZiBkcml2ZXIgcmVnaXN0ZXIgZmFpbGVkLCBk
aXNhYmxlIHRoZSBwb2xsaW5nLgoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9s
b2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jCmluZGV4IDQxOWE4YjAuLmQ1MGU3NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5j
bHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9pcnEuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgorI2luY2x1ZGUgPGRybS9kcm1f
cHJvYmVfaGVscGVyLmg+CiAKICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCiAjaW5jbHVkZSAia29t
ZWRhX2ZyYW1lYnVmZmVyLmgiCkBAIC0zMTUsNiArMzE2LDggQEAgc3RydWN0IGtvbWVkYV9rbXNf
ZGV2ICprb21lZGFfa21zX2F0dGFjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIAogCWRybS0+
aXJxX2VuYWJsZWQgPSB0cnVlOwogCisJZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybSk7CisK
IAllcnIgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7CiAJaWYgKGVycikKIAkJZ290byBjbGVh
bnVwX21vZGVfY29uZmlnOwpAQCAtMzIyLDYgKzMyNSw3IEBAIHN0cnVjdCBrb21lZGFfa21zX2Rl
diAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJcmV0dXJuIGtt
czsKIAogY2xlYW51cF9tb2RlX2NvbmZpZzoKKwlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJt
KTsKIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAo
ZHJtKTsKIAlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7CkBAIC0zMzgsNiAr
MzQyLDcgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtt
cykKIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7CiAJbWRldi0+ZnVuY3MtPmRpc2FibGVfaXJx
KG1kZXYpOwogCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOworCWRybV9rbXNfaGVscGVyX3BvbGxf
ZmluaShkcm0pOwogCWNvbXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJtKTsKIAlrb21l
ZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7CiAJZHJtX21vZGVfY29uZmlnX2NsZWFu
dXAoZHJtKTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
