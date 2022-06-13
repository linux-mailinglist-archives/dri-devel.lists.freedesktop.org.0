Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B55485DA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945F10E857;
	Mon, 13 Jun 2022 14:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF20E10E85D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 87DAD320090B;
 Mon, 13 Jun 2022 10:49:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131769; x=1655218169; bh=Nx
 CMaEsUwF5H/ajqcOEVyCVY11jdJAnFXAmZl2Ra3s4=; b=OAf4GZ/suNJPFRnmpX
 Sht+c7yQ6a8v8GOgLViN1zqtg9jgd63I+RWoMZu6mvivaFM46KnmWiREgMgD+xae
 WDgPM+LifZ0eS/WAIoNXCCRvMCq9O6mJipV9pEuluWL05XXEJZMTRGGldMbq6n7k
 93jRqoaNLiQ/gEoW0CR+JwMxkdhw5WlR1sPP1+xO0ghh5FWK+vvMEUkjg96nLdPj
 eLWc5s7p3+07b/QF0DC6Oufu+IQl58oALN48kxdnboCXt8SMPx6kjixi8saTnnhd
 yB2ZmdeMRz66ME4YpWsbMZddLEKaYagmQe4D2SH1SoX/+oj0K4tXwW1ohpJWvnFc
 2kaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131769; x=1655218169; bh=NxCMaEsUwF5H/
 ajqcOEVyCVY11jdJAnFXAmZl2Ra3s4=; b=WxG9Cb/1e6mMpe2afwC/IlfAFZLQL
 UtA6mqG0JyMdXMisUi6K0Ypqaxllg51+nHKaX/nywRcKbfrzRarkozOgspQlJYUJ
 f/F9i/1CE3exmfkVyb48UJD6m8WZ8PCDOh3TVnkzrUubp/D4NAioURF5FnNf7086
 C7p08hOzWD3oA1BZvGubAaE6QnDsVYUgMbw4vb9xAonpGvsTJWYy6KuJr0AL8xgA
 Qfa+fhpOME/wD5XnOh7gr557QHvhskB4pSa9gT2+pOeMqXeHvq59Bo93FkCLldiz
 dRLovsb91CVUd0JEg+TU5fm9M0ZJVng3zbD/jBS3z0U0jrMHu2JX4fS9w==
X-ME-Sender: <xms:eE6nYgQ2naf0lFpyddwW_SEpxvfhDXeS0FbXNSAioPf4SAo74lAmMg>
 <xme:eE6nYtyzHSh19j8COa7vG7rNrHnfd7wrsSVrdd112GD22uP4arCTw3DNyQTQsY2H0
 SlD585JfYgstUD9_vg>
X-ME-Received: <xmr:eE6nYt2UbVKfBOb5xouKLbhj_EpWZ2vU4e8uhrT2PWC2OutgvoTXmBY5ZVPuikHqnlaieGXQmpPASvBnj4FfHamESmi8uYP81gVj4WU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eE6nYkBcBrPP15_OR9C3p_5Wv6GFN4roaKLVk6I_ANktmmftYcG8cg>
 <xmx:eE6nYpiL2rdkgb4qel1D_Ds292mPRGsNLNC2oCMB16MK8AQFKAJAYQ>
 <xmx:eE6nYgqcfqLddDHo44DISW8LkxsIj0eebSh_7uPNWkuAZUqBGdyUSQ>
 <xmx:eU6nYnYZw5bgrwJjKMFfaihjyGOPYTqE2mkp7tvhdgR_RjjzPwFEWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 27/33] drm/vc4: hdmi: Add HDMI format detection registers to
 register list
Date: Mon, 13 Jun 2022 16:47:54 +0200
Message-Id: <20220613144800.326124-28-maxime@cerno.tech>
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

The block can detect what the incoming image timings are for
debug purposes. Add them to the list of registers understood
by the driver to allow easy dumping of the values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 0198de96c7b2..5a56761e75af 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -128,6 +128,16 @@ enum vc4_hdmi_field {
 	HDMI_VERTB1,
 	HDMI_VID_CTL,
 	HDMI_MISC_CONTROL,
+	HDMI_FORMAT_DET_1,
+	HDMI_FORMAT_DET_2,
+	HDMI_FORMAT_DET_3,
+	HDMI_FORMAT_DET_4,
+	HDMI_FORMAT_DET_5,
+	HDMI_FORMAT_DET_6,
+	HDMI_FORMAT_DET_7,
+	HDMI_FORMAT_DET_8,
+	HDMI_FORMAT_DET_9,
+	HDMI_FORMAT_DET_10,
 };
 
 struct vc4_hdmi_register {
@@ -241,6 +251,16 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_MISC_CONTROL, 0x100),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_1, 0x134),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_2, 0x138),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_3, 0x13c),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_4, 0x140),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_5, 0x144),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_6, 0x148),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_7, 0x14c),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_8, 0x150),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_9, 0x154),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_10, 0x158),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
@@ -324,6 +344,16 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_MISC_CONTROL, 0x100),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_1, 0x134),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_2, 0x138),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_3, 0x13c),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_4, 0x140),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_5, 0x144),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_6, 0x148),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_7, 0x14c),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_8, 0x150),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_9, 0x154),
+	VC4_HDMI_REG(HDMI_FORMAT_DET_10, 0x158),
 	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
-- 
2.36.1

