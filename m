Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA382A9A7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3513D10E810;
	Thu, 11 Jan 2024 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 044F810E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=YOW7VfZ9Nj3SNmJj7c
 IFF6NAqYW/zZRZtVM5J4qW1mA=; b=TCaighes8OnfSSaxNZLFTm7mESAvL/nbeK
 uB3Lvoo14zHDdHXlYJZMOd9crUnQXuc5zBR/QVItMk73OTqtKKYrmCa9FIkp555L
 ks+f2X9NAhrtWlBccR7MvPwnLdD8jOSgZf3besZH39+sk1R9RsUiSacnPKMfuPCS
 FHhP1XP1c=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3vwEZkp9lweQMAA--.3094S2; 
 Thu, 11 Jan 2024 15:00:42 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: Clean up errors in psb_intel_sdvo.h
Date: Thu, 11 Jan 2024 07:00:41 +0000
Message-Id: <20240111070041.9258-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3vwEZkp9lweQMAA--.3094S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWkKF1xKr15XF1xtF4fXwb_yoW8ZF1fpa
 y3Xw45WF4fJrZFgF4rCF1UJFW5G39rG34agFW7Ww1SqFn7CrW8ZFZYga47Ar98WryrCr1S
 qF1kt3sxuF18XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7KsnUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEB5i1mVOBk2o0gAAsg
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: "foo * bar" should be "foo *bar"
ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index e4f914deceba..86802c274e5b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -451,7 +451,7 @@ static const char *cmd_status_names[] = {
 static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 cmd,
 				 const void *args, int args_len)
 {
-	u8 buf[MAX_ARG_LEN*2 + 2], status;
+	u8 buf[MAX_ARG_LEN * 2 + 2], status;
 	struct i2c_msg msgs[MAX_ARG_LEN + 3];
 	int i, ret;
 
@@ -466,16 +466,16 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 		msgs[i].addr = psb_intel_sdvo->slave_addr;
 		msgs[i].flags = 0;
 		msgs[i].len = 2;
-		msgs[i].buf = buf + 2 *i;
-		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
-		buf[2*i + 1] = ((u8*)args)[i];
+		msgs[i].buf = buf + 2 * i;
+		buf[2 * i + 0] = SDVO_I2C_ARG_0 - i;
+		buf[2 * i + 1] = ((u8 *)args)[i];
 	}
 	msgs[i].addr = psb_intel_sdvo->slave_addr;
 	msgs[i].flags = 0;
 	msgs[i].len = 2;
-	msgs[i].buf = buf + 2*i;
-	buf[2*i + 0] = SDVO_I2C_OPCODE;
-	buf[2*i + 1] = cmd;
+	msgs[i].buf = buf + 2 * i;
+	buf[2 * i + 0] = SDVO_I2C_OPCODE;
+	buf[2 * i + 1] = cmd;
 
 	/* the following two are to read the response */
 	status = SDVO_I2C_CMD_STATUS;
@@ -798,7 +798,7 @@ static void psb_intel_sdvo_get_dtd_from_mode(struct psb_intel_sdvo_dtd *dtd,
 	dtd->part2.reserved = 0;
 }
 
-static void psb_intel_sdvo_get_mode_from_dtd(struct drm_display_mode * mode,
+static void psb_intel_sdvo_get_mode_from_dtd(struct drm_display_mode *mode,
 					 const struct psb_intel_sdvo_dtd *dtd)
 {
 	mode->hdisplay = dtd->part1.h_active;
-- 
2.17.1

