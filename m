Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF2C7EE5E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 04:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E0110E1C4;
	Mon, 24 Nov 2025 03:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="0oJ/J4++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51E110E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=n5U7jpt3t1560U3NetE1JfILJnu5vieGsmBVulfauV0=; b=0oJ/J4++2bogNZJoQQ8Bayj7TX
 XzRrQ8CFWZjS1I5N4BlMq0TaG7OBpJXct8QX0RgmDhVXOuPLkMnf1SNfDiZegWXEeNDixKq+rJBxN
 6cwzBBylI2DTwJm8nO6gqadXiGLi7rGAS2JXrLc6a7b24y7hmwxmG/yOow7l4BwAHdyOoRrMF+4yp
 HygX5mqzbcbevyIgqLUqLw3h10RAncWjbzbYbsWEMoAssKxdy0xDad+/KZcgab4S4S/KPJgsOkJq+
 E5MnVmwVRHNCSrUowKacBJei4ZB+i3YFgI7n4x69NlFQgLbl8CgtMSxQW8GqHVwF5g7cRS5izbnd0
 GCoB1+5A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vNNK9-0000000B28p-1l2m; Mon, 24 Nov 2025 03:33:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tegra: dp: fix kernel-doc warnings in dp.h
Date: Sun, 23 Nov 2025 19:33:08 -0800
Message-ID: <20251124033308.2987174-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use correct kernel-doc format and add missing nested struct entries to
eliminate kernel-doc warnings:

Warning: drivers/gpu/drm/tegra/dp.h:28 Incorrect use of kernel-doc format:
 * tps3_supported:
Warning: drivers/gpu/drm/tegra/dp.h:54 struct member 'tps3_supported'
 not described in 'drm_dp_link_caps'
dp.h:73: warning: Function parameter or struct member 'apply_training'
 not described in 'drm_dp_link_ops'
dp.h:73: warning: Function parameter or struct member 'configure'
 not described in 'drm_dp_link_ops'
dp.h:160: warning: Excess struct member 'cr' description in 'drm_dp_link'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/tegra/dp.h |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- linux-next-20251121.orig/drivers/gpu/drm/tegra/dp.h
+++ linux-next-20251121/drivers/gpu/drm/tegra/dp.h
@@ -26,7 +26,7 @@ struct drm_dp_link_caps {
 	bool enhanced_framing;
 
 	/**
-	 * tps3_supported:
+	 * @tps3_supported:
 	 *
 	 * training pattern sequence 3 supported for equalization
 	 */
@@ -62,12 +62,12 @@ void drm_dp_link_caps_copy(struct drm_dp
  */
 struct drm_dp_link_ops {
 	/**
-	 * @apply_training:
+	 * @apply_training: apply the link training
 	 */
 	int (*apply_training)(struct drm_dp_link *link);
 
 	/**
-	 * @configure:
+	 * @configure: configure the DP link
 	 */
 	int (*configure)(struct drm_dp_link *link);
 };
@@ -113,6 +113,8 @@ struct drm_dp_link_train {
  * @max_lanes: maximum number of lanes supported on the link
  * @caps: capabilities supported on the link (see &drm_dp_link_caps)
  * @aux_rd_interval: AUX read interval to use for training (in microseconds)
+ * @aux_rd_interval.cr: clock recovery read interval
+ * @aux_rd_interval.ce: channel equalization read interval
  * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
@@ -126,10 +128,6 @@ struct drm_dp_link {
 
 	struct drm_dp_link_caps caps;
 
-	/**
-	 * @cr: clock recovery read interval
-	 * @ce: channel equalization read interval
-	 */
 	struct {
 		unsigned int cr;
 		unsigned int ce;
