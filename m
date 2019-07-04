Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893A5FD41
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4576E3C9;
	Thu,  4 Jul 2019 19:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AEA6E3C7;
 Thu,  4 Jul 2019 19:06:30 +0000 (UTC)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by CY4PR12MB1191.namprd12.prod.outlook.com (2603:10b6:903:44::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 19:06:29 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:27 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:22 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/10] drm/bridge/analogix-anx78xx: Use connector kdev as aux
 device parent
Date: Thu, 4 Jul 2019 15:05:14 -0400
Message-ID: <20190704190519.29525-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(50226002)(446003)(2876002)(2616005)(426003)(11346002)(51416003)(86362001)(1076003)(476003)(186003)(81156014)(49486002)(14444005)(8936002)(8676002)(76176011)(50466002)(6666004)(81166006)(305945005)(356004)(77096007)(5024004)(336012)(26005)(2870700001)(70206006)(48376002)(5660300002)(316002)(36756003)(4326008)(47776003)(2906002)(68736007)(70586007)(486006)(53936002)(54906003)(110136005)(126002)(72206003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1191; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 106e3f1d-e4c9-458b-6d1a-08d700b2b772
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1191; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1191:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1191015B193045980127DCD582FA0@CY4PR12MB1191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ihkacEUJIJaFxaV9wpVH+LNs2msrm0noz7n1RiXlGJFXpHwi+gG1lZsYkstplYwK041oB2VEswxaAT64kni4nye2LN0Y5PKAsYSZBLhTV/FhoXqPziYmfe4hdRcdQLrCztFwv8buGGFbmQRpW04IPXa2h9b1z+am16+l9NNNiWpEwt69WTJ0JNMsnywr5uVyS97X9iICaqmUsCifGQ83sTSfJH0ipzD3TleKQyFwvEoHMkYFQDx4aRkkVAy8rXNr5j2SnNJ1X2p6U1eGtjhW6O5b/Sn29FElKZA3g5qV7J/zTowFWXdaQja2OBLkvSAUzW0UzbwGiCf9HI8/zCrNHpPHiv3ww9sqC6ORFHZ5koAWd5x45TQjwiWO3tZOgJgM2X5DhxVYwZtlOjQEO+G/ECNC5n61gBfekgYNymCaq90=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:27.4432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106e3f1d-e4c9-458b-6d1a-08d700b2b772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+1U3k9GYsWrEV/m0WSElHM9u8VbSWfg9n36hVgrw/U=;
 b=IBJd3ntV5f/fDAs2iGaqvPM4v6s8OpzEwPCbLxlc2Kn5yJaPbDy99JD8isZA9KvRcySL0RLB0XCn0P9BbxB+1/XEpv+3gSCNMUTRQ95LgQHX6jA9MlFdjzbQ4jVBBUBBVcGfavLO1MNjkrie83ZEHCZKESQ4Xlezd6gN1Sci9Hs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKVG8gZG8gc28sIHRoZSBjb25uZWN0b3Ig
bmVlZHMgdG8gYmUgcmVnaXN0ZXJlZCBiZWZvcmVoYW5kLiBUaGVyZWZvcmUsCnNoaWZ0IGF1eCBy
ZWdpc3RyYXRpb24gdG8gYmUgYWZ0ZXIgY29ubmVjdG9yIHJlZ2lzdHJhdGlvbi4KCkNjOiBFbnJp
YyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgpDYzogTmlj
b2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eC5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC1hbng3OHh4LmMKaW5kZXggM2M3Y2M1YWY3MzVjLi5jMjgwMGNkM2UyZWUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCkBAIC0xMDA4LDE3ICsx
MDA4LDYgQEAgc3RhdGljIGludCBhbng3OHh4X2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAJfQogCi0JLyogUmVnaXN0ZXIgYXV4IGNo
YW5uZWwgKi8KLQlhbng3OHh4LT5hdXgubmFtZSA9ICJEUC1BVVgiOwotCWFueDc4eHgtPmF1eC5k
ZXYgPSAmYW54Nzh4eC0+Y2xpZW50LT5kZXY7Ci0JYW54Nzh4eC0+YXV4LnRyYW5zZmVyID0gYW54
Nzh4eF9hdXhfdHJhbnNmZXI7Ci0KLQllcnIgPSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhbng3OHh4
LT5hdXgpOwotCWlmIChlcnIgPCAwKSB7Ci0JCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lzdGVy
IGF1eCBjaGFubmVsOiAlZFxuIiwgZXJyKTsKLQkJcmV0dXJuIGVycjsKLQl9Ci0KIAllcnIgPSBk
cm1fY29ubmVjdG9yX2luaXQoYnJpZGdlLT5kZXYsICZhbng3OHh4LT5jb25uZWN0b3IsCiAJCQkJ
ICZhbng3OHh4X2Nvbm5lY3Rvcl9mdW5jcywKIAkJCQkgRFJNX01PREVfQ09OTkVDVE9SX0Rpc3Bs
YXlQb3J0KTsKQEAgLTEwMzgsNiArMTAyNywxNyBAQCBzdGF0aWMgaW50IGFueDc4eHhfYnJpZGdl
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJYW54Nzh4eC0+Y29ubmVjdG9y
LnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKKwkvKiBSZWdpc3RlciBhdXggY2hh
bm5lbCAqLworCWFueDc4eHgtPmF1eC5uYW1lID0gIkRQLUFVWCI7CisJYW54Nzh4eC0+YXV4LmRl
diA9IGFueDc4eHgtPmNvbm5lY3Rvci5rZGV2OworCWFueDc4eHgtPmF1eC50cmFuc2ZlciA9IGFu
eDc4eHhfYXV4X3RyYW5zZmVyOworCisJZXJyID0gZHJtX2RwX2F1eF9yZWdpc3RlcigmYW54Nzh4
eC0+YXV4KTsKKwlpZiAoZXJyIDwgMCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZWdpc3Rl
ciBhdXggY2hhbm5lbDogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7CisJfQorCiAJZXJyID0g
ZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmYW54Nzh4eC0+Y29ubmVjdG9yLAogCQkJCQkg
ICBicmlkZ2UtPmVuY29kZXIpOwogCWlmIChlcnIpIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
