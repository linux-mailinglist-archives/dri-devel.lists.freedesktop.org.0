Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2342C29D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EBD6EA0C;
	Wed, 13 Oct 2021 14:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E59E6EA0C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:15:04 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id j8so4748898uak.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOGdh1AkOHJBmLFPoyr41m94hwdgjBmCbg/FB38m3v4=;
 b=gZk3iy0X1UXjY603TXTyEOk1V0uqIOTUguorJmSD78PT8Zf7Eaf001rxkJJwJi4d8R
 rW3ojtPYJzisNy7yl9If+4+cCogKgyqw6yZDq+pnk/Na8IO5b5ah9SZqdPDgjcSTw2p8
 EuE2rM9vPr98da6oen3YUJLRPQi4rcd9E79SOvYWPvqUvnZJ23mjHdEo+CEcN1N81SSW
 c12Xf/MHlITnFrZLbuiZYyqe4Y3J10FFflglATIPWmgUajrARsW2HEFbLIWEZ43NRvVt
 Oh3k3NqOTpKP9pRn7sThe8zIYdQjuy3lJ6lBwnz0+Fa/LiWwdef3XY8GU2uM3HE3PZ20
 fonA==
X-Gm-Message-State: AOAM533pYWV/F6PZCciJuUXgfutaOO2YfSCbFShwXjBJWWTGlVzX516P
 aI9JY73DVd+Kx1DOD7/ORfYLEqPgdNaxIVeJHVXIQ92AyIs=
X-Google-Smtp-Source: ABdhPJwWSQSEOb7HJUiITEzyUPYdJB8jq0qc3AWy6XySRqTntnQ5K6xK2nsLta84iu1eLwmnUvTAtLLc1kvAWH4QoBw=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr30117696uaa.14.1634134503591; 
 Wed, 13 Oct 2021 07:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 16:14:52 +0200
Message-ID: <CAMuHMdVKgP5RAH5MhZzjjbfEJVZF6ERvyaQ7iyzDWs35dCtw6w@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Wed, Dec 23, 2020 at 10:32 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> @@ -0,0 +1,313 @@

> +  clock-names:
> +    minItems: 1
> +    maxItems: 4

After applying this to my local tree, as it is a dependency for 2/4 in
for-mfd-next:

Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml:
properties:clock-names: {'required': ['maxItems']} is not allowed for
{'minItems': 1, 'maxItems': 4, 'items': [{'const': 'vclk'}, {'enum':
['vclk2', 'lvdsclk', 'lvdsclkn']}, {'enum': ['vclk2', 'lvdsclk',
'lvdsclkn']}, {'enum': ['vclk2', 'lvdsclk', 'lvdsclkn']}]}
hint: "maxItems" is not needed with an "items" list
from schema $id: http://devicetree.org/meta-schemas/items.yaml#

> +    items:
> +      # vclk is required and must be provided as first item.
> +      - const: vclk
> +      # Other clocks are optional and can be provided in any order.
> +      - enum:
> +          - vclk2
> +          - lvdsclk
> +          - lvdsclkn
> +      - enum:
> +          - vclk2
> +          - lvdsclk
> +          - lvdsclkn
> +      - enum:
> +          - vclk2
> +          - lvdsclk
> +          - lvdsclkn
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
