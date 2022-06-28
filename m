Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A955BEFF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F0110F7C5;
	Tue, 28 Jun 2022 07:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207B10F84E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:15:16 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so15949765fac.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lScN3gMa3B+jKKFR5EiTq6EuQY+/4GeckwwsLv10h1E=;
 b=LiF/H8x1RmPAxYTueNG2o5QLUlI07P2GsKfXa++LRWG+LSb/HzWm88Ll0otc6LxMh5
 v/FWGzGH4GJ84kWjMghxKhODN4mo+wzocceOQGIFqN6b7DgEl+GWtcr+b8oT7dsh8ArC
 DU12e28Sp9LLr8ikA6Nk7Kt1pBaRv6Mmv/9WjioMbK8LktTQukDHplfx8BkjOlZGI9g5
 uZn66OlHuOk+CRnqN3XpuNJ+F2x3AIsILgALI0mUa1FsIUm4wYX7Vf+bymxO1G/g8jS1
 3jTQKbsCU/8DYVZpbQc/DeyX6jkHj+9Wp6P7/oUCu+bjUWMqbIztmQY+oSEVAtG3p4Ce
 uMog==
X-Gm-Message-State: AJIora9RyIL2B4J1PL9ANKAsaTj5x3oJAmFVVqbEaBxcTwV2zagghfsS
 Bb3Lp3WFcDqMzKO2ijWmUqsSholidezdGg==
X-Google-Smtp-Source: AGRyM1s6kNqLEhNZHjAfNGyfOspY5FZF24USzPBCGjHtDLHHSyeH7Dx0z9J7iLmm3UlDxiOFXnVP5A==
X-Received: by 2002:a05:6870:e3c9:b0:101:dcbb:4e6e with SMTP id
 y9-20020a056870e3c900b00101dcbb4e6emr9332199oad.166.1656400515189; 
 Tue, 28 Jun 2022 00:15:15 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53]) by smtp.gmail.com with ESMTPSA id
 b14-20020a0568301dee00b0060bf9d6c060sm3425540otj.1.2022.06.28.00.15.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:15:14 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id
 q18-20020a9d7c92000000b00616b27cda7cso7510386otn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:15:14 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17966996ybu.604.1656400124939; Tue, 28
 Jun 2022 00:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
 <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
In-Reply-To: <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:08:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Message-ID: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
To: Conor Dooley <Conor.Dooley@microchip.com>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Brown <broonie@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

On Tue, Jun 28, 2022 at 8:30 AM <Conor.Dooley@microchip.com> wrote:
> On 28/06/2022 00:29, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> >> controller, but according to the documentation & devicetree it has 6
> >> interrupts rather than the standard one. Add a custom compatible that
> >> supports the 6 interrupt configuration which falls back to the standard
> >> binding which is currently the one in use in the devicetree entry.
> >
> > But it works with only 1 interrupt?
>
> Seemingly...

The Linux driver uses the only first interrupt.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
