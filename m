Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A35C2089
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 14:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C96E3D8;
	Mon, 30 Sep 2019 12:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3B46E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 12:23:26 +0000 (UTC)
Received: from VI1PR0802CA0011.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::21) by DB8PR08MB5066.eurprd08.prod.outlook.com
 (2603:10a6:10:e4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 12:23:22 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR0802CA0011.outlook.office365.com
 (2603:10a6:800:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Mon, 30 Sep 2019 12:23:22 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 12:23:20 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 30 Sep 2019 12:23:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb7266d763c3a4b5
X-CR-MTA-TID: 64aa7808
Received: from f5b55834488d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEC88F23-6C67-4D03-947B-5FC63903E5BF.1; 
 Mon, 30 Sep 2019 12:23:10 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5b55834488d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 12:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo14CVLk+GyMvPAyEi4nTEq1MmKnXG8iaPm7EW7rZliRztI8EIbRwa5y9aUGGX0DWy/St/sncK9Fci3GhsA9wbiPZK7LmE8Ap7A9wo8PXXSC2e1un4uJUDgGMPT9au3G3tsEt1hRx4tb+EuRO1HUycCHm1YZbmBiUn3h60q8EFgEWfN3qR8nW4A1hNzppOmE/X6IJdiUvnfF9nFpqjApN9EALtFCXuh/xlPAr1DH/iY+sUysiOqoo3qgl0tda6XrizQnEqxPUPoGet4HWbKLZGry8Lc0g3yYia/LAND/FP8RfA7E2D6Z9WOJJsI3xGKrv90kLkD3Ut+PVFMylwvasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZoM4csAWllibZNge6xkf7ey9lPmsgCJMlJZuMLI2q0=;
 b=EEVqGQfsY4pLMS1Z/NICcN+JZ5F4KG0CdkrLvIkblKHjgxV5W9U7NPvlWlPYuPWiKfEB3mdz7xULssm3Uz2rpXZKfaKhhhaPx/DxFOo4OsojVIiyTnyd0iUherNas6HuFmQwbFFRI/Mlj1UFnhbhbgmk93yRRdBDLXlRlANl4X+P5r106PBzV7CbnPFoDLgs9k2aEjZQFHPdwfCI3EFTYbrNrcT5hgmI+n5B1vL5fbq2vhf/UPO2EX5Dn77YMrWKNwvaZ/bd+DJMSHOlMInYmbFv3hQtxtU9Z/q3DH911h54s9MQam4OdhhJ5ku+08wGphAlMt0pw67XVUQ6Nt6cRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4238.eurprd08.prod.outlook.com (20.179.24.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 12:23:07 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 12:23:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Topic: [PATCH v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Index: AQHVd4nQ0Duce8hWsE+OMvz2QKX5Dg==
Date: Mon, 30 Sep 2019 12:23:07 +0000
Message-ID: <20190930122231.33029-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P123CA0038.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::26)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4bb6408-5f74-43e4-2a77-08d745a0fad4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4238:|VI1PR08MB4238:|DB8PR08MB5066:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5066F3F7D8B8C123E002A15E8F820@DB8PR08MB5066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(189003)(199004)(25786009)(36756003)(5640700003)(6916009)(1076003)(2351001)(6436002)(6116002)(3846002)(478600001)(6512007)(2906002)(5660300002)(4744005)(4326008)(7736002)(305945005)(6486002)(66446008)(64756008)(66946007)(66476007)(66556008)(2501003)(50226002)(8676002)(44832011)(26005)(186003)(8936002)(486006)(99286004)(54906003)(2616005)(52116002)(81156014)(81166006)(316002)(476003)(86362001)(71190400001)(71200400001)(14454004)(66066001)(102836004)(386003)(256004)(14444005)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4238;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IjeiUP1KyBBn/DAcS8s7FAQy5Zn5GAvOjR2zyTbD7OMlJJeMqqh39JiJWRUgAKwboaadBVA2xkSgHPS0rnn3/hmp9daaAe19afwjJJf54BMMqGfJlHOSu+Xu2aJu99rJ2jpZ7BeJjyucR8vDEA4ZEbjOvjPfWx/yPJV2nedG6AiVS5bO4RsxCyiED/VKv0t5mG7zLoCl/Fcw+aPiQI4mHdFK/v8ksX/wravYf6IPSeIXQSTxxTm+M/nEKzR/G4fOingjaKFWJxecBDZ6xdRPkRb1TNaTqF13o6BKVwxPD4y/VNmNKWJe9KJq3BEkJe96RjcZBRJqvNQrlXE8qVsVNe8H68ToDC9WcS45tHH7TV8Wr+iFsVZLp/J67Tg5z5qkcKVbEbAbtviPxOXjvjXQZ+wbxE14V/cq8au2q5v02hw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4238
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(189003)(199004)(50226002)(356004)(305945005)(8676002)(126002)(25786009)(7736002)(8936002)(81166006)(8746002)(6916009)(14454004)(486006)(107886003)(6486002)(6512007)(26826003)(5640700003)(2351001)(14444005)(478600001)(4326008)(50466002)(81156014)(5660300002)(186003)(26005)(4744005)(22756006)(66066001)(6506007)(2501003)(36756003)(476003)(47776003)(386003)(316002)(102836004)(99286004)(36906005)(86362001)(54906003)(1076003)(6116002)(3846002)(76130400001)(23756003)(63350400001)(2906002)(336012)(2616005)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5066;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c9c873ca-3468-470a-acfe-08d745a0f329
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lj++TqtRv28JERsNMB9VH1qzeRpIcFq0urwA1jFL/aT/qCFXFfX2G5uLFH1Jkwl5cckB9LT/uiOMKHOYwqBPEKmMdyxM22bjicU6VFawosp+UHLDkWm3wPz6/eOFmhl5U64gM3I0PZowBYsadFueOApoTIR46VKhfTGSuB/OgvNzEzFb0IzmtsOc2IfM3HmU/CDvy0uGxPCd0H57KqKWL5qiSoPSsGAgyDbGDB9fcytAh47fsXD4UcrDMGkI0tMEAYPU4yttw23pHJ3oUe5UQxydpz1B6Nj90uvGT5I3fxSIpNgXRMMGaP71jytUiylHekvG4izdC2lQyk5FCjIYrU9Nu7ztIKb+MtSvZERb8dqvBfz9uyftgwst+6IW1IpfhEYAVGM20oGbNZ/Ul/Oee0VQzjVqr7LMPOEwZmLq1cA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 12:23:20.0966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bb6408-5f74-43e4-2a77-08d745a0fad4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZoM4csAWllibZNge6xkf7ey9lPmsgCJMlJZuMLI2q0=;
 b=tjnp9S5B2DvvDJKefW2/kGsEw4w+j0+HJ5I5h/r39Pp9q9AaLjXTICP4q8caRqvuNE9IWolRS9ODvkvRTuhk7vkmxdWjqeEmnD5Mpgt8PRCNOmYiGhDTEVMA6OBU4nfXWhYBdlg2wguEAAGOPOMIhgamTv/R6JWk2R4Gqoavp4c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZoM4csAWllibZNge6xkf7ey9lPmsgCJMlJZuMLI2q0=;
 b=tjnp9S5B2DvvDJKefW2/kGsEw4w+j0+HJ5I5h/r39Pp9q9AaLjXTICP4q8caRqvuNE9IWolRS9ODvkvRTuhk7vkmxdWjqeEmnD5Mpgt8PRCNOmYiGhDTEVMA6OBU4nfXWhYBdlg2wguEAAGOPOMIhgamTv/R6JWk2R4Gqoavp4c=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGJvdGggdGhlIHN0cmluZyBhbmQgdGhlIHN0cnVjdCBtZW1iZXIgYmVpbmcgcHJpbnRlZC4K
CkNoYW5nZXMgc2luY2UgdjE6CiAtIE5vdyB3aXRoIGEgYm9udXMgZ3JhbW1hciBmaXgsIHRvby4K
CkZpeGVzOiAyNjRiOTQzNmQyM2IgKCJkcm0va29tZWRhOiBFbmFibGUgd3JpdGViYWNrIHNwbGl0
IHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA5NTAyMzVhZjFl
NzkuLjJiNjI0YmZlMTc1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC01NjQsOCArNTY0LDgg
QEAga29tZWRhX3NwbGl0dGVyX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfc3BsaXR0ZXIgKnNwbGl0
dGVyLAogCX0KIAogCWlmICghaW5fcmFuZ2UoJnNwbGl0dGVyLT52c2l6ZSwgZGZsb3ctPmluX2gp
KSB7Ci0JCURSTV9ERUJVR19BVE9NSUMoInNwbGl0IGluX2luOiAlZCBleGNlZWQgdGhlIGFjY2Vw
dGFibGUgcmFuZ2UuXG4iLAotCQkJCSBkZmxvdy0+aW5fdyk7CisJCURSTV9ERUJVR19BVE9NSUMo
InNwbGl0IGluX2g6ICVkIGV4Y2VlZHMgdGhlIGFjY2VwdGFibGUgcmFuZ2UuXG4iLAorCQkJCSBk
Zmxvdy0+aW5faCk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
