Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1E40113F
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 20:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7F889B3C;
	Sun,  5 Sep 2021 18:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D7F89B3C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 18:55:18 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c7e7c54e-0e7a-11ec-9416-0050568cd888;
 Sun, 05 Sep 2021 18:55:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A14BA194B5D;
 Sun,  5 Sep 2021 20:54:57 +0200 (CEST)
Date: Sun, 5 Sep 2021 20:55:04 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
 Michael Walle <michael@walle.cc>, NXP Linux Team <linux-imx@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nishanth Menon <nm@ti.com>, Olivier Moysan <olivier.moysan@st.com>,
 Olof Johansson <olof@lixom.net>, Otavio Salvador <otavio@ossystems.com.br>,
 Paul Cercueil <paul@crapouillou.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tony Lindgren <tony@atomide.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Subject: Re: [PATCH v3 00/16] eDP: Support probing eDP panels dynamically
 instead of hardcoding
Message-ID: <YTUSiHiCgihz1AcO@ravnborg.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Wed, Sep 01, 2021 at 01:19:18PM -0700, Douglas Anderson wrote:
> The goal of this patch series is to move away from hardcoding exact
> eDP panels in device tree files. As discussed in the various patches
> in this series (I'm not repeating everything here), most eDP panels
> are 99% probable and we can get that last 1% by allowing two "power
> up" delays to be specified in the device tree file and then using the
> panel ID (found in the EDID) to look up additional power sequencing
> delays for the panel.
> 
> This patch series is the logical contiunation of a previous patch
> series where I proposed solving this problem by adding a
> board-specific compatible string [1]. In the discussion that followed
> it sounded like people were open to something like the solution
> proposed in this new series.
> 
> In version 2 I got rid of the idea that we could have a "fallback"
> compatible string that we'd use if we didn't recognize the ID in the
> EDID. This simplifies the bindings a lot and the implementation
> somewhat. As a result of not having a "fallback", though, I'm not
> confident in transitioning any existing boards over to this since
> we'll have to fallback to very conservative timings if we don't
> recognize the ID from the EDID and I can't guarantee that I've seen
> every panel that might have shipped on an existing product. The plan
> is to use "edp-panel" only on new boards or new revisions of old
> boards where we can guarantee that every EDID that ships out of the
> factory has an ID in the table.
> 
> Version 3 of this series now splits out all eDP panels to their own
> driver and adds the generic eDP panel support to this new driver. I
> believe this is what Sam was looking for [2].
> 
> [1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
> [2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/
> 
> Changes in v3:
> - Decode hex product ID w/ same endianness as everyone else.
> - ("Reorder logicpd_type_28...") patch new for v3.
> - Split eDP panels patch new for v3.
> - Move wayward panels patch new for v3.
> - ("Non-eDP panels don't need "HPD" handling") new for v3.
> - Split the delay structure out patch just on eDP now.
> - ("Better describe eDP panel delays") new for v3.
> - Fix "prepare_to_enable" patch new for v3.
> - ("Don't re-read the EDID every time") moved to eDP only patch.
> - Generic "edp-panel" handled by the eDP panel driver now.
> - Change init order to we power at the end.
> - Adjust endianness of product ID.
> - Fallback to conservative delays if panel not recognized.
> - Add Sharp LQ116M1JW10 to table.
> - Add AUO B116XAN06.1 to table.
> - Rename delays more generically so they can be reused.
> 
> Changes in v2:
> - No longer allow fallback to panel-simple.
> - Add "-ms" suffix to delays.
> - Don't support a "fallback" panel. Probed panels must be probed.
> - Not based on patch to copy "desc"--just allocate for probed panels.
> - Add "-ms" suffix to delays.
> 
> Douglas Anderson (16):
>   dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
>   drm/edid: Break out reading block 0 of the EDID
>   drm/edid: Allow the querying/working with the panel ID from the EDID
>   drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
>   drm/panel-simple-edp: Split eDP panels out of panel-simple
>   ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
>   arm64: defconfig: Everyone who had PANEL_SIMPLE now gets
>     PANEL_SIMPLE_EDP
>   MIPS: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
>   drm/panel-simple-edp: Move some wayward panels to the eDP driver
>   drm/panel-simple: Non-eDP panels don't need "HPD" handling
>   drm/panel-simple-edp: Split the delay structure out
>   drm/panel-simple-edp: Better describe eDP panel delays
>   drm/panel-simple-edp: hpd_reliable shouldn't be subtraced from
>     hpd_absent
>   drm/panel-simple-edp: Fix "prepare_to_enable" if panel doesn't handle
>     HPD
>   drm/panel-simple-edp: Don't re-read the EDID every time we power off
>     the panel
>   drm/panel-simple-edp: Implement generic "edp-panel"s probed by EDID

Thanks for looking into this. I really like the outcome.
We have panel-simple that now (mostly) handle simple panels,
and thus all the eDP functionality is in a separate driver.

I have provided a few nits.
My only take on this is the naming - as we do not want to confuse
panel-simple and panel-edp I strongly suggest renaming the driver to
panel-edp.
And then rename the corresponding Kconfig entry.

With these few changes all patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

For bisectability I suggest to move the defconfig patches up before you
introduce the new Kconfig symbol. Or maybe they will be added via
another tree and then this is not possible to control

I assume you will apply the patches yourself.

Thanks again!

	Sam
