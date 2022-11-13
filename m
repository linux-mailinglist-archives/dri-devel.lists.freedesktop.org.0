Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279B627813
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A353310E281;
	Mon, 14 Nov 2022 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029CF10E110
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 22:35:51 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id w4so5950169qts.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 14:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2UWIwxNMt9Li5DI9V3Ue/+A2ETbpfwK4uJjlNth28Ps=;
 b=cxos6M6SEMWjz70hcYfwJn7Qy9x3ScQZdWjcWHcTUuPDd6QIkxHfs4TdC7er0cgTfw
 Zecl1ammtXTh3CRumNopuCdrO/B9HdufOATVFx7LmHWfcuepu8nGRPAXZimVwU33NdJY
 fSpdh/6V9x/8s+acnZlcPXnCq3SzIgJYAOJ+MdHag7DONXMIur05Qu2T29C+PPj+G5FS
 51vaHNJTqtvQKEh0MKIsH8wIeeMtk/77Zn6zHSFYDKwwTYJrTvxOcJz1pI56sykta8ez
 ucf+QXApfLU7u3dxQYz1YwJFVAwCWBLrNvZsrMdMSVYHA3yVHW95iD4uAWPO1ebw8AQZ
 l5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UWIwxNMt9Li5DI9V3Ue/+A2ETbpfwK4uJjlNth28Ps=;
 b=REKW59RKo9XTsUkywodU9JDkfdDDeQIk31tZz6wnqqPhwhYRybuaCaZ9oXVn8MstWg
 fZnvIP+sbKvc+7rho0Ka5+VxBDOiDVSnmDkdweGUIVJqsvY/KuJIWSQyURQJ0ymydJzG
 9MgqqeBiUvfcoFmGdgbEq7E5elqRWk9JIp3czgwuK3D7hiYH6WjEw+QAYXo2696ZXUqK
 U2SppqDU21Ud5ODnhLgte5E/E5bJg1phF9eQ0x2yH0iq1zezQ/vQePUdleV4f5poYaFY
 RQKbD7GFtWaMJOMPttVyB/ZdK4hrWihs8ddn9U4uSImBf9oE4bg5+V+9wdcSMfPkm/k5
 kMgg==
X-Gm-Message-State: ANoB5pmJt1FeFhaVafYEfH/btOzyc9jtS6KtEMrziy7S3IwVb2GlTcg7
 sdhq0eDxTibN6TezcxVK0AQ=
X-Google-Smtp-Source: AA0mqf6n/LTjELlMgOPAUHKCZj998ajlsJmr6FJtHheLBD4DRKv0w+DZx/+jLTxZzLzeUXXjccj7Rg==
X-Received: by 2002:a05:622a:4806:b0:3a4:f140:f707 with SMTP id
 fb6-20020a05622a480600b003a4f140f707mr10057169qtb.317.1668378951056; 
 Sun, 13 Nov 2022 14:35:51 -0800 (PST)
Received: from shaak (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55]) by smtp.gmail.com with ESMTPSA id
 bk8-20020a05620a1a0800b006f9f3c0c63csm5482646qkb.32.2022.11.13.14.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 14:35:50 -0800 (PST)
Date: Sun, 13 Nov 2022 17:35:46 -0500
From: Liam Beguin <liambeguin@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 13/65] clk: lmk04832: clkout: Add a determine_rate hook
Message-ID: <Y3FxQsT240Wm0G6g@shaak>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
X-Mailman-Approved-At: Mon, 14 Nov 2022 08:47:13 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Nov 04, 2022 at 02:17:30PM +0100, Maxime Ripard wrote:
> The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

This is correct, the set_parent hook is effectively unused at the
moment. It was implemented as a way for consumers to select the parent
themselves.

The LMK04832 is used in JESD204 applications where devices need a device
clock as well as a sysref clock. Since this is determined by the
hardware layout, a devicetree option is used to select the inital state
of the clkout mux. This is set at the end of lmk04832_register_clkout().

> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
> 
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
> 
> Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
> unlikely.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Liam Beguin <liambeguin@gmail.com>

Cheers,
Liam

> ---
>  drivers/clk/clk-lmk04832.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
> index f416f8bc2898..f68bb0affdad 100644
> --- a/drivers/clk/clk-lmk04832.c
> +++ b/drivers/clk/clk-lmk04832.c
> @@ -1281,6 +1281,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
>  	.is_enabled = lmk04832_clkout_is_enabled,
>  	.prepare = lmk04832_clkout_prepare,
>  	.unprepare = lmk04832_clkout_unprepare,
> +	.determine_rate = __clk_mux_determine_rate,
>  	.set_parent = lmk04832_clkout_set_parent,
>  	.get_parent = lmk04832_clkout_get_parent,
>  };
> 
> -- 
> b4 0.11.0-dev-99e3a
> 
