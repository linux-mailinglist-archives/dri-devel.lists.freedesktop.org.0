Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35F3A3550
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BAC6EDE6;
	Thu, 10 Jun 2021 21:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAC26EDE6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:00:17 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso1073458otj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lm+Ae7nfiT7SXg2tZOk8aYevhy8Lj2hQWOQsU0IZt/M=;
 b=Ezn2p+uKYTKIGgYa1c9rvNwhyhKxX03HUvOZiKzXN73ojjnVz2kPsQ3aZXMrShoZR0
 QTL7tr6RpPmZD+9xaqT67rFuI89xB2bKjojg9jJQJGPhZRMjTWZDrTb3DrLoiW0kx+B0
 RMKEk4szvMdwB9LjpzA0aLyJaDw+yCqu4s40s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lm+Ae7nfiT7SXg2tZOk8aYevhy8Lj2hQWOQsU0IZt/M=;
 b=oOtpdwEt6G3tq4q7ZblXuOc5FFRsllsTaENnQi7lnddu9FJsJ8p41g6N6QnItqOKIt
 JX18By2iX4wdk32zSyu+3QOjYDVzkE8Z4WadJvCn6S9kIbYWUUEs36wRPGMI2Z6hbz37
 roRR6QJ/zuqxLTJdTlv4h6XvXUgVaFoU9KHjPhjDqmCPhK7NC3DH9HEw4+43c286hytb
 iRVt1yrgD02rBAg5gMqsjdtetVpzU1+pFcZ9re0zI8OqHTQvOZC0QL57UMM7cyolV75T
 2SvddU2iiYBZqLIDaE22Wei2OhV6x+m6ZHdUweF0za7/V0ZJ6hq0UuuATnebrc9YfA54
 qn9g==
X-Gm-Message-State: AOAM533R/Lg3ShxWIXN4hGQ/1Dh9k/wo1moicrBHg8BWzsIxBwLQN7ma
 HPDfSEKO/wZkZysH3RCVW+PNQUOglRbXl9sabDev2g==
X-Google-Smtp-Source: ABdhPJxVUzKUU8sbNzcBb6/RcEtnbf3w8N/jU9FmsnE6a/Jv7Wc5m/h2bTD2B6AKhmZzoZPk3alVV+fC/F0nGxAed5k=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr221564otg.303.1623358816372; 
 Thu, 10 Jun 2021 14:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210610174731.1209188-1-maxime@cerno.tech>
In-Reply-To: <20210610174731.1209188-1-maxime@cerno.tech>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Jun 2021 23:00:05 +0200
Message-ID: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Steven Price <steven.price@arm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Joel Stanley <joel@jms.id.au>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
>
> Let's document what we expect.
>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alison Wang <alison.wang@nxp.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v2:
>   - Take into account the feedback from Laurent and Lidiu to no longer
>     force generic properties, but prefix vendor-specific properties with
>     the vendor name

I'm pretty sure my r-b was without this ... Why exactly do we need
this? KMS is meant to be fairly generic (bugs throw a wrench around
here sometimes, and semantics can be tricky). If we open up the door
to yolo vendor properties in upstream, then that goal is pretty much
written off. And we've been there with vendor properties, it's a
giantic mess.

Minimally drop my r-b, I'm definitely not in support of this idea.

If there's a strong consensus that we really need this then I'm not
going to nack this, but this really needs a pile of acks from
compositor folks that they're willing to live with the resulting
fallout this will likely bring. Your cc list seems to have an absence
of compositor folks, but instead every driver maintainer. That's
backwards. We make uapi for userspace, not for kernel driver
maintainers!

ltdr; I'd go back to v2. And then cc compositor folks on this to get their =
ack.
-Daniel

> Changes from v1:
>   - Typos and wording reported by Daniel and Alex
> ---
>  Documentation/gpu/drm-kms.rst | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rs=
t
> index 87e5023e3f55..bbe254dca635 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,33 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space devel=
opers.
>  For the driver APIs, see the other sections.
>
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above.:
> +
> +- Before the introduction of any vendor-specific properties, they must
> +  be first checked against the generic ones to avoid any conflict or
> +  redundancy.
> +
> +- Vendor-specific properties must be prefixed by the vendor's name,
> +  following the syntax "$vendor:$property".
> +
> +- Generic properties must be standardized, with some documentation to
> +  describe how the property can be used.
> +
> +- Generic properties must provide a generic helper in the core code to
> +  register that property on the object it attaches to.
> +
> +- Generic properties content must be decoded by the core and provided in
> +  the object's associated state structure. That includes anything
> +  drivers might want to precompute, like :c:type:`struct drm_clip_rect
> +  <drm_clip_rect>` for planes.
> +
> +- An IGT test should be submitted.
> +
>  Property Types and Blob Property Support
>  ----------------------------------------
>
> --
> 2.31.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
