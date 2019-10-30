Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E1EA426
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749626ED1E;
	Wed, 30 Oct 2019 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7516ED2D;
 Wed, 30 Oct 2019 19:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIKM8ZWZ/ibe4mmtnQNjG7u7H/kmMCwsAw6AJFlFEKeKo5EPgZUWNblpCXWTQkiVQZfxnskcUkWlI4MXRczLwuDVmc+ww4gfytrbUs155GrK4g+bH2P1vQtD1Rkn8Mycjw1ApaXw45YocheB6RLUV9rbwz2sud+SUEMMq2Apls4kMty8g2/4lzoFQBigQGEKqgyK91NSd3VDrfgywuCSvvluTJErY8Ch+CrsamPhcSIZonGiaj6wBL3IG0LIJlbd/tma2uOwZpe8CQS0Ex7NHDOlMb5nNJb/6z9qaD3r6CSa48mOz4SaXo19bLWAvAEHi1mKHIzZRVujcN8MA9URPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiPPz/0vsukTGH0ZDkhUo1azABN+W79GAY4r8CFOp6I=;
 b=aT+8aA9vL+KtcKoli7OXqejz4w9tlsGJqErmyqq1Gr0HNu2RhVu+30afYzX6qTcEH55kr1NubbEZddUgaimmWLmd3POfp0MUquyyFXFR96hUQuSz5cF7rO7G6Oe0OWm7Z5Tjur0nYvbgbIyI4Q8XwdVRGO6+amj63VpQ6qiX50j0O3NJEaHCgu8teKM3pf9mePQ2eyjZoaQSb7RxrJHjwRwcYbLmATE0nlDNhkuSyQuljCfLzmThRbdZaYSJ5AEVSZLQAmHOS2Mfm+qllpxu7yEMb59CSBGl4IeCJQWx/8UOUBLzj581sKy0RtOSyrlKdzWEU24BB6F4on6tiwO17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0013.namprd12.prod.outlook.com (2603:10b6:610:57::23)
 by DM6PR12MB3356.namprd12.prod.outlook.com (2603:10b6:5:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Wed, 30 Oct
 2019 19:24:46 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by CH2PR12CA0013.outlook.office365.com
 (2603:10b6:610:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.18 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:46 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:45 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:45 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/13] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Wed, 30 Oct 2019 15:24:31 -0400
Message-ID: <20191030192431.5798-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(136003)(396003)(39860400002)(346002)(428003)(189003)(199004)(70206006)(70586007)(51416003)(7696005)(6916009)(316002)(4326008)(36756003)(50466002)(14444005)(48376002)(86362001)(8676002)(81156014)(81166006)(2351001)(50226002)(8936002)(47776003)(76176011)(1076003)(16586007)(486006)(426003)(476003)(126002)(478600001)(2906002)(305945005)(2616005)(446003)(11346002)(6666004)(356004)(2876002)(336012)(5660300002)(54906003)(26005)(186003)(53416004)(16060500001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3356; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f721b84-4af6-4b58-319c-08d75d6ed328
X-MS-TrafficTypeDiagnostic: DM6PR12MB3356:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3356AE3A41674DCAA466234AE4600@DM6PR12MB3356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xkreXOIhV+faBB8DDnMFlGS/jYezEp3Xi7R4NbQLCVEucb0NGq5FvMTDRRVM8LhWyLaR4/lIiO0uDWWpBkYA22cFHOEW9KtiR7jW/8+6mCvN8Qnpo2LSvoGO41J3VH44tItmSBdrv0WYS60dfd+XJmJ8QdV9GAs1V/H1mXTHMhrwLbmTpsD36QS6feo/AHQeMCDMlpvHt8qnAso0QOY/4T3ReR9K3hhdcLfVE/MY/CtI8iUTQoT2vD2BGuK3OwXN5g6AX/iTEJDYbn8a4idF+O3UEkh3vW0ecqCFxcDvfCFvvEtIocexZoTs6yOeDIi+9plospTV4o0n+VM/E+J1YT3PmHyPTGLUvjcLyVvawjtLgDB/8xWYBikyZOEKyo9xLybLzgaSBgu35dQKXIV5reJ0uhyMmH3TJmdcEC4nknu0Hxd6JEY4ZT9wmuzFWWG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:46.4993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f721b84-4af6-4b58-319c-08d75d6ed328
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiPPz/0vsukTGH0ZDkhUo1azABN+W79GAY4r8CFOp6I=;
 b=1WfdRvLKJCd+39FppO1asR59EUwQSVXtxkLdZDbSwI52S1zLJbjCQqcRayJ1OJOzQbWR582ksrjl2xE/UIvlqkWLFL/wL/0xJtU3buoDto6d45gjfwGTzj2qOt2ONWvWk4zoOlfmvmVzXHriqx85pxSfktQCgZH+aH3wuHg5Gw0=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU2luY2UgZm9yIERT
QyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVlIHRvIGNv
bXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJIHNsb3Rz
IGZvciB0aGF0IGNvbm5lY3Rvci4KClRoZSBmdW5jdGlvbiBpdGVyYXRlcyB0aHJvdWdoIGFsbCB0
aGUgYWN0aXZlIHN0cmVhbXMgdG8KZmluZCwgd2hpY2ggaGF2ZSBEU0MgZW5hYmxlZCwgdGhlbiBy
ZWNhbGN1bGF0ZXMgUEJOIGZvcgppdCBhbmQgY2FsbHMgZHJtX2RwX2hlbHBlcl91cGRhdGVfdmNw
aV9zbG90c19mb3JfZHNjIHRvCnVwZGF0ZSBjb25uZWN0b3IncyBWQ1BJIHNsb3RzLgoKQ2M6IEpl
cnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1MCArKysrKysrKysrKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwppbmRleCAxYmJkZjI5ZjNjN2QuLjFiYzAyOTU3Y2QxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00Njc0LDYgKzQ2NzQs
NDMgQEAgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBhbWRncHVfZG1fZW5j
b2Rlcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmF0b21pY19jaGVjayA9IGRtX2VuY29kZXJfaGVscGVy
X2F0b21pY19jaGVjawogfTsKIAorc3RhdGljIGludCBkbV91cGRhdGVfbXN0X3ZjcGlfc2xvdHNf
Zm9yX2RzYyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCisJCQkJCSAgICBzdHJ1Y3Qg
ZGNfc3RhdGUgKmRjX3N0YXRlKQoreworCXN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbTsK
KwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsKKwlzdHJ1Y3QgZG1fY29u
bmVjdG9yX3N0YXRlICpkbV9jb25uX3N0YXRlOworCWludCBpID0gMCwgY2xvY2sgPSAwLCBicHAg
PSAwOworCisJZm9yIChpID0gMDsgaSA8IGRjX3N0YXRlLT5zdHJlYW1fY291bnQ7IGkrKykgewor
CisJCXN0cmVhbSA9IGRjX3N0YXRlLT5zdHJlYW1zW2ldOworCisJCWlmICghc3RyZWFtKQorCQkJ
Y29udGludWU7CisKKwkJYWNvbm5lY3RvciA9IChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
KXN0cmVhbS0+ZG1fc3RyZWFtX2NvbnRleHQ7CisJCWRtX2Nvbm5fc3RhdGUgPSB0b19kbV9jb25u
ZWN0b3Jfc3RhdGUoYWNvbm5lY3Rvci0+YmFzZS5zdGF0ZSk7CisKKwkJaWYgKCFhY29ubmVjdG9y
LT5wb3J0KQorCQkJY29udGludWU7CisKKwkJaWYgKHN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyAh
PSAxKQorCQkJY29udGludWU7CisKKwkJYnBwID0gY29udmVydF9kY19jb2xvcl9kZXB0aF9pbnRv
X2JwYyhzdHJlYW0tPnRpbWluZy5kaXNwbGF5X2NvbG9yX2RlcHRoKSogMzsKKwkJY2xvY2sgPSBz
dHJlYW0tPnRpbWluZy5waXhfY2xrXzEwMGh6IC8gMTA7CisKKwkJZG1fY29ubl9zdGF0ZS0+cGJu
ID0gIGRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBicHAsIHRydWUpOworCisJCWRtX2Nvbm5f
c3RhdGUtPnZjcGlfc2xvdHMgPSBkcm1fZHBfaGVscGVyX3VwZGF0ZV92Y3BpX3Nsb3RzX2Zvcl9k
c2Moc3RhdGUsIGFjb25uZWN0b3ItPnBvcnQsIGRtX2Nvbm5fc3RhdGUtPnBibik7CisKKwkJaWYg
KGRtX2Nvbm5fc3RhdGUtPnZjcGlfc2xvdHMgPCAwKQorCQkJcmV0dXJuIGRtX2Nvbm5fc3RhdGUt
PnZjcGlfc2xvdHM7CisJfQorCXJldHVybiAwOworfQorCiBzdGF0aWMgdm9pZCBkbV9kcm1fcGxh
bmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiB7CiAJc3RydWN0IGRtX3BsYW5lX3N0
YXRlICphbWRncHVfc3RhdGUgPSBOVUxMOwpAQCAtNzcwNywxMSArNzc0NCw2IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChy
ZXQpCiAJCWdvdG8gZmFpbDsKIAotCS8qIFBlcmZvcm0gdmFsaWRhdGlvbiBvZiBNU1QgdG9wb2xv
Z3kgaW4gdGhlIHN0YXRlKi8KLQlyZXQgPSBkcm1fZHBfbXN0X2F0b21pY19jaGVjayhzdGF0ZSk7
Ci0JaWYgKHJldCkKLQkJZ290byBmYWlsOwotCiAJaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3Vw
ZGF0ZSkgewogCQkvKgogCQkgKiBUaGlzIGlzIGEgZmFzdCBjdXJzb3IgdXBkYXRlIGNvbWluZyBm
cm9tIHRoZSBwbGFuZSB1cGRhdGUKQEAgLTc3ODMsNiArNzgxNSwxMCBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKICNpZmRlZiBDT05G
SUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCQlpZiAoIWNvbXB1dGVfbXN0X2RzY19jb25maWdz
X2Zvcl9zdGF0ZShkbV9zdGF0ZS0+Y29udGV4dCkpCiAJCQlnb3RvIGZhaWw7CisKKwkJcmV0ID0g
ZG1fdXBkYXRlX21zdF92Y3BpX3Nsb3RzX2Zvcl9kc2Moc3RhdGUsIGRtX3N0YXRlLT5jb250ZXh0
KTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZmFpbDsKICNlbmRpZgogCQlpZiAoZGNfdmFsaWRhdGVf
Z2xvYmFsX3N0YXRlKGRjLCBkbV9zdGF0ZS0+Y29udGV4dCwgZmFsc2UpICE9IERDX09LKSB7CiAJ
CQlyZXQgPSAtRUlOVkFMOwpAQCAtNzgxMiw2ICs3ODQ4LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCWRjX3JldGFpbl9z
dGF0ZShvbGRfZG1fc3RhdGUtPmNvbnRleHQpOwogCQl9CiAJfQorCS8qIFBlcmZvcm0gdmFsaWRh
dGlvbiBvZiBNU1QgdG9wb2xvZ3kgaW4gdGhlIHN0YXRlKi8KKwlyZXQgPSBkcm1fZHBfbXN0X2F0
b21pY19jaGVjayhzdGF0ZSk7CisJaWYgKHJldCkKKwkJZ290byBmYWlsOwogCiAJLyogU3RvcmUg
dGhlIG92ZXJhbGwgdXBkYXRlIHR5cGUgZm9yIHVzZSBsYXRlciBpbiBhdG9taWMgY2hlY2suICov
CiAJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUgKHN0YXRlLCBjcnRjLCBuZXdfY3J0Y19zdGF0
ZSwgaSkgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
