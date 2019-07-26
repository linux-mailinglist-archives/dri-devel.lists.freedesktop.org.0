Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F176079
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 10:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4926E89F;
	Fri, 26 Jul 2019 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140081.outbound.protection.outlook.com [40.107.14.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9536E89F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:13:18 +0000 (UTC)
Received: from VI1PR08CA0094.eurprd08.prod.outlook.com (2603:10a6:800:d3::20)
 by AM5PR0802MB2594.eurprd08.prod.outlook.com (2603:10a6:203:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Fri, 26 Jul
 2019 08:13:15 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0094.outlook.office365.com
 (2603:10a6:800:d3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.14 via Frontend
 Transport; Fri, 26 Jul 2019 08:13:15 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 26 Jul 2019 08:13:13 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26");
 Fri, 26 Jul 2019 08:13:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ee8ac99b27cfc05
X-CR-MTA-TID: 64aa7808
Received: from 80f38c3bcd16.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FEB74C8-7CCA-4665-83DD-D8C3D92E91BB.1; 
 Fri, 26 Jul 2019 08:13:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80f38c3bcd16.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jul 2019 08:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkoU2Q7ex90ktMFBYpm9mjFnSk58voEPAsJCiuFi3I2y6vcsLy5wpJhsHkWyTvTwBkxWjayhLtoTADM3bzLKLoI4j+P7tkppF03aQknMx8c/Dg0zG8aYK6/1aknC9ivcNzwJYx+o9KFMKcrKtgOdBMQDSi17ichyMx7FRQqrN6o6+ldPpips4H8ok3QTAo+LSUGrrKITRQ7druTkarP9wqTwe7QmHhljsMUqUQtxszfceO+amyMUX8Fz06bRDDUhU/+OvXRpnSPnhOKWlHBFRXIBkG3x9qjhsGE9eXWGCxdMw3/iOpK6XKVV89ZKpOILnr6sLuYEP+lQjongUPsgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgY8oeibiBD6WrixfYc+P2BmrPVYxKZ9bPd3a85T118=;
 b=C+7rf14WSksmPakiN8i6hrh4hPIuKXyFjCnkG7GaIK2pPwJBMSCMqRW5v523N45Zwo25JCayoFiTqnHRVjCWIYEUVAVbItq3RTT3e4pbcl+p2oWOuRMtURhbEwRqojwJG7GjmkF1o/21wsB5qcf11m6OAZ/VKK55dtSm/VLq2L3ctBT1f3KL2+h7WnY28jrdyPT2M1p8S58YboAWs0AILBhUrzAol7kck+KgDUXxg1wA49o+1YPFZyyXxjSc98jhTQEJXyw7kaaCY0e23kWTxd9CqCMLqktHuXRgQP4HBfgOyW0AElY7/Q9pYdb8Hwe2lsbaMI4Vd1yyhBS743h0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3806.eurprd08.prod.outlook.com (20.178.14.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 08:13:01 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 08:13:01 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Topic: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Index: AQHVQ4nw7K9FV7USuUuF4ik2yHSO+g==
Date: Fri, 26 Jul 2019 08:13:00 +0000
Message-ID: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:203:2f::27) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eeb6c3be-5aed-4d2e-c5f2-08d711a11af5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3806; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3806:|AM5PR0802MB2594:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25940C015CDDC8316C34B48A9FC00@AM5PR0802MB2594.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:972;OLM:972;
x-forefront-prvs: 01106E96F6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(189003)(199004)(66946007)(478600001)(2201001)(4326008)(26005)(2501003)(36756003)(25786009)(66476007)(186003)(53936002)(5660300002)(386003)(6486002)(2906002)(55236004)(64756008)(66446008)(6506007)(8936002)(66556008)(102836004)(6636002)(99286004)(68736007)(81166006)(110136005)(66066001)(71200400001)(486006)(8676002)(71190400001)(14454004)(54906003)(50226002)(7736002)(2616005)(6512007)(6116002)(316002)(6436002)(256004)(3846002)(305945005)(14444005)(86362001)(476003)(81156014)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3806;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: cMjaXxZo/5zeBnMzoPoPivur9Ki73FfV08C64Uq8iiQoA1Y1WKvStXnIkHZzeEW65km3ySEFLYBNxcu73DbavRrlj3FJdmMxiJnRSo5KOlpEvhxV4SRriOQxCqn8Q5QP2seYzLCfFjuNAT9kN/TuNGzbewUo3z5fjNSEIYG5UZdW2QQP62aLzvkukE8dZtQfN8ftLW7Ff0kefjru3py6i8B0HKg5rfMQme7Hpnl7GtwI55Vlmm1FhCh5oXQzeyjdm7BLmR6XUlU6JMXZByL75hODIFCIP+1bzKfFnOVg1VOJeRk4/1pjVJdunKqzOBw5OFktKWQBUn7YZ0vbb7JWzK+SLiWPIySCRDKFv+MsPhzJ7WlNeQ6xa3SdcUmJmI+MEvE85FcRJRMwH0mm2rqeUYKMVkkOH1btqK+2yKhsYBE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3806
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(189003)(199004)(478600001)(386003)(26005)(186003)(2501003)(54906003)(6116002)(50466002)(63350400001)(3846002)(356004)(26826003)(102836004)(6506007)(6486002)(66066001)(36756003)(110136005)(99286004)(486006)(23756003)(47776003)(2201001)(6512007)(63370400001)(2616005)(476003)(7736002)(126002)(336012)(86362001)(50226002)(4326008)(6636002)(81166006)(81156014)(14444005)(70586007)(5660300002)(14454004)(25786009)(36906005)(2906002)(8746002)(8676002)(76130400001)(316002)(8936002)(70206006)(22756006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2594;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8fb0ef02-f817-402f-b68b-08d711a11335
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2594; 
NoDisclaimer: True
X-Forefront-PRVS: 01106E96F6
X-Microsoft-Antispam-Message-Info: 6tCfZf0hAzmc2QGcXh/dt249wLxg2rCNVISgK2UDy/VjiTrdrBwTEuASAfBqosRF4qTxJKF9O2myyVTHk+fJWwsgk03KtJDQu+Rqtr501tt8qVX5RBJi/sB2/AkSy5d+/XDHWt9Lf2/gEZZf3hei17atCmR3xA7zlELOggR3S2X/6Hp4s8jhbvas1jHuqyKgcbx4+bCpRfpQdYpzV+VJDMwW0yokREkPfh5OS8v9FyIvigEPbzetkSpYzbRpMLpMoEgGhQjNT47mdyr1E/hCbq6f/HY2Za85y7BBzoHcJSEEoSuGTuEBvlGYMBvwdriK+khrKyKk44ZuL9kJnaVkfMjjR0jyT9GjNT6x08POFyCyAHZpCfA+V88QTCSUWbgoiCpGV+MpWAkwoYHLW1RtmCvBOvfOFJRCdh8/q+gsJCo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 08:13:13.4354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb6c3be-5aed-4d2e-c5f2-08d711a11af5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgY8oeibiBD6WrixfYc+P2BmrPVYxKZ9bPd3a85T118=;
 b=Acd9lTsJFx6lWgfhvUNwZBk19sMSBHglND4QOEq12VV+rIoDSHG7HHZl3k7uauuVjCvabSmgbQWxxL84G6fN9/3E5jFtkra/C7pfrYbwrqANu7Dwvw4RVklq3DR5pN5rRKWNMmrWkFqu0Nckdu+ZtYkj6Yv5Gm9/LeyQ9ZiRp8Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgY8oeibiBD6WrixfYc+P2BmrPVYxKZ9bPd3a85T118=;
 b=Acd9lTsJFx6lWgfhvUNwZBk19sMSBHglND4QOEq12VV+rIoDSHG7HHZl3k7uauuVjCvabSmgbQWxxL84G6fN9/3E5jFtkra/C7pfrYbwrqANu7Dwvw4RVklq3DR5pN5rRKWNMmrWkFqu0Nckdu+ZtYkj6Yv5Gm9/LeyQ9ZiRp8Y=
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

Q3VycmVudCBEUk0tQ09SRSBhY2NlcHRzIHRoZSB3cml0ZWJhY2tfam9iIHdpdGggYSBlbXB0eSBm
YiwgYnV0IHRoYXQKaXMgYW4gaW52YWxpZCBqb2IgZm9yIEhXLCBzbyBuZWVkIHRvIHNraXAgaXQg
d2hlbiBjb21taXQgaXQgdG8gSFcuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgfCA5ICsrKysrKysr
LQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4
IDJmZWQxZjYuLjM3MmU5OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTI2NSw3ICsyNjUsNyBAQCB2b2lkIGtvbWVkYV9jcnRj
X2hhbmRsZV9ldmVudChzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjLAogCQlrb21lZGFfcGlwZWxp
bmVfdXBkYXRlKHNsYXZlLCBvbGQtPnN0YXRlKTsKIAogCWNvbm5fc3QgPSB3Yl9jb25uID8gd2Jf
Y29ubi0+YmFzZS5iYXNlLnN0YXRlIDogTlVMTDsKLQlpZiAoY29ubl9zdCAmJiBjb25uX3N0LT53
cml0ZWJhY2tfam9iKQorCWlmIChjb25uX3N0ICYmIGNvbm5fc3QtPndyaXRlYmFja19qb2IgJiYg
Y29ubl9zdC0+d3JpdGViYWNrX2pvYi0+ZmIpCiAJCWRybV93cml0ZWJhY2tfcXVldWVfam9iKCZ3
Yl9jb25uLT5iYXNlLCBjb25uX3N0KTsKIAogCS8qIHN0ZXAgMjogbm90aWZ5IHRoZSBIVyB0byBr
aWNrb2ZmIHRoZSB1cGRhdGUgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKaW5kZXggOTc4Nzc0NS4uOGUyZWY2
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTUyLDkgKzUyLDE2IEBACiAJc3RydWN0IGtvbWVkYV9k
YXRhX2Zsb3dfY2ZnIGRmbG93OwogCWludCBlcnI7CiAKLQlpZiAoIXdyaXRlYmFja19qb2IgfHwg
IXdyaXRlYmFja19qb2ItPmZiKQorCWlmICghd3JpdGViYWNrX2pvYikKIAkJcmV0dXJuIDA7CiAK
KwlpZiAoIXdyaXRlYmFja19qb2ItPmZiKSB7CisJCWlmICh3cml0ZWJhY2tfam9iLT5vdXRfZmVu
Y2UpCisJCQlEUk1fREVCVUdfQVRPTUlDKCJPdXQgZmVuY2UgcmVxdWlyZWQgb24gYSBpbnZhbGlk
IHdyaXRlYmFjayBqb2IuXG4iKTsKKworCQlyZXR1cm4gd3JpdGViYWNrX2pvYi0+b3V0X2ZlbmNl
ID8gLUVJTlZBTCA6IDA7CisJfQorCiAJaWYgKCFjcnRjX3N0LT5hY3RpdmUpIHsKIAkJRFJNX0RF
QlVHX0FUT01JQygiQ2Fubm90IHdyaXRlIHRoZSBjb21wb3NpdGlvbiByZXN1bHQgb3V0IG9uIGEg
aW5hY3RpdmUgQ1JUQy5cbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
