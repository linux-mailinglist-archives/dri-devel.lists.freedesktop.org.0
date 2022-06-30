Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F65620AA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 18:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C7113C8A;
	Thu, 30 Jun 2022 16:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7C113C7E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:57:21 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id i17so12741223ils.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 09:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cSCjzkkaYP9MYdWZQafK4xMoYiSrEDWkLIVS/pLNRR8=;
 b=2efvkYqmUODh75sBG/8JCjqee/QE8eM96D5tY/RHcW9xAGdOZCMf12dTZ8Af4bweb3
 oI++1kjJ/Mwx9DT+++Yrehnh5CpF+H0xFD++P0ZetSONedhF0Kcfdj39Qmh0YhqWsoiX
 QkOAY+G4Q1lBTVob+d2r1hBcSTpVQee4IVv7lbF3HYAXPmympnVrFIAzcEx1A5wdthNJ
 E2w8BdfXM4UcHZBqOX0Af8Dk1d4O9JFvw1wXkiEuZS6ifi56qfyTGufIMssS4PxCMjgn
 Q4O8xe6s4gA3TrJ8Cn/9yv3nlQ+ifMpQMISwK6h252wAb63r4DY4QAt6tqb3LFLD5jBM
 9e9g==
X-Gm-Message-State: AJIora+DKCWPI7cXx61RJ/fzOX6L9XZ0Fv1yaykv+I8nA/8GWvsLtTey
 /vfP2KhmeWWfQCJxpefI4g==
X-Google-Smtp-Source: AGRyM1ur4AOc7bK5eVjgml5dO/I1YI3o54vzy9DsjE/7iDAB6CuVvnaI9nMRxVWdksw+oB2ay497Pw==
X-Received: by 2002:a92:cd8f:0:b0:2d9:5d44:6a53 with SMTP id
 r15-20020a92cd8f000000b002d95d446a53mr5817684ilb.226.1656608240763; 
 Thu, 30 Jun 2022 09:57:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a05663810d900b0032e1a07228asm8851588jad.26.2022.06.30.09.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 09:57:20 -0700 (PDT)
Received: (nullmailer pid 2895373 invoked by uid 1000);
 Thu, 30 Jun 2022 16:57:17 -0000
Date: Thu, 30 Jun 2022 10:57:17 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220630165717.GA2895317-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-5-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022 19:43:33 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> Canaan k210 is wired up for a width of 4.
> Quoting Serge:
> The modern DW APB SSI controllers of v.4.* and newer also support the
> enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> version is auto-detected at run-time there is no way to create a
> DT-schema correctly constraining the Rx/Tx SPI bus widths.
> /endquote
> 
> As such, drop the restriction on only supporting a bus width of 1.
> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
