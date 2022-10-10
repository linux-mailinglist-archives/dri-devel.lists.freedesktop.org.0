Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C15F9E7A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3111610E6FF;
	Mon, 10 Oct 2022 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1DC10E6F1;
 Mon, 10 Oct 2022 12:11:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BE6FC2B05E7C;
 Mon, 10 Oct 2022 08:11:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Oct 2022 08:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665403884; x=
 1665411084; bh=EUBVg2jb+lnRA76hHrrpz9kERc9bhmowp7vu/vjyvG4=; b=G
 t9fRM2X979WRZOF3BV5FgPSsJQhRuOvgTtZ6XKEoQQNGX7aO1ZXQa1TwqZssDtX6
 oayF0GTPlWPc0vy1l8D4sVR9zkKiyyPXqiY2fi6oC2lkwpYtGyy3iwcMmoghNHlP
 7nQukqapcM9/lUDlaYZDjF008S0sGQ3MIk+jwkEsDqOl7n+3+biB+UJzG8gBosiN
 /g6NaHhokHkSWvEn1abvTUFKOgboeq7Tge8ql7CjjXAM+YkfFAE5KnKZQN/OGNv9
 sPSJ5ND82UNXEVOngu1hsQKcWKCvP7naxxDg65zWjltjzgGlfSW5QTurzBGx+aFu
 bb2wtHB1jl/54eL+SaPvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665403884; x=
 1665411084; bh=EUBVg2jb+lnRA76hHrrpz9kERc9bhmowp7vu/vjyvG4=; b=G
 y/F7lNZMzV5J6qcaREM1QpFo35J8VaUCmgNH01UjHmzRGwvKL0+XX2dLJtJFNHeC
 wr+XEAjHUHYsoOUXz1E2JkOkmm+CE5/O1GGJyHAyGDJW9y25VhdQ6s+YwcOdGOxG
 /yxdW4pGjz8JKdBejFPdi9Vnwv04RT0A+rGlpS+j94rF0EFUXsgl0UGcm5Ev3bEf
 SHml+JcaDNOKUdp305T53Zehlbd8bcABwALjY7mOQFg9PWa4R87cj/wVuGn4uOEQ
 hR807Cgab5W97uzsHA7sL4o8mTuRKFv12QwOBMhHA+8U/XJFY8Q0Qwb7HW8BTSSL
 aRClD5xFmVKTQYnweesGw==
X-ME-Sender: <xms:7AtEY1mz6bnBjUqcX-nth4ntnJSbxLGAO8fpg81HjpIfhxxKxGQ__Q>
 <xme:7AtEYw1vpesKzCKzHvOorGwYTh_BuNtI9Z3wONMsYSs3Ms-JV-EU00fbnAf6e8LzE
 skRvnHgxlZAhXe4hkU>
X-ME-Received: <xmr:7AtEY7pOkpR9X0rV0V78_7Cuh1sPUBYJqsTliOO7H3i_SwyoudYaaRuJlGza>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7AtEY1kNYtmgwSM6iJoTMnSepwLYV5-pX3I1KmT7B7QpsRxhvUF5GA>
 <xmx:7AtEYz1pDV8ARLwjOCDaszudrMvMqIVUpBkAhEN0XLLZs6dAXND_0g>
 <xmx:7AtEY0s5ZfAmEY9kBp08SP81Jr0bda_8my4lpExAu5xI6IHacusG5w>
 <xmx:7AtEY7RWlXQL37Vl35Ag7ATDw_G_jYLjKbqWn4fO3ORRQlZKOGDzX61CLps>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:11:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: (subset) [PATCH v4 13/30] drm/modes: parse_cmdline: Add support
 for named modes containing dashes
Date: Mon, 10 Oct 2022 14:10:41 +0200
Message-Id: <166540374295.183315.13152036706758597010.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-13-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-13-60d38873f782@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=EF=BF=BD=EF=BF=BDnnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 18:31:07 +0200, Maxime Ripard wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> It is fairly common for named video modes to contain dashes (e.g.
> "tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names
> are not recognized, as the dash is considered to be a separator between
> mode name and bpp.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
