Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C235485C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC9410E829;
	Mon, 13 Jun 2022 14:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2210E829
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 40217320025E;
 Mon, 13 Jun 2022 10:48:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 13 Jun 2022 10:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131705; x=1655218105; bh=hI
 BWBxTnzWSFNC3xWMyIxVR8K55svJKOr/w+VVSbyGM=; b=S4iNM6+MvAMYnk21T6
 ovN5E+YSQC3S/WrhiwBqajtuG9HXXIcs9GNhKRWojvotBD8sdYolEVk884RzXzIP
 UOJf054tonYZdifnXttY5EFOgKBPEV9uYl7Jh+I3U0C+JiKQH2b0ddBmicDqU7il
 YDNsZUj8Ac3Ue8uAwR66tbLj/0pwLQ/IqqA4/TRxbiCIU6RLMXvFgTfcygnVUGq2
 Ha027ei3pfT1qwmltUGOaU0lMUPMzgNb2DsizWUKR5jssLscCfeV7iuK12owtI3O
 pjn8eSXNTZ/dpLWjxyJ8aGHPjwNEqP9U/HmiLRrPWfL96v57W1hAJHnedqrZzsq9
 sG7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131705; x=1655218105; bh=hIBWBxTnzWSFN
 C3xWMyIxVR8K55svJKOr/w+VVSbyGM=; b=grTmihvq83KIf9cMiICr74/XPZWO8
 U043MR8FD0QCivC4FOvHAVm8FKaqsG9IkGfFMEEcp8pIlc+Fzr+JstIUWG58z+4N
 V/QUgikNSAbVL7tsd171oS8mR3KnKYHqs8ypw1Vstv7y0ocrViDdwPgnbm1vXJLq
 GJNOebs4qfzNWh/YvsFJzW/6jxGKgfIx50lkTObot6nMyll/1x7lDrTz+MhWQHrE
 zN6+D6NaXDwGICXY30w1UJSoAa5ZUyq8OZp8c0KkLmV0utgx821qgvPFpEpS9tEV
 qCF1voZ5q6njTxjolpxwJi3xeKQrhfwLkvRWtrDG+jVI9UTk1+ApZn2Kw==
X-ME-Sender: <xms:OU6nYhG5L-0N2U21pxVp7LBiOkThT0lcyMh27-A4RP07ie7fmd4sHw>
 <xme:OU6nYmUuOX8166PdOlN5Mx7BYpQBxk0hnqXGyAPUJ8fkYCA6rcHMgVUgAWJD0HT6s
 YIh_kJfkT2TgU2POeU>
X-ME-Received: <xmr:OU6nYjLXg90U91PcZ0BPYp2NsGOiYzb42_o74pQocciGiRffg6nRLy6Z6zYGfS37H7AUPgthbgzd7qVFmlzQ51U9Cz6iopsgyR0wdi4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OU6nYnH4dMdodOBviEEAGfCqNKtnxkUuR5LzgeFPIXv-ZHZ0DzyW6g>
 <xmx:OU6nYnUSc0ZgrHW5EzKNBNUcJ7ic-ghqJzzdOPMmDotGgmnkcavCzg>
 <xmx:OU6nYiOWVlyecinB5kQ3inObgmAi8EEN9O5gkaNhSklMDJGaqEal-A>
 <xmx:OU6nYtfOjkEIsf40KkfTjp8_spIKaRWvshB-butRUNtlAehC-A4qfQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/33] drm/vc4: hvs: Add debugfs node that dumps the current
 display lists
Date: Mon, 13 Jun 2022 16:47:34 +0200
Message-Id: <20220613144800.326124-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

This allows easy analysis of display lists when debugging.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2a58fc421cf6..5fdfc01fbc5a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -94,6 +94,46 @@ static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_printer p = drm_seq_file_printer(m);
+	unsigned int next_entry_start = 0;
+	unsigned int i, j;
+	u32 dlist_word, dispstat;
+
+	for (i = 0; i < SCALER_CHANNELS_COUNT; i++) {
+		dispstat = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(i)),
+					 SCALER_DISPSTATX_MODE);
+		if (dispstat == SCALER_DISPSTATX_MODE_DISABLED ||
+		    dispstat == SCALER_DISPSTATX_MODE_EOF) {
+			drm_printf(&p, "HVS chan %u disabled\n", i);
+			continue;
+		}
+
+		drm_printf(&p, "HVS chan %u:\n", i);
+
+		for (j = HVS_READ(SCALER_DISPLISTX(i)); j < 256; j++) {
+			dlist_word = readl((u32 __iomem *)vc4->hvs->dlist + j);
+			drm_printf(&p, "dlist: %02d: 0x%08x\n", j,
+				   dlist_word);
+			if (!next_entry_start ||
+			    next_entry_start == j) {
+				if (dlist_word & SCALER_CTL0_END)
+					break;
+				next_entry_start = j +
+					VC4_GET_FIELD(dlist_word,
+						      SCALER_CTL0_SIZE);
+			}
+		}
+	}
+
+	return 0;
+}
+
 /* The filter kernel is composed of dwords each containing 3 9-bit
  * signed integers packed next to each other.
  */
@@ -734,6 +774,8 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	vc4_debugfs_add_regset32(drm, "hvs_regs", &hvs->regset);
 	vc4_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun,
 			     NULL);
+	vc4_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist,
+			     NULL);
 
 	return 0;
 }
-- 
2.36.1

