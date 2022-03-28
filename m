Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF94E9B37
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889D110ED55;
	Mon, 28 Mar 2022 15:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136D510ED55
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1D73A3201D9C;
 Mon, 28 Mar 2022 11:37:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Mar 2022 11:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=BTFEW2YB+xCxRLmVxsqpo5am8ZrxgH
 R3dxBUSRqIfLA=; b=k9R5XmRWKTLwDUAbMnIfxJqBjxdBjAWAOrcVwYRRIUkB53
 kOF1LhdBFA6ZuTOkkTKznMcaBI0+UIFRTQ6w4rTM2v0cFJGe60LUjddSI/N1Prds
 SBmbMld0Iovf67VBTFvDuWe0zf/wqmBeZrSoFMhyCjgKIg9ZT4OWoopmRDtjQa2L
 iiTUPTUlZDdMvUv8e2w5KIjzK+pV4kIuj5pGZDDEDp9MRVcFSmFgHFmhOZwVySZ8
 j0+r2l/8Y2HdNaRylUgMmvDXDXwx2KwnKDhP3/sBaCYqlhhUIIHy4H6hhWzjwxi0
 uhG58xkkSChyzk66l0iiFgkzBG/CnBoVoUeffCNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BTFEW2
 YB+xCxRLmVxsqpo5am8ZrxgHR3dxBUSRqIfLA=; b=nZ8jUTlh4ihvujiFVst4qE
 CQp7gU9Uc5ON2SjxFrBCrOQimNoE0uLdFZXEcONWcJWoNlU43NhQrjSM9hvASM4d
 ZE4AgJt/05ENcpZ6NdB2fysZsJOgXVrX3RPEWJMLwH4neIUxUlgNZV9ViaqZOIhk
 MsCZQfz9DqMNIOblgzw7Wv9CRvKUgqjtfpvg9TB7LXWN65TWJcBPDF823JJauMCV
 XOZ/u4wsG6NsK0YGtbLc1UQt08GSa5SNl63sZ3fn7SvtSaSyWzIRGaFnCU2WxaCb
 PGY8QbgX0Ot/QHQVRaQXFFxeOPycapV0YP3Uq3ObTDDZrbKDSbiV+68QciwXzKWg
 ==
X-ME-Sender: <xms:JdZBYioHEnUwUGqbt3Limtzg5c9WZCoRJZK3Cg9zCKghw3-cCiEkzQ>
 <xme:JdZBYgrlylmjwupcRf-0SDajUvuGHbToQhy-AQamWIvQqfpSG5FpuTteZHDCBQuXZ
 -yGLjey9HZwNl67Rgs>
X-ME-Received: <xmr:JdZBYnPZwk2oJDPpyERdftESUAaII5iwvIAtcPQRxsTZSPzQS6znSNFoAGmw5UoPT2wuL2JWyInkSKKDYUheAvzFzQ-tWUpDA3Z-1hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JdZBYh5UO6A58TWTykLwL_NMQr18rMhIltSLBmIQA3_FF8hIkmB0mw>
 <xmx:JdZBYh6JwVL-s7pKPidR_xjWre7x8zhN8_FfW_gmKCbUlAxgyQaIHg>
 <xmx:JdZBYhjyJgrK3P5FT6i8Mj3JdLuX3HR_vhSRf9JUywKRDT-FiPrUew>
 <xmx:JdZBYk1-I8T49sMZFqn-9k1z5PyR7INMXBvTg3txlJjZ-OUmfWJeNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
Date: Mon, 28 Mar 2022 17:36:55 +0200
Message-Id: <20220328153659.2382206-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>
References: <20220328153659.2382206-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TXP_VSTART_AT_EOF will generate a second VSTART signal to the HVS.
However, the HVS waits for VSTART to enable the FIFO and will thus start
filling the FIFO before the start of the frame.

This leads to corruption at the beginning of the first frame, and
content from the previous frame at the beginning of the next frames.

Since one VSTART is enough, let's get rid of it.

Fixes: 008095e065a8 ("drm/vc4: Add support for the transposer block")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9809ca3e2945..ace2d03649ba 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -298,7 +298,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	if (WARN_ON(i == ARRAY_SIZE(drm_fmts)))
 		return;
 
-	ctrl = TXP_GO | TXP_VSTART_AT_EOF | TXP_EI |
+	ctrl = TXP_GO | TXP_EI |
 	       VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
 	       VC4_SET_FIELD(txp_fmts[i], TXP_FORMAT);
 
-- 
2.35.1

