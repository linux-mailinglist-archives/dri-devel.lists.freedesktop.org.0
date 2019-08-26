Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE09D27B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EA86E154;
	Mon, 26 Aug 2019 15:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3226E131
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5HeczbDS9zDgh6C1WSUuudap0fdDvf0j9oAJrg8iUVp8+id9qsQ5c8hOfRQoxab77bD6Yhmz/eYXpBLFkgM56sUiojWshO0/DPXnLSfyyV5PxDsEI01t5HaWCtvYIBANPi/7Av+sXjD79i5Esr7dB6tdw+Bcf5UkFpeb/5E7SBoDuNDMUKBBdh+7KNNubSq2zg7qm4nJu/mPfq4iEBl2vHLI4lB7x4zJmAqGJgT+MUvrjdqAyOzGvYZVzNJ0hZgz792PsQ9FFTZ7CzxxX8W0FnKD/iHh7l0oDWwjK6668jMXJx0YQ58J1zSEk0ShVGNipb4hRXNB/OuVLVExWYCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di1m74GL/Ej3NDQqVvFELcrahpS6TUKCXmmdN1jJFHk=;
 b=O0ZA6wA+/L2rXSQ/hwq4T367cs36hPO06k7DswsSq5slAAjv/r/Cu04bOAG2DhwPVZKWTbq3d6UuqG3CNixaNlFWMfZm9qIpfVpH+y+1wagfgd6MlDa1RQBKVq5ECUto1I+751sPKmlalLmj51csspciocrluYBpUQ99Fdchfhg3+tFT13puO5Uu2sxpDm2YkeFPkqR/tJyWHHFKIeyb2EhGcHPT+3h48EK1pc8joFHMvkyhtM3mV7kOKuEnFt4lXaR/rMss1tO/l0OJn51/rOxtLFUDHzZ64FRHSq6L+2DdWAkFRCwa/GbRkFHBBXZQ0y6CnpwhoxEb6wAUvLLeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0034.namprd12.prod.outlook.com (2603:10b6:208:a8::47)
 by MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.19; Mon, 26 Aug
 2019 15:17:31 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MN2PR12CA0034.outlook.office365.com
 (2603:10b6:208:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 15:17:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 15:17:30 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 10:17:29 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/6] DSC MST support in DRM
Date: Mon, 26 Aug 2019 11:17:22 -0400
Message-ID: <20190826151728.19567-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(70586007)(426003)(49486002)(336012)(316002)(50226002)(1076003)(50466002)(47776003)(48376002)(356004)(51416003)(16586007)(6666004)(2351001)(5660300002)(478600001)(86362001)(186003)(36756003)(2906002)(53936002)(126002)(476003)(2616005)(305945005)(4326008)(70206006)(6916009)(81166006)(81156014)(8936002)(486006)(26005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c94c03-949c-41f5-d9e7-08d72a388364
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1280C2B7AB07347C98FE62FDEFA10@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Y3KOQWTh2kUhD81QOtnKDFWZtoujhtttP/66CHr9aKxucfcEwk+yUQ/2gt40Aig1l99ngtvlg5DolMR44Stau6CfUTvFd4hpueqekZToaPs+aqEmZZMYMgT2PkeV28p1JtEhMvIbAar3n4MKnaLrnYMOkcY2pQNgdejMTyoBHVQp6XXjRZlY5DGm3Fm+esZQDlilhqwFuYNQkKF/ULL93XR135XId2ypxw2RngtDA64vpreWZnIHbI9BFFWYqbb0CkEFCX+XbyiAevFGwRLgF31/Tj/U7cgQissX92hCMzZsb3drgrPxq2/wHOA79XzMkxjrcytGobVgSROEyc0cLkH6Xv9VwxOBEVMj8QY6ov9+zTn9tQBILPKQKC8EEWL0TX1Uxf61mXx8EAeIdqBRIpDxIC55t/+Vs9chfKUS6Ys=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 15:17:30.6183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c94c03-949c-41f5-d9e7-08d72a388364
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di1m74GL/Ej3NDQqVvFELcrahpS6TUKCXmmdN1jJFHk=;
 b=Lc2A9B+3c8D4UGLATNdhdC7cNvv4lnZiZzxFS3LlbJjn8VUGJ11DGl3vSPADGsdMWuBszV7rDA/4wwBxVoSEujRU7XZsxiXW5HmMYW9jymJJcpELWfdRp7wMrM6e/2HfjFZ5MEbOLlqW0FFOaY0pUbYfaiW4mg7h3+EaDxFy2gE=
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

QWRkIG5lY2Vzc2FyeSBzdXBwb3J0IGZvciBNU1QgRFNDLgooRGlzcGxheSBTdHJlYW0gQ29tcHJl
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFu
ZCByZWJhc2Ugb250byBkcm0tdGlwCnY1OiBDbGVhbiB1cCBmb3JtYXR0aW5nLCBtYWtlIG5ldyBx
dWlyawp2NjogRml4IHR5cG8sIHNwbGl0IGxhc3QgcGF0Y2ggaW4gdHdvCnY3OiBGaXggY29tcGls
YXRpb24gd2FybmluZ3MKCkRhdmlkIEZyYW5jaXMgKDYpOgogIGRybS9kcF9tc3Q6IEFkZCBQQk4g
Y2FsY3VsYXRpb24gZm9yIERTQyBtb2RlcwogIGRybS9kcF9tc3Q6IFBhcnNlIEZFQyBjYXBhYmls
aXR5IG9uIE1TVCBwb3J0cwogIGRybS9kcF9tc3Q6IEFkZCBNU1Qgc3VwcG9ydCB0byBEUCBEUENE
IFIvVyBmdW5jdGlvbnMKICBkcm0vZHBfbXN0OiBGaWxsIGJyYW5jaC0+bnVtX3BvcnRzCiAgZHJt
L2RwX21zdDogQWRkIG5ldyBxdWlyayBmb3IgU3luYXB0aWNzIE1TVCBodWJzCiAgZHJtL2RwX21z
dDogQWRkIGhlbHBlcnMgZm9yIE1TVCBEU0MgYW5kIHZpcnR1YWwgRFBDRCBhdXgKCiAuLi4vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jICAgICAgICAgICAgICB8ICAxMiArLQogZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgICAgICAgICAgICAgIHwgIDMyICsrLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgICB8IDE3MCArKysrKysrKysrKysr
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgICB8ICAg
MiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYyAgICAgICAgfCAgIDIg
Ky0KIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICB8ICAgNyAr
CiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAgICAgICAgfCAgIDggKy0K
IDkgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
