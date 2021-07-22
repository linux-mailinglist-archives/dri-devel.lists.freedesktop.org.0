Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE53D1ED0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F856EC68;
	Thu, 22 Jul 2021 07:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67CE6EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:18:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 91390580A89;
 Thu, 22 Jul 2021 03:18:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 03:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=M
 MS57oheX02/j+i8L4R78gMJwqx7BCT+iNUbaucQL0o=; b=pbHzH66XoVemAYn+n
 0kl+xtwZoTWlmj4B3y1x/tI8esxHfdXOvcdqPMTqytR4n8INwhKL7EMr1nGc9ep7
 uzffQ/N/ceUzWRXwFzLADykEnkg9C0xTB1ScaVGqnoTf6opYywV2/AUuXX1LfkX+
 1l5rjGpQnjr4qQCd7cVdjOSEOwmNLdoeci9f7ed6on0fhcByPOo46Gwuexu1uGaX
 p36bn6V29Pdccsq4RFp0pzJ8gdSzzkDM5Q510PryODYsgxXHsHfKpw/36ufi1kDr
 tpgocoGPx2x7MX/HH6jtrJwp4XgDK9uifMr8R5e489aatJi8V65WhefiUbTWUid6
 yq5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MMS57oheX02/j+i8L4R78gMJwqx7BCT+iNUbaucQL
 0o=; b=oo/cd6FYAjfGq4mDh7z4q5F8hi8ffXIoSX5uZrOcIHkVCRW92Gh8OGSQZ
 d/vqRzQOoJvL8cTY5+nUVTuxfKpl5EIygHrRM1fbPpDR9XmU9xCwQfK6WmM17B0w
 fFXCByc82oqMoUpBCRakI0VTthvW0B0inwLJCTkeEPwts73EO1HM6mC4MUfYC6gG
 Zw6K0gm1Zv6WP6Jw9RmRzF545IiMPkRaN/uDnczbuL4HMZDjNkgKI5o3aDvPNFuO
 oajY7A1S7oaA7vbMUEK37p1tLGnbr05+1y8evSZG9p7ZRiBdrF8vc8ObYukvgXVR
 ec1A2kCG9SRZg4oBEjjEoMHaf+PnQ==
X-ME-Sender: <xms:1xv5YNX6GYxaMU4-W5n5t3QKEyp0q7Yo5urSJ3AU91lMqUlOXzqg6w>
 <xme:1xv5YNlGvTgLyxrolPp9l2jGGh0aGsm2aB0ObVUdUkUV7mXplcs1QuXRb8UuFZo9r
 e1eKNKr4nDbJRJ8cHg>
X-ME-Received: <xmr:1xv5YJZ4qqviH36l_3GFwH02NRaxnDqvS9XcTWQzmSOwTpWWfDz84dSKwmwaRiW_SUqEMwe5oKPJ-aWpu4NZGL5rstHCVph-TbO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1xv5YAWIF8MQcmkV17sj6Db2LOmkOklinoXKUWM6syNpNsAie1y0kA>
 <xmx:1xv5YHksGSwrEmPBwbBqbnMRiReZ1DZJ-xIpC3Ylxf_ORpVIpvw3Bg>
 <xmx:1xv5YNdBH9PshBH8M0p46X6WDa1rDnBQJgzK7-x8E7w9tCotjLZNqw>
 <xmx:2Rv5YJ2SY8YzIfyId2rkqD-Tt5eYeQEpEUlVNnTiiIC5PTHuuQ2CGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:18:46 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:18:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <20210722071844.g2kkmc7y2gcc6nir@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-2-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, linux-mediatek@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 08:22:40AM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
>=20
> The ps8640 driver used the non-atomic variants of the drm_bridge chain
> functions - convert these to the atomic variants.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime
