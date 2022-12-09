Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE6648AF1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 23:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEAA10E085;
	Fri,  9 Dec 2022 22:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B345510E085
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 22:54:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 05462320090F;
 Fri,  9 Dec 2022 17:54:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 09 Dec 2022 17:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670626455; x=
 1670712855; bh=2w8Q3gDoHJ7xfwlWd+vqHAWIlCTMqE+wn4Znlt45bOI=; b=D
 J7rZsLwO92uP++57nWL4H1BwyBr0KYLnFGWkdPMzlYtuFp1iTbhJX2mgysDRCdhF
 T6q4mHMclXNDsYr3fuoeeXEwyyYTiv14+nRUNNfyKdb8d4Ih5bphO/pEXJMq/vfq
 zGg1gO/b/EV2K0UHcOoCXH4xDQPPu+uB3rq71wHhTQglT2QEp9tznfps8AOnSwHc
 xv0bv3py9V2TbJDzQyWaQONEV8w57jdOisHl9VIS19vajVTbB5T3swoUpWOTQ6m6
 AnzmUULgIBVcq9BUf3PViTId86A1+7RSK9TY10YJK90ZqM883oYmykRQl66nWEE3
 W8JdBOMJItf1BQ/YE9Xjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670626455; x=
 1670712855; bh=2w8Q3gDoHJ7xfwlWd+vqHAWIlCTMqE+wn4Znlt45bOI=; b=T
 xvpyupwQxDuNDfhBre/HGW3KSGVztZb38dFPGBBUi1ISifMkPBhRKMuFXQYAFPLR
 V1rP4qoN7KHTJvLb18Q43ZnruoWkfCN4tEFjaNhf7LkxeBWXliBdpOR+zkw0NHkk
 nv8I5M2iE7vmLxBjqzN+yzaYMVXpmXk03xUoWHfAdu40o2pNU6TppkVdXKmiDjWT
 6eFltW6n4+N7unKJGcJ3/yGerDljpmEVxQMAUBuLD+kJ9e8tEJt+FVbiTJDQarJh
 aLdwCtQKvRXld6/njJqC360a9Z1qgo94MnR+UWsVg9Ex49mcXmvlaBQgvm8MezLJ
 In1VWdLNxwLcM2669eUIQ==
X-ME-Sender: <xms:lryTY-GP86-668cpi-aV4CLKXlAINHtWgoVLsRrAlFJkjyZWpWTkjw>
 <xme:lryTY_WEWseN4mEIdRiqrbL5yn-zbSBgrQtUmM8OAjKaziGBw8zpW7s-NTh-eo-Vh
 Yp5jowWEXVIp9tMZ0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lryTY4ISOzRAgKhiueETEGfeJ0TCDrNNkrQ4DRKM4xKvGjwNP-2QVg>
 <xmx:lryTY4EZg2Cc6mFXFVKf0xjHbPqzQOWRSIGSHXyUlBPniYmhO_LFuw>
 <xmx:lryTY0WG631a3oWGIuVlYo8lFUmXra5_t_WdXioYnJcj20NgODoKFQ>
 <xmx:l7yTY6EuO_rVZbKO8m_XMWubJZvbid7j0U0yKAm2ZnZRyQbSL5dKiQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D104FB60086; Fri,  9 Dec 2022 17:54:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
In-Reply-To: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
Date: Fri, 09 Dec 2022 23:53:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Tomi Valkeinen" <tomba@kernel.org>, 
 "Alain Volmat" <alain.volmat@foss.st.com>,
 "Yannick Fertre" <yannick.fertre@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 9, 2022, at 23:05, Uwe Kleine-K=C3=B6nig wrote:
> Some of these dependencies used to be sensible when only a small part =
of
> the platforms supported by ARCH=3Darm could be compiled together in a
> single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a gua=
rd
> for kernel options incompatible with a multiplatform image. See commit
> 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some mo=
re
> details.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Makes sense,

Acked-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/drivers/gpu/drm/omapdrm/Kconfig=20
> b/drivers/gpu/drm/omapdrm/Kconfig
> index 455e1a91f0e5..76ded1568bd0 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_OMAP
>  	tristate "OMAP DRM"
>  	depends on DRM && OF
> -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> +	depends on ARCH_OMAP2PLUS
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
>  	select HDMI

Since the original purpose of the ||ARCH_MULTIPLATFORM was to allow
building the driver on more targets, I wonder if we should instead
make that ||COMPILE_TEST, which would also allow building it on
x86 and others.

> diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
> index f2a880c48485..3c7a5feff8de 100644
> --- a/drivers/gpu/drm/sti/Kconfig
> +++ b/drivers/gpu/drm/sti/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_STI
>  	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
> -	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
> +	depends on OF && DRM && ARCH_STI
>  	select RESET_CONTROLLER
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
> index ded72f879482..fa49cde43bb2 100644
> --- a/drivers/gpu/drm/stm/Kconfig
> +++ b/drivers/gpu/drm/stm/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_STM
>  	tristate "DRM Support for STMicroelectronics SoC Series"
> -	depends on DRM && (ARCH_STM32 || ARCH_MULTIPLATFORM)
> +	depends on DRM && ARCH_STM32
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL_BRIDGE

Same here.

     arnd
