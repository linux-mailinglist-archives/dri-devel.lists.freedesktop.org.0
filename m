Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8F285972
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C926E8B3;
	Wed,  7 Oct 2020 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4B6E84B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:03:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id h2so136655pll.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 18:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
 b=rJLKmtpwxzsaHKtX12nq3eP9neu2dOXEPi6LomqB2knE6KHEDjpS2vUrKJtGSZmd01
 7ezWLLISEJuqEQ8aBgOjVvVwuIROWJaVvqWMDhdkIrMnEJj3xWoT+mLh9Gs8gEuP17Q2
 UgfknJPVfYtwgcFCoBnLf1OmUFSxA0fdjd+qay5y6bkYLt8ainoMJawHK24rtd7lPeI2
 jVsq0CkG7qufIYkkx+FdQj1K8q292mstggL5gEg1P6qasdKVPWKLR/DK34HZkI0mADY7
 HUlcFEZ59O0+agAIIrpY+D6Sh+41M2ydy4oYO2vKHgH/8RKm2d5YK6721Lon3s9UNXTV
 sAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
 b=AbPKeVIFHHBk5mj3NGpqmmsPdxLqdEN002XN1IaCNkjpdNGryC29tGMpKzpO9ajkcd
 1iSg3++i9FQaxatl8pUPx1W91QFuCki+47Khcc1kn9fzyS13WEMHQuAzukNijZPlgFx/
 /WrWAnlFBfuC9XOxdvskARCTiSKYtBk3wVZTAOO8bOgbLuCSSF/F4IHNlKBO6BuCs5df
 67ITibIFpb5CNclkwetKabHGndHayuIqbF4wGdIj/VLOL79a1zGm+Ug1xx9PoOE79Ju0
 p319ysvTGhQv+SzY7FLZyACIFw2tFHw8gk8mJXoLJFBkx53gIq8oiiIK0ccouPQW55LZ
 JeMw==
X-Gm-Message-State: AOAM531IYD65hYMq87PfJfoEyCNWNwHYvFwfnda31Lfxuj7plffSbPY8
 LmmbNUbUDjDnQE2ggDVrD04=
X-Google-Smtp-Source: ABdhPJzVLf6DlrNk5/q9fRno4e12My/InOM1G44QmO8+GKR2G8WgtPD5wnjL1TK4h+y4iW9ZX7bL0Q==
X-Received: by 2002:a17:90b:692:: with SMTP id
 m18mr667588pjz.182.1602032595239; 
 Tue, 06 Oct 2020 18:03:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id fa2sm213768pjb.51.2020.10.06.18.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 18:03:14 -0700 (PDT)
Date: Tue, 6 Oct 2020 18:03:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Message-ID: <20201007010308.GP1009802@dtor-ws>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 01:38:27PM -0500, Rob Herring wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
> 
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
> 
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
