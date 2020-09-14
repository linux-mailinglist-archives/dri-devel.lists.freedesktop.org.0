Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25072698E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF4C6E7D9;
	Mon, 14 Sep 2020 22:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0F6E7D9;
 Mon, 14 Sep 2020 22:33:49 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t12so1172123ilh.3;
 Mon, 14 Sep 2020 15:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LR2VIPk/kPTFwa8fumXMyfI9oQy0dFUpuBNhTXBXL14=;
 b=OT1KYyd+aWbQLtK1nciUt94bavZ9CO6CmPFTnVpiWl29qsS3A7mSsveSfqTaUcLN0J
 824qtzq4qvYDYRPOLUV19+6piSHjGw0fj3ssXYqvnsjIMMwWGMaoCRkccw92pg563uzt
 ICoTSLg9ChrMG9qktkz9zJpgt2uyh3ywFFLRZgLJ8LlKWJ2TCTfL+HprdsvWrxUKblyh
 1PJcgyfYDx4R1akz9z8+vC/r1x5eqffljpIeTkiLcqpCTIdPS3opzbwGQRl9NVCym/wJ
 sQLFaEIv/pQvqvX3vgORY22dbdX0UVdSorE5CyzdMxC+pPHPFXIWcLXUziZISpQdUTx2
 qSSw==
X-Gm-Message-State: AOAM532X+oCCsozcqDBVUW3N6s8j3KIeAW6rLSfufSO47aCvngc1MHOZ
 tiqKW5KKnxGaEmSvWnH4zQ==
X-Google-Smtp-Source: ABdhPJxhBwt+joy5rC6tCThb/a9SSzByv7xa3AAq7/kp6WACPc6nel+y3jAKE5+UNG5dyb3EK6b6HQ==
X-Received: by 2002:a92:98c5:: with SMTP id a66mr14220838ill.50.1600122828756; 
 Mon, 14 Sep 2020 15:33:48 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x185sm6810275iof.41.2020.09.14.15.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:33:48 -0700 (PDT)
Received: (nullmailer pid 387444 invoked by uid 1000);
 Mon, 14 Sep 2020 22:33:43 -0000
Date: Mon, 14 Sep 2020 16:33:43 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/13] dt-bindings: arm: fsl: Fix matching Purism Librem5
 phones
Message-ID: <20200914223343.GA386301@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-4-krzk@kernel.org>
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 16:53:02 +0200, Krzysztof Kozlowski wrote:
> All Purism Librem5 phones have three compatibles so they need their own
> entry to fix dbts_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
>     compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is not valid under any of the given schemas
> 
>   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
>     compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

I expect Shawn to pick this one up as this file gets touched a fair 
amount.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
