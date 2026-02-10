Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCMDMP88i2neRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:13:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64C11BBFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6384710E595;
	Tue, 10 Feb 2026 14:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86810E595
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:13:15 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.253])
 by APP-03 (Coremail) with SMTP id rQCowABXZ87vPItp+RItCA--.18409S5;
 Tue, 10 Feb 2026 22:13:10 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH drm-misc-next 3/3] drm: verisilicon: fill plane's vs_format in
 atomic_check
Date: Tue, 10 Feb 2026 22:13:00 +0800
Message-ID: <20260210141300.749013-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210141300.749013-1-zhengxingda@iscas.ac.cn>
References: <20260210141300.749013-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXZ87vPItp+RItCA--.18409S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1fCryxAFW8ZrWkJF45trb_yoW5Cw1kpr
 4DAFyrKr4ftrWUWr9rJrWDtFZxuan3KryIgrW7GwnagF1rt3y3CF1kJrZ3CFs8Jry7Gw4x
 tanayFs8Aw42yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
 0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYdb1UUUUU
X-Originating-IP: [112.94.103.253]
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 5B64C11BBFC
X-Rspamd-Action: no action

Move the conversion from drm_format to vs_format to atomic_check, which
is before the point of no return and can properly bail out.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_plane.h         |  2 ++
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index 12848a72af576..df4b248b52954 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -65,6 +65,8 @@ struct vs_format {
 
 struct vs_plane_state {
 	struct drm_plane_state base;
+
+	struct vs_format format;
 };
 
 static inline struct vs_plane_state *state_to_vs_plane_state(struct drm_plane_state *state)
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index bad0bc5e3242d..b5bc6b0078fc3 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -25,12 +25,19 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct vs_plane_state *new_vs_plane_state = state_to_vs_plane_state(new_plane_state);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
 	if (!crtc)
 		return 0;
 
+	ret = drm_format_to_vs_format(new_plane_state->fb->format->format,
+				      &new_vs_plane_state->format);
+	if (ret)
+		return ret;
+
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
@@ -88,11 +95,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
 								       plane);
+	struct vs_plane_state *vs_state = state_to_vs_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_crtc *crtc = state->crtc;
 	struct vs_dc *dc;
 	struct vs_crtc *vcrtc;
-	struct vs_format fmt;
 	unsigned int output;
 	dma_addr_t dma_addr;
 
@@ -105,16 +112,15 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 	output = vcrtc->id;
 	dc = vcrtc->dc;
 
-	drm_format_to_vs_format(state->fb->format->format, &fmt);
-
 	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
 			   VSDC_FB_CONFIG_FMT_MASK,
-			   VSDC_FB_CONFIG_FMT(fmt.color));
+			   VSDC_FB_CONFIG_FMT(vs_state->format.color));
 	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
 			   VSDC_FB_CONFIG_SWIZZLE_MASK,
-			   VSDC_FB_CONFIG_SWIZZLE(fmt.swizzle));
+			   VSDC_FB_CONFIG_SWIZZLE(vs_state->format.swizzle));
 	regmap_assign_bits(dc->regs, VSDC_FB_CONFIG(output),
-			   VSDC_FB_CONFIG_UV_SWIZZLE_EN, fmt.uv_swizzle);
+			   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
+			   vs_state->format.uv_swizzle);
 
 	dma_addr = vs_fb_get_dma_addr(fb, &state->src);
 
-- 
2.52.0

