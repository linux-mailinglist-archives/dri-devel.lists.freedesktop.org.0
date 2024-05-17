Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25C8C8294
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 10:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAA310E080;
	Fri, 17 May 2024 08:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KEJGezyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 17 May 2024 08:31:45 UTC
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C2810E080;
 Fri, 17 May 2024 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1715934703; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Ok07d1vK/JMG0IYRwczMvV9yC90WTaW4HZWyrpjc2fM=;
 b=KEJGezyB0KSlVpTghzfA/3gebAXXB/J+xLGayXvwVBW6UcKCLAeidjjU2nlLtFVg8kG8YZr6Z881T2fGI5uq1EkyFRVf4NhxMHZiU/VzNVKvXX1Fj27mNsrvPYourNAoFeCQlQKWyTarFwkxq99NtdH/cQDoGuDetSfXrHKEF80=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067113;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0W6e1kO8_1715934397; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0W6e1kO8_1715934397) by smtp.aliyun-inc.com;
 Fri, 17 May 2024 16:26:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: Update optc35_set_odm_combine doc to
 match kernel-doc spec
Date: Fri, 17 May 2024 16:26:37 +0800
Message-Id: <20240517082637.69928-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

This patch updates the function documentation comment for
optc35_set_odm_combine to conform to the kernel-doc specification.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
index 7c9faa507ec2..1f8516e5ce68 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
@@ -50,7 +50,9 @@
  * @optc: Output Pipe Timing Combine instance reference.
  * @opp_id: Output Plane Processor instance ID.
  * @opp_cnt: Output Plane Processor count.
- * @timing: Timing parameters used to configure DCN blocks.
+ * @segment_width: Width in pixels of each segment in a horizontal direction.
+ * @last_segment_width: Width in pixels of the last segment if it differs from
+ *			other segments.
  *
  * Return: void.
  */
-- 
2.20.1.7.g153144c

