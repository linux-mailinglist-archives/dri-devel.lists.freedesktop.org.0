Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8E4E9B3B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341C10ED5C;
	Mon, 28 Mar 2022 15:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4310ED56
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D23CB3201D6A;
 Mon, 28 Mar 2022 11:37:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Mar 2022 11:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=aRj7R2VhiIgaiD2UBFLybxeMRT+npl
 uoNaYpxkTYKGQ=; b=ZAO5ZNQhXToJ/Pb/O54MOsyI+vJyLBKK5+KOQGZNm15d1i
 yrQj1fq4zERHQyrzEb6TrkhW9AsjWx+y7VgkTD/4nRaGRBqzIiKbVNlFdkveCoGX
 hgJ0554Gkig9Kf+36Kq6tyi6lxo1JRRs48haysFD1Pph1g5HCRi0JmnkxWiZSXBr
 ue1Ja0tdnPpPEK2PFHdAad6J4Q+50SLcJYfJeB9AHwdjGsffWQrM/G45W4II/V5/
 Pc58rvZThsU5+4jOZuCJ4vCdSnNtSrMfPkGMMxjMpWbX/pfnkPmIxvxn9CjsPgRp
 6thQpE1kwXLRkSnfV3UwI004y7PNPfJPvkgsE+lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aRj7R2
 VhiIgaiD2UBFLybxeMRT+npluoNaYpxkTYKGQ=; b=dfm1NYEljzp32dv5V7tp3z
 eNSfcY3oMv3R3SA+Zrz56TKaMOR8GwrUJL6RB2ol3yPRQHUxYDy+ghaLhjJAmVQN
 3N7T95wrjnq+ccqfnDFtYFlHWgvbqCD6vCYbnLTDPzh0s3YcnT++mbjt6Eb9tg7d
 7XkvlGfUktV244j/PImyLnz1K+hP5KhdNVqIraz0EyttKqKZlCABR3a+WTR8HTLG
 4F/WnZb6b+TCGn7+FLVePZnwVe7PwPOCGCjvFJWaQfLLrSzeuMDjD7xbdtIQvre5
 KePYWulDrPFCRuHpnEUzC3ATpNpznoQ1p5+yRngXs56PDh3obcB0OQJXqzhUInmw
 ==
X-ME-Sender: <xms:LtZBYmYihn6Aybho7ih4-nk6BK_2sHrsQXDdJ6RnoMy9Bpu9-WUayw>
 <xme:LtZBYpZlAtR_DaOI3uaYe_2Vp_BRZDuZnTBDOrcutS57e3noE_EFfKkCq2esJfk1N
 Zbyq_MVTh_LJqcihBI>
X-ME-Received: <xmr:LtZBYg9d8h2pDoSjhloNcJYRF1dScon-DvpKjy-VuGrg9mVRCfPbrcn7gU6OYfTAV34fYGaWPTl7JK_gOPKt5icdFm7HDiiTYtTpDow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LtZBYoqFhJAazIuBHXm8TJBkzkJ4ymjNIkGs-hT1YMJHzrnhXOTR5g>
 <xmx:LtZBYhqc4pvxDKtLxUGQHl8dQooeHdMdDEVG4Pk6V4ASuALLzMzKHg>
 <xmx:LtZBYmRvmuzjyKr_KlNa5Amofv6m7wGMaLgkIMx0_NL1jsjJlaoz2A>
 <xmx:LtZBYilvSiI1NqxuthxRHU4njNzfEFfLYS9HPUSrir80DHvQCWHsog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/vc4: kms: Warn if we have an incompatible muxing setup
Date: Mon, 28 Mar 2022 17:36:58 +0200
Message-Id: <20220328153659.2382206-6-maxime@cerno.tech>
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

The documentation explicitly states we must prevent the output
2 and 3 from feeding from the same HVS channel.

Let's add a warning to make some noise if we ever find ourselves in such
a case.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 94c58ec37a27..d94f78eac936 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -286,6 +286,9 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 
 		switch (vc4_crtc->data->hvs_output) {
 		case 2:
+			WARN_ON(VC4_GET_FIELD(HVS_READ(SCALER_DISPCTRL),
+					      SCALER_DISPCTRL_DSP3_MUX) == channel);
+
 			mux = (channel == 2) ? 0 : 1;
 			reg = HVS_READ(SCALER_DISPECTRL);
 			HVS_WRITE(SCALER_DISPECTRL,
-- 
2.35.1

