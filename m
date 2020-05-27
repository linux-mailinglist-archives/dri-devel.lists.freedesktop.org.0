Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A621E59D7
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6496E492;
	Thu, 28 May 2020 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA456E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 318E05820A4;
 Wed, 27 May 2020 11:50:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VKidWh/xRLUFk
 +z0aZ3qSdUJ5qwcVhi/4K7wFX4ohRw=; b=Lab361bwp8weaCdvQ1Vw2hzig+xSy
 3dpMfc31fNL5pzV5n/gH2Ys4CN1YiPklGiVtvsws+N/QUKhAjc1jcMYIRGgYydVH
 Rch9j0M4Fsf0JNVLkBFJ7z/utJdFK4DyMyyc5sVq2pMQlVQGdAWEnJKA3fiFhgkl
 si9HBDY06GYAIcgGW4x0JkpA1JyGK+DXWJ1kpOeg44LTYcWqU/DIYZP9v2YuNOvJ
 wjxSPNQK1RBnZcv72YbBb1/HNnMomD4GrpRahMz4d6THgym4+vq5serQWIt7D/ai
 GrNxeONND4SKkD6LXx/1pcMTpSk29lA3DVUmaF+yHDME2Lssrqui+TsvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VKidWh/xRLUFk+z0aZ3qSdUJ5qwcVhi/4K7wFX4ohRw=; b=K257Z5g/
 CApKwqzjdOKRmulXPeNFjZi8NZjj5biiX7HC/FzdcgFFIpCyvjSFJZJK0c/YFbxM
 rBby5VyUiJD5i/6LHhajeuiZ08zuzSlwkBoi2YX5ZectZU6I7zvrVuMWia7n7pbh
 dFZfsxrSyc7FvmfEQPZ6D2C6bpFx0FX3cWg1gQlyBauUQql8PwzaLxc1p4Kle+68
 SeJer/sBc+KOhO6sEmiOtdW846mjD5Xofm0ko2r4bRyQAkjFtHFi4+ZFUzffoOtW
 fUEUqhjmr0QD27ufqKVwgZmqbMttLY2YzH3eTnvxXP+1Iqsk0SWGuXt5PrClmacz
 oLS840lOc1r7Yg==
X-ME-Sender: <xms:TozOXvVegG84VuxgC_Az_ZtNewWWL32HiKyShXtJf4Mgq_Ayeniywg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TozOXnmoyhYaoz41JMzjytFh-QDk_ICckmqqJybj08wzoniY2vL_ig>
 <xmx:TozOXrbJkvyvuI8AoSrdV2I2yuyyUvU_R5oRvlHCT08rYUEgrxAYsA>
 <xmx:TozOXqXSZHjK9QOUpFxIpXXHZEn-oPs43I0cxkI7nshcBL8KJHiT2A>
 <xmx:TozOXvVCAwjVHFUvJOH10CsI5G-8945LCchadQmgNrQqBjPXnbjcKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C73F030618B7;
 Wed, 27 May 2020 11:50:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 051/105] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
Date: Wed, 27 May 2020 17:48:21 +0200
Message-Id: <5935e1b778ec330216a0143646746f9d3b18bfd9.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

In order to avoid pixels getting stuck in the (unflushable) FIFO between
the HVS and the PV, we need to add some delay after disabling the PV output
and before disabling the HDMI controller. 20ms seems to be good enough so
let's use that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b3721bce7c81..dee8dc7b9409 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -401,6 +401,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
 	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
+	mdelay(20);
+
 	if (vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
