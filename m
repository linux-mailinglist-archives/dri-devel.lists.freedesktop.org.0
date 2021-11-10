Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067BA44C9CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB8A6E512;
	Wed, 10 Nov 2021 19:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E216E512
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:53:36 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 p11-20020a9d4e0b000000b0055a5741bff7so5617803otf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rtQL/sbdzpxz6Lu8ElJAZUiYQnGOPRjAvEo183EhEZQ=;
 b=PRxjqHfAImGH7UXEF25cNqYUNpdOCEShdiPptJcTREbFH21PZJ86bjAM102mPE9y+u
 tNIET7RMnAAeSGtJ3E0iJ8bOxpGFjA/6xd804fJG4NSuCVNrzzKpyJwO36t3C9cXpNb3
 rAiDaMnyVqdLD93Uyq4dT4rTd/h4aQkBbaEBGtaXOQBYlKio+kkcdMRIgPTehDvsA6gd
 qGAzs5aEk1NXX+ChNoy/w0Md2XXSYOa1fjT1hXNtqDCE19qNh7P59wIcsWFu0j3lT/jJ
 1KrKM4lstNqoyZE1DJvzpQzNdWww9SgM/ZkKz+lsvNMfJT/MnURM8TV1f0ovf10uIF+I
 92uA==
X-Gm-Message-State: AOAM531o8c1fjj9aPhB4qUm+jbV++30KIg3QT51ZXrBPnM3S/CWd3dmW
 pe0AY20gttlwELcHU4rIVQ==
X-Google-Smtp-Source: ABdhPJzPMoAqV3AUGDDa1G/mcQBg1/+e3vLu75Mv4kA30QovRpmA/hmvXuDtC6I5AysjT0t7pidUQg==
X-Received: by 2002:a9d:6a4e:: with SMTP id h14mr1449816otn.134.1636574015905; 
 Wed, 10 Nov 2021 11:53:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j7sm129827oon.13.2021.11.10.11.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:53:35 -0800 (PST)
Received: (nullmailer pid 1864115 invoked by uid 1000);
 Wed, 10 Nov 2021 19:53:32 -0000
Date: Wed, 10 Nov 2021 13:53:32 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-3-patrice.chotard@foss.st.com>
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
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, jonathan cameron <jic23@kernel.org>,
 Le Ray <erwan.leray@foss.st.com>, linux-iio@vger.kernel.org,
 michael turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, baolin wang <baolin.wang7@gmail.com>,
 "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Marc Zyngier <maz@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, philippe cornu <philippe.cornu@foss.st.com>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 16:01:41 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Lee indicated he was going to pick this one up, so:

Acked-by: Rob Herring <robh@kernel.org>
