Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E21D3229
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B006589F89;
	Thu, 14 May 2020 14:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2F89F89
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:08:12 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l19so3638877lje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
 b=Dj7/g773oDlRsTiNUR7xo2qlLm/wu1orsMurVYbTiR6KmugblKgadVSe7mPERK4aCL
 vEPNEYTpo0FsOvkLTFcAR67KlJyF7Lm0tYMvWEFjNfuewnDqxPfak/mLCAwyBwyRj2ir
 q0by15fYjqzhJnUNE1ONVJGr3vLUxaVTcB05C/nT5aCMA95AP0XrrQXYs66hWza3MVLf
 R+msddyOYrqaHHXoL1h2Zg7FvdZ9e0msvkVGT4lgti3NVlNIlsRBi9Wq6iHo7+nPlyp+
 J4SOOLifvlUKFSIzHAfmGa1qomnjT8z0ZSZ1URkY4VQZLOT1r8zjI6FEv5Gh00Bgxe6d
 cS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
 b=RP05vAMueVFyD2/hG7ZEQjn0RQwOuP4ID0ghvLHK3xy/oWCwlOTt7+lpIeVLsxMY2u
 B3bMxzdNHVHBufqBCVcd0NdY8noAp3l3yrvwLjscx4EBmXX6cmT4S4gZ/XB/5QacY/TY
 hukEVxq+arMtWu1hwvsZgQn4XL4kN0PdkTQa85jgYRncgOUogZsbVKUIrByHgJKA4dFC
 MD7EBybKN1zD4U2R+hdwQY5rY0oprTflKXwhwk7d70mtTHBgTtvqYYwVQYwrIEtx3MTG
 9Uv81cCrCe5IZCm+0doKP6nAepWGluqM9IGN5ir8uW4mpWoFMtZWaSdS5iTKwFgl4veA
 5PXg==
X-Gm-Message-State: AOAM532kYTShfsWXbM1q8qoY/aqwZrcSXWzfy/LzBs3VG7jfxMzAK2Pd
 DTlI51twHTqjh6F/rmWzdeT/eghNrt+ZbsHGQZWMSw==
X-Google-Smtp-Source: ABdhPJx5t1yZM5yB0Se02KNKlQ3Kf5olZkwfnoQ7/EcJOQjcx6eZpQDoXhQSKSv4wdy91TSKQPnH1L4MsQ9yfH5F0tc=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr2030382ljb.168.1589465290360; 
 Thu, 14 May 2020 07:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com>
 <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
In-Reply-To: <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 16:07:57 +0200
Message-ID: <CACRpkdbcD7i+kNoJ9YP5XXTtLi12=yzW5OBNzet5oRdwPYz=dA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/panel: Add ilitek ili9341 driver
To: dillon min <dillon.minfei@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 12:22 PM dillon min <dillon.minfei@gmail.com> wrote:

> > > +       /* Gamma */
> > > +       mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
> > > +       mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> > > +       mipi_dbi_command(dbi, ILI9341_PGAMMA,
> > > +                        0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
> > > +                        0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
> > > +       mipi_dbi_command(dbi, ILI9341_NGAMMA,
> > > +                        0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
> > > +                        0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
> >
> > It seems to be copies of the stuff above, but why is there a different
> > gamma if you use DBI?

> for dbi interface, currently i just copy the code from tiny/ili9341.c.
> as so many boards use this driver now, like raspberry pi, etc
> i'm afraid it's will not work after modification. so, just leave the
> original code there.

OK if you move it to ili9341_config it will be clear which panels
need this gamma and which panels need another gamma.

I think there should be one ili9341_config for the new st,*
variant and one for the old DBI variant.

> anther question:
> is there any panel driver have dbi & dpi or dpi & dsi supported? which
> i mean support
> two different panel interface in one driver.
> thanks

Usually you split the driver in three files becuase a driver can
only list one initcall, and also it makes it modularized.

There is nothing in-tree but look at my branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/log/?h=ux500-skomer-v5.7-rc1

You see how I split up the s6e63m0 driver in one SPI part
and one DSI part:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=6c0e1fb5df5fa8fa857dee65f6c0f54d06d158a7
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=cfbf562cc709b53b62f5fbc7fedf176ffa17b088

The overall idea should work the same with DBI.

Yours,
Linus Walleij

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
