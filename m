Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C903199F84
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 21:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26E96E354;
	Tue, 31 Mar 2020 19:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDBA6E354
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 19:57:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i3so13964300ioo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h4MVejpKXdUvf3pPVBrkNWcFoXIpak/ROd8AjzEbfKY=;
 b=LzstMlanPf/jHH9up6V/UzYvZLrqZ0zuK8YdmdC1uq/7kQs232hGVFLZrQuQZtNUQT
 dlOYVAHcxJvrfdlm508dXI4+ZRT5fPHpkuViMps5f77fgUSnM4BTSvillSCQO9vwfFRC
 lXjuCtt7CUDeo6EHI40/UCSiBCKOavSmsWMhUH9ETZYqie/U9nt6vLcbaQ1edcFvNCE6
 Jknrf3UUSu89b+pZHgVhf3ragk050HIvhnFXmpDG7TTqEYa56+KcEGCQcQRkoU1QwuVh
 VH7yWc4plFr0/MdtR6bXxDh/TQAC7HQSV8OHPGIaqJ1DghRJVODuvpIVNEmc0f9yHPlO
 8thA==
X-Gm-Message-State: ANhLgQ1AXe9hNgunqAancqPf/wC/B/g842n0VZuwXJvTEVQCwHvRZOoP
 +AXL+Vq2R/cMMjZDDvdJWw==
X-Google-Smtp-Source: ADFU+vtc5oUJqWcdHGbZePzerMkO7IsVV4rSImDoXIrm0C537o3o03dpCu4eAitRh3oGSvNBCV8CZQ==
X-Received: by 2002:a02:2427:: with SMTP id f39mr12183287jaa.7.1585684664392; 
 Tue, 31 Mar 2020 12:57:44 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id f74sm6145627ilh.77.2020.03.31.12.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:57:42 -0700 (PDT)
Received: (nullmailer pid 441 invoked by uid 1000);
 Tue, 31 Mar 2020 19:57:41 -0000
Date: Tue, 31 Mar 2020 13:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: David Lu <david.lu@bitland.com.cn>
Subject: Re: [PATCH] dt-bindings: boe,tv101wum-n16: Add compatible for boe
 tv105wum-nw0.
Message-ID: <20200331195741.GA26161@bogus>
References: <20200324094525.4758-1-david.lu@bitland.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324094525.4758-1-david.lu@bitland.com.cn>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jungle.chiang@bitland.com.cn,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 05:45:25PM +0800, David Lu wrote:
> Add bindings documentation for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD
> panel.
> 
> Signed-off-by: David Lu <david.lu@bitland.com.cn>
> Change-Id: I450c0e52aae080728d4794bdffc50bb0d2f39f40

Drop this.

> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

With that fixed,

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index 740213459134..7f5df5851017 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> @@ -24,6 +24,8 @@ properties:
>        - boe,tv101wum-n53
>          # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
>        - auo,b101uan08.3
> +        # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
> +      - boe,tv105wum-nw0
>  
>    reg:
>      description: the virtual channel number of a DSI peripheral
> -- 
> 2.24.1
> 
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
