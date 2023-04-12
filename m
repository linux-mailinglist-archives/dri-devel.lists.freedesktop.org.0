Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1426DF99E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3A010E86B;
	Wed, 12 Apr 2023 15:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ED810E86B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:18:50 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id bm45so2222492oib.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681312729; x=1683904729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1rryL6U4mVQ09wLHpMpKxLtoPKlN4qyacoLMBPLIA8=;
 b=TCtQv6jqduxLbF9n62avPnojThETw0zuoVVBP9KBlJ/O5An74/IFYqft+D47/+N7P7
 MoXdFItmZAuFSASx5UeXj1IEFzLGB1gXMSUVgs96BElwHIl2XVsVyd0jNGjcUP7h3PRF
 xD0VZDIYDzZaq4mdn9H2eOviUu2Ca20xv3cmVnWDy0uNEZOy0rYdeL48P6+wMz4caJIm
 R38vYT0Pkc4aMKKQyzWWPAcPj0fqdNkRjMnlJhO+7X1Gxt/uCz09aKvpmu+1iwxXJj2l
 5TXXgoBc5h1yce6uyZKZ1rACcjHQfTZTcXs9sLabB9ROqJyTZTISHgOo1nBagWOvfoOy
 jg7w==
X-Gm-Message-State: AAQBX9f8NVqbwyvVpAYPVrpT9qSbdY9QQBkhbc4rakrulb2KA3HEadtg
 pEUNBAIWnUyzl9Cktc1FPA==
X-Google-Smtp-Source: AKy350ZQbeCh5cmuFfBKiLl5geDZUvxtr5QiIwe7+jUSiiP4xOlRTlJOwAPMqYo7nFte+GQkh0totg==
X-Received: by 2002:a05:6808:2089:b0:38b:be56:81 with SMTP id
 s9-20020a056808208900b0038bbe560081mr5854480oiw.28.1681312729319; 
 Wed, 12 Apr 2023 08:18:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r206-20020acaf3d7000000b0038bf8c6151fsm558883oih.6.2023.04.12.08.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:18:49 -0700 (PDT)
Received: (nullmailer pid 2453568 invoked by uid 1000);
 Wed, 12 Apr 2023 15:18:48 -0000
Date: Wed, 12 Apr 2023 10:18:48 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix the
 video-interfaces.yaml references
Message-ID: <20230412151848.GA2452008-robh@kernel.org>
References: <20230408174736.1789082-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408174736.1789082-1-festevam@gmail.com>
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
Cc: neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 08, 2023 at 02:47:36PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> video-interface.txt does not exist anymore, as it has been converted
> to video-interfaces.yaml.
> 
> Update the references to the new file name.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 911564468c5e..967b1deb4936 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -106,7 +106,7 @@ properties:
>                      description:
>                        If you have 1 logical lane the bridge supports routing
>                        to either port 0 or port 1.  Port 0 is suggested.
> -                      See ../../media/video-interface.txt for details.
> +                      See ../../media/video-interfaces.yaml for details.

I would just drop this. There *should* be a $ref to the schema already 
up above here.

>  
>                    - minItems: 2
>                      maxItems: 2
> @@ -118,7 +118,7 @@ properties:
>                      description:
>                        If you have 2 logical lanes the bridge supports
>                        reordering but only on physical ports 0 and 1.
> -                      See ../../media/video-interface.txt for details.
> +                      See ../../media/video-interfaces.yaml for details.
>  
>                    - minItems: 4
>                      maxItems: 4
> @@ -132,7 +132,7 @@ properties:
>                      description:
>                        If you have 4 logical lanes the bridge supports
>                        reordering in any way.
> -                      See ../../media/video-interface.txt for details.
> +                      See ../../media/video-interfaces.yaml for details.
>  
>                lane-polarities:
>                  minItems: 1
> @@ -141,7 +141,7 @@ properties:
>                    enum:
>                      - 0
>                      - 1
> -                description: See ../../media/video-interface.txt
> +                description: See ../../media/video-interfaces.yaml
>  
>              dependencies:
>                lane-polarities: [data-lanes]
> -- 
> 2.34.1
> 
