Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F26563A11
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780EA18B081;
	Fri,  1 Jul 2022 19:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9172A18B081
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:38:16 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id m13so3269564ioj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 12:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYGwea+9Dc5qlyJ44ffM89yyXqLnWemdQ1bnBNc3VDk=;
 b=hNomIA8Z78GTnbogqr8nyVqGaIbtChxofwNKMgH+ZwXjB6zAIt04XvSss5oZP/wtEx
 gDdov4Z2WNkQkNEHJMz45T3WTRdmdyZ5BfxX0kweodJOjCVPDk1Vou6K6BfmEu9i8+hF
 mP95MXrZ+2ctTDtb7+MHsWohsuq5gPIs1vQdKeUN4ruHzQ986pGlzxCjJtLCY44vihED
 WD6rrHb2wK0Ouy8xP8dgBlr76FdazJTD2kXNfN9ABR0wb86hscc/GYHPZUYLCGkWTYsT
 c5gkKrZUgSzcgftQp0egStOPuhXB1HYX4+iaCJtYFm6AOrxbWImjbV5A7cA/Q6OoJnxH
 eBgg==
X-Gm-Message-State: AJIora8r+GTFGDUA0W6zSpfpl/sRHSSC5Oz6lPi8tkUvPr1sEDqSTnpg
 weAr5wuQPJRNO+mWR76HGA==
X-Google-Smtp-Source: AGRyM1uejcIwzsBE+pycB2Qnm2yYV9wtrnyFGLocbsLu1VxbRBag5KlqP0ugvtvcy/HrL02BZGM2Jw==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id
 m13-20020a0566022e8d00b0064fb683c70dmr8094734iow.62.1656704295753; 
 Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a92c801000000b002d8f1269e97sm9277818iln.42.2022.07.01.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: (nullmailer pid 1385506 invoked by uid 1000);
 Fri, 01 Jul 2022 19:38:12 -0000
Date: Fri, 1 Jul 2022 13:38:12 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 02/15] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220701193812.GA1385448-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-3-mail@conchuod.ie>
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
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022 19:43:31 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan KD233 development board has a built in LCD.
> Add a specific compatible for it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
