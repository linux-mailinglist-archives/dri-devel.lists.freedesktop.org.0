Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C77554D66
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693691133BE;
	Wed, 22 Jun 2022 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF01133B6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F33BE32009BA;
 Wed, 22 Jun 2022 10:35:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655908525; x=
 1655994925; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=a
 SXsfzNJ5jZ5fZghmT1RhEKT9qGlTBgt18yVbyDAYrKoisJ/HKms6VwtTaleRbpAw
 fOgCl584lJ3SftH7Dq6hFwVtLQaEZiwp/HgcNEjIyIg/XMnCkiYkRu4czactrTkQ
 9rk4pZQSoHjJep73qdj9jzeqAZqXb6nGwDRThXkwKMtbkcW1/6TYzsyIrWz53acC
 e8UXN5QsuHN6w3KozEmpsHbk1O7NNKPcp+ceMyiJzV6hjIx91qT4vCtxPPKW8T2b
 yNPNalDwJPj0q3zFxX0oCHRkuRHrFElOWg1eYm7rxQuLFoIvw/FkNFM+unezRo+K
 0vaQP5F92pETpkmHmGG0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655908525; x=
 1655994925; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=H
 wGoMWnNBihx2MVC38SfzvGJi45WOeRFH2z6G9ygvCcyrOEyNVqA4jDRyl4KV2W28
 kn78p8xdsE8+JfeqvWxW6mbv8DaAiQ4LJPdhsiKRGsKoi0iIB3c8nqOi8wawIPvz
 q3Kr3ZzB9Ktv0DXYLR50uKlzE7VZfo5RIgD4pq2ioAt0i/zMarN0o75GDP0ZNTqa
 ONRuHkvzwG0jkqFipFFyyc4SWTVVx5wDZmRVR2DB9OcMC3yJO1ev63guPebVzliU
 lmR93Jv2zzIUl32yAS9xE5hfewPLHpqRCWwHP/J/A0K/ePBYEQpB4sOUbBXWOeoB
 ZcYSlTMbbwMiJYgc9rQWg==
X-ME-Sender: <xms:rSizYs3NDlDQlMlJwTDq-m5xvFpPdUZqD0w7CKi9aIPnkW8cLHyOWw>
 <xme:rSizYnHqJSr_mm9iLpKIW-lZzTdxW5ztsvIHdevVRU1ArCHwssijN0ZCTlvV9J3N1
 avQO-TfBt1USkCW10g>
X-ME-Received: <xmr:rSizYk6wUhiM8zxW7Dp921XfvlGyoI8vTDwKvAJyJ3chp3Wx-wTni5-3iqBWMLXgwxTZh4CH13dbMbTzbk3tLcVrbZ0olQSCG3A62to>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rSizYl2RZhbViVqrQgkLL4jD2r1VoHKkIVubs1Q6ysQInVhwNn3OaA>
 <xmx:rSizYvE2RZRdPCtvL0Mltrqjcrjt-HzWQHyv6-aCbABMv_cjIt3flw>
 <xmx:rSizYu-G53UBWiZD6w8own6yVcY1AlTW_Vc-qhjrpqFjJCKBN8hidA>
 <xmx:rSizYjiOJVD5kUs0lvkMeH1VmuPkSmfUvaP6sfOXe1UFqSDQmsC4HQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 61/68] drm/vc4: debugfs: Protect device resources
Date: Wed, 22 Jun 2022 16:32:02 +0200
Message-Id: <20220622143209.600298-62-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code now mixes some resources whose lifetime are tied to the
device (clocks, IO mappings, etc.) and some that are tied to the DRM device
(encoder, bridge).

The device one will be freed at unbind time, but the DRM one will only be
freed when the last user of the DRM device closes its file handle.

So we end up with a time window during which we can call the encoder hooks,
but we don't have access to the underlying resources and device.

Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
that we bail out if we are during that window.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index ba2d8ea562af..d6350a8ca048 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -3,6 +3,8 @@
  *  Copyright © 2014 Broadcom
  */
 
+#include <drm/drm_drv.h>
+
 #include <linux/seq_file.h>
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
@@ -41,11 +43,18 @@ vc4_debugfs_init(struct drm_minor *minor)
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *drm = node->minor->dev;
 	struct debugfs_regset32 *regset = node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	drm_print_regset32(&p, regset);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
-- 
2.36.1

