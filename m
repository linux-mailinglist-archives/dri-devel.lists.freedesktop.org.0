Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF0219934
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DEC6E9EA;
	Thu,  9 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6D89C9C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 53D87109F;
 Wed,  8 Jul 2020 13:43:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1LFoNqmlgRkCm
 9FumZP8Ph+ISo5fft0Ywc9akrAcD3c=; b=Ln0OKaBBgyPGG/gofM1Q3zxphS6PR
 li0SDkil7RPCHYuiV0m6hf4NxEw4B62QPrjnO3F8VJFNIX3AGvxrRuFaKxx+M2Q6
 hUMC7KgdzGbDxyMqrSN87gBfZen92cQmQSPpJett4MI0U89R2YJVbjoK2CuFuP4Q
 UMkawH/wPu4QzIt4vGlDtuH+8lODCftLrt+exea+87sIQAhcUBwV0+3L7mkCXenX
 fXAWu+ttFIdr/7lwdHft7UguqG19M2UPTS+YI82E80TIslWwH3zZ9w+6mr2nIzCL
 djCehWICYr9rBZDIqL8cTR5jtTsN0q7fThXAI5eAb/iWLtMKU2Px+kT8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1LFoNqmlgRkCm9FumZP8Ph+ISo5fft0Ywc9akrAcD3c=; b=uAiKqEMp
 TfXXdjKes/L6ImvulxcM0mClqWwM1gC9A2Wkp5gcMNka9+Wa5UtjNBpJsKcotfEZ
 CDuKzs84xyn1/Ay3OEghnsu/tA+N6OfmSy/5YjceMqlt7TzkII22POZW8cTdAyfP
 1K8DUUcO3fJUnFihgFPyTB1T5gVvfKxQ8ONdtH7yoai4JED7PcyURhTutnILNxa3
 NZFLbBpyKr58mlCoWrkgFAm6TwD/EKDatAkCkrT38tWyTUzREjOp3K1h16OWwC6N
 gFi7FnCcTmvvZ7F+co1gApoJYy7N57NYugXddlcLl21QV/PmYRbT4Fcpmsc7aBCT
 j8BRTOPSQPKr1Q==
X-ME-Sender: <xms:3gUGX1XYfZEPQWEYX9w_0o1TTCh38UyAvyZNl0fUZTfrUzjiCHhUOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3gUGX1mWQ298bbiTPD17Pqf_cboxxBFsJOrePX37d3Y_AUlVMuWsrQ>
 <xmx:3gUGXxZSR9gnzCvFr7bStqQhdhDk66DbJ2vAyHCFcvAm00K0Cl-EQQ>
 <xmx:3gUGX4UjSS85qPvad-rKRGcSVFSVH2aSkbQTvRjyTIbr6HWSqUbixw>
 <xmx:3gUGX9VoEzr44hV3Cs_nKzctvKqjFFsGWHrwj3VAnGZ-u63MkWpOlihnj3I>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0CBF306005F;
 Wed,  8 Jul 2020 13:43:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 61/78] drm/vc4: hdmi: Rename drm_encoder pointer in
 mode_valid
Date: Wed,  8 Jul 2020 19:42:09 +0200
Message-Id: <98c93e0a594e42e39ba77946a0c8107996495eae.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid hook on the encoder uses a pointer to a drm_encoder called
crtc, which is pretty confusing. Let's rename it to encoder to make it
clear what it is.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a01562a49bf0..17797b14cde4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -556,7 +556,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 }
 
 static enum drm_mode_status
-vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
+vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	/*
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
