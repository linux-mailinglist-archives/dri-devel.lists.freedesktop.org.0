Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738677EE15
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 09:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC26ECE2;
	Fri,  2 Aug 2019 07:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFB36ECE2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:54:31 +0000 (UTC)
Received: from VI1PR08CA0229.eurprd08.prod.outlook.com (10.170.234.166) by
 DB6PR0801MB1847.eurprd08.prod.outlook.com (10.169.227.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 07:54:28 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0229.outlook.office365.com
 (2603:10a6:802:15::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Fri, 2 Aug 2019 07:54:27 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 07:54:25 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26");
 Fri, 02 Aug 2019 07:54:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d136707a997d807c
X-CR-MTA-TID: 64aa7808
Received: from 1be130d0ede0.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E442837A-86C6-48D1-89F1-AE8EB9779A79.1; 
 Fri, 02 Aug 2019 07:54:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1be130d0ede0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2019 07:54:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPtHap0TzNaU4dugvur4VcCz5j8Hc5BqD/+v6IMN6/6+x/nUho6VgQzTlcgsRgXgFB/5SRGNYAS21N0mbV/aGzaMzr3sjl3qMMAwjDEqu2h9iHlANiwe2Ui6GYVKvyqI7jZOWNpJ9PvkFqGT3dbVQVI+mWJd7pBNU4PxF7/7yB9xskJ1Y0/L9kzNpd5xj+Jb0TqVJ8mEuGrcg5EMpoDFXLC5UzW0pylQF9uH+rTdd21M2uJXw1qKi10CFEdUcrsc2fcXRa4SxGdSemxH8LRtqeuFAlufToK9A06s180rjWnSBzsHANJSrwPTxG/MN+j1dfl2COmTNs8C2v70jItHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q4VOJv4sIthbrtsAtfzgaI6IW9iBzuv5h7aL5dEkuA=;
 b=XGP6ehLnQLcKnxO/dyi8/gS22ocJPpkV0s00s1iaBpXzBLvALbDu4KSewPL+ju2BiijEdkOayuz6NdrzL+utPQCMNxivXG36ypBoge4Cv7cJflilALzuWuXjdfEjkHEA+jSOT0FAkBjXawyZ0zn3jDtR6IWF2RNyTDyc/MxaDrorYF/a1tDHAVXkAJHyTfLfX+ugI/JGPnDiVsTk47+6mw9sOcCxrG/OR6FHzfXDwtX6QPV4wnBhA8wlaYEegw1etZI4ZzkdiaiNlhcPgVCNoR+7czXE+7zSrxrIiY0MYdBtmf0qTdAU0CFJ2Cd2gKWWrGgv+/tt9+gdXCXtCrVt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB5389.eurprd08.prod.outlook.com (52.133.245.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 07:54:12 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 07:54:12 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Initialize and enable output polling on Komeda
Thread-Topic: [PATCH] drm/komeda: Initialize and enable output polling on
 Komeda
Thread-Index: AQHVSQd44sHRrT3d4ECbTQknG5FM2Q==
Date: Fri, 2 Aug 2019 07:54:12 +0000
Message-ID: <1564732428-23641-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0072.apcprd03.prod.outlook.com
 (2603:1096:203:52::36) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4c531e-b331-4cc4-b944-08d7171ea3c2
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5389; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5389:|DB6PR0801MB1847:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB184786A6335DE46AF66330749FD90@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1201;OLM:1201;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(26005)(66066001)(2501003)(6512007)(476003)(6486002)(186003)(2616005)(55236004)(71190400001)(102836004)(4326008)(81156014)(71200400001)(81166006)(6436002)(386003)(8936002)(6506007)(2201001)(2906002)(478600001)(7736002)(305945005)(6636002)(68736007)(66446008)(86362001)(3846002)(6116002)(256004)(54906003)(14454004)(25786009)(110136005)(486006)(8676002)(316002)(66946007)(36756003)(66476007)(66556008)(64756008)(5660300002)(5024004)(53936002)(99286004)(50226002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5389;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 9qGqMFj7I5QQtlMLJw6M2MJUjwQ+FJZQSrRGGsjVNpYE4k+3+tEZV9HNT4UKqLCZwLwsAW+qYJzFnQAzsBxDmMExVLZDpHOnf8s6re3dhkp18LQkb7rIWgenBYkvey/XwvDW/knVYiZjwlAndVeC4stG668y5ToB2kzlLq9Cd1CrCDNg4I4+vrkKV04hGr9peuniXVIRW+IixSrxMOGnCa8hq5Wy68Zq78bZ5G0gE7+svd+5oANcJYiJGCPAWNiNNcg9WETT+8c7xx4bQIekif/GQ5gs2OH7H+PbPVsv9neasoMenP4CarITsc+FfkSPLIDbSMYymFtaZTeYP6FKJ5MAs3QsoAHRFSNzcAtnT0CWGt27X6sWxLgwTNKzWcR2hM7+aHVEX6t8cLR7Y47VA05vFYcTW2zAfDxE7DhNsPo=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5389
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(189003)(199004)(126002)(2501003)(336012)(70206006)(316002)(110136005)(70586007)(81166006)(476003)(6512007)(63370400001)(26826003)(36906005)(54906003)(36756003)(63350400001)(86362001)(47776003)(6636002)(2906002)(5660300002)(76130400001)(478600001)(50466002)(7736002)(486006)(25786009)(22756006)(8676002)(2201001)(3846002)(186003)(6506007)(26005)(356004)(99286004)(14454004)(5024004)(66066001)(4326008)(2616005)(102836004)(81156014)(6486002)(8936002)(386003)(305945005)(23756003)(50226002)(8746002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: edc42580-d326-47d0-aba4-08d7171e9b27
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1847; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: MJw0eOT2BoxCNoN3eTm+cVqUsqtcBuAsLOxz+CJI5Xaq+HF86ldVzsoD+1t+MZpS60d5Q3Qqgqxdgr7xzXMFwsz+eHolPe5tBHYsKXW0iEW8/Poxi2k6eNdeOKyFfQcWaQ2s3Rmhw+jOcyUfbu1KSTAPjuFGnTSFwAEFVT7DPrvbvAhxHdBT1n8HQpKOGVNDJp93ER/eGJyWfTFJCcBU2ruZVwpVGwV5AW8reGOLJeVQpeJInV12wxn4ArU87akW+lWAuda68IRwF1dTBD9/bVH4Szf6HDWYaOQvUzY3iWlhr8IF13vZnOa2DiEH8ZSpzL33pX/nXQ6AfMRlrZ8KzrmeH0P9Iahm05y3PQl2/Qi1lKGW574FqUMc8SF/BwsDJQrb7ms7HicWB+pPBWePtoes+IyhxXPd12zNiAqn888=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 07:54:25.9399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4c531e-b331-4cc4-b944-08d7171ea3c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q4VOJv4sIthbrtsAtfzgaI6IW9iBzuv5h7aL5dEkuA=;
 b=5e0PfDYfrG6/HT2XUrFtLmx2sJnlKNLHbeBxH57o5CdcRZQVuO0rkUxPvy+BTOXMjrG4BmnYXQAW5raE2rLOzWx+k0YTM0qGHhpL9zI7Naq8RJ2g+p92A5SuYtInI8pSp88MCELdjU5S3kgn7Mn9FFgUBwEV9+Wy+yNxE104hAk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q4VOJv4sIthbrtsAtfzgaI6IW9iBzuv5h7aL5dEkuA=;
 b=5e0PfDYfrG6/HT2XUrFtLmx2sJnlKNLHbeBxH57o5CdcRZQVuO0rkUxPvy+BTOXMjrG4BmnYXQAW5raE2rLOzWx+k0YTM0qGHhpL9zI7Naq8RJ2g+p92A5SuYtInI8pSp88MCELdjU5S3kgn7Mn9FFgUBwEV9+Wy+yNxE104hAk=
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
cml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxs
b3dyeS5saUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwppbmRl
eCA0MTlhOGIwLi4yNTcxNmEzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMKQEAgLTE1LDYgKzE1LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJt
X2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIu
aD4KIAogI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKICNpbmNsdWRlICJrb21lZGFfZnJhbWVidWZm
ZXIuaCIKQEAgLTMxNSw2ICszMTYsOCBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9r
bXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCiAJZHJtLT5pcnFfZW5hYmxlZCA9
IHRydWU7CiAKKwlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKKwogCWVyciA9IGRybV9k
ZXZfcmVnaXN0ZXIoZHJtLCAwKTsKIAlpZiAoZXJyKQogCQlnb3RvIGNsZWFudXBfbW9kZV9jb25m
aWc7CkBAIC0zMzgsNiArMzQxLDcgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qga29t
ZWRhX2ttc19kZXYgKmttcykKIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7CiAJbWRldi0+ZnVu
Y3MtPmRpc2FibGVfaXJxKG1kZXYpOwogCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOworCWRybV9r
bXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwogCWNvbXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRl
diwgZHJtKTsKIAlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7CiAJZHJtX21v
ZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
