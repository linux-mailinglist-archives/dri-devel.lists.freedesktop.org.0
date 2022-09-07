Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6F5AFF20
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514810E455;
	Wed,  7 Sep 2022 08:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D64B891CC;
 Wed,  7 Sep 2022 08:35:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 020B62B059B1;
 Wed,  7 Sep 2022 04:35:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Sep 2022 04:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539737; x=
 1662546937; bh=j6ucc2FRYcqeNCEcZOs3f48FaEFLWw/Hd6KnucJmJZ8=; b=y
 /FMwYXBCVry9x8muzpzVibRrkh7rsmQyLpN2hMMGNTBXVJLBPCpWWdT94Yw8tTom
 aRPpT0reMhmSmeGEXYhnrx2MoQIbu6KwmLj22xqz9xw7ubtSdJYr4zMkosEd007n
 ETbq38bBFsMYUUO6efUXDL/XCKp27/3EX+82PK7UA/pZnlc4CYhxy/voFIxtkkpa
 Tpdj+6CuWDK2SQtojweTjRRsviKa4GdyvWZURKg3/islIWQLGkFYHzfkAaLfmcNz
 cV9wYktBGpmUsRE7RsiG3VGOFzp+02y0tCdW0SJji0Z2d73y1FyiDcdxF6UUhTon
 ZhqBO5GZ6qxkiTIGMCrdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539737; x=
 1662546937; bh=j6ucc2FRYcqeNCEcZOs3f48FaEFLWw/Hd6KnucJmJZ8=; b=Z
 tZ0krJduii3sPfEQ5xCiZ4TCk3MIiXd75hOZBPI/hSY6lBAlp9OAMUzyqwS1i1Lf
 ntLuo1Jpc17KLKK78U/s8tc4Lg+5GhrtYfNWdVRWfGMTAl8c1Vj0raXis/0p7uq9
 F6bAejq4udcynIN8BMRsicOt5n8fPQWUqMLLS0MECAD8YAjumsS/3cTXrkhnRUgo
 1YE+r+Q3BAvq5pOheyXzxYLF3GgolfuUfdGAIKAKIHD7KoA/yXc/oNZNfT/5Hceq
 7qn0i0RwVZnLEbS4M/8+Ce1VZal4PR3wwXdy4vDgGJ+BvEZl5B8ZtaHLOkmqud8q
 inVdVE8hSLV6IzobksqWg==
X-ME-Sender: <xms:2VcYY7XorQ7nIRBnsCtkjpgHyEnhHjO26NePSKfIkgRVFwabaQpw3g>
 <xme:2VcYYznP8EMG5uEKiERStnnMfVavMHszjax2g-CWWiPUXhM8ZuLn_nvjwuQtt3u9K
 jJcr5wFxOs6JT2hbAM>
X-ME-Received: <xmr:2VcYY3bJobWH7dbE4KZNSntPlBA5M_jo45XUbplRGv-sFGCw45UMweNhWss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2VcYY2U3jgK1isQcrVJVFEhhmR_uLXlNiqpdbbkliu64d-83U4B4BA>
 <xmx:2VcYY1kYsr8Iu0BY1SBs336uwQHH9MyIhb93V8Ktmq83EVJTQsTiQA>
 <xmx:2VcYYzfwpsFae99qT0W7sol76n4CzQEUaei4tR0_VORLTvxZFej0-A>
 <xmx:2VcYYxtdUiwSpa8ciQerXqaHDYDh1fCOhMwe9zU6Zz8XpoNUlMWrRdq2aNg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:36 -0400 (EDT)
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
Subject: Re: (subset) [PATCH v2 27/41] drm/vc4: vec: Remove redundant
 atomic_mode_set
Date: Wed,  7 Sep 2022 10:35:02 +0200
Message-Id: <166253967461.2236193.7353795207844627727.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-27-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-27-459522d653a7@cerno.tech>
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

On Mon, 29 Aug 2022 15:11:41 +0200, Maxime Ripard wrote:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> Let's remove the superfluous tv_mode field, which was redundant with the
> mode field in struct drm_tv_connector_state.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
