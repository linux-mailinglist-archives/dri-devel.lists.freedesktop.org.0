Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46389198B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75B71126C9;
	Fri, 29 Mar 2024 12:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1V0rISx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3204E1126D8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:41:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 13815CE2F91;
 Fri, 29 Mar 2024 12:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2F3C43399;
 Fri, 29 Mar 2024 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716109;
 bh=V4bDS2RxaQJRAuNI95FSliMiLBgmhfekXfxx+cqz+VI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c1V0rISxirWDhfcAd6BCOML27N9PbSTKvXNP9i4lNMWLr9PhHakRl3gE/p49VupTx
 mxD8oW2ANTPGKzbuQJ7nCR1ZpXSXUZ7vPCJqekNY/KsdFtcxpNCGtuIcZwqMSFxdl9
 IbqktdD2smFPdho070btiE7VJSp83wLVOaGQ8fj9a+EAGcj2Y/2h5TRcAeAa5s3J9g
 mnY35eK/pqN8Jf8iIQxPJjqZ6LFM3/dLpr3wcaxkpjP9Rfb83tTf2pt7nmUluKWK35
 Fruk6DRH90u+e3gLifL+io5+GS1+l6A7GjhOvQarwstv0UdKcXx2JXfpSm5X9GbZmZ
 CDKQhzA1tE3fg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Koby Elbaz <kelbaz@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
 Sasha Levin <sashal@kernel.org>, ttayar@habana.ai, obitton@habana.ai,
 fkassabri@habana.ai, dhirschfeld@habana.ai, osharabi@habana.ai,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 59/98] accel/habanalabs: increase HL_MAX_STR to 64
 bytes to avoid warnings
Date: Fri, 29 Mar 2024 08:37:30 -0400
Message-ID: <20240329123919.3087149-59-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
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

From: Koby Elbaz <kelbaz@habana.ai>

[ Upstream commit 8c075401f2dbda43600c61f780a165abde77877a ]

Fix a warning of a buffer overflow:
‘snprintf’ output between 38 and 47 bytes into a destination of size 32

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 2a900c9941fee..41c7aac2ffcf9 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2547,7 +2547,7 @@ struct hl_state_dump_specs {
  * DEVICES
  */
 
-#define HL_STR_MAX	32
+#define HL_STR_MAX	64
 
 #define HL_DEV_STS_MAX (HL_DEVICE_STATUS_LAST + 1)
 
-- 
2.43.0

