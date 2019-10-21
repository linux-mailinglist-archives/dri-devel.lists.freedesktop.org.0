Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A191FDF389
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CF56E187;
	Mon, 21 Oct 2019 16:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1019C6E188
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:45 +0000 (UTC)
Received: from DB6PR0802CA0030.eurprd08.prod.outlook.com (2603:10a6:4:a3::16)
 by DB6PR0801MB1911.eurprd08.prod.outlook.com (2603:10a6:4:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 21 Oct
 2019 16:47:40 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by DB6PR0802CA0030.outlook.office365.com
 (2603:10a6:4:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 16:47:38 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Mon, 21 Oct 2019 16:47:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 668dfe31dcc6a0fb
X-CR-MTA-TID: 64aa7808
Received: from 8df1632baa3c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DF02324-B19A-406F-9504-5165503D2FBD.1; 
 Mon, 21 Oct 2019 16:47:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8df1632baa3c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAwBiQGAxZ5uhq8tEv//sBZ5qstEfYRTrBEsPs5Rsqo4bX50xKKXhS6f06m00GjVrlL1sL21blbEJIfzt7Eem0CKclrII7TrFgj7UtiCXj7SC/q1bgASdDDCdv9NUS8a3bo1gQcHqHqHpVTYkcjkVbrv+GRqC+AodJACzemkiZGxcpefFM6IKO8LwAxi13UgJ5pE91A+a4XBonvhUVx6zmZlO9uU+RlSKjVz5yNd7HkUEJBuA+lmNXiGRq0fOqYlGEPL8x8TY2Ld3t7FSbyLMSmm7TXlEPJ5gKD0ep1J1XqmpS0axwVUG+Ov6SlAJSee677W3tByeK8z4RlGzsZSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWsSnQvJtQ+r5qSKgtU+rOw+cTaU+Npr3oF1zqZ62NU=;
 b=NBxvyPYsWVZhXLBeK1QWSZCWfi8qfUIC5t6BVMHO0slTVsZ2x0OoTh4nnLct0IJi9gJZsIDsyFJOs5+P4m59Eb4mgtIMQpBa/O3odWCdf6zNCcjvh/mTry1RP+zU9QyTStLiBvCyXCCDVRUGD1wmIUgxL7t+HQXp7TFXEfn4GB7MQa/zbYOt42NQCUF/EIS94GmkoqH0CSGcPashx7nmK/HVXAzCehZyFXB2ZktWDeMkZpxN7Ylj5krlhmcUJOWBjHh7wCSzRIIrh4UjSnvnIuqEA6MQ19ZKq/etYpV/90q4wV047wLj4FW2K3viknZ8sJ+rpYqUV7rqWXyiAWcO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3693.eurprd08.prod.outlook.com (20.178.13.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 16:47:29 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:29 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/komeda: Add option to print WARN- and INFO-level IRQ
 events
Thread-Topic: [PATCH 4/5] drm/komeda: Add option to print WARN- and INFO-level
 IRQ events
Thread-Index: AQHViC86lQh6BhWPhkSdWiuXUeWqOw==
Date: Mon, 21 Oct 2019 16:47:29 +0000
Message-ID: <20191021164654.9642-5-mihail.atanassov@arm.com>
References: <20191021164654.9642-1-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 92c20dda-129d-4062-cce5-08d7564661df
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3693:|VI1PR08MB3693:|DB6PR0801MB1911:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1911139A922EDF1A3A7A705B8F690@DB6PR0801MB1911.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1388;OLM:1388;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(199004)(189003)(11346002)(6436002)(316002)(54906003)(256004)(8936002)(6512007)(14444005)(2501003)(71200400001)(5640700003)(71190400001)(50226002)(486006)(2906002)(446003)(6486002)(2616005)(44832011)(5660300002)(8676002)(476003)(305945005)(66066001)(36756003)(86362001)(25786009)(14454004)(186003)(478600001)(6506007)(386003)(102836004)(26005)(4326008)(2351001)(81156014)(1076003)(6116002)(3846002)(66946007)(81166006)(66556008)(52116002)(66476007)(7736002)(64756008)(66446008)(99286004)(76176011)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3693;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /LkEXHfkUUbTUyBF3hDHpD6g+u1DEcGGRcjkX8nxTcUdGVb6GzRz1Uz+KWcauw5IpcQcyPTq8b/h20tGOIabjeTx/h5UBEBJ8cGkm+cXYf2E7ZP3Akv92wLaZ6VXeKyR5nkKxRs69AzM8jy0K0xAl+gTNJzvLEkgNW7h89zu4eYWn2AF7AFNVE5bXfhdoASWmhCr7o+Eg66mPipCmO3nn+b0Kl35g/CLAJUGUUAv892Q9I07bbEjYICJlxetfAkp/qKU4LaHFzzNxrHhNyssyN/vEH4Ux2LjobI2C6pjp8rBgue0vwzX0enzs40MFjXESMVtQlfTfHa0xWR9wZYFgZkBC5wLRpewJAhWoHVn7Bp4eGhUJQpbNck4JFXmwXiWpdVHrd3Cj/k797ckNptbZCUFTm4+Ie23TquO0oHqkZ1NIaEwlXSWNqd/hPteZ2g2
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(11346002)(7736002)(336012)(1076003)(8936002)(50226002)(26826003)(8746002)(478600001)(5660300002)(316002)(446003)(2906002)(6916009)(50466002)(476003)(2616005)(305945005)(3846002)(14444005)(25786009)(6116002)(63350400001)(486006)(126002)(86362001)(76176011)(5640700003)(23756003)(36906005)(70206006)(2501003)(99286004)(22756006)(66066001)(54906003)(6486002)(36756003)(6512007)(70586007)(76130400001)(14454004)(356004)(26005)(6506007)(81166006)(81156014)(186003)(2351001)(107886003)(102836004)(386003)(47776003)(8676002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1911;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f3670ba4-12a0-40d4-70a7-08d756465c6d
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Z1In7kzOUN0krgaWglYq3Rg0BJiZcP/YeQt3Iv3YekPKGsBitC67yskOPrvsdiaowC9wT3Gv0nPNMWZoeM/FI7EEGp0/sq1pA7VTmXOvU/FfD5zgdnyEDyg5Ld9opUsbj1mRBJ8v1vYHYVs9DlspdPl5SZdWfGW1msHkcGMTORiFKsMn/F5Wo178OxOlPTRwS2ZFzlAcAYVP0A2oe8FOSQ8Jd1WvWA9CZY6wH+CZ0KMsj1K8ZwUl41eaXicD243WVjDJ5elaTqxHDyDl1ChyIYN8W4MRSdCZHfRVXR0bar32xphakZ/vIXBRVdczbgfdoJ9HcuPx0qiNa4YWT8CkouwP5I0/Nbas8FFstcJLHBu/K+FqocxBO7T/evxX1IZsBQan5K57SzFHUsM4XhjstdZW15n3X5G3DjqicDmh0edK8BqcR0mdWDWEsUFiXxg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:38.4870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c20dda-129d-4062-cce5-08d7564661df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWsSnQvJtQ+r5qSKgtU+rOw+cTaU+Npr3oF1zqZ62NU=;
 b=lCZpulkXKD+5MMk203KPXYuhPv0BhlFnibjNr+SqNT59Xl0kq1R/i70cvVPHvtlBJTfIWlG20SCp9pGrdafoUzKLOUHAFnUlLfPvlgOAd7nmSUVPmJpAMVHcC6DYFP6mWhtjd3YXYtYfphvCO2Lc92AtKmXJXsRRMLjAdJt1Hug=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWsSnQvJtQ+r5qSKgtU+rOw+cTaU+Npr3oF1zqZ62NU=;
 b=lCZpulkXKD+5MMk203KPXYuhPv0BhlFnibjNr+SqNT59Xl0kq1R/i70cvVPHvtlBJTfIWlG20SCp9pGrdafoUzKLOUHAFnUlLfPvlgOAd7nmSUVPmJpAMVHcC6DYFP6mWhtjd3YXYtYfphvCO2Lc92AtKmXJXsRRMLjAdJt1Hug=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXh0cmEgZGV0YWlsIChub3JtYWxseSBvZmYpIGFsbW9zdCBuZXZlciBodXJ0cy4KClNpZ25lZC1v
ZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwgMTEgKysr
KysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IDQ4MDkw
MDBjMWVmYi4uZDlmYzljNDg4NTlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtNTEsNiArNTEsMTMgQEAKIAogI2RlZmluZSBLT01F
REFfV0FSTl9FVkVOVFMJS09NRURBX0VSUl9DU0NFCiAKKyNkZWZpbmUgS09NRURBX0lORk9fRVZF
TlRTICh7MCBcCisJCQkgICAgfCBLT01FREFfRVZFTlRfVlNZTkMgXAorCQkJICAgIHwgS09NRURB
X0VWRU5UX0ZMSVAgXAorCQkJICAgIHwgS09NRURBX0VWRU5UX0VPVyBcCisJCQkgICAgfCBLT01F
REFfRVZFTlRfTU9ERSBcCisJCQkgICAgfSkKKwogLyogbWFsaWRwIGRldmljZSBpZCAqLwogZW51
bSB7CiAJTUFMSV9ENzEgPSAwLApAQCAtMjExLDYgKzIxOCwxMCBAQCBzdHJ1Y3Qga29tZWRhX2Rl
diB7CiAJdTE2IGVycl92ZXJib3NpdHk7CiAJLyogUHJpbnQgYSBzaW5nbGUgbGluZSBwZXIgZXJy
b3IgcGVyIGZyYW1lIHdpdGggZXJyb3IgZXZlbnRzLiAqLwogI2RlZmluZSBLT01FREFfREVWX1BS
SU5UX0VSUl9FVkVOVFMgQklUKDApCisJLyogUHJpbnQgYSBzaW5nbGUgbGluZSBwZXIgd2Fybmlu
ZyBwZXIgZnJhbWUgd2l0aCBlcnJvciBldmVudHMuICovCisjZGVmaW5lIEtPTUVEQV9ERVZfUFJJ
TlRfV0FSTl9FVkVOVFMgQklUKDEpCisJLyogUHJpbnQgYSBzaW5nbGUgbGluZSBwZXIgaW5mbyBl
dmVudCBwZXIgZnJhbWUgd2l0aCBlcnJvciBldmVudHMuICovCisjZGVmaW5lIEtPTUVEQV9ERVZf
UFJJTlRfSU5GT19FVkVOVFMgQklUKDIpCiAJLyogRHVtcCBEUk0gc3RhdGUgb24gYW4gZXJyb3Ig
b3Igd2FybmluZyBldmVudC4gKi8KICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9EVU1QX1NUQVRF
X09OX0VWRU5UIEJJVCg4KQogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9ldmVudC5jCmluZGV4IDVkYTYxZTdkNzVkNS4uYmY4ODQ2M2JiNGQ5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVu
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMKQEAgLTEyNCw2ICsxMjQsMTAgQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBr
b21lZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJaWYgKGVycl92
ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVOVFMpCiAJCXByaW50X2V2dHMgfD0g
S09NRURBX0VSUl9FVkVOVFM7CisJaWYgKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5U
X1dBUk5fRVZFTlRTKQorCQlwcmludF9ldnRzIHw9IEtPTUVEQV9XQVJOX0VWRU5UUzsKKwlpZiAo
ZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfSU5GT19FVkVOVFMpCisJCXByaW50X2V2
dHMgfD0gS09NRURBX0lORk9fRVZFTlRTOwogCiAJaWYgKGV2dHNfbWFzayAmIHByaW50X2V2dHMp
IHsKIAkJY2hhciBtc2dbMjU2XTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
