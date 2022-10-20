Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D0605AD3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDBC10E58F;
	Thu, 20 Oct 2022 09:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B37E10E6AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 79B232B05EAC;
 Thu, 20 Oct 2022 05:13:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 05:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257234; x=
 1666264434; bh=EPn6Wfs+JyRJl7VVy3VWwMDnWsSEZMbQ20L5afT6Uro=; b=P
 B0iVxRD2Q5SphJ0nuvPcrHGeKBv8m1bkKBBeOrqjp/TBqwJe4E9Ru6oXgbRr7qYA
 5oDvTUG/u1AC9dKEJszNF8LVCXE4BAOmM8+WT0vxMvgBDfdNadYH1YxT5++txaNj
 JTrdP3YgyuGktgg9OLRymOlOYtIsbAdLfPqAcTPb6SD/VmLseSYoKdTAfIRbAWLx
 qPC/QCM33DCiy2HzxZSA6Uc2ALjwXnSiThZ0Oef2FePkIfoN9IKDyG496zyns4gO
 XxABKXyvEHhX//QbdqQmsZE3dvSpxWgw+yKLmmQj+oM8kVD0Uy5ty4669wY8vxo1
 A9rbVz5SJngutITkUtmNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257234; x=
 1666264434; bh=EPn6Wfs+JyRJl7VVy3VWwMDnWsSEZMbQ20L5afT6Uro=; b=e
 FGHW5z8Vn1QsWGwLK/ijfTW8IxqvAFLoDeoEDEdxhqlkxoAU7M/EfMZROK1+2oyQ
 Q/zlCBW8IsiVgkXDkxKlBcoRvV46BvBHLU9Dg2ytZ2NcdhN5IA895Oyp3n+Z3h3p
 DnZLRMIMO7cfQml3ffNXr5keqtzCuSzVS7UYFFHEO8WWBo51mHzR+avDA+YH7a0A
 CYxd5BZS2aqaKbBeYLJYt7AqPkETCOSRupSVg7I1SvT/993yv90CvMtnyJEpQhAh
 n3Qm3fyLwJYARiGkkExKTY5swHkWCLV4a1ny17XWOur2j6NKl9DUrYS1pVVIx+Og
 LZEonVrRdxat6UsKs1sIw==
X-ME-Sender: <xms:URFRYzcAdDGAbH6gkbvSR8LIiCmmjQ0n8YNBw5jBrmG5yhgOhyhITQ>
 <xme:URFRY5OdP3N7xjSC89fhiqm3Tjsk2R1nBa5YEzWJyzY4mjVZcDjBJXXt9OXmrqsok
 KQeLVLzY8bTbTcEwtE>
X-ME-Received: <xmr:URFRY8iBjO7iY6kRNXUFgZE_PUS7Ie2jTvIHWfXGlXokQWGom_c9iK30cshe4XHhO1lEQ9CJsrkUR-cc4UPq0bR_UrnxXgUz0dhcu7NZLkEU9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:URFRY09esCeMSuzz2CJuo10RJyrbldsrJNb_S-LBQcKKaOulIOKknw>
 <xmx:URFRY_vl6gmfKC1tx6cysrgBJfTwY6h9kPl4joRwAi7fqvX-pCQ6UQ>
 <xmx:URFRYzEK7nFwIcDXo-BHQz_A23Y9PTAqxQ_12rsM5k3zlVNS7jNlXg>
 <xmx:UhFRY2OM1QTUxkIicBXon0kLzW8qksCSV5KVm-ZubEvSd3aoXu92k5_QeBI>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:53 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:15 +0200
Subject: [PATCH v4 7/7] drm/vc4: Make sure we don't end up with a core clock
 too high
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-7-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OlYeB2ublZKB2gNRKUkiz3SMrxpUPQXZoje1Yvw0WSE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq/qV2faRt7fczp8z6UQuZtzf4jXBz964lzz06byjv1x
 21v1HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIYjZGhl3uutFlDz7OSnbdcPhFWn
 thz711W3eJTDqZs+31u9LDHi8Z/nBoN8VOXfPiVuDiqdMUQz1zxawvtrBF9F7d1Wk0mfnJd1YA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the clock rate range improvements to the clock framework,
trying to set a disjoint range on a clock will now result in an error.

Thus, we can't set a minimum rate higher than the maximum reported by
the firmware, or clk_set_min_rate() will fail.

Thus we need to clamp the rate we are about to ask for to the maximum
rate possible on that clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 4419e810103d..5c97642ed66a 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -396,8 +396,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	if (vc4->is_vc5) {
 		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
 					       new_hvs_state->core_clock_rate);
-		unsigned long core_rate = max_t(unsigned long,
-						500000000, state_rate);
+		unsigned long core_rate = clamp_t(unsigned long, state_rate,
+						  500000000, hvs->max_core_rate);
 
 		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
 
@@ -431,14 +431,17 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_cleanup_planes(dev, state);
 
 	if (vc4->is_vc5) {
-		drm_dbg(dev, "Running the core clock at %lu Hz\n",
-			new_hvs_state->core_clock_rate);
+		unsigned long core_rate = min_t(unsigned long,
+						hvs->max_core_rate,
+						new_hvs_state->core_clock_rate);
+
+		drm_dbg(dev, "Running the core clock at %lu Hz\n", core_rate);
 
 		/*
 		 * Request a clock rate based on the current HVS
 		 * requirements.
 		 */
-		WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
+		WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
 
 		drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
 			clk_get_rate(hvs->core_clk));

-- 
b4 0.10.1
