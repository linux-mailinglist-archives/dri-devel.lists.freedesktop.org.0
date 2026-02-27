Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLM+FnRroWkOswQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:01:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED861B5B0F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782A810EADD;
	Fri, 27 Feb 2026 10:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF17410EAE0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:01:16 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.233])
 by APP-05 (Coremail) with SMTP id zQCowABX6Qxja6Fp2EA6CQ--.1125S3;
 Fri, 27 Feb 2026 18:01:10 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 2/2] drm/dumb-buffers: document abuses in the UAPI document
Date: Fri, 27 Feb 2026 18:01:06 +0800
Message-ID: <20260227100106.797831-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227100106.797831-1-zhengxingda@iscas.ac.cn>
References: <20260227100106.797831-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABX6Qxja6Fp2EA6CQ--.1125S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF48WFWDKFyxZr1UJw17Awb_yoW8ZryDpF
 ZakrWkAr4kAFW3CF4kCa97WF15Jan3Wr48GF4093yxWFn8try0vr1kKFn8AFyxGrn7AF1Y
 qry3Crn8Wa4DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
 0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUe5r4UUUUU
X-Originating-IP: [112.94.101.233]
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:zhengxingda@iscas.ac.cn,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[iscas.ac.cn:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2ED861B5B0F
X-Rspamd-Action: no action

Although the current DRM_IOCTL_MODE_CREATE_DUMB interface design only
suits linear buffers, some current software abusing it for AFBC
framebuffers and existing KMS drivers with AFBC support seem to allow
such kind of abuse.

Mention it in the interface document, and clarifying that it's not
recommended.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Move the line saying layout is always linear to the notice paragraph.
- Change the subject to software instead of driver.

 include/uapi/drm/drm_mode.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b8..3e46378379f45 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1213,7 +1213,6 @@ struct drm_mode_crtc_page_flip_target {
  * or a variant thereof. The value often corresponds to the number of bits
  * per pixel for most modes, although there are exceptions. Each color mode
  * maps to a DRM format plus a number of modes with similar pixel layout.
- * Framebuffer layout is always linear.
  *
  * Support for all modes and formats is optional. Even if dumb-buffer
  * creation with a certain color mode succeeds, it is not guaranteed that
@@ -1253,9 +1252,13 @@ struct drm_mode_crtc_page_flip_target {
  * legacy user space. Please don't use them in new code. Other modes
  * are not support.
  *
+ * Framebuffer layout is always linear when allocated with this interface.
  * Do not attempt to allocate anything but linear framebuffer memory
  * with single-plane RGB data. Allocation of other framebuffer
  * layouts requires dedicated ioctls in the respective DRM driver.
+ * There exists userspace software exploiting this interface for
+ * framebuffers with non-linear layout, but this is incorrect usage with
+ * undefined behavior, and should not be replicated.
  */
 struct drm_mode_create_dumb {
 	__u32 height;
-- 
2.52.0

