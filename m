Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC231292A3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B79C6E1B2;
	Mon, 23 Dec 2019 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B4F89D42
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 09:20:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1ABDD596;
 Thu, 19 Dec 2019 04:20:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 Dec 2019 04:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=/gNcTvDKI4nxKVR3eNM6FMu/Sg
 TNjggBxmKC7zb9KD0=; b=iqop338EUk6HWpGyool8au09oYRfXeGEvGx9DRADET
 ke3PYk8mrD2T/5aPfY+CUFTRuZh0UlT6bNo7SMF9n2lMu90fFBY5t3wWSthAJ8Iv
 sgaTT0RnVr2qEL+gPxrC64phN87MJQsZhBiNnbz+CD8jO0Rrwx6H/X8kNENvKjk6
 etkD2k6T1j+gPWihEQkX+cecmIIO72rrMnFCrWCsaS3gFewLMTs4he3ZktWR6YH4
 Qa/Js7NQjn0jLIqvCRjk7Yka1WDfAQo+bFKdeb/WJnmI1U93wQ1aMwlXXwSFY9ya
 ws/CtrGW2fo7MnvkMTQ+5xP1uaatla4Ep31pwzn9r9Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/gNcTvDKI4nxKVR3e
 NM6FMu/SgTNjggBxmKC7zb9KD0=; b=wktalPLSkMCPqie4vGgR14o4/tKC1I0eY
 OTyuM7WNoVjEj8a+shtEGy4/eW2m0To5DTgD6kVKfFqHEZ0YMfgNMooJM4wm7fM1
 r9cjZqnOUy5Hrb5dzzWwdl9vKbHADDSkS6GHnZlTNmkEJ/FjSuDhnqbv1ujbSqKi
 AJYAVftelt0Pi+53oTpkj3h3UUnwtdfNTWhQh4KszYYUoHuYxwdqM6PLgTy9/4Fe
 5pwwcUh4gkE2CF62P8Pl4wO8CcTukvYIkQ3mlhCPJC39TcnOd773N0zX6x2tq7zY
 A/1xBRP84sDsiXT8ZWiPF6/yiJQ6KQe8z9DTr/BQvy66A8ywRjY+w==
X-ME-Sender: <xms:w0D7XUNvbIQrqg8LMFPFeNP7aTBmwLXr5_HsVz_fWh8EHnfGVzaFbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrke
 elrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:w0D7XZWRi8J0wjVvx7rPSUti3uqa2ud1QfCR0ep3ygeucMaTdBLccw>
 <xmx:w0D7XdsAN3hKDFVjMFz_rEINCjJmpKqX-Bj0l2Q4Qhsu4DqaSFcPsA>
 <xmx:w0D7XZ599YJ-6nnK7norKCQsH-SZP3NM4tWXhrxeSWTXdfP1cVISuA>
 <xmx:xUD7XeHE7XB855KMKu7zrUbAyowFAz0qvirfZC9sslZxv9aSvhoh1Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29E3430609ED;
 Thu, 19 Dec 2019 04:20:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] drm/sun4i: backend: Make sure we enforce the clock rate
Date: Thu, 19 Dec 2019 10:19:59 +0100
Message-Id: <20191219092000.949052-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
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
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 4e29f4fe4a05..aa55eaeb8823 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -857,6 +857,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		goto err_disable_bus_clk;
 	}
 	clk_prepare_enable(backend->mod_clk);
+	clk_set_rate_exclusive(backend->mod_clk, 300000000);
 
 	backend->ram_clk = devm_clk_get(dev, "ram");
 	if (IS_ERR(backend->ram_clk)) {
@@ -932,6 +933,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 err_disable_ram_clk:
 	clk_disable_unprepare(backend->ram_clk);
 err_disable_mod_clk:
+	clk_rate_exclusive_put(backend->mod_clk);
 	clk_disable_unprepare(backend->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(backend->bus_clk);
@@ -952,6 +954,7 @@ static void sun4i_backend_unbind(struct device *dev, struct device *master,
 		sun4i_backend_free_sat(dev);
 
 	clk_disable_unprepare(backend->ram_clk);
+	clk_rate_exclusive_put(backend->mod_clk);
 	clk_disable_unprepare(backend->mod_clk);
 	clk_disable_unprepare(backend->bus_clk);
 	reset_control_assert(backend->reset);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
