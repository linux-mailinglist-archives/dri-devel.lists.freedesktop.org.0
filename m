Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25933FE59A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 01:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966896E3DA;
	Wed,  1 Sep 2021 23:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB696E3DA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 23:17:09 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m21so70062qkm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 16:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Y+GVokmV9xV7i0Kbyl+zT81HcVIXennIBiGTGbWIfQ=;
 b=Ss78CZppoDiVB5zdMTBxQWBVResulcnOWqd8Qi3UkjhRlNgSbjSTQDveLQ4owdMFOd
 mgwlrVIyuyDeGaBwBWxBoZvXlIJfVMzhnF2/tIAtLNZqNqrIQMexqtyQHl+M/z23jDJt
 /l6kSthz2Kvx8zBGuz1IIWMUwzkcbS3DLX0UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Y+GVokmV9xV7i0Kbyl+zT81HcVIXennIBiGTGbWIfQ=;
 b=tklXSbq0Aqp/Rh5cTsr5SvtojI4JdYc8pk9rA6t0Mm5Mo2ZujhrvN4aA3dl9snc0+B
 BlEEgJgDgX3VtkJGUHV8LtTOAU+GKqLG0RdHC0nhklOjPnHk4rlIaZ3N1NG7XN4FGJY8
 EVfWy6Tc2yJQkbS3jYP6NbfwHg6AT/abbPunoG+zMs9zeGR5mxW9Anh4lN1DybAqmCuX
 QzAdQVPcE8tEZCTE7cBZz5xJdZGaMZkmFy4I0Mao3MUEld5UU8zoCjossemFv+1NBRdH
 0Lh+PO3IgmK4v8fCC/MbMm10s3VZ27nR1kWYOF0twJIFMKQGzJLqkR+6rThkU3+eo4fU
 g9pA==
X-Gm-Message-State: AOAM533zXkxbEsmi4kdT4Eqni3fek9Ewy7oiOZVrZ8SYFZsMhO905D5p
 hPJ20TyeP+lmujBZAm/qSiVcM31YqOmbSQ==
X-Google-Smtp-Source: ABdhPJxc4Z9k7kyLPs39Yw53KqCa6JYYYZhawytvxf0k00ksWjQ/9Hxs53bM/Lso0LrQMmbz82wIgA==
X-Received: by 2002:a05:620a:1326:: with SMTP id
 p6mr385000qkj.393.1630538228364; 
 Wed, 01 Sep 2021 16:17:08 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com.
 [209.85.222.178])
 by smtp.gmail.com with ESMTPSA id r128sm100034qke.98.2021.09.01.16.17.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 16:17:08 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id 22so107526qkg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 16:17:08 -0700 (PDT)
X-Received: by 2002:a02:ca0b:: with SMTP id i11mr277172jak.84.1630537827704;
 Wed, 01 Sep 2021 16:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
 <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
In-Reply-To: <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Sep 2021 16:10:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Message-ID: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To: Olof Johansson <olof@lixom.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
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
 Corentin Labbe <clabbe@baylibre.com>, 
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
 NXP Linux Team <linux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
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
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
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

On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > In the patch ("drm/panel-simple-edp: Split eDP panels out of
> > panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> > give everyone who had the old driver enabled the new driver too. If
> > folks want to opt-out of one or the other they always can later.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Isn't this a case where the new option should just have had the old
> option as the default value to avoid this kind of churn and possibly
> broken platforms?

I'm happy to go either way. I guess I didn't do that originally
because logically there's not any reason to link the two drivers going
forward. Said another way, someone enabling the "simple panel" driver
for non-eDP panels wouldn't expect that the "simple panel" driver for
DP panels would also get enabled by default. They really have nothing
to do with one another. Enabling by default for something like this
also seems like it would lead to bloat. I could have sworn that
periodically people get yelled at for marking drivers on by default
when it doesn't make sense.

...that being said, I'm happy to change the default as you suggest.
Just let me know.

-Doug
