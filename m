Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A099444C975
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA346E433;
	Wed, 10 Nov 2021 19:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1960C6E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:49:49 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso5652012ote.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jffv+4OBBpjkkC43YZCngYWCvEJMwZVhqAxEmFK8L/I=;
 b=ncVYxXWANTeqKZKGv7E5l76viA66LUEAx2+mYSy62nkmDxMwVhLrKnVC0yAwhR7qjl
 7VXQT1ikXcsnahsIGlpgBxKho2+GrY4xpgEbMTnDQ5n8UxD3ZqNIwhzDtm++QuD+nbIu
 jFYWcIWxEjnVoYB5LlW7pwBh455HD8g/nlbHtu3Miow/UPQIDxbXNIWz21LBN9zoLGld
 JBE1A/YLbY9M+CTlxzzzaZaYYqHAknMePYM9qWjAOTAzVj+RNW/oyzasqYUon/oIas/u
 4xAOOHus2Zm7rZQYJS0cuw8yQJrbxsCULUdVh2ioSAcIsy2WCf4I57XZl10LezCmskSK
 Mtiw==
X-Gm-Message-State: AOAM5325/z12VMocKJk+n6cYfRzhmj1r+hZ458ZIB1XOi/Z0uPo6s++0
 SAtArQWBsaATfXY+F3HBbQ==
X-Google-Smtp-Source: ABdhPJyfVpmfG+ubS7aEU1ww03RUaTffAeDZHobEFdd7aYoPfW2ZAH5HMpiQ+tL5kGtHFO9Urrh52g==
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr1412382otn.299.1636573788340; 
 Wed, 10 Nov 2021 11:49:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p14sm130082oov.0.2021.11.10.11.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:49:47 -0800 (PST)
Received: (nullmailer pid 1843729 invoked by uid 1000);
 Wed, 10 Nov 2021 19:49:44 -0000
Date: Wed, 10 Nov 2021 13:49:44 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Subject: Re: [PATCH v3 1/5] dt-bindings: timer: Update maintainers for
 st,stm32-timer
Message-ID: <YYwiWGn0ehnD4nDZ@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-2-patrice.chotard@foss.st.com>
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
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org,
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
 alsa-devel@alsa-project.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
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

On Wed, 10 Nov 2021 16:01:40 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, add Fabrice and myself as maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/timer/st,stm32-timer.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!
