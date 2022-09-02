Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D338B5AB3DC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 16:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041F310E86A;
	Fri,  2 Sep 2022 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8A10E86A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 14:41:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1C5823200313;
 Fri,  2 Sep 2022 10:41:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 02 Sep 2022 10:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1662129680; x=1662216080; bh=V79XIBbN5ZlkY3vpb8X8YftJB
 lDY1adx/yzMimmUV7A=; b=frVJRnpX6E+UKhgt2RvtGYm1wD6MXgqlslQIzATky
 yYfQG8c0Y+BvldLD6PaBx8U3MKfggH4SjoMWwlUcWRabfHm2oyavZtQa0UGI6igt
 a7xSf5+5ZDUiYrZQjTAWbnPlnWoHzWLzT5dIgBcUKdvZ/Spfhrt1pc0qmfCA7534
 9VimL8o30cUmrE/2LXJNFK21L+D3Wa8S2mBxKAtUGuWOXtwts5ykSztAfEjoIF9O
 GNDsiFjoGtxf5UEdc7VloqQQMvgrjiZb+WdR63OCn3tYFwLLtviQb2RFXwl581Lu
 aCjjgCKoqKwNr4hZDo0NgeFifxxdzRvVd/CK6Ciig2N/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1662129680; x=1662216080; bh=V79XIBbN5ZlkY3vpb8X8YftJBlDY1adx/yz
 MimmUV7A=; b=i8X0HfUWzJDpeZj9zmunD6nsHju2zbiPSyQ/HVn/bQXp+9PzVFJ
 prHfajiTwkjBJ89ItO496vkTsFSVpy7MUhbQgEmpCJTUkh33qkv5HCyKhrU1iLEo
 4r7ShnBPqZPrNsTvUnPwfzsI39jf+XPnzT78EPKO9hPx7Uvp8xKCzJptRrjBARrw
 ayCgcv6JbTwScCLohRc3kR9ucKz1twyfvCge+h8tLCWfxNdR7htBHf1BSclw6ror
 mXoS6HsYYuC20Xftzw4njYa1HCwF3ndhpo2DQaWX3Ld1/3LG8irx4YFkldN+5Fd+
 c8uWVJJlPmIRtdbd6lv4/K8XjMzMkL26ytQ==
X-ME-Sender: <xms:EBYSY8QMV59XQbnm8Yu6y6T9h8GAxI689OI3VUeKJZHeKynI3-689A>
 <xme:EBYSY5yjLhK9V6cP8TeWcGfBM0Lyr96ClVlLxCsOZZz7ZZveIyE_FNwOQz7_bzYMA
 _x65hWZbhZeKIqIQRI>
X-ME-Received: <xmr:EBYSY50pCrhckiRg8BP4ZdNqEJ4M7q4Iqcpe9b5MHnTTyAVQpT-c0k_SrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EBYSYwAyVkW9vCe_t0BIVLM7MyMss8ZUksR0nNTl6gxYtcBLvH5AxQ>
 <xmx:EBYSY1gO40oe9SM5V_qTwW7PnjKAjt8oPJ3biP8ero-ftakN5iTzdw>
 <xmx:EBYSY8rHlutFrU4alJ3e2G9WaojiuGLiRkJZGkgGKBGzumZRDkEzyQ>
 <xmx:EBYSY1f2G8b3X6AtEt3gTRElitazv81k9-Dcsn73OZRrubTRqCVmxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 10:41:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: Add module dependency on hdmi-codec
Date: Fri,  2 Sep 2022 16:41:11 +0200
Message-Id: <20220902144111.3424560-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
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

The VC4 HDMI controller driver relies on the HDMI codec ASoC driver. In
order to set it up properly, in vc4_hdmi_audio_init(), our HDMI driver
will register a device matching the HDMI codec driver, and then register
an ASoC card using that codec.

However, if vc4 is compiled as a module, chances are that the hdmi-codec
driver will be too. In such a case, the module loader will have a very
narrow window to load the module between the device registration and the
card registration.

If it fails to load the module in time, the card registration will fail
with EPROBE_DEFER, and we'll abort the audio initialisation,
unregistering the HDMI codec device in the process.

The next time the bind callback will be run, it's likely that we end up
missing that window again, effectively preventing vc4 to probe entirely.

In order to prevent this, we can create a soft dependency of the vc4
driver on the HDMI codec one so that we're sure the HDMI codec will be
loaded before the VC4 module is, and thus we'll never end up in the
previous situation.

Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index ffbbb454c9e8..2027063fdc30 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -490,6 +490,7 @@ module_init(vc4_drm_register);
 module_exit(vc4_drm_unregister);
 
 MODULE_ALIAS("platform:vc4-drm");
+MODULE_SOFTDEP("pre: snd-soc-hdmi-codec");
 MODULE_DESCRIPTION("Broadcom VC4 DRM Driver");
 MODULE_AUTHOR("Eric Anholt <eric@anholt.net>");
 MODULE_LICENSE("GPL v2");
-- 
2.37.1

