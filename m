Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43027CCAF2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 20:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84B610E317;
	Tue, 17 Oct 2023 18:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CDF10E317
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 18:44:46 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3af609c5736so3241136b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697568285; x=1698173085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9AXL+kNMUTK5DLziPFLVPYslxiHAWx2Uz99cy32iBQ=;
 b=VEQPfzl4TcPMoGA/lTWLKQPH3s54MHBXRZTkZbc8RHzjmACSzsrB6tvl+L/b3n72Ga
 eCbGzyE4RPGCqJ+VGR8joLaGQ45CqCOU3nKaXMAxbC6RckCr5r3tv2rkg3bSG/8G6pGe
 vFCvbVbG1G1w9UcKVw6jkHvau7vpt+C5C14SqbQyLpG6LUcYBJ2zhxg3KrwSoxE032p3
 0Vg30zsH9N0UH7RF7NY78milVfksN8DyEMw++tbzusgIXuD3POO4FdgEgYHiYpwylcSz
 PUhcOAiaDoEaK9L+Cazpe/BiefiwNvm0sCeXc7X2qNsxWe0/fnIEKpfkzr8gbAOC0gmm
 ZnSQ==
X-Gm-Message-State: AOJu0YzQf/aDngW/mLy65n/ABx8ehy/F76M7nytaTY0ekgJ6tcNpUGoc
 P41Lv2NLQ4mfkX0Z9zlFig==
X-Google-Smtp-Source: AGHT+IFa5Fe5Sjl0kxSSWVeXZ8dmWI5hFb75CSBsBtIJrHTnP6bgppm7OeH4LnEkwMtixdRuyh4UyA==
X-Received: by 2002:a05:6808:97:b0:3af:795d:b74b with SMTP id
 s23-20020a056808009700b003af795db74bmr3192631oic.50.1697568285302; 
 Tue, 17 Oct 2023 11:44:45 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z26-20020a54459a000000b003af60f06629sm347141oib.6.2023.10.17.11.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 11:44:44 -0700 (PDT)
Received: (nullmailer pid 2496099 invoked by uid 1000);
 Tue, 17 Oct 2023 18:44:43 -0000
Date: Tue, 17 Oct 2023 13:44:43 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] dt-bindings: display: remove backlight node from panel
 examples
Message-ID: <169756828188.2496027.18329599357112403195.robh@kernel.org>
References: <20231011-dt-panel-example-no-backlight-v1-1-b81618d32752@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011-dt-panel-example-no-backlight-v1-1-b81618d32752@bootlin.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Oct 2023 12:47:38 +0200, Luca Ceresoli wrote:
> The examples for these panel drivers have a backlight node in addition to
> the actual panel node. However the exact backlight is outside the scope of
> this binding and should be dropped from the example.
> 
> Link: https://lore.kernel.org/linux-devicetree/20230724143152.GA3430423-robh@kernel.org/
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/ilitek,ili9486.yaml       | 4 ----
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml | 4 ----
>  Documentation/devicetree/bindings/display/sitronix,st7735r.yaml     | 5 -----
>  3 files changed, 13 deletions(-)
> 

Applied, thanks!

