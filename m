Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175D7A4B11
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B73F10E1A4;
	Mon, 18 Sep 2023 14:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789B10E190
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8D7B61140;
 Mon, 18 Sep 2023 14:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395EDC32789;
 Mon, 18 Sep 2023 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047535;
 bh=sq1acTii1lIjGqy8tMjofVj9BdiUZdcszq3xd7MNZRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MO1bz00QYbdgOgflrqOnQuIe2kburzb/X2OhV76Cp4uIL1A6kz/j5rjliYQBmCKuP
 U8xApsMIrdz8GtQI5eGmMn+SqVxDw/ScbRp5aqxzSEH5tvtg7cMvfgKPvxPJjTe/2X
 G3Bn+kPCL+uu5L1HSCfg31NivZNobO4wIycHtYH+oqslkilMgZu5D737v6BFWRb9dA
 ntPuVTJ3i8LkTLPb8YDDN3sDzxYh96NAKHuzSrn0awzQIdaBigIqZGB5PvEHaqbNrH
 MdSIDAWu2bzymxBQV7XMYxxkLyHP0aBdQCPSAGUIsxDWKRmIfylnMP6XkLnIQ3yu1q
 AOaGRqlc0Py1A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] accel/habanalabs: add fw status SHUTDOWN_PREP
Date: Mon, 18 Sep 2023 17:31:56 +0300
Message-Id: <20230918143158.903207-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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

update hl_boot_if.h from specs to include
CPU_BOOT_STATUS_FW_SHUTDOWN_PREP

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/linux/habanalabs/hl_boot_if.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/habanalabs/hl_boot_if.h b/include/linux/habanalabs/hl_boot_if.h
index 7de8a5786a36..93366d5621fd 100644
--- a/include/linux/habanalabs/hl_boot_if.h
+++ b/include/linux/habanalabs/hl_boot_if.h
@@ -394,6 +394,8 @@ enum cpu_boot_status {
 	CPU_BOOT_STATUS_WAITING_FOR_BOOT_FIT = 16,
 	/* Internal Security has been initialized, device can be accessed */
 	CPU_BOOT_STATUS_SECURITY_READY = 17,
+	/* FW component is preparing to shutdown and communication with host is not available */
+	CPU_BOOT_STATUS_FW_SHUTDOWN_PREP = 18,
 };
 
 enum kmd_msg {
-- 
2.34.1

