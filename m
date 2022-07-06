Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A785680C7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E410FF22;
	Wed,  6 Jul 2022 08:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E2111228F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:10:00 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id v6so10513867qkh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNNZ2G3zXs1oo3JcBfsTX3whovGatUAPfm1YVK9uZPI=;
 b=nJxeEaWjia6T6eFZSZjhBh307gRsytGXxC9mrF0x1y30XQNFOsw/+mu3YdddP+R/it
 +2Rk5lDqc1mSW9TR42LWS4e3GGL4kPdJjgWP98qgbp9Fl4kGtAXI59DKsTNMgUd+C7SY
 vQxCmrx4c0Kg3mi+j8dgXPMLkGKThhQS4fkapb7DO1DcInjOxMGOiksBzKzxHqRFfSPF
 i4VQ5lK4xZph6tYiA76wrlp4R1KQIW0meTDakMz82gFliwydY9lPY7oDHju+rFTEvwR0
 XwCMWh0ohG98/P3GydKv8wpEmznQbumFi2fsOWwzZMmnv1s7qVeYrIbaFxyoAfxpTT5C
 bLDg==
X-Gm-Message-State: AJIora+bxJhctiofqgjglox4sJcEBFXdNlTlVsP9hQphD6EwIJFW9Jek
 sAZOWb44C5Zd7JKdZAYyONvy8PZWXkp+7w==
X-Google-Smtp-Source: AGRyM1s00XACF5LMWuDMslWYCuZTVCcCKXF0PgH64hyER+CjEgKYUvlK7xXg7weTHDwktMdBRGTvGg==
X-Received: by 2002:a05:620a:461f:b0:6af:6f18:b429 with SMTP id
 br31-20020a05620a461f00b006af6f18b429mr26057872qkb.646.1657094998869; 
 Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 r4-20020ac84244000000b00317ca023e33sm23352701qtm.80.2022.07.06.01.09.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i14so6323814yba.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
X-Received: by 2002:a25:be49:0:b0:64a:2089:f487 with SMTP id
 d9-20020a25be49000000b0064a2089f487mr27921915ybm.202.1657094998024; Wed, 06
 Jul 2022 01:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220705215213.1802496-1-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 10:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrVsvYRth+edCs6_bdDTWDacxegMDmgy9HeaKPRaWfkg@mail.gmail.com>
Message-ID: <CAMuHMdXrVsvYRth+edCs6_bdDTWDacxegMDmgy9HeaKPRaWfkg@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
To: Conor Dooley <mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Dillon Min <dillon.minfei@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine <dmaengine@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

On Tue, Jul 5, 2022 at 11:52 PM Conor Dooley <mail@conchuod.ie> wrote:
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
>
> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> action. Since I sent v1, I tried to buy some since it's cheap - but could
> out of the limited stockists none seemed to want to deliver to Ireland :(
> I based the series on next-20220617.

Boots fine on SiPEED MAiX BiT, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
