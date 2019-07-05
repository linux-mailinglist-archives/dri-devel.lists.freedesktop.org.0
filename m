Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AFE607ED
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB646E4D4;
	Fri,  5 Jul 2019 14:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336356E4D2;
 Fri,  5 Jul 2019 14:32:30 +0000 (UTC)
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 DM5PR12MB1196.namprd12.prod.outlook.com (2603:10b6:3:74::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Fri, 5 Jul 2019 14:32:27 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via Frontend
 Transport; Fri, 5 Jul 2019 14:32:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 5 Jul 2019 14:32:27 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 5 Jul 2019 09:32:27 -0500
From: <sunpeng.li@amd.com>
To: <ville.syrjala@linux.intel.com>, <lyude@redhat.com>
Subject: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
Date: Fri, 5 Jul 2019 10:32:20 -0400
Message-ID: <20190705143220.11109-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-4-sunpeng.li@amd.com>
References: <20190704190519.29525-4-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(199004)(189003)(81166006)(8676002)(68736007)(81156014)(8936002)(72206003)(305945005)(478600001)(54906003)(110136005)(53936002)(36756003)(1076003)(356004)(6666004)(316002)(4326008)(2876002)(486006)(476003)(2616005)(11346002)(446003)(426003)(126002)(86362001)(47776003)(49486002)(186003)(77096007)(2906002)(48376002)(70206006)(26005)(50466002)(70586007)(5660300002)(51416003)(76176011)(50226002)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1196; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201367c0-4a52-45cf-bd18-08d701559ad1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1196; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1196:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11962456B7FB76140F65B7D082F50@DM5PR12MB1196.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 008960E8EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bQVhTU+hehHk0rPbU1RD+Eqoy37/ZDPNAHGnzP1oeKsoj67CvV/A/mnSwuNNEiPOeQRu7JbpBJK8P38YGHDf57EAzoTxcDl0/vUxj6ESedvCav1IOnle92riNh6JLmwX8zWC7vVzDYA4JutqpvA4x7JHs7kEpcw6mgQTJ8VwiVFRBiKTRp83qVKPUxN3oNMpQr2duslVXZlGWk2EhZO5b1Wkdvl2MypQ1q/1zZ26vDQfzuVLTHcKCpGLPkZedA42oyTXDMRYm/9Gp4XaMpReUFPxRJV9vngW7mLpsviynYu3UpPhq/FxJSP0AuQ97YqJAYNqPAsAG2iEi4J2fAhm6rUlE+0+iAqJPprnJeWqOT0wWcmS0LejpRtX64pNhib9jAfZgaQq4s3703u0a761xbBvNRx2sBBBzmFtY+4J+Ig=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2019 14:32:27.4186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201367c0-4a52-45cf-bd18-08d701559ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uuFFoZE5k4n9xlDyOehYNZgegiCNzVKaqSPx8AC7RE=;
 b=yvIDM7ZiTrpOA6lRVXaeg9sLgMEtDoXATEer4hj2aW637sefxQiT8GMJyI6GFpa2IA01e4Ux1w8fMtbD950X58l4RJ8HfAQCb2hOYDi8mrPd2FtmbsyE9LUxaeM+QlwfZaq07Q6QRRgjzFlti9kY4yMOjDY+vGZ73RvS4GQ8zIA=
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIGNhbiBiZSB1c2VkIHRvIGNy
ZWF0ZSBtb3JlIGRlc2NyaXB0aXZlIHN5bWxpbmtzIGZvciBNU1QgYXV4CmRldmljZXMuIENvbnNp
ZGVyIHRoZSBmb2xsb3dpbmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYi
LCBTVUJTWVNURU1TPT0iZHJtIiwgQVRUUlN7bXN0cGF0aH09PSI/KiIsCglTWU1MSU5LKz0iZHJt
X2RwX2F1eC9ieS1wYXRoLyRhdHRye21zdHBhdGh9IgoKVGhlIGZvbGxvd2luZyBzeW1saW5rcyB3
aWxsIGJlIGNyZWF0ZWQgKGRlcGVuZGluZyBvbiB5b3VyIE1TVCB0b3BvbG9neSk6CgokIGxzIC9k
ZXYvZHJtX2RwX2F1eC9ieS1wYXRoLwpjYXJkMC1tc3Q6MC0xICBjYXJkMC1tc3Q6MC0xLTEgIGNh
cmQwLW1zdDowLTEtOCAgY2FyZDAtbXN0OjAtOAoKdjI6IHJlbW92ZSB1bm5lY2Vzc2FyeSBsb2Nr
aW5nIG9mIG1vZGVfY29uZmlnLm11dGV4CgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgfCAyMCArKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5
c2ZzLmMKaW5kZXggYWQxMDgxMGJjOTcyLi43ZDQ4M2FiNjg0YTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3lzZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMK
QEAgLTIzNiwxNiArMjM2LDM2IEBAIHN0YXRpYyBzc2l6ZV90IG1vZGVzX3Nob3coc3RydWN0IGRl
dmljZSAqZGV2aWNlLAogCXJldHVybiB3cml0dGVuOwogfQogCitzdGF0aWMgc3NpemVfdCBtc3Rw
YXRoX3Nob3coc3RydWN0IGRldmljZSAqZGV2aWNlLAorCQkJICAgIHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLAorCQkJICAgIGNoYXIgKmJ1ZikKK3sKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yID0gdG9fZHJtX2Nvbm5lY3RvcihkZXZpY2UpOworCXNzaXplX3QgcmV0ID0g
MDsKKwljaGFyICpwYXRoOworCisJaWYgKCFjb25uZWN0b3ItPnBhdGhfYmxvYl9wdHIpCisJCXJl
dHVybiByZXQ7CisKKwlwYXRoID0gY29ubmVjdG9yLT5wYXRoX2Jsb2JfcHRyLT5kYXRhOworCXJl
dCA9IHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiY2FyZCVkLSVzXG4iLAorCQkgICAgICAgY29u
bmVjdG9yLT5kZXYtPnByaW1hcnktPmluZGV4LCBwYXRoKTsKKworCXJldHVybiByZXQ7Cit9CisK
IHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhzdGF0dXMpOwogc3RhdGljIERFVklDRV9BVFRSX1JPKGVu
YWJsZWQpOwogc3RhdGljIERFVklDRV9BVFRSX1JPKGRwbXMpOwogc3RhdGljIERFVklDRV9BVFRS
X1JPKG1vZGVzKTsKK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhtc3RwYXRoKTsKIAogc3RhdGljIHN0
cnVjdCBhdHRyaWJ1dGUgKmNvbm5lY3Rvcl9kZXZfYXR0cnNbXSA9IHsKIAkmZGV2X2F0dHJfc3Rh
dHVzLmF0dHIsCiAJJmRldl9hdHRyX2VuYWJsZWQuYXR0ciwKIAkmZGV2X2F0dHJfZHBtcy5hdHRy
LAogCSZkZXZfYXR0cl9tb2Rlcy5hdHRyLAorCSZkZXZfYXR0cl9tc3RwYXRoLmF0dHIsCiAJTlVM
TAogfTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
