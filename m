Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3696919
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7F36E853;
	Tue, 20 Aug 2019 19:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F976E853;
 Tue, 20 Aug 2019 19:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9fupOvu/i0wzcJa43qrPqJVtA2bHMXGAHN+i0Eg7ki6mLWESOaMtQxSfBmvGxruu5bQp8zyOsgsxOMzApkixear/EmZk5VQRQ2HfSXw3oJgCnUT7LvBHGn0xc4QiAFVLWTGwDFxjMPn+UT0+CK7n8iA/OJzf5K9cmyaoryX77/uYr3Fdo8/6dH2rWYVGb4ve7ewJdasY5NDtmMYiaBUm73euq+NjcmG1HkHli6coywmBQZ26K3K7m+o4uYKKW09BRjpzQ1xM1yUtsyqh1THbMu1XscnASKM6GsI/P17Mq9NfWmTfzEE1MZbfcqIeMYZ8W0YQUB04JBpSrcTh50gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXW+AXK9WJtdNbkuBZqqoBHDR+6gUz06It+XihWfHOM=;
 b=SSlBqbiycSdprHPg8Tcn2c3MBq+2Jpixw3YDBAYODYvuqgr7/5ygMKkOv2ZfD4UK2VMQcGIMrYAqZR8K+8O74FmRvQM6Ohv+HdpCNbCR88t9YinzqjUPlSjyKyg4SoH1M44g4NWmKl/ot3dzZ9DooJMbkWYanaD/iYGWCtkDIFEBEDfE8oQVr6ojGUan79vdqY5FxMNA0OYuGsgVwfk2hN2oASBeXqmMteWK8DRMGSDYLEbBjvAkKbJUV6QmvytLea24uWpTqtBQM0V3rLMjvc0vIAsEJWLaZfFPeBcona0kHaHU5Bdd5WS+cA2XnKV42Hd4OoeDYvA9R6c753LRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0059.namprd12.prod.outlook.com (2603:10b6:0:56::27) by
 MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Tue, 20 Aug 2019 19:12:10 +0000
Received: from BY2NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM3PR12CA0059.outlook.office365.com
 (2603:10b6:0:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT042.mail.protection.outlook.com (10.152.85.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:10 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:09 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 00/14] Display Stream Compression (DSC) for AMD Navi
Date: Tue, 20 Aug 2019 15:11:49 -0400
Message-ID: <20190820191203.25807-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(6666004)(186003)(336012)(26005)(356004)(70206006)(70586007)(51416003)(2616005)(49486002)(426003)(476003)(126002)(86362001)(486006)(4326008)(81156014)(8936002)(50226002)(14444005)(81166006)(8676002)(305945005)(110136005)(316002)(16586007)(53936002)(36756003)(50466002)(5660300002)(48376002)(478600001)(2906002)(47776003)(450100002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92a0d0b2-e38a-43b4-4d84-08d725a24d24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1280299DDB9F89DD5AA8CF61EFAB0@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: epTSQ4FzMKwA+VY3oV57eeNiLdBZFHNF7LuZhKBT96ndUMfNax84oLiFHf50LgRc6jiKqWzeX0d/BuY8D7v6p6StWMgNin58QHQaPudSEzM+9GaVebhUHDR3b80nkegjHsvszOPS6w7wKmRqREKxvf+/xeak2GW4xN4uBUzFy/GvM01/EeRPAY26wV9tXhDRckBl6Fk+UX5voXJppRh99R4MutS68g/D3t6rQhzlhj8ssgNqF+ZHVwaQNHZaT9XAw6pO4d5ZdH89VCVJOah4rqkS1+nC2eyQ6uOKV+1kfv2/fQuYZQp4tuSg+2PbGoY9AZqnPKPxSDx2cjrDwkZt+i0hDzJWzskYdxW/dsrc1MDhLPiU+VItAk+TtTQ8a9mNiZ9LPxjgPaD9Lf5X+zhwJobfhllKjX0mam4lBE4XEAo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:10.3657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a0d0b2-e38a-43b4-4d84-08d725a24d24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXW+AXK9WJtdNbkuBZqqoBHDR+6gUz06It+XihWfHOM=;
 b=BR4ur2H8DyNxnZ4ATeNbCAdhL9yCCe6Kp5RzyYVhms793k4yq/RaLlZ2VtOjHFXgBG7tjqZzuLvNatx8Dup0mg/+VWuMP04rC+35RwdiM/Hy7K1FZPZgITHMif8CTTtaR9NUoHKROvDFVZAjI2766I3wMJiVNe1HdKTmteEqK7k=
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

VGhpcyBwYXRjaHNldCBlbmFibGVzIERpc3BsYXkgU3RyZWFtIENvbXByZXNzaW9uIChEU0MpIG9u
IERQCmNvbm5lY3RvcnMgb24gTmF2aSBBU0lDcywgYm90aCBTU1QgYW5kIERTQy4KCjhrNjAgYW5k
IDRrMTQ0IHN1cHBvcnQgcmVxdWlyZXMgT0RNIGNvbWJpbmUsIGFuIEFNRCBpbnRlcm5hbApmZWF0
dXJlIHRoYXQgbWF5IGJlIGEgYml0IGJ1Z2d5IHJpZ2h0IG5vdy4KClBhdGNoZXMgMSB0aHJvdWdo
IDUgZW5hYmxlIERTQyBmb3IgU1NULiBNb3N0IG9mIHRoZSB3b3JrIHdhcwphbHJlYWR5IGRvbmUg
aW4gdGhlIE5hdmkgcHJvbW90aW9uIHBhdGNoZXM7IHRoaXMganVzdCBob29rcwppdCB1cCB0byB0
aGUgYXRvbWljIGludGVyZmFjZS4gVGhlIGZpcnN0IHR3byByZXZlcnRzIGFyZSBvZiB0ZW1wb3Jh
cnkKY2hhbmdlcyB0byBibG9jayBvZmYgRFNDLiBUaGUgdGhpcmQgaXMgb2YgYSBjb21taXQgdGhh
dCB3YXMKYWNjaWRlbnRhbGx5IHByb21vdGVkIHR3aWNlLiBUaGUgZm91cnRoIGFuZCBsYXN0IHJl
dmVydCBmaXhlcyBhCnBvdGVudGlhbCBpc3N1ZSB3aXRoIE9ETSBjb21iaW5lLgoKUGF0Y2hlcyA2
IGFuZCA3IGFyZSBmaXhlcyBmb3IgYnVncyB0aGF0IHdvdWxkIGJlIGV4cG9zZWQgYnkKTVNUIERT
Qy4gT25lIGZpeCBpcyB3aXRoIHRoZSBNU1QgY29kZSBhbmQgdGhlIG90aGVyIGluIHRoZSBEU0Mg
Y29kZS4KClBhdGNoZXMgOCwgOSwgYW5kIDEwIGFyZSBzbWFsbCBEUk0gY2hhbmdlcyByZXF1aXJl
ZCBmb3IgRFNDIE1TVDoKRkVDLCBhIG5ldyBiaXQgaW4gdGhlIHN0YW5kYXJkOyBzb21lIGV4cG9y
dCBkZWZpbml0aW9uczsgYW5kCmEgcHJldmlvdXNseSB1bmluaXRpYWxpemVkIHZhcmlhYmxlLgoK
UGF0Y2hlcyAxMSB0aHJvdWdoIDE0IGFyZSB0aGUgRFNDIE1TVCBwb2xpY3kgaXRzZWxmLiBUaGlz
IGluY2x1ZGVzCnRoZSBjb2RlIGZvciBkZXRlY3RpbmcgYW5kIHZhbGlkYXRpbmcgRFNDIGNhcGFi
aWxpdGllcywgZW5hYmxpbmcKRFNDIG92ZXIgYSBsaW5rLCBjb21wdXRpbmcgdGhlIGZhaXIgRFND
IGNvbmZpZ3VyYXRpb25zIGZvcgptdWx0aXBsZSBEU0MgZGlzcGxheXMsIGFuZCBhZGRpbmcgdG8g
YXRvbWljIHN0YXRlIGNydGNzIHRoYXQgbWlnaHQKbmVlZCByZXByb2dyYW1taW5nIGR1ZSB0byBE
U0MuCgp2MjogVXBkYXRpbmcgcGF0Y2hlcyA2IGFuZCAxNCBpbiByZXNwb2luc2UgdG8gTmljaydz
IGZlZWRiYWNrCgpEYXZpZCBGcmFuY2lzICgxNCk6CiAgUmV2ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6
IHNraXAgZHNjIGNvbmZpZyBmb3IgbmF2aTEwIGJyaW5nIHVwIgogIFJldmVydCAiZHJtL2FtZC9k
aXNwbGF5OiBuYXZpMTAgYnJpbmcgdXAgc2tpcCBkc2MgZW5jb2RlciBjb25maWciCiAgUmV2ZXJ0
ICJkcm0vYW1kL2Rpc3BsYXk6IGFkZCBnbG9iYWwgbWFzdGVyIHVwZGF0ZSBsb2NrIGZvciBEQ04y
IgogIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBGaXggdW5kZXJzY2FuIG5vdCB1c2luZyBwcm9w
ZXIgc2NhbGluZyIKICBkcm0vYW1kL2Rpc3BsYXk6IEVuYWJsZSBTU1QgRFNDIGluIERNCiAgZHJt
L2RwLW1zdDogVXNlIGRjIGFuZCBkcm0gaGVscGVycyB0byBjb21wdXRlIHRpbWVzbG90cwogIGRy
bS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxlcyB0byAwCiAgZHJtL2Rw
LW1zdDogUGFyc2UgRkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwLW1zdDogRXhw
b3J0IHN5bWJvbHMgZm9yIGRwY2QgcmVhZC93cml0ZQogIGRybS9kcC1tc3Q6IEZpbGwgYnJhbmNo
LT5udW1fcG9ydHMKICBkcm0vYW1kL2Rpc3BsYXk6IFZhbGlkYXRlIERTQyBjYXBzIG9uIE1TVCBl
bmRwb2ludHMKICBkcm0vYW1kL2Rpc3BsYXk6IFdyaXRlIERTQyBlbmFibGUgdG8gTVNUIERQQ0QK
ICBkcm0vYW1kL2Rpc3BsYXk6IE1TVCBEU0MgY29tcHV0ZSBmYWlyIHNoYXJlCiAgZHJtL2FtZC9k
aXNwbGF5OiBUcmlnZ2VyIG1vZGVzZXRzIG9uIE1TVCBEU0MgY29ubmVjdG9ycwoKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDExMCArKystCiAuLi4vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgfCAgNDggKy0KIC4uLi9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDQ5OCArKysrKysrKysrKysr
KysrKy0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAg
NSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jICAgICAgfCAgMTIg
Ky0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyAgICB8ICAgMyAr
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyAgfCAgIDMgKwog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgICA0IC0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMuYyB8ICA3MiArLS0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMuaCB8ICAgMyAtCiAuLi4v
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAgIDcgKy0KIC4uLi9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaCB8ICAgMSArCiAuLi4vZGlz
cGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jICAgfCAgIDggLQogLi4uL2FtZC9k
aXNwbGF5L2RjL2luYy9ody90aW1pbmdfZ2VuZXJhdG9yLmggIHwgICAyIC0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgICB8ICA0NyArKwogaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgICA1ICstCiAxNiBmaWxlcyBjaGFu
Z2VkLCA3MDggaW5zZXJ0aW9ucygrKSwgMTIwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
