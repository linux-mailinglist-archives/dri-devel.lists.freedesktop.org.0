Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEBC1AC6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 06:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0843B6E32F;
	Mon, 30 Sep 2019 04:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15D6E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:54:55 +0000 (UTC)
Received: from VI1PR0802CA0020.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::30) by DBBPR08MB4680.eurprd08.prod.outlook.com
 (2603:10a6:10:f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 04:54:49 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR0802CA0020.outlook.office365.com
 (2603:10a6:800:aa::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Mon, 30 Sep 2019 04:54:48 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 04:54:47 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Mon, 30 Sep 2019 04:54:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 449fa4edf9518bb1
X-CR-MTA-TID: 64aa7808
Received: from cda93119b744.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01DA1FD6-318D-466A-A93B-1013410DD6CA.1; 
 Mon, 30 Sep 2019 04:54:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cda93119b744.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 04:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAmxKax6gf7ZEaaWofuM3U3D8NH0E7Rj6+nJ9XcS4pYsYEF8QFF6H7tQwU/+HUMbRLtX0vN5qZxsTAuv2Uc9DduS8w7rMDbd9COLFhHgjDRT2yL1f2vYIxKyxzkCZUn5nJ766x3lS5CSZWPMhMuXPtcRScxEjb+PXPs1qU5JEli2UGPjFjWr/TAzOtNfNTyC1j2/9g1yCk8Z+ECUFHX7eiJgv/+0q4rJ/sFP5lVIVBSLAIElDTBqmk4TUbZoCrRCNXeMK0X5v6GhKzKaT7Xu9VINxhwdLqW/KE63RJtgTS3TahIxZf1q2wbeBf7tUKXtYdCYF6X1ycs/mJYO/dFmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=G8p14T5zzsEVDuvuNqAfIV2/Lu1wkm1STaTxKDjP/Q7UIbpqmZa6jyScr/VLgZ4LBMqeOeLayGp4agORNLJ+M1Sj40D7mCykPoZRm2Hwabph/o1qDXgG0tH2ctmR1k6M1DYHK0cYsA6z47wnFS+gxEGzHLYgb3+WGX8jBqGJVbjEMInGRNY9cELNo6c5a0CeIR5YlFFXPSeb76dKUA5OW0hWQDPfoQt+kcFov97Ubgbay+MfQh1hOH0O6B2ed2eEnHnTOBVc2cw0fPTbthpbiRMI4u7Uq7smBYkFpC6lvzdMwlS2RQusFk/Wb71cRyqLM94wKsPpWcX1gWmQAK+fqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4703.eurprd08.prod.outlook.com (10.255.27.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 04:54:35 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 04:54:35 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/3] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH 1/3] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVd0snT33H/BtpsUmrR4CGKgAzPQ==
Date: Mon, 30 Sep 2019 04:54:35 +0000
Message-ID: <20190930045408.8053-2-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a9021a26-0439-448f-cf8b-08d745625188
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:|VE1PR08MB4703:|DBBPR08MB4680:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4680D49C33EA7821EDC3F54BB3820@DBBPR08MB4680.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(199004)(189003)(6116002)(3846002)(103116003)(26005)(36756003)(2201001)(256004)(305945005)(71200400001)(7736002)(6486002)(55236004)(102836004)(8676002)(81156014)(2501003)(52116002)(71190400001)(66946007)(6436002)(81166006)(14454004)(64756008)(446003)(76176011)(11346002)(2616005)(66476007)(66556008)(86362001)(66446008)(478600001)(99286004)(6506007)(386003)(6512007)(14444005)(66066001)(8936002)(1076003)(476003)(2906002)(316002)(486006)(4326008)(50226002)(54906003)(5660300002)(186003)(110136005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4703;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lZ7mBFKlE3zMXXk+ZEbCOVOUPdhbtGHn3mzRXNDpumBXjQtJsOspw+lLufuqAlNhw3nV/vg5lIHQ7uyp2sOzcO1ElowG5bFlVrjiMnh9ST+4xDr44FnQbAq1saj9FB7SJvmwcs0sBaauKMD8pCwcMOONS6G1Dn/y4bzWO9gWrAK4e+TPWfyIkF4KC01IPeA1ywrrx4AY8DBvaSMr2RowYqfluSvXqfZBQyp4rHhrRoqR1SzVZL8j+odUJ1L3jHuAzuYhT9w9enadgRlQ+DiV3q38UoJvb+d8FAuj/WMR/kIhQNrHvr9sG7qqTBzbfpldJZ/ramabn+uDOjzTU6Nj1BUJPTKuYHrAVNdEPeHi3EWP1C5Mg2mMSLZBm0mtwCsLZ00uWYHaZ7uz+7187fCzcy93WMqACsOeeMdntQ1A6rw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(346002)(136003)(376002)(189003)(199004)(2501003)(22756006)(8676002)(6116002)(81156014)(8746002)(81166006)(4326008)(14444005)(8936002)(336012)(110136005)(86362001)(23756003)(6512007)(54906003)(50226002)(316002)(3846002)(14454004)(36906005)(2906002)(6486002)(2201001)(186003)(63350400001)(50466002)(446003)(6506007)(99286004)(11346002)(305945005)(356004)(386003)(126002)(5660300002)(26005)(486006)(70206006)(103116003)(476003)(7736002)(1076003)(2616005)(478600001)(36756003)(102836004)(47776003)(70586007)(66066001)(76130400001)(26826003)(76176011)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4680;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4a3009c-24e0-48a2-de47-08d745624a1c
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spfYgjy7ZxraOQblLj8c1g4u8Y1rrIb+oxN24/6zspTuz7HPaNuYKOF69tXr/8g7SUUH5VRZ7hhw1prGPLOVWYZX9PloVn9mrUNrrbuw2TLz3ujcdpQNvyCDMWA+J4mdtuFA7Xk1tw8Xv4SSj8yyCGKd4pZmO4a6Uz7F4BJYbeYEUBonwvYYzRKAEtAfSsp995by6Tg1CG4RwTv5ak+ZTmwpWfhwSGebh7lRRcmPZZTEiQ66l0WMqGKfTuJX+X0VwRPFI//jEYq7VBzfqaHA0hWzCWlQI352GQ2w7qhvwUBsjW4MCeqtTt+BtSME2lSgp0zH88FosKhhVj/kqZwd4+Lx1zum1JUbTaNDsPzUyIur/23+NmtjxMeMYO/f+NILBMsOfa7cZJFqqjrM0FuuzSDNCGXauwZPIptU8QPcUDw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 04:54:47.2686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9021a26-0439-448f-cf8b-08d745625188
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4680
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=6LFj2bBDUDf6PPzsngLgAge8gnWBtUiqapCSf6+PCwANsj/U48Pk1CcAfBJ1lNP4PNlmT5rEJ6fF/b5/BnPcvgfDOdgqaxZwCq1mWQx/dkefihxfYk/3DjQbiJn4pu4AlpjnE3Ni6bCXpOHd1KJuat2yl4r93uSvWjx/f0f+LRo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=6LFj2bBDUDf6PPzsngLgAge8gnWBtUiqapCSf6+PCwANsj/U48Pk1CcAfBJ1lNP4PNlmT5rEJ6fF/b5/BnPcvgfDOdgqaxZwCq1mWQx/dkefihxfYk/3DjQbiJn4pu4AlpjnE3Ni6bCXpOHd1KJuat2yl4r93uSvWjx/f0f+LRo=
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

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIDNkbHV0IHRvIGtvbWVkYSBIVyBy
ZXF1aXJlZCAxZCBjdXJ2ZQpjb2VmZnMgdmFsdWVzLgoKU2lnbmVkLW9mZi1ieTogamFtZXMgcWlh
biB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgot
LS0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDUyICsr
KysrKysrKysrKysrKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21n
bXQuaCAgICB8ICA5ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuYwppbmRleCA5ZDE0YTkyZGJiMTcuLmMxODBjZTcwYzI2YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYwpAQCAtNjUsMyArNjUsNTUgQEAgY29uc3QgczMyICprb21lZGFfc2VsZWN0
X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKQogCiAJ
cmV0dXJuIGNvZWZmczsKIH0KKworc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciB7CisJdTMyIGJv
dW5kYXJ5X3N0YXJ0OworCXUzMiBudW1fb2Zfc2VnbWVudHM7CisJdTMyIHNlZ21lbnRfd2lkdGg7
Cit9OworCitzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VnbWVudCB7CisJdTMyIHN0YXJ0OworCXUzMiBl
bmQ7Cit9OworCitzdGF0aWMgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciBzZWN0b3JfdGJsW10g
PSB7CisJeyAwLCAgICA0LCAgNCAgIH0sCisJeyAxNiwgICA0LCAgNCAgIH0sCisJeyAzMiwgICA0
LCAgOCAgIH0sCisJeyA2NCwgICA0LCAgMTYgIH0sCisJeyAxMjgsICA0LCAgMzIgIH0sCisJeyAy
NTYsICA0LCAgNjQgIH0sCisJeyA1MTIsICAxNiwgMzIgIH0sCisJeyAxMDI0LCAyNCwgMTI4IH0s
Cit9OworCitzdGF0aWMgdm9pZAorZHJtX2x1dF90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0
eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsCisJCSAgc3RydWN0IGdhbW1hX2N1cnZlX3Nl
Y3RvciAqc2VjdG9yX3RibCwgdTMyIG51bV9zZWN0b3JzKQoreworCXN0cnVjdCBkcm1fY29sb3Jf
bHV0ICpsdXQ7CisJdTMyIGksIGosIGluLCBudW0gPSAwOworCisJaWYgKCFsdXRfYmxvYikKKwkJ
cmV0dXJuOworCisJbHV0ID0gbHV0X2Jsb2ItPmRhdGE7CisKKwlmb3IgKGkgPSAwOyBpIDwgbnVt
X3NlY3RvcnM7IGkrKykgeworCQlmb3IgKGogPSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zf
c2VnbWVudHM7IGorKykgeworCQkJaW4gPSBzZWN0b3JfdGJsW2ldLmJvdW5kYXJ5X3N0YXJ0ICsK
KwkJCSAgICAgaiAqIHNlY3Rvcl90YmxbaV0uc2VnbWVudF93aWR0aDsKKworCQkJY29lZmZzW251
bSsrXSA9IGRybV9jb2xvcl9sdXRfZXh0cmFjdChsdXRbaW5dLnJlZCwKKwkJCQkJCUtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworCQl9CisJfQorCisJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NP
TE9SX1BSRUNJU0lPTik7Cit9CisKK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVj
dCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQoreworCWRybV9sdXRf
dG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsIHNlY3Rvcl90YmwsIEFSUkFZX1NJWkUoc2VjdG9y
X3RibCkpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IGEyZGYyMThmNThlNy4uMDhhYjY5MjgxNjQ4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xv
cl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5oCkBAIC0xMSw3ICsxMSwxNCBAQAogI2luY2x1ZGUgPGRybS9kcm1fY29sb3Jf
bWdtdC5oPgogCiAjZGVmaW5lIEtPTUVEQV9OX1lVVjJSR0JfQ09FRkZTCQkxMgorI2RlZmluZSBL
T01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTIKKyNkZWZpbmUgS09NRURBX0NPTE9SX1BSRUNJU0lP
TgkJMTIKKyNkZWZpbmUgS09NRURBX05fR0FNTUFfQ09FRkZTCQk2NQorI2RlZmluZSBLT01FREFf
Q09MT1JfTFVUX1NJWkUJCUJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQorI2RlZmluZSBLT01F
REFfTl9DVE1fQ09FRkZTCQk5CisKK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVj
dCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKTsKIAogY29uc3QgczMy
ICprb21lZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNv
bG9yX3JhbmdlKTsKIAotI2VuZGlmCisjZW5kaWYgLypfS09NRURBX0NPTE9SX01HTVRfSF8qLwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
