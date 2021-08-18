Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005D3EF751
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 03:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603586E2C0;
	Wed, 18 Aug 2021 01:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01196E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 01:17:10 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so784862otf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XEHzbtXC9SGv3p+rZWW31lZL4W4bCoeIEjmW3iiT8EM=;
 b=F+wzrElpaCcYY75zDWUm8QPucZFPeBlySVb+Wy6SMS6XXL5dTkq8bHompERxCczjBR
 0Dsvs1s4ESJ94uqSNSwwZnJkhHzzUHJuUu2t2p19z7H/JX4QUq1T+pbDcjnxHU2Bri7u
 riGKIg+z7tqaMQb+Y6c2eBDX4MvdXhaOdIqyE1ecZkd1tBLyYDw+587+YcNk7Kxlc7Dt
 4a3X/FrPIMsz64BP6mb2DABDzKP9u0AfVy4j2kNodvlQ6MDA8WHUcbztjWfJx2u00cz6
 Xl2HHo3AX+6gXuTKyhMUjjH9lkZrSNWQHxmsmi+sGMQ2iLDVuZ5hrqKSfgPAOq7KgPV0
 N8Sg==
X-Gm-Message-State: AOAM531Pz1WVlBK4OQCdh4AZN3nuyGcrmXodPROxEK1Z6Osd8m2UJ1Lm
 ijtS9gMb9o4UhTTNKgG3Hw==
X-Google-Smtp-Source: ABdhPJzvnfsw5vj8+qJCFSRdy3z+gWAr1zQdU+wI2EZ0149D+ruRFQnz03+14sCvIKuRUTBry0K2dQ==
X-Received: by 2002:a05:6830:418b:: with SMTP id
 r11mr4821586otu.204.1629249430269; 
 Tue, 17 Aug 2021 18:17:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j70sm760918otj.38.2021.08.17.18.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:17:09 -0700 (PDT)
Received: (nullmailer pid 1177455 invoked by uid 1000);
 Wed, 18 Aug 2021 01:17:08 -0000
Date: Tue, 17 Aug 2021 20:17:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, linux-media@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Stach <dev@lynxeye.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mmc@vger.kernel.org, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, Nishanth Menon <nm@ti.com>,
 linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee.jones@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, 
 Peter Chen <peter.chen@kernel.org>, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-staging@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-pwm@vger.kernel.org, 
 Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v8 23/34] media: dt: bindings: tegra-vde: Convert to schema
Message-ID: <YRxflCWb9ovs9d7H@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-24-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-24-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Aug 2021 04:27:43 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra video decoder binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
>  .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
