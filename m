Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01882A97F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566610E841;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B62E10E7D7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=LCeISwIEG753tX5jE6
 W81OvFm1nAeAymtGdm0SR2J6c=; b=SA1BAQZ7Cyp3gsBT+t4OTxbFHtbLCnpxN+
 2a0mHsj7sXX/mm6zLBQk1TgRwnDFwpXKcgKId1q8k3PzDrzpKVyWtpb4CxCK/eO0
 KYpLoGReXA+MXVcWxh5Rc7IU38b/k91QnBjAqZNLuZaA0A6haXjnIUUzokavdBl0
 wMXSK/rZo=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3H_Kpk59l8YaPAA--.55210S2;
 Thu, 11 Jan 2024 15:07:21 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: [PATCH] gma500: Clean up errors in psb_intel_sdvo_regs.h
Date: Thu, 11 Jan 2024 07:07:20 +0000
Message-Id: <20240111070720.9602-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H_Kpk59l8YaPAA--.55210S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDuF4DZFy3KFWrJw17GFg_yoWfWrb_uF
 4FqF47uFWUuanFkrn2yryj9FyS93WfuF4kurs8ta4ayF17Cr4UW34qvFy5XrWrJFW3GFWD
 Jw4qqFy3ZF9IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjjg4PUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhhi1mVOBk3MNgABsl
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

ERROR: space required after that close brace '}'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
index 600e79744d68..e358a6b1bcce 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
@@ -666,7 +666,7 @@ struct psb_intel_sdvo_enhancement_limits_reply {
 #define SDVO_CMD_SET_TV_LUMA_FILTER			0x79
 struct psb_intel_sdvo_enhancements_arg {
     u16 value;
-}__attribute__((packed));
+} __attribute__((packed));
 
 #define SDVO_CMD_GET_DOT_CRAWL				0x70
 #define SDVO_CMD_SET_DOT_CRAWL				0x71
-- 
2.17.1

