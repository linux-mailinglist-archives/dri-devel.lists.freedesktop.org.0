Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF2133CDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9C86E864;
	Wed,  8 Jan 2020 08:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B53388284
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:00:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3CBCC6CD;
 Tue,  7 Jan 2020 12:00:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Jan 2020 12:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=F4W/1VWP1mKmEGuteUg12ajW4M
 xYom8otASm0XcrXXI=; b=FMfKFluh0CLOfrxFHxiNyAo4jVBgaaF8V6hJ8Cek8W
 CILffx34Pl7+4yeIfeJ98TlSjcWTKNbyYeflt+LLqxSeBCcUf9JBM0DrKLllDFt7
 RrLesKmx7VfE+2KXGnI113cspYQxHa1pR4kgj2CgBMX7zNhBJ/jvAvHnZDOuO07y
 FkyPCoYNECe5w4XwQHdzbnVOWK8ySrUl9LXVyka1vy1vtGjI7H0N/PJurv6wvWyi
 lCV4LCeCofw7Btb4zOipd1ZSpXTOHb4izg+xr6EvPVsV5F2XLzwPMEA4f5iIt/fi
 OtJHRmzSftjBDXnAarMFjqvExNWovR+3JtHoxcra9EsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F4W/1VWP1mKmEGute
 Ug12ajW4MxYom8otASm0XcrXXI=; b=Ploh0OFn+D3Q9dVFVmzz1qLdrqNvHeSNy
 u9I5dhFSf1Emv3sZA9WoEN0TFeV4pstPbQE34An8q2DPiQQ82by05EEDmjsFXOx1
 qWU0zHnX6lxHDASAx0Sw6CyVc9VZpDoFDAWELv37doDOhzavT5MxZ8FlmFzkPTmy
 zOwAeCCIBMowPkkRNJgRBmoPnM1c/S9g1vP92Vd/xd8qhOs4cm7Nn7XLdIboWWMO
 /RycIh6OSzFD7pTjwFLxeAhmOV4khwRjSHJ2kcah/RasarLF+zXmCSCc57cI4XBN
 +vwf6IH497iImDtaVeKEzybrGTX+PEuQZ+aIL8Ihr0yS1wmyq4u8Q==
X-ME-Sender: <xms:ELkUXsaBlcoHDOlQ9AXe1FMgyhMOxbejGAtMWh4ctCqJFt19gACwww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrke
 elrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ELkUXixEBwmzkmQnfx4Pnb3uROgxo8e5lWoQy6cKU3eTMqTBv4HGNw>
 <xmx:ELkUXgWVmIy-yeGMaS2xG3U3RfsfxFO60CLC-W1ThI85GOo4zj8npg>
 <xmx:ELkUXuY44RxeOb5IAupdPI3Hm9V5Sym7jJ9jDSa4s9amsneypEQbYQ>
 <xmx:ELkUXhZl62CTDHg_y779A2kKddHMrKPiDGsfxsVAYEryPVlgucC-8w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB7B780060;
 Tue,  7 Jan 2020 11:59:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 1/2] drm/sun4i: backend: Make sure we enforce the clock rate
Date: Tue,  7 Jan 2020 17:59:56 +0100
Message-Id: <20200107165957.672435-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backend needs to run at 300MHz to be functional. This was done so far
using assigned-clocks in the device tree, but that is easy to forget, and
dosen't provide any other guarantee than the rate is going to be roughly
the one requested at probe time.

Therefore it's pretty fragile, so let's just use the exclusive clock API to
enforce it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Add test on the clk_set_rate_exclusive return value
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 4e29f4fe4a05..072ea113e6be 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -856,6 +856,13 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		ret = PTR_ERR(backend->mod_clk);
 		goto err_disable_bus_clk;
 	}
+
+	ret = clk_set_rate_exclusive(backend->mod_clk, 300000000);
+	if (ret) {
+		dev_err(dev, "Couldn't set the module clock frequency\n");
+		goto err_disable_bus_clk;
+	}
+
 	clk_prepare_enable(backend->mod_clk);
 
 	backend->ram_clk = devm_clk_get(dev, "ram");
@@ -932,6 +939,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 err_disable_ram_clk:
 	clk_disable_unprepare(backend->ram_clk);
 err_disable_mod_clk:
+	clk_rate_exclusive_put(backend->mod_clk);
 	clk_disable_unprepare(backend->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(backend->bus_clk);
@@ -952,6 +960,7 @@ static void sun4i_backend_unbind(struct device *dev, struct device *master,
 		sun4i_backend_free_sat(dev);
 
 	clk_disable_unprepare(backend->ram_clk);
+	clk_rate_exclusive_put(backend->mod_clk);
 	clk_disable_unprepare(backend->mod_clk);
 	clk_disable_unprepare(backend->bus_clk);
 	reset_control_assert(backend->reset);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
