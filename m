Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCE82A97D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994FB10E82B;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jan 2024 02:01:37 UTC
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id C533910E036;
 Thu, 11 Jan 2024 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=0kRJudjq7tmrhqObxO
 TG1bQVC/NBVuREr9lAMxPysTI=; b=T2+Ok+A4pZh7m5XiIs+3TcxbHFvTibwtKn
 P8haxL3rLaiHemOBosjbw6blR23uSuPpW1tOu7vmbNpZWzS0xCkEtsp4zuzghHvH
 1k5fRgtqR9cANB4ZyrTlX9lVGxB1NjYmBjGk82tWOBkvuM85Gd2S9FCznmiAKvip
 Jnlsqm8RU=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD334L0S59lWQGcAA--.53623S2;
 Thu, 11 Jan 2024 10:01:25 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, daniel@ffwll.ch, Xinhui.Pan@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_atomfirmware.h
Date: Thu, 11 Jan 2024 02:01:23 +0000
Message-Id: <20240111020123.5523-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD334L0S59lWQGcAA--.53623S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xWrW3Zw17ArWfAFWxtFb_yoW8GF13pF
 4rJF1UJrZ8u3WrZryUXFWkua4Dt3W0qa48KrW8ZFyYg34qvF95JFyrtF4UAr9xArW8Cw43
 JFZrA3y8Za4qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbF4iUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWRhixWVLYT17lQAAs6
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:43 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
index c7eb2caec65a..649b5530d8ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
@@ -36,7 +36,7 @@ int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_sram_ecc_supported(struct amdgpu_device *adev);
-bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev, uint8_t* i2c_address);
+bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev, uint8_t *i2c_address);
 bool amdgpu_atomfirmware_mem_training_supported(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_dynamic_boot_config_supported(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_fw_reserved_fb_size(struct amdgpu_device *adev);
-- 
2.17.1

