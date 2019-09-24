Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B711BC3A1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 10:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8D898A4;
	Tue, 24 Sep 2019 08:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10071.outbound.protection.outlook.com [40.107.1.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB1F898A4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 08:01:01 +0000 (UTC)
Received: from VI1PR08CA0115.eurprd08.prod.outlook.com (2603:10a6:800:d4::17)
 by DB7PR08MB3402.eurprd08.prod.outlook.com (2603:10a6:10:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Tue, 24 Sep
 2019 08:00:57 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by VI1PR08CA0115.outlook.office365.com
 (2603:10a6:800:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Tue, 24 Sep 2019 08:00:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 08:00:55 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Tue, 24 Sep 2019 08:00:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2ba5f72bd12ec55
X-CR-MTA-TID: 64aa7808
Received: from cbd30309ad05.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74A75B4E-7C87-40A7-995F-A565BBE71447.1; 
 Tue, 24 Sep 2019 08:00:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbd30309ad05.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 24 Sep 2019 08:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly8vMuIAdhNWnoadUmVGNC8KYN8kalQwH8z3S8tPeR7o/9r7FO5aZ0VJz+y5WKeDtUkH339u6KIzhriLR5EEf69SwaS/T1jBACDXwTxwJPZkctA6l1+fZbq7f5mH46G7yz6XvgH8nqbcLvPava2JrNaB3ksZDX07xJwXC0XBs1FRFixKUkrAoUVQrRGOJlQbelMb+7hkB7cIlPmoAa4gEsbfk3wgZRjrlWAlUxlEHecuopVL4hDMZGpfcsEQiP2CJC/ARIPZ0TG0i1v0oPJhVdbO67M5buSqhqjf7xlkuxPQRtU5zytsN2nBWK8j2RIYQ0ipmmbBQg7K1RxpNFAcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=R/GbytrfuNklNs2St73zPS8JQb39VWYW64g0YRtwyt/JlqmG33uL24plhsMYO35Pg6rWzFMvgdOn7xiLzJF16SpkZmHcEGplxSZxMPJfyH3BR2Ype40tf/OIwnb7QcZUHuoLw51IBHVdoJNE05b3cNT3HsmPAUGlVK3OnJdBhZ9+D6pCfjeqTVrTNGe5LvRuiJMCNLW7DqTO/eLoNR8MEgvBKBavwRjCnrlm52mVWpwMdNd3zUpnetPAH1hagDn86z3t/Bg1j9Q4wmeqKPNq9oqvhm6lvG2xspYvmgcIdiHOACLu9c53MPADjNq32rGEiWo6mNrQ/4MphW8A3ivG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3165.eurprd08.prod.outlook.com (52.133.15.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 24 Sep 2019 08:00:44 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:00:44 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 1/2] drm/komeda: Add line size support
Thread-Topic: [PATCH v2 1/2] drm/komeda: Add line size support
Thread-Index: AQHVcq4qSU8pTvlChUyRI22n1SYZCA==
Date: Tue, 24 Sep 2019 08:00:44 +0000
Message-ID: <20190924080022.19250-2-lowry.li@arm.com>
References: <20190924080022.19250-1-lowry.li@arm.com>
In-Reply-To: <20190924080022.19250-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::34) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1c364977-3a79-4df1-a7be-08d740c55420
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3165; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3165:|VI1PR08MB3165:|DB7PR08MB3402:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3402AFE50C0A595DD721D0559F840@DB7PR08MB3402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(186003)(54906003)(81166006)(81156014)(71190400001)(8676002)(4326008)(11346002)(446003)(99286004)(14454004)(110136005)(66066001)(66946007)(66556008)(25786009)(66446008)(76176011)(26005)(486006)(66476007)(478600001)(316002)(64756008)(8936002)(7736002)(52116002)(36756003)(50226002)(476003)(2616005)(5660300002)(6116002)(2201001)(6512007)(86362001)(6436002)(102836004)(3846002)(256004)(6636002)(55236004)(1076003)(2501003)(305945005)(386003)(2906002)(6486002)(71200400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3165;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: N9doEqZTz2A9tgzd+9OPryBH030Mw51WN9jA59+gPk25ZTCp4Nlu9/BJP8N1yosA+cn8erCEz+yEbUtra3jeZTPQjtxO6O3wKHg75zdORaWN1f5PALBkf+X4q8ZQmF4TuRqwXPMU/PitV7Uuvu8VTKQm4LCdBZKx2yLPRUSDoTLDuOYsJGrW9Oy+mn23dSZR+I8D2yp35xeNsVekq8OfS/zBS9bmVGGRGzL/RvqhJSXyNEn4V0s43JTHC5F9Ri7KCEfMNU+oHkklrpMJkKpVDHR9tirvoQZV3JVpet4/SFF8n5f67qHrvizKt57avHHYFOR90+6FNqh/Ke4Jh/Akna+YMZfHJrj2zPImzfD/CiAnq8rag/tYQks5kLzOaUV/d+ev8bQ8Grb22AI5bjWrypeiZCJ01/qTygM/hC0HVgg=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3165
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(486006)(476003)(22756006)(126002)(66066001)(6512007)(186003)(8936002)(81156014)(81166006)(4326008)(8676002)(50226002)(6486002)(26826003)(3846002)(50466002)(47776003)(86362001)(478600001)(14454004)(76130400001)(36756003)(8746002)(25786009)(70206006)(102836004)(26005)(386003)(110136005)(54906003)(36906005)(316002)(5660300002)(6636002)(1076003)(356004)(99286004)(336012)(305945005)(6506007)(2201001)(70586007)(7736002)(23756003)(2501003)(2906002)(6116002)(2616005)(76176011)(63350400001)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3402;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f28dee7-f4e9-48b2-65bb-08d740c54d27
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB3402; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: h0t6IYLRWSQ/9PNi3lll6gKId4/ULdsqGlW/qP4kZcX+y0zRq4Yhug6X1WyLKhRHs7MJr4Ut4bQ7I88D1dCo47Povb01EP/ge1kIT6oWNiwJzIAHy+YBUAi0HgLVVxhqGeOLy60A38obsuRxKuouJFS8KwLCw8mDNq8l5A5xw1WZgTD1V6/05O4IwYFNkE1jZQuV6/TUoHWiASQ5FqyMvwOAthgSRwzEBdom49iQS5nJLGeNv0u5LKK9RXObcYZax9Go4wh0fzQKu1S/xAxE7WR163+YJHYWOGlx0FVx5x7v2kcmGB1ZyaJqrbQUVrFFEbuVPavIWckmGImP5y4sT7EYFIePJd0E8tUu5IXPpT+TtdJ/xSOMlcO9N/MATTm1PryKT4UD2eNARCPjzyqaY3bA2z9gfQ4WgjDGC5TeldA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 08:00:55.8974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c364977-3a79-4df1-a7be-08d740c55420
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=jOihrVVu7bg/+/wHTfQcvbaih6K0+RR41eLHIjOwNdX8fDxrY/RvfhlVHhZnjYL/y9B7PTJan019TzJ3VAU5OI+QO5ZwotXNlwJipsR8Lzpq8o3igalRpm6hKLHw4bV4L9hHbVYxXT7uqIkCgu9JCmrxXF218uuod2+vCu6wp4k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=jOihrVVu7bg/+/wHTfQcvbaih6K0+RR41eLHIjOwNdX8fDxrY/RvfhlVHhZnjYL/y9B7PTJan019TzJ3VAU5OI+QO5ZwotXNlwJipsR8Lzpq8o3igalRpm6hKLHw4bV4L9hHbVYxXT7uqIkCgu9JCmrxXF218uuod2+vCu6wp4k=
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
PgoKT24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20gRDMyLCBl
dmVyeQpjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0byBpbmRpY2F0ZSB0aGUg
ZmlmbyBzaXplLgoKU28gdGhpcyBwYXRjaCBpcyB0byBzZXQgbGluZSBzaXplIHN1cHBvcnQgYW5k
IGRvIHRoZSBsaW5lIHNpemUKY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0vZGlzcGxheS9r
b21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDU3ICsrKysrKysrKysrKysrKystLS0KIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8ICA5ICstLQogLi4u
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDIgKwogLi4uL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTcgKysrKysrCiA0IGZp
bGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YwppbmRleCA3YjM3NGEzYjkxMWUuLjM1NzgzN2I5ZDZlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtMTA2
LDYgKzEwNiwyMyBAQCBzdGF0aWMgdm9pZCBkdW1wX2Jsb2NrX2hlYWRlcihzdHJ1Y3Qgc2VxX2Zp
bGUgKnNmLCB2b2lkIF9faW9tZW0gKnJlZykKIAkJCSAgIGksIGhkci5vdXRwdXRfaWRzW2ldKTsK
IH0KIAorLyogT24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20g
RDMyLCBldmVyeSBjb21wb25lbnQgaGF2ZQorICogYSBsaW5lIHNpemUgcmVnaXN0ZXIgdG8gaW5k
aWNhdGUgdGhlIGZpZm8gc2l6ZS4KKyAqLworc3RhdGljIHUzMiBfX2dldF9ibGtfbGluZV9zaXpl
KHN0cnVjdCBkNzFfZGV2ICpkNzEsIHUzMiBfX2lvbWVtICpyZWcsCisJCQkgICAgICAgdTMyIG1h
eF9kZWZhdWx0KQoreworCWlmICghZDcxLT5wZXJpcGhfYWRkcikKKwkJbWF4X2RlZmF1bHQgPSBt
YWxpZHBfcmVhZDMyKHJlZywgQkxLX01BWF9MSU5FX1NJWkUpOworCisJcmV0dXJuIG1heF9kZWZh
dWx0OworfQorCitzdGF0aWMgdTMyIGdldF9ibGtfbGluZV9zaXplKHN0cnVjdCBkNzFfZGV2ICpk
NzEsIHUzMiBfX2lvbWVtICpyZWcpCit7CisJcmV0dXJuIF9fZ2V0X2Jsa19saW5lX3NpemUoZDcx
LCByZWcsIGQ3MS0+bWF4X2xpbmVfc2l6ZSk7Cit9CisKIHN0YXRpYyB1MzIgdG9fcm90X2N0cmwo
dTMyIHJvdCkKIHsKIAl1MzIgbHJfY3RybCA9IDA7CkBAIC0zNjUsNyArMzgyLDI4IEBAIHN0YXRp
YyBpbnQgZDcxX2xheWVyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAllbHNlCiAJCWxheWVy
LT5sYXllcl90eXBlID0gS09NRURBX0ZNVF9TSU1QTEVfTEFZRVI7CiAKLQlzZXRfcmFuZ2UoJmxh
eWVyLT5oc2l6ZV9pbiwgNCwgZDcxLT5tYXhfbGluZV9zaXplKTsKKwlpZiAoIWQ3MS0+cGVyaXBo
X2FkZHIpIHsKKwkJLyogRDMyIG9yIG5ld2VyIHByb2R1Y3QgKi8KKwkJbGF5ZXItPmxpbmVfc3og
PSBtYWxpZHBfcmVhZDMyKHJlZywgQkxLX01BWF9MSU5FX1NJWkUpOworCQlsYXllci0+eXV2X2xp
bmVfc3ogPSBMX0lORk9fWVVWX01BWF9MSU5FU1oobGF5ZXJfaW5mbyk7CisJfSBlbHNlIGlmIChk
NzEtPm1heF9saW5lX3NpemUgPiAyMDQ4KSB7CisJCS8qIEQ3MSA0SyAqLworCQlsYXllci0+bGlu
ZV9zeiA9IGQ3MS0+bWF4X2xpbmVfc2l6ZTsKKwkJbGF5ZXItPnl1dl9saW5lX3N6ID0gbGF5ZXIt
PmxpbmVfc3ogLyAyOworCX0gZWxzZQl7CisJCS8qIEQ3MSAySyAqLworCQlpZiAobGF5ZXItPmxh
eWVyX3R5cGUgPT0gS09NRURBX0ZNVF9SSUNIX0xBWUVSKSB7CisJCQkvKiByaWNoIGxheWVyIGlz
IDRLIGNvbmZpZ3VyYXRpb24gKi8KKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9z
aXplICogMjsKKwkJCWxheWVyLT55dXZfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKwkJ
fSBlbHNlIHsKKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9zaXplOworCQkJbGF5
ZXItPnl1dl9saW5lX3N6ID0gMDsKKwkJfQorCX0KKworCXNldF9yYW5nZSgmbGF5ZXItPmhzaXpl
X2luLCA0LCBsYXllci0+bGluZV9zeik7CisKIAlzZXRfcmFuZ2UoJmxheWVyLT52c2l6ZV9pbiwg
NCwgZDcxLT5tYXhfdnNpemUpOwogCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBMQVlFUl9QQUxQSEEs
IEQ3MV9QQUxQSEFfREVGX01BUCk7CkBAIC00NTYsOSArNDk0LDExIEBAIHN0YXRpYyBpbnQgZDcx
X3diX2xheWVyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAogCXdiX2xheWVyID0gdG9fbGF5
ZXIoYyk7CiAJd2JfbGF5ZXItPmxheWVyX3R5cGUgPSBLT01FREFfRk1UX1dCX0xBWUVSOworCXdi
X2xheWVyLT5saW5lX3N6ID0gZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpOworCXdiX2xheWVy
LT55dXZfbGluZV9zeiA9IHdiX2xheWVyLT5saW5lX3N6OwogCi0Jc2V0X3JhbmdlKCZ3Yl9sYXll
ci0+aHNpemVfaW4sIEQ3MV9NSU5fTElORV9TSVpFLCBkNzEtPm1heF9saW5lX3NpemUpOwotCXNl
dF9yYW5nZSgmd2JfbGF5ZXItPnZzaXplX2luLCBENzFfTUlOX1ZFUlRJQ0FMX1NJWkUsIGQ3MS0+
bWF4X3ZzaXplKTsKKwlzZXRfcmFuZ2UoJndiX2xheWVyLT5oc2l6ZV9pbiwgNjQsIHdiX2xheWVy
LT5saW5lX3N6KTsKKwlzZXRfcmFuZ2UoJndiX2xheWVyLT52c2l6ZV9pbiwgNjQsIGQ3MS0+bWF4
X3ZzaXplKTsKIAogCXJldHVybiAwOwogfQpAQCAtNTk1LDggKzYzNSw4IEBAIHN0YXRpYyBpbnQg
ZDcxX2NvbXBpel9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiAKIAljb21waXogPSB0b19jb21w
aXooYyk7CiAKLQlzZXRfcmFuZ2UoJmNvbXBpei0+aHNpemUsIEQ3MV9NSU5fTElORV9TSVpFLCBk
NzEtPm1heF9saW5lX3NpemUpOwotCXNldF9yYW5nZSgmY29tcGl6LT52c2l6ZSwgRDcxX01JTl9W
RVJUSUNBTF9TSVpFLCBkNzEtPm1heF92c2l6ZSk7CisJc2V0X3JhbmdlKCZjb21waXotPmhzaXpl
LCA2NCwgZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpKTsKKwlzZXRfcmFuZ2UoJmNvbXBpei0+
dnNpemUsIDY0LCBkNzEtPm1heF92c2l6ZSk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTc1Myw3ICs3
OTMsNyBAQCBzdGF0aWMgaW50IGQ3MV9zY2FsZXJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLAog
CX0KIAogCXNjYWxlciA9IHRvX3NjYWxlcihjKTsKLQlzZXRfcmFuZ2UoJnNjYWxlci0+aHNpemUs
IDQsIDIwNDgpOworCXNldF9yYW5nZSgmc2NhbGVyLT5oc2l6ZSwgNCwgX19nZXRfYmxrX2xpbmVf
c2l6ZShkNzEsIHJlZywgMjA0OCkpOwogCXNldF9yYW5nZSgmc2NhbGVyLT52c2l6ZSwgNCwgNDA5
Nik7CiAJc2NhbGVyLT5tYXhfZG93bnNjYWxpbmcgPSA2OwogCXNjYWxlci0+bWF4X3Vwc2NhbGlu
ZyA9IDY0OwpAQCAtODYyLDcgKzkwMiw3IEBAIHN0YXRpYyBpbnQgZDcxX3NwbGl0dGVyX2luaXQo
c3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAogCXNwbGl0dGVyID0gdG9fc3BsaXR0ZXIoYyk7CiAKLQlz
ZXRfcmFuZ2UoJnNwbGl0dGVyLT5oc2l6ZSwgNCwgZDcxLT5tYXhfbGluZV9zaXplKTsKKwlzZXRf
cmFuZ2UoJnNwbGl0dGVyLT5oc2l6ZSwgNCwgZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpKTsK
IAlzZXRfcmFuZ2UoJnNwbGl0dGVyLT52c2l6ZSwgNCwgZDcxLT5tYXhfdnNpemUpOwogCiAJcmV0
dXJuIDA7CkBAIC05MzMsNyArOTczLDggQEAgc3RhdGljIGludCBkNzFfbWVyZ2VyX2luaXQoc3Ry
dWN0IGQ3MV9kZXYgKmQ3MSwKIAogCW1lcmdlciA9IHRvX21lcmdlcihjKTsKIAotCXNldF9yYW5n
ZSgmbWVyZ2VyLT5oc2l6ZV9tZXJnZWQsIDQsIDQwMzIpOworCXNldF9yYW5nZSgmbWVyZ2VyLT5o
c2l6ZV9tZXJnZWQsIDQsCisJCSAgX19nZXRfYmxrX2xpbmVfc2l6ZShkNzEsIHJlZywgNDAzMikp
OwogCXNldF9yYW5nZSgmbWVyZ2VyLT52c2l6ZV9tZXJnZWQsIDQsIDQwOTYpOwogCiAJcmV0dXJu
IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3Jl
Z3MuaAppbmRleCAyZDVlNmQwMGI0MmMuLjE3MjdkYzk5MzkwOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCkBAIC0xMCw2ICsxMCw3
IEBACiAvKiBDb21tb24gYmxvY2sgcmVnaXN0ZXJzIG9mZnNldCAqLwogI2RlZmluZSBCTEtfQkxP
Q0tfSU5GTwkJMHgwMDAKICNkZWZpbmUgQkxLX1BJUEVMSU5FX0lORk8JMHgwMDQKKyNkZWZpbmUg
QkxLX01BWF9MSU5FX1NJWkUJMHgwMDgKICNkZWZpbmUgQkxLX1ZBTElEX0lOUFVUX0lEMAkweDAy
MAogI2RlZmluZSBCTEtfT1VUUFVUX0lEMAkJMHgwNjAKICNkZWZpbmUgQkxLX0lOUFVUX0lEMAkJ
MHgwODAKQEAgLTMyMSw2ICszMjIsNyBAQAogI2RlZmluZSBMX0lORk9fUkYJCUJJVCgwKQogI2Rl
ZmluZSBMX0lORk9fQ00JCUJJVCgxKQogI2RlZmluZSBMX0lORk9fQUJVRl9TSVpFKHgpCSgoKHgp
ID4+IDQpICYgMHg3KQorI2RlZmluZSBMX0lORk9fWVVWX01BWF9MSU5FU1ooeCkJKCgoeCkgPj4g
MTYpICYgMHhGRkZGKQogCiAvKiBTY2FsZXIgcmVnaXN0ZXJzICovCiAjZGVmaW5lIFNDX0NPRUZG
VEFCCQkweDBEQwpAQCAtNDk0LDEzICs0OTYsNiBAQCBlbnVtIGQ3MV9ibGtfdHlwZSB7CiAjZGVm
aW5lIEQ3MV9ERUZBVUxUX1BSRVBSRVRDSF9MSU5FCTUKICNkZWZpbmUgRDcxX0JVU19XSURUSF8x
Nl9CWVRFUwkJMTYKIAotI2RlZmluZSBENzFfTUlOX0xJTkVfU0laRQkJNjQKLSNkZWZpbmUgRDcx
X01JTl9WRVJUSUNBTF9TSVpFCQk2NAotI2RlZmluZSBENzFfU0NfTUlOX0xJTl9TSVpFCQk0Ci0j
ZGVmaW5lIEQ3MV9TQ19NSU5fVkVSVElDQUxfU0laRQk0Ci0jZGVmaW5lIEQ3MV9TQ19NQVhfTElO
X1NJWkUJCTIwNDgKLSNkZWZpbmUgRDcxX1NDX01BWF9WRVJUSUNBTF9TSVpFCTQwOTYKLQogI2Rl
ZmluZSBENzFfU0NfTUFYX1VQU0NBTElORwkJNjQKICNkZWZpbmUgRDcxX1NDX01BWF9ET1dOU0NB
TElORwkJNgogI2RlZmluZSBENzFfU0NfU1BMSVRfT1ZFUkxBUAkJOApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKaW5kZXggOTEw
ZDI3OWFlNDhkLi45MmFiYTU4Y2UyYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAtMjI3LDYgKzIyNyw4IEBAIHN0
cnVjdCBrb21lZGFfbGF5ZXIgewogCS8qIGFjY2VwdGVkIGgvdiBpbnB1dCByYW5nZSBiZWZvcmUg
cm90YXRpb24gKi8KIAlzdHJ1Y3QgbWFsaWRwX3JhbmdlIGhzaXplX2luLCB2c2l6ZV9pbjsKIAl1
MzIgbGF5ZXJfdHlwZTsgLyogUklDSCwgU0lNUExFIG9yIFdCICovCisJdTMyIGxpbmVfc3o7CisJ
dTMyIHl1dl9saW5lX3N6OyAvKiBtYXhpbXVtIGxpbmUgc2l6ZSBmb3IgWVVWNDIyIGFuZCBZVVY0
MjAgKi8KIAl1MzIgc3VwcG9ydGVkX3JvdHM7CiAJLyoga29tZWRhIHN1cHBvcnRzIGxheWVyIHNw
bGl0IHdoaWNoIHNwbGl0cyBhIHdob2xlIGltYWdlIHRvIHR3byBwYXJ0cwogCSAqIGxlZnQgYW5k
IHJpZ2h0IGFuZCBoYW5kbGUgdGhlbSBieSB0d28gaW5kaXZpZHVhbCBsYXllciBwcm9jZXNzb3Jz
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA1NTI2NzMxZjVhMzMuLjZkZjQ0MjY2NmNmZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZV9zdGF0ZS5jCkBAIC0yODUsNiArMjg1LDcgQEAga29tZWRhX2xheWVyX2NoZWNr
X2NmZyhzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciwKIAkJICAgICAgIHN0cnVjdCBrb21lZGFf
ZGF0YV9mbG93X2NmZyAqZGZsb3cpCiB7CiAJdTMyIHNyY194LCBzcmNfeSwgc3JjX3csIHNyY19o
OworCXUzMiBsaW5lX3N6LCBtYXhfbGluZV9zejsKIAogCWlmICgha29tZWRhX2ZiX2lzX2xheWVy
X3N1cHBvcnRlZChrZmIsIGxheWVyLT5sYXllcl90eXBlLCBkZmxvdy0+cm90KSkKIAkJcmV0dXJu
IC1FSU5WQUw7CkBAIC0zMTQsNiArMzE1LDIyIEBAIGtvbWVkYV9sYXllcl9jaGVja19jZmcoc3Ry
dWN0IGtvbWVkYV9sYXllciAqbGF5ZXIsCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAorCWlmIChk
cm1fcm90YXRpb25fOTBfb3JfMjcwKGRmbG93LT5yb3QpKQorCQlsaW5lX3N6ID0gZGZsb3ctPmlu
X2g7CisJZWxzZQorCQlsaW5lX3N6ID0gZGZsb3ctPmluX3c7CisKKwlpZiAoa2ZiLT5iYXNlLmZv
cm1hdC0+aHN1YiA+IDEpCisJCW1heF9saW5lX3N6ID0gbGF5ZXItPnl1dl9saW5lX3N6OworCWVs
c2UKKwkJbWF4X2xpbmVfc3ogPSBsYXllci0+bGluZV9zejsKKworCWlmIChsaW5lX3N6ID4gbWF4
X2xpbmVfc3opIHsKKwkJRFJNX0RFQlVHX0FUT01JQygiUmVxdWlyZWQgbGluZV9zejogJWQgZXhj
ZWVkcyB0aGUgbWF4IHNpemUgJWRcbiIsCisJCQkJIGxpbmVfc3osIG1heF9saW5lX3N6KTsKKwkJ
cmV0dXJuIC1FSU5WQUw7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
