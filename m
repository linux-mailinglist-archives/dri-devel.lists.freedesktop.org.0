Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49AF5B0332
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CC10E5CB;
	Wed,  7 Sep 2022 11:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5FB10E5CB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 11:36:59 +0000 (UTC)
X-QQ-mid: bizesmtp76t1662550611t69rfsxr
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Sep 2022 19:36:50 +0800 (CST)
X-QQ-SSF: 01000000002000D0F000B00A0000000
X-QQ-FEAT: xo0edGM1fUgzs0t7dv5TswAcz+UwGqM28Cv2CGjKh7qwMxoOmvi7Nu37gNRyv
 hBFn91BKRuiCwcoJHqRD6UWoOFVuHypAkfifg37nMxsF4awZjlzUYfjyBGP094dbfcqj8tp
 N5ktFuKUKVL1JmOLebhYUDSmLWmwDVtKuq9lTmWlIZp3qqqhJmtvVKQqj8U/47hbY52R6KA
 Qsz9FxnwuOdZkU+JzVXJ3P3ZSKuEg5y0/xIDH3iS3mhh/eM4zSuRHXdUS89Ao3MM1pf3Mw/
 GHLhJW1+YURQxorDXYQPhWMhID7lsW8PwfPqhXJj65rOpo0O9ldhw0pnFeKb8wAsNYEwvys
 81HiumNLatq2+dWsGF65FmbvM1+9TngB4j9c/YnN3i7fVQZCbgjgolX6JzAFA==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/edid: fix repeated words in comments
Date: Wed,  7 Sep 2022 19:36:44 +0800
Message-Id: <20220907113644.32831-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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

Delete the redundant word 'on'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4005dab6147d..25866b568d6b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6837,7 +6837,7 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
 	 * by non-zero YQ when receiving RGB. There doesn't seem to be any
 	 * good way to tell which version of CEA-861 the sink supports, so
 	 * we limit non-zero YQ to HDMI 2.0 sinks only as HDMI 2.0 is based
-	 * on on CEA-861-F.
+	 * on CEA-861-F.
 	 */
 	if (!is_hdmi2_sink(connector) ||
 	    rgb_quant_range == HDMI_QUANTIZATION_RANGE_LIMITED)
-- 
2.36.1

