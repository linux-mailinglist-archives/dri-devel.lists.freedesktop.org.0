Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D706110045
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DD56E78F;
	Tue,  3 Dec 2019 14:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37D6E78A;
 Tue,  3 Dec 2019 14:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZ5XNiBE6QSuMxbtOqkjXsYooBf4pKprruvxAJikZiWSb8lkuFlevwWDENUaI1keVEq1J3gAJrsumGht4VhJ4vADmmbr6feT6oO71HtTwGXlLQ3mMJaCMe9lKRhOQUajFbMmnH3pEiTIWs9PqBsJsMQAHcQ3PbySnYOaweZeJ7FoMtMb+6DpWq6hbcdwVq/VUFaRUTr/ALF0ldC7RtUTTeyUevfwXYXr8ppiLqYKYAaB5lvgafr0ZEpo92k2HBP81HX2VnirKp5WNEZNWrCsOwSKmIAaviI0B7YIXBKQukKfhO36zCOpy9/qGQA9JA2wbEmQDocVXGZyHnVgC/zT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTy3P8e4ZAHcq4A0FPlYV0BNr6tbXL5F8onOkkQ0QBI=;
 b=mHDfdyTYJqkavUqmCEpJY8qqIwIUh4YMXNGwvTcVIHHe8KgVdNhHUMSRWY5ggrvT328JemZjEd8Ex3FtJJ0th7ZTwEc7w+K1Hi9b0BuUcvvjxFqYC+nThGs4+Iu8zyZQ3vWEZA9Eif6COQv3FvjJt60BmT+klRA1f5WWD+/4+5uFeH6S7wfW462guPtaC6j/nNwR1R0sAw7KRqTudqMkY0MYrV4lcOjbbsQBtyKk2z4g3NMJttA9ZzpIz3WcmEQQRi2KCAYeZvLdlJ2i2NSjze8JZcXeeGYW5h4ffPND0mRxoFcJ8UMgGqPxVDsmJMrwaOOBzW0Yr9nvfrNFNMKzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Tue, 3 Dec
 2019 14:35:41 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:41 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:40 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:40 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 00/17] DSC MST support for DRM and AMDGPU
Date: Tue, 3 Dec 2019 09:35:13 -0500
Message-ID: <20191203143530.27262-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(428003)(189003)(199004)(2351001)(6916009)(26005)(7696005)(51416003)(50466002)(426003)(81156014)(356004)(8676002)(48376002)(2616005)(336012)(6666004)(1076003)(4326008)(81166006)(50226002)(450100002)(186003)(478600001)(8936002)(70206006)(5660300002)(54906003)(14444005)(86362001)(305945005)(70586007)(36756003)(2906002)(53416004)(316002)(2876002)(16586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4194; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 971e155d-6d46-4aae-4326-08d777fe12ba
X-MS-TrafficTypeDiagnostic: BY5PR12MB4194:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4194F95B007077003CB1E080E4420@BY5PR12MB4194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkYI4zWRitPFR1iEk3r3lP7fl000RmJnbjLvPbdiOmDVwLkUtN9sUEC3G0/fhLijSWC4vCqdf4MEZzitU9DoyoV/+v/FSKiGBy90Ydlur3sM05RPZFOuYWILl9cLms0+1TIxtOrHPRhUi1BHSvj+80lY7EPDyMmYIcgJYWKKOs0hu6Qu7A+v+23NiqzVwjKjA929tdRJDupuqAaFp5GOs/vko0+CgyDgcTUYfHrIz8sPooH26TPc6dtS7fETMYvc0OWJXjk3nXTywp2iAb8kFAkjhXPlxxDSuznknrGXiCdLyb3oAETYk3oj4Au1V2z+mD6GxeJXu6X4jmByQypZ0ikTMbGg8Cn8Bw7IRjT/sYQ1oT1pRKVhG1d9wFE6smF2XB52+TCagP2yiEXFQKH/Rpmq6/ZrAaFm9+yAV6IQ93/wr3lzSUy2h/+u6USIPmvJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:41.4976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 971e155d-6d46-4aae-4326-08d777fe12ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTy3P8e4ZAHcq4A0FPlYV0BNr6tbXL5F8onOkkQ0QBI=;
 b=a7sgCLz7GM9oR9y7H5/GDxGUP7mK3XJ4YQujem1f1tRZdcYaIPDvoatf+3FBxRhjJTMt82JgQQgk0ZYDVUfsi/G434h5/9kOIUUrIg4EYL60tVn+ZyjuhyT47PXmVCdMjL1QPYKQjFNT3DMg8PTMlcy5aXy04/19mqKuaT1TMvs=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKVGhpcyBzZXQgb2Yg
cGF0Y2hlcyBpcyBhIGNvbnRpbnVhdGlvbiBvZiBEU0MgZW5hYmxlbWVudApwYXRjaGVzIGZvciBB
TURHUFUuIFRoaXMgc2V0IGVuYWJsZXMgRFNDIG9uIE1TVC4gSXQgYWxzbwpjb250YWlucyBpbXBs
ZW1lbnRhdGlvbiBvZiBib3RoIGVuY29kZXIgYW5kIGNvbm5lY3RvcgphdG9taWMgY2hlY2sgcm91
dGluZXMuCgpUaGVzZSBwYXRjaGVzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIG11bHRpcGxlCml0
ZXJhdGlvbnMgdG8gdGhlIG1haWxpbmcgbGlzdCBiZWZvcmUuIFRoZXNlIHBhdGNoZXMgd2VyZQpk
ZXZlbG9wZWQgYnkgRGF2aWQgRnJhbmNpcyBhcyBwYXJ0IG9mIGhpcyB3b3JrIG9uIERTQy4KCnYy
OiBzcXVhc2hlZCBwcmV2aW91c2x5IDMgc2VwYXJhdGUgYXRvbWljIGNoZWNrIHBhdGNoZXMsCnNl
cGFyYXRlIGF0b21pYyBjaGVjayBmb3IgZHNjIGNvbm5lY3RvcnMsIHRyYWNrIHZjcGkgYW5kCnBi
biBvbiBjb25uZWN0b3JzLgoKdjM6IE1vdmVkIG1vZGVzZXQgdHJpZ2dlciBvbiBhZmZlY3RlZCBN
U1QgZGlzcGxheXMgdG8gRFJNCgp2NDogRml4IHdhcm5pbmdzLCB1c2UgY3VycmVudCBtb2RlJ3Mg
YnBjIHJhdGhlciB0aGFuIGRpc3BsYXkncwptYXhpbXVtIGNhcGFibGUgb25lCgp2NTogTW92aW5n
IGJyYW5jaCdzIGJhbmR3aWR0aCB2YWxpZGF0aW9uIHRvIERSTSwKQWRkZWQgZnVuY3Rpb24gdG8g
ZW5hYmxlIERTQyBwZXIgcG9ydCBpbiBEUk0KCnY2OiBDb21wdXRlIGZhaXIgc2hhcmUgdXNlcyBE
Uk0gaGVscGVyIGZvciBCVyB2YWxpZGF0aW9uCgp2NzogQWRkIGhlbHBlciB0byBvdmVyd3JpdGUg
UEJOIGRpdmlkZXIgcGVyIHNsb3QsCiAgICBBZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHRyaWdnZXIg
bW9kZXNldCBvbiBhZmZlY3RlZCBEU0MgY29ubmVjdG9ycwppbiBEUk0KCnY4OiBSZWJhc2VkIG9u
IHRvcCBvZiB0aGUgTVNUIHJlZmFjdG9yIHBhdGNoZXMgdGhhdCB3ZXJlIG9uIERSTS10aXAKICAg
IFNvbWUgY29zbWV0aWMgYW5kIGNsZWFudXAgY2hhbmdlcwoKRGF2aWQgRnJhbmNpcyAoOSk6CiAg
ZHJtL2RwX21zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21z
dDogUGFyc2UgRkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1T
VCBzdXBwb3J0IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJh
bmNoLT5udW1fcG9ydHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVycyBmb3IgTVNUIERTQyBhbmQg
dmlydHVhbCBEUENEIGF1eAogIGRybS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZh
cmlhYmxlcyB0byAwCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBvbiBNU1Qg
ZW5kcG9pbnRzCiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENE
CiAgZHJtL2FtZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQoKTWlraXRhIExp
cHNraSAoOCk6CiAgZHJtL2RwX21zdDogQWRkIG5ldyBxdWlyayBmb3IgU3luYXB0aWNzIE1TVCBo
dWJzCiAgZHJtL2RwX21zdDogTWFudWFsbHkgb3ZlcndyaXRlIFBCTiBkaXZpZGVyIGZvciBjYWxj
dWxhdGluZyB0aW1lc2xvdHMKICBkcm0vZHBfbXN0OiBBZGQgRFNDIGVuYWJsZW1lbnQgaGVscGVy
cyB0byBEUk0KICBkcm0vZHBfbXN0OiBBZGQgYnJhbmNoIGJhbmR3aWR0aCB2YWxpZGF0aW9uIHRv
IE1TVCBhdG9taWMgY2hlY2sKICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBQQk4gcGVyIHNsb3QgY2Fs
Y3VsYXRpb24gZm9yIERTQwogIGRybS9hbWQvZGlzcGxheTogUmVjYWxjdWxhdGUgVkNQSSBzbG90
cyBmb3IgbmV3IERTQyBjb25uZWN0b3JzCiAgZHJtL2RwX21zdDogQWRkIGhlbHBlciB0byB0cmln
Z2VyIG1vZGVzZXQgb24gYWZmZWN0ZWQgRFNDIE1TVCBDUlRDcwogIGRybS9hbWQvZGlzcGxheTog
VHJpZ2dlciBtb2Rlc2V0cyBvbiBNU1QgRFNDIGNvbm5lY3RvcnMKCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMTcgKysrKy0KIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCB8ICAgMSArCiAuLi4vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgfCAgMTkgKy0KIC4uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDM5OSArKysrKysrKysrKysrKysrKy0KIC4u
Li9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAgNSArCiAuLi4v
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgICAgfCAgIDMgKwogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMgIHwgICAzICsKIC4uLi9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8ICAgNyArLQogLi4uL2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIHwgICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfYXV4X2Rldi5jICAgICAgICAgICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyAgICAgICAgICAgICAgIHwgIDMyICstCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgfCAzOTUgKysrKysrKysrKysrKysrKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgICB8ICAgNSArLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgICA1ICstCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYyAgICAgICAgfCAgIDIgKy0KIGlu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAgICAgICAgfCAgMTkgKy0KIDE3IGZp
bGVzIGNoYW5nZWQsIDk4OCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
