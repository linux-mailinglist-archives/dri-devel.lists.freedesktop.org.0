Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E263FE49A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 23:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4E86E332;
	Wed,  1 Sep 2021 21:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25AA6E332
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 21:12:11 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id w7so762840pgk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmD6NfZ4ntJSAzZVeHzGwx+9LMKE03Sdt9CwYbMKD7Y=;
 b=rrRU0L93Wl3dd/9llX/ZnoKYuGFSdDWKG1uN8Gv1fFTegETF12B23Ag/5WGRKWIWau
 O8EFhntrOcOx6d3AuhaU2V/BjDQCb3DDLPHbovVi9M84wf1HCPIfdTV3Ba9ZKbS4IcCZ
 6YwnCs8Zp7jc6H4EJrtjsZ2KLjXqnLzng7NRbloC/ZV8ZeG9KOkOWoMxlnk4mkCW/ld7
 KBqQbYocAZvotTNrQotqhaBCSrQ83H2JX/t6VU/1//LmZ3sJZKp0o6j2aD3IYvNDDn9D
 MVfd+v7Ryf93lGSGYO8a9PhqJoN1GODF+EVDV18LG2HXaHV9nfFd6fumgo4HVnFq9yqu
 0N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmD6NfZ4ntJSAzZVeHzGwx+9LMKE03Sdt9CwYbMKD7Y=;
 b=TT96caicsigB/84bOLxfhQD9p5ikZUkL2jtBKXlVGchVhBOhYjguB+Q796ICzxX3I5
 AzJz3+HRUzGp9kZpuj0PgpqCYSy91jdQ5O/hQ5r926eDhW/Oj6ckJ1fOHmg0/mcCrf8V
 OKHGyHfBW2URgEI5ot+E6pdcR2mhPwl+eTTtPrYF4mNoPrvaIA8Zhb+pPe4N2vs8PKKm
 2p9fK/5ezVTL45ndejBStKdYA9TgpYwUlr3qSqE1QsSIYy0ZRYhNrt4mTKNfw6msJrDW
 EGXYcIcTQD7IM48D7PU2Gzi6EMc6e+lzYxvsqapW+bWP5MXqmUKqkQWgWzEoXrgF+zZ5
 jGoQ==
X-Gm-Message-State: AOAM531YyJtE3v5EBAx0H2OSK8qFLhYoNLR90/k39V6qU+qIN0Xto55k
 nimVCGJIWte01qxN18/w+pKTyl1/O+NlL9jlGAaI+w==
X-Google-Smtp-Source: ABdhPJylbGieillP4v3Sou9GfiOafHmfSdD7JjHyJBYaAf+EOtB7ue7nViFrVdrgxVrSReapdfqxB6ae0ZGRSPj/Qs0=
X-Received: by 2002:a65:44c4:: with SMTP id g4mr981021pgs.254.1630530731360;
 Wed, 01 Sep 2021 14:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
In-Reply-To: <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 1 Sep 2021 14:12:00 -0700
Message-ID: <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To: Douglas Anderson <dianders@chromium.org>
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

On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In the patch ("drm/panel-simple-edp: Split eDP panels out of
> panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> give everyone who had the old driver enabled the new driver too. If
> folks want to opt-out of one or the other they always can later.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Isn't this a case where the new option should just have had the old
option as the default value to avoid this kind of churn and possibly
broken platforms?


-Olof
