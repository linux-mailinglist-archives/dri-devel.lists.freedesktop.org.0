Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B32C1E15E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E51110E22B;
	Thu, 30 Oct 2025 02:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e3toTrux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE410E22B;
 Thu, 30 Oct 2025 02:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1761789706; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=CTkSbhbsTSP6Nc12cy82Rk/0qORhZ5wAeJo00QNbzbg=;
 b=e3toTruxS+dkRQyIK/rtpiunK1JDNdsUtSURAUrFchLMlScWKtB0H/rueGIUn9e5w98KxLw6yOVlhftj/hGpiqmw+WiVsJKNi+DlPmlSSoXk5aFAXimclYQ1Li20d7gV5e/Bwsyo1cUiLJq6CQ6geFJUk3RUZIqCksAYrsx8y4k=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WrI6Z-._1761789399 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 30 Oct 2025 09:56:42 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 2/3] drm/amd/display: remove unneeded semicolon
Date: Thu, 30 Oct 2025 09:56:30 +0800
Message-ID: <20251030015631.3106732-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251030015631.3106732-1-jiapeng.chong@linux.alibaba.com>
References: <20251030015631.3106732-1-jiapeng.chong@linux.alibaba.com>
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

No functional modification involved.

./drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c:1850:3-4: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=26821
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 81e64e17d0cb..df0b664c0cd2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1847,7 +1847,7 @@ enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 				dc_state_set_stream_cursor_subvp_limit(stream, context, true);
 				status = DC_FAIL_HW_CURSOR_SUPPORT;
 			}
-		};
+		}
 	}
 
 	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_FAIL_HW_CURSOR_SUPPORT) {
-- 
2.43.5

