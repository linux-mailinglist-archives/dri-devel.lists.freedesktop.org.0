Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3946A19769F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 10:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2776E03E;
	Mon, 30 Mar 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E826E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:38:27 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 02U8bmMi029168
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 17:37:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02U8bmMi029168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585557471;
 bh=PxRmu3HuDIYTqEJxiJ5PqE2LXmQuo3D9zlavzY5jVI4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kLE50GQxM0ehYAQCUjyN7JnBCh28JOdGWNI9ENg3nr5BXVs5SlnkHf7EW62rbT6nL
 kK79RhCKNwIKkilwARlkggHjJiqHO2Pq/yYcwZiIv/gGJgOcsjvcVkV+uLGZUcdMyr
 9kelkxTXXEtNq/uJlWxcuBCVeD7j+lw3mF5k1R0HbdSQr5z/Ck2bf91oD0XfoPCXkS
 BzStQKZuyAQUh5G6olgXbneopJW478JGYWNELRuLRNHdYvts8uEYxPB4HfTwN+PKcq
 IcahGLbMjTA17t64acGe8xV/4YoTZFEc+E2akbxUqUjP0j1961ofZ2Z7FRMPjwbS3n
 PFJnhu+AbeOww==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id a6so5975745uao.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:37:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuYg8sCEXd+LFjnwcofbFFdOdnOsPIGz76PLLrmnONCX55HGXvNP
 ZK6kQjospxosBVMtazKfF3uXlba2Wf+nxCjNOo8=
X-Google-Smtp-Source: APiQypJeTOypTow5s/orWLiqA+luxDBNhpwR1xE86uZ7tA8NnJnWdBsJgIswlbl89EaZoapGrF/J2WDHqcRU1fH6V1M=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr6911883uad.25.1585557468135; 
 Mon, 30 Mar 2020 01:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
 <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
In-Reply-To: <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 17:37:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXj3=1VPWL4kFmGkZuvV=yKb7gVaX2nbeiO54f-zWeHQ@mail.gmail.com>
Message-ID: <CAK7LNARXj3=1VPWL4kFmGkZuvV=yKb7gVaX2nbeiO54f-zWeHQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
To: Rob Herring <robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Linux PM mailing list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Networking <netdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Mar 30, 2020 at 4:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Mar 26, 2020 at 7:06 AM Rob Herring <robh@kernel.org> wrote:
> >
> > Setting 'additionalProperties: false' is frequently omitted, but is
> > important in order to check that there aren't extra undocumented
> > properties in a binding.
> >
> > Ideally, we'd just add this automatically and make this the default, but
> > there's some cases where it doesn't work. For example, if a common
> > schema is referenced, then properties in the common schema aren't part
> > of what's considered for 'additionalProperties'. Also, sometimes there
> > are bus specific properties such as 'spi-max-frequency' that go into
> > bus child nodes, but aren't defined in the child node's schema.
> >
> > So let's stick with the json-schema defined default and add
> > 'additionalProperties: false' where needed. This will be a continual
> > review comment and game of wack-a-mole.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
>
> >  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 2 ++
>
>
> You may have already queue this up, but just in case.
>
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



I take back Ack for socionext,uniphier-gpio.yaml



Now "make dt_binding_check" produces a new warning.

gpio@55000000: 'interrupt-parent' does not match any of the regexes:
'pinctrl-[0-9]+'


This binding uses 'interrupt-parent'
without 'interrupts'.

Instead, the mapping of the interrupt numbers
is specified by the vendor-specific property
socionext,interrupt-ranges



I cannot add   "interrupt-parent: true" because
dt-schema/meta-schemas/interrupts.yaml
has "interrupt-parent: false".


Is there any solution?



-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
