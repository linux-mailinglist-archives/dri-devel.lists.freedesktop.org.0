Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B2D8DFC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3338B6E932;
	Wed, 16 Oct 2019 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC766E930
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:44 +0000 (UTC)
Received: from VI1PR08CA0210.eurprd08.prod.outlook.com (2603:10a6:802:15::19)
 by AM0PR08MB3633.eurprd08.prod.outlook.com (2603:10a6:208:de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 16 Oct
 2019 10:34:39 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0210.outlook.office365.com
 (2603:10a6:802:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.22 via Frontend
 Transport; Wed, 16 Oct 2019 10:34:39 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 10:34:37 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Wed, 16 Oct 2019 10:34:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95c03a061108e5e6
X-CR-MTA-TID: 64aa7808
Received: from c2892146728e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 216C8E9C-AFF0-42AD-932B-836FF78E502E.1; 
 Wed, 16 Oct 2019 10:34:20 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2892146728e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 10:34:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT0cPretCRCzHFq6+AeIpRf9o+VaIirw65k8pMDETUhyZGaIEyeM63KJINi99bf4HxQmr6cvtZF2lFCCVr0MA/gAs3+ghEBpbiPYD72c1H7FbxkF1MLNsRw8WWKaledQaHazMDjNZJ8e8rRZEV3RUPMTH35SHmM8SW7AfR2m7ezuUj+7cbmNjsDM9vBlhq4dJyPMMGVJgGDfTaAU8/4r2CuDDa2lCcu2PJPVdpe2BiKtq7xjs3EqI2y3pyYiuRdhnIkkGRUCCVLSCg2PxAq+TfP9X4FlXHTRJfFqKOZ/BhrS/2eVYDAYyUe6TVJF2qhqlMEoKBJic9YVonb2bxIxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=D0EmvRQfFeOlVPyZk35nH9xn75e90FlqpRU1zbhBfUr5ywzqUigrpQkjLicF+MrjuI0dak2fKNTzCn6xvmnqFcaPtE+hXAqtBUAO+myU5mZqCjsyftIqDFBpyNeeHRDuMoVnbRn1Upnt3LMSo+MlwIu8NCYDa8CygX45MRrP1p5bLen0Zid112GYr5PHu8fHHNGQMUZilEmqmg1mUdCd45D1W+JoRxA8O6B2YWkqwqYaLxUR57gJuALsTnUwyb5B06plyyPAk2stCECH1fv49YEJraoRhW6i0a4YGqj86ZUdF7wJ0qJXG2ZiPPfpEHjUT4UiVu5Nx73Ezf1BU1seCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5152.eurprd08.prod.outlook.com (20.179.30.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 10:34:15 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 10:34:15 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v5 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v5 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVhA1CCsnvZq8O7EazVvpZbV4JuQ==
Date: Wed, 16 Oct 2019 10:34:15 +0000
Message-ID: <20191016103339.25858-3-james.qian.wang@arm.com>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: aad8f177-8059-4fb3-532d-08d7522471a9
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5152:|VE1PR08MB5152:|AM0PR08MB3633:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3633D47AFA8D15F8DF255788B3920@AM0PR08MB3633.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(6506007)(4326008)(2171002)(25786009)(478600001)(66066001)(99286004)(103116003)(76176011)(52116002)(71190400001)(64756008)(71200400001)(256004)(14444005)(66446008)(66476007)(36756003)(66946007)(14454004)(66556008)(8936002)(50226002)(8676002)(386003)(81166006)(81156014)(486006)(26005)(2501003)(186003)(55236004)(2906002)(5660300002)(110136005)(1076003)(305945005)(446003)(2201001)(6486002)(6436002)(11346002)(476003)(6512007)(316002)(6116002)(3846002)(102836004)(54906003)(86362001)(2616005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5152;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BwlzLsYKh8XrTNZ3BgzlueqRVidK4yexoJDa4gQvQMpe7SR2RMMrvfRJbK6P9eko9NF9tWHuywL+STouNPb10pCbpayA9blmHSGHfGXHI5qHIZsA3eH7RSYJDs+mcwEQpHT2Yd4LJF8IWn8Ecx3uDF3gF8dUa+3g/c9TAoZFZep8G81VUSZjGdRt6DJjRmqvyA2RdD5RiV2Gj8UqENviL1Jakt/F27ICRDrbaZjS2OroI11gk754rc9B0ptXUNLvUaTPspes6aEzKKEErRanEWHUC9ZFM+tUsmME/hG++h6tfhhyM1GooiG41eInMwxrB+kwKQEiTrqJco+TH5iVfj/bjUVDs9YmCy9QeX+763ecM7460MTHKesuHI7F2csb/a+rbxgnbszaHp/alj3QN/5/9tktfiuuJpBbJNzTLqw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5152
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(199004)(189003)(66066001)(386003)(86362001)(2201001)(356004)(110136005)(316002)(6486002)(22756006)(336012)(14454004)(25786009)(54906003)(36756003)(2501003)(14444005)(6116002)(6512007)(6506007)(76176011)(1076003)(99286004)(5660300002)(3846002)(50466002)(2906002)(102836004)(23756003)(50226002)(2171002)(478600001)(26826003)(186003)(11346002)(446003)(81166006)(126002)(305945005)(7736002)(8676002)(81156014)(4326008)(47776003)(103116003)(76130400001)(70206006)(26005)(476003)(63350400001)(8746002)(70586007)(8936002)(486006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3633;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fff45ce9-f407-44e3-7240-08d75224648d
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKl66ov51fqSM4Qby6IyYLHGRt0xAdxvwqFKjoaqCzyTvys3XF+eMqPHkF3ugv0eYW2mvbyoZixOwew6OgO7izDChcxoidBxCkBsTDV1jIHrGZP1Ginh5vu6n99x8lPqWCzGUZq456N8qqjNmcufRFhurnN3f719ldwMCz6TpHXlJ2dG5HE9PMXbaQ71tgxycOjjurp1zj49ufp+ZHcurp8hvOF2QnGoXRUTGpQOCWt5DtgQI74w37NYWLy93GOkwVjldmlaLzZ1GCJ3ZLAe2XhzufQ96Zai/TDcCYY/FREbECKTsEKTdokcY7cwBs4562FMbwJefG/ZNB7oOyt8kCRvJ6winvoKfft3e52Bqt0ZtvtHsrWLOxC1JuONkQH4UTb4ZvTyTN9g50n7vTXMBAEejCuyS5s2wwBZtKWLGVs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:34:37.4116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aad8f177-8059-4fb3-532d-08d7522471a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3633
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=L7wkSdcN1vpuLJnXkQMX7xWpStzqRpBbrl1NLhxAlkAisQ/P3bmtKKscAsHNtiRFKEm1fr6ff95YoNu0iRBtEz9H7lpkgk12cNP+3d1Ol6wPR6Vf8purYYBdMtUSE5gNAsDxyQJKQq4e6fvpkbsjwgfjnei4ITOmDLJ7vycBVv8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=L7wkSdcN1vpuLJnXkQMX7xWpStzqRpBbrl1NLhxAlkAisQ/P3bmtKKscAsHNtiRFKEm1fr6ff95YoNu0iRBtEz9H7lpkgk12cNP+3d1Ol6wPR6Vf8purYYBdMtUSE5gNAsDxyQJKQq4e6fvpkbsjwgfjnei4ITOmDLJ7vycBVv8=
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

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIGNvbG9yIGx1dCB0byBrb21lZGEg
SFcgcmVxdWlyZWQgY3VydmUKY29lZmZzIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
UmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
LS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCA1MiAr
KysrKysrKysrKysrKysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmggICAgfCAgOSArKystCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggOWQxNGE5MmRiYjE3Li5jMTgwY2U3MGMyNmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Nv
bG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKQEAgLTY1LDMgKzY1LDU1IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVj
dF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKIAog
CXJldHVybiBjb2VmZnM7CiB9CisKK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3IgeworCXUzMiBi
b3VuZGFyeV9zdGFydDsKKwl1MzIgbnVtX29mX3NlZ21lbnRzOworCXUzMiBzZWdtZW50X3dpZHRo
OworfTsKKworc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgeworCXUzMiBzdGFydDsKKwl1MzIg
ZW5kOworfTsKKworc3RhdGljIHN0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Igc2VjdG9yX3RibFtd
ID0geworCXsgMCwgICAgNCwgIDQgICB9LAorCXsgMTYsICAgNCwgIDQgICB9LAorCXsgMzIsICAg
NCwgIDggICB9LAorCXsgNjQsICAgNCwgIDE2ICB9LAorCXsgMTI4LCAgNCwgIDMyICB9LAorCXsg
MjU2LCAgNCwgIDY0ICB9LAorCXsgNTEyLCAgMTYsIDMyICB9LAorCXsgMTAyNCwgMjQsIDEyOCB9
LAorfTsKKworc3RhdGljIHZvaWQKK2RybV9sdXRfdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzLAorCQkgIHN0cnVjdCBnYW1tYV9jdXJ2ZV9z
ZWN0b3IgKnNlY3Rvcl90YmwsIHUzMiBudW1fc2VjdG9ycykKK3sKKwlzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCAqbHV0OworCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsKKworCWlmICghbHV0X2Jsb2IpCisJ
CXJldHVybjsKKworCWx1dCA9IGx1dF9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IG51
bV9zZWN0b3JzOyBpKyspIHsKKwkJZm9yIChqID0gMDsgaiA8IHNlY3Rvcl90YmxbaV0ubnVtX29m
X3NlZ21lbnRzOyBqKyspIHsKKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3VuZGFyeV9zdGFydCAr
CisJCQkgICAgIGogKiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7CisKKwkJCWNvZWZmc1tu
dW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5yZWQsCisJCQkJCQlLT01FREFf
Q09MT1JfUFJFQ0lTSU9OKTsKKwkJfQorCX0KKworCWNvZWZmc1tudW1dID0gQklUKEtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworfQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcykKK3sKKwlkcm1fbHV0
X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rv
cl90YmwpKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaAppbmRleCBhMmRmMjE4ZjU4ZTcuLjA4YWI2OTI4MTY0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuaApAQCAtMTEsNyArMTEsMTQgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9y
X21nbXQuaD4KIAogI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZGUwkJMTIKKyNkZWZpbmUg
S09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEyCisjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJ
T04JCTEyCisjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NPRUZGUwkJNjUKKyNkZWZpbmUgS09NRURB
X0NPTE9SX0xVVF9TSVpFCQlCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTikKKyNkZWZpbmUgS09N
RURBX05fQ1RNX0NPRUZGUwkJOQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMz
MiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBj
b2xvcl9yYW5nZSk7CiAKLSNlbmRpZgorI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
