Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DDE7B170F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61A310E095;
	Thu, 28 Sep 2023 09:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51110E095
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93166CE1C66;
 Thu, 28 Sep 2023 09:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DB0C433C8;
 Thu, 28 Sep 2023 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695892801;
 bh=9e29ZnhPKlU/RRKb54lBCqFLUcPtDveR1H2fkbEg0Mw=;
 h=From:To:Cc:Subject:Date:From;
 b=sxZosAONQP0lCPkBzlF1Si/T9gAVuSwvT2UYa38Fr4lHYbVjJMOBuN42Xnqcb2Zid
 23LGgKhjtUoqQR/9vWtPpCdnOicoNQSC/VfEe9s4BLtow8WcrPtbOD129Y1xgENvuw
 WNpdabr3e1tz5Xxb1j4m9Fwyx1wRr81EOBQpmyasDe4m8LBov2r19m1lZWInqqRSw+
 PKtq7XBjf0i3syZQ9PysfLeFP+QArk+Trdgg02++goSRXbKSXWSDMq8JeaAUM3juWD
 p9LxjVJzxMPNyvj2Nww2lkeYMd0j7N1hfKkH2WPcGzLfB+RvR7ODzjCGRWVIf75Z0h
 YDSWEE6sXZKOQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] accel/habanalabs: remove wrong doc for
 init_phys_pg_pack_from_userptr
Date: Thu, 28 Sep 2023 12:19:54 +0300
Message-Id: <20230928091956.47762-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

The function does not pin the pages so remove that from the inline doc.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index ba59e921236e..0b8689fe0b64 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -832,7 +832,6 @@ int hl_unreserve_va_block(struct hl_device *hdev, struct hl_ctx *ctx,
  *                      physical pages
  *
  * This function does the following:
- * - Pin the physical pages related to the given virtual block.
  * - Create a physical page pack from the physical pages related to the given
  *   virtual block.
  */
-- 
2.34.1

