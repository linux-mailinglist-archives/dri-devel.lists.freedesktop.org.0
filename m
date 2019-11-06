Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B93F1CCD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9666EE1F;
	Wed,  6 Nov 2019 17:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225526EE1F;
 Wed,  6 Nov 2019 17:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c719iaRK1GH/MSwFvxCyDpiTsLC20dgyHNG+JmIRa4j6vJjVMil+171PMVo5HRg8+mZ3CrCwtFeAfvz28d8nG2NrTCLbBFmcpFbbg4MFre1E3UjVzY7cWjPv+cRbhygMleekbs0IOPZ2Oh9nn0PhNARKbnKc5zb2JbAnycU++lpcVocq8XORsCLW6ZqFli1ov9jBB4fdzTLmFjHRP4bvW9L2JAyNxJYACpkFkqhNlS3oM8i5gRjoqgiYjP4MVgsyfBnkzGDaNDTnXZuV9c0zl/NgAxyzMw8O7ne/jvIBcCkVFGIeUvkNjiPCS61acp8rO9ejMoaVJnem9ELhyHbBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN6DK+9nA7jgfoJ6aBZVsikV50p3nwbBfPIs1xM8cHs=;
 b=SvI9TGy407CoAORwfh74I/mOrJ5py0WsqEtBqLls1Cj1Akcsn9Z/39G559LzilVOdbCIoqv8QcEYJ3Q1lAGPQWtBVV52k45zRNpdbG/eiPer4aSBrwN6t5O8CPeK9nguQW8mUv6Y2yy/4xDQTlV8/VCMxIiZ908rGCDLi4KZ0fZvnq6x0mZLms5tCo93qK5lJ2YCPtTxNY8M3QX5lBUqNMcih91hqHM76tgg6zMR0adRNYVRBWM8ZZcFvjnl1+TzxOJAnQCPTJtGxtlq6wbcAtVA7LPVgnXJJHFNzkE2HeFH1r2B90w/5fOUg6+KBkN0OCSI3TKjk3kuJF7dT1klHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 BYAPR12MB3621.namprd12.prod.outlook.com (2603:10b6:a03:db::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 17:51:19 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 6 Nov 2019 17:51:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 17:51:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:18 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:18 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 11:51:18 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH 2/4] drm/sched: Use completion to wait for entity idle
Date: Wed, 6 Nov 2019 12:51:10 -0500
Message-ID: <1573062672-23698-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(428003)(189003)(199004)(476003)(47776003)(70206006)(2906002)(23676004)(53416004)(7696005)(5660300002)(5820100001)(2870700001)(50226002)(44832011)(478600001)(70586007)(66574012)(4326008)(109986005)(305945005)(86362001)(446003)(11346002)(126002)(2616005)(81166006)(14444005)(81156014)(8676002)(8936002)(356004)(6666004)(336012)(186003)(54906003)(76176011)(316002)(50466002)(426003)(486006)(36756003)(26005)(1671002)(450100002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3621; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f059255-51af-48f8-3c4e-08d762e1eddf
X-MS-TrafficTypeDiagnostic: BYAPR12MB3621:
X-Microsoft-Antispam-PRVS: <BYAPR12MB36218DE176D47F9114F4DE67EA790@BYAPR12MB3621.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R38ZRiTVfq4y84jErvE4g5yQS6WnKYAp/CZ50bKWkwyZY9bC2CrqMgh8xh2ck9eIy3LwZpqUuQllu10rX7CxLOJ6uwf/HruV+qt7v3UOq8SgSJZzWm3sdIDQeCCxLn0AFQ4M60eeeuqpwu0vF1fZF5PEjlRunsD7/BXyONeLEsQVc/uTqQm3MV1LUeYkNBWdPi4RE5PaRdQfFhCkBtZOtET+2vIsK5wlXo0qIJTXHNkSIyyD0vm7rNLxfsvQLH668YAInvN/lvBKhU2keHIOEQy0eNFq2KqUYTvvlgJlP+Z84t1oRkbpEc1dwnZI5ClitdFeYOeoyGTIIp6A8aUCvGoJcWY4sziSL1F3u/+XJz/BBAka6rjvs13dh1Q0Mu9pN2Rkxc+raaR0Js4kgaAoxN9o9HSbYxYM8mqOsoI9ybsQNxTWHl8kWNaRdOmDWy8I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 17:51:19.3357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f059255-51af-48f8-3c4e-08d762e1eddf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3621
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN6DK+9nA7jgfoJ6aBZVsikV50p3nwbBfPIs1xM8cHs=;
 b=Ur5KyELO+TkbSdzIlorMKZwbIMhczNaeiJtqRApnB0lrFWCIKh+7kLTpiSplIRiH5BoNet/qQTg5Pfta5UpyVkLT8LTiUwgux24Dccxiw6smpD5GHmlld3pcR/h6MsQLOYyqhlP+i8AGE8QrXCEJ8nyFQWIDpzQWV5hm9qb/ODE=
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
Cc: Shirish.S@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlcyB0aHJlYWQgcGFyay91bnBhcmsgaGFjayBmcm9tIGRybV9zY2hlZF9lbnRpdHlfZmlu
aSBhbmQKYnkgdGhpcyBmaXhlcyByZWFjdGl2YXRpb24gb2Ygc2NoZWR1bGVyIHRocmVhZCB3aGls
ZSB0aGUgdGhyZWFkCmlzIHN1cHBvc2VkIHRvIGJlIHN0b3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KU3VnZ2VzdGVkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDEyICsrKysrKysrLS0tLQogZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgICB8ICA2ICsrKysrKwogaW5jbHVk
ZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfZW50aXR5LmMKaW5kZXggMWE1MTUzMS4uNDYxYTdhOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCkBAIC0yMyw2ICsyMyw3IEBACiAKICNpbmNs
dWRlIDxsaW51eC9rdGhyZWFkLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorI2luY2x1ZGUg
PGxpbnV4L2NvbXBsZXRpb24uaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNs
dWRlIDxkcm0vZ3B1X3NjaGVkdWxlci5oPgpAQCAtNjgsNiArNjksOCBAQCBpbnQgZHJtX3NjaGVk
X2VudGl0eV9pbml0KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHksCiAJaWYgKCFlbnRp
dHktPnJxX2xpc3QpCiAJCXJldHVybiAtRU5PTUVNOwogCisJaW5pdF9jb21wbGV0aW9uKCZlbnRp
dHktPmVudGl0eV9pZGxlKTsKKwogCWZvciAoaSA9IDA7IGkgPCBudW1fcnFfbGlzdDsgKytpKQog
CQllbnRpdHktPnJxX2xpc3RbaV0gPSBycV9saXN0W2ldOwogCkBAIC0yODYsMTEgKzI4OSwxMiBA
QCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfZmluaShzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50
aXR5KQogCSAqLwogCWlmIChzcHNjX3F1ZXVlX2NvdW50KCZlbnRpdHktPmpvYl9xdWV1ZSkpIHsK
IAkJaWYgKHNjaGVkKSB7Ci0JCQkvKiBQYXJrIHRoZSBrZXJuZWwgZm9yIGEgbW9tZW50IHRvIG1h
a2Ugc3VyZSBpdCBpc24ndCBwcm9jZXNzaW5nCi0JCQkgKiBvdXIgZW5pdHkuCisJCQkvKgorCQkJ
ICogV2FpdCBmb3IgdGhyZWFkIHRvIGlkbGUgdG8gbWFrZSBzdXJlIGl0IGlzbid0IHByb2Nlc3Np
bmcKKwkJCSAqIHRoaXMgZW50aXR5LgogCQkJICovCi0JCQlrdGhyZWFkX3Bhcmsoc2NoZWQtPnRo
cmVhZCk7Ci0JCQlrdGhyZWFkX3VucGFyayhzY2hlZC0+dGhyZWFkKTsKKwkJCXdhaXRfZm9yX2Nv
bXBsZXRpb24oJmVudGl0eS0+ZW50aXR5X2lkbGUpOworCiAJCX0KIAkJaWYgKGVudGl0eS0+ZGVw
ZW5kZW5jeSkgewogCQkJZG1hX2ZlbmNlX3JlbW92ZV9jYWxsYmFjayhlbnRpdHktPmRlcGVuZGVu
Y3ksCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IGRiYTQzOTAuLjM4
YmJhZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCkBAIC00Nyw2ICs0
Nyw3IEBACiAjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPgogI2luY2x1ZGUgPGxpbnV4L3dhaXQu
aD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgorI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24u
aD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3NjaGVkL3R5cGVzLmg+CiAKICNpbmNsdWRlIDxkcm0v
ZHJtX3ByaW50Lmg+CkBAIC0xMzQsNiArMTM1LDcgQEAgZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRp
dHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEpCiAJCWxpc3RfZm9yX2VhY2hfZW50cnlfY29udGlu
dWUoZW50aXR5LCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7CiAJCQlpZiAoZHJtX3NjaGVkX2VudGl0
eV9pc19yZWFkeShlbnRpdHkpKSB7CiAJCQkJcnEtPmN1cnJlbnRfZW50aXR5ID0gZW50aXR5Owor
CQkJCXJlaW5pdF9jb21wbGV0aW9uKCZlbnRpdHktPmVudGl0eV9pZGxlKTsKIAkJCQlzcGluX3Vu
bG9jaygmcnEtPmxvY2spOwogCQkJCXJldHVybiBlbnRpdHk7CiAJCQl9CkBAIC0xNDQsNiArMTQ2
LDcgQEAgZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEp
CiAKIAkJaWYgKGRybV9zY2hlZF9lbnRpdHlfaXNfcmVhZHkoZW50aXR5KSkgewogCQkJcnEtPmN1
cnJlbnRfZW50aXR5ID0gZW50aXR5OworCQkJcmVpbml0X2NvbXBsZXRpb24oJmVudGl0eS0+ZW50
aXR5X2lkbGUpOwogCQkJc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKIAkJCXJldHVybiBlbnRpdHk7
CiAJCX0KQEAgLTcyMSw2ICs3MjQsOSBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQg
KnBhcmFtKQogCQkJY29udGludWU7CiAKIAkJc2NoZWRfam9iID0gZHJtX3NjaGVkX2VudGl0eV9w
b3Bfam9iKGVudGl0eSk7CisKKwkJY29tcGxldGUoJmVudGl0eS0+ZW50aXR5X2lkbGUpOworCiAJ
CWlmICghc2NoZWRfam9iKQogCQkJY29udGludWU7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAppbmRleCA1N2I0
MTIxLi42NjE5ZDJhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKKysr
IGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCkBAIC03MSw2ICs3MSw3IEBAIGVudW0gZHJt
X3NjaGVkX3ByaW9yaXR5IHsKICAqIEBsYXN0X3NjaGVkdWxlZDogcG9pbnRzIHRvIHRoZSBmaW5p
c2hlZCBmZW5jZSBvZiB0aGUgbGFzdCBzY2hlZHVsZWQgam9iLgogICogQGxhc3RfdXNlcjogbGFz
dCBncm91cCBsZWFkZXIgcHVzaGluZyBhIGpvYiBpbnRvIHRoZSBlbnRpdHkuCiAgKiBAc3RvcHBl
ZDogTWFya3MgdGhlIGVuaXR5IGFzIHJlbW92ZWQgZnJvbSBycSBhbmQgZGVzdGluZWQgZm9yIHRl
cm1pbmF0aW9uLgorICogQGVudGl0eV9pZGxlOiBTaWduYWxzIHdoZW4gZW5pdHl0IGlzIG5vdCBp
biB1c2UKICAqCiAgKiBFbnRpdGllcyB3aWxsIGVtaXQgam9icyBpbiBvcmRlciB0byB0aGVpciBj
b3JyZXNwb25kaW5nIGhhcmR3YXJlCiAgKiByaW5nLCBhbmQgdGhlIHNjaGVkdWxlciB3aWxsIGFs
dGVybmF0ZSBiZXR3ZWVuIGVudGl0aWVzIGJhc2VkIG9uCkBAIC05NCw2ICs5NSw3IEBAIHN0cnVj
dCBkcm1fc2NoZWRfZW50aXR5IHsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICAgICAgICAgICAgICAgICps
YXN0X3NjaGVkdWxlZDsKIAlzdHJ1Y3QgdGFza19zdHJ1Y3QJCSpsYXN0X3VzZXI7CiAJYm9vbCAJ
CQkJc3RvcHBlZDsKKwlzdHJ1Y3QgY29tcGxldGlvbgkJZW50aXR5X2lkbGU7CiB9OwogCiAvKioK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
