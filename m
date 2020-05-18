Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6591D86DF
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59696E47B;
	Mon, 18 May 2020 18:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BE96E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:28:45 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id 79so11731092iou.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/p9YM/GnXrG9SKVwxPAWMOdMPZXYXdovPfbgwwKorf0=;
 b=Kb77sqsrEcDBHHrVrDJvdV6aMDGsDKzp9e5L1z8cG4AT8ztSaEhtCqUSoISh7VZ3j+
 Wb4mZRE+oDkD5QJsgE8KuLH9TIM9fG6PmCH7p3+xwcSj8Il0oX8vb6/wCC/ZKFR9lqv/
 ilqmoOK2IDgks3CVp9NKtUmhFfIUW6PlFaG6blSYegOKXHu7QDluFL6dJj1wU1MT0KGp
 SU440vh9Xkcbt4pb7yqmbN7TNv+N9sfiSAfJby0Rp92fCL39Q827pcHF6VbdKtNcrUvQ
 /vvo3bx4ruqKxUl0ODJIb7ozKKN6GMe5WGU5KZ7m+W7wRvgBylRB2PNBhl6HB6+eaQPQ
 MkkA==
X-Gm-Message-State: AOAM53104qvG3y1HH0MoUkdBicMZLQdYOJf72/O6fQYBvDslOvjdUf9r
 OfcdBArrnsFsWowNfU47tA==
X-Google-Smtp-Source: ABdhPJyQMHKgCPUCeovV3BchpiRD9KADEVI8p81q+CRYTGF8ksnKQdsZoo8KTJr7NyfISNcmJcVulQ==
X-Received: by 2002:a5e:c303:: with SMTP id a3mr15796959iok.15.1589826525234; 
 Mon, 18 May 2020 11:28:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j2sm4147519ioo.8.2020.05.18.11.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:28:44 -0700 (PDT)
Received: (nullmailer pid 5690 invoked by uid 1000);
 Mon, 18 May 2020 18:28:43 -0000
Date: Mon, 18 May 2020 12:28:43 -0600
From: Rob Herring <robh@kernel.org>
To: srk@48.io
Subject: Re: [PATCH 1/2] dt-bindings: n133hse-ea1: Add Innolux N133HSE panel
Message-ID: <20200518182843.GA4265@bogus>
References: <20200509111834.26335-1-srk@48.io>
 <20200509111834.26335-2-srk@48.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200509111834.26335-2-srk@48.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Sean Cross <xobs@kosagi.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 09, 2020 at 01:18:33PM +0200, srk@48.io wrote:
> From: Sean Cross <xobs@kosagi.com>
> 
> The Innolux N133HSE panel is a 13.3" 1920x1080 panel that contains an
> integrated backlight, and connects via eDP.
> 
> It is used in the Kosagi Novena.
> 
> Signed-off-by: Sean Cross <xobs@kosagi.com>
> Signed-off-by: Richard Marko <srk@48.io>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 393ffc6acbba..756bf6a48e8d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -139,6 +139,8 @@ properties:
>        - innolux,g121i1-l01
>          # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
>        - innolux,g121x1-l03
> +        # Innolux Corporation 13.3" FHD (1920x1080) TFT LCD panel
> +      - innolux,n133hse-ea1
>          # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
>        - innolux,n116bge

Alpha-numeric order please.

>          # InnoLux 15.6" WXGA TFT LCD panel
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
