Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB5310818
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4466F382;
	Fri,  5 Feb 2021 09:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACACA6F382
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:43:25 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id o63so4155992pgo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqJqQl1xSKavN+wug0hZ0iZc5i9bwB3JAakaDPcsm9k=;
 b=XC2yhAyepEIPdSWE2JxIt4ZGw87uQrdwLP8NeaGMO5mX/WpdJUWa6sD99Vrk6phbGS
 3K459KZwzP0oMf4STCMaFC7U+M7tbH9p1YZLq9k79DyGkTKC8tj1mMvKi9t03tuD3MjS
 J5Rt4IjddHqU09Qu/stJrezWoMk68xnRPnKYi4FOtCV/NHO7ZOJM6eE8W9ly/dxahTQv
 I27QWH/L0CCsXWOq2802VE0wWECAUCbRZqV+tQ9oBEPEEDeILYKSGIfPdeJrV2dyHsmn
 LmUNqezFR3aqybKv4qExPnXb+J/zzoVZ0Z3BDcawpV4AsCZKKRmc8V89i8+997nzRnVO
 B4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqJqQl1xSKavN+wug0hZ0iZc5i9bwB3JAakaDPcsm9k=;
 b=j4gSfJrc1lFQntoXdkrqxaMr01mw2c8RWWUeAqhIAZrJ5qTi/2uMZW5qA3nHSEBeyk
 By2QQUTlL1y/JoidDIKHFWySQS5vyhT4ctAT3l/9XivjPzaA4Zlu1dmDXmuwlqnZ/2T5
 PprnKNrYd7nURtMhAUUi/GuhoV0/cMmx/mY+g7I3P3R62NOgiyrfngad9WBGju87NIJ/
 LxiX3xPg9hvk25Qmjn5dxw3Wb1Yc6M/u9aDtnL7JrksNSxb01ZmbT4TB1ujltZh+W8nQ
 GI5ovRclx5LrFZlgbW6Nf6BHGMAocBsn56f7llfOT2i3DCd1vL7PhZ59U975BhOSSTWH
 E/qg==
X-Gm-Message-State: AOAM533adq+XfaWK3ks8BM9lDTV4bxpZlQBXz7BgrUzJ34mKNqbmASN/
 WE1UcUWVeEmtSW9I70p9/VBTa9Rwjq4HmM3I6Wz0xA==
X-Google-Smtp-Source: ABdhPJyT4HMsF2dGuzPGOpl0Fmmj/5h+d6AATcrI1yEQ9m4uXBupaw+02kQjwB+emw72k0yf/4XBLFESW2s0tB5X0S0=
X-Received: by 2002:a65:654e:: with SMTP id a14mr3609659pgw.265.1612518205362; 
 Fri, 05 Feb 2021 01:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20210128111549.GA8174@zhaomy-pc>
 <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
 <CGME20210204123452eucas1p1eb8fd9dc5b62b036ebd9e9208e796cb9@eucas1p1.samsung.com>
 <CANMq1KAuUTqgM2mDR5WN6Ad+cATFXLPE+5rstyhfNE9Lc716+g@mail.gmail.com>
 <b680fef2-7c8a-183b-443a-6b2b9fe595d7@samsung.com>
 <CANMq1KAVMhFAdy_s4R-h1yzNWXRgWgZ4s9kQL11LDze3+Qv5_w@mail.gmail.com>
In-Reply-To: <CANMq1KAVMhFAdy_s4R-h1yzNWXRgWgZ4s9kQL11LDze3+Qv5_w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Feb 2021 10:43:14 +0100
Message-ID: <CAG3jFyu4JvH7iDriQWdwgkVaHH=vjGaVwF3P7DWLRbb19pKxsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Feb 2021 at 23:25, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Thu, Feb 4, 2021 at 8:59 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >
> >
> > W dniu 04.02.2021 o 13:34, Nicolas Boichat pisze:
> > > On Thu, Feb 4, 2021 at 8:07 PM Robert Foss <robert.foss@linaro.org> wrote:
> > >> Hi Xin,
> > >>
> > >> Thanks for the patch.
> > >>
> > >> On Thu, 28 Jan 2021 at 12:17, Xin Ji <xji@analogixsemi.com> wrote:
> > >>> Enable DSI EOTP feature for fixing some panel screen constance
> > >>> shift issue.
> > >>> Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.

Does "constance shift" have a typo? Should it be "constant shift"?

With that sorted out feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

> > >> I don't think I quite understand how removing the
> > >> MIPI_DSI_MODE_EOT_PACKET flag will cause DSI EOTP to be enabled. Could
> > >> you extrapolate on this in the commit message?
> > > That confused me as well, but it turns out that's how the flag is defined:
> > > ```
> > > /* disable EoT packets in HS mode */
> > > #define MIPI_DSI_MODE_EOT_PACKET BIT(9)
> > > ```
> > > (https://protect2.fireeye.com/v1/url?k=5bd95ebd-044267fb-5bd8d5f2-0cc47a3003e8-ce9db8ea264d6901&q=1&e=900556dc-d199-4c18-9432-5c3465a98eae&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Finclude%2Fdrm%2Fdrm_mipi_dsi.h%23L129)
> > >
> > > I'm almost tempted to put together a mass patch to rename all of these flags...
> >
> >
> > Yes that would be good, many of these flags were just copy pasted from
> > some hw datasheet, without good analysis how to adapt them to the framework.
>
> I'll look into it (but that shouldn't block this patch).

Thanks for clearing this up Nicolas & Andrzej!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
