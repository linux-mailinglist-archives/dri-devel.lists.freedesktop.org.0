Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EC57D41D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD72B8A8C2;
	Thu, 21 Jul 2022 19:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE3A2BFF3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 19:30:09 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id q2so748346ilv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S5oqoZILA3qJDwFMm5veai5D2xa9Jh2FvCXN1Y4esC4=;
 b=lu96vWbyZVGOfrKf1jbrUdNDqmUnor4BmMk77fgH11dbx6cNtiyQlHYr/+7qPMSOFQ
 WoyMmDqjk6w2V2awdGYDHf54Jwp8wxVerR6HpYRYf/kpHuSd2y+5wuP1Hyj829G9d3T0
 yrpOQklp3l2eWbUJGvZtsNBPZlPmtvMQCdcZLeUcl0B88+4UFFwxOHB41CpvDoyBpb5J
 +UqWdXbYDQ4/7UGS7m3uHO9jxMuWE/SoO32TWsWCChtcbGV1oP3iXgT2pgk7ufR3Xlp8
 MpnAkYFxZArIyautBSppb3Zv3+wQ5zZDn1Tj9ORf53OQ+9QgTTa7a56lL4H0gvAJQ0U3
 OCZw==
X-Gm-Message-State: AJIora/EKDadOtdoSlRKiK8mPihmIkK4u5HGiFHIapL14tK2tQj/dULf
 cwsckjiQNpp4T9i4x2HVGg==
X-Google-Smtp-Source: AGRyM1tXf8F5SuOd7u9OTYkcAFQnmVlNgUvsAqcBnI6RZZvikkHvaiVm4o7nZS8N3k7KCBJHQznkQQ==
X-Received: by 2002:a05:6e02:20ca:b0:2dc:90fa:af35 with SMTP id
 10-20020a056e0220ca00b002dc90faaf35mr21707489ilq.302.1658431808875; 
 Thu, 21 Jul 2022 12:30:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a029503000000b0033f347c26basm1149854jah.62.2022.07.21.12.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:30:08 -0700 (PDT)
Received: (nullmailer pid 1791625 invoked by uid 1000);
 Thu, 21 Jul 2022 19:30:04 -0000
Date: Thu, 21 Jul 2022 13:30:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: panel: explicitly list SPI CPHA and CPOL
Message-ID: <20220721193004.GA1783390-robh@kernel.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
 <20220721153155.245336-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721153155.245336-2-krzysztof.kozlowski@linaro.org>
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
Cc: Tomislav Denis <tomislav.denis@avl.com>,
 Markuss Broks <markuss.broks@gmail.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno Sa <nuno.sa@analog.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sankar Velliangiri <navin@linumiz.com>, linux-spi@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Christian Eggers <ceggers@arri.de>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Stefan Popa <stefan.popa@analog.com>,
 Sean Nyekjaer <sean@geanix.com>, Jakub Kicinski <kuba@kernel.org>,
 Nishant Malpani <nish.malpani25@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Stefan Wahren <stefan.wahren@in-tech.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 linux-fbdev@vger.kernel.org, Matheus Tavares <matheus.bernardino@usp.br>,
 Marek Belisko <marek@goldelico.com>,
 =?UTF-8?Q?M=C3=A5rten_Lindahl?= <martenli@axis.com>,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Cristian Pop <cristian.pop@analog.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Brown <broonie@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 05:31:50PM +0200, Krzysztof Kozlowski wrote:
> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Explicitly list them in
> device bindings in preparation of their removal from generic
> spi-peripheral-props.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/lgphilips,lb035q02.yaml   | 10 ++++++++++
>  .../bindings/display/panel/samsung,ld9040.yaml       | 10 ++++++++++
>  .../bindings/display/panel/samsung,lms380kf01.yaml   | 12 +++++++++---
>  .../bindings/display/panel/samsung,lms397kf04.yaml   | 12 +++++++++---
>  .../bindings/display/panel/samsung,s6d27a1.yaml      | 12 +++++++++---
>  .../bindings/display/panel/sitronix,st7789v.yaml     | 10 ++++++++++
>  .../devicetree/bindings/display/panel/tpo,td.yaml    | 10 ++++++++++
>  7 files changed, 67 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> index 5e4e0e552c2f..0bd7bbad5b94 100644
> --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> @@ -21,6 +21,16 @@ properties:
>    enable-gpios: true
>    port: true
>  
> +  spi-cpha:
> +    type: boolean
> +    description:
> +      The device requires shifted clock phase (CPHA) mode.
> +
> +  spi-cpol:
> +    type: boolean
> +    description:
> +      The device requires inverse clock polarity (CPOL) mode.

Not great duplicating the type and description everywhere.

We can move the definition back to spi-controller.yaml, so then that 
does type checking of the property, but not presence/absence checks.

Rob
