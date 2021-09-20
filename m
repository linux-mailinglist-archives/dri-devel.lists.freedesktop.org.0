Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9424119FD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA956E578;
	Mon, 20 Sep 2021 16:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D666E578
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:42:44 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id d11so15488011ilc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwTJ7Ad7zVwW8MXijFTCxqxIz/INuyLU038X6Cl8cX8=;
 b=gEpnnaWNfeGWV1YEfOrXuq+LS+LgPIPsf1DgmGFv9Am5IX4FzgUCAAz9kv6Wok3gcj
 hyqxFa0fPyvhfifyDUGVN6FUhXjQr5JBt69GUObZUMETluh34krbCh9RfSG3gJ2vz7WU
 m2sKlwAIdi+n4v1ByPZGwiF865i2wURG5Xvpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwTJ7Ad7zVwW8MXijFTCxqxIz/INuyLU038X6Cl8cX8=;
 b=WoDHQXtEHS3XQgzsM6oEY87XdGFT3updMvuJLYwAIE/9mKmEe7D941gYsbAE0h4YG4
 bRhZjYYAXKZXUK2QkhA1/zibcM67ffTdvr9BnC0I/94+8xuTNkToooPQKhMnRmzTyMEM
 c9e5U64tFZDct+v74NwxaKs97VCAo3sbMPUsAD1ferpiQSTxB6VQoUqyW1aSEcrWfobL
 7E+WL9D04sW3V02gz7yQ2KnbaxS5YdNBY1bD5PBS8ikTJH1zKbFh83FxtEMrQSaEEESz
 6y/HzUP2W8A5hza9pEHEj0q8jyvOWI731b764RmrJtqslB8diI6aPKRoZ8+XC3rT+gN0
 6bQw==
X-Gm-Message-State: AOAM533l0k03ysYPwA/4rQfpUuT+3e9q3EJBcHiBigPbxPFu5zHSrrqV
 HyUEHy5PvtNfhPzelOHN1VUQG0iVddd8AA==
X-Google-Smtp-Source: ABdhPJwGEUMlbXqQcOJkvAKunsX9y6pMzO3foSNcXhzWPCEpaRy5D6ItKlJJcz0tPCuwjKvhg3BEBQ==
X-Received: by 2002:a92:a801:: with SMTP id o1mr16951010ilh.128.1632156163764; 
 Mon, 20 Sep 2021 09:42:43 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id b3sm9033790ile.37.2021.09.20.09.42.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:42:41 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id v16so19444201ilg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:42:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr18604550ilv.180.1632156161095; 
 Mon, 20 Sep 2021 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
In-Reply-To: <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Sep 2021 09:42:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Message-ID: <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 MSM <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Adam Ford <aford173@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>, 
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
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
 Matthias Brugger <matthias.bgg@gmail.com>, Michael Walle <michael@walle.cc>, 
 NXP Linux Team <linux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nishanth Menon <nm@ti.com>, Olivier Moysan <olivier.moysan@st.com>, 
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>, William Cohen <wcohen@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, linux-tegra <linux-tegra@vger.kernel.org>,
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

On Tue, Sep 14, 2021 at 3:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 14, 2021 at 10:22 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Version 5 of this series just fixes the panel ID encode macro to be
> > cleaner and adds Jani's review tags.
> >
> > It could possibly be ready to land?
>
> Definitely IMO, the kernel look so much better after this change,
> so for the series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Pushed all 15 to drm-misc-next.

5540cf8f3e8d drm/panel-edp: Implement generic "edp-panel"s probed by EDID
24e27de11560 drm/panel-edp: Don't re-read the EDID every time we power
off the panel
a64ad9c3e4a5 drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
c46a4cc1403e drm/panel-edp: hpd_reliable shouldn't be subtraced from hpd_absent
52824ca4502d drm/panel-edp: Better describe eDP panel delays
9ea10a500045 drm/panel-edp: Split the delay structure out
b6d5ffce11dd drm/panel-simple: Non-eDP panels don't need "HPD" handling
3fd68b7b13c2 drm/panel-edp: Move some wayward panels to the eDP driver
5f04e7ce392d drm/panel-edp: Split eDP panels out of panel-simple
c0c11c70a6d0 arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
310720875efa ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from the EDID
bac9c2948224 drm/edid: Break out reading block 0 of the EDID
29145a566873 dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels

-Doug
