Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D33A9DC2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93CB6E5BF;
	Wed, 16 Jun 2021 14:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A160A6E5BF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 14:38:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id F3E85580513;
 Wed, 16 Jun 2021 10:38:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Jun 2021 10:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=3mKg5HgfAXpZqXEDCUSZED1jT0
 1rDmnAEWVimYdtwPU=; b=EVF3WFwbCCmrI9buKOFzG8k+uVsH8bDr7LTCZEPlPD
 LJDQRfgs+eIXPC33/o1S6MzwzknL7uCAx0muM80S9gRSeG2QEHrNkHKz5uyzgvEt
 j57ETqoHVhReb76rYAe8jRyppEP9RRaLozZ2ob99TF8hVt1O91uwUui+GOjA3YCX
 jJfB2RJNHQl14Q28iaWer2OYXdFEQcx9fQzew1lBI/qMXYMPymF5iXP4w8+AmYIl
 XTKAQSnSxhsfcPrCyY5Mf55ZdEEjHNxZkbB0EJfg+oBEoXaKjvbW/mICFu18qvPQ
 VTXoKtDxuu+9iG5aXFR8VNYUAHbQiSVliTFzLd3jxslQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3mKg5H
 gfAXpZqXEDCUSZED1jT01rDmnAEWVimYdtwPU=; b=hXccexH4YPtoYuKJSoMe5j
 MY9CFv+6zsawRx7sx6kXRAbo0bLzi1qIcajLXYPUN0wbcoZGgv1oPvB7ol773ERz
 1aBkgARy4oAfZmghZZM08PTZxaP5jQrEPQx3OylbfpetV9dbq3S9P8Pey2xvnPOQ
 z1k4PzcYjaATCOeLvjkrJX/qmemsUTsQzLN6gzQVQYI/3KzZACueL7zR2ZrGpVm/
 VtNbz0OfkunhHhKa+IyfULKf++OziRYeFZCUGEmlpbRut8aMyGRwlRNsx/97PFhD
 HNUm4LRVlcIdNHhiUuYVrSLz9l0YvVeiOBr5rwIKBXPupdLRh3JysmNQ31usAPTg
 ==
X-ME-Sender: <xms:9gzKYJnRU3xVKMCElegu_NgH1CNfMmK495RyiS370I1uGW_gS5X2Kw>
 <xme:9gzKYE3QAW2kzpMzemuIK4AfpIrg-pOSEpI7RRqd7xQo0wOPX4b72TFl_4i8uVzCX
 Q-PNUQiEv2XNNEWr1E>
X-ME-Received: <xmr:9gzKYPo2R8_0z3iPjTt-5GGk9JL98GYZBNsebJNCZEhrsGDYSXML17eOiDHhnFaWG5XclzaZ5jJfLj1MqkML0hqt9_QLM96zE6tz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeehvdfgueejgfefhfelfeejtdetuddvffdttefggfeftdfgffekleefjedvgeei
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9gzKYJlwEvzctuPYNAsRHFtsPLY6xg4yQvXciIxeZ9AbIJkZFN2-OA>
 <xmx:9gzKYH0rU5wWoGC_C_v3Qws7ChciEdAWZT119BdEsNT-RfJ4n8OTjQ>
 <xmx:9gzKYItunkZSJmCNKzn4f9iDfG_081LyccQpjIY06LOutbPX08PsgA>
 <xmx:-wzKYHacPWcIhWU1N9dUAkvqV7Ktq_t2KL0CCq0RbJMmjob6iATZZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 10:38:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Date: Wed, 16 Jun 2021 16:38:42 +0200
Message-Id: <20210616143842.632829-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 Edmund Dea <edmund.j.dea@intel.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Steven Price <steven.price@arm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Chen Feng <puck.chen@hisilicon.com>, Alison Wang <alison.wang@nxp.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Hans de Goede <hdegoede@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New KMS properties come with a bunch of requirements to avoid each
driver from running their own, inconsistent, set of properties,
eventually leading to issues like property conflicts, inconsistencies
between drivers and semantics, etc.

Let's document what we expect.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alison Wang <alison.wang@nxp.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simon Ser <contact@emersion.fr>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Zack Rusin <zackr@vmware.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v3:
  - Roll back to the v2
  - Add Simon and Pekka in Cc

Changes from v2:
  - Take into account the feedback from Laurent and Lidiu to no longer
    force generic properties, but prefix vendor-specific properties with
    the vendor name

Changes from v1:
  - Typos and wording reported by Daniel and Alex
---
 Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 87e5023e3f55..c28b464dd397 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -463,6 +463,25 @@ KMS Properties
 This section of the documentation is primarily aimed at user-space developers.
 For the driver APIs, see the other sections.
 
+Requirements
+------------
+
+KMS drivers might need to add extra properties to support new features.
+Each new property introduced in a driver need to meet a few
+requirements, in addition to the one mentioned above.:
+
+- It must be standardized, with some documentation to describe how the
+  property can be used.
+
+- It must provide a generic helper in the core code to register that
+  property on the object it attaches to.
+
+- Its content must be decoded by the core and provided in the object's
+  associated state structure. That includes anything drivers might want to
+  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for planes.
+
+- An IGT test must be submitted where reasonable.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.31.1

