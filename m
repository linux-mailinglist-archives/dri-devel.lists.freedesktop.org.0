Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B9480341
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 19:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D576810EEDD;
	Mon, 27 Dec 2021 18:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661DA10EEE1;
 Mon, 27 Dec 2021 18:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUJIoH7b7E8twwG5vN1ehe+dmfkeWXfn+tjXpnGQ3TybBOnudPiQtSDjEsp+W5zzhEsLtCuHsduExx30lSG8lwFYnEFufxEBGq4jYSxhuVEydX7ScZv6HO7Gsde7UFl5bH56Fc7rqU+Fzi4HwB5Z4naVAop6OqwxsUqFgHWQ4p1PDa8eMTJ0LLXOoYtpEC+pf6d9weWevZH5t6bXBaA0BJ/kbkB0ajd7ZdcTFJexIsYWIB1KhcyHW/voTQN0CV9AbHaT7kqswryr3lRcLgOD46FDdjJPVBlfyIuJZwRicYRnmi6/pjiLp4revcOE2pA2uxNieyLJtOL+ZXZbybI9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW+p8NKGCiwOFZOb7xERZK7JbWeLxtGJ/fWV75NyPUc=;
 b=hkELvlCkzjMcKDNkj2bFS3DpRXW12iyg+g7vemQqBREf7m0c5eaZiJWyZbKwzBvn6vuesxSuso+W0MCvS0Q9+1QUlY4HZKAjuot/ley/wRbWrJ7zgnFYFxej3VY3RsC0Gbz7ddIBGJdfsf+tz1zZQzXewK9dbhLCIaxZiBN3D7cJFI76ELDikNSrpPpka8mOcHmo6zPxUAxXSRkSmb5x9rzImFHF3Nn6J8srJc0mghDHd558PK7OICviM5WrDxjpqrEQIGT9BKVFOSqJFBaPI8RrLdn4Js7rj/8qJYIir0Sk7DqPQC6DzatkJXEBGiLf8PkUUiVte8twwwwkIvyCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW+p8NKGCiwOFZOb7xERZK7JbWeLxtGJ/fWV75NyPUc=;
 b=nb3vTqNy2wILVAoPgCZvfspTw6kTVTe/PLSzegsMItlJOdTMFT9Zknth/hULmzhoJRFs/bKwlOPqbuW3PqUbmeDD5c/09luL0SxoC96gAW2GYMr0JkslY4EPWAVbXiKlEaLe/XPphYwuSiOzpHRluHY3wHuKXIzpiwOhGt4QVUA=
Received: from BN8PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:ac::18)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Mon, 27 Dec
 2021 18:25:19 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::b3) by BN8PR07CA0005.outlook.office365.com
 (2603:10b6:408:ac::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Mon, 27 Dec 2021 18:25:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Mon, 27 Dec 2021 18:25:19 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 27 Dec
 2021 12:25:18 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] fbdev: fbmem: add a helper to determine if an aperture is
 used by a fw fb
Date: Mon, 27 Dec 2021 13:25:05 -0500
Message-ID: <20211227182506.2110551-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0313c4d-2b6a-43db-3478-08d9c9663cc2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4372:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43725A0FE467B5509C02DB96F7429@DM6PR12MB4372.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OP/v+3LNxrS8dl2OWL1W1mY4igxh9Laza6AQM9Yg5L8rlh6LZg3ny9pFbPzDOHFCpejNCy4CSnJC2r5Ke7FothP6R2zbJVfljw6UqkNZwAbSedUeCds1Q70n3crqCgffW3F091uu8AweYQ2oxUQFjOf5qA3on+5c7XXkKYFs2JzVz71ck30AQKlPzm4iY8s9LSn+uGnHCSKIOUi1Gx4YZ/jzrEY0bP8uYmXdZ9qBoaBOaTN9W/JzUVHaBHL5D+9wyH8r1tM5k7qsCNdWEVWkycJnkg1t6YE/NS8LtbyANXNomCUiYIwQZScsSZfPwHszoszjD2bRY4nBFXWhu7IO22nGOQKvpixc4yDqBpZPay5N3RRrFYF2WM6mLoxxD9OEMoz6a4jZ4bLXXE0i0teqFzp3oSDhVxLtZlvN9QyFzO2by0rZNAHyXAD2H3ebxOSWy5jMiqB8cOQrGOQAhIL+p+zlu5pJfgPY+0cf7AfrS4vZNLpXqmDSk1mcPP8ycqAICZuw6j0S/DeguneApiaoIulKU1f8Y6yAC9r12dxIO35hFv4yfvsAfG3awWWRrKHURSCqLryC0wfyVmNEI+raZPCvzB272ZgkpddVBOSSTveuyIM+k4sQPSAcf2OuDj0h1+Rup7yTxGYzY5oTAO3qg5KX55chQJq9qmzFFdAxI4BoFfemlYTW4UUh56Q6LHsnjXIl9XB3ohnNbCcQcv9dANB1aEB87YT76S4Fp/QQlotMS8rJbGdKAyxPXW9sNia5+R6dMvvmZoBTtWXsGf3v87JP/hdzp8TixhLxuDdcmkmEh1lnwWhtokd5wWNmbK7djp5ox7dRBAjrIqcrMzfOUfoxv8CJzoyDdrrJ3ys6Xaak6jWIHjuthlvcmYINee+l
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(316002)(8936002)(110136005)(6666004)(81166007)(83380400001)(86362001)(2906002)(40460700001)(70206006)(70586007)(356005)(82310400004)(47076005)(336012)(186003)(36860700001)(450100002)(426003)(36756003)(7696005)(966005)(1076003)(26005)(8676002)(2616005)(16526019)(5660300002)(508600001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 18:25:19.2530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0313c4d-2b6a-43db-3478-08d9c9663cc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function for drivers to check if the a firmware initialized
fb is corresponds to their aperture.  This allows drivers to check if the
device corresponds to what the firmware set up as the display device.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=215203
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1840
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/video/fbdev/core/fbmem.c | 47 ++++++++++++++++++++++++++++++++
 include/linux/fb.h               |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 826175ad88a2..0fa7ede94fa6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1762,6 +1762,53 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
 
+/**
+ * is_firmware_framebuffer - detect if firmware-configured framebuffer matches
+ * @a: memory range, users of which are to be checked
+ *
+ * This function checks framebuffer devices (initialized by firmware/bootloader)
+ * which use memory range described by @a. If @a matchesm the function returns
+ * true, otherwise false.
+ */
+bool is_firmware_framebuffer(struct apertures_struct *a)
+{
+	bool do_free = false;
+	bool found = false;
+	int i;
+
+	if (!a) {
+		a = alloc_apertures(1);
+		if (!a)
+			return false;
+
+		a->ranges[0].base = 0;
+		a->ranges[0].size = ~0;
+		do_free = true;
+	}
+
+	mutex_lock(&registration_lock);
+	/* check all firmware fbs and kick off if the base addr overlaps */
+	for_each_registered_fb(i) {
+		struct apertures_struct *gen_aper;
+
+		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
+			continue;
+
+		gen_aper = registered_fb[i]->apertures;
+		if (fb_do_apertures_overlap(gen_aper, a)) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&registration_lock);
+
+	if (do_free)
+		kfree(a);
+
+	return found;
+}
+EXPORT_SYMBOL(is_firmware_framebuffer);
+
 /**
  * remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
  * @pdev: PCI device
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 6f3db99ab990..3da95842b207 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -610,6 +610,7 @@ extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
 					   const char *name, bool primary);
+extern bool is_firmware_framebuffer(struct apertures_struct *a);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
 extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
-- 
2.33.1

