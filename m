Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF951ED4DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 19:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F9989D8D;
	Wed,  3 Jun 2020 17:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8289D8D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 17:19:14 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id c1so1829156vsc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ff63mj6a29+ItWvrgCDVujeIfevYiCvvZYeCkBG8APA=;
 b=hpBNNn1RGbO+Ln98NFNNziez0y6q3GCACz4BwjSNi8QwbeRM3auXfUZ4PuBndmZMtR
 FwIoedrazWPNVVqcbQPZhmLGZQVMTTWOoa55G/+gxZQt0Gw2sLN7pkPW7liiOT7eVcGg
 jKksksB+KgJN2RjOFuyCOxF/Er9jeWnc3vproVfrCmBFdG+vpiy4KoBeVdCXfIbu2efx
 yYxFwZC1Hn1dv4Xca11Ch3eLZr+04Z/VkhXDmGLwoxgB1PWeESdHlI5okC5dM1pVWFbV
 YxBEKmQbo0WHS+O4BHk7ib5LH/bmvCV0KdJLK7lZByXS7k6bjf9pXFEYz99C9UOhCV8q
 HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ff63mj6a29+ItWvrgCDVujeIfevYiCvvZYeCkBG8APA=;
 b=VqAkb9WJJTMj7Afv8a0VT+9aStuWIWpdVNTSlxTEcjU2Sw5RD/qBrus/6p9oQOWUvZ
 /rZCNvUZJDNPpRx8bu5mqix4H4i11xMLUTPbQVSGE/N9DlPTgAsiuzPnAywxzwaWrINy
 Z9moaTNGv9Ug1yNbYqSATHHfT1rWWcbZN7+drv+wZ++AmOEtolcsL6GrpLmV0ZkAUYUe
 pYxtkaZiXFPEeZnrOaA0W+6jqilFo/QMCiQJ82XHQ5U6tO7QfpQm9HYdUBLsQgg2TFpV
 xESmzBeCtwzbLH4HbRcmWOYf+eYTS95Vn3Jj7GTLQz01bZ0x37wuuQnEBtPluSknXZLD
 HQow==
X-Gm-Message-State: AOAM5338GfihLp0rSIkyqGIoS4Yhnh+a666gct69a8nDZMcqBtXQ4Z7H
 j91+N9H68q7odVL1FBd1h6ZGpvZgswKZkuz2b2A=
X-Google-Smtp-Source: ABdhPJxTyGYAvsmDCB5KurPMSwg0CppmfkQMT2uh74r/zjyku5qzVF+XDYaVbwmJEFDJsmAhMbKuIRsrwLfXhJH+rwc=
X-Received: by 2002:a05:6102:22ec:: with SMTP id
 b12mr398177vsh.138.1591204753050; 
 Wed, 03 Jun 2020 10:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
 <20200602205653.GC56418@ravnborg.org>
In-Reply-To: <20200602205653.GC56418@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jun 2020 18:15:51 +0100
Message-ID: <CACvgo52fdrjp_-Q-mB1AYtNuKcQ722mvTOFsjWaXc139rjD58Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA
 panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Liu Ying <victor.liu@nxp.com>, devicetree <devicetree@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020 at 21:57, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
>
> On Tue, Jun 02, 2020 at 01:46:19PM +0100, Emil Velikov wrote:
> > On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > This patch adds support for Kaohsiung Opto-Electronics Inc.
> > > 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> > > The panel has dual LVDS channels.
> > >
> > > My panel is manufactured by US Micro Products(USMP).  There is a tag at
> > > the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> > > and it's made by KOE in Taiwan.
> > >
> > > The panel spec from USMP can be found at:
> > > https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> > >
> > > The below panel spec from KOE is basically the same to the one from USMP.
> > > However, the panel type 'TX26D202VM0BAA' is a little bit different.
> > > It looks that the two types of panel are compatible with each other.
> > > http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> > >
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index b6ecd15..7c222ec 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
> > >         },
> > >  };
> > >
> > > +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> > > +       .pixelclock = { 151820000, 156720000, 159780000 },
> > > +       .hactive = { 1920, 1920, 1920 },
> > > +       .hfront_porch = { 105, 130, 142 },
> > > +       .hback_porch = { 45, 70, 82 },
> > > +       .hsync_len = { 30, 30, 30 },
> > > +       .vactive = { 1200, 1200, 1200},
> > > +       .vfront_porch = { 3, 5, 10 },
> > > +       .vback_porch = { 2, 5, 10 },
> > > +       .vsync_len = { 5, 5, 5 },
> > > +};
> > > +
> > > +static const struct panel_desc koe_tx26d202vm0bwa = {
> > > +       .timings = &koe_tx26d202vm0bwa_timing,
> > > +       .num_timings = 1,
> > > +       .bpc = 8,
> > > +       .size = {
> > > +               .width = 217,
> > > +               .height = 136,
> > > +       },
> > > +       .delay = {
> > > +               .prepare = 1000,
> > > +               .enable = 1000,
> > > +               .unprepare = 1000,
> > > +               .disable = 1000,
> > Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
> > the series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > Sam, Thierry I assume you'll merge the series. Let me know if I should
> > pick it up.
> I am quite busy with non-linux stuff these days so fine if you can pick
> them up. I like that simple panel patches are processed fast.
>
> I expect to have some hours for linux work friday or saturday, but no
> promises...
>
Don't worry - once the DT maintainers ack 1/2, I'll merge the series.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
