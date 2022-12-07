Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D8B6457CE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CE010E395;
	Wed,  7 Dec 2022 10:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56710E393
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 20A395C01D5;
 Wed,  7 Dec 2022 05:27:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 05:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408846; x=
 1670495246; bh=h5h97StYzAEu+yy4ghlHT2x7MeSqftaELyUUevoLQM0=; b=D
 73OOanYGO2UWsfZrhE9zGdhqwFvGx4FmLgwO/J77HyamhCE+Gs80PkL2hiRjGDrK
 /mE8qPVF/PELLh0PjbiZ310kQi+MGOUz07iJbQ1DtybENJhYUnoBewNIJ5n3W097
 cmd6fz9BFsDHbpIZHUj46AFc8K4ia4WG1PKnUsylK/aUx2MkURyzpufy/ms2qhSr
 cON6ZFr274Xp/ONPQv/OMXJT1F7KHMj0xivqM1Kj0oOxiOlqrRaxjEEpzqHToWSl
 CWuk0xeHLn+N2a1eOQP6i/b6sbo/30b8IQxiOwpMJzLGHZi4JT5pIqdQaONwG3zn
 g0ffE5z1IdkuiJ9eUmRXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408846; x=
 1670495246; bh=h5h97StYzAEu+yy4ghlHT2x7MeSqftaELyUUevoLQM0=; b=I
 Jns9dICqpr3zOv31VUmjTqzDQxbqqlac2wTRVoEL4yJg8xOrB7hL9J36NjBx6c7r
 dwqudNa+ENc1h5gmmigvBcgiu4MMGu3kazia9IBTAzX3MWxnn/DjSCV65BSi7c7U
 E9hHAE7wzxIWl4CXXIrtM20faW6pDYYvlR6/PmFVlv0/fikXVb2Yt6jvMAcB26ru
 4XCFbhjVJRvhhPI4RrHLmHh8rFdITNiq+9ZJ9f+aKwMqsKFpcpZ+NG9bUAgUZpgy
 nLBQHOwemRwqsc0xgy+Qe+N2D2mcu3Opnyua1FacRepO99NbZdjIeogNMIHmK5Ld
 +oteCm9v8Z5PKCADuzqjw==
X-ME-Sender: <xms:jmqQY8o3bGXZlhxyG4LVFNWoLX8QlBgII2EdPv6X9-KmgXecn8aYAw>
 <xme:jmqQYypZYUsZmlviWvYR11yFaFDyscFnPeAI4Sj9mFurKTQUCoaZh1mB2Dk6lWDRX
 eFiD3VkaKK0pDckxb0>
X-ME-Received: <xmr:jmqQYxMLpyRDng0eC8MCy7ek2gDxgVQE2ajmYBU0XfdG4PkEFZxXN1Mh2JVX9-_nkEdKPfezwiBU63q6R674fYJtkSk7VnJvx_L0nyunzT8lAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jmqQYz41eqMZECp7Icb08Vw000_yhFgmhLwiE2mKVtg_W7Le23UViA>
 <xmx:jmqQY74jSnwjJrO-UUbOfFvoEX25oGixAJ0QCPz6OnDE_gJiUdbI6A>
 <xmx:jmqQYziIvL_c3-rfywfjWXuZH0yjS1jT8Jqpwn71objlQvMIXiFavg>
 <xmx:jmqQY6TR4AS4hh3lLWtps0WUF9vRH_wlSgWKGa1fw3aTaR6wimD8Aw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:49 +0100
Subject: [PATCH 6/6] drm/vc4: dsi: Remove entry to ULPS from vc4_dsi
 post_disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-6-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cJvbEvZA5k2IhWWlGKDtOHgsecBa2Doxm4Mts5DYRUc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkvvMpjYH9y0vulQ/kYji2NzPKdOYs+brJxR8Saxeu+L
 qGrHjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExk51+G/07nIrUtPrr6T1LgfWzldC
 HwUtxWqUuf3zk4mGvsO787YjfDP33DE+5dT3tO1uQF5gXrZ0tYlnkevjLN8Sv/Re2b855YMAMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Post_disable was sending the D-PHY sequence to put any device
into ULPS suspend mode, and then cutting power to the DSI block.
The power-on reset state of the DSI block is for DSI to be in
an operational state, not ULPS, so it then never sent the sequence
for exiting ULPS. Any attached device that didn't have an external
reset therefore remained in ULPS / standby, and didn't function.

Use of ULPS isn't well specified in DRM, therefore remove entering
it to avoid the above situation.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a7b8ffd995b0..4f3805528aa1 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -813,8 +813,6 @@ static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 
-	vc4_dsi_ulps(dsi, true);
-
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
 	clk_disable_unprepare(dsi->pixel_clock);

-- 
2.38.1
