Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357965AFF33
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AFB10E47E;
	Wed,  7 Sep 2022 08:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5A710E48D;
 Wed,  7 Sep 2022 08:36:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F1B372B058ED;
 Wed,  7 Sep 2022 04:35:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Sep 2022 04:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539759; x=
 1662546959; bh=+31CEGbmU2q6Tt9vFnh1GvYZze8A0Y9E6qffTZZmQws=; b=u
 QGc++gg2nrXp46+EgG0l8l4OcjXgq/2pkv2TfSkvp6wLLj47k9Pi5EXwVs/InCK8
 MRVtLe9WmLCYDQYI2FvL8iBZcsE9UvplEu7Q3mNncpkq/1ZOZ/af0DIjzV3vDvbj
 iTZnj449ezUMId9foaXdYciJ5t3tlL6uq1RrWj/5eU1BItxQQWuImzXlJoC6Y0Yc
 KjY1OZHju5fJILmtgnKyUlOlvsIh3v3m8KEg7hIrjkUECnW68He/rgXbRai8a1Oq
 VQMSdcnrEhyL5PvHKc0nwY+J2XMy7kGJr9dnXkzNiwTD9EFA7X0L64ZxRmfwTfnw
 UA3LnJ0U8G9LeEq0tLkbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539759; x=
 1662546959; bh=+31CEGbmU2q6Tt9vFnh1GvYZze8A0Y9E6qffTZZmQws=; b=1
 zweovl7obsyw0BjeznZHsJcrCoYgIZta+WYPyDYV8lXQdDbXdC7OmD0edzQMHSO1
 btixTIUvblQXmWF8BJpGezYbkSOJDbB/PP3VWxSEkSj4bvVyWsfoG5l/WRDnhCV6
 otfqR1L7AwgCqGW4JpI3C9A8uvuQutbcKDl7GL+7RDUbtLMoMj+V4jM301O7KhcF
 biipavmqI4pockCvXv/93/ORM5s6K3AH8GKI2xm1kjyDdqa5nFRxpwEIA1E9DpPI
 J6U4g2xHe8uSajrfxQpryYxz/2Hms72keen8peHqtkiboH1UHHMT12MEHNkDaNGo
 g7d3gDBEBPGg1lAW2nOTg==
X-ME-Sender: <xms:71cYYxgPUM3rEZToyZHY3Q1AmMLcoAUP_wRrJL_mnLmpGS8Fus0IjQ>
 <xme:71cYY2AZvFqur6W2olk0PP5-izb8arx9hINBmc3oFE8wab5OmxqkWw2xE4-PnGz0n
 D0--OFXVDfCwjQkWZo>
X-ME-Received: <xmr:71cYYxFmwzztP4QAA35UvM7uF2pY76MuHRC0pi6gwYARHOnrImSrznLGEWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:71cYY2QndYdiLosWAXfW2RLZmVt6x79a32BhBK0UhCcMZmQPOAQZhA>
 <xmx:71cYY-xhuTJyEQrDeJf_-SqsOrBCNSRJPDxcRHWqsu8FWzquxQD7Tw>
 <xmx:71cYY85VX5XtsBHLwVua7HpBOJErP1pKF0b_biUtym0BjuM8PciSlA>
 <xmx:71cYY4oR6lr_ymdoW4t18GGRUDcHQc9f6RKrMHDiZ2bk4a8jepKC-ikSQns>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
Date: Wed,  7 Sep 2022 10:35:05 +0200
Message-Id: <166253967461.2236193.3184591776992284216.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:49 +0200, Maxime Ripard wrote:
> The sun4i TV driver still uses legacy enable and disable hook
> implementation. Let's convert to the atomic variants.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
