Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDE185E7B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE282892D7;
	Sun, 15 Mar 2020 16:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1381892D7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 16:25:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j11so11910769lfg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nro+9PxoVZONSnffKW2dU8U2CHIxPJ7gtNcInQeK1go=;
 b=lwWFiOB6SJj8mGq6jaZpWUhLXzKgZyntVMMsXYYbG/IWeiuPJEVVNIQQUuqLV+XOag
 jIcEsYhJ9dngBmxhiolW1wTbWrYHbxixuUyidbrDZhlOCC1jB661xijrMccbrifYTgDN
 GOe5fpX4obl0lMchuaxiNn1khH4/6V65MUHvL/azuwnQfi3rJLToV1PEAwpTBospAiVV
 7KeDc1cHlB8ly3k69xJkfkivVgKShZ3dNLa5P9SZa+oBg3PVmG6u+1N3uITdh03hIbM1
 YfkHNTH+cvm0g6qP8Q38WTYZ703Z3eS4zCPklWgb3DtFzrpqmgmi0L2UpOgmz8q7Vm3+
 gZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nro+9PxoVZONSnffKW2dU8U2CHIxPJ7gtNcInQeK1go=;
 b=hBrmjEteM/MH+e5SBaQoGe+mMA+TaaeSbt/wu1pfRd78PTJ09VsT6XBq4zC59t88Kz
 gfW+DiYJe99J+p03lmDuY68ClJniE1uSTJvcwLOXrwxwNdraCH1pAVzdawpqoAblYtW9
 SLmcmXTgijAHg6qpooqY8qRgRS6E7YiJQ9ywv5aVbP4/uIdcLQxsybXg6fZdvgKILO2u
 UKidwv0LsmKL8GmHOjyuRa9RFLzIjuhd5Nn/vmthXKFVeKF7B3Xnpu8WVJj+ACpJKznO
 blMNBhiHjx8lACrdB563pbcOz45pGZMQpW148zn0OyC890NV2xzexLP0dvPL9kv1if+E
 X5Sw==
X-Gm-Message-State: ANhLgQ1yBRHkBzAo73Se8OeB5HD6w9DkhMy7J6P5NoE48fFh9pQ1xVfM
 vjzm7xBh1SwFUVV+M+xk6yug63aAiDLoyOq81erbCg==
X-Google-Smtp-Source: ADFU+vtZ1Lm6HpAuq9q9b7CE2xd2dh3LAwacDeOvpC1P04gdg7RXPAQFfC8FLc6e0ZBzD7T3GR5IOsj+IUxBNg+hlnA=
X-Received: by 2002:a19:a415:: with SMTP id q21mr14190800lfc.21.1584289558343; 
 Sun, 15 Mar 2020 09:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-5-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-5-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 15 Mar 2020 17:25:47 +0100
Message-ID: <CACRpkda6Vve_oNZ+o0A-dUy35ktgqshTE8DyEqmBD=DWry7n_w@mail.gmail.com>
Subject: Re: [PATCH v1 04/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Guido Gunther <agx@sigxcpu.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 2:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Thanks! :D

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
