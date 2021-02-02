Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28330B6C7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 06:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5336E8BA;
	Tue,  2 Feb 2021 05:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5916E8BA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 05:00:51 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id u16so9357272qvo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 21:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYomAPedjY6Ut2v3tc/j2puk5V3ZM6HLs8QKOrL+71M=;
 b=K0AwAx2atHbBeE5ofba2lhncn83QsHYPwaAkVZOlBq7xJVuwO06nmam9D6p9PxK0Yc
 qHncTgbdEiV4b9ZbLbL1W6QNZK4POSfIgBGOjGZeBb5dopkHlxwOHW3e+9qr+VdgRSDq
 lMzTwDNhiCTs4QHjimAQkxgCJXkUf/1yzaLRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYomAPedjY6Ut2v3tc/j2puk5V3ZM6HLs8QKOrL+71M=;
 b=SGOwK2C8ngp/WBiMoOHihnKVOoAECQZnIGEHauBR/P/ElX5zfY0mCOA/LvG9o2qizs
 6jfpEVAQMgP+/I5FsyjOtINFgIruPYHFfcrc+vS/qMFkjrq+Ewp/XZQz1BdbkNvWr868
 f6v9XuHtLPL1yuE1vdq3oSvecdyuwiNRVaQjl2D0IUWxoQSCBFkw5Eexgd37AP/u0DAv
 hNDYPUzRK54dOMytzDk4j5yT6H/sovQ9/6C8LPxtJwgaFMDBFloeQmIWRNfLkx6MqtHa
 Q+xNliv2bvOmeRjfeXzdJpQHYfGiY+jZnEbyI8E7GbnBkG2KfmYMn+nuH3O3sPJjhjAN
 knpw==
X-Gm-Message-State: AOAM531dmqeYAckED4vxbvFQlasMhvr0B+R82Buccxaveox1IpQGzHhN
 pMqI3kuujy7xiBmLJPUWVE0bgx9tvLH0X2Ab+bQ=
X-Google-Smtp-Source: ABdhPJxhG22cfgTlPgd5Bmp+l5XMEO6iHO8wpVjtVf1lL25VaUDqwXCORBeaAJwrqwOO5B9JMa+bz8dKzG0wG9OGJQI=
X-Received: by 2002:a0c:a541:: with SMTP id y59mr18779062qvy.61.1612242050648; 
 Mon, 01 Feb 2021 21:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-3-joel@jms.id.au>
 <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
In-Reply-To: <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2021 05:00:38 +0000
Message-ID: <CACPK8Xes_Lch1W3NuqQ8HdPTrvJUamfQE9sf6dRcoat_UKohXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/aspeed: Use dt matching for default register
 values
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Feb 2021 at 04:46, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > There are minor differences in the values for the threshold value and
> > the scan line size between families of ASPEED SoC. Additionally the
> > SCU register for the output control differs between families.
> >
> > This adds device tree matching to parameterise these values, allowing
> > us to add support for the AST2400 now, and in the future the AST2600.
>
> Looks good to me. Two super minor things:
>
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> > @@ -60,7 +60,8 @@ static void aspeed_gfx_enable_controller(struct
> > aspeed_gfx *priv)
> >         u32 ctrl2 = readl(priv->base + CRT_CTRL2);
> >
> >         /* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
> > -       regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
> > +       regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), BIT(16));
>
> The comment references SCU2C; but you've implied that this will
> change...
>
> > @@ -228,7 +258,7 @@ static ssize_t dac_mux_store(struct device *dev,
> > struct device_attribute *attr,
> >         if (val > 3)
> >                 return -EINVAL;
> >
> > -       rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
> > +       rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
> >         if (rc < 0)
> >                 return 0;
> >
> > @@ -241,7 +271,7 @@ static ssize_t dac_mux_show(struct device *dev,
> > struct device_attribute *attr, c
> >         u32 reg;
> >         int rc;
> >
> > -       rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
> > +       rc = regmap_read(priv->scu, priv->dac_reg, &reg);
> >         if (rc)
> >                 return rc;
>
> You've removed the only uses of ASPEED_SCU_MISC_CTRL here, maybe drop
> the #define too?

Good idea. I'll implement both of your suggestions.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
