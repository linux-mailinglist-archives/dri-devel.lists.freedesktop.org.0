Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50005112A7B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8CF6E175;
	Wed,  4 Dec 2019 11:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140045.outbound.protection.outlook.com [40.107.14.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5706E8C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:16 +0000 (UTC)
Received: from DB6PR0801CA0061.eurprd08.prod.outlook.com (2603:10a6:4:2b::29)
 by DB6PR0801MB1622.eurprd08.prod.outlook.com (2603:10a6:4:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:11 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by DB6PR0801CA0061.outlook.office365.com
 (2603:10a6:4:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:11 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:11 +0000
Received: ("Tessian outbound 92d30e517f5d:v37");
 Wed, 04 Dec 2019 11:48:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7ad29d86ff89491
X-CR-MTA-TID: 64aa7808
Received: from b2b246179d1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 696D05E8-EFF3-4838-9822-C32CE7880CCB.1; 
 Wed, 04 Dec 2019 11:48:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b246179d1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5GTdsb3ofk+B3vK0M0cuo2S+aWyGE/tpIXwTkJ0Upy0wwrMND5vom3780OvGU37CE9tbJJVjfl4rg4n26YYbinfcIisO61Cy8Ai+RToOcoToF0IqKCzeRhrUuFu+vN5y/S6VmpNdaFKMujUuU1AAq65du31XeQAjn6STpu7V/n2EPvY6IBqq/Gfk/w8Vt194F6oYikX2r2LXGjN9RS3vqPAHrmQbn0rQsWsVevJqpcw8eqf3tRBmIB2zKi3eD41Bja81qIk6fLnwwgYcxOdjjPFGeK0cBoi4PTj7ycOZqlB11VQJnnCCCA0iNv6W/zSiyJqCbztbA/LfDUCVMmEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjhaa9GsGlM51nJym8bd1M2smCmftsU3gd0F6TVRRuk=;
 b=Ycd/zRGkqocpK2ffSjywdeMDt8ihIdcbNlF66QsiSffQZFGq9ZGINMA+E3Mywp0bvguMRmgqNx3znwkFoTHPt5Z0TrWOquHPag/NmuUrOAF75j6XmNqoJzkTz3v/V81ifPe8KtzEoFe6UHEjv26IETuqxBOmHOSAH+eMtc8YdN05BM2XerInU2h6LSIDvhEpM0vucTvMqXdbqcrcCvVOT8UiVoDur90x0VtLWvDFAyw5BTA1eFfBvZydrgOBGqtoS7MRbkrXrEOunyNZJK6wZueU2AGGlYkyOXov107VsbfjfjO/qMsykLncCFLfOQAUFw7zycdCgVQcPMF0QAxEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:04 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:04 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 01/28] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH v2 01/28] drm: Introduce drm_bridge_init()
Thread-Index: AQHVqpiuVXCS0RRq1UGHN2fVy/u6Kw==
Date: Wed, 4 Dec 2019 11:48:02 +0000
Message-ID: <20191204114732.28514-2-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 413678ab-669a-4f7b-3d25-08d778afd6d3
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR0801MB1622:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB16227F6B0D032A3FAF24AA9A8F5D0@DB6PR0801MB1622.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:431;OLM:431;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(14444005)(6506007)(36756003)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tISuevjz7NtKVm3vNsVGGFDDvSps0mtU0Rvzq8nxLdXLYu2S0NyXbQ5OGoXPubW1p/DiQmRg3HanYZh6Roh6GRS5ljt50lzN4GolVX/83qBDGmSGFRASA00bjJ0G8jg6C98W9NQpBSYYGFCzmmNGjQEMCOmD1RFuKX8v15A9vGaFnk/Vy2RF2jkJ+qqCHqLSY9zZoZ93FxtHHYhzb4R4pzvClQ7c6/6xcuVZPyP8Hd471SEFtV6kcEv+4D4bKkC6nbxTu8sgl6cKdJDc9/S98bszwn8YIlEJoP37D9NpA++1JHwXCV0r4xf8yghdIGbaMP2mwKQQGpCjdhtPXUamCRFGoHGuemx6m6CQnsIl3I+R2VL+U/+hz5hOK4iKjtBL7TL03i/p5hTHa0LxMmPPpJxYgikwRXcsbxgiGIUwplB/96MfflVak1RP4yigjUkt
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(186003)(5640700003)(11346002)(36906005)(102836004)(26005)(6512007)(26826003)(2616005)(478600001)(336012)(99286004)(14454004)(8746002)(107886003)(5024004)(54906003)(25786009)(4326008)(6486002)(6116002)(76176011)(316002)(70586007)(14444005)(76130400001)(50466002)(70206006)(6506007)(3846002)(22756006)(2351001)(50226002)(7736002)(1076003)(81166006)(23756003)(356004)(8936002)(305945005)(5660300002)(81156014)(2501003)(6916009)(8676002)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1622;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 477886ba-b609-44f2-f6e5-08d778afd143
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aodV53EVbLR7oZpEZx9/yDB+WIMGJ7OMtNaMDZBHy0GonA6wsHnyEUvsh/44FlKxDIQIxaNhJ+MkhBC0Yh4mHG9WOifw1D6ZMuSBfkvsDmeUwFBA84Iz0QXgCiAl3xeaaNipEiKjH8i0fC7mneLTDALwdOnlAEYRmQ5tF1diucpQgUicsoev49XkQyGQP8MpXiTbok3h7awz5p3kSBHpA3sYxJ5BkP1KzQgSwGpwlHo47lRg1js6GtT/z4t7IV1ZUxFnwJM3jVQ6Niz88LoYZj0Jmf59PXzO+dAZgznuKOkwnjUXB/cTZE2MkzTSfpPrkP/Q7FBVspJLFSyHNO7ieO/4MZbLzNt5TfMs12HdTOl9GyKIHMo6fxd+M+4LBdwojqs4+7hvUmcbSLP6RYgqcdmXuRF5/UyR+yr14n6gjUMadwRww8IJFbWmAO1hOnvw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:11.3811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413678ab-669a-4f7b-3d25-08d778afd6d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjhaa9GsGlM51nJym8bd1M2smCmftsU3gd0F6TVRRuk=;
 b=3VbH8seW3SUQSdYBl/EKbcaiOIiGiuRTmEK+qiSp1hwKPJ18Mg6Md5+1oqmiUQlz+ap8Ir3YwNUbqxWxIMy/RaRJrMciCygesYe74XUfCiXZv2urC1I6gZ7bTefAEADUTlk69rY1p8Lis8CkQTkes6S3ujY1i1+AspD2FXzKtIc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjhaa9GsGlM51nJym8bd1M2smCmftsU3gd0F6TVRRuk=;
 b=3VbH8seW3SUQSdYBl/EKbcaiOIiGiuRTmEK+qiSp1hwKPJ18Mg6Md5+1oqmiUQlz+ap8Ir3YwNUbqxWxIMy/RaRJrMciCygesYe74XUfCiXZv2urC1I6gZ7bTefAEADUTlk69rY1p8Lis8CkQTkes6S3ujY1i1+AspD2FXzKtIc=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBzaW1wbGUgY29udmVuaWVuY2UgZnVuY3Rpb24gdG8gaW5pdGlhbGl6ZSB0aGUgc3RydWN0IGRy
bV9icmlkZ2UuIFRoZQpnb2FsIGlzIHRvIHN0YW5kYXJkaXplIGluaXRpYWxpemF0aW9uIGZvciBh
bnkgYnJpZGdlIHJlZ2lzdGVyZWQgd2l0aApkcm1fYnJpZGdlX2FkZCgpIHNvIHRoYXQgd2UgY2Fu
IGxhdGVyIGFkZCBkZXZpY2UgbGlua3MgZm9yIGNvbnN1bWVycyBvZgp0aG9zZSBicmlkZ2VzLgoK
djI6CiAtIHMvV0FSTl9PTighZnVuY3MpL1dBUk5fT04oIWZ1bmNzIHx8ICFkZXYpLyBhcyBzdWdn
ZXN0ZWQgYnkgRGFuaWVsCiAtIGV4cGFuZCBvbiBzb21lIGtlcm5lbGRvYyBjb21tZW50cyBhcyBz
dWdnZXN0ZWQgYnkgRGFuaWVsCiAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZSBhcyBzdWdnZXN0ZWQg
YnkgRGFuaWVsCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDM0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAg
ICAgfCAxNSArKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRn
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwppbmRleCBjYmE1MzdjOTllNDMuLjUw
ZTFjMWI0NmUyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCkBAIC02NCw3ICs2NCwxMCBAQCBzdGF0aWMg
REVGSU5FX01VVEVYKGJyaWRnZV9sb2NrKTsKIHN0YXRpYyBMSVNUX0hFQUQoYnJpZGdlX2xpc3Qp
OwogCiAvKioKLSAqIGRybV9icmlkZ2VfYWRkIC0gYWRkIHRoZSBnaXZlbiBicmlkZ2UgdG8gdGhl
IGdsb2JhbCBicmlkZ2UgbGlzdAorICogZHJtX2JyaWRnZV9hZGQgLSBhZGQgdGhlIGdpdmVuIGJy
aWRnZSB0byB0aGUgZ2xvYmFsIGJyaWRnZSBsaXN0LgorICoKKyAqIERyaXZlcnMgc2hvdWxkIGNh
bGwgZHJtX2JyaWRnZV9pbml0KCkgcHJpb3IgYWRkaW5nIGl0IHRvIHRoZSBsaXN0LgorICogRHJp
dmVycyBzaG91bGQgY2FsbCBkcm1fYnJpZGdlX3JlbW92ZSgpIHRvIGNsZWFuIHVwIHRoZSBicmlk
Z2UgbGlzdC4KICAqCiAgKiBAYnJpZGdlOiBicmlkZ2UgY29udHJvbCBzdHJ1Y3R1cmUKICAqLwpA
QCAtODksNiArOTIsMzUgQEAgdm9pZCBkcm1fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlKQogfQogRVhQT1JUX1NZTUJPTChkcm1fYnJpZGdlX3JlbW92ZSk7CiAKKy8qKgor
ICogZHJtX2JyaWRnZV9pbml0IC0gaW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCisg
KgorICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCisgKiBAZnVuY3M6IGNvbnRy
b2wgZnVuY3Rpb25zCisgKiBAZGV2OiBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHRoaXMgZHJtX2Jy
aWRnZQorICogQHRpbWluZ3M6IHRpbWluZyBzcGVjaWZpY2F0aW9uIGZvciB0aGUgYnJpZGdlOyBv
cHRpb25hbCAobWF5IGJlIE5VTEwpCisgKiBAZHJpdmVyX3ByaXZhdGU6IHBvaW50ZXIgdG8gdGhl
IGJyaWRnZSBkcml2ZXIgaW50ZXJuYWwgY29udGV4dCAobWF5IGJlIE5VTEwpCisgKi8KK3ZvaWQg
ZHJtX2JyaWRnZV9pbml0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2Ug
KmRldiwKKwkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyAqZnVuY3MsCisJCSAg
ICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5ncywKKwkJICAgICB2b2lk
ICpkcml2ZXJfcHJpdmF0ZSkKK3sKKwlXQVJOX09OKCFmdW5jcyB8fCAhZGV2KTsKKworCWJyaWRn
ZS0+ZGV2ID0gTlVMTDsKKwlicmlkZ2UtPmVuY29kZXIgPSBOVUxMOworCWJyaWRnZS0+bmV4dCA9
IE5VTEw7CisKKyNpZmRlZiBDT05GSUdfT0YKKwlicmlkZ2UtPm9mX25vZGUgPSBkZXYtPm9mX25v
ZGU7CisjZW5kaWYKKwlicmlkZ2UtPnRpbWluZ3MgPSB0aW1pbmdzOworCWJyaWRnZS0+ZnVuY3Mg
PSBmdW5jczsKKwlicmlkZ2UtPmRyaXZlcl9wcml2YXRlID0gZHJpdmVyX3ByaXZhdGU7Cit9CitF
WFBPUlRfU1lNQk9MKGRybV9icmlkZ2VfaW5pdCk7CisKIC8qKgogICogZHJtX2JyaWRnZV9hdHRh
Y2ggLSBhdHRhY2ggdGhlIGJyaWRnZSB0byBhbiBlbmNvZGVyJ3MgY2hhaW4KICAqCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgK
aW5kZXggYzBhMjI4NmE4MWU5Li45NDllNGY0MDFhNTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKQEAgLTM3Myw3ICsz
NzMsMTYgQEAgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB7CiB9OwogCiAvKioKLSAqIHN0cnVj
dCBkcm1fYnJpZGdlIC0gY2VudHJhbCBEUk0gYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCisgKiBz
dHJ1Y3QgZHJtX2JyaWRnZSAtIGNlbnRyYWwgRFJNIGJyaWRnZSBjb250cm9sIHN0cnVjdHVyZS4K
KyAqCisgKiBCcmlkZ2UgZHJpdmVycyBzaG91bGQgY2FsbCBkcm1fYnJpZGdlX2luaXQoKSB0byBp
bml0aWFsaXplIGEgYnJpZGdlCisgKiBkcml2ZXIsIGFuZCB0aGVuIHJlZ2lzdGVyIGl0IHdpdGgg
ZHJtX2JyaWRnZV9hZGQoKS4KKyAqCisgKiBVc2VycyBvZiBicmlkZ2VzIGxpbmsgYSBicmlkZ2Ug
ZHJpdmVyIGludG8gdGhlaXIgb3ZlcmFsbCBkaXNwbGF5IG91dHB1dAorICogcGlwZWxpbmUgYnkg
Y2FsbGluZyBkcm1fYnJpZGdlX2F0dGFjaCgpLgorICoKKyAqIE1vZHVsYXIgZHJpdmVycyBpbiBP
RiBzeXN0ZW1zIGNhbiBxdWVyeSB0aGUgbGlzdCBvZiByZWdpc3RlcmVkIGJyaWRnZXMKKyAqIHdp
dGggb2ZfZHJtX2ZpbmRfYnJpZGdlKCkuCiAgKi8KIHN0cnVjdCBkcm1fYnJpZGdlIHsKIAkvKiog
QGRldjogRFJNIGRldmljZSB0aGlzIGJyaWRnZSBiZWxvbmdzIHRvICovCkBAIC00MDIsNiArNDEx
LDEwIEBAIHN0cnVjdCBkcm1fYnJpZGdlIHsKIAogdm9pZCBkcm1fYnJpZGdlX2FkZChzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKTsKIHZvaWQgZHJtX2JyaWRnZV9yZW1vdmUoc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSk7Cit2b2lkIGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlk
Z2VfZnVuY3MgKmZ1bmNzLAorCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3Mg
KnRpbWluZ3MsCisJCSAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUpOwogc3RydWN0IGRybV9icmlk
Z2UgKm9mX2RybV9maW5kX2JyaWRnZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKIGludCBkcm1f
YnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsCiAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
