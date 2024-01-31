Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9D8438BE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E873113A68;
	Wed, 31 Jan 2024 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A286D113984
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:34:07 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc6432ee799so4739342276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 22:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706682787; x=1707287587; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
 b=uMMDW7fCtZDuZ7Wh2LP5ISuBjfbdns5XX0rJpLQk13TBdEtys47/y/eBXLeqJmBHIb
 3A3FiPywbNKcHOXBPMk/iQHSp5WRyGXA2gz4HYtdMsAodo45S6qLQI7As5GAQuwZ3FV8
 4QPRpiAbOmqSffABLGG5p64z9tO5hFYyguMkE4vvQSB6pbY5Mqkb7f6Yx1BEq/d22G3H
 Pwnt/BmTLxN+1Ht9pH93a6s3rGHxC6HK/x9IszlnZm6ygUiTauKcSvsZj779AdlOAotf
 /ZBxihGXFPYyuSEKl7I5uSIW65DEJhdP/3OiJhB6zpeNdhPaheJhvOyy9wPyfMNuLt8j
 szPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706682787; x=1707287587;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
 b=i05gmJtTD8i8TsFOz2VYjWDvqEbq9aHq2ztwJ3C9KItbdKNNjBsQZRNy1VnY8G+691
 8yg64qc6PDuzbT++GiQ/8xtMwPDMohrgWx41S1SD7DFD7lFajdS4IfmoN/+TNcD1OCDv
 IvWrGGC5wL4KaoPVMxzd2csK0atkI8QH8JfrglFVrAa+Ox5iiN8cKmSebDL2Ry4zuDIv
 UMYZlExjd7PjZwy7/XEWb4Pt9yJ9UauFRlZwup7lq99zR26nlzpAk11XX5lxLK3Yubf7
 PltNa4TndDNgi2BHVp/+pgtqW5box+OVgqvLA5kmQ3f27s8DFqsTMVZGYYNvgnsDvRib
 i+Zg==
X-Gm-Message-State: AOJu0Yzu/t8wdiEx6lXZvJT7ms8ImokKxgmiuvxjg5ElUZQ7PqjCbpWe
 0SZf+dgq0rNA3y87oeYHtkIjzsZUnVAjTjdo+GdXRww6plzM+3fjwXWlsOcw5tfAHXAwBFPADnF
 WGqS+LSBxmEaPLhQi90waTQ9j29MHxLMj90eVOA==
X-Google-Smtp-Source: AGHT+IFxRXwNP5PRj+1YvzHjYbCYITU/P5nsMmG4/Z+5FnhpEGiUV21GZeIbWwZE5W49t+z2Do1jj0wx+tXggTPULI4=
X-Received: by 2002:a5b:582:0:b0:dc2:1c77:ca7 with SMTP id
 l2-20020a5b0582000000b00dc21c770ca7mr757962ybp.36.1706682786826; 
 Tue, 30 Jan 2024 22:33:06 -0800 (PST)
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:32:56 +0200
Message-ID: <CAA8EJpq79tOCH3vK+Hh_XD4mtj1GVgVvwehQF4BfxTjwPi_fHQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] gpu: drm: switch to use
 of_graph_get_next_device_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 31 Jan 2024 08:20:59 +0000
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
Cc: dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 =?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Saravana Kannan <saravanak@google.com>, Fabio Estevam <festevam@gmail.com>,
 Helge Deller <deller@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Harvey <tharvey@gateworks.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Leo Yan <leo.yan@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/armada/armada_drv.c                   | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                     | 2 +-
>  drivers/gpu/drm/drm_of.c                              | 6 +++---
>  drivers/gpu/drm/meson/meson_drv.c                     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.c                         | 2 +-
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                     | 2 +-
>  drivers/gpu/drm/omapdrm/dss/base.c                    | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                     | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 +-
>  drivers/gpu/drm/stm/ltdc.c                            | 4 ++--
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  12 files changed, 16 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
