Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066F50D34F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B947310FCE1;
	Sun, 24 Apr 2022 16:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672B10FC55
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2454B5C0112;
 Sun, 24 Apr 2022 12:26:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 24 Apr 2022 12:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817605; x=1650904005; bh=rT
 me4gsdReTHZYq9dpsHcO27YtJUVs0qzpd+cDg5ggo=; b=X/W4BffVrrb4uhmupX
 KMuImLAYcAXWVPa4+JHnO2l5bgni6xi0Naf2JUh9GGkPjrwTVcDVFuUi6fE2t5UH
 jKoS3ryXDpXFNn9J7QKGZ4Qba0jfyrbAbstoN8YK1qY9Tvri3x34I1/6n/earTrC
 LLDwnwAiKF/5VRke1UBS3EP4/QGLP7XLqDQrYQgEP1xF9RtJIzACEB3HWn+JQ8ed
 sJkIQ6zubQp9ppr2nCy5Nuh/yJY/pUXD2hs0dVK1WRXuP1BNYk+BgaU0Ghje2OpN
 NzhNEgd6MuJ47dZgeJnLaJFMAgNLOtcvO40BmJiRiqgAL2lhYxpJvGWV7iMT5jIO
 3EXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817605; x=1650904005; bh=rTme4gsdReTHZYq9dpsHcO27YtJUVs0qzpd
 +cDg5ggo=; b=j7Drb/lCWwJXXD5l4Jyx4Y7FfpMB9Y6vP3Y7QJJk16tYXuZLfqs
 IF/fdrs2UDqvmA/SfH4O+o4nA9Zn+hoWI1gK8X1WNfuTlzhLpAtDeLsphMj+EKbG
 +4rphxQb3vPSGXLyxROXrsilJ9EKEWcae6RVJ5gLcdTNt7m+Q/KQ8Z7m3x0W1JJd
 jeaeewfTZNbOZ38NPPjJXCyVVnz43E6ay8svq2VfALKYodGXIP9P5DClb2R1CAuS
 xVLSW20g47gS/TFIN1S83Nv/zjnMQdf9CAurKprgbVXwjw4nGpWMEGHsH/xOs0q8
 4e6HB8TBWO7h1zj4L1i74Ue0TgLuk5VcEnQ==
X-ME-Sender: <xms:RHplYitNo_vUM8yZwoYITH1W8CWGFrGOoI4sAeU4jEkoobnJZwNnkQ>
 <xme:RHplYneZdpEbq3Vv6gfNykeYi2fNfoWY9JUAhcBBAm_iXRg2pY3RYVX5obZI7YdWO
 U2c8ti3JrOgGESrlA>
X-ME-Received: <xmr:RHplYtyZdCC1OZI3JMuhi5At75b3TnQSfdC5ijFEZBxmliGjF47MtQWA7t7csSbOqlDkY3G5lUEhgFv0c0o3JyozZFMNFZ5tWdTh1MHmklhDBeI9WSP6qX608XbXFSz8Ll9_Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:RXplYtOWlHd-pCJZsoIY9OO4geBjO3nwogXMW6gmqOcxID1tep-0pQ>
 <xmx:RXplYi-OjaowpabkYul5QczsmdN4sKrIugucd9hE8RrPZCnCbNOLzA>
 <xmx:RXplYlVgPiIw9WEEBOrmG6sQJh9-w_hHArW_cPAl82NPyg7tppZ-Zw>
 <xmx:RXplYlUysfPmI1fPevhBxj25yF44ocAaK_pjcMdBquAKNKR2OVyN1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:44 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 05/14] drm/sun4i: Allow building the driver on RISC-V
Date: Sun, 24 Apr 2022 11:26:23 -0500
Message-Id: <20220424162633.12369-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

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

