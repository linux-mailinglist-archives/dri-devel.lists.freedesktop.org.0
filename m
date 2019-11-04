Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B0EEACE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 22:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728516E884;
	Mon,  4 Nov 2019 21:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146E76E883;
 Mon,  4 Nov 2019 21:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZcpKKnwe+3r99r3fV8wR5vc3mkobRHBhwa8SX6IOpSQZK8zIrwVLDt1zXX6Bkop3HafY5dBG46mg20P72JlzYo9K9RvP2sLc6xrofPbE0O0Y68MYC2X6zbiW6StFEAVPX6RhnCFuZaHEKFGNSWUJ1HdXnmsr7CFDkUNvZi0OlHtIkjV9rzzaPEVapbtpYyGx1mUsfHQjGz7XkXY5HTN7jQFjGvDMVnT+1yEZjvEcXXthAi8oJlhM8L1orxBYFqOa0Y0/UDsWg5lf1Y4RxHTYcApvadXZm+HtrJCUXbUeq3d2Mw8qGBKFPymutpAchk1+KV7LLNAfuCSbCo50Jxr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv6umGelCWQcb1CXOknVFPZXegfxcDdxybBnbr0btoY=;
 b=GDnPmFwLgXmNMMxYApGRFZcW96p5PDLRn0saXGIxZmy2TXGahfMKkYtXPSzfgqiFeazJU1cG4si6inFnnQKCbRpu4RrBdULcFwYItmoOX61fmH0W1UteLXyPDaVAzfRrZDjaG4GjzMnj/cEKd6kmXVxVlM+uqG/IxRJM97GzDvHDFSsJrUzhLhaMxOuaVezGnHy13W85Ysge+UZm20tXzDV8+fvnYbMCHvNF3/CE8bs4nukUlfYK733PEtqzAVCMyqUF3k8Xn/94l9kAfDABF9YyjZPGz/hj1oBuA/TWy5HlDBOyffMMmtDy2JAYCXiENJp/9ULM3o9HTjCwle2QhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0047.namprd12.prod.outlook.com (2603:10b6:802:20::18)
 by CH2PR12MB3784.namprd12.prod.outlook.com (2603:10b6:610:21::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Mon, 4 Nov
 2019 21:13:46 +0000
Received: from DM3NAM03FT044.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by SN1PR12CA0047.outlook.office365.com
 (2603:10b6:802:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.24 via Frontend
 Transport; Mon, 4 Nov 2019 21:13:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT044.mail.protection.outlook.com (10.152.82.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Mon, 4 Nov 2019 21:13:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 4 Nov 2019
 15:13:45 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 4 Nov 2019
 15:13:45 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 4 Nov 2019 15:13:44 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: Hook up drm interface for DP 1.4 edid
 corruption test
Date: Mon, 4 Nov 2019 16:13:40 -0500
Message-ID: <20191104211340.30604-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191030210844.19803-3-Jerry.Zuo@amd.com>
References: <20191030210844.19803-3-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(189003)(199004)(36756003)(426003)(1076003)(316002)(2616005)(8676002)(305945005)(53416004)(126002)(476003)(11346002)(70586007)(70206006)(14444005)(48376002)(16586007)(50466002)(4326008)(478600001)(2906002)(86362001)(47776003)(186003)(26005)(8936002)(51416003)(486006)(5660300002)(81166006)(81156014)(446003)(7696005)(110136005)(54906003)(6666004)(50226002)(356004)(76176011)(336012)(52103002)(158003001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3784; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f56a0b-34ef-4109-0278-08d7616be0fd
X-MS-TrafficTypeDiagnostic: CH2PR12MB3784:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3784B588A4533B78227B38C0E57F0@CH2PR12MB3784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-Forefront-PRVS: 0211965D06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O49teLn5RKW9Uv9m9d/sA46HRBdE/UZxIx0l0pvJGlooP9DxYM3ElyKA1/MQV2fxCWY+Kh6VMz9d03DrYIV6x/zF+NBZF2KlErdrt9NpM8HFF6Y3PHMR/x6ETiKyvn4Na6520cVrgb/rDS8BIsjDybytYSgqmvc18JL4H7mHf9U8Txbe2e14M6sM0d8cXLUPsG1TzqIWGnGt7NRjz0o/Bnfj6oeq1leQNVsVHlaXslb1E0tHuwg1qO5YeldHDx0+dzjhht4lhz01FYaUfolwf7O25VzEjuDsC5jbGXpmTyJ1yZ9JaTS4ORxvbzbJrcq20rYKajUnt260vGmOpL/y/XaloflJA3F7+IAyfbFsKqYM2HiVxjuKnaO65Il91bH6jwCLiDmt5O/eSJfZUvSndWzI/HDDFQtPmxPyaYZ9mNnOkMe/VI5PeHfzBL51XJpG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2019 21:13:45.9406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f56a0b-34ef-4109-0278-08d7616be0fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv6umGelCWQcb1CXOknVFPZXegfxcDdxybBnbr0btoY=;
 b=f1JhHfwtw1g1iFoI38R+ivrUPHg0WDpKTvWuvN6C34gBEK510wJhKCsLOYSgziJPqKVM/PpFu/zyQ3b6hkKAfy5xsPysU7FseI5n1aLnnrnQgKSztZajgUC2iLJ0leMZkCkQuo5IsBrT753QI7iuH5V+AJDXSTNVFJbSk/XBMvg=
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
Cc: manasi.d.navare@intel.com, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LXYzOiBSZW5hbWUgdG8gYXZvaWQgY29uZnVzaW9uCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSAoRmFu
Z3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jICB8IDM1ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hl
bHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYwppbmRleCAxMWU1Nzg0YWE2MmEuLjkyN2ZkYWM3N2I2ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hl
bHBlcnMuYwpAQCAtNTc1LDYgKzU3NSw3IEBAIGVudW0gZGNfZWRpZF9zdGF0dXMgZG1faGVscGVy
c19yZWFkX2xvY2FsX2VkaWQoCiAJCXN0cnVjdCBkY19zaW5rICpzaW5rKQogewogCXN0cnVjdCBh
bWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gbGluay0+cHJpdjsKKwlzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yID0gJmFjb25uZWN0b3ItPmJhc2U7CiAJc3RydWN0IGkyY19h
ZGFwdGVyICpkZGM7CiAJaW50IHJldHJ5ID0gMzsKIAllbnVtIGRjX2VkaWRfc3RhdHVzIGVkaWRf
c3RhdHVzOwpAQCAtNTkyLDYgKzU5MywxMiBAQCBlbnVtIGRjX2VkaWRfc3RhdHVzIGRtX2hlbHBl
cnNfcmVhZF9sb2NhbF9lZGlkKAogCiAJCWVkaWQgPSBkcm1fZ2V0X2VkaWQoJmFjb25uZWN0b3It
PmJhc2UsIGRkYyk7CiAKKwkJaWYgKGxpbmstPmF1eF9tb2RlICYmIGNvbm5lY3Rvci0+ZWRpZF9j
b3JydXB0KQorCQkJZHJtX2RwX3NlbmRfcmVhbF9lZGlkX2NoZWNrc3VtKCZhY29ubmVjdG9yLT5k
bV9kcF9hdXguYXV4LCBjb25uZWN0b3ItPnJlYWxfZWRpZF9jaGVja3N1bSk7CisKKwkJaWYgKCFl
ZGlkICYmIGNvbm5lY3Rvci0+ZWRpZF9jb3JydXB0KQorCQkJcmV0dXJuIEVESURfQkFEX0NIRUNL
U1VNOworCiAJCWlmICghZWRpZCkKIAkJCXJldHVybiBFRElEX05PX1JFU1BPTlNFOwogCkBAIC02
MTIsMzQgKzYxOSw2IEBAIGVudW0gZGNfZWRpZF9zdGF0dXMgZG1faGVscGVyc19yZWFkX2xvY2Fs
X2VkaWQoCiAJCURSTV9FUlJPUigiRURJRCBlcnI6ICVkLCBvbiBjb25uZWN0b3I6ICVzIiwKIAkJ
CQllZGlkX3N0YXR1cywKIAkJCQlhY29ubmVjdG9yLT5iYXNlLm5hbWUpOwotCWlmIChsaW5rLT5h
dXhfbW9kZSkgewotCQl1bmlvbiB0ZXN0X3JlcXVlc3QgdGVzdF9yZXF1ZXN0ID0geyB7MH0gfTsK
LQkJdW5pb24gdGVzdF9yZXNwb25zZSB0ZXN0X3Jlc3BvbnNlID0geyB7MH0gfTsKLQotCQlkbV9o
ZWxwZXJzX2RwX3JlYWRfZHBjZChjdHgsCi0JCQkJCWxpbmssCi0JCQkJCURQX1RFU1RfUkVRVUVT
VCwKLQkJCQkJJnRlc3RfcmVxdWVzdC5yYXcsCi0JCQkJCXNpemVvZih1bmlvbiB0ZXN0X3JlcXVl
c3QpKTsKLQotCQlpZiAoIXRlc3RfcmVxdWVzdC5iaXRzLkVESURfUkVBRCkKLQkJCXJldHVybiBl
ZGlkX3N0YXR1czsKLQotCQl0ZXN0X3Jlc3BvbnNlLmJpdHMuRURJRF9DSEVDS1NVTV9XUklURSA9
IDE7Ci0KLQkJZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwKLQkJCQkJbGluaywKLQkJCQkJ
RFBfVEVTVF9FRElEX0NIRUNLU1VNLAotCQkJCQkmc2luay0+ZGNfZWRpZC5yYXdfZWRpZFtzaW5r
LT5kY19lZGlkLmxlbmd0aC0xXSwKLQkJCQkJMSk7Ci0KLQkJZG1faGVscGVyc19kcF93cml0ZV9k
cGNkKGN0eCwKLQkJCQkJbGluaywKLQkJCQkJRFBfVEVTVF9SRVNQT05TRSwKLQkJCQkJJnRlc3Rf
cmVzcG9uc2UucmF3LAotCQkJCQlzaXplb2YodGVzdF9yZXNwb25zZSkpOwotCi0JfQogCiAJcmV0
dXJuIGVkaWRfc3RhdHVzOwogfQotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
