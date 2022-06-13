Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F45485D3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E38110E83D;
	Mon, 13 Jun 2022 14:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBE410E83F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 161E7320091E;
 Mon, 13 Jun 2022 10:49:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jun 2022 10:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131747; x=1655218147; bh=IY
 auWIovMH1CpzdoSYKgGR+xLOqJC8GQzOesXUCDqrk=; b=iiJIGX0BzLpJHKgbCR
 qJDgQS7tPeBRbJE/uW9a2ilcI+HhAxKmuTZ60hRxJDB+bp7E6de8ltthqCHk0zP/
 5e46pymK+E6be7joq1tQcO4LnLol11iKr/lVsaFPP4V5AekEgAFqu34RWBD2HDYZ
 YZwlI+oaV/lTPMkj8zq7R6grqfutOu4iPe/JxisDOyg+Gv0lhlKgVoDV3qdl5YEC
 VsBJ7numtGz+mzFOQUo/hqeLl8MRbRHI2momOrxjU0moyqJ8+0E72QHP+fywWJWB
 cuJPe/16GPNXnIkI5y2fc6uv2mEDFVlnVjZMYJOoGe3gRDTd/rA/TmVmVhVpAKnH
 RVmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131747; x=1655218147; bh=IYauWIovMH1Cp
 zdoSYKgGR+xLOqJC8GQzOesXUCDqrk=; b=AC8oTTuBB6Pn1MtIOy88B/pVVAozU
 vtJjZnAbZa8H6dZpimXYmcUYw4+atHPi0stGrxecTXRCe50bDXQg0kdbPSQzrC5j
 cwSrgUWcglOckx7U0jsVzuNf9T32TGtLup5dKzAW65DSnDYh7JMcMfsXiUPz5JDD
 Qujy34e0W8mRv0FVc2eWSa6UPfyH6QA0fXhmHZfpq1ni23+uX8rTH3pFITSAuHuq
 /KOLrf8xKs0cGa2WmPVmBzmkwzvQA1SS3Lp0xAufba/B2jWTbapaXejqwRHQ4Rkm
 CR17ax/KItsLV3y2EdX5plcJX4x4MKlIA4Pn5JsQLiWjwK8LrZQweqvzA==
X-ME-Sender: <xms:Y06nYstBkmUsPu9KvOsylo0jZcinyI0G3vU8ANyd1tp_t3jibtoDqQ>
 <xme:Y06nYpeBfJ-3vd_F8L1rWRPhLaBJwQWK2Hq7pUeuo9Kv9EXn9wWrdNM562ztZ_khV
 bp0JtQH4tc2obn9IGQ>
X-ME-Received: <xmr:Y06nYnwvBSWG3ojWpaN_g_A-Cnr39oYQEswe0aWlZjv9JNXVcmCpxSwdVh0NXeufVtHkTnJTsUCUSjPDv4SsAXY5VxB4K_0YuHyzX7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Y06nYvMLEv-cM-XuplD0lYvZtAgAdN727liMN3iOPAI_it4vjqxaWg>
 <xmx:Y06nYs8ss8uQr3bNqj3epFEoXMK6FM31TaT-ZVUxON-3_xkVauK82g>
 <xmx:Y06nYnWqRgcMLB3ksolJEU957lIa9mGWH5jrYRPXgD3ArO5O5T9gcQ>
 <xmx:Y06nYrkq6TroJJEl55mH8G7KI-SHTpalwzsmF3WBl3GuWJOw7mqkgw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 20/33] drm/vc4: hdmi: Avoid full hdmi audio fifo writes
Date: Mon, 13 Jun 2022 16:47:47 +0200
Message-Id: <20220613144800.326124-21-maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

We are getting occasional VC4_HD_MAI_CTL_ERRORF in
HDMI_MAI_CTL which seem to correspond with audio dropouts.

Reduce the threshold where we deassert DREQ to avoid the fifo
overfilling

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4b73b4fea7ec..53cc0b7b664c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1955,10 +1955,10 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 
 	/* Set the MAI threshold */
 	HDMI_WRITE(HDMI_MAI_THR,
-		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
-		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
-		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQHIGH) |
-		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQLOW));
+		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICHIGH) |
+		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICLOW) |
+		   VC4_SET_FIELD(0x06, VC4_HD_MAI_THR_DREQHIGH) |
+		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.36.1

