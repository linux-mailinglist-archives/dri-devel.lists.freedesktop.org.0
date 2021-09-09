Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB946404253
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 02:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBE36E3EC;
	Thu,  9 Sep 2021 00:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD766E3E3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 00:32:57 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id z2so182289iln.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5TYYBxc50K8ZMZBZ7awprT/bOkKTiGesfrb7WFjJZ+A=;
 b=KCg85QMP/OVnq6/fqe2waVZlGw1gFTsTbflgSC3G8O1iDp1IJHUm3MOwpZoQjxxDR7
 Atw25rhjAEpmxxhj1rRyXedydjURMxf4JnVSadGKtWgcyetFjVG75upvVHgaoqHaOe7Q
 i7ClThKtbyUxOILSABwytp3A6HENqxe+XgPEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TYYBxc50K8ZMZBZ7awprT/bOkKTiGesfrb7WFjJZ+A=;
 b=jv9w9SEgsLlSlXZZcOpJcJvgRIC0z3u5yoz5tW1RVLrtIXteKamJLmhcOcaA/7MCXB
 9BQQ5iSpK3x84DnsDZvg2ZNk+XRfva4Xa0FIvQFCLcTSZ6VJGlpGRCrXMgTOCB/EIWXt
 gdg4PqFU3Pxt9Qj4qwi0HZdHwDbUkN5t10w+oGETzwEKZOJ/YG8p9hoValPrbkXX3IcP
 TT5hYSuh3cTz9Pq0VPM33eVzq3JQQCy2GbRrDZF4J621g0E/4zBAtWAmfa/qs7Anz5O5
 bfG2A9IADmLBmKFHdFY+Gay9hG0b6hLiD4kIki+m+qDcQGMomUsKs4n/ulGAFA1EuavK
 f5iQ==
X-Gm-Message-State: AOAM5332kgPsED3Q1Ot1a0KrmzBGTFVI0YLQEZrsqiolmB3MQy50hggs
 6FlU8ZDjUs33YQ5T5Ni3PztnKOa4KZIOOw==
X-Google-Smtp-Source: ABdhPJwrMhZ0YwhPXMlqSaVzd9E0SI8seN/2wwG0K1R2UCHFk20hC3g5qpv0Ujr1IzWwx1eR9ds6NQ==
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr177575ilt.278.1631147576736;
 Wed, 08 Sep 2021 17:32:56 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id f2sm115150ioz.14.2021.09.08.17.32.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 17:32:56 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id v16so130231ilo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 17:32:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:: with SMTP id
 d14mr150446ilv.142.1631147079713; 
 Wed, 08 Sep 2021 17:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <YTUSiHiCgihz1AcO@ravnborg.org>
In-Reply-To: <YTUSiHiCgihz1AcO@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Sep 2021 17:24:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+dnyuGc9OuvMJpYWVx1x6yYQPJgi6fh+6Ne37+veedw@mail.gmail.com>
Message-ID: <CAD=FV=U+dnyuGc9OuvMJpYWVx1x6yYQPJgi6fh+6Ne37+veedw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>, 
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Corentin Labbe <clabbe@baylibre.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Emil Velikov <emil.velikov@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Grygorii Strashko <grygorii.strashko@ti.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
 Michael Walle <michael@walle.cc>, NXP Linux Team <linux-imx@nxp.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nishanth Menon <nm@ti.com>, 
 Olivier Moysan <olivier.moysan@st.com>, Olof Johansson <olof@lixom.net>, 
 Otavio Salvador <otavio@ossystems.com.br>, Paul Cercueil <paul@crapouillou.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>, 
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Stefan Wahren <stefan.wahren@i2se.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tony Lindgren <tony@atomide.com>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-mips <linux-mips@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, 
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
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

Hi,

On Sun, Sep 5, 2021 at 11:55 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas,
>
> On Wed, Sep 01, 2021 at 01:19:18PM -0700, Douglas Anderson wrote:
> > The goal of this patch series is to move away from hardcoding exact
> > eDP panels in device tree files. As discussed in the various patches
> > in this series (I'm not repeating everything here), most eDP panels
> > are 99% probable and we can get that last 1% by allowing two "power
> > up" delays to be specified in the device tree file and then using the
> > panel ID (found in the EDID) to look up additional power sequencing
> > delays for the panel.
> >
> > This patch series is the logical contiunation of a previous patch
> > series where I proposed solving this problem by adding a
> > board-specific compatible string [1]. In the discussion that followed
> > it sounded like people were open to something like the solution
> > proposed in this new series.
> >
> > In version 2 I got rid of the idea that we could have a "fallback"
> > compatible string that we'd use if we didn't recognize the ID in the
> > EDID. This simplifies the bindings a lot and the implementation
> > somewhat. As a result of not having a "fallback", though, I'm not
> > confident in transitioning any existing boards over to this since
> > we'll have to fallback to very conservative timings if we don't
> > recognize the ID from the EDID and I can't guarantee that I've seen
> > every panel that might have shipped on an existing product. The plan
> > is to use "edp-panel" only on new boards or new revisions of old
> > boards where we can guarantee that every EDID that ships out of the
> > factory has an ID in the table.
> >
> > Version 3 of this series now splits out all eDP panels to their own
> > driver and adds the generic eDP panel support to this new driver. I
> > believe this is what Sam was looking for [2].
> >
> > [1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
> > [2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/
> >
> > Changes in v3:
> > - Decode hex product ID w/ same endianness as everyone else.
> > - ("Reorder logicpd_type_28...") patch new for v3.
> > - Split eDP panels patch new for v3.
> > - Move wayward panels patch new for v3.
> > - ("Non-eDP panels don't need "HPD" handling") new for v3.
> > - Split the delay structure out patch just on eDP now.
> > - ("Better describe eDP panel delays") new for v3.
> > - Fix "prepare_to_enable" patch new for v3.
> > - ("Don't re-read the EDID every time") moved to eDP only patch.
> > - Generic "edp-panel" handled by the eDP panel driver now.
> > - Change init order to we power at the end.
> > - Adjust endianness of product ID.
> > - Fallback to conservative delays if panel not recognized.
> > - Add Sharp LQ116M1JW10 to table.
> > - Add AUO B116XAN06.1 to table.
> > - Rename delays more generically so they can be reused.
> >
> > Changes in v2:
> > - No longer allow fallback to panel-simple.
> > - Add "-ms" suffix to delays.
> > - Don't support a "fallback" panel. Probed panels must be probed.
> > - Not based on patch to copy "desc"--just allocate for probed panels.
> > - Add "-ms" suffix to delays.
> >
> > Douglas Anderson (16):
> >   dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
> >   drm/edid: Break out reading block 0 of the EDID
> >   drm/edid: Allow the querying/working with the panel ID from the EDID
> >   drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
> >   drm/panel-simple-edp: Split eDP panels out of panel-simple
> >   ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
> >   arm64: defconfig: Everyone who had PANEL_SIMPLE now gets
> >     PANEL_SIMPLE_EDP
> >   MIPS: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
> >   drm/panel-simple-edp: Move some wayward panels to the eDP driver
> >   drm/panel-simple: Non-eDP panels don't need "HPD" handling
> >   drm/panel-simple-edp: Split the delay structure out
> >   drm/panel-simple-edp: Better describe eDP panel delays
> >   drm/panel-simple-edp: hpd_reliable shouldn't be subtraced from
> >     hpd_absent
> >   drm/panel-simple-edp: Fix "prepare_to_enable" if panel doesn't handle
> >     HPD
> >   drm/panel-simple-edp: Don't re-read the EDID every time we power off
> >     the panel
> >   drm/panel-simple-edp: Implement generic "edp-panel"s probed by EDID
>
> Thanks for looking into this. I really like the outcome.
> We have panel-simple that now (mostly) handle simple panels,
> and thus all the eDP functionality is in a separate driver.
>
> I have provided a few nits.
> My only take on this is the naming - as we do not want to confuse
> panel-simple and panel-edp I strongly suggest renaming the driver to
> panel-edp.

Sure, I'll do that. I was trying to express the fact that the new
"panel-edp" driver won't actually handle _all_ eDP panels, only the
eDP panels that are (comparatively) simpler. For instance, I'm not
planning to handle panel-samsung-atna33xc20.c in "panel-edp". I guess
people will figure it out, though.


> And then rename the corresponding Kconfig entry.
>
> With these few changes all patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, I'll add it to the patches. If there's anything major I need
to change I'll give you a yell to make sure you see it.


> For bisectability I suggest to move the defconfig patches up before you
> introduce the new Kconfig symbol. Or maybe they will be added via
> another tree and then this is not possible to control

Yup, I'll do that. There was some question about the defconfig patch
but they are hopefully cleared up now.


> I assume you will apply the patches yourself.

Sure, I can do that with your Ack. I'll also make sure that patches
that Jani commented on get resolved.


-Doug
