Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7E62940E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA210E39C;
	Tue, 15 Nov 2022 09:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CAB10E38D;
 Tue, 15 Nov 2022 09:14:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4E0712B067C0;
 Tue, 15 Nov 2022 04:14:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 15 Nov 2022 04:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503670; x=
 1668510870; bh=B1HEeJHxwnzHMxiVdBTQmsyU7uCgsJAkffynGla9mpE=; b=P
 2EN0cTMJ2S9FfAxml4lJjMakA7nOzg5ntroVW5OIcyWN46a/MUtUIJytuuAqdHQq
 dcLfn9M9wzFh8jDeem4ZEBPCMsnT3PB8ZVAahddXjLBCmbapxoee7mleZf+Ubm/o
 XIJb2Z0fxl8BkkeK6/f2v3792vw5ebdTjdHzlZxxDO3NwPkKzXRXDco2bg9Bvlad
 r/cCcTR9FLmonzQxu7G/iR1HuBQDOstVh/vT40JJTPSCkWAYTn+ZDFOeAtPYU+RQ
 DdDfF7hDyO0BCct41T/TlZe7/3XF89pdS//6s2QTwii98wRWAydINzbPmfrjlls0
 XaG/0peZJT9tZ2i0o4aYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503670; x=
 1668510870; bh=B1HEeJHxwnzHMxiVdBTQmsyU7uCgsJAkffynGla9mpE=; b=F
 h50lMAr1HYrUiCIim5H9z3kaTC9Q+TmD+3BWhIGMrTVUI+kdE70jD9rWWtULGqh5
 7J3pDrdwk5dDN5j86IMQBlAIoCVREhRkSj/oMNsEBI3HEr6pGeQ0NITLsk+f8pvr
 ln01CDj/BMI5cbTIA48Wi3W9iySjGtoduzjHq+IZrTAgtGfKJmfOaY/Ghzyo/k/k
 IoNYYZvT+8p63yCqLklNN9TfOHxMKYq5omQesHFKtvqnvTdmwUTPJ1ByDfC+gZGN
 TDb/RG8aksv2+4yCcgunkejeaMltc35mWQxQkNlRFYqEm4VHMDatIQiUzI3mJ97i
 VYc3C3JRkJ573s4+/1ZGg==
X-ME-Sender: <xms:dlhzY1NAqFST4EY0YmoPQLoh1j96v6U_nbo-0rhgmHgTw2xZe62Zlw>
 <xme:dlhzY38R6MMs2kOFFlwOg4A3OEblQVCm_80yU44XgUlawXXWfmnXXsLx7rSIWLIWx
 cY2Rto-L1VEnb1QEYE>
X-ME-Received: <xmr:dlhzY0Tl-yPjhem97wgb0Uss2mi1e5qFaKteYXjjWajStRSceE-tUVsrunE6sQajbr3n_MEk98fHT0o4nprw5DGVz-9mYP-Xs6diTNGJkzKcyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dlhzYxsizzn8i87QQzxERWWJrNH_5hQXEw14WwpbNf182N5a0otq8g>
 <xmx:dlhzY9eL_cyHXBX-lEOnyg0-1qUxC0LYHvY4bGzlgKYVTpJY5ZjiMQ>
 <xmx:dlhzY91QsvAOyNWepVa6nYqnyy2cer3EOkDqaH1svEzJchPnR5_kXw>
 <xmx:dlhzY06jgqCGMwegW9ZKn44q5KI8fg1NiDdgJPlfmXgooTqbsZZXJHOJZ_s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Karol Herbst <kherbst@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-9-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-9-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 09/25] drm/modes: Move named modes parsing to
 a separate function
Message-Id: <166850358688.1237314.7482343887898823948.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:13:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Tr��nnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Nov 2022 14:00:28 +0100, Maxime Ripard wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
> 
> In order for the tests to still pass, some extra checks are needed, so
> it's not a 1:1 move.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
