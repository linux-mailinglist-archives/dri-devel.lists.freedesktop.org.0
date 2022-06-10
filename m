Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0697546267
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C744C12B552;
	Fri, 10 Jun 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3C12B54C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1786F5C00D7;
 Fri, 10 Jun 2022 05:31:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654853468; x=
 1654939868; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=F
 b7E//F+1x9oVIGQ5rpatUmNgt3Vz7q77/nt8DKknpA/7f1xoAFnvPatRUTbI0jDs
 q4/rk405g/omEkvRBIKELmjbvonslQH11wKVTbPDRfC2S4i4BtaMd4kDIui5YsFA
 6EdX+B1PzYNrMp8veMuNw2utgWZcekeESCJoxO9N1aTL+GZH4eXMUY3MGOxcJ22G
 h7HoUEw4fDAKUBRvrH1CiYMSqcoEH8OpDIwe5QGstAPPe2uHKGUqGPKareP49p+p
 VdUCAboFsstKTBXvpyI15NSkGu4RPIfeCAqLuTZeGVJeYHQDL6axaoKYoWl8xim+
 eKuEDZD1BvEBf7HGttO7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654853468; x=
 1654939868; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=o
 EQ5mXndFXmW/3y6d5jHi+AgDUOlTb7VrYWDqkFKcCLAI0KFI/5oBqSSczqxv5RKp
 Q5O0QHpKnKawqedSC/1TUPT7jqCtaQVHf4cE9hb2IFz4azEY+oenF5CVRSv8ijoL
 IfGDDoRKBKd/4lsE0ed83P5PU/1838fm6Q7Y2IqyCp96Oh95ZN34M10Ea7PthkKI
 b5mOEhkzLdIhlRVpvc6asTIWP9Yc0DIUlw7Yc5Fwd8QsMLjaWzlqv1VZikNswnm0
 BSe1Aed6v3/1AgAud6M0jp4jwENovN5eXh3T5DBiH024TpcpL/RlRlbQ8U0pH2TI
 97NFwAGX8wB6HZseIA3FQ==
X-ME-Sender: <xms:Ww-jYhR0nrTxYvTw0gsLavEUI87qz9eE_WqRuiwqVSh4BIry_qj8YA>
 <xme:Ww-jYqyAJ-bDOrzltKeBsyOZvAtDPF8271UMlrpZOYXxGuCfAPS6hel_HgjAX6h4F
 Oo7bxYREYHvSkhqkFQ>
X-ME-Received: <xmr:Ww-jYm2pXDpcSj-l8nGGz0MOQxZqFCDAwhEzV7P3tWerSlbUIg70qCoImaUTWqpQbohPPHXy0O_6nsNYwsclxBNQqGbz0_bcnWrZ_KE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ww-jYpB9CxVOaYvQO5f89LFK6jCmpMl2tr0ELpOxv7CzItBHQTbClA>
 <xmx:Ww-jYqiatyVT-SFkmMbPsRU7t96HfPvNtzyORTWi2HL-w2HY6HrtuQ>
 <xmx:Ww-jYtpl5selZl76CvRlCyrIW_Pcmm_F8-CFYQgqb0WwFxYJrn_NJA>
 <xmx:XA-jYidtPzU9aFZOWenqLXOfNyjhdqbjLWruP3gz9bhhYNT-SqPcBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 57/64] drm/vc4: debugfs: Protect device resources
Date: Fri, 10 Jun 2022 11:29:17 +0200
Message-Id: <20220610092924.754942-58-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

