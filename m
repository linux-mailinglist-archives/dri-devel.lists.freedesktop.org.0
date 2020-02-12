Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C415AF84
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25716EADB;
	Wed, 12 Feb 2020 18:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790B6EADB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:14:21 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2005D2173E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581531261;
 bh=XPutHtfrd9L6DCjKR/i4gzTwtBJqO9VVCF2dsQMhOT0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H0t1S9X9r5QrGUd7DvAOuSUSqqXDsgdC1XTVAcFbzj4EY2h/S8r/mWZNvB10mdCQa
 38EaQisKKJidSQ7TOlCXmLvne+3QnPgrSM7v03v8XngdUW7peGivsjAvtTOAtfr4CA
 wewf/BxAmAKE916HXnBmP76nvVhL3jH9qCPQp3LY=
Received: by mail-qv1-f43.google.com with SMTP id z3so1369359qvn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 10:14:21 -0800 (PST)
X-Gm-Message-State: APjAAAWvNo4lADQ8CQab10dohD2BcZHMaCwqsCowBNbMceNMKsZaIG5D
 mvmp0BGbbUM/vtK3iECSAuaKcfPShMbuegLrDw==
X-Google-Smtp-Source: APXvYqwYf7OiqvLmE/STxKkwBxfQm+rxJyw5z6FFooFuohKsTmQUlxLvZAqUvV1R4jPQEGjoiAS5DvHkVqtRkL1b//c=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr8482894qvv.85.1581531260167; 
 Wed, 12 Feb 2020 10:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
In-Reply-To: <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Feb 2020 12:14:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
Message-ID: <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Nicolas Boichat <drinkcat@chromium.org>
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

On Wed, Feb 12, 2020 at 2:49 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> +Viresh Kumar +Stephen Boyd for clock advice.
>
> On Fri, Feb 7, 2020 at 1:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
> > devfreq, and provides OPP table with 2 sets of voltages.
> >
> > TODO: This is incomplete as we'll need add support for setting
> > a pair of voltages as well.
>
> So all we need for this to work (at least apparently, that is, I can
> change frequency) is this:
> https://lore.kernel.org/patchwork/patch/1192945/
> (ah well, Viresh just replied, so, probably not, I'll check that out
> and use the correct API)
>
> But then there's a slight problem: panfrost_devfreq uses a bunch of
> clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
> never fully precise, so we get back 299999955 for 300 Mhz and
> 799999878 for 800 Mhz. That means that the kernel is unable to keep
> devfreq stats as neither of these values are in the table:
> [ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
> information.
> The kbase driver fixes this by remembering the last set frequency, and
> reporting that to devfreq. Should we do that as well or is there a
> better fix?
>
> Another thing that I'm not implementing is the dance that Mediatek
> does in their kbase driver when changing the clock (described in patch
> 2/7):
> ""
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> ""
> Is there a clean/simple way to implement this in the clock
> framework/device tree? Or should we implement something in the
> panfrost driver?

Putting parent clocks into 'clocks' for a device is a pretty common
abuse. The 'assigned-clocks' binding is what's used for parent clock
setup. Not sure that's going to help here though. Is this dance
because the parent clock frequency can't be changed cleanly? If up to
me, I'd put that dance in the clock driver. The GPU shouldn't have to
care.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
