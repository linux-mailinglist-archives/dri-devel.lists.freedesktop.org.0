Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8279E11E4A7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 14:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8486E48D;
	Fri, 13 Dec 2019 13:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444206E48D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 13:31:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j6so2670110lja.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 05:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
 b=Cbhnm/ox1I54nuH9njXHzccQrQot6KLJxrMb3XxyvsplUdUL3Q5Rul7FpZFaw6qIui
 KYp2hTrI1d6g+6A/dt3EeK/jyydFWmrzksF0s5cf6LxX401J1UfovmCKuRKzXFovXU5C
 QsI8OLd61zJoOK06uURda9yi4bsvTHAi28Tnrv3Y2WUQG8yz9MVsYlfxzXPwO2QT9YRG
 RsAyEYz1F5CKeLy89t5OQs+1Sn+GSZS1npqdvVHKIH8gmwGE2/La+4ljJz3l0hoayrrz
 IPjK34H/OTvJKUlP1UABm4Vzd9dvTCGe00klnysMonCEbsx3CWRH5rIYuP+ptTWBx8JB
 NZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
 b=uH8EmO12eBiDAs/UN77yeCPQjs2QFUVHw3/kZQsLCV3FtekFYuwCNV8ZbB+nglDRxA
 i0Zioh1KxPI9dPbMnmxWPqRtzJnR0Ais/eymlDY4a/qGcjFez6AaeEHofgOT+5lV7dfS
 EoYPIvp/eJXBY+AIlHg4B/ueN+ZntqlFhxHP/ly1Oxr6Mot3CDW0+/slpCCYvrby+ASZ
 adQO7BTaoDyxYhFSvDZEPBcD7QjETgyrPy7hPzkNdjMVx0G8MmP22p/GO8Ix18QFD7A2
 fupx5dl61xXinaHfat5o9EIGdMJ3X/cfAlq92FOpTJftxxXSsQYGNQnrI1/TRFLtgPh/
 OPAQ==
X-Gm-Message-State: APjAAAUVIusdIi0ObTJutxI8bKv8IPIHz93OavdeAI9MetcpVd3D9Nza
 e88aBZnAyMN2rzuiznO8ISeyi6zwD/nZEzKjISZEtA==
X-Google-Smtp-Source: APXvYqwMLtHFJLKb/OsUbyLvQlBeLa8EouQdhXkxY6ssHTmFd/qwkZ2hUZ7P2vEvqVVUtgkdycvnaAaf3SbpBeZBuMg=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr9207930ljh.42.1576243865608;
 Fri, 13 Dec 2019 05:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-3-sam@ravnborg.org>
In-Reply-To: <20191207140353.23967-3-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2019 14:30:54 +0100
Message-ID: <CACRpkdaVYeJme0O8CW-heTmf3-0EHowFwcOAyy3jx13gjfj4zA@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] drm/panel: add backlight support
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 7, 2019 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Panels often supports backlight as specified in a device tree.
> Update the drm_panel infrastructure to support this to
> simplify the drivers.
>
> With this the panel driver just needs to add the following to the
> probe() function:
>
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
>
> Then drm_panel will handle all the rest.
>
> There is one caveat with the backlight support.
> If drm_panel_(enable|disable) are called multiple times
> in row then backlight_(enable|disable) will be called multiple times.
>
> The above will happen when a panel drivers unconditionally
> calls drm_panel_disable() in their shutdown() function,
> whan the panel is already disabled and then shutdown() is called.
>
> Reading the backlight code it seems safe to call
> the backlight_(enable|disable) several times.
>
> v3:

v3 looks good to me +/- Laurent's comments:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
