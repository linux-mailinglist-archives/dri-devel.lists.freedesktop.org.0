Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE6C1E161
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC9A10E22D;
	Thu, 30 Oct 2025 02:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vhbEzorB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C5210E22B;
 Thu, 30 Oct 2025 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1761789708; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=1y/8gMi7tm6PsOc59fPI8ACo1arCYOtEuKQye8c5Ehg=;
 b=vhbEzorB1jRRtdwJd/WkjTwyA0saNGKuzAwvmDNtNZpJpwt3YwxBB2A8o7ZVCSxO+Xl0mBF8tOe+r68UoYwINcne3bXk+QpRTmmW971jblxT3wQUHmydgsJSM6KbexBIMBV0Arqz/bH8l4KZtNdZ4oQ82Ot+6pYOX4Hblz6mF5o=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WrI6Z-z_1761789403 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 30 Oct 2025 09:56:45 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 1/3] drm/amd/display: remove unneeded semicolon
Date: Thu, 30 Oct 2025 09:56:31 +0800
Message-ID: <20251030015631.3106732-3-jiapeng.chong@linux.alibaba.com>
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

./drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c:1674:3-4: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=26821
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 130058d7a70c..875ae97489d3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1671,7 +1671,7 @@ enum dc_status dcn401_validate_bandwidth(struct dc *dc,
 				dc_state_set_stream_cursor_subvp_limit(stream, context, true);
 				status = DC_FAIL_HW_CURSOR_SUPPORT;
 			}
-		};
+		}
 	}
 
 	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_FAIL_HW_CURSOR_SUPPORT) {
-- 
2.43.5

