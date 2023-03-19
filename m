Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418C6C0077
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42810E507;
	Sun, 19 Mar 2023 09:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0510E16B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:59:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B982ECE0CE3;
 Sun, 19 Mar 2023 09:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3422C433D2;
 Sun, 19 Mar 2023 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679219935;
 bh=sMR2f/XuXMchn4MVpQjksF95gNnLdoYwmDgbXeoex9s=;
 h=From:To:Cc:Subject:Date:From;
 b=Pa6+R79FrYnWLN1S2Y9spt0DLkLyCOvaqbBTUuCwmFshVAiJrgrrYl6teu959jX3/
 elJydcW1RgeET6tRWlu6MYg02tGHvod7kMgvL1qQJSzQ+8dJPyLZjD9qoV5i/aWBcz
 kYOOjsp1Tio1uTQ+QeQFdfuuvZ9v8xxHZoxWFzcjsw3pCZvzpJCtNGn2r13gRL9nuJ
 Wv9wIKapBb+xlXbJo8JPplT/CL8PI/pJU0/oPmDKzSo1f5hp8I8M7Q7sh9T9c7CZHN
 hHLl5EpoFba56uc6L+jFOUbb11xY9rbNChStgrO5A4jrlxQ7SSWyiZva/M49N5B7it
 7DM7t5ksRwSwA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/habanalabs: fix a missing-braces compilation warning
Date: Sun, 19 Mar 2023 11:58:47 +0200
Message-Id: <20230319095850.692040-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Replace initialization of "struct cpucp_packet" from "{0} to "{}" to
avoid a "missing braces around initializer" compilation warning.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index da892d8fb3d6..7ea611392f8c 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -3152,7 +3152,7 @@ int hl_fw_get_sec_attest_info(struct hl_device *hdev, struct cpucp_sec_attest_in
 int hl_fw_send_generic_request(struct hl_device *hdev, enum hl_passthrough_type sub_opcode,
 						dma_addr_t buff, u32 *size)
 {
-	struct cpucp_packet pkt = {0};
+	struct cpucp_packet pkt = {};
 	u64 result;
 	int rc = 0;
 
-- 
2.40.0

