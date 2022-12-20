Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347765244B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA810E090;
	Tue, 20 Dec 2022 16:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F6A10E090
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:07:24 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-144bd860fdbso15971365fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 08:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/u+y5GSLZEEG0FI6JVp5YQvEAR9DtzlzUi4XN5IYYg=;
 b=uetLTRtrwKO34Ot3EwvTnI2BcZIpYz8Lkxi5f7bZv3eJHaVa9BtnV/5Z4qWKDL7BJ2
 NWy5RxP4CuBQlLaI1ttX42VMlD6ycl2D4PudwwbWkO88GqAMGZriWD5CZPNsX/r5CZik
 6B0GyVP5IhdhH69AUI57ey8k5beJTP3/0AFQlKdkt2Za6JU5jmNSHPEVhGTNsfI20I7A
 QEiyu1Jzjumu9AmExMhHmcR9FIMUUSK3iZCKsHI9cw1gya4SpcalUgC7JmfimWbpvWFS
 vZlpRo2WWXo/KwgJ9p1/v6G63Rv6n8HhEmsfwO5RuiVMFBBBUK+TYV+A+ViseIrHSp4B
 Yv9w==
X-Gm-Message-State: ANoB5pkD9sv1McolCWLh+YMDDD+CA7GTLHPlOmnGMb0q5qztCqicAR0o
 VL7W93L42DQVftmyda8vvA==
X-Google-Smtp-Source: AA0mqf7Vr3fx/nZSVhqd0FR3tqQ0t2069C3rCa0EhIFdtpBAjjoKR5PH1zTpaiGVYRnNzM3trAwTnQ==
X-Received: by 2002:a05:6870:1696:b0:144:7a85:63ea with SMTP id
 j22-20020a056870169600b001447a8563eamr23948571oae.23.1671552443772; 
 Tue, 20 Dec 2022 08:07:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020a056870460900b00140d421445bsm6185661oao.11.2022.12.20.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:07:23 -0800 (PST)
Received: (nullmailer pid 647058 invoked by uid 1000);
 Tue, 20 Dec 2022 16:07:22 -0000
Date: Tue, 20 Dec 2022 10:07:22 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: soc: rockchip: grf: add
 rockchip,lvds.yaml
Message-ID: <20221220160722.GA635186-robh@kernel.org>
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
 <0b9bb507-1819-4bfa-593f-8b7e92c2ce3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b9bb507-1819-4bfa-593f-8b7e92c2ce3d@gmail.com>
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 05:56:35PM +0100, Johan Jonker wrote:
> Add new converted rockchip,lvds.yaml to grf.yaml file.
> Prepare for more SoCs with lvds output.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/soc/rockchip/grf.yaml          | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2ed8cca79..d74295e98 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -75,13 +75,17 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,px30-grf
> +            enum:
> +              - rockchip,px30-grf
> 
>      then:
>        properties:
>          lvds:
> -          description:
> -            Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> +          type: object
> +
> +          $ref: "/schemas/display/rockchip/rockchip,lvds.yaml#"

You can drop the quotes.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +          unevaluatedProperties: false
> 
>    - if:
>        properties:
> --
> 2.20.1
> 
> 
