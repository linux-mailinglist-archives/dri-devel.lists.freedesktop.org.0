Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B336F5485D9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0EE10E84A;
	Mon, 13 Jun 2022 14:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BDE10E84F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 87291320090B;
 Mon, 13 Jun 2022 10:49:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jun 2022 10:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131766; x=1655218166; bh=T0
 O+8P2w4AnMcUejarwwXq0/JstNCXpF5NdjzLRAKuo=; b=jgs2B8jGS4yc5BWgcz
 IeTd/zCBZn+xT/WMju30DhXr9Sqth3O7g5xpGvpjTl0S0mpHuQLwS0FKBJyqUUK5
 xwl5FF1FyFuXeoa7U5oaTrTBCGe1jWRVg9KAnUGF1KcCK6t+FS9ALcfzoJc5RT1f
 xfsVdRdHpXnKPdUWwDqg/AWeaAla0g20NDGkIcY1mB2t0JmBryqItsazmqUuYLZO
 2LQcgrTyyAf2gyosk6nGH6CZmW8tXa6jMJ/MSO10t8fWHwcBE6+5f93pHQ3IG2XR
 tIc6Gw+dW9XqMEItoTdB6MzdZPCjhV6ONSJfrLYJT1ljIYc14PkeroMqhyNK7z7O
 jZjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131766; x=1655218166; bh=T0O+8P2w4AnMc
 UejarwwXq0/JstNCXpF5NdjzLRAKuo=; b=DlL/1D7nEw7wBt62QqIi2XNXRJ/2i
 N/ohbu6tASzna5w0zxHzc8Kv9XIflRERYsTpD2xy+scFZXEnKsiHCT/ipV1cH1rA
 CKLBjWIF9mAbyFVM+46uBOjgmWfpHxOez3ix0Rqa0H5v6Djk/RVFxvLeVyJnptXH
 QR9yiuRqtW1OdOuMLw4NRDTZQmTKOk+osgZ9WjZDsymRDG93HtTbi5keAixMosdM
 2n2Uikw+9owQ1DquhUOA8Kb28R1cCWqDwiGVMThf7miopnieOwut/g++89gPTTI1
 HO7/Jq7O6IuL+rGco3PIv2SoWwZMj1fNy9NARfeflT5Ol/3ILXoCLbcug==
X-ME-Sender: <xms:dU6nYrXKGmF6nIQVodY4IJ0vzDCfoboP5ECj7rpXg-Fl-Y-JBs_YNA>
 <xme:dU6nYjkJWYcIoM5e5zfrPrJXiXJHHa2SnDj5pz3SnUfo67dg-XxtnKsYYtRTIbXwf
 UxJdsMLlBK6O33Ny5o>
X-ME-Received: <xmr:dU6nYnZ7HoUitvotbSYg9jZQ1-3dQu1jrmaneCabL6Osb75DPnje5V2MP1CSkar8gzhDY_QAbkZ82Foab8h7AX88ohoqkYpjATf87dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dU6nYmUBknonNYPguIAbIlqUaWoNEsBfsj62bMjDHA7sgRL-BIqUyQ>
 <xmx:dU6nYlkay3hQ6BI0QvM_kvl2VzplYA4-oe3p3u-lhhGaKquaUR4zzw>
 <xmx:dU6nYjfKGOHuU9kak2LwdbDhoOFwQMEN99MBB_dPVqZUtjRiIq08yg>
 <xmx:dk6nYovFw3bRfV_I0CnPXY993Slo5OJxs-wplbyT3ZV6DGoRdKe8YA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 26/33] drm/vc4: hdmi: Remove
 VC4_HDMI_SCHEDULER_CONTROL_VERT_ALWAYS_KEEPOUT
Date: Mon, 13 Jun 2022 16:47:53 +0200
Message-Id: <20220613144800.326124-27-maxime@cerno.tech>
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

This bit ensures data island packets are never generated when disallowed
by HDCP. As no Pi boards support HDCP this is providing an unnecessary
restriction

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c62e32f68974..fd5ff2a9bd6c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1347,9 +1347,6 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 			  VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE));
-		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
-			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
-			   VC4_HDMI_SCHEDULER_CONTROL_VERT_ALWAYS_KEEPOUT);
 
 		HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 			   VC4_HDMI_RAM_PACKET_ENABLE);
-- 
2.36.1

