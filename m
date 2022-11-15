Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1262940F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E844510E39D;
	Tue, 15 Nov 2022 09:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3B10E38D;
 Tue, 15 Nov 2022 09:14:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 098B82B067B9;
 Tue, 15 Nov 2022 04:14:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 04:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503677; x=
 1668510877; bh=0lq3nSwtolEbjeEz/Nq2/eFTkydppkODiDO31Lyiho0=; b=F
 jrj/4072JriJ/iU9tCcqtF3V1pHX5cGhOnfM2UKB/+moruRCOqi8vO96iQz3HK3E
 SxkebTpPzD4F6jWTDQoyqgSte7Zk+w2vqDWA3X/R5FWwaKXx9NOe05NjiLelvzvM
 9QTu7Fy83oK2EZaJmumijOgp0rVOoZGkB8GYa3fHgJSBm99O/bEXQUMQUNcDRuX3
 VfVVNBRYUATD3ycEYmhCNW9SbePaxaxuDLZ/8wzKnmCicLOY7clIikJEd9XAdDqq
 Llm//ZMxDE+65ow/Txb5Se6HRqbXKr3Vd9dePxqVmIr4ScQwE+VJt7YZyJELCH1d
 t4vVSEAoXcbFXCWulD0Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503677; x=
 1668510877; bh=0lq3nSwtolEbjeEz/Nq2/eFTkydppkODiDO31Lyiho0=; b=W
 NYPyBGMmG9x9vRdp5sphpeEnRBy/0TGPcNDBkj8OIzYKa2OD7wgAn63bAMyw6gws
 Wsw0pEFFaJxdgSNvxATdK7hvbFBe72V8QD1XJKjjJSRkXvtbJMOKqSvLbCz7+yd5
 rausE1P18MOAArDB+4iNsz/kbGC7QWlNrxjfTgqYS+OFZMFhG/u+fh/rPYgj5/3J
 AAEDeHD0z8jGf4aucWuCvAWjHofFHb/i5X7jrck46kUyDEFNEr+gCj328e5x58sZ
 1OVPnxEcAs1gEGbRgRj3GyMF1Ji8hDuhVZwkjnfv1XY9qPBFoJGfsFKwE9GlTLAH
 pmn94cMFkQrXD/kjmGToA==
X-ME-Sender: <xms:fVhzY1sm5rB83vtMny2u8LnR2uVplUZVa3976ao57QoOlxl79PbSvQ>
 <xme:fVhzY-cyTqbeOtowXq1Yjda64WPyw3Sh-RtVK0nNzfOdTMffzJ89B8g6OpK-4k2A_
 iu8JwSkZ7tlYXqoPFw>
X-ME-Received: <xmr:fVhzY4yOW0fx5y-ipKxFYd9du4CwJCPmQYyZx06E59pMOHWmoF3WLSNIaO5TINJhbDb8AaRxpsnW3p3WA7r9sCWba4kaj7Xxkj1OCYa98GO1_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fVhzY8PlALrCoDTrcgg3wUSDOhPGQ8bBTYAsv2yBmvnpkJ1fUibjbA>
 <xmx:fVhzY1_K1ia8DPoaRYI06JKHkXIf4YlLZ46IMZGMB0Sux_XNQOAE0g>
 <xmx:fVhzY8UgwPURGtdYNbbDaRAU97hMoF2tJTLF3HObbMr6_KrsmzgFSQ>
 <xmx:fVhzY9ap8TsCyMq5UfRPu_rI8dmBKObpvS5OBD40kQMzCNPnconVwEoeun0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Karol Herbst <kherbst@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-10-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-10-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 10/25] drm/modes: Switch to named mode
 descriptors
Message-Id: <166850359293.1237314.13430360277429512424.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:13:12 +0100
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

On Mon, 14 Nov 2022 14:00:29 +0100, Maxime Ripard wrote:
> The current named mode parsing relies only on the mode name, and doesn't
> allow to specify any other parameter.
> 
> Let's convert that string list to an array of a custom structure that will
> hold the name and some additional parameters in the future.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
