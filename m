Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD97C462679
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 23:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDFD6E05A;
	Mon, 29 Nov 2021 22:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320516E05A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 22:49:54 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 98-20020a9d086b000000b0057a403bbd4eso3023132oty.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 14:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lgpJDEy/DEmK8UFLaeIWSUbO9Yqo5LKn3BjNolq3NLA=;
 b=dxW9CcXAKjSAAB+06ubszjZFXkDCwqxGDkDPvL24UU0FG8JTFO32oI08hJwizLUeHC
 m04QNbSeHKk3ejZb6Bw4NP0AyJqe8QUxEFKqllQskOTaU4KzXHOxuqGkv3fdqGt/3Fcc
 63iwedVLKVUXXOBVn0JADnccxQa3naNkUnQfm+1BAJ4XYglwJKmFuOO8X8Bsk58hgUJ5
 SkfKDdeNHIGpVx8erOa/4yrTCDpnV2aNa4XupD3JQ6hmYIxw0igEzm7/SOoyYgL5t90i
 OhlS5ajuJdUre2lCIlMC1cl4rXE3nM+BIHxbB5kx5pd5EsXTURs3Wx+wu+hUIa8STSQr
 m2vw==
X-Gm-Message-State: AOAM533itzXkp4VXV7pFeH2mWWY0PLhfX6JqAsnJsJ4j0J82GGGHOS5k
 YTU730mgqEYt6r+OilfjtQ==
X-Google-Smtp-Source: ABdhPJwA6KqX3QbtFMquS84BeoB10ocNLEcrE8q5FJnCKsRjemYVJZbBxHo5WBw+uf9OlxKBceqPAA==
X-Received: by 2002:a05:6830:2712:: with SMTP id
 j18mr46832046otu.302.1638226193372; 
 Mon, 29 Nov 2021 14:49:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm2505203oow.3.2021.11.29.14.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:49:52 -0800 (PST)
Received: (nullmailer pid 755875 invoked by uid 1000);
 Mon, 29 Nov 2021 22:49:51 -0000
Date: Mon, 29 Nov 2021 16:49:51 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/5] dt-bindings: display: vc4: Add optional phandle to
 firmware
Message-ID: <YaVZDxac/OGyJVC9@robh.at.kernel.org>
References: <20211117145040.334827-1-maxime@cerno.tech>
 <20211117145040.334827-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117145040.334827-2-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel@lists.freedesktop.org, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 03:50:36PM +0100, Maxime Ripard wrote:
> The firmware can free all the resources it was using to run the display
> engine that won't be needed once the kernel has taken over.
> 
> Thus, we need a phandle to the firmware DT node to be able to send that
> message when relevant.

Why? Just use of_find_compatible_node(). 

> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/display/brcm,bcm2835-vc4.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
> index 49a5e041aa49..18de6912b833 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
> @@ -21,6 +21,11 @@ properties:
>        - brcm,bcm2835-vc4
>        - brcm,cygnus-vc4
>  
> +  raspberrypi,firmware:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: >
> +      Phandle to the firmware node
> +
>  required:
>    - compatible
>  
> -- 
> 2.33.1
> 
> 
