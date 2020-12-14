Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DA2DA345
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635436E14F;
	Mon, 14 Dec 2020 22:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78189F5F;
 Mon, 14 Dec 2020 22:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYmUsdNAKcSzBPF/ewqkSehi5eA18NsfyIe3DmA5eBAPqqL8NsJTeqpOlAZH84cpf0cYBybrIsq3Xh65av0f4muPvYzUJgTpXKLZgup3sNcSfva2mgPeBM7IzFEr7Up2NJ74Nay0ELeesdrE+lUhdoQnEz2+jQLxUlwtRVLCDzuLaWNsqfLvBoPPv3RVbLRuW2Xt4Eu8ymyiRupcfILfTrOeym8zPHp2kNhDllhYg2lOc/shykXFtQmLV8Nd4AoUWfTxgqKPkL+tBBUL4U+UAz6kq+HTBnDaqr6DGLXjb1Kq23CTTSrjMY8aCX+ewva5RzdAHAoY7GhLUwcdXqP5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXKdamgwWZQAjnoxAND/7RVY0TRlaKBfZ84+R36FxIg=;
 b=DRYbcCE0RMbK8TSGQIpjz8jZaIZtBkO2Lu4bSx1LYqC6v4MCy9IVh+/BdRBu33VRONaDvd9N37pao6SFfgTpgsFlsvp7s8YrQxoWPwrCKokJ532bhTutlrj8ZOfvZzQGY3mrLzFUt5Hc5n9n4WqiHGEG+raqgp922lV9noY554aI1EURckAFiE6XspzwbMx/kqjFEIlTikvLrlVpd3p0HZzPNJmbhBZQ2TCEdJRFo3Dz0O1z9v/gPIi1+3P6LWqfcK1xpA43nJUbUhGGm1LEwqaa53UC4TVuIuSZKfq02ziNi6xCB5ugXmvMIgTZG/MOg3uDGqUCqwTW3sTKTSLjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXKdamgwWZQAjnoxAND/7RVY0TRlaKBfZ84+R36FxIg=;
 b=mtnPdh7q12tHEUMq5/Eiaf5DRNBn6h1xKl2EPcJMZPhLuLQlrFfdQEiCYZiQjeWZxkjgaf8oaFSUk0ZkqbKmclP1K7j2hQOGOpGakTPPBwtHnOUgtDzSNc2u28RFsgUR0m4It7l9Qk1KXnY1YobJTbVl7AeotrkZbSmmFNq2iLs=
Received: from DM5PR12CA0072.namprd12.prod.outlook.com (2603:10b6:3:103::34)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 22:21:42 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::13) by DM5PR12CA0072.outlook.office365.com
 (2603:10b6:3:103::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 22:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.20 via Frontend Transport; Mon, 14 Dec 2020 22:21:40 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 14 Dec
 2020 16:21:26 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 16:21:25 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/amd/display: Add module parameter for freesync
 video mode
Date: Mon, 14 Dec 2020 17:20:34 -0500
Message-ID: <20201214222036.561352-2-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214222036.561352-1-aurabindo.pillai@amd.com>
References: <20201214222036.561352-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bc740d2-86f1-4c62-e60d-08d8a07ea16b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4104:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4104B0EBDB24E451ACAF0B768BC70@CH2PR12MB4104.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibK1VGZjJ3hrILZlrC49yG6AYV62x9+A42aSPtaslGIVsvJkopJMIFr00b3OqvbALPmOZlu0uhRGzl4O+toX7w6xdgMyZwO1MBvANsIK8vIO5Kdq+yVAYNYLSO6ZFaUsvYOc2GdBY3AUzXgO8TTNDRrxeosPG85RZE9fDJBVm0q2VQrNlDUxUBrgzfwNPinFEUcWcKGCUEJKpttQTvQYXwc2vnHzC4R6xpHTkRnUiMgnCqHNstTNJDzh9HwUzvFhR3vUHqKb8I4P8dcKAlki0HnHat0L1A63hwFhtPkmXMe/VRD8ZMIlLqswSLv5uBoqDeDC71NJJtnSoXRgY7WiTY0Z1uvBMhm+pYZakUL5l5loW5XCnC362pAazRF2VEEuH34dnr/Kx9LL6FGASvyiqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(46966005)(36756003)(426003)(186003)(70206006)(26005)(450100002)(336012)(4326008)(44832011)(2616005)(8676002)(2906002)(6666004)(356005)(47076004)(1076003)(81166007)(5660300002)(83380400001)(8936002)(70586007)(508600001)(7696005)(82310400003)(86362001)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 22:21:40.6572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc740d2-86f1-4c62-e60d-08d8a07ea16b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 nicholas.kazlauskas@amd.com, shashank.sharma@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeSZIb3ddCkFkZHMgYSBtb2R1bGUgcGFyYW1ldGVyIHRvIGVuYWJsZSBleHBlcmltZW50YWwg
ZnJlZXN5bmMgdmlkZW8gbW9kZSBtb2Rlc2V0Cm9wdGltaXphdGlvbi4gRW5hYmxpbmcgdGhpcyBt
b2RlIGFsbG93cyB0aGUgZHJpdmVyIHRvIHNraXAgYSBmdWxsIG1vZGVzZXQgd2hlbgpmcmVlc3lu
YyBjb21wYXRpYmxlIG1vZGVzIGFyZSByZXF1ZXN0ZWQgYnkgdGhlIHVzZXJzcGFjZS4gVGhpcyBw
YXJhbXRlcnMgYWxzbwphZGRzIHNvbWUgc3RhbmRhcmQgbW9kZXMgYmFzZWQgb24gdGhlIGNvbm5l
Y3RlZCBtb25pdG9yJ3MgVlJSIHJhbmdlLgoKU2lnbmVkLW9mZi1ieTogQXVyYWJpbmRvIFBpbGxh
aSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZyBhdCBhbWQuY29tPgpSZXZpZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1h
IDxzaGFzaGFuay5zaGFybWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggZWVkNTQxMDk0N2U5Li5lMDk0
MjE4NGVmZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC0xNzcsNiArMTc3
LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZ3B1X3JlY292ZXJ5OwogZXh0ZXJuIGludCBhbWRncHVf
ZW11X21vZGU7CiBleHRlcm4gdWludCBhbWRncHVfc211X21lbW9yeV9wb29sX3NpemU7CiBleHRl
cm4gdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrOworZXh0ZXJuIHVpbnQgYW1kZ3B1X2V4cF9m
cmVlc3luY192aWRfbW9kZTsKIGV4dGVybiB1aW50IGFtZGdwdV9kY19kZWJ1Z19tYXNrOwogZXh0
ZXJuIHVpbnQgYW1kZ3B1X2RtX2FibV9sZXZlbDsKIGV4dGVybiBzdHJ1Y3QgYW1kZ3B1X21ncHVf
aW5mbyBtZ3B1X2luZm87CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5k
ZXggYjJhMWRkNzU4MWJmLi5lY2U1MWVjZDUzZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKQEAgLTE1OCw2ICsxNTgsNyBAQCBpbnQgYW1kZ3B1X21lczsKIGludCBh
bWRncHVfbm9yZXRyeSA9IC0xOwogaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGUgPSAtMTsKIGlu
dCBhbWRncHVfdG16OwordWludCBhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlOwogaW50IGFt
ZGdwdV9yZXNldF9tZXRob2QgPSAtMTsgLyogYXV0byAqLwogaW50IGFtZGdwdV9udW1fa2NxID0g
LTE7CiAKQEAgLTc4Niw2ICs3ODcsMTcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGFibWxldmVsLCBh
bWRncHVfZG1fYWJtX2xldmVsLCB1aW50LCAwNDQ0KTsKIE1PRFVMRV9QQVJNX0RFU0ModG16LCAi
RW5hYmxlIFRNWiBmZWF0dXJlICgtMSA9IGF1dG8sIDAgPSBvZmYgKGRlZmF1bHQpLCAxID0gb24p
Iik7CiBtb2R1bGVfcGFyYW1fbmFtZWQodG16LCBhbWRncHVfdG16LCBpbnQsIDA0NDQpOwogCisv
KioKKyAqIERPQzogZXhwZXJpbWVudGFsX2ZyZWVzeW5jX3ZpZGVvICh1aW50KQorICogRW5hYmxl
ZCB0aGUgb3B0aW1pemF0aW9uIHRvIGFkanVzdCBmcm9udCBwb3JjaCB0aW1pbmcgdG8gYWNoaWV2
ZSBzZWFtbGVzcyBtb2RlIGNoYW5nZSBleHBlcmllbmNlCisgKiB3aGVuIHNldHRpbmcgYSBmcmVl
c3luYyBzdXBwb3J0ZWQgbW9kZSBmb3Igd2hpY2ggZnVsbCBtb2Rlc2V0IGlzIG5vdCBuZWVkZWQu
CisgKiBUaGUgZGVmYXVsdCB2YWx1ZTogMCAob2ZmKS4KKyAqLworTU9EVUxFX1BBUk1fREVTQygK
KwlleHBlcmltZW50YWxfZnJlZXN5bmNfdmlkZW8sCisJIkVuYWJsZSBmcmVlc3luYyBtb2Rlc2V0
dGluZyBvcHRpbWl6YXRpb24gZmVhdHVyZSAoMCA9IG9mZiAoZGVmYXVsdCksIDEgPSBvbikiKTsK
K21vZHVsZV9wYXJhbV9uYW1lZChleHBlcmltZW50YWxfZnJlZXN5bmNfdmlkZW8sIGFtZGdwdV9l
eHBfZnJlZXN5bmNfdmlkX21vZGUsIHVpbnQsIDA0NDQpOworCiAvKioKICAqIERPQzogcmVzZXRf
bWV0aG9kIChpbnQpCiAgKiBHUFUgcmVzZXQgbWV0aG9kICgtMSA9IGF1dG8gKGRlZmF1bHQpLCAw
ID0gbGVnYWN5LCAxID0gbW9kZTAsIDIgPSBtb2RlMSwgMyA9IG1vZGUyLCA0ID0gYmFjbykKLS0g
CjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
