Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B7627F9A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515710E0AE;
	Mon, 14 Nov 2022 13:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B3510E0AE;
 Mon, 14 Nov 2022 13:00:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7D31F580401;
 Mon, 14 Nov 2022 08:00:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 Nov 2022 08:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430835; x=
 1668438035; bh=0JWLmMS4ys53k+X9d2nf5UFm2Qt1wBBlnbOmVwqA2+A=; b=P
 2fMj4KVYbgu6OYfTCbnyhUqrbpstYhG2qs8K1avdLRBBbqBLyApf2QITRDktrcv1
 oBpY+ASY1YL46/+YRaH2cs1JhGhgTy4mP3iqot4niMC0aG6Uk2bv/7OHYMEx8FX5
 OSunRc2kfqb3Y9ZuwIbB4MYTTPLCC13bRnxAIP1cr/iZqAoedlFjKz6JqovE5Ik8
 7Ya3CBcJbahPCPgX2w1i06qi75QhxpRKlWLJY7+MzZlx+GOO5mpzUvBhbkaLExyt
 fjmyKbwJ5yRzFsviTZS26Rq+ZgTU/LgGiBTOQ2cfAEExiJJtTu18P3RtkN2bM5jT
 6b211sMAOT4NflUf7SWRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430835; x=
 1668438035; bh=0JWLmMS4ys53k+X9d2nf5UFm2Qt1wBBlnbOmVwqA2+A=; b=N
 dHvTNE3efzcmT1UmedezIyraShPjtEqqQE2l5qJMa08kAwuEizrUhJ9m7cPesNlh
 k2YXLOAtQkr+AQp2AnjHVikZX5q4wN+G3ZFty6nOpz3Hd9X1VqqInFUtmUioicVd
 S1chJTeJdCJ4EVI/SyUp1LxQ6v2EP1D1hl3R9Wun6kc518o4ox8221tfIA/aNhSM
 uWmA4T3/BnCZKrZWxz8rN4WBCR4fbSQR2v/oVy7CK+K3Wq+Ne2OzCsNFY48wSW2R
 9NKmwrPvbiio7AK6qMk6+E4cLmbu95VYpC2EhIDVlLEY8QwH2QrGVUg7vblcspOL
 NKSIdfX3EuG7Pvs2d1NBg==
X-ME-Sender: <xms:8jtyYwlVjutUWWEQYDpQIm3vHyutqlz6lIWkw-WeOHZ-jN6Qg5HijA>
 <xme:8jtyY_1mQqbRk4WPiyVZr6XbynMn1zI3DeFJLfF5ZM9S6AaJUiS7WYM3m3Var6nIq
 MtEAqc8CVshQLLxgJ8>
X-ME-Received: <xmr:8jtyY-p_acGZV8nvD_kjFmYa7Zs3KkmjKEiTIWjJK-d-2viu9KnvWEAZ-gr7zoOShgGQCRVGH8mNkUOgBUeHM8_DLEAFg8-lnVgThy7O7ycpGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8ztyY8kecz8It04O9L2nEnKKmw4rqt1evKFwBQGL7i_zR_jC03nWFA>
 <xmx:8ztyY-11PF2S69MF3NsW62ThupeSuRWxv3oqPFoF_Z2FFy_GJ_jA3Q>
 <xmx:8ztyYzvAE8JYZ6PC4o9shpIdoiCNM-eOiZXR-CHEZ6ylPLnucBnKbA>
 <xmx:8ztyY1AMIRxTP18_-z7r6SXTRSFCY5iBG2eJeQqkaVd_f8ljTBuG8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:20 +0100
Subject: [PATCH v9 01/25] docs/fb: Document current named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v9-1-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=HwgUgivGxiNK6PYRp//hctyxx0DYl44g6S9kEphLQOk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q8DGM6ms7pM2VtQ/7Zulsi/EzNsjjs05BX+ymw16+4r
 qHvWUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIns92f4X7WPycHy9hcD0UeCJ/4XG1
 2JCii9d9I5tz988V+D/eYvOBgZ9lhnbp04wc7zgOSWPTfSvO/d3HWlq63cs22R35eGlsZ7DAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KMS supports a number of named modes already, but it's never been
documented anywhere, let's fix that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v9:
- New patch
---
 Documentation/fb/modedb.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index 4d2411e32ebb..e53375033146 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -26,6 +26,11 @@ Valid mode specifiers (mode_option argument)::
 with <xres>, <yres>, <bpp> and <refresh> decimal numbers and <name> a string.
 Things between square brackets are optional.
 
+Valid names are::
+
+  - NSTC: 480i output, with the CCIR System-M TV mode and NTSC color encoding
+  - PAL: 576i output, with the CCIR System-B TV mode and PAL color encoding
+
 If 'M' is specified in the mode_option argument (after <yres> and before
 <bpp> and <refresh>, if specified) the timings will be calculated using
 VESA(TM) Coordinated Video Timings instead of looking up the mode from a table.

-- 
b4 0.11.0-dev-99e3a
