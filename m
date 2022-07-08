Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFD56B69E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AC311387B;
	Fri,  8 Jul 2022 09:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD23113877
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2E8AC32009AA;
 Fri,  8 Jul 2022 05:58:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274310; x=1657360710; bh=Z0
 DJz7H9tFVgAf3yqEQVf0DsRD1q9j47oH4cHKJNqCo=; b=Mqyr9J8nm3BDTCvIC/
 /Qhe+PGyRhZ+HLECgWHGHE58qcAwACjwievIIOSS4uULe9J+nK12w+nJbtGuAcBR
 Z5Cytp8UcZdDcF/FmctgNv3dPmprZIr6FEmXp0723RS51Pu/DZVHmW1dU1mKiACu
 742bNbf50THW4qKF2PewEIts4NBkUFhZ8DFC1k9kPnYmnbv63c9cwLkMLejJ2Kt3
 O7u6mcOjP1OoLb2x/vhLhPk9UQfAEYcfroGtrTfqhRP5PW13WAqr4oBOUbl7lM+B
 T67t9/nhAKwBIfBQcK0EPDiJGjeu5i7wjrYFGhdgtemk824PLCK4JnRFH33PBhcm
 SHMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274310; x=1657360710; bh=Z0DJz7H9tFVgA
 f3yqEQVf0DsRD1q9j47oH4cHKJNqCo=; b=stoGr4IPCFl5ZtbjJ8K/gPQAp07IT
 YCTdAvuf2XBpigRBFQ0bZdlAzVdCqdFPrs3rn63K5wbHSlYKoM66a9L0K5/O1scw
 4iX5ui7XADHm1H3qptB/Ogkpm3hqqced6MUKnZntZ1YXgvFDzQjSGPNi8bI9r3H9
 iX6caiXunwzOBW+/AQ5qKuFmm0nGYHZitSM41KXpSP9tGRRjIHcmXwvMBlF0ikT2
 cB3/U63UueOMKoCLElbMX9RvDh6keHE7Oa8VxbffPhfPZ8FfunA/b+CGT9eyx96o
 pdwch7ZWDu1+dDqJuMCp5+GjK3pYfd68lrCeurSfw+GycDjFYZyfwU7+w==
X-ME-Sender: <xms:xv_HYkhaC9z9lGGBf8aWTDfMqoD_hUHoDK3moQxFx4lK1E5lH8r-HQ>
 <xme:xv_HYtA8SNbMTHW2SufBrCWgZKHplfP7EdiuKXinkEbnv1TmaUgtrr3tVsnpmgCZQ
 z9A96iXU3ebuNkhoQ4>
X-ME-Received: <xmr:xv_HYsEchYrxgFKuxxlw2r7ddDHD0RjKhF4ct2OmKW35V4rZ6_lNk_zUYncs8R0dyMWTNjkqO96PiOP9tc7L6ijuotFyjYs2UFu_7fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xv_HYlQQUrfczcY8VtxZgJ1MoFaIy47MDoOozNxPd8wfyG0-m9Tk1g>
 <xmx:xv_HYhwwUOoj5E8FddzKrtbMNmlK7UBj8nFASUqwKkmT76c_Whoizg>
 <xmx:xv_HYj5AFPK1EE8kGelOLhrHyCdxFPsZzAkQNcNBnS35vKTJCfasQA>
 <xmx:xv_HYkrR8K-Ps6pyKt4gpgfHfrin9nzsNTKq2davG4T_k6vb7SFWqA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 27/69] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
Date: Fri,  8 Jul 2022 11:56:25 +0200
Message-Id: <20220708095707.257937-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Since we have a managed call to create our panel_bridge instance, the call
to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
since it might lead to a use-after-free.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7028a789919d..f18b05cee8bc 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -329,8 +329,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
-	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
-
 	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
-- 
2.36.1

