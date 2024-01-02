Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4401821E4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6610E1D1;
	Tue,  2 Jan 2024 15:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D93510E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:07:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 458AACE0FF7;
 Tue,  2 Jan 2024 15:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C610BC433CB;
 Tue,  2 Jan 2024 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704208023;
 bh=QDhoQSaSpo9hrMc6cyInKkOcqMGrIdfUTWR31DFTkoo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gaBJwM7FcrWhNZXpLFWahC00ere2bPHL3R4R5XVWiT4oK40lXtL9slx0hKJ2P5vtq
 m2R3MAdyLtWj8kxYhgeR/qdw51jsC8p50dfyeNECB5arRU7YEib+RTDhUjBHa368+x
 YAMRNt7vpo/RMxY1+USfx4I/C1CnH1GN9lfIkwWV79YSURb/j3Aq5UeDVD6gf0JB6L
 RB5tQ3+IdCFpc1vZzHs1WZxNdFxrgNG0oLS03CNeEUttpeSbWQGyJx12yCJNMbhRxF
 7UHEFp8xewAUOYN16ZIqUejqXDVALsBaxv9G5YXwqKfNa0dTYWnSV1JCei1lWaWqcP
 NBB3kVk66nicg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] accel/habanalabs: increase HL_MAX_STR to 64 bytes to
 avoid warnings
Date: Tue,  2 Jan 2024 17:06:51 +0200
Message-Id: <20240102150654.522555-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102150654.522555-1-ogabbay@kernel.org>
References: <20240102150654.522555-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Fix a warning of a buffer overflow:
‘snprintf’ output between 38 and 47 bytes into a destination of size 32

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index b1a7b229e161..253873315888 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2547,7 +2547,7 @@ struct hl_state_dump_specs {
  * DEVICES
  */
 
-#define HL_STR_MAX	32
+#define HL_STR_MAX	64
 
 #define HL_DEV_STS_MAX (HL_DEVICE_STATUS_LAST + 1)
 
-- 
2.34.1

