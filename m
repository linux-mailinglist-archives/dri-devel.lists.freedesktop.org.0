Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449216BDB2D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 22:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6899D10E1E6;
	Thu, 16 Mar 2023 21:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED5C10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 21:57:38 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id f14so1463245iow.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 14:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679003857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCX8Q0KiFWBenYq33JmGKJRfWkS+jFykJMHbbG7dBoQ=;
 b=lVCEtbdmqUCIjKwhkmOQEob+nmI6eff0y/HB0w2oxRKUljbwi76qOe8xAz9ECa79Mf
 fSgHjfkXdxRV4uL94uq8+RfxnxKi6DMwU7JrjYW5LUydhnBG9KmwxMDa5W9VlvQqlhUa
 3zDzBIoy7htD7KF8fig2nBs6SgUzYSTNRVywmINnCFii29rTuuhhR2HWxxpQX3344WN6
 1YWaHkzQM+BujR25qrZ9dlBMrLgDmlX8g6BqPurwXYa+nGHfd2O3wXMUN83pHyR+3m2Z
 t4CLNRWG3j2ntkeK78noaU5YcUNFQI0Y40qUXng7+2TsoP9l3RsokvMMFw1znme+p1o3
 1Klw==
X-Gm-Message-State: AO0yUKW6El9TT3hMYrCUmMKM4p3n46eIcGFoCRp6qq92s3N0yHTYtgfs
 i1Cg4N21szwG+BnIo+8otKDhKCmVXg==
X-Google-Smtp-Source: AK7set/1ioEGwLLlKvF20+unEkGcnCNWjn2iYIU36TopHqxFzHe7QejHEg/KOrCEWBF56csPo4ShDQ==
X-Received: by 2002:a6b:5b12:0:b0:745:4726:b228 with SMTP id
 v18-20020a6b5b12000000b007454726b228mr335948ioh.17.1679003857572; 
 Thu, 16 Mar 2023 14:57:37 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a056638248300b003ee9720740esm121887jat.153.2023.03.16.14.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 14:57:37 -0700 (PDT)
Received: (nullmailer pid 3948932 invoked by uid 1000);
 Thu, 16 Mar 2023 21:57:35 -0000
Date: Thu, 16 Mar 2023 16:57:35 -0500
From: Rob Herring <robh@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Message-ID: <20230316215735.GA3940832-robh@kernel.org>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
> The sitronix-st7789v driver now considers the panel-timing property.

I read the patch for that and still don't know 'why'. Commit messages 
should answer why.

> Add the property to the documentation.

We generally don't put timings in DT for panels. Why is this one 
special?

> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> ---
>  .../display/panel/sitronix,st7789v.yaml         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> index ed942cd3620f..8810f123dedf 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> @@ -21,6 +21,7 @@ properties:
>    reset-gpios: true
>    power-supply: true
>    backlight: true
> +  panel-timing: true
>    port: true
>    rotation: true
>  
> @@ -54,6 +55,22 @@ examples:
>              spi-cpol;
>              spi-cpha;
>  
> +            panel-timing {
> +                clock-frequency = <7000000>;
> +                hactive = <240>;
> +                vactive = <320>;
> +                hfront-porch = <38>;
> +                hback-porch = <10>;
> +                hsync-len = <10>;
> +                vfront-porch = <8>;
> +                vback-porch = <4>;
> +                vsync-len = <4>;
> +                hsync-active = <1>;
> +                vsync-active = <1>;
> +                de-active = <1>;
> +                pixelclk-active = <1>;
> +            };
> +
>              port {
>                  panel_input: endpoint {
>                      remote-endpoint = <&tcon0_out_panel>;
> -- 
> 2.37.2
> 
