Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524AD6D22
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 04:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FC96E5DE;
	Tue, 15 Oct 2019 02:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6578B6E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 02:11:29 +0000 (UTC)
Received: from HE1PR0802CA0019.eurprd08.prod.outlook.com (2603:10a6:3:bd::29)
 by DBBPR08MB4678.eurprd08.prod.outlook.com (2603:10a6:10:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 02:11:24 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by HE1PR0802CA0019.outlook.office365.com
 (2603:10a6:3:bd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 02:11:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 02:11:23 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 15 Oct 2019 02:11:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5207e13f6e540a4c
X-CR-MTA-TID: 64aa7808
Received: from 95c9ceaedac9.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58242113-226D-4520-99A7-6E8607A998AF.1; 
 Tue, 15 Oct 2019 02:11:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95c9ceaedac9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 15 Oct 2019 02:11:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmNDq2ljwI5XYS/ljhzybAhAzXek7cIjeDnWIVo8Zxr92w5d7r4h+IKwSOb+/NMFvNqPDov5R9ty5BHpGC3r7oaAEagkVryc9n7X4G89hvYF5psh5mnuKqNL3qaRgk+LJPP1Wic0E9uy51c6KjexaDQ4T5mavGU1szjK2DyrFL930a7gZFnxj51CpzJeYBpR3oBBniLaIGTF6rDKbjOeZra5xl+HqvZ/2jwm3Ga9XHSRr31rtb2CM1ywxboGMJPL4vBYy8S16hCelkynXTNiplOeF9JSGLxmWeAH6JIY0jzAQEA7T5NlmbHTd/9gj4gIbqiNDTUy9s2SlCFJktBzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=BeOgIcjRlQG9FUqo7+ad6TchX/EV09Wt17KPBWo5ww085/dvB5kNECFI9W1II8UIeqaRw+Y4PzH08AHeH4YEk2CwIpePlvInrLHCdPVURBfIycDkLTFHluyjyK4yEGukFa3QlvbGxx3LlIsK3afkaAeL6cFoOIzZ4xBGhSMA2RYBqOIMOcnWyXXvwtEx3IC/u3Dox6qprzzuqCRW8FWj5gnJ/ro3zLJ85PWIKXELKxKNfhqfbdPJ8XGXCnaF0gp7Pq9xv2TVqAMhxR/9oU6HyPF6BfoD64U/ExAEV409sSwinx7dbNSgnTYsTh69+X2NavmXqs8NUhQUIwRMSH75eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 02:11:08 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 02:11:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v4 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v4 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVgv3OQ34D7f1MHkmhb7Kvw8BM2g==
Date: Tue, 15 Oct 2019 02:11:08 +0000
Message-ID: <20191015021016.327-5-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d0347c2-523f-45ba-4766-08d75114fa32
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|DBBPR08MB4678:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB46785C0DEC1D465503C35D3FB3930@DBBPR08MB4678.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(189003)(199004)(66066001)(476003)(76176011)(110136005)(54906003)(66946007)(64756008)(66476007)(66446008)(71200400001)(66556008)(26005)(103116003)(2201001)(86362001)(6512007)(186003)(71190400001)(316002)(36756003)(6506007)(446003)(11346002)(386003)(2616005)(486006)(2906002)(256004)(52116002)(14444005)(55236004)(102836004)(2171002)(8936002)(14454004)(478600001)(6486002)(81156014)(81166006)(305945005)(50226002)(2501003)(4326008)(8676002)(7736002)(5660300002)(1076003)(6116002)(3846002)(25786009)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: keCgo9PdbWh8XH5/sjRCzsoLoqmmIpEBKyZfqKwzO52d98qzxPfGIX3LTEi/nlWAMfPq5x9dd4Pw+rC00Delayp6RzPPe7ky9iXeP561OLMwsrY5Tv88BY2SUcYT9dDeAyxnic+lmlv1vAEm9dTWXJHfd1ex7C4J8+YxQ9fSTH5Gbx3V8iS+lFXN0ZlqlyWWIEHPcPL2JJndgPy0eJ3iEV6NgcUlsyqthoPhWN/Ndttinl2tMY3JgtLmSOOBt08AwbwGmDP3ye7Q7uwe4z11xDUk1kA+WKIHv/hWq+wRJXCuzoHTUPbK+nMa2KbU95lmSXRe/CwVODc2SfAXT2jSyQ9+3WB7gf1oNlPc4X8khKygszJcZ483EOgtLs1aUX5VcEds/HVZtWsBA/ZV7OO2uJ3gaApsHB+SHUgfQpjJocw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(36906005)(23756003)(25786009)(26826003)(316002)(4326008)(2616005)(478600001)(336012)(22756006)(50226002)(486006)(5660300002)(47776003)(1076003)(126002)(66066001)(11346002)(476003)(63350400001)(2171002)(6512007)(6486002)(446003)(54906003)(110136005)(50466002)(99286004)(76176011)(356004)(8746002)(186003)(103116003)(8936002)(102836004)(6506007)(81166006)(70586007)(70206006)(8676002)(81156014)(26005)(76130400001)(386003)(305945005)(6116002)(7736002)(3846002)(2906002)(14454004)(86362001)(2201001)(36756003)(2501003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4678;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad8006b6-c105-4f81-275b-08d75114f10f
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROl5hPEq5fwtYUlj+ttxUzKGfVgg79dOkFguDQZS39vV1bqo6efR6BHYq7x0dUeVJmy6xaWJmjNiDISfvNqPCRNULhzsG82AK+lV0wrTEXfwohzN3Ux2ThTUNv283A3Rk/+g8SkMksJrP2Aa519NVyW5QA4g5A89xOjdsjJpc652FWRTLmtVqRguT3D28NMz+2SbOB+bcqFBywLDMmAvg4gMQcUzH5pYwMzAw8U2ZoYXcCxz6IPnZ+U3j6KKVl/TUfyvxVHUjYndEtpA0s+UbW9zdgdBvddIRs4ZUsIvwp1t5bKJX8p0sCQjQJXVix6t4N9lnRxr1MgLEAvnzIBxIjAHz2c96/BMqVp0oc6Ldr6G93Xb7vv0zyuwE1EL/gCCIG7z59JTtDM8c1K159m6FJACclsBr2egyGL+7Vkn4po=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 02:11:23.3958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0347c2-523f-45ba-4766-08d75114fa32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=WnLgaVsaIfA3o7Iyjfl7HOYrLzw01XOgkMge8v/GSZ/wwMSHLv1q2yax4SN9kP+qgZiazdcx2tHzt4d/r3nkbd9fUipWhU7akTucJXePk2F8I7rR8JIpsQXeIi5tt5Z0p9M5TjXcxmZMf+5H/Z4veVa72Zl/CuXEUbCtd/eqthg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=WnLgaVsaIfA3o7Iyjfl7HOYrLzw01XOgkMge8v/GSZ/wwMSHLv1q2yax4SN9kP+qgZiazdcx2tHzt4d/r3nkbd9fUipWhU7akTucJXePk2F8I7rR8JIpsQXeIi5tt5Z0p9M5TjXcxmZMf+5H/Z4veVa72Zl/CuXEUbCtd/eqthg=
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
L2tvbWVkYV9jcnRjLmMKaW5kZXggOWJlZWRhMDQ4MThiLi40MDZiOWQwY2EwNTggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTU5
MCw2ICs1OTAsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmttcywKIAogCWNydGMtPnBvcnQgPSBrY3J0Yy0+bWFzdGVyLT5vZl9vdXRwdXRfcG9y
dDsKIAorCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIHRydWUsIEtPTUVEQV9D
T0xPUl9MVVRfU0laRSk7CisKIAlyZXR1cm4gZXJyOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCBiMzIyZjUy
YmE4ZjIuLmM1YWI4MDk2Yzg1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
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
