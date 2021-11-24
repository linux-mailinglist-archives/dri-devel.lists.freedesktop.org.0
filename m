Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD145BDEF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FE46E328;
	Wed, 24 Nov 2021 12:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357C6E0D5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:39:56 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gt5so2453861pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMFICmq1b+/JqHXnwVNpy/lNHjIXGz9n5dRmdIrsjj4=;
 b=BWH1E2DUIhqLlVJHGrhMUVKBs2n/zeDD5VZuPP0uGwx0Zq+LEMVtgXS7oF3eSxyv9+
 VHsRneraaYkRPuxjFq2y6gvkaWBpTsnQk5vY/1pkDTgccpvxdeduG6bIZ5qqqzUVN5A8
 /2pgwJt0+NjD9cveA4naQJ0xa32z2VngFdC8hfHSOSNVu4m8ugmTdge3Zq9pdpeqFz/+
 ckX8Qzmb40/v9+ueRLKN4zCIhhMJxz48O/UpVnCp5BWz1GWoKmgIXIfFyZBCKmgpzBZC
 JxGwt8B3ucwMwcGGkjlpBcWGsHqMQyc/W0lEKnDfAbGxlF97xXeS9coOTdO31vwfIzDY
 /4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMFICmq1b+/JqHXnwVNpy/lNHjIXGz9n5dRmdIrsjj4=;
 b=zl47QVPkbTONPykoXphFI+URSjsrHoZ1VWY6Pr8ITwrjkZWVjBlMbIJO6DmyNBS8BK
 v00WYbcy0ygbbGv2Zads6wQZGyxaMCLNR/kzUQl7mr7FMgrFzHOMwU5NDC9uoPAFzu6K
 5lQ3PG6yDmcEPOhR6lunvffOjI2XEhr7KY/oOzzTtRPCYF6nb+q+pEH6nn6IUpFj9W/y
 EQQu0N6UQ6kgh4lqJ7A1+MGmVqhu44tzkJ9h4oZsVXxy1+LlEBTY4oq5xiCwHG+vEt0f
 YmiunytdTBOpVsnbFaon4uJgJ18BpQg3CrQwqZE6BdIpO/MGo32u56msj6GFjOsVQQtb
 a7IA==
X-Gm-Message-State: AOAM5338dEwfJxCB/mWohgQL8Glp87SNHC39Wz6esskMrd0/SZt1lXJH
 9eZ3pT+/qbtJ6zT0RnW5deFKEjdfk7HeiqTBVVM96jFI4z4=
X-Google-Smtp-Source: ABdhPJyDLVIppheFrvbGjpHZVBjEkgj1stb+v8Y6ldPVozNLNACR1bfimZTh8WnjRo77xRtzdL9Z0DU7pTOxDlcd5Sk=
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr18120813plg.72.1637757595783; Wed, 24
 Nov 2021 04:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20211118193002.407168-1-hsinyi@chromium.org>
 <20211119015453.GB3823948@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20211119015453.GB3823948@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 24 Nov 2021 13:39:44 +0100
Message-ID: <CAG3jFytd0PXYNB_2NUcyr2pD1xJ-YJkDSqiSivbiPStV0s_qtw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021 at 02:55, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Fri, Nov 19, 2021 at 03:30:02AM +0800, Hsin-Yi Wang wrote:
> > edid_read() was assumed to return 0 on success. After
> > 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
> > the function will return > 0 for successful case, representing the i2c
> > read bytes. Otherwise -EIO on failure cases. Update the g_edid_break
> > break condition accordingly.
> Hi Hsin-Yi, thanks for the patch!
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
> >
> > Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > ---
> > v2: Fix type error.
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 1a871f6b6822ee..3a18f1dabcfd51 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -795,7 +795,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >       int count, blocks_num;
> >       u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
> >       u8 i, j;
> > -     u8 g_edid_break = 0;
> > +     int g_edid_break = 0;
> >       int ret;
> >       struct device *dev = &ctx->client->dev;
> >
> > @@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >                               g_edid_break = edid_read(ctx, offset,
> >                                                        pblock_buf);
> >
> > -                             if (g_edid_break)
> > +                             if (g_edid_break < 0)
> >                                       break;
> >
> >                               memcpy(&pedid_blocks_buf[offset],
> > --

Fixed commit id syntax of commit message in order to make checkpatch
--strict happy.

Applied to drm-misc-next.
