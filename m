Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881B2A891A4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 03:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DCF10E028;
	Tue, 15 Apr 2025 01:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E02010E028
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 01:55:55 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-01 (Coremail) with SMTP id qwCowAAXvf2ivP1nhmvrCA--.42931S2;
 Tue, 15 Apr 2025 09:55:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: suijingfeng@loongson.cn, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/loongson: Fix return value check for kzalloc
Date: Tue, 15 Apr 2025 09:54:14 +0800
Message-Id: <20250415015414.4150082-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXvf2ivP1nhmvrCA--.42931S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4kZF45XrWkuFykKr17ZFb_yoWxurg_Ca
 yavrs3WFyDJFnrZw17Cw4jyFyavFyruan3Za17t3saq347Xr18Za43ur15Xa43urW7XF90
 ya18uryfZrs7KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
 Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
 UU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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

kzalloc doesn't return ERR_PTR, delete unneeded IS_ERR test.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/loongson/lsdc_gfxpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.c b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
index 249c09d703ad..50b9f45db5b0 100644
--- a/drivers/gpu/drm/loongson/lsdc_gfxpll.c
+++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
@@ -179,7 +179,7 @@ int loongson_gfxpll_create(struct drm_device *ddev,
 	int ret;
 
 	this = kzalloc(sizeof(*this), GFP_KERNEL);
-	if (IS_ERR_OR_NULL(this))
+	if (!this)
 		return -ENOMEM;
 
 	this->ddev = ddev;
-- 
2.25.1

