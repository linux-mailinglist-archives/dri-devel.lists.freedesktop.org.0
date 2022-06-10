Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF654625F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C8F12B563;
	Fri, 10 Jun 2022 09:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E620F11B30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 46B2E5C0081;
 Fri, 10 Jun 2022 05:30:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853451; x=1654939851; bh=lF
 mS8uy0BgvHMzEs2yghKwIjuJ5pKcTYfwxL1FLXKp8=; b=c4Um/bZZEqKan+Gljh
 yKo+S2U+1TsK1zpiUtTq+tP+hEmad2+oyxmW8yjTPyYiIp/LbZ3FfrRpLb10cuZc
 iQCnNv2STyq9/IDxGv1tuf+M1kv89Pf1lI2M1wR/kCePoS30YR1sJ8VpcigREZAR
 BBqdJuy7CuK0yalBLVVw/fAxFtgRW6wJIFdyiHD62LoTFuQtAaecmgHWcj+yvnpV
 7Pb6BmWULuAeVUfebwGGRh0HjxquoL1EhBa1QNbX32X/Cw7tg83fXjGy4rgvmG6n
 LMMD9dbHeZRGfdAEW06VE63u4NwNW8clpJ/mMUQDUnGkW7iRvNKuuyctEvimhnVE
 Lfjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853451; x=1654939851; bh=lFmS8uy0BgvHM
 zEs2yghKwIjuJ5pKcTYfwxL1FLXKp8=; b=kMSS4L3+lOrcdzcd+ufFw6OCiGKD/
 JP690lYeb7yYr08MeeJ8JQ9r2jzaXSVJDrcOz37DTuKyt8ICNpPkKExlyReERW6F
 UYtglshIiiK+/3dTij9+P7NS+IIwGS1/PhNepojXRNUosifJwg7e6UVJX/+BJy3N
 1VeSUmHgzX3AvxYOT5DBGejWtKzuFaUYyYTMCCCVd2e6Sms67OyPNxoSNYqcYqqC
 e0wAe0R2ezNbPRIEqgCFLb2r9Nmy5mDo2l1LKp13YQA8nZvo38Z31UDK22fLIVaB
 LfPp/sdkwRIBAjJB/6VJEQhxeUzSEZNQ8v7T/DUfkRXW33rwvRANkZqZA==
X-ME-Sender: <xms:Sw-jYrCHYKVoCSqbozCwc2fAeOoJVzCGr-VPOOo3aN5mNBuEqihINA>
 <xme:Sw-jYhgCOCLLSUgmRjBwzl-LAhs6GV3ZTl-naMRiPiAPRgNOLEQIH-2uGUEFjI94S
 Pdv6RLPww41UKv6qAE>
X-ME-Received: <xmr:Sw-jYmnMOpkoIEJswTSbi0LUU9laUflSEO11I1b5ArCcwIla-ydIQn9HgUgR7o4mtvL7LU6yPcOihkCsku0HwlfKsdX8A57rw0B7ezw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Sw-jYtzKXtW-qP0WeGonEctzXhmCFeW6mtrFbdDBCa7xJ4pLTBWcFw>
 <xmx:Sw-jYgTMsQpm-Bz9UyeB2OJEsQqcqkU8MucCDkVLSJYnejM13VMSOQ>
 <xmx:Sw-jYgYSllfmLXvT5R2OHbeU63a6s5rCaIKhADy-y4U2Hkuj9WIbUQ>
 <xmx:Sw-jYmPfUKE_zzc37CcBJ5d8PQ4F6cwxZAnnUsVnTahfBWs-0nY37Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 47/64] drm/vc4: txp: Switch to drmm_kzalloc
Date: Fri, 10 Jun 2022 11:29:07 +0200
Message-Id: <20220610092924.754942-48-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most like source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 51ac01838093..6a16b2798724 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -477,7 +477,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (irq < 0)
 		return irq;
 
-	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
 	vc4_crtc = &txp->base;
-- 
2.36.1

