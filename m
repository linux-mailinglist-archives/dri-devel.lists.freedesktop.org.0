Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFADMnqjqWl5BQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF96214A9C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC5910EC2C;
	Thu,  5 Mar 2026 15:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF8E10EC36
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:38:30 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-03 (Coremail) with SMTP id rQCowAC3195so6lpFrziCQ--.13220S3;
 Thu, 05 Mar 2026 23:38:23 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH drm-misc-next v3 1/4] drm: verisilicon: make vs_format
 conversion function return int
Date: Thu,  5 Mar 2026 23:38:14 +0800
Message-ID: <20260305153817.157841-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
References: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3195so6lpFrziCQ--.13220S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw43XryDur1UKF4UGF47XFb_yoW8tr1DpF
 47CrZFqFs5tw4aqF9rJayUK343Ca95Ja4xWr4kGw1Y9r15KFyUAr1DGrWFkr98Gr47Gw1I
 vFsayr1DAry2kFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
 0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_GFyl42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbn2-7UUUUU==
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
X-Rspamd-Queue-Id: 5DF96214A9C
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
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This is for further proper invalid drm_format handling before committing
the plane state change.

The return value is not yet checked yet, and will be checked in
atomic_check in the future.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Added Thomas's R-b.
Changes in v2:
- Move a bogus #include clause to the next patch.

 drivers/gpu/drm/verisilicon/vs_plane.c | 6 ++++--
 drivers/gpu/drm/verisilicon/vs_plane.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
index 2f3953e588a34..fa88ed14e41d7 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -12,7 +12,7 @@
 
 #include "vs_plane.h"
 
-void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format)
+int drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format)
 {
 	switch (drm_format) {
 	case DRM_FORMAT_XRGB4444:
@@ -62,7 +62,7 @@ void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format)
 		vs_format->color = VSDC_COLOR_FORMAT_A2R10G10B10;
 		break;
 	default:
-		pr_warn("Unexpected drm format!\n");
+		return -EINVAL;
 	}
 
 	switch (drm_format) {
@@ -101,6 +101,8 @@ void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format)
 
 	/* N/A for non-YUV formats */
 	vs_format->uv_swizzle = false;
+
+	return 0;
 }
 
 dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index 41875ea3d66a5..a88cc19f2202e 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -63,7 +63,7 @@ struct vs_format {
 	bool uv_swizzle;
 };
 
-void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
+int drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
 dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 			      const struct drm_rect *src_rect);
 
-- 
2.52.0

