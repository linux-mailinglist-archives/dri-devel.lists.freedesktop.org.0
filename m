Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35748438BC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDA1113A6A;
	Wed, 31 Jan 2024 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672ED10E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:31:23 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-603fd31f5c2so5040217b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 22:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706682621; x=1707287421; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
 b=hO9klg+IjfnyzmFuxhq09MxS6o41N3RkO5sLzntgfU0Zk88Ifu01FuGWgiUW6encWQ
 jmT3BOy3LZwKFYRu9OzS4wm5bVf3K0QnrDujlx5Ko1napQvu07svHWgN6/yir5WetErP
 2JxMyfbkR7O1kVHBnbtYWLjoLSWN+KPYO64J91Hx8PCu1YGhpuhvFPFgHXIM3WlnE5nm
 kI2tu5AyBWZ4QB1eQwF2OPXxT6MWJYf5qf5UnyTgFWl4KAs9Ys2jK9WQB1Q1+bneJdJm
 W1kid6faCxTgoBDPU/7JTxw/queAc4yjxrFtQPKm7jpPBPmVCG/q5JF9MkGD7dESnR3M
 tfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706682621; x=1707287421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
 b=DpJcIuUhfRgOz9nmI2Ep5Jd6729p0VmOT0Cv65y3HvkU+4nlwW3F2hOcaIue1rjtrF
 wJ1GU34jomC04sYY5NgJ5dSRHYevpGSkoJsHdY7X6Qtabe63MjBnUfJVa2XwuyWKuwu6
 VRb0Myw/X2mL4ApBPjI/WJ3+cW1GIcIkYIgPPgUCW8/05IxeO7mSgAG0bVkJsFXffQgX
 qtI6FLpZiCJ5F/Cg51+Oeb0/UvqSxBqRwhUyhL4UdVYSVNBJb5l3f/9QtcqSno05bVBI
 JJVkEPo3mwHGQ47YWpU6edHMIjtJ46KORiA3+nXq+X1TvBnchksEPzBpxTPZ6PoDAdUY
 cvlg==
X-Gm-Message-State: AOJu0YyMQx4XXqSE77xx5bQhwB1DckfeMfiPTprgu+WAAK77tjlIEE6+
 QKHmFx0W+ZcQ5UmdCqCIqBY7nS1nC4spmG3D4MPu//Lcuy9q743GPK8Inxu05emJaMF60U/9Bcg
 OLl7++IJ5DwNLeq7gU5a714VNooZ/+pljknhIlw==
X-Google-Smtp-Source: AGHT+IFCSuHGBgOcgNRm+Jyx9Rk92WC70s7Qe1r45Ekea56q3x+YWZYnfOl+X2xsR2ea9MpX12ltkU9QLuvg4lUUs5g=
X-Received: by 2002:a81:6d16:0:b0:5ff:8152:64b with SMTP id
 i22-20020a816d16000000b005ff8152064bmr311187ywc.15.1706682621572; Tue, 30 Jan
 2024 22:30:21 -0800 (PST)
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:30:10 +0200
Message-ID: <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] of: property: use unsigned int return on
 of_graph_get_endpoint_count()
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
> The return type and the variable of of_graph_get_endpoint_count()
> should be unsigned. Tidyup it.

'the variable'?

I'd have added a few words telling that return type can be unsigned
because there is no error reporting for this function.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 2 +-
>  include/linux/of_graph.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 4e879faa1710..25d73409aeee 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -817,7 +817,7 @@ EXPORT_SYMBOL(of_graph_get_remote_port);
>   *
>   * Return: count of endpoint of this device node
>   */
> -int of_graph_get_endpoint_count(const struct device_node *np)
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         struct device_node *endpoint;
>         int num = 0;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..a4bea62bfa29 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -41,7 +41,7 @@ struct of_endpoint {
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>                                 struct of_endpoint *endpoint);
> -int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>                                         struct device_node *previous);
> @@ -68,7 +68,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
>         return -ENOSYS;
>  }
>
> -static inline int of_graph_get_endpoint_count(const struct device_node *np)
> +static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         return 0;
>  }
> --
> 2.25.1
>


--
With best wishes
Dmitry
