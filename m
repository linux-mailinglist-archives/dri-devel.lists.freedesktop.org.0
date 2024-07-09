Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A310492C687
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 01:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649D810E327;
	Tue,  9 Jul 2024 23:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=pobox.com header.i=@pobox.com header.b="m337Rqwm";
	dkim=pass (1024-bit key; unprotected) header.d=xanderlent.com header.i=@xanderlent.com header.b="YghXHNlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2010E0BD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 11:55:23 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 3AD1B328E1;
 Tue,  9 Jul 2024 07:55:20 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:date
 :subject:mime-version:content-type:content-transfer-encoding
 :message-id:to:cc; s=sasl; bh=gddqCnx9SNES8455IEK6DYHaEE1wzJ8bS1
 6ePXesBxo=; b=m337Rqwmyk/oWWKDxTJZCQ1IxfVooi3611FNMRTXMAJrx2h9RD
 3xsHhsOnZRxFCr/DPdoDE2rdwLtHMKA75BGQW4kskQGENt6pxtAF6zSPZzJ5oLsD
 6G5qW2PZtQc0u/FSiiB6zYjET2Ad05Qpwm+3QZt531zoBHXpt+Yiz+R24=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 31D66328E0;
 Tue,  9 Jul 2024 07:55:20 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=xanderlent.com;
 h=from:date:subject:mime-version:content-type:content-transfer-encoding:message-id:to:cc;
 s=2021-09.pbsmtp; bh=gddqCnx9SNES8455IEK6DYHaEE1wzJ8bS16ePXesBxo=;
 b=YghXHNlUnioPbgapGFLjZgZUNlClRkGuUJRkiO4Zyy+Gfp421Z3LFndItt8ubNdWybjo2AFJkJdc4CzBRnoJec1LBxsTeviDkU13GVUYvrRY1udmT3xd8TeZx7t+A/Vd05eLuWxoeoHYvqGN3ekjGIWxPdWqJL9t1wu/SUyUHII=
Received: from ultralight.local (unknown [172.56.166.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id BB045328DF;
 Tue,  9 Jul 2024 07:55:18 -0400 (EDT)
 (envelope-from lx@xanderlent.com)
From: "Alexander F. Lent" <lx@xanderlent.com>
Date: Tue, 09 Jul 2024 07:54:14 -0400
Subject: [PATCH v3] accel/ivpu: Add missing MODULE_FIRMWARE metadata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-fix-ivpu-firmware-metadata-v3-1-55f70bba055b@xanderlent.com>
X-B4-Tracking: v=1; b=H4sIAOUkjWYC/33O0QrCIBiG4VsJjzOcbtN11H1EBzr/mtDcULPF2
 L2ngyCIduYH/g/vjDw4Ax4ddzNyEI03g02D7Xeo7aS9ATY6bUQJLQknJb6aCZs4PtLD9U/pAPc
 QpJZBYqYJVbomvBYaJWB0kH6v+PmStpIesHLStl0m/0v5uDM+DO61hsUiE5+GaqshFrjAqVNxJ
 iqqG3qapNXg7mDDoR16lEMi/fbEpkezJ1RTsYKng/rHW5blDeMRWH5GAQAA
To: "Alexander F. Lent" <lx@xanderlent.com>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720526118; l=1929;
 i=lx@xanderlent.com; s=20240705; h=from:subject:message-id;
 bh=gddqCnx9SNES8455IEK6DYHaEE1wzJ8bS16ePXesBxo=;
 b=X1dbuarre7MVqlySIV9Dfl+4D9ojeKDqNmzZbaf7B2ikyO/hvj2j210u8YObmFp6Xck3eHrfS
 09l2j24SW0JA4BRMs3oLGgGiBn7cMu5bqZxNCsYyTz8dX+0xmfu83RO
X-Developer-Key: i=lx@xanderlent.com; a=ed25519;
 pk=T7WKAI9F1J7lcthsLG4aBF+wzehTsa3GPyzJkh5is3k=
X-Pobox-Relay-ID: 1D3FA9D6-3DEA-11EF-9712-5B6DE52EC81B-45904678!pb-smtp1.pobox.com
X-Mailman-Approved-At: Tue, 09 Jul 2024 23:20:10 +0000
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

The accel/ivpu driver loads firmware but lacks this metadata,
preventing dracut from correctly locating firmware files. Fix it.

Fixes: 9ab43e95f922 ("accel/ivpu: Switch to generation based FW names")
Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
---
Hi Jacek,

Thanks for catching the error, and for the more succinct comment.
Please find v3 attached.
---
Changes in v3:
- Simplify comment, per review.
- Fix typo in 40xx firmware path, per review.
- Link to v2: https://lore.kernel.org/r/20240708-fix-ivpu-firmware-metadata-v2-1-78b953172026@xanderlent.com

Changes in v2:
- Only annotate the module with the production firmware paths, per review.
- Drop macros for de-duping firmware fileames, just use string literals, per review.
- Link to v1: https://lore.kernel.org/r/20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com
---
 drivers/accel/ivpu/ivpu_fw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 1457300828bf..ef717802a3c8 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -58,6 +58,10 @@ static struct {
 	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
 };
 
+/* Production fw_names from the table above */
+MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
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

