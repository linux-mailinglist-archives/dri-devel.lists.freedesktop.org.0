Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0859296925
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671F46E864;
	Tue, 20 Aug 2019 19:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135BE6E85A;
 Tue, 20 Aug 2019 19:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua/1nI4+048jCwhaWdZj+Zu1mamkSnpPuZ9K/1feald4BSd/hwI/1yeo0P24huYU04Fnb9jlJscEVaSlxgc7rNGRd+Yx7vo0Zg99r8NDtjPz+5QNDNd1MMvv0oIxkyHkkvPLSJsmdyA0OSoQFubs7gI4PjyrEfFlK7VakRVyXHtp3Muh0dZc/hJv8+BYbCh65iOJmv+JVAdg9KI+qIOZHDfFNZIeAgvhlq9XJMXWIbcwi8Kw9DHDuDlWnYmRYsbaVH5BT89DsS/Pd+SUl1Zip293mqeklEYiDlMd9HEr/M+qu1ntaSevQBG2d9o9jhm+2+O6S3C8abSpaLjgnQ/CmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad5QdkLef/A+rdIQQWP3FTj0kRa3P6DtHyGuaj8rCCU=;
 b=EaxlKNSb1iiM6Swr/fdhjwQSLYR7vpLq4dfVdmxpxB4X/ZWHHn347UjSYM/iWUDIX5P/ZpWvimPCjfUTRso2Gj+9xRG+9CG+KyEUaIJD9Rlo1EJwYeh7JuJSnF+5P9mAhwvRTUWkcCDfFANfwuj7zSa/hMSz8z+tClxQBpeWDRrL7D6PsWR7Y5u2xLsIbI1FPQoS+aD3pvMBJq42/E/58lg1y6b0yFwXJsjrlBJgWyS60rwMLq201xN4OiLL7iJTC83t9+8jm+QF3haeCyZiLC+ktSl0OsWWHjVJS+jLiJtiafNiKp1A/LcM1dJo0HlqjcXTp3ZRkRzGVaaaSkQUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 BN6PR12MB1521.namprd12.prod.outlook.com (2603:10b6:405:f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 19:12:16 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:15 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 02/14] Revert "drm/amd/display: navi10 bring up skip dsc
 encoder config"
Date: Tue, 20 Aug 2019 15:11:51 -0400
Message-ID: <20190820191203.25807-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(53936002)(49486002)(36756003)(336012)(1076003)(2906002)(50226002)(70206006)(4326008)(81166006)(8676002)(81156014)(8936002)(450100002)(5660300002)(51416003)(14444005)(186003)(76176011)(26005)(70586007)(6666004)(86362001)(305945005)(356004)(476003)(2616005)(446003)(11346002)(50466002)(16586007)(48376002)(478600001)(316002)(426003)(126002)(486006)(110136005)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1521; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0807cf3-877a-4e7d-6435-08d725a250a8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1521; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1521:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15217D5B9F1A775250FC8E76EFAB0@BN6PR12MB1521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5pExpkUFHfHMwYLKQVKuxPWHMezii87xGRwlh2BXXZ/ejzL9UQ0Qjo7lB/iXxvKlxxKzJh+YW4h27ozqXkuoZJqBYied0fbbncYRbMSludwXhVGjVi+wkZJfekiKRL1l7AN7GmlkDtA8AKX30ezBH43RIWPm5iRmd7DkBD/1R2syVly5hbltDK9fbSZ+Udy3vpn0aq0FCnpp5bqSoOH9Ayxh0bxHR2zvU4c/ss3udGoG4aMO5cXXk2QMZTDtCBHG0pTcaYvg1fozxr/EXRyYlZGvRrV785qcLhO7c2LniaHY+fRvfZNVlEvb25ho5mfyOAmMqnKmc7OOz8vptxZ4VNyellL/NdQpUWPsY8mEITqCFhpE52X3D8jM55hHXK2QpH1LE1an6UQ91kPOX+QDbdAz0YJUhQAtx5/MIFFtmlQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:16.2765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0807cf3-877a-4e7d-6435-08d725a250a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad5QdkLef/A+rdIQQWP3FTj0kRa3P6DtHyGuaj8rCCU=;
 b=TvLUE00jLjYtk5XdcF+BY+euRZ/Uo7AX7ay5TuFF+Vqr2PlO732n/I2uiGWIILN2qycPl2gsMW8RuCmAMDjmtnOmMcdpHf+CHWkfbam/uzyM5E+5KnILC5SEJC3Qvv6Rvd1FX5CUDAxKN9sXzUYDfR/kwCiOb4DFeSfkUiwNXJo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA1ZjJmZDM0N2VlZmY3ZDRjZTI3MTkyMGVmZDQ3YmFhYTE4ZmU5
NjhjLgoKUmUtZW5hYmxlIGVuYzJfZHBfc2V0X2RzY19jb25maWcuIFRoaXMgZnVuY3Rpb24gY2F1
c2VkIHdhcm5pbmdzCmR1ZSB0byBtaXNzaW5nIHJlZ2lzdGVyIGRlZmluaXRpb25zLiBXaXRoIHRo
ZSByZWdpc3RlcnMgYWRkZWQsCnRoaXMgbm93IHdvcmtzCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBG
cmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBSb21hbiBMaSA8Um9t
YW4uTGlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3N0cmVhbV9lbmNvZGVyLmMgICB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggNmQ1NDk0MmFiOThiLi5hNGU2
NzI4NmNkYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCkBAIC0yNzcsMTQgKzI3Nyw2IEBAIHN0
YXRpYyB2b2lkIGVuYzJfZHBfc2V0X2RzY19jb25maWcoc3RydWN0IHN0cmVhbV9lbmNvZGVyICpl
bmMsCiAJCQkJCXVpbnQzMl90IGRzY19zbGljZV93aWR0aCkKIHsKIAlzdHJ1Y3QgZGNuMTBfc3Ry
ZWFtX2VuY29kZXIgKmVuYzEgPSBEQ04xMFNUUkVOQ19GUk9NX1NUUkVOQyhlbmMpOwotCXVpbnQz
Ml90IGRzY192YWx1ZSA9IDA7Ci0KLQlkc2NfdmFsdWUgPSBSRUdfUkVBRChEUF9EU0NfQ05UTCk7
Ci0KLQkvKiBkc2MgZGlzYWJsZSBza2lwICovCi0JaWYgKChkc2NfdmFsdWUgJiAweDMpID09IDB4
MCkKLQkJcmV0dXJuOwotCiAKIAlSRUdfVVBEQVRFXzIoRFBfRFNDX0NOVEwsCiAJCQlEUF9EU0Nf
TU9ERSwgZHNjX21vZGUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
