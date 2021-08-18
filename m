Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D53F08D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37406E84E;
	Wed, 18 Aug 2021 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242B56E84E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 16:15:27 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id i21so2636802pfd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fou5W5VkNbeojY0yT6dY7k2y4ndU7zMQiVWUILWOmhw=;
 b=NrjlawxUIhVfs1YgkMgTNaXijzUTHfc/+2IlHL5a4sQFv3OYE5/x6tDcmJCLxkReRA
 1VvWT0fXdyd9ZwuoOkcLJYgzIUVSg4m8gNfkOCvRLH1BByGXepKRZuLV0W8rho220hZT
 Lcek/Yoer9DeC2s4LX+bZhfj568ShUsIiR7P62bTyMI/9rQZIkX6CyEZGUD9w0JTrSmj
 7PrcJILjEL7kIMLB4Sd0znQSSA+SGZmyvpLT4GKZTwxmH/8i37LuDghlIMklWu6BKcnY
 wGeeyMXBsoT2OKpldWCHaizkohBK0uGmh3OmXjSB/IPUsE42smvqu1hCvTTqYmd/jFLg
 fEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fou5W5VkNbeojY0yT6dY7k2y4ndU7zMQiVWUILWOmhw=;
 b=nhLx3THpTqCPrwBB2d2SjaZK4s3/UukDM0oMht8QNRDwZ0YwV/0nnx4Lb+vxOFu5Xj
 b1MHkHoIN7P1zWbL9NP5pQ8NIqk+o6djFXU0fLESUlqQtAxVc5MCBn34BOGYH39ayM2a
 BlChpsMTQ8XKHM4oomGvO96khIySYPOyxgp85wJa5fXXL2W/Z2lsEdpalcHViY2RDiYz
 3rrlYdWZCLUYd5a0lITO/1MtFNyHWf2wgH6XJiBSwN/4vQObQW+rm4fWrXjKXIt7kHML
 k18bkcb4OhUikjBvIe4BML2dcBI8Inh3yxZm1lBuzKHBo7e6Ppuf8se35Qtc7JE47yUu
 CC9w==
X-Gm-Message-State: AOAM530hRyUohJVkZO23/g+dfyViiRF/qcKxyVxVFUyZ4Afp+YWcy4z/
 wZzb+/QeHwxj2y5gjItwfU58J4E+1nhH6Z3IyqRU0Q==
X-Google-Smtp-Source: ABdhPJxQOkgSduv2w4asHeJEz2hvMWg61KbgWeOVpPnbQEzpqYnUiAjZcsKLoiwKiGQDyONVlICJCr7vo6mMQMN3ZPU=
X-Received: by 2002:a65:5ac8:: with SMTP id d8mr9525008pgt.34.1629303326679;
 Wed, 18 Aug 2021 09:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210816111451.1180895-1-robert.foss@linaro.org>
 <YRqKRu6UVNy8OZh1@ravnborg.org>
In-Reply-To: <YRqKRu6UVNy8OZh1@ravnborg.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 18 Aug 2021 18:15:15 +0200
Message-ID: <CAG3jFyudSGJ3+HqgEF6i2XpcfZGVwy3V8GuepUY2+0pc7VSZOQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: anx7625: Don't store unread return value
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>, 
 Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
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

Hey Sam,

> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 14d73fb1dd15b..3471785915c45 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -771,7 +771,7 @@ static int segments_edid_read(struct anx7625_data *ctx,
> >               ret = sp_tx_aux_rd(ctx, 0xf1);
> >
> >               if (ret) {
> > -                     ret = sp_tx_rst_aux(ctx);
> > +                     sp_tx_rst_aux(ctx);
> >                       DRM_DEV_ERROR(dev, "segment read fail, reset!\n");
> >               } else {
> >                       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
>
> From a quick look this seems to be the wrong fix.
> Replace return 0; with return ret; as the last line in this function
> looks like the correct fix to me.
> With a careful audit that the error handling is OK in said function.

Thanks for the suggestion, let me have a second look at it.

>
>         Sam
