Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE94FB2FC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA9810EB7E;
	Mon, 11 Apr 2022 04:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED12C10EB66
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8AE303201E78;
 Mon, 11 Apr 2022 00:34:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Apr 2022 00:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651679; x=1649738079; bh=lm
 1CYL2crA76mqn8yhmfIaPwd9txmmkjx2Gv/gchVwA=; b=np6Nt/5VsPzzijoTdC
 55o1rTmMueDS5rokTb7//Z9moldP49kJK32dEUghyQ6Z4yfJU9Jk7Gscbcbn+gYA
 MiZtN6NGDYiMun6BBjIcsvwKQ/RKAGjmCQmdaflHZd24wB+Iu+f2vwyUa/7AKYZp
 q9fMofyp4l8XK6PV/MxbiwMtwHythlqlvrl+vXyxcVLZ8fc0kBjg5OM+KmEUcTJu
 oR+7nvocqXkWL/d+JKOCHoCp77uWT5bPUze4KS3pELN9anTgR28eFeP+aTEis6ES
 XhFgIrEMjmlN0pbznJxxoOkdHZorccFZwrszDoxr2ifIuAvigTOyE/DsL6aSQxPY
 6qDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651679; x=1649738079; bh=lm1CYL2crA76mqn8yhmfIaPwd9txmmkjx2G
 v/gchVwA=; b=NCFOaAIyhaLKstsTz4SH0wej+qlv1QngXha/KNRK2ScNcDEGtHN
 NXygq3jzFO+b8cLUSJhZz+umDI1mnZ9pnZgqA6KATiWXJXXOqW+D3ECxLiXEuEZd
 biLpCatdZBps5Br7tvrpqDXWWp+rny+nBRMxRW3yQJmPZUGOtxWQjl5Ippot0oBr
 LBwml0UyOH+rcH3h87hcR6yhiJEP2VRpO6F2BFtpQbRLOwA3LXJbfH4FBs1fM+25
 TR9EkqhHIgCACuVw3k3x7YSpnmnti/F3UaVkZPaImEGmxVZdGcVnzXQmDO1KhOtl
 4MJa+X5EOJEeuVc+1xOxYYD8ZjjLjbse+jA==
X-ME-Sender: <xms:369TYjcrlcVa4hGauUCawWuGJu9_65WIX3uxLH4k2ktiHNj3SyTNpg>
 <xme:369TYpPsAPYAUarpZ2yE5-JcKVo5WipLLn-bm0nm_gMCI9hmHVJSj9GyxuOGZILuW
 lmTEw7G-auSHz1B6w>
X-ME-Received: <xmr:369TYsgk1Rt2MYZQIrBmWxVaCWgP7TAw3yS7DmEgRQ6n02ePgfM07HqUnnWaQpMv4bYuk1-qX6XIMK_LdGPaUdHKDdRpebZEG20pjZqlPfQL2dDqpGL-44DACP8ecqG94zn0wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:369TYk_FD_am8tVwX9UvLsIygh_DZe7uQChMcdNu1phpRElu0WNxKA>
 <xmx:369TYvvAE5NCl1Aa3AUG_hH3OEPDt7xyu4D7mNPlSy61dmu4oUBzkg>
 <xmx:369TYjFJFXGI_LUoHo16HTlHDwJTBXAnRgZlZ2QM3rhkrL3d9PEBPw>
 <xmx:369TYjEKxKk-NEHV53uFP8X0cjlGj2_Kt1aOSbCX-peXU8LqQDERdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 04/10] drm/sun4i: Allow building the driver on RISC-V
Date: Sun, 10 Apr 2022 23:34:16 -0500
Message-Id: <20220411043423.37333-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411043423.37333-1-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allwinner D1 is a RISC-V SoC which contains a DE 2.0 engine. Let's
remove the dependency on a specific CPU architecture, so the driver can
be built wherever ARCH_SUNXI is selected.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index befc5a80222d..3a43c436c74a 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_SUN4I
 	tristate "DRM Support for Allwinner A10 Display Engine"
-	depends on DRM && (ARM || ARM64) && COMMON_CLK
+	depends on DRM && COMMON_CLK
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
-- 
2.35.1

