Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E312698EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346AF6E7DC;
	Mon, 14 Sep 2020 22:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE66E7DC;
 Mon, 14 Sep 2020 22:34:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id g128so1875982iof.11;
 Mon, 14 Sep 2020 15:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y8CcCumFrbE5PKVVcgSzK63UfLfmY/dLPnUgvKfkKuc=;
 b=eLkcWIlJY5KNMiP9XoKcPPzNbtSPOpHFj7PBPpA94DKet7kjtMyW3NePIL7ZrviZse
 K8FpHYfO3grXYi8xFZA97jcWEa72MrImpILrNGd+sbQb70L6VtkwkkzPKHh63UZnL4hv
 /lhWfrmmaiiR+9PqDkkZdDZH6MSoR0uPgO0qseoJEfF15gOZWkUZtN9A1g1RkSOz/G7e
 S3fAGChYi2AnqYJYrxPDl2jlm0DpnZ9qWEaZEOZ2g6VyGuSvNMPpC1NbA/X5Vm0C7eCV
 3a5bgd/rLeD0JlX9FiESl+V/ZdiSda0zqOErzlxGmtw7TzaHxq5UcwHswhQHTMGCi413
 9aeQ==
X-Gm-Message-State: AOAM5310ozVsShuXdwZxeMLHlIyyx9CQfE4imbJa5p34CjSXnO5gHLum
 FpZrMTgx0KSdqeuiGLiHIA==
X-Google-Smtp-Source: ABdhPJxkJI1Dnvq9CIPCPn7djiuA/dt7rMR/n9Kj9F9jKovXNxk79GoqzQUeW7MO3YeVHTB9EZIsug==
X-Received: by 2002:a02:ab85:: with SMTP id t5mr15077114jan.51.1600122852853; 
 Mon, 14 Sep 2020 15:34:12 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g1sm7631220ilh.12.2020.09.14.15.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:34:12 -0700 (PDT)
Received: (nullmailer pid 388187 invoked by uid 1000);
 Mon, 14 Sep 2020 22:34:08 -0000
Date: Mon, 14 Sep 2020 16:34:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 04/13] dt-bindings: gpu: vivante, gc: Add common properties
Message-ID: <20200914223408.GA388135@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-5-krzk@kernel.org>
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

On Fri, 04 Sep 2020 16:53:03 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (cooling-cells, assigned-clocks
> and others) to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpu@38000000:
>     '#cooling-cells', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/vivante,gc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
