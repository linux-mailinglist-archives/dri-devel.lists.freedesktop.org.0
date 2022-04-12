Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4A4FDF43
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366B510E61F;
	Tue, 12 Apr 2022 12:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27C310E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:07:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43BA7B81D06
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B944C385AD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649765236;
 bh=ogE5ybnNzjbeaUs8XfhvgUoIApTax4ov6E7K92asMNs=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=D0eLDKVUOEryqXyU30wgT0oTEy0cz/IBaKwg4xHwd+6zv6MHtDFJdDgz5RoGilSzn
 wtTvZ9lQMiF/VuljH7jAAEFKCiUKlWUH0htyeFlif5dgbPJlc5jbaAiIy8/Wual4pY
 dt/zfJWayDw6bcWo3oxKz8ku+NdWPo8xHTOWSAWh5fk47gtku9hhwzxwbvpME1k28g
 sF/MepEwB7/h7R4oHkMDGRrMF2/EGQ9oJJ0pM/fcJ710znASgvZfTpTAV9V46bH07Z
 ybe7bKFYcKiK8Om358xyiV67yCbz1YdOWEWwt3OAZ6mKejFeiNZLkB2fRoM5gkpcxY
 8ErR7+RY+Bf+A==
Received: by mail-vs1-f45.google.com with SMTP id e11so16005287vso.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:07:16 -0700 (PDT)
X-Gm-Message-State: AOAM533dWLDqCFF+cFSlzYjWRrVXid4wVgiRwIXAeyPkqJybo5BnJuPZ
 19FgHAzu49wCavjxY/TXfnwY9YoLWCDrIuC26Z4=
X-Google-Smtp-Source: ABdhPJzjEEHJ1j3lKpjqp/WFdHMDZcR/5QTgBJgXwmPXWsXCZQHuWZkG7PxraL3PSeHLZ50+5phOm6ZKNJy+juNEIBM=
X-Received: by 2002:a05:6102:3098:b0:328:1825:61f8 with SMTP id
 l24-20020a056102309800b00328182561f8mr7138726vsb.39.1649765235208; Tue, 12
 Apr 2022 05:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-2-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-2-javierm@redhat.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 12 Apr 2022 20:07:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65CBZp3DZFGX0GMTaQQPYMKJTJMNoU2V5u7MxsLN7ONKQ@mail.gmail.com>
Message-ID: <CAGb2v65CBZp3DZFGX0GMTaQQPYMKJTJMNoU2V5u7MxsLN7ONKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
To: Javier Martinez Canillas <javierm@redhat.com>
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
Reply-To: wens@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 5:12 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The current compatible strings for SSD130x I2C controllers contain both an
> "fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
> and also that are for devices that can be accessed over an I2C bus.
>
> But a DT is supposed to describe the hardware and not Linux implementation
> details. So let's deprecate those compatible strings and add new ones that
> only contain the vendor and device name, without any of these suffixes.
>
> These will just describe the device and can be matched by both I2C and SPI
> DRM drivers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>
> Changes in v2:
> - Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven).
>
>  .../bindings/display/solomon,ssd1307fb.yaml   | 37 ++++++++++++-------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index ade61d502edd..6b9d0c72739a 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -12,12 +12,23 @@ maintainers:
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
> +              - sinowealth,sh1106-i2c

I think you can just drop this one, since it was just merged and isn't
part of any release yet. It's not even in -rc.

ChenYu
