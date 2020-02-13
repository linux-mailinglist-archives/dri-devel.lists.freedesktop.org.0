Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6515BA5B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 08:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FEB6E186;
	Thu, 13 Feb 2020 07:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786F6E186
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 07:58:04 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z19so4815980qkj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 23:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=63SchGggoiyVI5EN3ryL83QTa83h0sF68yqzlCCOYPA=;
 b=dKMEN31/0+UPjXjjiovyaJUVBlun8Po5VfH13AHcZMUXJDuSs1EI8nWJXKA7w7uhm7
 ZFZz9QipKQ788oZVIHCnev3yFTRL7P+gk1Dj0VbcEMXdofR1rbh4c1ZuIizRumh9PFo7
 XasDtmmhv2Ji6x1dAjrj+mXlEzg1Y9xWMKswM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=63SchGggoiyVI5EN3ryL83QTa83h0sF68yqzlCCOYPA=;
 b=gAvUAwYAh8CsV1KA92dWoV8LD34O7NbvQlHsIQ5wjpzwF7xrQ3eT/8gx3EW9fvxnhw
 FZd/IK+VX0YebIUVK1fLxUhTWjm/gAHXncRbDvz1px9dFgbO1VWW839lXgX0pzCczM5r
 v4lE/RtHsdUY9pyv0Z4XorQY+1+4cGqwck5m3nIMxf7Ml6JAncG9p4Yx679b2Yhi6TRe
 28lNKBd/7Dy0OU8TWPiqto8i8maR6TF5ul3iDQOAYEbu8TZTBMnn3V1loPN4a9IOIZ34
 lH3aL/uzUIqCkWm2JM103s1zWwhocfRDqy5pYjJt0zenammTSGB6dkyc9gxkgVoWABBA
 iKJg==
X-Gm-Message-State: APjAAAU6HKPHK7Qsx/srBSIRCfquzCQZTdzSWJ7MX1+1pr1uPuc4bj76
 5dS9I24tnJ9Wdt18H6Wrr+hE144bmWUQZjAt8aqnTQ==
X-Google-Smtp-Source: APXvYqxdfgmZS7tZ6HGaEuN1SVX0b/SGRzgpoe8N6khQQjmKFbfTE+Cbo3vlrlKewIFqbPKGpw+YYWx3Re780dY9rnc=
X-Received: by 2002:a37:6595:: with SMTP id
 z143mr11648233qkb.457.1581580683445; 
 Wed, 12 Feb 2020 23:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
 <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
In-Reply-To: <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 13 Feb 2020 15:57:52 +0800
Message-ID: <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Rob Herring <robh+dt@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Nick Fan <nick.fan@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Weiyi Lu +Nick Fan @MTK who may have more ideas.

On Thu, Feb 13, 2020 at 2:14 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Feb 12, 2020 at 2:49 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > +Viresh Kumar +Stephen Boyd for clock advice.
> >
> > On Fri, Feb 7, 2020 at 1:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
> > > devfreq, and provides OPP table with 2 sets of voltages.
> > >
> > > TODO: This is incomplete as we'll need add support for setting
> > > a pair of voltages as well.
> >
> > So all we need for this to work (at least apparently, that is, I can
> > change frequency) is this:
> > https://lore.kernel.org/patchwork/patch/1192945/
> > (ah well, Viresh just replied, so, probably not, I'll check that out
> > and use the correct API)
> >
> > But then there's a slight problem: panfrost_devfreq uses a bunch of
> > clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
> > never fully precise, so we get back 299999955 for 300 Mhz and
> > 799999878 for 800 Mhz. That means that the kernel is unable to keep
> > devfreq stats as neither of these values are in the table:
> > [ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
> > information.
> > The kbase driver fixes this by remembering the last set frequency, and
> > reporting that to devfreq. Should we do that as well or is there a
> > better fix?
> >
> > Another thing that I'm not implementing is the dance that Mediatek
> > does in their kbase driver when changing the clock (described in patch
> > 2/7):
> > ""
> > The binding we use with out-of-tree Mali drivers includes more
> > clocks, this is used for devfreq: the out-of-tree driver switches
> > clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> > switches clk_mux back to clk_main_parent:
> > (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> > clocks =
> >         <&topckgen CLK_TOP_MFGPLL_CK>,
> >         <&topckgen CLK_TOP_MUX_MFG>,
> >         <&clk26m>,
> >         <&mfgcfg CLK_MFG_BG3D>;
> > clock-names =
> >         "clk_main_parent",
> >         "clk_mux",
> >         "clk_sub_parent",
> >         "subsys_mfg_cg";
> > ""
> > Is there a clean/simple way to implement this in the clock
> > framework/device tree? Or should we implement something in the
> > panfrost driver?
>
> Putting parent clocks into 'clocks' for a device is a pretty common
> abuse. The 'assigned-clocks' binding is what's used for parent clock
> setup. Not sure that's going to help here though. Is this dance
> because the parent clock frequency can't be changed cleanly?

Nick/Weiyi, any idea why we do that dance in the first place? (maybe
the PLL clock is unstable while it's being changed?)

If we really need it, can we move that logic to the clock core?

> If up to
> me, I'd put that dance in the clock driver. The GPU shouldn't have to
> care.
>
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
