Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE5984EA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8005D6E98D;
	Wed, 21 Aug 2019 20:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9BF6E985;
 Wed, 21 Aug 2019 20:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwqJ3IF85sKGqbtkPzhnZ48KSnKBJexEVZWLlJkPBSjkDPTLdQ9qn5mSqdHjy8h18Pj0Ec/In9gdfJw9ECZir/THygg/L/2oWymqv8BiLM2s8oA6QWh1J3+3WzC/rXzzzQSsdVyH2OF+CCZGx5B1OimdYNJ8wHZZlKMfQxr0P50Tpub1LK26hvHWkzGiob5BVJRkkrAYKNu35Ejw1SiN/wygXNKoDDJUv/xxcn9zIGlVhe9dvLGxUNrXYSbKWXKC/BY8Flsbne58FhV8EfeMxM2Ej0tU4CAzCAujOFx2oKBA3z/gP9pA2VnsdXugywYlJOIegylz+I02/V6XaBRK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad5QdkLef/A+rdIQQWP3FTj0kRa3P6DtHyGuaj8rCCU=;
 b=LqfwwlD2AZi0+AsdHXHsIN7iD+t4/y8ycBztLfdp2G1nh8+Z13TOTbls/nMbMBDV8tPa8GNhCjZjbLkSYP7ZvUqcM2FI+Z3Uxd2A8XSSA+5qg+BcrFK0njYJwogrvEOsxL3r6yZJSYjnHxSTfKgkDDZWAx+z0KB/I1QOx9UoeI18Qez10iadZJdze2U99N89fhGYS7n5eQg+Joh08Y2zhuBnCMTt93YygBzBOilR9TauChmy42X2SI6IQiLWr0UviEooIjxv/dBORsCRaB0baIGcYUxiOktGBLeS4MbBUKH/cLJiCSAQopOOEWcuXwAowcAwaBcqMTm8sFXKEqYLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0006.namprd12.prod.outlook.com (2603:10b6:403:2::16)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:01:41 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by BN4PR12CA0006.outlook.office365.com
 (2603:10b6:403:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:40 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:34 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 02/16] Revert "drm/amd/display: navi10 bring up skip dsc
 encoder config"
Date: Wed, 21 Aug 2019 16:01:15 -0400
Message-ID: <20190821200129.11575-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(376002)(396003)(136003)(2980300002)(428003)(199004)(189003)(6666004)(36756003)(2906002)(16586007)(356004)(450100002)(1076003)(478600001)(50226002)(8676002)(81156014)(81166006)(8936002)(4326008)(14444005)(5660300002)(86362001)(110136005)(53936002)(316002)(2616005)(51416003)(70206006)(70586007)(49486002)(47776003)(305945005)(446003)(11346002)(426003)(126002)(476003)(486006)(336012)(48376002)(26005)(50466002)(186003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3bef04c-951c-4122-9e40-08d7267261e6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1268234901A27698FE7E5DDCEFAA0@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: edvcvgmDmAKSI0VKetPhrzE4jymx21nDrh1B8tLptpyhfKuyyaDZPKixzJxwspyB2eiPyUm6uVhWhWk2DDQJOfC3JciuvMFkGnR0yIqwvzarinGFkgUF+uAIL0IcmATZGikalxD9z/CkpoJupabU7sC32i4HrSK5v+QAcodUAaxjmNg7mf886HjRogjN8eQZrG41o6WEF3ZRXv3v2hLeueWJlT44J/GvlNFh5W1c7nXpQlfLNNX8Wi1f2FDWmH7oQ6RzyVVY+wpeg5BK9wi7u4Yv6LfLfllP8jcsaj9/3jn+MFBUO7eNQeXaUH0V4sQ8VrUt/XFZkJSO1W8Nwc0GIbXL7JZM4Jev9U/kopBA6AeHU2ZDx+50kBcsdlWOnikxmdX7EjzXIrFggd0rpdm5RSUnJ8qKXoo/VcQNxRVIwfg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:40.4813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bef04c-951c-4122-9e40-08d7267261e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad5QdkLef/A+rdIQQWP3FTj0kRa3P6DtHyGuaj8rCCU=;
 b=CNteeKsxvyxPXrQWbJkxt1ZMOHKX9HkcHfWbXF35samAYGQc61m1T7rOE6RYpoIIxtEABzaldX0kRvrZHi/6TJq0TaO1jy7QuBSnkIl5GALgcmBeydtjimWhVPaDMD5R1hPJruYiXjAc28J+tMRr0z0rSnIh1frs3YNRdTZBsKk=
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
