Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59E6BCE66
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0610ECB1;
	Thu, 16 Mar 2023 11:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4C510ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05236B8210D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D50C4339C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966613;
 bh=2hHVaV7ZugDJdJqgB3IINpgpQYOcZYyHRjE813vgofI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cP3ViW/GanR2oqC4nExnjvik+J7XvCHY84+teVDCraelAWuzTxJN7X/3HR926pG3y
 inFWaEVFIwbMoC8zSe3YGK056lS/go9oxexKoLQGcljppoM511iE8s5r2KwMPjVLyj
 H7VI10TapE/LLq7tVmx0mwXdUn982X/buyE5mHNB+YgJKIQdkB/3L6lTwIzvo/m2Qb
 hVsI1InvTxFe73XspkCz9iTrPriZF/ihMrDYlRlo6AV8xh+b0JkmQ5/6VFAMvwQF7t
 B9wmHYp9mI/gmlg0QZxxusbUKz7dR/goNjfudFpbYatzuoRVfYroZbsxT8cq2D5zxp
 Huy+qYMqXnkIg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] accel/habanalabs: fix field names in hl_info_hw_ip_info
Date: Thu, 16 Mar 2023 13:36:37 +0200
Message-Id: <20230316113640.499267-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't use padX for actual reservedX fields.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/uapi/drm/habanalabs_accel.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 7ca0ef802fd1..7d457eb4da74 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -915,17 +915,18 @@ struct hl_info_hw_ip_info {
 	__u64 dram_page_size;
 	__u32 edma_enabled_mask;
 	__u16 number_of_user_interrupts;
-	__u16 pad2;
-	__u64 reserved4;
+	__u8 reserved1;
+	__u8 reserved2;
+	__u64 reserved3;
 	__u64 device_mem_alloc_default_page_size;
+	__u64 reserved4;
 	__u64 reserved5;
-	__u64 reserved6;
-	__u32 reserved7;
-	__u8 reserved8;
+	__u32 reserved6;
+	__u8 reserved7;
 	__u8 revision_id;
 	__u16 tpc_interrupt_id;
+	__u32 reserved8;
 	__u32 reserved9;
-	__u8 pad3[4];
 	__u64 engine_core_interrupt_reg_addr;
 };
 
-- 
2.40.0

