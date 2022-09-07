Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBF5AFF1F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA60C10E445;
	Wed,  7 Sep 2022 08:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EE010E446;
 Wed,  7 Sep 2022 08:35:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A15772B059B0;
 Wed,  7 Sep 2022 04:35:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539730; x=
 1662546930; bh=gHWv6hw2CCOXlBI7c0e3cJLhWuEGyiJpuD1jXouTAWc=; b=c
 9UtWW8Fl7Z0ia5kUYgVbOsEiFOweqoDj3w+VnffgcHINk5Y7L6USqjzfpJ+jtEhz
 2whbw6nc2Bb9W+EZmYI9gbryjgYtoeDm9nJcfwAbAiOClgFga683BHe/Dg79Ppwm
 tMxXTxRSZviXh3RW14HHqhgJebEArbMdD74xPw4/ywR2VvSpteazHP/PIZVvuScN
 PBQ88Bg6NVdqguq+4GwqxTZhWtP8WzsrnJcoVmYXgD73wcvRtuXeVqcyqymhX3zv
 /06ipeen9cfK3eRKbAcdXob2SHJAEVg/7m1v3Pek1wySkM9tKdDy82r2083J+5W2
 LSD83V1ydXy9eH7r5W9CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539730; x=
 1662546930; bh=gHWv6hw2CCOXlBI7c0e3cJLhWuEGyiJpuD1jXouTAWc=; b=G
 gdr0SWmoEGyJd1UGQKkuYAbwKoJ45og65jHkR8BYyAPpHOrwggxr5FTaaYoe2Q7A
 aH9xX7D0WFWEwONs+kq+9Y+ciw7Etr2gYrGqFHsDEwIevgz7L++72Wuj1pj+8I4H
 ifDbu+TIv4NQ06oTz+Dl3BAzpq4HdBOyX5IFGkPbFGW0FnAT6UMF56TqWvitmyHU
 wDkAaz1G9n7Gc4jf0JRWyqSHoYuZgBEuE6Ki0TLHEH9Bly1ur30Xcu4XRKyZiZOp
 9DnRXqXWBNBbhV2qTnZxbyPyVGMYvjXJpDvghNNgG6xAC4Dj1ZrORcl5sZpTQxa7
 +ADdksP0WqKQZ/5bwYMbg==
X-ME-Sender: <xms:0VcYY9jLTwAHkaCow4msfi28vLMGWiMwTCAcjeNqNT462ru55gHjZA>
 <xme:0VcYYyD3M1byUp4w2rt6qAQsXPHWjHkAebJKP8pD5exOFPNhOmcg04N33hP5xhnQL
 qeMhhPv39ED8NhMBag>
X-ME-Received: <xmr:0VcYY9FQB-2fc8LRvJXsdhVI91tImjEV43im80VLYYhL-CP5XjSrYCrSfdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0lcYYySbSII9smvqboK7liMsFyqMsTsF2rgB5xpWcHAqzo5VCd4hnQ>
 <xmx:0lcYY6wqwC1246NwPOnygGM3PP8uC4FBU53EdqpxYVqC_rSA3MpJWw>
 <xmx:0lcYY45PnyAXfyEmyKRW7_pJe2faiatEaL3q0giGlpy72-VNogtakg>
 <xmx:0lcYY0rh234Qowq7zuou_q3IBrvXaM3sUO7GobQo-h1fvqYGE2Lt5Seuc2o>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 26/41] drm/vc4: vec: Refactor VEC TV mode
 setting
Date: Wed,  7 Sep 2022 10:35:01 +0200
Message-Id: <166253967461.2236193.12276458500673166916.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-26-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-26-459522d653a7@cerno.tech>
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

On Mon, 29 Aug 2022 15:11:40 +0200, Maxime Ripard wrote:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> Change the mode_set function pointer logic to declarative config0,
> config1 and custom_freq fields, to make TV mode setting logic more
> concise and uniform.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
