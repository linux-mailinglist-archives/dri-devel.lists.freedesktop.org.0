Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724B40419A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 01:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FE66E3CE;
	Wed,  8 Sep 2021 23:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85376E3CE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 23:08:35 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id k17so2270477pls.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 16:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZtlzVhWBbwXoavimL5Cu2zNuLqJKyQrs9PtnLoTbBw=;
 b=kSjq7V7UVdcmFJyduvILA7A+e4J9ObyfE9f9UlOv1wvamgAl4MgHpJqYP1XrUEZhuD
 qsMZW0Fk31XflGWEup34tqLssSis/K7KZ1VFRY9uiUuUWwWoHQYync4TQhBzfDNxh2Tv
 UOgVsuOzWCLKEPDsv1L+nBsBQk5yO9jklbAtJDFD1Th25XdzQZGa3b+fMzs2kswPgwWN
 8sKr8mQWjMCY75HA6h2gk7J0vCnx9c19EL7g70oFrnAsU54eBRbWhdip29c8oSPgqgpf
 L5YVWqhWliH0iHZRhi1JBIHkJQ5qPATPl+ulZnecXkpVLPg+9gvZI4nTQS742Q+by/1E
 VlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZtlzVhWBbwXoavimL5Cu2zNuLqJKyQrs9PtnLoTbBw=;
 b=2M2gJNxfk2N1uY03046xWjPiRoeasfgheDzzozb82fOZsERNf3AKfx7tgbGTQ9ebAK
 JZi8c7YC0QOQJ+t2uDff/8mVmW0kA10h9S+p4sSsOTQ6wfCD2uZOR72aed3XnIUcFlKx
 SSQsJwATeYjV8BbP16tsFnUR2j0ZCN29CPPZvx59mccMqvpDnsbjSyTzVAQekfwvvgmH
 cu2ec5thtYoTjerH24KgiDcfhP7zB2x+q4SlzjMnhtrXOM0oRMV70EvjYPCsbCARQ8sv
 eI8+ud8DWZXfu6n2+o3LU/yl8lje6ApzQeSUAhdiPxz/nxZNgHfFkKTqYpZtKekd8xi7
 4Mzw==
X-Gm-Message-State: AOAM530EXrU4S0ySB0UM38xg9vCknchPlupBr+aBHs8gCTItNI8lm4Yh
 lxMBg5/N9DC6P3KilcnEtd2+9bZAWhlUj1SOO26z8w==
X-Google-Smtp-Source: ABdhPJyFn28fS/y5ulgH/27LqxDmH6NBfIEoA9Td+810/fo43QUOaiDpFlx7utmV8lw1jHrEN/4yqFOCMF/8I1/Q04A=
X-Received: by 2002:a17:90a:7301:: with SMTP id m1mr45943pjk.34.1631142514970; 
 Wed, 08 Sep 2021 16:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
 <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
 <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
 <163070152582.405991.9480635890491684680@swboyd.mtv.corp.google.com>
 <CAD=FV=XzPVda==+hkJ8ZJNXz3sT=V+8y4gbsbUik4k3Om_cGvQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XzPVda==+hkJ8ZJNXz3sT=V+8y4gbsbUik4k3Om_cGvQ@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 8 Sep 2021 16:08:23 -0700
Message-ID: <CAOesGMhd+m=hU6Fj3QXxqZb6TFf414UwvQLsLWgxe9Zb=3-tPQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, DTML <devicetree@vger.kernel.org>, 
 Steev Klimaszewski <steev@kali.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>, 
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Core ntin Labbe <clabbe@baylibre.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 Emil Velikov <emil.velikov@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kees Cook <keescook@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Olivier Moysan <olivier.moysan@st.com>, 
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 "ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, 
 =?UTF-8?Q?open_list=3ATEGRA_ARCHITECTURE_SUPPORT_=3Clinux=2D_tegra=40vger=2Ekern?=
 =?UTF-8?Q?el=2Eorg=3E=2C_=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 8, 2021 at 3:36 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Sep 3, 2021 at 1:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Doug Anderson (2021-09-01 16:10:15)
> > > Hi,
> > >
> > > On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
> > > >
> > > > On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > In the patch ("drm/panel-simple-edp: Split eDP panels out of
> > > > > panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> > > > > give everyone who had the old driver enabled the new driver too. If
> > > > > folks want to opt-out of one or the other they always can later.
> > > > >
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > Isn't this a case where the new option should just have had the old
> > > > option as the default value to avoid this kind of churn and possibly
> > > > broken platforms?
> > >
> > > I'm happy to go either way. I guess I didn't do that originally
> > > because logically there's not any reason to link the two drivers going
> > > forward. Said another way, someone enabling the "simple panel" driver
> > > for non-eDP panels wouldn't expect that the "simple panel" driver for
> > > DP panels would also get enabled by default. They really have nothing
> > > to do with one another. Enabling by default for something like this
> > > also seems like it would lead to bloat. I could have sworn that
> > > periodically people get yelled at for marking drivers on by default
> > > when it doesn't make sense.
> > >
> > > ...that being said, I'm happy to change the default as you suggest.
> > > Just let me know.
> >
> > Having the default will help olddefconfig users seamlessly migrate to
> > the new Kconfig. Sadly they don't notice that they should probably
> > disable the previous Kconfig symbol, but oh well. At least with the
> > default they don't go on a hunt/bisect to figure out that some Kconfig
> > needed to be enabled now that they're using a new kernel version.
> >
> > Maybe the default should have a TODO comment next to it indicating we
> > should remove the default in a year or two.
>
> OK, so I'm trying to figure out how to do this without just "kicking
> the can" down the road. I guess your idea is that for the next year
> this will be the default and that anyone who really wants
> "CONFIG_DRM_PANEL_EDP" will "opt-in" to keep it by adding
> "CONFIG_DRM_PANEL_EDP=y" to their config? ...and then after a year
> passes we remove the default? ...but that won't work, will it? Since
> "CONFIG_DRM_PANEL_EDP" will be the default for the next year then you
> really can't add it to the "defconfig", at least if you ever
> "normalize" it. The "defconfig" by definition has everything stripped
> from it that's already the "default", so for the next year anyone who
> tries to opt-in will get their preference stripped.
>
> Hrm, so let me explain options as I see them. Maybe someone can point
> out something that I missed. I'll assume that we'll change the config
> option from CONFIG_DRM_PANEL_SIMPLE_EDP to CONFIG_DRM_PANEL_EDP
> (remove the "SIMPLE" part).
>
> ==
>
> Where we were before my series:
>
> * One config "CONFIG_DRM_PANEL_SIMPLE" and it enables simple non-eDP
> and eDP drivers.
>
> ==
>
> Option 1: update everyone's configs (this patch)
>
> * Keep old config "CONFIG_DRM_PANEL_SIMPLE" but it now only means
> enable the panel-simple (non-eDP) driver.
> * Anyone who wants eDP panels must opt-in to "CONFIG_DRM_PANEL_EDP"
> * Update all configs in mainline; any out-of mainline configs must
> figure this out themselves.
>
> Pros:
> * no long term baggage
>
> Cons:
> * patch upstream is a bit of "churn"
> * anyone with downstream config will have to figure out what happened.
>
> ==
>
> Option 2: kick the can down the road + accept cruft
>
> * Keep old config "CONFIG_DRM_PANEL_SIMPLE" and it means enable the
> panel-simple (non-eDP) driver.
> * Anyone with "CONFIG_DRM_PANEL_SIMPLE" is opted in by default to
> "CONFIG_DRM_PANEL_EDP"
>
> AKA:
> config DRM_PANEL_EDP
>   default DRM_PANEL_SIMPLE
>
> Pros:
> * no config patches needed upstream at all and everything just works!
>
> Cons:
> * people are opted in to extra cruft by default and need to know to turn it off.
> * unclear if we can change the default without the same problems.
>
> ==
>
> Option 3: try to be clever
>
> * Add _two_ new configs. CONFIG_DRM_PANEL_SIMPLE_V2 and CONFIG_DRM_PANEL_EDP.
> * Old config "CONFIG_DRM_PANEL_SIMPLE" gets marked as "deprecated".
> * Both new configs have "default CONFIG_DRM_PANEL_SIMPLE"
>
> Now anyone old will magically get both the new config options by
> default. Anyone looking at this in the future _won't_ set the
> deprecated CONFIG_DRM_PANEL_SIMPLE but will instead choose if they
> want either the eDP or "simple" driver.
>
> Pros:
> * No long term baggage.
> * Everyone is transitioned automatically by default with no cruft patches.
>
> Cons:
> * I can't think of a better name than "CONFIG_DRM_PANEL_SIMPLE_V2" and
> that name is ugly.
>
> ==
>
> Option 4: shave a yak
>
> When thinking about this I came up with a clever idea of stashing the
> kernel version in a defconfig when it's generated. Then you could do
> something like:
>
> config DRM_PANEL_EDP
>   default DRM_PANEL_SIMPLE if DEFCONFIG_GENERATED_AT <= 0x00050f00
>
> That feels like a good idea to me but who knows what others would
> think. In general I think this series already shaves enough yaks. This
> isn't a new problem we're trying to solve so it seems like we should
> pick one of the options above.
>
> ==
>
> Unless I get an explicit NAK from someone like Olof or Arnd or I hear
> that everyone loves Option #3 I'll probably just stick with the
> existing approach since:
>
> * Olof's wording didn't make it sound like a strong objection.

Yeah, not a strong objection but an enquiry if there's a better way to
handle it. TL;DR: I don't think there really is.

My comment mostly came from the fact that when olddefconfig gets
broken like this, we tend to have a bunch of patches trickle in over
time as downstream users discover the need to turn on the new option.
You covered (most) of that  by doing the appropriate defconfigs to
this patch series, so it won't be as bad (besides any newly added
defconfigs during the same release, and we're quite careful about
doing that these days).

I think most of the other options, besides 2, are just more overhead
than needed here. So I'd be fine with just picking up option 1.

What's clear is that this is not a very convenient activity that
scales, but we don't do it all that often. This is where something
like a "HAVE_EDP" type config that the platform can provide helps, but
adding it just for this rework seems to be more work than it's worth.

> * From git history it looks as if config patches don't necessarily
> land through the SoC tree and thus I'd by default follow the
> suggestions of the DRM folks. Andrzej suggested going with the
> existing approach as long as I changed the symbol names and re-ordered
> the patches.

Right, Kconfig changes usually go with the driver. dts and defconfig
changes go to the SoC tree though since otherwise we end up with a
bunch of churn and conflicts.

> Please yell if anything above sounds wrong! I'll probably try to send
> out a new version tomorrow or the next day, but I won't land it right
> away to give people time to yell.

I'd leave it up to you if you want to do option 1 or 2, since there's
no really convenient way to do it better. 3 seems to be a bigger
hammer than what this situation calls for IMHO.


-Olof
