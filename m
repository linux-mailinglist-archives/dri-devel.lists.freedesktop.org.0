Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF712A9C6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 03:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8489B29;
	Thu, 26 Dec 2019 02:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86F89B27;
 Thu, 26 Dec 2019 02:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myJD31zXjwXMk1QCNu3WlZ4Q0ws3PD/iQywMaPvi62v7XKBGOy5dpGZU1hcaF+1Cdny8s28Ix6AEKFmO1IQ8w3A+wVonTPleUvyhCLoWu/nwUVdYjSRateakQi8Q7Fb6Zr9GTgeRXzgfx7hZVWyx18VSGwC85iGZZ1LxN3DOFqEINXc6wMSptFxzpdsa9xp+c2v+BKRAnqC2AMIbxQ9KmkmhUmpRnUvdRuCmSSxLb7tH6akMTU5CKQUio2omkuwpfOw5AIL20MA1ZX8Pcq2TrfUCwZZuKwxTmvhrQGZVvp2Mq4AeoJE8QIm6FTEbdleERUe/XzCUZOeYbQfuW/kefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1PNjT3OUDojEhmKFaN6WPvjsg1vV2p44xxhmiTQx4w=;
 b=fZ582mch71Ngzp2jSKL6i6uD8b5tUC2Hv5WvBR0Fw42EuqanNI61CMN5itxX5f8ERzhQiNE/FVI+qJcCEkvt9tl7Nepusd7t8BK3L6WLNrghTc9uOQiMVwTstxdMq3OcFxuPWkl14J/WtshZE00GfwOu4KSGS+n6j+UQUC94Z0YNpy3dfOGFT09VAoR+Q1JQ9SIgRby24jIzHW1YK6lxKkcFUtyD1aXhWvV1Q4uf8+wNNYBJo7+TLP4UDyR9PSFfdxetjCynh9jff221XMmYkmk0y5oCWMgJxt6OHv2QTdHguPnOSTJeyo0x4TXoyqzdDeJcitgpMWVgbYOi4C2xQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1PNjT3OUDojEhmKFaN6WPvjsg1vV2p44xxhmiTQx4w=;
 b=nXlBmGxoJH8WaratXGBPq7edq20DdR5X20JzYPr6oyG9xuCjufHg3avXs6wgJAqxE2XgRV0hR+1dl5JgWSVXAFlGFB/UZR7mMACvlaFIFgUzjAUs0WFvYgBjVcVZWmn/de0fMQg49ORj+Rz/Lccjl3AEYAeCigk2lvdRBse12Ng=
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 DM5PR12MB2342.namprd12.prod.outlook.com (2603:10b6:4:ba::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Thu, 26 Dec 2019 02:33:04 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::203) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Thu, 26 Dec 2019 02:33:04 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Thu, 26 Dec 2019 02:33:03 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 25 Dec
 2019 20:33:03 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 25 Dec 2019 20:33:01 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Avoid NULL pointer dereference
Date: Thu, 26 Dec 2019 10:31:51 +0800
Message-ID: <20191226023151.5448-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(428003)(189003)(199004)(86362001)(1076003)(316002)(2616005)(54906003)(6666004)(356004)(36756003)(26005)(5660300002)(2906002)(336012)(110136005)(7696005)(8936002)(186003)(426003)(81156014)(8676002)(70586007)(478600001)(70206006)(4326008)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2342; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7705947e-f40e-4639-e83e-08d789abef03
X-MS-TrafficTypeDiagnostic: DM5PR12MB2342:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23425A1CE3F0FF9FDBC3F376FC2B0@DM5PR12MB2342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02638D901B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Cm4Q4UF+ydBe17Lz27nul5jAcRVKQVK6ml4pohsIkIjbAn9TV9sPI9p1A2pVRvYcAmyFrc23i6OkwsWSqhKHZVi2CPoGPsBdae2Mt0pga/yfT0OpwjcHp5Fp7gxJVRg3yu8iEG8aFyz0XFLUPzo9HgTnJ5HGx+CsXwKpD/P5kwjSu+7rcUP1xn7DeytJGjw2Xt/7k9LmefdiENrgKxuweVXL3QVSjrwDGPLmh55VBgHlCSKPNieUegu46FLyFvFyJloFz40InxJQ1S3iWm6k/F37+9YlrwyrqU5g0KQuTd0xvrC5y73lTUIuuF/QsFcvPSeiQBsAepCM4F9WAapk7vdn9BPgdIMRbTtYZJUTtjEhtRQUz0M3qwuLq9IYnSiTDAlXpkZwEFrCbievYZs6vTTTsJucz15aCjUAMbcF9nIpZj3l9ixvzHsO7bAYqbV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2019 02:33:03.8217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7705947e-f40e-4639-e83e-08d789abef03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
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
Cc: stable@vger.kernel.org, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 mikita.lipski@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KRm91bmQga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB1bmRlciB0aGUgYmVs
b3cgc2l0dWF0aW9uOgoKCXNyYyDigJQgSERNSV9Nb25pdG9yICAgc3JjIOKAlCBIRE1JX01vbml0
b3IKZS5nLjoJICAgIFwgICAgICAgICAgICA9PgoJICAgICBNU1RCIOKAlCBNU1RCICAgICAodW5w
bHVnKSBNU1RCIOKAlCBNU1RCCgpXaGVuIGRpc3BsYXkgMSBIRE1JIGFuZCAyIERQIGRhaXN5IGNo
YWluIG1vbml0b3JzLCB1bnBsdWdnaW5nIHRoZSBkcApjYWJsZSBjb25uZWN0ZWQgdG8gc291cmNl
IGNhdXNlcyBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0CmRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX2J3X2xpbWl0KCkuIFdoZW4gY2FsY3VsYXRpbmcgcGJuX2xpbWl0LCBpZgpicmFu
Y2ggaXMgbnVsbCwgYWNjZXNzaW5nICImYnJhbmNoLT5wb3J0cyIgY2F1c2VzIHRoZSBwcm9ibGVt
LgoKW0hvd10KSnVkZ2UgYnJhbmNoIGlzIG51bGwgb3Igbm90IGF0IHRoZSBiZWdpbm5pbmcuIElm
IGl0IGlzIG51bGwsIHJldHVybiAwLgoKU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5M
aW5AYW1kLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA3ZDJkMzFl
YWYwMDMuLmE2NDczZTNhYjQ0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CkBAIC00NzA3LDYgKzQ3MDcsOSBAQCBpbnQgZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfYndfbGlt
aXQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpicmFuY2gsCiAJc3RydWN0IGRybV9kcF92Y3Bp
X2FsbG9jYXRpb24gKnZjcGk7CiAJaW50IHBibl9saW1pdCA9IDAsIHBibl91c2VkID0gMDsKIAor
CWlmICghYnJhbmNoKQorCQlyZXR1cm4gMDsKKwogCWxpc3RfZm9yX2VhY2hfZW50cnkocG9ydCwg
JmJyYW5jaC0+cG9ydHMsIG5leHQpIHsKIAkJaWYgKHBvcnQtPm1zdGIpCiAJCQlpZiAoZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQocG9ydC0+bXN0YiwgbXN0X3N0YXRlKSkKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
