Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5B44E280
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 08:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433B46EB39;
	Fri, 12 Nov 2021 07:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79E26EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 07:42:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso9166667wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=L0G7vqzIu4OmVtWPcfcfA5NzLtPk2i0H7s2BzObNlHQTFEkm03sqk/2QHQ4kjpk9BH
 XMXouE5QpmwrxFfo6B5ZLvuccwWWhT/w9Ko9Yi7L+7BfDDnicqyRLnT+TM8ck5H5bQEY
 cyD6P6qfh9iWldNqTQR7o5UJ+sXkSMXyDzLNU6kkBq7ka/+ZuUqEk/qcSbQ3GxXC7kiU
 cm9dyledHK9n0gr3crraQGaAfhd3vfTQwfXVu/kwmwojjE1dRCSgNEVgeiJJB70r7ke9
 OYePQHHEPa/usZJXytv516/nCeAGVXFsmZBOHnIcNaOTOhsULeXowN7ikvsxKqOo/gxw
 3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=CAVDgJuId3bDUs7xXE3/brJqf2qYQ2Pusi0lfU2KBDW1IHV95sgXRUj4WGrkoEc4CO
 N13+C/osWqLJ7UjQeO+OsQI8AKYM4L0QZt0I/a9rK4LQv+XQlf7B0Z8FUr56Qm9zRXl4
 yc4pMlrsmD+Srp3yRpYQL0ou64pcSHvwL+9lLcWhPmSjmi+Gnjp4+3UQY7Wt8z4yqU0+
 gl+bGfLES9xU6ewxoRqudQlLMsVECvvNtpS4NxogUPtT/8Dc394/AFY6KczoEEyi9FfF
 l4pJX4sNhap6p8qIKNcLbbaUvtdNkTc3NquGcHWeBYXmpwmwEiLbYEU8l4PyWQhDLNKi
 LaHQ==
X-Gm-Message-State: AOAM532+q0Hhjv2hhvRcoFfubduBl1a1Z+t2P5fT8IpOBkLjj9M+ZwC2
 dQRxpgAHshEBBw673SVAMvEPJQ==
X-Google-Smtp-Source: ABdhPJyYtg+MHn61GMl0MRFqSO/sm1wnHgrm7yORmq7WT7ihtvN7d0mp317CBhRDaom5mAlXGDszmg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr32377342wml.82.1636702961238; 
 Thu, 11 Nov 2021 23:42:41 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id q8sm4978469wrx.71.2021.11.11.23.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 23:42:40 -0800 (PST)
Date: Fri, 12 Nov 2021 07:42:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YY4a7ZxzhNq6Or+t@google.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
 <YYwjPAoCtuM6iycz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
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
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, patrice.chotard@foss.st.com,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, baolin wang <baolin.wang7@gmail.com>,
 "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Marek Vasut <marex@denx.de>,
 Marc Zyngier <maz@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
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

On Wed, 10 Nov 2021, Rob Herring wrote:

> On Wed, 10 Nov 2021 16:01:41 +0100, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> > 
> > Benjamin has left the company, remove his name from maintainers.
> > 
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> 
> Lee indicated he was going to pick this one up, so:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Since you already merged the treewide patch, you may as well take
this too.  We'll work through any conflicts that may occur as a
result.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
