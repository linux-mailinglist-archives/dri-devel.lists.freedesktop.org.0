Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A049490C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D396E1C0;
	Mon, 19 Aug 2019 15:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074236E1C0;
 Mon, 19 Aug 2019 15:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSVI4hA7V7OGIPGfz7DogTA3drW/WgQIynmq4FNOrlUPBHpkXLcZWYeXQdifaMN3F5FP3q/HbEcU9L/iIqpeQl+EmZ/ZafHBAC1aeq736qaR7UeHOQF1D+UbmeSFJCrcS1/Kr4gH25DXbdFZdBxK9SzlPcWHlQ+qcXruRvDVsPmHhpLOg4JjC9ahfldV0xbzNBYLzf96HuzxtLaGCcAdGdObU93+tCuj357fQnTPfBwN0yjuBxOxJ9HLWkA+McIrrE3EReIya04e0Bx4qPXNEolgSVthvcCeOXVVLvKsQ0FCUmBdlPYh/1cVQhYiXqO2yhwxLrJ3VGOYvDfrMEnARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebm8o9ww1aN8xg4ByfDq7H6z4Hub17FsB21CgxQC8Uc=;
 b=QnEii8ezCSfXBbcRiCVoFCydGpTzJgDGjhS6EN25bb5hOn7RXaxMbvNTOwgvaO9l7moqgrOFrlQzYAPm06DDtwDtJCxg9RTNcpq+bqG7ArVbYLDaU475NAN7x2ZcGiV3NVqww1C0sAAqkBa9lbugCodHnsq9LZRBTJ6d/7SPSW51iW75HHCMplC2myqiEyAqu4dyKfUSOKz8Y04pC0FPXzBSksCxBEF2z9Re2G7ZrAoltlHICSVK1au/ykKDr9OmvtM9TflSJR0K72Ii6MUWJl5xqJGoxI8ISrmIEnPwz9XoPY/0VpMvxJRcEYPegIejjti+sDJPrZB0+V2FILW9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0002.namprd12.prod.outlook.com (2603:10b6:403:2::12)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 15:50:44 +0000
Received: from BY2NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by BN4PR12CA0002.outlook.office365.com
 (2603:10b6:403:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT064.mail.protection.outlook.com (10.152.85.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:43 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:42 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/14] Display Stream Compression (DSC) for AMD Navi
Date: Mon, 19 Aug 2019 11:50:24 -0400
Message-ID: <20190819155038.1771-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(2980300002)(428003)(189003)(199004)(316002)(50226002)(50466002)(51416003)(478600001)(2906002)(86362001)(356004)(6666004)(47776003)(110136005)(16586007)(8936002)(70206006)(305945005)(81156014)(70586007)(81166006)(8676002)(5660300002)(186003)(450100002)(49486002)(36756003)(1076003)(26005)(336012)(426003)(53936002)(486006)(126002)(2616005)(476003)(48376002)(4326008)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94b131bd-3c19-4e30-7601-08d724bcfe2a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718E6DA2B77A49801D6F7F0EFA80@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: H539b3kcYpQsSqfwwFEg2VW2BA84GzU5lFOqVFulzZcV2uh7UglZV6Xzi4xwmJj4UkQ318iPjG7TI0J251CHjes9xozSjbggIvb0QSUX+nT0bz75ICPNESkb2YewMNY++G8LCQ19Lsv8QgMggcWjj/hur8wq5I5GO0+X3msPTCFV1XGZtGhhuSLPig91UkF7hMYYQlPZnKMtnHNaBR89UlX3JHr2zX9yEXXdEmiN7YqjhcKYa1J/mbTpC1cl6zWV+BbJyrz/6t/uJbKHGZ51W13iuFqA1RhA3vahgCuzbSg1+BYFKCNLFhrUHe7oJJDaxxE7agBgbwavXK15riHbYPCpT+o/0SpJRp0/02OXHzVTJJZIobYQLqnk00nu3a/juEqCFpYCE0BHd703iD5jpXZmYwKnwPU+nwzWNqpJPC8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:43.1380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b131bd-3c19-4e30-7601-08d724bcfe2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebm8o9ww1aN8xg4ByfDq7H6z4Hub17FsB21CgxQC8Uc=;
 b=ZspKr4zWIBwyE4ZK0/8ZoU7w9Pe/eMCNMku6x9m2mmQo5iKceljrqQhk1pI+qp8U6gX78WpPl/C+MHjnd/5L6oQZtVxyzV7L85TNXbs1EncpauYKdn+fXQ/dx31+LCH4cMDkjMzzfg1yo3NR62iuQteeGGWuD361OVCUq/2evxI=
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
IERQIApjb25uZWN0b3JzIG9uIE5hdmkgQVNJQ3MsIGJvdGggU1NUIGFuZCBEU0MuCgo4azYwIGFu
ZCA0azE0NCBzdXBwb3J0IHJlcXVpcmVzIE9ETSBjb21iaW5lLCBhbiBBTUQgaW50ZXJuYWwKZmVh
dHVyZSB0aGF0IG1heSBiZSBhIGJpdCBidWdneSByaWdodCBub3cuCgpQYXRjaGVzIDEgdGhyb3Vn
aCA1IGVuYWJsZSBEU0MgZm9yIFNTVC4gTW9zdCBvZiB0aGUgd29yayB3YXMKYWxyZWFkeSBkb25l
IGluIHRoZSBOYXZpIHByb21vdGlvbiBwYXRjaGVzOyB0aGlzIGp1c3QgaG9va3MKaXQgdXAgdG8g
dGhlIGF0b21pYyBpbnRlcmZhY2UuIFRoZSBmaXJzdCB0d28gcmV2ZXJ0cyBhcmUgb2YgdGVtcG9y
YXJ5CmNoYW5nZXMgdG8gYmxvY2sgb2ZmIERTQy4gVGhlIHRoaXJkIGlzIG9mIGEgY29tbWl0IHRo
YXQgd2FzCmFjY2lkZW50YWxseSBwcm9tb3RlZCB0d2ljZS4gVGhlIGZvdXJ0aCBhbmQgbGFzdCBy
ZXZlcnQgZml4ZXMgYSAKcG90ZW50aWFsIGlzc3VlIHdpdGggT0RNIGNvbWJpbmUuCgpQYXRjaGVz
IDYgYW5kIDcgYXJlIGZpeGVzIGZvciBidWdzIHRoYXQgd291bGQgYmUgZXhwb3NlZCBieSAKTVNU
IERTQy4gT25lIGZpeCBpcyB3aXRoIHRoZSBNU1QgY29kZSBhbmQgdGhlIG90aGVyIGluIHRoZSBE
U0MgY29kZS4KClBhdGNoZXMgOCwgOSwgYW5kIDEwIGFyZSBzbWFsbCBEUk0gY2hhbmdlcyByZXF1
aXJlZCBmb3IgRFNDIE1TVDoKRkVDLCBhIG5ldyBiaXQgaW4gdGhlIHN0YW5kYXJkOyBzb21lIGV4
cG9ydCBkZWZpbml0aW9uczsgYW5kCmEgcHJldmlvdXNseSB1bmluaXRpYWxpemVkIHZhcmlhYmxl
LgoKUGF0Y2hlcyAxMSB0aHJvdWdoIDE0IGFyZSB0aGUgRFNDIE1TVCBwb2xpY3kgaXRzZWxmLiBU
aGlzIGluY2x1ZGVzCnRoZSBjb2RlIGZvciBkZXRlY3RpbmcgYW5kIHZhbGlkYXRpbmcgRFNDIGNh
cGFiaWxpdGllcywgZW5hYmxpbmcKRFNDIG92ZXIgYSBsaW5rLCBjb21wdXRpbmcgdGhlIGZhaXIg
RFNDIGNvbmZpZ3VyYXRpb25zIGZvcgptdWx0aXBsZSBEU0MgZGlzcGxheXMsIGFuZCBhZGRpbmcg
dG8gYXRvbWljIHN0YXRlIGNydGNzIHRoYXQgbWlnaHQgCm5lZWQgcmVwcm9ncmFtbWluZyBkdWUg
dG8gRFNDLgoKRGF2aWQgRnJhbmNpcyAoMTQpOgogIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBz
a2lwIGRzYyBjb25maWcgZm9yIG5hdmkxMCBicmluZyB1cCIKICBSZXZlcnQgImRybS9hbWQvZGlz
cGxheTogbmF2aTEwIGJyaW5nIHVwIHNraXAgZHNjIGVuY29kZXIgY29uZmlnIgogIFJldmVydCAi
ZHJtL2FtZC9kaXNwbGF5OiBhZGQgZ2xvYmFsIG1hc3RlciB1cGRhdGUgbG9jayBmb3IgRENOMiIK
ICBSZXZlcnQgImRybS9hbWQvZGlzcGxheTogRml4IHVuZGVyc2NhbiBub3QgdXNpbmcgcHJvcGVy
IHNjYWxpbmciCiAgZHJtL2FtZC9kaXNwbGF5OiBFbmFibGUgU1NUIERTQyBpbiBETQogIGRybS9h
bWQvZGlzcGxheTogVXNlIGRjIGhlbHBlcnMgdG8gY29tcHV0ZSB0aW1lc2xvdCBkaXN0cmlidXRp
b24KICBkcm0vYW1kL2Rpc3BsYXk6IEluaXRpYWxpemUgRFNDIFBQUyB2YXJpYWJsZXMgdG8gMAog
IGRybS9kcC1tc3Q6IFBhcnNlIEZFQyBjYXBhYmlsaXR5IG9uIE1TVCBwb3J0cwogIGRybS9kcC1t
c3Q6IEV4cG9ydCBzeW1ib2xzIGZvciBkcGNkIHJlYWQvd3JpdGUKICBkcm0vZHAtbXN0OiBGaWxs
IGJyYW5jaC0+bnVtX3BvcnRzCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBv
biBNU1QgZW5kcG9pbnRzCiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1T
VCBEUENECiAgZHJtL2FtZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQogIGRy
bS9hbWQvZGlzcGxheTogVHJpZ2dlciBtb2Rlc2V0cyBvbiBNU1QgRFNDIGNvbm5lY3RvcnMKCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMTYgKysrLQog
Li4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgIDcxICstLQog
Li4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgNDk4ICsrKysr
KysrKysrKysrKysrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMu
aCAgIHwgICA1ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAg
ICB8ICAxMiArLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jICAg
IHwgICAzICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICB8
ICAgMyArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAgfCAg
IDQgLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwgIDcy
ICstLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5oIHwgICAz
IC0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8ICAgNyAr
LQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIHwgICAxICsK
IC4uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMgICB8ICAgOCAtCiAu
Li4vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3RpbWluZ19nZW5lcmF0b3IuaCAgfCAgIDIgLQogZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgIHwgICA2ICsKIGluY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAgICAgICB8ICAgMyArCiAxNiBmaWxl
cyBjaGFuZ2VkLCA2NjggaW5zZXJ0aW9ucygrKSwgMTQ2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
