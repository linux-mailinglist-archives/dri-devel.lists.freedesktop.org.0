Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2F4006BF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 22:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA956E8D9;
	Fri,  3 Sep 2021 20:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D866E8D9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 20:38:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25CE160F11;
 Fri,  3 Sep 2021 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630701527;
 bh=VPiKJsT2BC+jznkBKIDvLFaZ9KWcnhXM3FTSZYnsXbE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tBcYBWGO8jgrSa0BkPfGeEv13zdeknqSBIX7q2eEAaFW2UoYM8Ez2UngeTmH/t4FK
 Nw7H2t7dpzl5is+a38LKPg80GMSa/0OYapaKUPHwiuVJRywVaaSpkjB0nx4xqz0MPe
 iKZSEjz3JfLWe1etKC8tZPTsMZfK1CUZgZFbAPQCyX6yStnz2UHx9nceis6aKUJuee
 JBxMrvxEqUxGk6Ga5rbfhzU6t1erU3/cyKPPAglZOi02fliGamxwM1+PEdUPHupsT8
 QzF8+tGA8wXWm3+Ukr1IB1XoOWeTDdDVKNoBt4V0Gq4XMjYXTeb/RK3vsyiVyhiQan
 TAr1gcPv9jo7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
 <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
 <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 DTML <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Core
 ntin Labbe <clabbe@baylibre.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, Emil Velikov <emil.velikov@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Martin =?utf-8?q?J=C3=BCcker?= <martin.juecker@gmail.com>, NXP Linux Team <lin
 ux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Tony Lindgren <tony@atomide.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
 <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 open list:TEGRA ARCHITECTURE SUPPORT <linux-
 tegra@vger.kernel.org>, =?utf-8?q?=C5=81ukasz?= Stelmach
 <l.stelmach@samsung.com>; 
To: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>
Date: Fri, 03 Sep 2021 13:38:45 -0700
Message-ID: <163070152582.405991.9480635890491684680@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Doug Anderson (2021-09-01 16:10:15)
> Hi,
>=20
> On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org>=
 wrote:
> > >
> > > In the patch ("drm/panel-simple-edp: Split eDP panels out of
> > > panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> > > give everyone who had the old driver enabled the new driver too. If
> > > folks want to opt-out of one or the other they always can later.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Isn't this a case where the new option should just have had the old
> > option as the default value to avoid this kind of churn and possibly
> > broken platforms?
>=20
> I'm happy to go either way. I guess I didn't do that originally
> because logically there's not any reason to link the two drivers going
> forward. Said another way, someone enabling the "simple panel" driver
> for non-eDP panels wouldn't expect that the "simple panel" driver for
> DP panels would also get enabled by default. They really have nothing
> to do with one another. Enabling by default for something like this
> also seems like it would lead to bloat. I could have sworn that
> periodically people get yelled at for marking drivers on by default
> when it doesn't make sense.
>=20
> ...that being said, I'm happy to change the default as you suggest.
> Just let me know.

Having the default will help olddefconfig users seamlessly migrate to
the new Kconfig. Sadly they don't notice that they should probably
disable the previous Kconfig symbol, but oh well. At least with the
default they don't go on a hunt/bisect to figure out that some Kconfig
needed to be enabled now that they're using a new kernel version.

Maybe the default should have a TODO comment next to it indicating we
should remove the default in a year or two.
