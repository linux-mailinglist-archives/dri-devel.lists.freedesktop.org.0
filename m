Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334428487D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 10:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123A489D49;
	Tue,  6 Oct 2020 08:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F33A89D49
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 08:25:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e17so3704620wru.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YdhpNKlTW8M5AEVFobND3IcWnRcYsnTU1ylxUOoxLOQ=;
 b=qHporHfANLglN4o1QtjGAQRWNnN7asjRL3cjazvXjsHh09RfWeLWPhNLVvwSLhWTRD
 dq9W25RBebcUYOBXWtFq8Xg4Jpr5iwt1eXNmqsekvon7Xl48K0UpprSPFSz88KD7f3X5
 mVcgrKZ1Q+07rFYOZ6TaIw9SiDE9zLlxqZ10OzeIv3M1P2sRohlLAogcHVmvgwhtbxWh
 aDv0+4vxSuOdMGAP1BZwP0BlcnNmUE37U3q6XBhiOW2IywzQSNU0oPIf35dwBbDiZGem
 YyfEcoZuw1vq+eSTNb3BPCippk6TyfUXDjeg7Imo0qPxxzlaz4AKfZHvUV+rJldsOuzH
 6yMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YdhpNKlTW8M5AEVFobND3IcWnRcYsnTU1ylxUOoxLOQ=;
 b=VyNDngf8mjVeqH11Z2e6Dm9qyQs2TTM+VPS/8NP6BrbvLnmosQtXSbwjl6JvwqduXa
 cJQliXsseN6X2rehCim93+5SOUwTbDeQTiY+oH1GeRJVifjTB5cij+21+cETyt7tjFwu
 qEjpppjcWkNLbm6bU099qADeTt6EL68HyC1zQSEBPVoMVSDFy/GtGSsCSoKnZw6qiIQ3
 +qJP3g8gf066uIHplVT2esSXy/2TkRTKlnipd7M3FO+gVNK3+m/bZzG5+m2y8T0Z58LU
 JqfgdFSW3oOxRzR7d/Zh9nQFwlHXjjmHi8FQIVR3M/rNc052BctrYwF4ZYMLnCUEtoKw
 fMfw==
X-Gm-Message-State: AOAM530vIdWwqjy4CWDITJjwOwxnY/OIZTH6pNNoFin8nhCwkI711UNf
 pD9rHUXtqIcSzamj/QSs5XqATQ==
X-Google-Smtp-Source: ABdhPJxsjuEumsaEtaU67N9vbg2cBftfsc/wZW21wnFzsv2BjeMFHC1JmQFLaFRJtrvHxARri2Z8Zg==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr120080wru.391.1601972710164;
 Tue, 06 Oct 2020 01:25:10 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y11sm3353486wrs.16.2020.10.06.01.25.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 01:25:09 -0700 (PDT)
Subject: Re: [PATCH 0/4] dt-bindings: additional/unevaluatedProperties
 clean-ups
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20201005183830.486085-1-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d04c47dd-6e37-a7ac-f3c4-d6e6c308dbcd@linaro.org>
Date: Tue, 6 Oct 2020 09:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-1-robh@kernel.org>
Content-Language: en-US
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
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-rtc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/10/2020 19:38, Rob Herring wrote:
> The default behavior for json-schema is any unknown property is allowed.
> T
> 
> hat is generally not the behavior we want for DT. In order to disallow
> extra properties, schemas need to define 'additionalProperties: false'
> typically. Ideally, we'd just add that automatically with the tools, but
> there are some exceptions so only making things explicit everywhere
> really works. Missing 'additionalProperties' or 'unevaluatedProperties'
> has been a constant source of review comments, so a meta-schema check is
> really needed here.
> 
>   Documentation/devicetree/bindings/nvmem/nvmem.yaml     |  2 ++
>   .../devicetree/bindings/nvmem/qcom,qfprom.yaml         |  2 ++

for nvmem parts,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


thanks,
--srini
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
