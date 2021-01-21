Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A52FDFF5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 04:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FB26E8C1;
	Thu, 21 Jan 2021 03:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21F206E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 03:09:17 +0000 (UTC)
Received: from zhangzhijie.loongson.cn (unknown [10.20.41.29])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtbxX8AhgxmIIAA--.10521S2; 
 Thu, 21 Jan 2021 11:09:11 +0800 (CST)
From: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie
Subject: [PATCH v4] drm: Improve the output_poll_changed description
Date: Thu, 21 Jan 2021 11:09:09 +0800
Message-Id: <20210121030909.1126643-1-zhangzhijie@loongson.cn>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9AxtbxX8AhgxmIIAA--.10521S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43Jw4kKr18uFWrtr4ruFg_yoW8WF4rpF
 sFkryYkr4ktFWfZF4UG34xW3WkJan3Gr40qFZ7tw4FvrnIyr9FvFyvgr15uryrWrZxJr4Y
 q34S9ryrZr15CrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: x2kd0wx2klyx3h6o00pqjv00gofq/1tbiAQAIAF3QvM4CmwABsu
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
Cc: zhangzhijie@loongson.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhangzhijie <zhangzhijie@loongson.cn>

this callback was used by drm_kms_helper_hotplug_event()

V2: (Thanks for Daniel's suggestions)
- remove the FIXME below.since with the drm_client
- infrastructure and the generic fbdev emulation we've
- resolved this all very neatly now.

V3: Add comments that This hook is deprecated
- new implementation methods instead of this hook

Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
---
 include/drm/drm_mode_config.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index ab424ddd7665..fbc0da25d7c5 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -103,14 +103,13 @@ struct drm_mode_config_funcs {
 	 * Callback used by helpers to inform the driver of output configuration
 	 * changes.
 	 *
-	 * Drivers implementing fbdev emulation with the helpers can call
-	 * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
-	 * helper of output changes.
+	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
+	 * to call this hook to inform the fbdev helper of output changes.
 	 *
-	 * FIXME:
-	 *
-	 * Except that there's no vtable for device-level helper callbacks
-	 * there's no reason this is a core function.
+	 * This hook is deprecated, drivers should instead use
+	 * drm_fbdev_generic_setup() which takes care of any necessary
+	 * hotplug event forwarding already without further involvement by
+	 * the driver.
 	 */
 	void (*output_poll_changed)(struct drm_device *dev);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
