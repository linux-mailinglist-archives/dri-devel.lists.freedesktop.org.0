Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD626133CE4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163226E873;
	Wed,  8 Jan 2020 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5923589FFD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:00:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C19516A5;
 Tue,  7 Jan 2020 12:00:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 07 Jan 2020 12:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aosMPaE9sZ47Z
 7ZiP0Xmd3wgeby5+/lZuZXSIPrpqws=; b=h9BYR5QhpHQrp/T55CCUB1Y4RuoJu
 aniNHLWE2ZBaRfgMmdQPq7/VfttbE6mgdQG/ueEt3Yr5zNOkf5iMV7prOgl13UMY
 2yiPH6YByGWIYe65aNvzAUrcysPrs/FXTfkCYlc21Nsi2poJs8cNXNuo0piJTCdX
 vGqD4dhb3envajK0yV1ta4gj/iP3N+W9NOfqJOG70RJwZawjmNL1IWaSfwWXH0Rb
 Qa95hHcznfHo5ExbK25eH5Gyq+Nrc7KAgneIqMVn2aCjkffbwBmsfigZdZ5kovEP
 jj+ujpYzjwh/dfZaY+Cux3/B++ZxDNffug7LL7pXcFRLrG7fkqVED2E3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aosMPaE9sZ47Z7ZiP0Xmd3wgeby5+/lZuZXSIPrpqws=; b=SdgjmO5Q
 dQ/LycdJ5fs1PJZhWm2X/TqWkAAzKZzwdi0g2UY06TBlcSAmMCStVyAbBVSRgow5
 SdQhQsg4NbpINiztq5y2/0BYjqkme48gIO0z1Ctaah4vh8VDEHzN0UriY/OAEE6+
 din7mDLsLPTUFgrEbexfji2YU6rfa0hAECYgGkA3QHoBH96J9/XgyiIndws47AgN
 4tQUv/c0DCktl2FvivIIm29dn5UQKw/1Jb9ohNvCwOHCr34t7pr5U7Ig6Cz4ACnK
 UUjN2tamczl8DzgFKWM17h7jWctWmUjlKVbZPp88/5fbxL/iAEKZUOrTB2iDX98Z
 XKZSquoMfKsOoA==
X-ME-Sender: <xms:FLkUXtYtl79dx6EZwTeBNwxSl4OC0ksdsifmk7qqHe2fmSibpOcVIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:FLkUXujl2VIscM6qoyFcG02XOmR8hj_rBVOl-ksVr8TvjdkFOlAlkw>
 <xmx:FLkUXhrdDgEqXYkJhNjIKJBDbWcq2ftopkJDxThw8bgOLBpnQ5pXvg>
 <xmx:FLkUXqVRLbDzr7bMfcxzbo4LlPUBs7FASowIOIgwZtnp-5jsN1rh6w>
 <xmx:FLkUXpvIgWL_av1cu1S6TG6-xa1AK2_y7j2dzEwxMxIcprpkOgAURQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08F3630607D0;
 Tue,  7 Jan 2020 12:00:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
Date: Tue,  7 Jan 2020 17:59:57 +0100
Message-Id: <20200107165957.672435-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107165957.672435-1-maxime@cerno.tech>
References: <20200107165957.672435-1-maxime@cerno.tech>
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

The DRC needs to run at 300MHz to be functional. This was done so far
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
 drivers/gpu/drm/sun4i/sun6i_drc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
index f7ab72244796..4fbe9a6b5182 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -56,6 +56,13 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
 		ret = PTR_ERR(drc->mod_clk);
 		goto err_disable_bus_clk;
 	}
+
+	ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
+	if (ret) {
+		dev_err(dev, "Couldn't set the module clock frequency\n");
+		goto err_disable_bus_clk;
+	}
+
 	clk_prepare_enable(drc->mod_clk);
 
 	return 0;
@@ -72,6 +79,7 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
 {
 	struct sun6i_drc *drc = dev_get_drvdata(dev);
 
+	clk_rate_exclusive_put(drc->mod_clk);
 	clk_disable_unprepare(drc->mod_clk);
 	clk_disable_unprepare(drc->bus_clk);
 	reset_control_assert(drc->reset);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
