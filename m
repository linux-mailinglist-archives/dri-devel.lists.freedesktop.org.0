Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AD3B4719
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3F66EE09;
	Fri, 25 Jun 2021 15:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753C96EE09
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:59:03 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id q190so19592786qkd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMFqRamqkQgCF+ySIQhnWpXoURw1WLNbTY9bNZn+W38=;
 b=ciq0fyJCwg5/hK+oj/CXsEPQ74Dr1RLsBVZh4+AuAUDQH8M9HyGelwOrWBcBE8ev5l
 t8nYqFeRr3jN7EmUqoRa6Day9kVuUCvo0MK/+3x/SbtOyInz+5B5+iTMU8SvD2yqSxlv
 bSQp7Uv9ewlRA/0BHRPSkC4W8ju2ek50oD8Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMFqRamqkQgCF+ySIQhnWpXoURw1WLNbTY9bNZn+W38=;
 b=nk6mAsgnbPDC/6y0DPHa8iPPD1C7ZMTB+rVV3WVtLV2W/DkFmIwc2HCUGsIru4PTgJ
 sQN7iPXi3gOzlEPTBI6wA+t1Xa4pQl/kwbqDneQy8uJmnHQek4K6KUXOzeyyT/gAvuQR
 xuqTIPJgUGvg+3/3MEjUWMTcOl85z7hwusRG6jgH+SYoaJU1QHY1wNqjiosjsLo9G1GG
 E/V4tH1CK4rsF+P0mYD2+PTy+BZoI2NSwRWkbiG/FX6vxhWHQDuu8dnG2L35zguryzYI
 liN6lmASm/LJeJysmOHLbKr63Eu2PWUtfRpydiBKZ3IGYG7kesnesB8xIDstEU7sk3+D
 JraA==
X-Gm-Message-State: AOAM533Khsi+uD8102ujeYcJ+QS7A94AjTbUGPbKWrdMqnlObLCvVtSg
 faeSmE6bA0hPFprUOc1TeFeI5lVj9bmQUg==
X-Google-Smtp-Source: ABdhPJy/ZHbjickWxV0ZjWk8/LaAeVGAL+gUnZxJri4DoUh5+KrQRjLN8JNUNNTx9FmHXr3obOl7Cw==
X-Received: by 2002:a37:6d07:: with SMTP id i7mr12511382qkc.472.1624636742393; 
 Fri, 25 Jun 2021 08:59:02 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id u184sm898865qkd.53.2021.06.25.08.59.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 08:59:02 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id t8so5331628ybt.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:59:01 -0700 (PDT)
X-Received: by 2002:a25:2405:: with SMTP id k5mr13449716ybk.405.1624636741419; 
 Fri, 25 Jun 2021 08:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210624223743.2486302-1-linus.walleij@linaro.org>
In-Reply-To: <20210624223743.2486302-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jun 2021 08:58:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Un00zNuCQ=f5BV0dvi6gSMXgfC_e94OD5ZpS5ad3wJUg@mail.gmail.com>
Message-ID: <CAD=FV=Un00zNuCQ=f5BV0dvi6gSMXgfC_e94OD5ZpS5ad3wJUg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add DT bindings for Samsung LMS380KF01
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 24, 2021 at 3:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> +  spi-cpha:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: inherited as a SPI client node. Must be set.
> +
> +  spi-cpol:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: inherited as a SPI client node. Must be set.

I will defer to Rob Herring (added to CC) to confirm if we really need
all that stuff for spi-cpha and spi-cpol. I would have expected just:

spi-cpha: true
spi-cpol: true

As I understand it, the fact that they are flags will already be
validated as part of the "spi-controller.yaml" so you don't need to
specify that. ...and the fact that you have them listed as "required"
properties documents the fact that they must be set for your device,
so I don't think you need more.

NOTE: if you're testing this using your "example" below I think you
will find that you could set this to something other than just a flag
and it won't yell at you. However, that's because your example has a
bogus SPI controller node in it. I think if you put a real SPI
controller in the example then it'll pull in the "spi-controller.yaml"
bindings and magically start validating everything.


> +  spi-max-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

You don't need the "$ref" line here either, right? Again it'll be
validated as part of the "spi-controller.yaml".


> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - spi-cpol

Does "port" need to be listed as required too?
