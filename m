Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBB62940D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FCB10E39A;
	Tue, 15 Nov 2022 09:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E3710E395;
 Tue, 15 Nov 2022 09:14:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 48B562B067B9;
 Tue, 15 Nov 2022 04:14:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 04:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503690; x=
 1668510890; bh=nasadNTIFSQnVJhZ15WImlEOjmdx13wSVUui+IzXtIA=; b=C
 EBCd8/IwgaRBHGCIJYVyt4Qz8rF9U2uAWGbw/asPEZpiTZeoJap9t9yOYsZeTFgz
 koEQRXgGf5K1JMFupoItiKDPIRUm4Xcb6mIi+naBuY6xivRF4NSKUtBLFa96Zaid
 ZRAtOlkuwITpc5oLd8kUPymDhoeR3JmnzH14A0oibNkZyQ85UYzK7CAnMPNPA/Pl
 G9joGglhF6E2iL5UIYUYJXZ/yxoKfWTKd2JzeA4Qv0cBn+WZ7SiVtAuqO661TpFy
 fvlZSsswYkZIzfXhkZ5/ZhsdvzYLFpNowZvUIalx57+JBqczAKYmgYmekrH8j8qV
 JVq6hgqFI1n1Y+2rf/m6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503690; x=
 1668510890; bh=nasadNTIFSQnVJhZ15WImlEOjmdx13wSVUui+IzXtIA=; b=h
 /riLX6+bZkRvDvcPC2uQ4xwCKu0D4Y8dKUntqhzO9hgOIZB+o3WOCuXVniciDe+t
 KbH/MDeCPAHcicQVDRKI+vq1pJf5VnyWa4kMmr/9ezkRiT424TL1WUk1sdA7dnJo
 GPmu3cvn16tF461xVYdteoCkCjTd+HsPiPLwPglJLgdyAP0TvC0ngWTHx/5bZsXK
 mHvb/JhiO4qAVfMCH1haPYNdEqmYaNRXkMmyHxafCVkh0I22OD3ATMLSpEjP5hHP
 i28y7oGFlG4Obf/VtfsweoQUfzomxW2UH0xlFncHbH/H2HUuMs0U8CJtqR0IhvXJ
 aHHP6RHG2uAcAvF24r1gQ==
X-ME-Sender: <xms:ilhzY_Tn6COc1nnLpdK0G7q3xNvmFsTkZY2XIts-tYINmZS78yzt3Q>
 <xme:ilhzYwwXdj_Z0XlJX20hnmX0j77f6xcmDYD-Vd3zuEMM4t-elMA-7ZWJZxo2G7xla
 VvIWK6sVqGAP6syf4M>
X-ME-Received: <xmr:ilhzY03wbLzmdw2-vU_dYkfZvceK5FNkmiHk81TvdZb4uYB0u-_ZKDxM451T2V6EZCtKOvmY-kqwDkxgyB3YI2Dhvg4gPoWWA7UmyB9KeCAtEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ilhzY_DqJqx3ZHsvWDfTRQWQVAMWykLBoSuG2Sh5eTqQH1oIHQtH1Q>
 <xmx:ilhzY4hsKTV8cQ6jndaz7OG8d9LgG14wjxc_UhA3bm5ef3RG7UqBTQ>
 <xmx:ilhzYzoCbFifuRKW6ylAXC2w0FkiUziuxOJSVEsrYpiQ3beBEXjU7Q>
 <xmx:ilhzY_8c9WrL_Jvf4WPD_En5cxcsHAbWG4xPi7lb_uw9UV_SqO5Wnnew-AA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@csie.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Karol Herbst <kherbst@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-12-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-12-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 12/25] drm/connector: Add pixel clock to
 cmdline mode
Message-Id: <166850360503.1237314.16656357691430313065.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:13:25 +0100
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

On Mon, 14 Nov 2022 14:00:31 +0100, Maxime Ripard wrote:
> We'll need to get the pixel clock to generate proper display modes for
> all the current named modes. Let's add it to struct drm_cmdline_mode and
> fill it when parsing the named mode.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
