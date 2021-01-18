Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7D2F974F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 02:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7701889A8B;
	Mon, 18 Jan 2021 01:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 950EC89A8B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 01:22:57 +0000 (UTC)
Received: from zhangzhijie.loongson.cn (unknown [10.20.41.29])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxJb3o4gRggnQGAA--.7725S2;
 Mon, 18 Jan 2021 09:22:48 +0800 (CST)
From: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie
Subject: [PATCH v3] drm: Improve the output_poll_changed description
Date: Mon, 18 Jan 2021 09:22:46 +0800
Message-Id: <20210118012246.1858892-1-zhangzhijie@loongson.cn>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9AxJb3o4gRggnQGAA--.7725S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43Jw4kKr18uFWruw4Uurg_yoW8Ar18pF
 sIkryFkrs7tFZ3ZF4UJryxW3WkJan3Gr40gFZ7tw4avwnIyr9IvFyvgr15uryrWrZxXr4Y
 q3sa9rn5uFn8CrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: x2kd0wx2klyx3h6o00pqjv00gofq/1tbiAQAFAF3QvM28sAAAs0
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

Signed-off-by: zhangzhijie <zhangzhijie@loongson.cn>
Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
---
 include/drm/drm_mode_config.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index ab424ddd7665..a084482d579a 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -103,14 +103,14 @@ struct drm_mode_config_funcs {
 	 * Callback used by helpers to inform the driver of output configuration
 	 * changes.
 	 *
-	 * Drivers implementing fbdev emulation with the helpers can call
-	 * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
+	 * Drivers implementing fbdev emulation with the helpers. Drivers use
+	 * drm_kms_helper_hotplug_event() to call this hook to inform the fbdev
 	 * helper of output changes.
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
