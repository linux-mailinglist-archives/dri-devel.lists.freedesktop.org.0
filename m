Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE366E578
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285D410E300;
	Tue, 17 Jan 2023 17:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE8410E300;
 Tue, 17 Jan 2023 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wulx1i+YnfVXqlJt+RBnpDlK1qUt7qPJU6WMVdTl8ho=; b=PGNVzOhdtwDWb90uFVv8szwoXI
 FxHpDmO31xSONhzguIUMY7ACCjOtoqE/DkHs1caYYCaM0vuPf0f2OSog6FeNRo3diA0hMAyYbGSXx
 ChNBhbjkeBZ+F/6zDytGIwn7wpsheXG0p0lrB4Db5d7BW7xg/wQsGhVyIeHpP5hmWugDCTQJTKz1M
 SUMWJ02QqiXQYoozO+H+l9c0jumT6OzeybTgVts76s7lczQm77g+4wBroa2rmcJXQn619Qd6TZck8
 Y0Dmzs5C3z+4GhwoRMUovIxWMoN2T1NTXg9jhuHnFjcjcAr4e3kVqayl9ITwsx/Co3f0HlnpJ3heO
 PDtl6fNQ==;
Received: from [187.56.70.205] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHqEb-00Aprf-Ft; Tue, 17 Jan 2023 18:58:58 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/amdgpu/vcn: Adjust firmware names indentation
Date: Tue, 17 Jan 2023 14:58:35 -0300
Message-Id: <20230117175836.914304-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Lazar Lijo <Lijo.Lazar@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an incredibly trivial fix, just for the sake of
"aesthetical" organization of the defines. Some were space based,
most were tab based and there was a lack of "alignment", now it's
all the same and aligned.

Cc: James Zhu <James.Zhu@amd.com>
Cc: Lazar Lijo <Lijo.Lazar@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Sonny Jiang <sonny.jiang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


V2:
* Added Alex's review tag - thanks!


 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index f8397d993f23..1b1a3c9e1863 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -36,26 +36,26 @@
 #include "soc15d.h"
 
 /* Firmware Names */
-#define FIRMWARE_RAVEN		"amdgpu/raven_vcn.bin"
-#define FIRMWARE_PICASSO	"amdgpu/picasso_vcn.bin"
-#define FIRMWARE_RAVEN2		"amdgpu/raven2_vcn.bin"
-#define FIRMWARE_ARCTURUS	"amdgpu/arcturus_vcn.bin"
-#define FIRMWARE_RENOIR		"amdgpu/renoir_vcn.bin"
-#define FIRMWARE_GREEN_SARDINE	"amdgpu/green_sardine_vcn.bin"
-#define FIRMWARE_NAVI10		"amdgpu/navi10_vcn.bin"
-#define FIRMWARE_NAVI14		"amdgpu/navi14_vcn.bin"
-#define FIRMWARE_NAVI12		"amdgpu/navi12_vcn.bin"
-#define FIRMWARE_SIENNA_CICHLID	"amdgpu/sienna_cichlid_vcn.bin"
-#define FIRMWARE_NAVY_FLOUNDER	"amdgpu/navy_flounder_vcn.bin"
-#define FIRMWARE_VANGOGH	"amdgpu/vangogh_vcn.bin"
+#define FIRMWARE_RAVEN			"amdgpu/raven_vcn.bin"
+#define FIRMWARE_PICASSO		"amdgpu/picasso_vcn.bin"
+#define FIRMWARE_RAVEN2			"amdgpu/raven2_vcn.bin"
+#define FIRMWARE_ARCTURUS		"amdgpu/arcturus_vcn.bin"
+#define FIRMWARE_RENOIR			"amdgpu/renoir_vcn.bin"
+#define FIRMWARE_GREEN_SARDINE		"amdgpu/green_sardine_vcn.bin"
+#define FIRMWARE_NAVI10			"amdgpu/navi10_vcn.bin"
+#define FIRMWARE_NAVI14			"amdgpu/navi14_vcn.bin"
+#define FIRMWARE_NAVI12			"amdgpu/navi12_vcn.bin"
+#define FIRMWARE_SIENNA_CICHLID		"amdgpu/sienna_cichlid_vcn.bin"
+#define FIRMWARE_NAVY_FLOUNDER		"amdgpu/navy_flounder_vcn.bin"
+#define FIRMWARE_VANGOGH		"amdgpu/vangogh_vcn.bin"
 #define FIRMWARE_DIMGREY_CAVEFISH	"amdgpu/dimgrey_cavefish_vcn.bin"
-#define FIRMWARE_ALDEBARAN	"amdgpu/aldebaran_vcn.bin"
-#define FIRMWARE_BEIGE_GOBY	"amdgpu/beige_goby_vcn.bin"
-#define FIRMWARE_YELLOW_CARP	"amdgpu/yellow_carp_vcn.bin"
-#define FIRMWARE_VCN_3_1_2	"amdgpu/vcn_3_1_2.bin"
-#define FIRMWARE_VCN4_0_0	"amdgpu/vcn_4_0_0.bin"
-#define FIRMWARE_VCN4_0_2	"amdgpu/vcn_4_0_2.bin"
-#define FIRMWARE_VCN4_0_4      "amdgpu/vcn_4_0_4.bin"
+#define FIRMWARE_ALDEBARAN		"amdgpu/aldebaran_vcn.bin"
+#define FIRMWARE_BEIGE_GOBY		"amdgpu/beige_goby_vcn.bin"
+#define FIRMWARE_YELLOW_CARP		"amdgpu/yellow_carp_vcn.bin"
+#define FIRMWARE_VCN_3_1_2		"amdgpu/vcn_3_1_2.bin"
+#define FIRMWARE_VCN4_0_0		"amdgpu/vcn_4_0_0.bin"
+#define FIRMWARE_VCN4_0_2		"amdgpu/vcn_4_0_2.bin"
+#define FIRMWARE_VCN4_0_4		"amdgpu/vcn_4_0_4.bin"
 
 MODULE_FIRMWARE(FIRMWARE_RAVEN);
 MODULE_FIRMWARE(FIRMWARE_PICASSO);
-- 
2.39.0

