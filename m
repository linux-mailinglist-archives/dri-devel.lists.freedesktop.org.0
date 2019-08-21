Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F051984E7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A2E6E393;
	Wed, 21 Aug 2019 20:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E649890A8;
 Wed, 21 Aug 2019 20:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcD0ABDX5ZCgniJ53GEunLefnl8DDn0L9Y82ZTtEc9Ke88t+WqIWZdjiiQkwIzlrhj37nyjsy6OVXA6bs9xuEzFYt6a0iJWff8KqARrUH1Px00u6Ky9gthMgnn46nJGpurgeF3/NrJlvyQfyS250m+V+ltwZfuVjqS2UzAZkSl+H6/bH40XvhNd7NFS8G9bX0MvCaWJCAmfx0JkUX1sS3p4jhl5NTToKqOGG/s+jL3fUoLvihWLqw/ydNG9kMNm3ORvNxKM2FRl3IkYazyVNZmwcHBNM5Wr2tmjYYNruHZHjRTbZjfp+lT0RL3PK/54318A6TazUS81KWvs/G7E4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IqAR56hSR6PAk4Yjsktj+cEHxiXJ05/aGT+J5N9QfY=;
 b=W5gXSetvZrcl8tRnhOh5aCoGJSLPl2jjbZlxyNmH9LTzt8VKb9QPTpg6hE7F3QiYnBD7J7LsrvPjsEo4Gzy8+e3NzGLyj4+YZisnmYGi+oQejjTzdT3mdbURoqCw2miDCDMKrz/2zfz23Kg2DfxcB0tghsJYSt9PTHsyhYWXnaBE+gCgtUMGy+NPwwUBkF530r0tZjedfQ+rbHwwekBW4PRzuQOIYMWX4+mbJhl+luJO88Sni3SkiqW1PIDduPJhqYlTp5+kXEaDFlG9IkFqzG9WtV6JzLLd0z7IT25vVJb9SP7cGZ5wz34+cCxl/x1lVyCnpW1Rlh6QZ6l4fghy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0005.namprd12.prod.outlook.com (2603:10b6:403:2::15)
 by DM6PR12MB2714.namprd12.prod.outlook.com (2603:10b6:5:49::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 21 Aug
 2019 20:01:36 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by BN4PR12CA0005.outlook.office365.com
 (2603:10b6:403:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:32 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 00/16] Display Stream Compression (DSC) for AMD Navi
Date: Wed, 21 Aug 2019 16:01:13 -0400
Message-ID: <20190821200129.11575-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39850400004)(376002)(2980300002)(428003)(189003)(199004)(450100002)(8676002)(8936002)(81166006)(49486002)(6666004)(70206006)(16586007)(4326008)(70586007)(86362001)(50466002)(47776003)(316002)(5660300002)(110136005)(48376002)(50226002)(53936002)(356004)(1076003)(26005)(14444005)(36756003)(486006)(336012)(476003)(81156014)(426003)(186003)(478600001)(51416003)(305945005)(2906002)(126002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2714; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b10fb4-8cea-4a2c-46bb-08d726725eec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2714; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2714FC9D88881D00C0A59963EFAA0@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wM281KXWEhzXsewG1GKT1wQtbz14uULQH7TozYBui9NSgi/xEzSzxenILOHCuV6B/VLjPhbR/EU+RecSd+x2TbTsNOG77yZvv2oindL0T5sS5A7TaSMdlJyeHfDJR9f8TXavn3L1pgpvhMJtVmHr4z8DlLCoiJqbYTYD/CpcdChgphwQkd9g1VE6AhgWhX09zLohZfW11oNjRkr0S56MVGFUMPory42qQqKJH5jxtkYTWX8z4OAa8bfKoUA0vr0xfYyiEJTicn70NsWRZDCCHeLlgUno3beFwEHPbsoEh5m1Y1mETnfuL+N6kBADHLiOJ4u/7QhXvk/Dug2sZC+EB5u3HigZnRkt5c+7z6qF0smB+Wkt+F1dzc1e5ymJeaJffd/jYLjD+FReJmUJkmwHWl04cfm5kMNP7AFBiJHAln8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:35.4232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b10fb4-8cea-4a2c-46bb-08d726725eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IqAR56hSR6PAk4Yjsktj+cEHxiXJ05/aGT+J5N9QfY=;
 b=vltEOnm4eNn5frRiVI5naREiPgCGCl9Lrpa5Bpv27rPAg120XD6uBH4wPkPCKu9xZbyVE3MApACqftEUFTOSS3W3USUxDeINpqdmT1DdhvCHi14WDtsJxoz5uNi+pFV2XuSjbqjuCdcrnm9Bv2veJtAZNeTZWRTQimWtgyWuilU=
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
LCA3IGFuZCA4IGFyZSBmaXhlcyBmb3IgYnVncyB0aGF0IHdvdWxkIGJlIGV4cG9zZWQgYnkKTVNU
IERTQy4gUGF0Y2hlcyA2IGFuZCA3IGFkZCBhbmQgdXNlIGEgbmV3IERSTSBoZWxwZXIgZm9yIE1T
VApjYWxjdWxhdGlvbnMuIFBhdGNoIDggZml4ZXMgYSBzaWxseSB1c2UtdW5pbml0aWFsaXplZAoK
UGF0Y2hlcyA5LCAxMCwgYW5kIDExIGFyZSBzbWFsbCBEUk0gY2hhbmdlcyByZXF1aXJlZCBmb3Ig
RFNDIE1TVDoKRkVDLCBhIG5ldyBiaXQgaW4gdGhlIHN0YW5kYXJkOyBNU1QgRFBDRCBmcm9tIGRy
aXZlcnM7IGFuZAphIHByZXZpb3VzbHkgdW5pbml0aWFsaXplZCB2YXJpYWJsZS4KClBhdGNoZXMg
MTIgdGhyb3VnaCAxNiBhcmUgdGhlIERTQyBNU1QgcG9saWN5IGl0c2VsZi4gUGF0Y2ggMTIKYWRk
cyBEU0MgYXV4IGFjY2VzcyBoZWxwZXJzIHRvIERSTSwgYW5kIHBhdGNoZXMgMTMgYW5kIDE0IG1h
a2UKdXNlIG9mIHRob3NlIGhlbHBlcnMuIFBhdGNoIDE1IGRlYWxzIHdpdGggZGl2aWRpbmcgYmFu
ZHdpZHRoCmZhaXJseSBiZXR3ZWVuIG11bHRpcGxlIHN0cmVhbXMsIGFuZCBwYXRjaCAxNiBlbnN1
cmVzCnRoYXQgTVNUIENSVEMgdGhhdCBtYXkgY2hhbmdlIERTQyBjb25maWcgYXJlIHJlcHJvZ3Jh
bW1lZAoKdjI6IFVwZGF0aW5nIHBhdGNoZXMgNiBhbmQgMTQgaW4gcmVzcG9pbnNlIHRvIE5pY2sn
cyBmZWVkYmFjawp2MzogQWRkIHJldHVybiB2YWx1ZSB0byBwYXRjaCA2IGFuZCBzcGxpdCBpdCAo
bm93IHBhdGNoZXMgNiAmIDcpCiAgICBOZXcgcGF0Y2ggMTAgYWRkaW5nIE1TVCBEUENEIHJlYWQv
d3JpdGUgc3VwcG9ydAogICAgTWlub3IgZml4IChudW1fcG9ydHMtLSkgdG8gcGF0Y2ggMTEKICAg
IEFkZCBEUk0gaGVscGVycyAocGF0Y2ggMTIpCgpEYXZpZCBGcmFuY2lzICgxNik6CiAgUmV2ZXJ0
ICJkcm0vYW1kL2Rpc3BsYXk6IHNraXAgZHNjIGNvbmZpZyBmb3IgbmF2aTEwIGJyaW5nIHVwIgog
IFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBuYXZpMTAgYnJpbmcgdXAgc2tpcCBkc2MgZW5jb2Rl
ciBjb25maWciCiAgUmV2ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6IGFkZCBnbG9iYWwgbWFzdGVyIHVw
ZGF0ZSBsb2NrIGZvciBEQ04yIgogIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBGaXggdW5kZXJz
Y2FuIG5vdCB1c2luZyBwcm9wZXIgc2NhbGluZyIKICBkcm0vYW1kL2Rpc3BsYXk6IEVuYWJsZSBT
U1QgRFNDIGluIERNCiAgZHJtL2RwLW1zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1v
ZGVzCiAgZHJtL2FtZC9kaXNwbGF5OiBVc2UgY29ycmVjdCBoZWxwZXJzIHRvIGNvbXB1dGUgdGlt
ZXNsb3RzCiAgZHJtL2FtZC9kaXNwbGF5OiBJbml0aWFsaXplIERTQyBQUFMgdmFyaWFibGVzIHRv
IDAKICBkcm0vZHAtbXN0OiBQYXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKICBkcm0v
ZHAtbXN0OiBBZGQgTVNUIHN1cHBvcnQgdG8gRFAgRFBDRCBSL1cgZnVuY3Rpb25zCiAgZHJtL2Rw
LW1zdDogRmlsbCBicmFuY2gtPm51bV9wb3J0cwogIGRybS9kcC1tc3Q6IEFkZCBoZWxwZXJzIGZv
ciBxdWVyeWluZyBhbmQgZW5hYmxpbmcgTVNUIERTQwogIGRybS9hbWQvZGlzcGxheTogVmFsaWRh
dGUgRFNDIGNhcHMgb24gTVNUIGVuZHBvaW50cwogIGRybS9hbWQvZGlzcGxheTogV3JpdGUgRFND
IGVuYWJsZSB0byBNU1QgRFBDRAogIGRybS9hbWQvZGlzcGxheTogTVNUIERTQyBjb21wdXRlIGZh
aXIgc2hhcmUKICBkcm0vYW1kL2Rpc3BsYXk6IFRyaWdnZXIgbW9kZXNldHMgb24gTVNUIERTQyBj
b25uZWN0b3JzCgogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgMTEzICsrKystCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJz
LmMgfCAgMzMgKy0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
ICB8IDQwMiArKysrKysrKysrKysrKysrKy0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmggICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jICAgICAgfCAgMTIgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2h3c3MuYyAgICB8ICAgMyArCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9kc2MuYyAgfCAgIDMgKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jICAgIHwgICA0IC0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X29wdGMuYyB8ICA3MiArLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9vcHRjLmggfCAgIDMgLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jIHwgICA3ICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmggfCAgIDEgKwogLi4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfc3RyZWFtX2VuY29kZXIu
YyAgIHwgICA4IC0KIC4uLi9hbWQvZGlzcGxheS9kYy9pbmMvaHcvdGltaW5nX2dlbmVyYXRvci5o
ICB8ICAgMiAtCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAg
fCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8
ICAxMCArLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgIHwg
MjQwICsrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAg
ICAgICAgfCAgIDggKy0KIDE4IGZpbGVzIGNoYW5nZWQsIDgwNiBpbnNlcnRpb25zKCspLCAxMzEg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
