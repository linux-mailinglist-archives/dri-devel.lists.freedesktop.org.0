Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144494910
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D526E1D5;
	Mon, 19 Aug 2019 15:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0066E1D5;
 Mon, 19 Aug 2019 15:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H38T8mLYUc3vO5sY2IqMMspStS7TdBb7vB//cKOCdan6kauBU8hAXbKH9ZTdtZjd4D5hr1Lex5AisAwlY0t0nIhvehJlAZx9SfhcfYRjzwRfnRzNm2oH+UDbR5esQSLsBNWn+Njb9MG4do089wnEni2O6Eg4/XLtx18h6vgDOZn+1a6Tvy0vEzmjAmAms6cr98rSF75EnWKpKlnnclT3RjxCuwwQ9tM+yhimoOBUMb0iAgioMH8q4PU0tF7vXngxyCQyuLUpX6FzfwKWimijR97WlH8xG7d+M/Vk+DUlXw7r5jCGjNsMG+a62XbArv0pKVhjLYZ81GRPqv4kmK6VAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUn+8zXdgXGw6vXB/46FAtb65tpY9dUUoJqhJ99W3BQ=;
 b=LO2hldF/FAYq+HMhbXUlRZZsczwJ0XicGRYEzIXgNUfugrx/milEB6uprUgHGUKuj94RAdCrAbj98fQK1F+e57Yh1cKyceou2axKcsPM+CFI0juhCkzntgRtfWEsvXIilZbuG7nDJ/vS17zgAvh8ribo9gApoZhuz3mEOuQhPE4OrkFhhc4A/Vw+tjUxtqBVx3guqbFXKEPxYncNzeUgMUkVBaiM/NQkncW2ktbzelV8rBkX7XQC38u6JxNHSJeGQbYoYNp9Qy0QT8x2vN4qQ+NJj8hhRr7dXkEwee+8Jn+zF8giAq6s5pSKfxq9huFD9eiw8bA+QQN5bPbbLGgsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:48 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:46 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/14] Revert "drm/amd/display: navi10 bring up skip dsc
 encoder config"
Date: Mon, 19 Aug 2019 11:50:26 -0400
Message-ID: <20190819155038.1771-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(446003)(2616005)(126002)(476003)(336012)(4326008)(26005)(14444005)(186003)(426003)(11346002)(478600001)(486006)(51416003)(50466002)(53936002)(76176011)(305945005)(50226002)(47776003)(1076003)(70586007)(6666004)(450100002)(48376002)(16586007)(2906002)(356004)(70206006)(36756003)(86362001)(8676002)(81156014)(49486002)(81166006)(5660300002)(8936002)(110136005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f7c7abc-ad9f-4d5f-e330-08d724bd0112
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1270C2B1EC86331BEB125495EFA80@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: i3ud5Iiz0/C+OZgY39h88ebV+qcpQq9TWsKOCDo+0Sx7OZEPsS/4hBQFES8iOB9mleTncl4YvTJ4FKCMi3SqvR+zz5H4PqyRm5ViS39WcwNm1y2ly913mQfeUMRsx70pnZmt9Clb5AIzlVYElEH4jJ5nY9JvAw7F+K776F/kya6syz7sM5lYttIsmS/qZh1dNHl1ADBdeCj4mKfk43+O83MJjuuoLd1bIcToesAxQVJGmZOimdM9WIu4jT09DqGXZpeoromOuzsitcoMjaYAvR+au9/b01ogsr9CJ7Pl0XowuFFUBDXDweYnwSXJICll1k6xYsMnJT+0sqKdsF556JhhpDQzu0nYD9IFtEGchxHbbs0xEil2+xZcgs7+JFppXtnKv5OhgwGejznpJaS/ETCuC6VoWX2gyaC85F1rceo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:48.0037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7c7abc-ad9f-4d5f-e330-08d724bd0112
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUn+8zXdgXGw6vXB/46FAtb65tpY9dUUoJqhJ99W3BQ=;
 b=dBwsw+aVMG7Jth+5HsdlU93+r+xSewXpI/KtK0dfpwFGGB191lO+6V3Vh43nqu73JhxIK69nzS6Xu4voHAf1qBFu5UP3VnDg0wtz3nbb0xAYscrvUbTFy0oxL6YFQOjFmZd+psfEtZ4QXac7MGcYuEIa415ZDywfZGcuNJtNt1g=
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
ZEBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0
cmVhbV9lbmNvZGVyLmMgICB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggNmQ1NDk0MmFiOThiLi5hNGU2NzI4NmNk
YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCkBAIC0yNzcsMTQgKzI3Nyw2IEBAIHN0YXRpYyB2
b2lkIGVuYzJfZHBfc2V0X2RzY19jb25maWcoc3RydWN0IHN0cmVhbV9lbmNvZGVyICplbmMsCiAJ
CQkJCXVpbnQzMl90IGRzY19zbGljZV93aWR0aCkKIHsKIAlzdHJ1Y3QgZGNuMTBfc3RyZWFtX2Vu
Y29kZXIgKmVuYzEgPSBEQ04xMFNUUkVOQ19GUk9NX1NUUkVOQyhlbmMpOwotCXVpbnQzMl90IGRz
Y192YWx1ZSA9IDA7Ci0KLQlkc2NfdmFsdWUgPSBSRUdfUkVBRChEUF9EU0NfQ05UTCk7Ci0KLQkv
KiBkc2MgZGlzYWJsZSBza2lwICovCi0JaWYgKChkc2NfdmFsdWUgJiAweDMpID09IDB4MCkKLQkJ
cmV0dXJuOwotCiAKIAlSRUdfVVBEQVRFXzIoRFBfRFNDX0NOVEwsCiAJCQlEUF9EU0NfTU9ERSwg
ZHNjX21vZGUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
