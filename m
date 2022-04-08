Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8444F9C78
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8F510E92F;
	Fri,  8 Apr 2022 18:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259110E925
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 18:22:08 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso6691829otj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 11:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lf2HIDOgcxd3N/SJmrm+i3BU0QKkjgIH52w0l9HZULg=;
 b=JmzqxSsue6mrYAbwktmYq3Ib/CaRgiYjmFFs2InPLpyr3s4mtY1JaU11dkdSO+7b1v
 rnQFMgzBKafZ44t1d36tYiy3Xgyncg9LhsXCW6ipkW/Ji7TUBNB/FK/xcg3Tbhf9c7tC
 yTimQUnOfRNe/tlCRVpUTe7ejueraF7swLizGbDTo6jTMwy2SwOJPkzg00yd3ba/w1V3
 7+YJaLtKAqYF57f7DRKL+NeYwMnsGqQjbyvzo4+i9jA6CHqEBvRvuBe77VeudVPlbwE8
 di8dnzTvv2DYfM+VSUDexW+S9otByXxXh4fX3/If+TBq0zSKt/Gh3pYrUIADKGzblZjl
 bCQw==
X-Gm-Message-State: AOAM533UqCLMMI0PdwYFn546TM5RJ+K2m4DNdz57VxzoGKbHMOF58ok+
 0PjgmkDCXYYFUf5XiuvZhA==
X-Google-Smtp-Source: ABdhPJy91m7vj0F/F1zyS9qB+nTfpd/raBdG+Fj65mRFlO9Vv/D+Ezuacy99dHSUu24EJa4eacDzpg==
X-Received: by 2002:a9d:4798:0:b0:5b2:3791:beb7 with SMTP id
 b24-20020a9d4798000000b005b23791beb7mr7026104otf.123.1649442127768; 
 Fri, 08 Apr 2022 11:22:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056870d68300b000e2a0a74f9fsm394717oap.37.2022.04.08.11.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 11:22:07 -0700 (PDT)
Received: (nullmailer pid 3810091 invoked by uid 1000);
 Fri, 08 Apr 2022 18:22:06 -0000
Date: Fri, 8 Apr 2022 13:22:06 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
Message-ID: <YlB9TsbhoQblo1H8@robh.at.kernel.org>
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407200205.28838-2-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 10:02:00PM +0200, Javier Martinez Canillas wrote:
> The current compatible strings for SSD130x I2C controllers contain an -fb
> suffix, this seems to indicate that are for a fbdev driver. But the DT is
> supposed to describe the hardware and not Linux implementation details.

True, but compatible is just an identifier. There's no reason to 
deprecate unless the binding as a whole needs to be redone.

I imagine you also want 2 compatibles for 2 drivers. That's saying you 
should change your firmware to switch drivers. The fact that we have 2 
drivers for the same h/w is a kernel problem. Don't bring DT into it.

> Let's deprecate those compatible strings and add a new enum that contains
> compatible strings that don't have a -fb suffix. These will be matched by
> the ssd130x-i2c DRM driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../bindings/display/solomon,ssd1307fb.yaml   | 36 ++++++++++++-------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index ade61d502edd..46207f2c12b8 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -12,12 +12,24 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - sinowealth,sh1106-i2c
> -      - solomon,ssd1305fb-i2c
> -      - solomon,ssd1306fb-i2c
> -      - solomon,ssd1307fb-i2c
> -      - solomon,ssd1309fb-i2c
> +    oneOf:
> +      # Deprecated compatible strings
> +      - items:
> +          - enum:
> +              - solomon,ssd1305fb-i2c
> +              - solomon,ssd1306fb-i2c
> +              - solomon,ssd1307fb-i2c
> +              - solomon,ssd1309fb-i2c
> +        deprecated: true
> +
> +      # SSD130x I2C controllers
> +      - items:
> +          - enum:
> +              - sinowealth,sh1106-i2c
> +              - solomon,ssd1305-i2c
> +              - solomon,ssd1306-i2c
> +              - solomon,ssd1307-i2c
> +              - solomon,ssd1309-i2c

There's also no reason to put the bus interface into the compatible as 
the same compatible will work on different buses. But since you want to 
add SPI, just using the 'i2c' one will confuse people. For that reason 
you could add 'solomon,ssd1305', etc. for both SPI support and I2C DRM. 
(You should also support the 'fb-i2c' variant in DRM IMO, but doubtful 
that I'll review that.)

Rob
