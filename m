Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF43560034
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCEF14A67F;
	Wed, 29 Jun 2022 12:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917D014A66E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6D34B320095E;
 Wed, 29 Jun 2022 08:38:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656506303; x=
 1656592703; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=D
 hSi/UcRO92fvrUtQr0pahEeXNSZXymaxCqHB2h5lh+4v4/NR5wzfHy/EtPbId+O5
 vAoMg8bD+MtelYO3klurriqvAKJquWo8YkcbiTpTtxmkhHFWl+TSbGpFKclrUSB7
 9C3kDhsbBnpIyB1yk+xuegd6kLCcxD+tkvjrHP5gPci1NMfH58rbq7Ol7VvJnQyG
 y6PzL8WrMzQb00EUTyj3d9GaeR1rN34Eb/ARmTqm2CLHnPzm2/IgaqtWv8mhgI6I
 6t0go2bplJHudzkOvQqUUupByPgXgGGcdEd5kpQCcddWQGhUHT+Plwrck2te9eqS
 sAeFRDAnNFO1+tngF+wIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656506303; x=
 1656592703; bh=is1SUOCWblDIvymDE/eZ/WEELF4q6ov293jMzKQUzR8=; b=l
 35AgcfDxD5QnlMaYmyymaXyk4E5jVy+vr3oP8JLwKCJYd63vOWCmqLsAc6p+7ueM
 COypsjZnJxl2L3hmOMJhMCOyF/QuseaCnGp25XsQcs11/ql3nvX2Okv+2ZsSctj1
 K3P/M57otpHWmZ0XIgeNtFfwyBYVHQWA3yXDDOHzreSMI/9pTtBAt3gdhj8gNc1L
 xat42PcEs+nI9KCOSo849nNMcRmGfwpODOYWamjibsiiu0kNTamQWAMqYlBGAyZB
 3lxKQ/Em9aqTnTHcBDEQN6tqk5cQ0lt41AQpARkQnC87rwTY3TYNymQjIDbiAiax
 b47oQ9K5aSyqL/j6THu0w==
X-ME-Sender: <xms:v0e8Yqs1XZHg7qIgn8Um2N7Ljp6SlOklx6KzV3vjbGn-KH_LuokOVA>
 <xme:v0e8YveXga4l_5jBpFnj0W559n9EPWpv63BC-Y2LolEBtFD5RmW9VYVppDpkFe2Aq
 xxsP7dV4kicr_PNlno>
X-ME-Received: <xmr:v0e8Ylz2yfzbIL3hyLKk4TzNlifOLMuiMvGoGbTOeMbxJg3eJWvyw8G-J_72wpCASfPOZudcZOyDmz2l5w9_BvtxLcB5DJhoGteAZ1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v0e8YlP5Bz85j-x2YBGmSlVkSZickVedcpPPm2q2sKU5bTDVjYm0Dw>
 <xmx:v0e8Yq9-LQ9q_sgy7A0TSoybQ468iXMaqbNBJhqjznZrAik5G7-pLw>
 <xmx:v0e8YtXGamJtXHwd4l-T9OLonZhSqvVwc-0DlTL16xsix4AJZqa4kA>
 <xmx:v0e8YuZW9VYoxSt6iNgAFLQBhk5P0rdOBlczF5m1mVNwx4As8knaAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 64/71] drm/vc4: debugfs: Protect device resources
Date: Wed, 29 Jun 2022 14:35:03 +0200
Message-Id: <20220629123510.1915022-65-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

