Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C4FF5FE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCBF6E261;
	Sat, 16 Nov 2019 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720060.outbound.protection.outlook.com [40.107.72.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CA36E207;
 Sat, 16 Nov 2019 22:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etWtO2TC5h9aon/9aQFoDQcz7DiSxzlmeQ8S56R0YRE67Edhze+DGBca/QjxT2lr/RMfqxhtp0PVHlmXRRGAM04RTyLjYKxPJPh7cXcVH/kN0E+6u/fJKFJLF9/aX+IV+nYjDYTTJVSBkc7bR2okL6sSiMsWwAGNPQ5NqIpVPUlW/E/mB2CNuAYFlWFFAiLHQDzCCw0vitFNBOEq0NStgpmvGCXoZS2uVPYHghA6AcRa/pmjs4i/TVo5L5x6b09HETO3tnKevIP3CLBAT3rNeaQCJtDdk82W0YwNCOAeo4tAcYWZfhhXHb/h7g8FoDi6ZKwabT+HjP23ghi63zKisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqeidiPW9RKLrkVk+vasnI+/QKIxw7b0rfk8/Pv1VOg=;
 b=JWK23gALXsWNhqbPAcjOfsq5/RHIjP74jGTNov7GToBbFu8pB5ZQKn3eTcr3bIIa6/zo4V/uI2E7ASWcP9Zop/dib7/RyiZnD1v9GSksB27x5+XdpJwvhD66FtHsbXInCKQqMLF2r0f7gKMSMdWrQB9lCBLXyMTEDCjSQe9vQPx5moyihVgfIy/ioAgZnzyplJ1QcAkXEFDnX6/fps+aK/Rl4upqTA0J2uHBL23uyCtqS1IRppoRoNsheEY1HXOEMUT5VDCsIzEpBOekFGlwDSw16PBd7FhjtzTVAVKlikbXoVbGWo6vnwo6+1Df26xaWUEQ9LUNH+5phPGiHnwEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by MWHPR12MB1711.namprd12.prod.outlook.com
 (2603:10b6:300:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:39 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:36 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:36 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:35 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 08/17] drm/amd/display: Validate DSC caps on MST endpoints
Date: Sat, 16 Nov 2019 17:01:19 -0500
Message-ID: <20191116220128.16598-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(428003)(189003)(199004)(86362001)(14444005)(5660300002)(1076003)(336012)(81166006)(478600001)(47776003)(8676002)(81156014)(486006)(305945005)(2616005)(8936002)(126002)(426003)(6666004)(356004)(50226002)(11346002)(446003)(186003)(2876002)(54906003)(316002)(53416004)(6916009)(476003)(16586007)(50466002)(4326008)(70206006)(76176011)(36756003)(70586007)(7696005)(2906002)(48376002)(2351001)(26005)(51416003)(15650500001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1711; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d340c302-3a88-4397-8a05-08d76ae08e9c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1711:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1711577C2FB2E6CAE9C68F80E4730@MWHPR12MB1711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuB4WGOp7BHCX/G6fzhl+vkN1l/nW5t4vE6JJxqWCiSOf8gnmvB998AF/AXX60oGSAvK9Yi+1UsJEyI/EfC0JbkVPq/zYH5UEkmaZ/H0Q+5PQCAH4zUvp9OZezxwjErLZ3MqOu3RPsUTuOBpqOD2m8LjkviFYGV8DOy7XdQK/ovTrJGKMQeD2uhlhaz2OogkivxLyM92FraRIn6BdkU4uHCYbfXuAlGcV30YeJ5TWKJVatqWwod3KGXntpuhIGIEGdxTIe/NjjmCjlR8I+tmI6R8v0TYQ/G0FxsXCuhAbJOhudOn1MGdHCgTLcAqLP8dwsRjFWk21N/BuFok/UhAdjkifIma8ZRyQn3MLd9Fedf+7jtMRrvDaGDMKQ6uvl3p+G+NRMJkzmbyEgCHD08f33YOCBqJkJKFxxf+84gJU8c/wzWN0N4srsQtGwVpcLnU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:39.2475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d340c302-3a88-4397-8a05-08d76ae08e9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqeidiPW9RKLrkVk+vasnI+/QKIxw7b0rfk8/Pv1VOg=;
 b=KKkjpFC1oXKhzobrd8v0uvNbLKHJYpDNICHZ2wqDv9AnY60ig4fJYjHzok9WnVzA4tO5RYlLdxH4ZglE9NKw7OKnhcCXAplnUKfLx9hcRzNXNLkktBUi3gyegJZixGzSpoQyAAlGT0LZcbKUj4nqmkg496o4xBqAEvfFhKT/y00=
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
Cc: David Francis <David.Francis@amd.com>, Mikita
 Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRHVyaW5nIE1TVCBt
b2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0
IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0IHRvIGdldCB0aGUgcmF3IGNhcHMsCnRoZW4gcGFyc2UgdGhlbSBvbnRvIGRjX3Npbmsg
d2l0aCBkY19kc2NfcGFyc2VfZHNjX2RwY2QuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdl
bmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZy
YW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNr
aUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uaCB8ICAxICsKIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
ICB8IDI5ICsrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5oCmluZGV4IGY2ZTE4ZDhhOTkzNi4uOWI4ZjNkNTlmYTMwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmgKQEAgLTMyMyw2ICszMjMsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciB7CiAJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
bXN0X3BvcnQ7CiAJc3RydWN0IGFtZGdwdV9lbmNvZGVyICptc3RfZW5jb2RlcjsKKwlzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqZHNjX2F1eDsKIAogCS8qIFRPRE8gc2VlIGlmIHdlIGNhbiBtZXJnZSB3aXRo
IGRkY19idXMgb3IgbWFrZSBhIGRtX2Nvbm5lY3RvciAqLwogCXN0cnVjdCBhbWRncHVfaTJjX2Fk
YXB0ZXIgKmkyYzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggZTYxZWVjMTVhM2QwLi4wMmYz
MDc0MmQxZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0yNSw2ICsyNSw3IEBACiAKICNp
bmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSAiZG1fc2Vy
dmljZXMuaCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKQEAg
LTE5Niw2ICsxOTcsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNz
IGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRn
cHVfZG1fbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAorc3RhdGljIGJvb2wg
dmFsaWRhdGVfZHNjX2NhcHNfb25fY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9y
ICphY29ubmVjdG9yKQoreworCXN0cnVjdCBkY19zaW5rICpkY19zaW5rID0gYWNvbm5lY3Rvci0+
ZGNfc2luazsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gYWNvbm5lY3Rvci0+cG9y
dDsKKwl1OCBkc2NfY2Fwc1sxNl0gPSB7IDAgfTsKKworCWFjb25uZWN0b3ItPmRzY19hdXggPSBk
cm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQocG9ydCk7CisKKwlpZiAoIWFjb25uZWN0b3ItPmRz
Y19hdXgpCisJCXJldHVybiBmYWxzZTsKKworCWlmIChkcm1fZHBfZHBjZF9yZWFkKGFjb25uZWN0
b3ItPmRzY19hdXgsIERQX0RTQ19TVVBQT1JULCBkc2NfY2FwcywgMTYpIDwgMCkKKwkJcmV0dXJu
IGZhbHNlOworCisJaWYgKCFkY19kc2NfcGFyc2VfZHNjX2RwY2QoZHNjX2NhcHMsIE5VTEwsICZk
Y19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2FwcykpCisJCXJldHVybiBmYWxzZTsKKwor
CXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3Rv
ciAqYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKQEAgLTIz
OCwxMCArMjU5LDE2IEBAIHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkvKiBkY19saW5rX2FkZF9yZW1vdGVfc2luayByZXR1
cm5zIGEgbmV3IHJlZmVyZW5jZSAqLwogCQlhY29ubmVjdG9yLT5kY19zaW5rID0gZGNfc2luazsK
IAotCQlpZiAoYWNvbm5lY3Rvci0+ZGNfc2luaykKKwkJaWYgKGFjb25uZWN0b3ItPmRjX3Npbmsp
IHsKIAkJCWFtZGdwdV9kbV91cGRhdGVfZnJlZXN5bmNfY2FwcygKIAkJCQkJY29ubmVjdG9yLCBh
Y29ubmVjdG9yLT5lZGlkKTsKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JU
CisJCQlpZiAoIXZhbGlkYXRlX2RzY19jYXBzX29uX2Nvbm5lY3RvcihhY29ubmVjdG9yKSkKKwkJ
CQltZW1zZXQoJmFjb25uZWN0b3ItPmRjX3NpbmstPnNpbmtfZHNjX2NhcHMsCisJCQkJICAgICAg
IDAsIHNpemVvZihhY29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzKSk7CisjZW5kaWYK
KwkJfQogCX0KIAogCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
