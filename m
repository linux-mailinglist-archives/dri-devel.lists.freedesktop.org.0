Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAQbMAc4qWlk3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:00:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1D20D10E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7510EB3E;
	Thu,  5 Mar 2026 08:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C897E10E224
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:00:02 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-01 (Coremail) with SMTP id qwCowACHL2vqN6lpVpFHCQ--.856S4;
 Thu, 05 Mar 2026 15:59:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH drm-misc-next v2 2/3] drm: verisilicon: subclass
 drm_plane_state
Date: Thu,  5 Mar 2026 15:59:25 +0800
Message-ID: <20260305075926.3642501-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
References: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHL2vqN6lpVpFHCQ--.856S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1fuw4fGr43Aw17Xry8AFb_yoWrCr48pr
 srAFy5Kr45Aw4DGr9rJw1jy3y3ua18KryIgrZ7GwnavF15try3uF1ktr93CFsxJrW7Gw1f
 tan2kF4DCr4ayrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj5Ef7UUUUU==
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: 74D1D20D10E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:zhengxingda@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Create a subclass of drm_plane_state to store hardware-specific state
information (e.g. hardware plane format settings) in the future.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Add the #include clause for atomic state helpers, which was wrongly
  placed in the previous patch in v1.
- Switch to kzalloc_obj helper for allocating the state.

 drivers/gpu/drm/verisilicon/vs_plane.c        | 41 +++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        | 14 +++++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  6 +--
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
index fa88ed14e41d7..2fd4fb2a9591c 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -6,6 +6,7 @@
 #include <linux/errno.h>
 #include <linux/printk.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -124,3 +125,43 @@ dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 
 	return dma_addr;
 }
+
+struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *vs_state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	vs_state = kmemdup(plane->state, sizeof(*vs_state), GFP_KERNEL);
+	if (!vs_state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &vs_state->base);
+
+	return &vs_state->base;
+}
+
+void vs_plane_destroy_state(struct drm_plane *plane,
+			    struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(state);
+}
+
+/* Called during init to allocate the plane's atomic state. */
+void vs_plane_reset(struct drm_plane *plane)
+{
+	struct vs_plane_state *vs_state;
+
+	if (plane->state)
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+
+	kfree(plane->state);
+
+	vs_state = kzalloc_obj(*vs_state, GFP_KERNEL);
+	if (!vs_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &vs_state->base);
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index a88cc19f2202e..12848a72af576 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -63,10 +63,24 @@ struct vs_format {
 	bool uv_swizzle;
 };
 
+struct vs_plane_state {
+	struct drm_plane_state base;
+};
+
+static inline struct vs_plane_state *state_to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+
 int drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
 dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 			      const struct drm_rect *src_rect);
 
+struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane);
+void vs_plane_destroy_state(struct drm_plane *plane,
+			    struct drm_plane_state *state);
+void vs_plane_reset(struct drm_plane *plane);
+
 struct drm_plane *vs_primary_plane_init(struct drm_device *dev, struct vs_dc *dc);
 
 #endif /* _VS_PLANE_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index e8fcb5958615c..bad0bc5e3242d 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -145,10 +145,10 @@ static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
 };
 
 static const struct drm_plane_funcs vs_primary_plane_funcs = {
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= vs_plane_destroy_state,
+	.atomic_duplicate_state	= vs_plane_duplicate_state,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.reset			= drm_atomic_helper_plane_reset,
+	.reset			= vs_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
 };
 
-- 
2.52.0

