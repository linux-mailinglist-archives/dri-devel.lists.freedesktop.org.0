Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98359F449
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED601122AF;
	Wed, 24 Aug 2022 07:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A22F11A88D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:13:10 +0000 (UTC)
X-QQ-mid: bizesmtp76t1661256782tgvbn6j0
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:13:01 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: ZpVBcTpAW5OCEhGEBuH7M3/VNPcRmTX6IfPaP249ZQj3I5tEuuRACRGTMqtzN
 ilKst+e8JK5KdlP0hR4J8NNTixqVLdPyk5wB3+1yyY7/jz6/frsyN2uzPxohUjh7Xw/K7Bq
 j53no6+SQosRBxngo63jcZfxc/7V6PQg+v4RK/PT2OXt9HvQn36SED+DH2SIHQt25zT1dg7
 tVXoWWKAN7/HnbZrCNvs1F4dYbUxXqicBZQpdG3IWWuGPFvKGhpLexusDfp13FR421j5b/Z
 I0PUGyRcDxxkY2wyVKZWY6nkC+qtty00mE77baSYB+mqcPiss+xuBN7KneRcCx/X2TycLcj
 YI6gu27DkanXOEBletUR5WBFK7o/ScFQhses/BToq2zwTwMTr+vNcJe7KFzMAF46S5G5A7s
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:12:54 +0800
Message-Id: <20220823121254.6826-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'in'.
 Delete the redundant word 'on'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/drm_edid.c        | 2 +-
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..71e5b4d805fb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6023,7 +6023,7 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
 	 * by non-zero YQ when receiving RGB. There doesn't seem to be any
 	 * good way to tell which version of CEA-861 the sink supports, so
 	 * we limit non-zero YQ to HDMI 2.0 sinks only as HDMI 2.0 is based
-	 * on on CEA-861-F.
+	 * on CEA-861-F.
 	 */
 	if (!is_hdmi2_sink(connector) ||
 	    rgb_quant_range == HDMI_QUANTIZATION_RANGE_LIMITED)
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 4562a8b86579..1ece22e7b6cb 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -935,7 +935,7 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
  * the id and get back -EINVAL. Obviously no concern at driver unload time.
  *
  * Also, the framebuffer will not be removed from the lookup idr - for
- * user-created framebuffers this will happen in in the rmfb ioctl. For
+ * user-created framebuffers this will happen in the rmfb ioctl. For
  * driver-private objects (e.g. for fbdev) drivers need to explicitly call
  * drm_framebuffer_unregister_private.
  */
-- 
2.36.1

