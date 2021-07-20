Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441F3D09AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBFC6E86A;
	Wed, 21 Jul 2021 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7576E20E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:15:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a13so26961446wrf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:content-transfer-encoding:date:message-id:cc:subject
 :from:to:references:in-reply-to;
 bh=hhS705SlOjkRoqTojYTgrsq95q0IEJuqc4XsQcf1hRc=;
 b=cd8j7p6hzpYM2CDZBWvTlYy7pGIlXLU17lyrTUFOhXD6yrR6ygv7WL6ti1WU+HeSO/
 fnTsqAbq4LOPoAFw2Vo8qqNWxzXvtRmEL1euDBs9j8O6TbubOCrVEbY59/V1TW8nYQmD
 zDSQbMpCepP7JRbrfQYhpF8rLB2A8Egvbc6LRQvIWVnZgDT1BRfP7Ni7TlVdCqbxg+U0
 DoC50iEEhHDDlYmqz0uJXqr9uCetgb1pcKaJPv2dCGXpuLHbyUeUr/259exCLwL+7Som
 1ZBRsYw26DtMQaPdGBwQEgpU5PWcfASQ1TKQUWAX49VgxZB4zo4xoqM/Qt9RHS53AxiM
 CDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:date
 :message-id:cc:subject:from:to:references:in-reply-to;
 bh=hhS705SlOjkRoqTojYTgrsq95q0IEJuqc4XsQcf1hRc=;
 b=cvRMECCk3opuHmdP2F/SLnXq2ROHCLW5433yFmHjjZH87xquzvS+SSmiLE5ah++cb2
 hB6dJCSs0FezJ/Vo2sIVHUyWpDXjCwf4XRAbEOyfYoqTj9E1Qv72r15nvfB0mqKVXC9M
 pm252RheP9bOROHGl1SrkzfngqaZQD0Lmro8VWVoa8W3inlEdWdOmcceKl3vqMcn0E8F
 OnF2KpWkkn0CnsTYtHDJ0EhVrWphu83zOe56tP4qgLWynMdxcLyjTs39zPzdwUPd3GSv
 PoTcd6MpNiNgV6m8pkthUZ/C1u0ZhrEAIQU9ynX2WaRRhrzte8BfT0QT1QzsGIBlHYfG
 Qduw==
X-Gm-Message-State: AOAM533uMAoPaQNmMfaEHewAN6HoPVd+L2XGfrmN6+joT8qwklKgeLlV
 6YV6wrFEIfzlxba3Hb/XOKo=
X-Google-Smtp-Source: ABdhPJxLKTXitFRX4kR6CpMpKBy2kBjAfXucf7wNYwW+mqaI3etVNE0PqF25MsCMX6/0mP7aRWmRYA==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr38817689wrx.114.1626804928215; 
 Tue, 20 Jul 2021 11:15:28 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id p5sm19571717wme.2.2021.07.20.11.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:15:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jul 2021 19:15:27 +0100
Message-Id: <CCY67UA29K2Q.2DEZ5GOF4HPTR@arch-thunder>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Rob Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20210720172025.363238-1-robh@kernel.org>
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
X-Mailman-Approved-At: Wed, 21 Jul 2021 07:27:54 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Olivier
 Moysan <olivier.moysan@st.com>, Mateusz Holenko <mholenko@antmicro.com>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-rtc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>, Jakub
 Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Robert
 Marko <robert.marko@sartura.hr>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue Jul 20, 2021 at 6:20 PM WEST, Rob Herring wrote:

> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
>
> Enabling qca,ar71xx causes a warning, so let's fix the node names:
>
> Documentation/devicetree/bindings/net/qca,ar71xx.example.dt.yaml: phy@3: =
'#phy-cells' is a required property
>         From schema: schemas/phy/phy-provider.yaml
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Robert Marko <robert.marko@sartura.hr>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: ChiYuan Huang <cy_huang@richtek.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Dilip Kota <eswara.kota@linux.intel.com>
> Cc: Karol Gugala <kgugala@antmicro.com>
> Cc: Mateusz Holenko <mholenko@antmicro.com>
> Cc: Olivier Moysan <olivier.moysan@st.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  2 --
>  .../display/panel/boe,tv101wum-nl6.yaml       |  1 -
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  2 --

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
