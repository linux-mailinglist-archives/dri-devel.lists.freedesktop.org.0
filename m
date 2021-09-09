Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC5405EA4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEB56E92F;
	Thu,  9 Sep 2021 21:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915D6E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:14:43 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s16so3408167ilo.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLZSZYIwz1ps13bllE/o8ZftzcSljG2It1aK1Q5Nz8I=;
 b=HO9YtQ6MlJn7+IDzJn7EdvK39R44d47kXV2OtfDfuDavIeSBisnixpV/pJ5OUPA1Cw
 KuK2YPHieOQeeEM50Mitcyt3MN1e54I0TivXX6ogT9xokBZ8ER5jwGiuqw5RqAR+Vxtd
 oIW3N48LLG7r//8yaMeDC5lgT3fSeKsKF4h/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLZSZYIwz1ps13bllE/o8ZftzcSljG2It1aK1Q5Nz8I=;
 b=rp8h+MJXTM50NRLSXICIN19vg+JAUjNmDVS+KjWh8DzwVZXEsg8NI66FsL0CLvnk4k
 00NQRw/pMEIBeGkgQvy3ukHixZ3HRw5tYYQZtTsIZIhBkWgPAjp7mcV51uYBYg2AdmBW
 q36UTxHQmhqH67dIapcluIl2181xNy8FUFTPNmdZHsV7oOD+9Thx+Olb6M919rakrUaW
 qNUBthS5jbDiIEpTdrwayBfKuqyvBeiQPAp4b5/S57rmimnZ8EogKIMAzcQbjU75TzeZ
 2J6TFlrCfCsDwdvjh6MLGzWPTSfZ5o/ZwqsTdSJ8oa11HNpSwXyboaCflgkC8xAOvThV
 GCpg==
X-Gm-Message-State: AOAM531raGH0vGqGrHTpsEl9mS8KxU3cxonGyt0Acst+7ZSlPL56OCM+
 D16zFSDP4pluKmMnG343Wl8ThMDzMNinwQ==
X-Google-Smtp-Source: ABdhPJyjmE+cnRB0RlXLPseV7dXe536wLU2OvfPWy5C4X21P5gSAj+mYfBJlvF+Guglzhob8hnIQQQ==
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr3689321ilq.220.1631222082615; 
 Thu, 09 Sep 2021 14:14:42 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id s5sm1476186iol.33.2021.09.09.14.14.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 14:14:41 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id q14so3416519ils.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:14:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:: with SMTP id
 d14mr3552572ilv.142.1631222081152; 
 Thu, 09 Sep 2021 14:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
 <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
 <CAE-0n51GPe4aWqmbm4htArS716dKhYPPV2KbKtk-d6MsUe8UpA@mail.gmail.com>
In-Reply-To: <CAE-0n51GPe4aWqmbm4htArS716dKhYPPV2KbKtk-d6MsUe8UpA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Sep 2021 14:14:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uzy5vagh2G4pbqpSgVVjaGoswiH=udBH5RVZ96cNu=eQ@mail.gmail.com>
Message-ID: <CAD=FV=Uzy5vagh2G4pbqpSgVVjaGoswiH=udBH5RVZ96cNu=eQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Stephen Boyd <swboyd@chromium.org>
Cc: Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 9, 2021 at 12:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-09 11:29:19)
> > Hi,
> >
> > On Wed, Sep 8, 2021 at 2:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Philip Chen (2021-09-08 11:18:05)
> > > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > index 685e9c38b2db..a16725dbf912 100644
> > > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > @@ -64,12 +65,29 @@ struct ps8640 {
> > > >         struct drm_bridge *panel_bridge;
> > > >         struct mipi_dsi_device *dsi;
> > > >         struct i2c_client *page[MAX_DEVS];
> > > > +       struct regmap   *regmap[MAX_DEVS];
> > > >         struct regulator_bulk_data supplies[2];
> > > >         struct gpio_desc *gpio_reset;
> > > >         struct gpio_desc *gpio_powerdown;
> > > >         bool powered;
> > > >  };
> > > >
> > > > +static const struct regmap_range ps8640_volatile_ranges[] = {
> > > > +       { .range_min = 0, .range_max = 0xff },
> > >
> > > Is the plan to fill this out later or is 0xff the max register? If it's
> > > the latter then I think adding the max register to regmap_config is
> > > simpler.
> > It's the former.
> > The real accessible register range is different per page, E.g.:
> > - For page0, the register range is 0x00 - 0xbf.
> > - For page1, the register range is 0x00 - 0xff.
> > - For page2, the register range is 0x80 - 0xff.
>
> Oh does this have register pages? regmap has support for pages where you
> write some indirection register and then access the same i2c address for
> the next page. This looks different though and has a different i2c
> address for each page?

I haven't looked in tons of detail, but I think the right solution
here is a separate regmap config per page.

-Doug
