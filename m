Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503B1998B8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3DC6E146;
	Tue, 31 Mar 2020 14:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532D6E146
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:39:13 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9913F20784
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585665552;
 bh=VQTYjDLJpBPL64v+KHcwfSavLEUmQ5VPbYuKeDQvfh4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w9kKXD8z4sqI86PU33XbHmfq5R7o1rl1Yc6oUOAz42cwHppv6UAYyiBVNzHr/8rGq
 fiuijzJ4syHgX49+YFivKcsWhdJV6fv/bOG69I3vdo0Lq1npTDVuNQt+ItarZp4b9G
 a/bP28cpaoxY9yg7N1tSpyTZfOjD00o0nNDF4FO0=
Received: by mail-qk1-f174.google.com with SMTP id u4so23140115qkj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:39:12 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3dVDnJH4Ge9SnKqBcVCf7fJ3K4pOJFIZSJuPO65MWvOEtJbcKl
 mijhLfv1Z07UtztWCI9X+YDMEOLy4OtoO4ZZhQ==
X-Google-Smtp-Source: ADFU+vs96kIPVk/bUhQUvXuwHTzxBhEjf4smiGd+iZOn7jyc5rfIytLi140jinW+le6E+iSeEnGKe3qbfJEIB3it89g=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr4802134qke.119.1585665551704; 
 Tue, 31 Mar 2020 07:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
 <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
 <CAK7LNARXj3=1VPWL4kFmGkZuvV=yKb7gVaX2nbeiO54f-zWeHQ@mail.gmail.com>
In-Reply-To: <CAK7LNARXj3=1VPWL4kFmGkZuvV=yKb7gVaX2nbeiO54f-zWeHQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2020 08:39:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLDL6mVZ3Bb3f6eObF9SNwy6WK_srX5=m=NCN8Jq+-R+g@mail.gmail.com>
Message-ID: <CAL_JsqLDL6mVZ3Bb3f6eObF9SNwy6WK_srX5=m=NCN8Jq+-R+g@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
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
 Mark Brown <broonie@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
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

On Mon, Mar 30, 2020 at 2:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Mon, Mar 30, 2020 at 4:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Mar 26, 2020 at 7:06 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Setting 'additionalProperties: false' is frequently omitted, but is
> > > important in order to check that there aren't extra undocumented
> > > properties in a binding.
> > >
> > > Ideally, we'd just add this automatically and make this the default, but
> > > there's some cases where it doesn't work. For example, if a common
> > > schema is referenced, then properties in the common schema aren't part
> > > of what's considered for 'additionalProperties'. Also, sometimes there
> > > are bus specific properties such as 'spi-max-frequency' that go into
> > > bus child nodes, but aren't defined in the child node's schema.
> > >
> > > So let's stick with the json-schema defined default and add
> > > 'additionalProperties: false' where needed. This will be a continual
> > > review comment and game of wack-a-mole.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> >
> > >  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 2 ++
> >
> >
> > You may have already queue this up, but just in case.
> >
> > Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
>
> I take back Ack for socionext,uniphier-gpio.yaml
>
>
>
> Now "make dt_binding_check" produces a new warning.
>
> gpio@55000000: 'interrupt-parent' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>
>
> This binding uses 'interrupt-parent'
> without 'interrupts'.
>
> Instead, the mapping of the interrupt numbers
> is specified by the vendor-specific property
> socionext,interrupt-ranges
>
>
>
> I cannot add   "interrupt-parent: true" because
> dt-schema/meta-schemas/interrupts.yaml
> has "interrupt-parent: false".
>
>
> Is there any solution?

I'd meant to just drop socionext,uniphier-gpio.yaml.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
