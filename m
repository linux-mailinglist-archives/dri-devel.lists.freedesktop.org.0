Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524F2698D0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D96E7D5;
	Mon, 14 Sep 2020 22:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07BD6E7D5;
 Mon, 14 Sep 2020 22:31:07 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id y2so1141968ilp.7;
 Mon, 14 Sep 2020 15:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nT6K1KQBj4W8IpGEQ4J6WYsBu8HZ684HxeYYE+eGjiY=;
 b=q18ihjsXyys29wFYkH2ZE+eKLChndnsVE2mtD1MWrm/x1Z7s+dOGBD7qCZBPskm/iw
 Go2t4s4Af446JPs27RBAi14YScvq2S6uaLPqE4INchQI5HrGC2+ej+g+ecQze4MXdjZ2
 wk1JUpFQx4BcHtk5m3PmIrXq3i4xbSEYsMTmwHCFwJ0nNzAFmq5/74J5PYycapKg3Bfe
 l3OzNSeZTA+07j7gSzJHAqtETlky6pSJRMdSRjk6BR2tcdIHNj/M0MlKbcR/kLC7ZIeu
 +SpcnFw4lVOY2UjCsP3aVEGLW/elHBdh24CXz91TUyZLFIjz3qwkZvFdybRMZAeoGu9O
 iuIA==
X-Gm-Message-State: AOAM531i/GpJhbVOlZXXYIcP15lHn0ENwVD5G5F4Jw0VgNFZDbQXPWky
 jU54amXdPdGPjBTSTftliQ==
X-Google-Smtp-Source: ABdhPJz21EfEdkgbUKk4Ay96aVETSaWe1zUZ+gDkOp3S2g9h0lxpKe8gdihfIGpebZrhD7CCljrBlQ==
X-Received: by 2002:a92:9ac7:: with SMTP id c68mr13567597ill.221.1600122666900; 
 Mon, 14 Sep 2020 15:31:06 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l14sm7668265ili.84.2020.09.14.15.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:31:06 -0700 (PDT)
Received: (nullmailer pid 382849 invoked by uid 1000);
 Mon, 14 Sep 2020 22:31:02 -0000
Date: Mon, 14 Sep 2020 16:31:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/13] dt-bindings: power: fsl, imx-gpcv2: Document
 interrupt controller properties
Message-ID: <20200914223102.GA382796@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-2-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 16:53:00 +0200, Krzysztof Kozlowski wrote:
> The i.MX General Power Controller v2 is also an interrupt controller so
> document additional properties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000:
>     '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
