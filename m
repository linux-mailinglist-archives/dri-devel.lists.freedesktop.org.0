Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308C44C98B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B7B6E44C;
	Wed, 10 Nov 2021 19:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F816E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:51:07 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso5534781otv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaGtHvG6f2Nq9zdI9Tpc3bPF147EUDcHeqfU5NOs8/A=;
 b=L+ac1cJ1c/3kldlTSIz689h24PHJzjLq+tKxhK27+EuyS95c8SjAtbFEuMZm4OFWW7
 uaBhAXwMlyHhB3kqonv4fi6KcXRALzQnNbLZYMyOhQKnHkx9/22SrzkJ3ttw2+4+yi5j
 DjDJsi5IsD9XsQlfcdKYwXiNZTtTfRv7CmNp+84qmxqCLDfpUWj907T+g0zBMVlkPf5t
 wDoR5KAU6eaarunp1XD79SzV9VIvADyhBRtKe2SzY48GWHkU5eBoas6N4WSkp4YZvwff
 GUd9nDb6/6VTvV3EKcydTQBuAKL8QVpqWUnPgGP8gJddmlv/LByCQ0JfwzD2wt1SIWdP
 pucQ==
X-Gm-Message-State: AOAM531ggxUozstw/zAy87MYv1l3I2cD9HQpErlT1QdHdkl/Mfn+GC5l
 c2pH8nM0mZNw2yFUQSc9wQ==
X-Google-Smtp-Source: ABdhPJyoqzCKoO1mccILtZ9+sI1239ZXZq43Cb4nIbMhmS7HoNW5DY3iPPKtMi57BRAkrSAOfgsptg==
X-Received: by 2002:a9d:6854:: with SMTP id c20mr1506260oto.190.1636573866562; 
 Wed, 10 Nov 2021 11:51:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q44sm190616otv.80.2021.11.10.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:51:05 -0800 (PST)
Received: (nullmailer pid 1849495 invoked by uid 1000);
 Wed, 10 Nov 2021 19:51:02 -0000
Date: Wed, 10 Nov 2021 13:51:02 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Update maintainers for
 st,stm32-cec.yaml
Message-ID: <YYwipuVeW+U9LgXa@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-4-patrice.chotard@foss.st.com>
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
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-crypto@vger.kernel.org, alsa-devel@alsa-project.org,
 david airlie <airlied@linux.ie>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
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
 Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 herbert xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, philippe cornu <philippe.cornu@foss.st.com>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 16:01:42 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
