Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2991FF5FA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCB26E233;
	Sat, 16 Nov 2019 22:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2326E21F;
 Sat, 16 Nov 2019 22:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWeizG+0RpQcLihXpuIcbPTyZizrjOQpk4/n9iABRFbpmgkbgUz2zvKpWUGcCXmI4NDi0bdeMFgm8TQ24fKNuNPrjWfL0KQyw0oEXaQ8NOUugeyymQjkLyC6EO6RlLleephDztt9liywULfzC6V4FKW4Wn1JpBSbBMABIYOOPWXXYFu5HhGtxOpVwkdREiFydg4voKj85w+BqkZiA6wp7ZL67/BI/IMGwO+M7DTezRvD15xz+jQPUbC4QcqXJAPsM49/BLXHTcYu5jInxORmW3b+HGh8DH5Tb6ddZPu8SKbFfz5dl3fOD+hxQSnr0iADo69CZyFjpnOKDxA25I+qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSe6QhjM4OOxgAJ1sss9YFh01sTUeLZmXY/Bdgz3MV4=;
 b=nz9nFjnPfgfIrK52oZlLbk34f3LV4x78pPSRMfVg5lq1A5AKHA7VUsWlnHg3Ej0mqvr4XACVFFwgo1PGerggMlO2ldLWexPOoVC3NwHkZsXvgNxgRMFebLvudN44V8uDciqzklIozyQtvof0fluxk9zgOrZiRD6ICcKN6zp0KDh+QAxfigrKHK8vZaFklc4CHFQ80eyX2pFKHMKBYCWK8MKLVgOlmDFErvNm5Wn2b5ue/GAmFa3Qo71NWeNUJKdTQGAfMG6iWTg9QP2JM6x7p7GrSQTPcB/kr6s+S6BtH2ehURxcEf6j58lE5V/cF0oANIBecO9btcamW0T+D7WmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by MWHPR12MB1309.namprd12.prod.outlook.com
 (2603:10b6:300:10::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:45 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:40 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:40 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:40 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 17/17] drm/amd/display: Trigger modesets on MST DSC
 connectors
Date: Sat, 16 Nov 2019 17:01:28 -0500
Message-ID: <20191116220128.16598-18-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39850400004)(428003)(199004)(189003)(316002)(70206006)(6666004)(86362001)(16586007)(70586007)(53416004)(1076003)(356004)(2351001)(50466002)(54906003)(48376002)(8936002)(47776003)(50226002)(26005)(2876002)(51416003)(7696005)(8676002)(81156014)(81166006)(2906002)(6916009)(4326008)(76176011)(11346002)(446003)(126002)(476003)(486006)(426003)(2616005)(186003)(336012)(5660300002)(305945005)(478600001)(14444005)(5024004)(36756003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1309; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa0f29f-586f-4a09-1276-08d76ae091e9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1309:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1309CA96BB6F0F48E01EF372E4730@MWHPR12MB1309.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vJ6B0yP3exIs5gNGe1TNeJlw65a6GnvYZtaOqvIcshrke4pIR7LvOXElxbqCgx1zm/Hs3Ahnj2hMWF+iMrq4dZ/njlAOkKikvB+J7E+ESQmvd1DVDVUYFv2mqlHqryU/VS1JqBUAyhVHCptUnlbG0fvnglCc73o0/Nn86GaADJm4qj3Z7u23s79Cz4cJYLq8qZ4W6jzpv69yt73Pe2jzxV9h/0WggupgYdP/OhTHZePXHooBVkVZZZp2n3pBryYXzB1JXaLj2XQuhXpGHYIMPIZPRUnI+YwGRFJZKn6onmbVJhS/8SuP76tlRouuqI9IKGU98WmVF7k6jrzUORfu9m3NwqLADq8Wv/EXw2JqtZvGCad+0Tb+qeAprwqLhAZMMpohCNbZ1eWlhSRwTd5EIs0uKCPzscdasn+nbXAAc6B200ksSmMTipnp9EmrBjX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:44.7802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa0f29f-586f-4a09-1276-08d76ae091e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSe6QhjM4OOxgAJ1sss9YFh01sTUeLZmXY/Bdgz3MV4=;
 b=BjM9jl2C/D/Gu058dgVkHxRyEUdhLryjdehxXoMjA7bzk+a8cS3fj7OCU8tjEQckNeGrjGXvdSW0/a92Ml5LdiQjzizbng5WeknwqtyxbRAkBg4G89mshVd9N2rhhX5NQrBOrNcJaF3cpx4SB8jTrjPVl9iJW94ZCaX81hgTwBc=
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
Cc: David
 Francis <David.Francis@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKV2hlbmV2ZXIgYSBj
b25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFjaGVkLCBvcgp1bmRl
cmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQK
dG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVpciByZXF1
aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMgdGhvdWdo
IGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hh
bmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBkcm1fYXRvbWljX2Ny
dGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBhIE1TVCB0b3BvbG9n
eSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0IGNydGMgKGFuZCBh
bGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRvbWljIHN0YXRlIGFu
ZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKdjI6IERvIHRoaXMgY2hlY2sgb25seSBv
biBOYXZpIGFuZCBiZWZvcmUgYWRkaW5nIGNvbm5lY3RvcnMKYW5kIHBsYW5lcyBvbiBtb2Rlc2V0
dGluZyBjcnRjcwoKU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5j
b20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
MzMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwppbmRleCA0YmU2NjIxMDg4ZDIuLjJkYzVjMjdlZTRhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC03OTI0LDYgKzc5MjQs
MjkgQEAgZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGFtZGdwdV9k
aXNwbGF5X21hbmFnZXIgKmRtLAogCSpvdXRfdHlwZSA9IHVwZGF0ZV90eXBlOwogCXJldHVybiBy
ZXQ7CiB9CitzdGF0aWMgaW50IGFkZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZSwgc3RydWN0IGRybV9jcnRjICpjcnRjKQoreworCXN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7CisJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNv
bm5fc3RhdGU7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSBOVUxM
OworCWludCBpOworCWZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoc3RhdGUsIGNvbm5l
Y3RvciwgY29ubl9zdGF0ZSwgaSkgeworCQlpZiAoY29ubl9zdGF0ZS0+Y3J0YyAhPSBjcnRjKQor
CQkJY29udGludWU7CisKKwkJYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29u
bmVjdG9yKTsKKwkJaWYgKCFhY29ubmVjdG9yLT5wb3J0KQorCQkJYWNvbm5lY3RvciA9IE5VTEw7
CisJCWVsc2UKKwkJCWJyZWFrOworCX0KKworCWlmICghYWNvbm5lY3RvcikKKwkJcmV0dXJuIDA7
CisKKwlyZXR1cm4gZHJtX2RwX21zdF9hZGRfYWZmZWN0ZWRfZHNjX2NydGNzKHN0YXRlLCBhY29u
bmVjdG9yLT5wb3J0KTsKKworfQogCiAvKioKICAqIGFtZGdwdV9kbV9hdG9taWNfY2hlY2soKSAt
IEF0b21pYyBjaGVjayBpbXBsZW1lbnRhdGlvbiBmb3IgQU1EZ3B1IERNLgpAQCAtNzk3Niw2ICs3
OTk5LDE2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCXJldCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21vZGVzZXQoZGV2LCBz
dGF0ZSk7CiAJaWYgKHJldCkKIAkJZ290byBmYWlsOworCQorCWlmIChhZGV2LT5hc2ljX3R5cGUg
Pj0gQ0hJUF9OQVZJMTApIHsKKwkJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUs
IGNydGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgeworCQkJaWYgKGRybV9h
dG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKSkgeworCQkJCXJldCA9IGFk
ZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0YXRlLCBjcnRjKTsKKwkJCQlpZiAocmV0KQorCQkJ
CQlnb3RvIGZhaWw7CisJCQl9CisJCX0KKwl9CiAKIAlmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9z
dGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7CiAJ
CWlmICghZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpICYmCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
