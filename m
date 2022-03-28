Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B34E9B39
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206AB10ED59;
	Mon, 28 Mar 2022 15:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBEE10ED59
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EA8BC3200A5F;
 Mon, 28 Mar 2022 11:37:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 28 Mar 2022 11:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=HeWZMZV7YWSB9UD5tWEwMdQMCutJq2
 dNgN87GLp4bVk=; b=etqrf8Oimjwjfze/+XAh5lch38L6ofGfVMsSir+iPrsV5M
 sLBEkPPEeKzSByp94YfgvEsczMSziw0wK/MndpTcVNayEyBwsK684ZC9xwbgRihl
 n9KccBU4JXaRG89Lg85CMYEtckfPJmhNTnsZPEDF8PHv5aHYxG2H7c5DjzPhSMYS
 V41YfU051a9fvF2SZMIrGCYIEaccmFrQ9OIIAQHg6EY+pTD0WzRvma5gnT5KegNp
 gsAantSFTJ+hHbiIRr0zlutveHwCLSjk658atv4S8l96LR8f4dwDi8ygGmO16+2b
 MLFCO6QXbmmmZ0mNNOg/tkpKthukpy+jpJUHF5pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HeWZMZ
 V7YWSB9UD5tWEwMdQMCutJq2dNgN87GLp4bVk=; b=nT89bYeCc2o/2OFgI6FG9e
 C33ccMclEH9LOt1EUnKgPxbYzWIVs/ErAdCpCWxpqTpOjcBQNQdkpqu5Zb8Kz1EN
 AbRESy7FvEJ2we+KwJQtNyLx5669tFFRkh3Mff6oOgRyT3iQnugEfFWmoGdQQbVp
 G/AhkcYoCtu/2dEh1hDKsLABchhAG8NjmIJ2O44QkumHspL/J9mF6uwK6uOCJghg
 pu0j85T8Feip4f9cyFnsziBq8FMnSdnAn7m+P8uyuObzu2eOpF29R1/AH5HIB80g
 NuLDOJMrpNLcmOiDkdy8MBmpPRt3NeIsad4H0JerccChCa80mxf0LoaXMhY3avlQ
 ==
X-ME-Sender: <xms:K9ZBYqAXYnCEJy-lioTCop6Cvcz4YZ70cTXpCvH8vdgxBZV7tDxyag>
 <xme:K9ZBYkjrc8py0wbn3pHv0whrgjl025xHwWuizrhv0frW1eXIXMAeCdJGBj9c-3e3F
 I9W82krAfS0ssqC1Aw>
X-ME-Received: <xmr:K9ZBYtk1fqYoBKy6B8qocF0F39dI5SEnULNtbk1wjOuZMJnSgKEre2DSq8eIWqBUIItsS7bTOY34fj60vgqC2PdliZ3zBmrBhE7qlM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K9ZBYoxPDV_F2EbQojDFUKQaufCjifqnsaTMjDQsHYsRxLTQrM-Ldw>
 <xmx:K9ZBYvRqdmfZLjwl8CkQ2lnQlx7rjaTWjkV9aZC3eqyNo4_bEH4U5w>
 <xmx:K9ZBYjZeWSOZiv_Gz0h1KVpdbixX85SrCaCliXffJdsTK0GWCMFH_A>
 <xmx:K9ZBYtMNY4F9_SWeiH-mbAY2KgPuV7ZKVIh_QjLqKBBFMSdgB4s6Jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/vc4: kms: Store channel in local variable
Date: Mon, 28 Mar 2022 17:36:57 +0200
Message-Id: <20220328153659.2382206-5-maxime@cerno.tech>
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

We use the channel from our vc4_crtc_state structure in multiple places,
let's store it in a local variable to make it cleaner.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..94c58ec37a27 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -279,13 +279,14 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+		unsigned int channel = vc4_state->assigned_channel;
 
 		if (!vc4_state->update_muxing)
 			continue;
 
 		switch (vc4_crtc->data->hvs_output) {
 		case 2:
-			mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
+			mux = (channel == 2) ? 0 : 1;
 			reg = HVS_READ(SCALER_DISPECTRL);
 			HVS_WRITE(SCALER_DISPECTRL,
 				  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
@@ -293,10 +294,10 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 			break;
 
 		case 3:
-			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+			if (channel == VC4_HVS_CHANNEL_DISABLED)
 				mux = 3;
 			else
-				mux = vc4_state->assigned_channel;
+				mux = channel;
 
 			reg = HVS_READ(SCALER_DISPCTRL);
 			HVS_WRITE(SCALER_DISPCTRL,
@@ -305,10 +306,10 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 			break;
 
 		case 4:
-			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+			if (channel == VC4_HVS_CHANNEL_DISABLED)
 				mux = 3;
 			else
-				mux = vc4_state->assigned_channel;
+				mux = channel;
 
 			reg = HVS_READ(SCALER_DISPEOLN);
 			HVS_WRITE(SCALER_DISPEOLN,
@@ -318,10 +319,10 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 			break;
 
 		case 5:
-			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+			if (channel == VC4_HVS_CHANNEL_DISABLED)
 				mux = 3;
 			else
-				mux = vc4_state->assigned_channel;
+				mux = channel;
 
 			reg = HVS_READ(SCALER_DISPDITHER);
 			HVS_WRITE(SCALER_DISPDITHER,
-- 
2.35.1

