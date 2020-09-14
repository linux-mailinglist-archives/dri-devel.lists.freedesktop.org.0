Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFE269924
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772F46E7EC;
	Mon, 14 Sep 2020 22:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE166E7EC;
 Mon, 14 Sep 2020 22:44:49 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m17so1982802ioo.1;
 Mon, 14 Sep 2020 15:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1F6lWP19Bna6U6ABMV+DTOcBGgc6tw6QgYSDYop8Woo=;
 b=k+3x5nT+AtW3COP0FdgAfyFgkNjekXRa9m8KYJaS1NhrrE23zkaFF7oq1CPtRajeIL
 2J5BadOch/9clLqYR/bU9y+RRynRBojHlAWpf/Exd0pQLQVjKqrSaBNjRavmHhhDPAAJ
 tLKzH5sZ5Yih5FhIM+bEroOXwI9VqWcmFA+baUO33fuuwRpsdBxsi+V0DrhCLOfLrYl7
 Eec600yVXKabo8VspIJzD6OE15Fgm6DjWLpfZYjXNbfV37NoIUielH6vP+S1LjlkE0ge
 zcnSspwatH1HnDNdLX8b+AhAQqpqIn8yJ/sMt5i7OR40hA3JKk5kYRi0veIKAidcgxqd
 mcJQ==
X-Gm-Message-State: AOAM532emWepRriitkOy1tCuNpAC9fuIT8St3oX45L/GwLI8pv3nPYaa
 Zax8PRrlxk2ON/KthVsung==
X-Google-Smtp-Source: ABdhPJzmOHZo3WkW4zjgJCSzBhtT5LXIU+riR1XZx8a1l4NwReJeJQ59h2/U1bZ8wh9fVG7Z00XGrg==
X-Received: by 2002:a02:9f0d:: with SMTP id z13mr15265754jal.60.1600123488495; 
 Mon, 14 Sep 2020 15:44:48 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 137sm6812483ioc.20.2020.09.14.15.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:44:47 -0700 (PDT)
Received: (nullmailer pid 405112 invoked by uid 1000);
 Mon, 14 Sep 2020 22:44:44 -0000
Date: Mon, 14 Sep 2020 16:44:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 07/13] dt-bindings: mfd: rohm,bd71847-pmic: Add common
 clock-names
Message-ID: <20200914224444.GA404414@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-8-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 04:53:06PM +0200, Krzysztof Kozlowski wrote:
> Add common 'clock-names' property which might appear in DTSes.  This
> makes it consistent with rohm,bd71837-pmic dtschema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> index 5d531051a153..6328163fc32a 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> @@ -35,6 +35,9 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  clock-names:
> +    maxItems: 1

Need to define the name.

> +
>    "#clock-cells":
>      const: 0
>  
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
