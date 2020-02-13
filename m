Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813915BAB9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D406F563;
	Thu, 13 Feb 2020 08:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97A6F563
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 08:25:11 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id o28so3517956qkj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 00:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OK0wietKvUZvwARAxmAdcE7mqGpP2688mkrFendJI3c=;
 b=mpc0JeM0+dOlAf+F/vCTYHoR+PUYA7VQeKJNhPzJStLAgkkRV03DFL99y9egz3e68P
 lPCoDzkpJvdoyiVMw6PB/Dlh0Xa4d+vZUYPZE19Q2YMPwFx6GqbOhqUZsM2yIvmMYB4C
 9GRN7zW46xO+BvOUOoI84rF0S+e8+9ZGjjrVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OK0wietKvUZvwARAxmAdcE7mqGpP2688mkrFendJI3c=;
 b=USLJkA3Ye/zeoY/GW5tF/vjaTsbBLZoR7zf420ZH8BbPAlH4S2ng60gko7Rsl1hdxF
 J8aooxUFMkW4m5V4RcT+IxNBZmJQeQ6UFtfsjA4YrUbV8kXnjDzmuLpYzYfjvsujpOsL
 kEA55kEjwQ2G6JtYJmxGiTwNfFGfNXMb3sLOR/GCOtoHXaJPni43AaJvNwtAf4pxSKaV
 Ut38dJ6bKu6JGqmqi7LJ0xIH+HLJnnj47GpFjrhuWwZcTWFM/Vm5wE92UvKo9n4bhIn6
 KUuS8bGN4iq0oshUa7t2gS8GreYhTlYEZm5EC9GWY2141blip+kU+c3R/1cyVRDyJ1Va
 HR5g==
X-Gm-Message-State: APjAAAUevtvLstRHzCAvyIYlVWCHDbJSLfgreyrtAxBsIRhC5cIagSob
 8jopjZXfFLnzG6+NpHnW1T0kGiw9ASvcRSKG/f/myw==
X-Google-Smtp-Source: APXvYqz2tNr3c3qIVwpXL0Kiwvf19NSiJuWwJpM0OOB3yzEmPzpmBZQIrLG8zON5DYMYRdtNFRQMdyhNLsgoU/FJ9vY=
X-Received: by 2002:a37:6595:: with SMTP id
 z143mr11724807qkb.457.1581582310226; 
 Thu, 13 Feb 2020 00:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
 <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
 <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
In-Reply-To: <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 13 Feb 2020 16:24:59 +0800
Message-ID: <CANMq1KCD-Ut3bjEmtpPCgOf+KHyi9cw7QSsxcQrWU4h2juZCUQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Rob Herring <robh+dt@kernel.org>
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

On Thu, Feb 13, 2020 at 3:57 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > [snip]
> > > But then there's a slight problem: panfrost_devfreq uses a bunch of
> > > clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
> > > never fully precise, so we get back 299999955 for 300 Mhz and
> > > 799999878 for 800 Mhz. That means that the kernel is unable to keep
> > > devfreq stats as neither of these values are in the table:
> > > [ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
> > > information.
> > > The kbase driver fixes this by remembering the last set frequency, and
> > > reporting that to devfreq. Should we do that as well or is there a
> > > better fix?

This one is my bad, I was missing this patch in my forklift to 4.19:
22bd4df9dadf46f drm/panfrost: devfreq: Round frequencies to OPPs

(should really try to boot that board on linux-next, but that's for
another time)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
