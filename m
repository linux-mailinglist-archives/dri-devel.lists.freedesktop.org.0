Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C264227565
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 04:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC416E0F1;
	Tue, 21 Jul 2020 02:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A440F6E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:10:29 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a12so19723636ion.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/46L/c6KjZBA8UxcNLwuQWdQYtMpxrAX9cV63irRY9g=;
 b=T0li5ZTCCN7HdFCY83ugHffx7q1QGoyBTtmYTCva+MP2wikmwtOPn+vccl8M+yE+ob
 hUB4ZnoBx5+k4+zGy2OjLw7zXTZKgDiURCF9JCDWQCoVhWyFDE2yRkGlBuTxHEB5yvRt
 Vvy7u/rmE+UoVkCi6hJWSZkhn0UiGXErwh5czAgLFsB8zsXaoXasyL7LoYciQwAIebwJ
 +w9hS6BlM0jGilVuH93zW4HJvIaFc6IKJUBnm9Dxrsh9W8f4VTlgzpNeiNMFG/Kq4RRt
 MuFRUJyFaNSQIi4Vu8TJOstYLGIdHei/L0IejVxvkCLbg8JFW2XjImYbryKh1f+x6Zkj
 SDhA==
X-Gm-Message-State: AOAM533EOqf4rccgIwD25vHKlNiWOLdAF3rFUGbZfkG5WuLdHK5xTtnP
 jMEumuzZK9z3RXYGKmt5qg==
X-Google-Smtp-Source: ABdhPJwTmQpxHmmOzo0iMaN1uJwnfUhSB9KfvOR2nPHFEjoe2wxlJnhzE2QElfxxyztGC0KuU6qdQg==
X-Received: by 2002:a6b:b54e:: with SMTP id e75mr25929429iof.31.1595297428957; 
 Mon, 20 Jul 2020 19:10:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l18sm9842201ill.56.2020.07.20.19.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:10:28 -0700 (PDT)
Received: (nullmailer pid 3386425 invoked by uid 1000);
 Tue, 21 Jul 2020 02:10:26 -0000
Date: Mon, 20 Jul 2020 20:10:26 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
Message-ID: <20200721021026.GA3382460@bogus>
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714071305.18492-2-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Some LCD panels do not support 24-bit true color, or 8bits per channel
> RGB. Many low end ones only support up to 6 bits per channel natively.

This should be implied by the panel's compatible property.

> Add a device tree property to describe the native bit depth of the
> panel. This is separate from the bus width or format of the connection
> to the display output.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 0cd74c8dab42..8eb013fb1969 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -26,6 +26,9 @@ properties:
>    height-mm: true
>    label: true
>    panel-timing: true
> +  bits-per-color:
> +    description:
> +      Shall contain an integer describing the number of bits per color.
>    port: true
>    power-supply: true
>    reset-gpios: true
> @@ -42,6 +45,7 @@ examples:
>      panel {
>          compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>          label = "osddisplay";
> +        bits-per-color = <8>;
>          power-supply = <&vcc_supply>;
>          backlight = <&backlight>;
>  
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
