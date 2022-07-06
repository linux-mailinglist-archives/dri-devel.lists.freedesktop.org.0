Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9A5680B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0064310E2FC;
	Wed,  6 Jul 2022 08:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64510E2D4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:03:35 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id x1so17188920qtv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dm7RnST85MIDJNN+2iaSBOhoswr2qSrezycwHqjqOec=;
 b=syFFULDVKmiXIzKg5S0wyuHGyka1pV3SFYGl/Nz5w2MFDglMtJcM8XjtUjGYeIqOkS
 u/LLk43aJ6PIAndzt2WeSNsKsK2/8403U+KCyj4aZ9gJEHVBQ4EBvntaKthcPwrljUgr
 +OyZI+9XzOm5CeKPVrgRfqly0ZmLprz5ymom7Ih/uVwsqdhWTILsi1fRNFQ8lYyOc1Gk
 5ZZfNx+6O4b2eamKxz1N1YZ7VsutlO9DBLxS1nFbpjdBWNgTZqMAG0UhIVwAAP9pPqlC
 D49LxJY1ohhTg4pvN0L0tY36QDoKVW9ksE9Lp7d3DnRAHWZkLPds/o4CTBUAVYbALk0G
 KCfQ==
X-Gm-Message-State: AJIora9DwZ4PXM7OtQ0lE8+tYyc4REqp4cjbOezC8x+K5Tv8H5/JhbGV
 EcpACuw4ptL1ajPaEsthdjI+55ehktGDpA==
X-Google-Smtp-Source: AGRyM1uD/7g43B0GHPkeq0o95U+CZ/XCcouhlHDEdgoPwMNq/NdpVW17ax17CNl2PxFky8f/YOSlzw==
X-Received: by 2002:a0c:da8d:0:b0:472:f799:31ef with SMTP id
 z13-20020a0cda8d000000b00472f79931efmr11300028qvj.129.1657094614371; 
 Wed, 06 Jul 2022 01:03:34 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a400f00b006af147d4876sm28542704qko.30.2022.07.06.01.03.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:03:33 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3137316bb69so131754747b3.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:03:33 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr9659273ywb.502.1657094613015; Wed, 06
 Jul 2022 01:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220705215213.1802496-1-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 10:03:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
Message-ID: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
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
> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> action. Since I sent v1, I tried to buy some since it's cheap - but could
> out of the limited stockists none seemed to want to deliver to Ireland :(
> I based the series on next-20220617.

Digi-Key does not want to ship to IRL?
The plain MAiX BiT is out-of-stock, but the kit incl. a display is
available (97 in stock).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
