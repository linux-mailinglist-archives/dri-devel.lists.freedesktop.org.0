Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC410E4EE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 04:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233EE89C17;
	Mon,  2 Dec 2019 03:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937F289C17;
 Mon,  2 Dec 2019 03:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDwLCRZaP6MBz5wJEE1FJpxeKUGmSCpixgzwN7W6WwFnm0FIePLQIk3XMCCDWt6e2VdK+Q3yxTpeEf+A7QBWmgApHglxDx3osNhXYMk1KZdA5V/ykMy0KOjH0GAXlT+sXWc6auW6YUxAQ0epSbpQNHxAS1T5J0AEtEan9ZtZsWyOYLrQcgyeDAnZPTvRCYz8u8Eri9bMP3SDDz+KbJQyOPGhX68njEwfmHTnZDAe0IOaLMl0ymTN5qNph/aD0VhIJWQo8GGrWSpBiU5sQ5Zi3XvwAz0ESsZOyEN88d6d7gjQ2oFfeu0Ae84dwuuHfN7yra9ZpBHM23v8CELRHkX9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFesstjvR9aPczUE8dLuv6bK+uduYwvkBBw3kKCSV48=;
 b=HklM040q2rezzcv/+DaR8Bci4Gpe2jYC1TOh7la4uxh/jADIO+jjEEbehMmmyA5EEe/QDPj/IEE5JtzOKsrMpCAQRXBDCV7n1VnpDc3pppI30UD0gTO+HlyZKlOSfXpqlFacKt8loHbkyEXW1J2DizavoNoe4BlXp2KBxE85NVamd4gU9q9GVhFBkdlLPmge4qABcITAYBPFyYRvda8Qy0hm8FJlLtTVVrYYJEnIDKah5v6FDVbNXZCDCiTSRl/qzq3P2wVAMju227jT2f0TwznuWEdEZLP7/Vto2WmBZddflOJTHLgZx3BTM0n+UI5RgveIuK+8mqxRrxs3r2VXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by BN8PR12MB3617.namprd12.prod.outlook.com (2603:10b6:408:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19; Mon, 2 Dec
 2019 03:58:30 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::200) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.17 via Frontend
 Transport; Mon, 2 Dec 2019 03:58:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 03:58:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 1 Dec 2019
 21:58:29 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 1 Dec 2019
 21:58:28 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 1 Dec 2019 21:58:26 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Remove VCPI while disabling topology mgr
Date: Mon, 2 Dec 2019 11:57:37 +0800
Message-ID: <20191202035737.16909-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(189003)(199004)(6666004)(50226002)(53416004)(36756003)(14444005)(48376002)(336012)(305945005)(186003)(5660300002)(81156014)(81166006)(478600001)(54906003)(316002)(16586007)(8676002)(356004)(26005)(50466002)(47776003)(1076003)(8936002)(86362001)(2906002)(4326008)(426003)(51416003)(7696005)(2616005)(70586007)(110136005)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3617; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 285d5e0e-17b4-4806-6185-08d776dbe444
X-MS-TrafficTypeDiagnostic: BN8PR12MB3617:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3617E58495C0B27E90FF43E7FC430@BN8PR12MB3617.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqkhVn/UslgCHOPMspZLx+VZx6ys6a2c9L35z0YI//LuPO3bidSaKa+5lIjLYytLRrUfAHNtOYarEUa7WrNMqY38OogwlCKQOMMuB0zS3VGDEoq/lwnLsJ84gjwjNcPORGSkehnbO+aufmh1KoQXOOWS7f2TwWIiLpS8talp14HH5ZubgOp5IOqUsZXdbezRvhBdIiyrAxmOiKU4dnV3rSovRvZkw2laAsWM/J/l7JJaJxqBLnZzI8m5ZKjv0tuIsMqxX/oN0VQpk82138ypqX6NpIOERD/vLlazahSvmaNTnlJSRvU/Vhq3rVD/Tgz05Easz2VQ6xfaHmnD/ZqkABjC2peF3Icr1tqX21L30nOE1ZxbyEmUgajE2PxXlPL5lmWwWFENWi6bffcztypcgJTKj+x7Kru10KXRmf78TOl2bPwxy3nWDQcPgxNh2Eer
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 03:58:29.5400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285d5e0e-17b4-4806-6185-08d776dbe444
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFesstjvR9aPczUE8dLuv6bK+uduYwvkBBw3kKCSV48=;
 b=RYfq3sjzZ+Z6qsOmCasvFUv55zdw5VuiXlj7+0e1C+zilD6RVwd832pkq/icicCSsuVcWndVal3o+VL3qZXDgsEFKfGO/VFfj9RAhf8/JtZu5RtvD0iu/supCfWXVFF1abfvXGvu/8iQ/9fresfAH8Yepoc7gFaSMv4mHwInAFM=
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
Cc: Jerry.Zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KV2hpbGUgZGlzYWJsaW5nIG1zdCB0b3BvbG9neSBtYW5hZ2VyIGluCmRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyX3NldF9tc3QoKSwgbm93IGp1c3QgcmVzZXQgdGhlIG1nci0+cGF5bG9hZHMK
YnV0IGRvZXNuJ3QgaGFuZGxlIHRoZSBtZ3ItPnByb3Bvc2VkX3ZjcGlzLgoKW0hvd10KUmVtb3Zl
IG1nci0+cHJvcG9zZWRfdmNwaXMgdG8gTlVMTC4KClNpZ25lZC1vZmYtYnk6IFdheW5lIExpbiA8
V2F5bmUuTGluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCBhZTU4MDlhMWYxOWEuLjgx
ZTkyYjI2MGQ3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0zMzg2
LDYgKzMzODYsNyBAQCBzdGF0aWMgaW50IGRybV9kcF9nZXRfdmNfcGF5bG9hZF9idyh1OCBkcF9s
aW5rX2J3LCB1OCAgZHBfbGlua19jb3VudCkKIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9z
ZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBib29sIG1zdF9zdGF0
ZSkKIHsKIAlpbnQgcmV0ID0gMDsKKwlpbnQgaSA9IDA7CiAJc3RydWN0IGRybV9kcF9tc3RfYnJh
bmNoICptc3RiID0gTlVMTDsKIAogCW11dGV4X2xvY2soJm1nci0+bG9jayk7CkBAIC0zNDQ2LDEw
ICszNDQ3LDIxIEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBib29sIG1zCiAJCS8qIHRoaXMgY2FuIGZhaWwg
aWYgdGhlIGRldmljZSBpcyBnb25lICovCiAJCWRybV9kcF9kcGNkX3dyaXRlYihtZ3ItPmF1eCwg
RFBfTVNUTV9DVFJMLCAwKTsKIAkJcmV0ID0gMDsKKwkJbXV0ZXhfbG9jaygmbWdyLT5wYXlsb2Fk
X2xvY2spOwogCQltZW1zZXQobWdyLT5wYXlsb2FkcywgMCwgbWdyLT5tYXhfcGF5bG9hZHMgKiBz
aXplb2Yoc3RydWN0IGRybV9kcF9wYXlsb2FkKSk7CiAJCW1nci0+cGF5bG9hZF9tYXNrID0gMDsK
IAkJc2V0X2JpdCgwLCAmbWdyLT5wYXlsb2FkX21hc2spOworCQlmb3IgKGkgPSAwOyBpIDwgbWdy
LT5tYXhfcGF5bG9hZHM7IGkrKykgeworCQkJc3RydWN0IGRybV9kcF92Y3BpICp0bXBfdmNwaSA9
IG1nci0+cHJvcG9zZWRfdmNwaXNbaV07CisKKwkJCWlmICh0bXBfdmNwaSkgeworCQkJCXRtcF92
Y3BpLT52Y3BpID0gMDsKKwkJCQl0bXBfdmNwaS0+bnVtX3Nsb3RzID0gMDsKKwkJCX0KKwkJCW1n
ci0+cHJvcG9zZWRfdmNwaXNbaV0gPSBOVUxMOworCQl9CiAJCW1nci0+dmNwaV9tYXNrID0gMDsK
KwkJbXV0ZXhfdW5sb2NrKCZtZ3ItPnBheWxvYWRfbG9jayk7CiAJfQogCiBvdXRfdW5sb2NrOgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
