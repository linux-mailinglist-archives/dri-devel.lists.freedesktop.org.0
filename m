Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD926BD5B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 08:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DD06E99A;
	Wed, 16 Sep 2020 06:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D10F6E992;
 Wed, 16 Sep 2020 06:38:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s12so5582553wrw.11;
 Tue, 15 Sep 2020 23:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OIJLGGGniVhQVtQMrqVCccoyI58LfU7rsBw2hzyYuuI=;
 b=oU5oJFEMlTapmj1eWnqAWqrX7MbSACs/x591zt208RiV5P9ddLh4V1eRqiaou+swYD
 kJJzX5p+dhHSunECdaFUSmMW1kpPD6Gs9GEov/Pt2JGxv2sFF+yjyjMLi2LFMVOxMdv8
 Yrf3VrGJha4qH5xUHqnXyA1lyUcrhOXvrdqtnl02o6Bs5iRQV252kTYh3HAnUYmS2F86
 YTJA5SW3R1RKxQVhlFY2Jd6a1lEKCNjS7LoRZwHtnPff7NtzFSSkK6YcmPMXFqVlh7Ue
 iseJyk6Vnt66PKP54SXZShBy0J4IS0VJHU24LRP0wU1DebIkjiQLJ0T4mATs+d9trux5
 AoTQ==
X-Gm-Message-State: AOAM5334ec0plvV+IKsImTsqREIkZtFxTHtQyH12VGmvaHfdY6e1DO6Q
 yKKFbMKGPcBjVdGlX9dhBB4=
X-Google-Smtp-Source: ABdhPJyQlteL0N/pU4eGx+adqZwehoEnOdIRonAvDPv+rO2M8s8kM/CkVEgxf3jd4rBP/JE1VfY6cg==
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr27189618wrp.340.1600238303133; 
 Tue, 15 Sep 2020 23:38:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
 by smtp.googlemail.com with ESMTPSA id 18sm3308363wmj.28.2020.09.15.23.38.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Sep 2020 23:38:22 -0700 (PDT)
Date: Wed, 16 Sep 2020 08:38:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 03/13] dt-bindings: arm: fsl: Fix matching Purism Librem5
 phones
Message-ID: <20200916063819.GA6687@kozik-lap>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-4-krzk@kernel.org>
 <20200914223343.GA386301@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914223343.GA386301@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 04:33:43PM -0600, Rob Herring wrote:
> On Fri, 04 Sep 2020 16:53:02 +0200, Krzysztof Kozlowski wrote:
> > All Purism Librem5 phones have three compatibles so they need their own
> > entry to fix dbts_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
> >     compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is not valid under any of the given schemas
> > 
> >   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
> >     compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is too long
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I expect Shawn to pick this one up as this file gets touched a fair 
> amount.

Hi Shawn,

Could you pick up this patch as well?

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
