Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31318A3363
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2EB6E10D;
	Fri, 30 Aug 2019 09:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20075.outbound.protection.outlook.com [40.107.2.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F94F6E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 09:09:13 +0000 (UTC)
Received: from VI1PR08CA0112.eurprd08.prod.outlook.com (2603:10a6:800:d4::14)
 by VE1PR08MB4960.eurprd08.prod.outlook.com (2603:10a6:803:110::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 09:09:10 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by VI1PR08CA0112.outlook.office365.com
 (2603:10a6:800:d4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 09:09:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:09:08 +0000
Received: ("Tessian outbound 802e738ad7e5:v27");
 Fri, 30 Aug 2019 09:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29a1aae052f60139
X-CR-MTA-TID: 64aa7808
Received: from 86692351870f.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5CCDC1CC-EB91-48FD-92CB-D5E6C6C9D874.1; 
 Fri, 30 Aug 2019 09:08:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86692351870f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Aug 2019 09:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlheBtf8ZWHJ2Hw7JPvGvCWWluQu9Ly6Igfkq2nLgEOppSxRQomePm9jaLczAkwG8W3vuRgtvs+n67usfUQpHz99FGplLtnQW9WGwkP/P5ADSQbPTKY1tVV17VMWVFzn8CylxSdTzy8jtMRMTILCndViO1iM3TVsJdEJIkJt9vB35tBYaZUHjlsySPnLmEzOowFDP4gDLZpjIfNVHS8tmnZWYkKzrE8/z3/ag1Hk6OLhTutaTsDErUZ1yYf8aMSrR9NF/79h4kvGqjlAt6FRY6sCiRZcEbvDsYlFXqzlCh5xfkpoMiP1IiKy1HNVNNpQ+bP/76JM5Ni6D+s8VodA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpIUF80gtFUGjYDne1JE3vRJP7DQx8AxPmhShOu2w1k=;
 b=WzeXXpQIsUdaPtRUPjBp+u3OO2HIYkSEQj4VayfZTi2wmLbWTxl+DY3664K3OSj/XWzTh7MEA/j6tUbyt4g3pbLCoQIfFpmf/FFLRpW3PkORNDcVQiwy43jgOTDX4J7EaEcyxtomfQjYXhceBto/FbDf525yRSVr8sUMqi44Z7w5eOgm7iG107T7ERHJCwMbHtsMKijD97HMOlSCCvfB7ESS44QIt4ggWfeArZ/KOIzrwWaVw1D5yolnpMszCQhiXeSYC3byGfsB07slf6jARJUoy1Znf+nNfMuRUvTlYwu/5Xvf7paEBhzuYat9Y27xxlMkcondsX93dgWhRfmi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3968.eurprd08.prod.outlook.com (20.178.125.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 09:08:57 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 09:08:57 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 1/2] drm/komeda: Add line size support
Thread-Topic: [PATCH v1 1/2] drm/komeda: Add line size support
Thread-Index: AQHVXxKN6AaTkpDpcEmDMqAZzHd17w==
Date: Fri, 30 Aug 2019 09:08:56 +0000
Message-ID: <20190830090835.8747-2-lowry.li@arm.com>
References: <20190830090835.8747-1-lowry.li@arm.com>
In-Reply-To: <20190830090835.8747-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::14) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51a9fa18-cfe8-4d37-ca15-08d72d29b73f
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3968; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3968:|VI1PR08MB3968:|VE1PR08MB4960:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4960C190FDA58789766DB83E9FBD0@VE1PR08MB4960.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0145758B1D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(4326008)(66446008)(2616005)(25786009)(476003)(8676002)(2906002)(6436002)(2201001)(66556008)(81156014)(81166006)(64756008)(11346002)(99286004)(14454004)(66476007)(5660300002)(486006)(26005)(76176011)(50226002)(86362001)(7736002)(71200400001)(6636002)(66066001)(1076003)(66946007)(71190400001)(446003)(305945005)(186003)(53936002)(3846002)(6512007)(110136005)(6486002)(8936002)(2501003)(102836004)(316002)(54906003)(55236004)(478600001)(386003)(6506007)(52116002)(256004)(6116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3968;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: OACPd/AC25T7XvgY2Tk1Ovix+axpgzYcj6eLz3ukHp2aTdiBT1CdJxx3yaUd/kJpy51FX/XvoJuzdeUnuTzlu4/G/49fJ86T7FDlJMbcgQSuCEv4IKbzDLFafRZRMBZk7qthHz0xi7LkwySTrrbXf4575omCHyutoaAZttkNOXp3syduClb7ohL79Ei7JU/s0fwIV9d/aHSQcYeUgYn30TpF7yZT4rpXwd+7MRxHB2TF/BvtnY9Yq+g8O5fxiOxnHYR9tw31OnUBPRe+nqfSbD0SW3bX2Jh93FyHHZc4bRkkbEouf9zTZPxmyULZMfdrom4vs6oDrDDHYjv3rKDOyUoS0ECdOW2NrwTcKDNzywsBZwJn1KrbC9NtFnrlULv43ycEhUTjUZSB/TNZvDJyzEQVn1Q/lLhlC9hyZDBf7CM=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(199004)(189003)(76130400001)(2501003)(50226002)(102836004)(386003)(47776003)(23756003)(66066001)(186003)(6486002)(14454004)(81166006)(8676002)(8936002)(2201001)(6506007)(76176011)(54906003)(81156014)(50466002)(22756006)(26005)(1076003)(99286004)(316002)(7736002)(305945005)(110136005)(36906005)(86362001)(70206006)(486006)(36756003)(63350400001)(25786009)(6636002)(126002)(70586007)(336012)(4326008)(478600001)(476003)(63370400001)(356004)(3846002)(26826003)(2616005)(2906002)(6116002)(11346002)(6512007)(5660300002)(8746002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4960;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8ad5cdfa-d9f5-41aa-dade-08d72d29b00f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4960; 
NoDisclaimer: True
X-Forefront-PRVS: 0145758B1D
X-Microsoft-Antispam-Message-Info: JbakFAF5sThIHYJZHUHHrwFCqT1xGfZeHXGXoAo+SIAYbmEuYP9I1SIOsbeSXxBO14Fi6llyaiag5JXzi/DJrsxKOo7iSMjyShpa6S6cVeDGKUgbEoQMEQvT69JdTk9fSpjNbiS0nzcF8fI8skCRn4AkX6gNk+is3rUbTDAHXx1q84xTR28lY5XAnbbv5hG1GsZEkTzOaJbXsezNUFDPtOYaWh/f+aIlPrgHd5WQcnzQ/DckadCoatSV5aaP86IJEloyTMI8WG5+vSEWj3m9TAgwnRIKTL821gNh/NTsrnlzenUEdBiT5AnF35O3LPaUWHFEZ6shuZ4Q87IisNm5bspzLvb27Ll+7FHjJrGOnE/MbxdYIk1HlRykCUS74TRy0WQuvoWV7WiyZWHfElcj9UQkrjqmuzSQXud7U+oRPDM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:09:08.5873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a9fa18-cfe8-4d37-ca15-08d72d29b73f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4960
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpIUF80gtFUGjYDne1JE3vRJP7DQx8AxPmhShOu2w1k=;
 b=9X89ydxuQxASrun1aPT6NDR9vslCFk2ASg51fRAqYrUIstf7WR9f+29z8cVnJVkJk0i9W6S4nRC3OgYgo05t7k3sKI1sl5gGBnAuc6+sarNIFLNEYD1UB/IG0JUpu7o3SVLqcpJlB+M+OSgWZ3NwdJN4D1MDnAtQsrNbxZfaq8Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpIUF80gtFUGjYDne1JE3vRJP7DQx8AxPmhShOu2w1k=;
 b=9X89ydxuQxASrun1aPT6NDR9vslCFk2ASg51fRAqYrUIstf7WR9f+29z8cVnJVkJk0i9W6S4nRC3OgYgo05t7k3sKI1sl5gGBnAuc6+sarNIFLNEYD1UB/IG0JUpu7o3SVLqcpJlB+M+OSgWZ3NwdJN4D1MDnAtQsrNbxZfaq8Q=
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

T24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20gRDMyLCBldmVy
eQpjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0byBpbmRpY2F0ZSB0aGUgZmlm
byBzaXplLgoKU28gdGhpcyBwYXRjaCBpcyB0byBzZXQgbGluZSBzaXplIHN1cHBvcnQgYW5kIGRv
IHRoZSBsaW5lIHNpemUKY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDU2ICsrKysrKysrKysrKysrKystLS0KIC4uLi9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8ICA4ICstLQogLi4uL2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDIgKwogLi4uL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTcgKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpp
bmRleCBjOTg1OTMyOTU0Y2IuLmE1NmRjNTZhNzJmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtMTE2LDYg
KzExNiwyMyBAQCBzdGF0aWMgdm9pZCBkdW1wX2Jsb2NrX2hlYWRlcihzdHJ1Y3Qgc2VxX2ZpbGUg
KnNmLCB2b2lkIF9faW9tZW0gKnJlZykKIAkJCSAgIGksIGhkci5vdXRwdXRfaWRzW2ldKTsKIH0K
IAorLyogT24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20gRDMy
LCBldmVyeSBjb21wb25lbnQgaGF2ZQorICogYSBsaW5lIHNpemUgcmVnaXN0ZXIgdG8gaW5kaWNh
dGUgdGhlIGZpZm8gc2l6ZS4KKyAqLworc3RhdGljIHUzMiBfX2dldF9ibGtfbGluZV9zaXplKHN0
cnVjdCBkNzFfZGV2ICpkNzEsIHUzMiBfX2lvbWVtICpyZWcsCisJCQkgICAgICAgdTMyIG1heF9k
ZWZhdWx0KQoreworCWlmICghZDcxLT5wZXJpcGhfYWRkcikKKwkJbWF4X2RlZmF1bHQgPSBtYWxp
ZHBfcmVhZDMyKHJlZywgQkxLX01BWF9MSU5FX1NJWkUpOworCisJcmV0dXJuIG1heF9kZWZhdWx0
OworfQorCitzdGF0aWMgdTMyIGdldF9ibGtfbGluZV9zaXplKHN0cnVjdCBkNzFfZGV2ICpkNzEs
IHUzMiBfX2lvbWVtICpyZWcpCit7CisJcmV0dXJuIF9fZ2V0X2Jsa19saW5lX3NpemUoZDcxLCBy
ZWcsIGQ3MS0+bWF4X2xpbmVfc2l6ZSk7Cit9CisKIHN0YXRpYyB1MzIgdG9fcm90X2N0cmwodTMy
IHJvdCkKIHsKIAl1MzIgbHJfY3RybCA9IDA7CkBAIC00MjMsNyArNDQwLDI3IEBAIHN0YXRpYyBp
bnQgZDcxX2xheWVyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAkJbGF5ZXItPmNvbG9yX21n
ci5mZ2FtbWFfbWdyID0gZDcxLT5nbGJfbHRfbWdyOwogCX0KIAotCXNldF9yYW5nZSgmbGF5ZXIt
PmhzaXplX2luLCA0LCBkNzEtPm1heF9saW5lX3NpemUpOworCWlmICghZDcxLT5wZXJpcGhfYWRk
cikgeworCQkvKiBEMzIgb3IgbmV3ZXIgcHJvZHVjdCAqLworCQlsYXllci0+bGluZV9zeiA9IG1h
bGlkcF9yZWFkMzIocmVnLCBCTEtfTUFYX0xJTkVfU0laRSk7CisJCWxheWVyLT55dXZfbGluZV9z
eiA9IExfSU5GT19ZVVZfTUFYX0xJTkVTWihsYXllcl9pbmZvKTsKKwl9IGVsc2UgaWYgKGQ3MS0+
bWF4X2xpbmVfc2l6ZSA+IDIwNDgpIHsKKwkJLyogRDcxIDRLICovCisJCWxheWVyLT5saW5lX3N6
ID0gZDcxLT5tYXhfbGluZV9zaXplOworCQlsYXllci0+eXV2X2xpbmVfc3ogPSBsYXllci0+bGlu
ZV9zeiAvIDI7CisJfSBlbHNlICB7CisJCS8qIEQ3MSAySyAqLworCQlpZiAobGF5ZXItPmxheWVy
X3R5cGUgPT0gS09NRURBX0ZNVF9SSUNIX0xBWUVSKSB7CisJCQkvKiByaWNoIGxheWVyIGlzIDRL
IGNvbmZpZ3VyYXRpb24gKi8KKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9zaXpl
ICogMjsKKwkJCWxheWVyLT55dXZfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKwkJfSBl
bHNlIHsKKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9zaXplOworCQkJbGF5ZXIt
Pnl1dl9saW5lX3N6ID0gMDsKKwkJfQorCX0KKworCXNldF9yYW5nZSgmbGF5ZXItPmhzaXplX2lu
LCA0LCBsYXllci0+bGluZV9zeik7CiAJc2V0X3JhbmdlKCZsYXllci0+dnNpemVfaW4sIDQsIGQ3
MS0+bWF4X3ZzaXplKTsKIAogCW1hbGlkcF93cml0ZTMyKHJlZywgTEFZRVJfUEFMUEhBLCBENzFf
UEFMUEhBX0RFRl9NQVApOwpAQCAtNjc2LDkgKzcxMywxMSBAQCBzdGF0aWMgaW50IGQ3MV93Yl9s
YXllcl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiAKIAl3Yl9sYXllciA9IHRvX2xheWVyKGMp
OwogCXdiX2xheWVyLT5sYXllcl90eXBlID0gS09NRURBX0ZNVF9XQl9MQVlFUjsKKwl3Yl9sYXll
ci0+bGluZV9zeiA9IGdldF9ibGtfbGluZV9zaXplKGQ3MSwgcmVnKTsKKwl3Yl9sYXllci0+eXV2
X2xpbmVfc3ogPSB3Yl9sYXllci0+bGluZV9zejsKIAotCXNldF9yYW5nZSgmd2JfbGF5ZXItPmhz
aXplX2luLCBENzFfTUlOX0xJTkVfU0laRSwgZDcxLT5tYXhfbGluZV9zaXplKTsKLQlzZXRfcmFu
Z2UoJndiX2xheWVyLT52c2l6ZV9pbiwgRDcxX01JTl9WRVJUSUNBTF9TSVpFLCBkNzEtPm1heF92
c2l6ZSk7CisJc2V0X3JhbmdlKCZ3Yl9sYXllci0+aHNpemVfaW4sIDY0LCB3Yl9sYXllci0+bGlu
ZV9zeik7CisJc2V0X3JhbmdlKCZ3Yl9sYXllci0+dnNpemVfaW4sIDY0LCBkNzEtPm1heF92c2l6
ZSk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTgyMiw4ICs4NjEsOCBAQCBzdGF0aWMgaW50IGQ3MV9j
b21waXpfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLAogCWlmIChrb21lZGFfcHJvZHVjdF9tYXRj
aChkNzEtPm1kZXYsIE1BTElEUF9ENzdfUFJPRFVDVF9JRCkpCiAJCWNvbXBpei0+c3VwcG9ydF9j
aGFubmVsX3NjYWxpbmcgPSB0cnVlOwogCi0Jc2V0X3JhbmdlKCZjb21waXotPmhzaXplLCBENzFf
TUlOX0xJTkVfU0laRSwgZDcxLT5tYXhfbGluZV9zaXplKTsKLQlzZXRfcmFuZ2UoJmNvbXBpei0+
dnNpemUsIEQ3MV9NSU5fVkVSVElDQUxfU0laRSwgZDcxLT5tYXhfdnNpemUpOworCXNldF9yYW5n
ZSgmY29tcGl6LT5oc2l6ZSwgNjQsIGdldF9ibGtfbGluZV9zaXplKGQ3MSwgcmVnKSk7CisJc2V0
X3JhbmdlKCZjb21waXotPnZzaXplLCA2NCwgZDcxLT5tYXhfdnNpemUpOwogCiAJcmV0dXJuIDA7
CiB9CkBAIC05ODAsNyArMTAxOSw3IEBAIHN0YXRpYyBpbnQgZDcxX3NjYWxlcl9pbml0KHN0cnVj
dCBkNzFfZGV2ICpkNzEsCiAJfQogCiAJc2NhbGVyID0gdG9fc2NhbGVyKGMpOwotCXNldF9yYW5n
ZSgmc2NhbGVyLT5oc2l6ZSwgNCwgMjA0OCk7CisJc2V0X3JhbmdlKCZzY2FsZXItPmhzaXplLCA0
LCBfX2dldF9ibGtfbGluZV9zaXplKGQ3MSwgcmVnLCAyMDQ4KSk7CiAJc2V0X3JhbmdlKCZzY2Fs
ZXItPnZzaXplLCA0LCA0MDk2KTsKIAlzY2FsZXItPm1heF9kb3duc2NhbGluZyA9IDY7CiAJc2Nh
bGVyLT5tYXhfdXBzY2FsaW5nID0gNjQ7CkBAIC0xMDg5LDcgKzExMjgsNyBAQCBzdGF0aWMgaW50
IGQ3MV9zcGxpdHRlcl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiAKIAlzcGxpdHRlciA9IHRv
X3NwbGl0dGVyKGMpOwogCi0Jc2V0X3JhbmdlKCZzcGxpdHRlci0+aHNpemUsIDQsIGQ3MS0+bWF4
X2xpbmVfc2l6ZSk7CisJc2V0X3JhbmdlKCZzcGxpdHRlci0+aHNpemUsIDQsIGdldF9ibGtfbGlu
ZV9zaXplKGQ3MSwgcmVnKSk7CiAJc2V0X3JhbmdlKCZzcGxpdHRlci0+dnNpemUsIDQsIGQ3MS0+
bWF4X3ZzaXplKTsKIAogCXJldHVybiAwOwpAQCAtMTI0MCw3ICsxMjc5LDggQEAgc3RhdGljIGlu
dCBkNzFfbWVyZ2VyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAogCW1lcmdlciA9IHRvX21l
cmdlcihjKTsKIAotCXNldF9yYW5nZSgmbWVyZ2VyLT5oc2l6ZV9tZXJnZWQsIDQsIDQwMzIpOwor
CXNldF9yYW5nZSgmbWVyZ2VyLT5oc2l6ZV9tZXJnZWQsIDQsCisJCSAgX19nZXRfYmxrX2xpbmVf
c2l6ZShkNzEsIHJlZywgNDAzMikpOwogCXNldF9yYW5nZSgmbWVyZ2VyLT52c2l6ZV9tZXJnZWQs
IDQsIDQwOTYpOwogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAppbmRleCBjMWJlNDU5NGJjOTIuLmE1ODM4OWU2MjNi
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X3JlZ3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
cmVncy5oCkBAIC0zNDAsNiArMzQwLDcgQEAKICNkZWZpbmUgTF9JTkZPX1JGCQlCSVQoMCkKICNk
ZWZpbmUgTF9JTkZPX0NNCQlCSVQoMSkKICNkZWZpbmUgTF9JTkZPX0FCVUZfU0laRSh4KQkoKCh4
KSA+PiA0KSAmIDB4NykKKyNkZWZpbmUgTF9JTkZPX1lVVl9NQVhfTElORVNaKHgpCSgoKHgpID4+
IDE2KSAmIDB4RkZGRikKIAogLyogU2NhbGVyIHJlZ2lzdGVycyAqLwogI2RlZmluZSBTQ19DT0VG
RlRBQgkJMHgwREMKQEAgLTU3MCwxMyArNTcxLDYgQEAgZW51bSBkNzFfYmxrX3R5cGUgewogI2Rl
ZmluZSBENzFfREVGQVVMVF9QUkVQUkVUQ0hfTElORQk1CiAjZGVmaW5lIEQ3MV9CVVNfV0lEVEhf
MTZfQllURVMJCTE2CiAKLSNkZWZpbmUgRDcxX01JTl9MSU5FX1NJWkUJCTY0Ci0jZGVmaW5lIEQ3
MV9NSU5fVkVSVElDQUxfU0laRQkJNjQKLSNkZWZpbmUgRDcxX1NDX01JTl9MSU5fU0laRQkJNAot
I2RlZmluZSBENzFfU0NfTUlOX1ZFUlRJQ0FMX1NJWkUJNAotI2RlZmluZSBENzFfU0NfTUFYX0xJ
Tl9TSVpFCQkyMDQ4Ci0jZGVmaW5lIEQ3MV9TQ19NQVhfVkVSVElDQUxfU0laRQk0MDk2Ci0KICNk
ZWZpbmUgRDcxX1NDX01BWF9VUFNDQUxJTkcJCTY0CiAjZGVmaW5lIEQ3MV9TQ19NQVhfRE9XTlND
QUxJTkcJCTYKICNkZWZpbmUgRDcxX1NDX1NQTElUX09WRVJMQVAJCTgKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCmluZGV4IDlm
ZTU2MjQxNzJlZS4uMzFkMzkyMzg5NTY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKQEAgLTI0Niw2ICsyNDYsOCBAQCBz
dHJ1Y3Qga29tZWRhX2xheWVyIHsKIAlzdHJ1Y3QgbWFsaWRwX3JhbmdlIGhzaXplX2luLCB2c2l6
ZV9pbjsKIAlzdHJ1Y3Qga29tZWRhX2NvbG9yX21hbmFnZXIgY29sb3JfbWdyOwogCXUzMiBsYXll
cl90eXBlOyAvKiBSSUNILCBTSU1QTEUgb3IgV0IgKi8KKwl1MzIgbGluZV9zejsKKwl1MzIgeXV2
X2xpbmVfc3o7IC8qIG1heGltdW0gbGluZSBzaXplIGZvciBZVVY0MjIgYW5kIFlVVjQyMCAqLwog
CXUzMiBzdXBwb3J0ZWRfcm90czsKIAkvKiBrb21lZGEgc3VwcG9ydHMgbGF5ZXIgc3BsaXQgd2hp
Y2ggc3BsaXRzIGEgd2hvbGUgaW1hZ2UgdG8gdHdvIHBhcnRzCiAJICogbGVmdCBhbmQgcmlnaHQg
YW5kIGhhbmRsZSB0aGVtIGJ5IHR3byBpbmRpdmlkdWFsIGxheWVyIHByb2Nlc3NvcnMKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5l
X3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jCmluZGV4IDY5NzRjNGUwODFiZi4uOTU3YzFjMDFjYTc4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMKQEAgLTMyMyw2ICszMjMsNyBAQCBrb21lZGFfbGF5ZXJfY2hlY2tfY2ZnKHN0
cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyLAogCQkgICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zs
b3dfY2ZnICpkZmxvdykKIHsKIAl1MzIgc3JjX3gsIHNyY195LCBzcmNfdywgc3JjX2g7CisJdTMy
IGxpbmVfc3osIG1heF9saW5lX3N6OwogCiAJaWYgKCFrb21lZGFfZmJfaXNfbGF5ZXJfc3VwcG9y
dGVkKGtmYiwgbGF5ZXItPmxheWVyX3R5cGUsIGRmbG93LT5yb3QpKQogCQlyZXR1cm4gLUVJTlZB
TDsKQEAgLTM1Miw2ICszNTMsMjIgQEAga29tZWRhX2xheWVyX2NoZWNrX2NmZyhzdHJ1Y3Qga29t
ZWRhX2xheWVyICpsYXllciwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJaWYgKGRybV9yb3Rh
dGlvbl85MF9vcl8yNzAoZGZsb3ctPnJvdCkpCisJCWxpbmVfc3ogPSBkZmxvdy0+aW5faDsKKwll
bHNlCisJCWxpbmVfc3ogPSBkZmxvdy0+aW5fdzsKKworCWlmIChrZmItPmJhc2UuZm9ybWF0LT5o
c3ViID4gMSkKKwkJbWF4X2xpbmVfc3ogPSBsYXllci0+eXV2X2xpbmVfc3o7CisJZWxzZQorCQlt
YXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6OworCisJaWYgKGxpbmVfc3ogPiBtYXhfbGluZV9z
eikgeworCQlEUk1fREVCVUdfQVRPTUlDKCJSZXF1aXJlZCBsaW5lX3N6OiAlZCBleGNlZWRzIHRo
ZSBtYXggc2l6ZSAlZFxuIiwKKwkJCQkgbGluZV9zeiwgbWF4X2xpbmVfc3opOworCQlyZXR1cm4g
LUVJTlZBTDsKKwl9CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
