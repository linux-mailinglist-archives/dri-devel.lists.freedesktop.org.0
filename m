Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68357929827
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 15:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5841910E05F;
	Sun,  7 Jul 2024 13:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=pobox.com header.i=@pobox.com header.b="OaLZGqp6";
	dkim=pass (1024-bit key; unprotected) header.d=xanderlent.com header.i=@xanderlent.com header.b="U+wAFR2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2024 11:23:11 UTC
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9737F10EAF0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:23:11 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id DAA3E288DB;
 Fri,  5 Jul 2024 07:14:44 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:date
 :subject:mime-version:content-type:content-transfer-encoding
 :message-id:to:cc; s=sasl; bh=vqmCrZQzc6VxA7DOYVHFH11+oLx5Qm2ZRQ
 liQz36DNo=; b=OaLZGqp6+BQ94x2hpIg3YHLW5oqj7tUoYxuAIe+vIzO5RjqXMX
 Z6WKQozfy6ut05OXXmWbP8EMhhNkCe66CQkDKTYfQ0L1XK06uG7dY64ha1ageztO
 vYPJV6yyYDhVUpdASiP/kaMsAtgeZcayrc+jVyRrjCeLkG1Hw+Y1bDvgw=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id D23B9288DA;
 Fri,  5 Jul 2024 07:14:44 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=xanderlent.com;
 h=from:date:subject:mime-version:content-type:content-transfer-encoding:message-id:to:cc;
 s=2021-09.pbsmtp; bh=vqmCrZQzc6VxA7DOYVHFH11+oLx5Qm2ZRQliQz36DNo=;
 b=U+wAFR2IFIEJEoc7kYJNMj9VSnr4+7zD2D5OfX6nfqmY0iOULx62YgnbIqXiwazkTfgrem5eGTS+gfdM9eNo7KbEB+xQDs8rXjGXDNfx9D1wsS1J6q9W4FQN7Ib7WPhGgLXXMXg5XAi0igvuAi0cKyq8nSSdiYi2MPFiRjWGYwk=
Received: from ultralight.local (unknown [172.58.228.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9C756288D9;
 Fri,  5 Jul 2024 07:14:43 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
From: "Alexander F. Lent" <lx@xanderlent.com>
Date: Fri, 05 Jul 2024 07:14:22 -0400
Subject: [PATCH] accel/ivpu: Add missing MODULE_FIRMWARE metadata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com>
X-B4-Tracking: v=1; b=H4sIAI3Vh2YC/3XMQQ6CQAyF4auQrm0yDgSMVzEuOrRKF4ykA2hCu
 DvVvbv3Jy/fBkVMpcC12sBk1aKv7HE+VdAPlJ+Cyt4QQ2xCFxp86Ad1nRYfNr7JBEeZiWkmrDn
 ExG3o2guDA5OJv3/47e6dqAgmo9wPX/K/BPt+AEgE7j+ZAAAA
To: "Alexander F. Lent" <lx@xanderlent.com>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720178083; l=2131;
 i=lx@xanderlent.com; s=20240705; h=from:subject:message-id;
 bh=vqmCrZQzc6VxA7DOYVHFH11+oLx5Qm2ZRQliQz36DNo=;
 b=ul5+mUGLzximeBukKpfIKpzmVK7XfVt6U6onPbARLu17HW0SOtnn/lpd3am72T7GBgh5wItNl
 J7wnYPEj+ohAUgcESw6lLLiDx26C0Y89JVVg7YT2dkgOoNsAtis8Fpw
X-Developer-Key: i=lx@xanderlent.com; a=ed25519;
 pk=T7WKAI9F1J7lcthsLG4aBF+wzehTsa3GPyzJkh5is3k=
X-Pobox-Relay-ID: C82E6A86-3ABF-11EF-BD6B-965B910A682E-45904678!pb-smtp2.pobox.com
X-Mailman-Approved-At: Sun, 07 Jul 2024 13:45:08 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modules that load firmware from various paths at runtime must declare
those paths at compile time, via the MODULE_FIRMWARE macro, so that the
firmware paths are included in the module's metadata.

The accel/ivpu driver loaded firmware but lacked this metadata,
preventing dracut from correctly locating firmware files.

Fixes: 9ab43e95f922 ("accel/ivpu: Switch to generation based FW names")
Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 1457300828bf..51792a00b7e3 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -48,16 +48,26 @@ static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
 MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
 
+#define IVPU_FW_PATH_37XX_BIN		"vpu_37xx.bin"
+#define IVPU_FW_PATH_37XX_V0_BIN	"intel/vpu/vpu_37xx_v0.0.bin"
+#define IVPU_FW_PATH_40XX_BIN		"vpu_40xx.bin"
+#define IVPU_FW_PATH_40XX_V0_BIN	"intel/vpu/vpu_40xx_v0.0.bin"
+
 static struct {
 	int gen;
 	const char *name;
 } fw_names[] = {
-	{ IVPU_HW_37XX, "vpu_37xx.bin" },
-	{ IVPU_HW_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
-	{ IVPU_HW_40XX, "vpu_40xx.bin" },
-	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
+	{ IVPU_HW_37XX, IVPU_FW_PATH_37XX_BIN },
+	{ IVPU_HW_37XX, IVPU_FW_PATH_37XX_V0_BIN },
+	{ IVPU_HW_40XX, IVPU_FW_PATH_40XX_BIN },
+	{ IVPU_HW_40XX, IVPU_FW_PATH_40XX_V0_BIN },
 };
 
+MODULE_FIRMWARE(IVPU_FW_PATH_37XX_BIN);
+MODULE_FIRMWARE(IVPU_FW_PATH_37XX_V0_BIN);
+MODULE_FIRMWARE(IVPU_FW_PATH_40XX_BIN);
+MODULE_FIRMWARE(IVPU_FW_PATH_40XX_V0_BIN);
+
 static int ivpu_fw_request(struct ivpu_device *vdev)
 {
 	int ret = -ENOENT;

---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240704-fix-ivpu-firmware-metadata-3d02bd60768d

Best regards,
-- 
Alexander F. Lent <lx@xanderlent.com>

