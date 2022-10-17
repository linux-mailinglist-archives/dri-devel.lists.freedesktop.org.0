Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483A6005E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 05:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650810EC38;
	Mon, 17 Oct 2022 03:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31EA10EC37
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 03:58:59 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id g130so10869620oia.13
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 20:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kVFGWA4vlnvHGqq1JkQQXIB1SOPJqVT47VGXYJ9zQzQ=;
 b=CmlM7D+XgyDkXtyHNa2Aw/OpP0NplioWIfnAwpjw9jL2cHQjaIRZcixh+m6AXoqYLl
 OPmnN5d3mU4RtGvAIWxO3sB6sg/DYkvcTtjVhjKpwPK+VfeEnsSe1nQHhLAii/Ngh+Gq
 6ZTH+QO/1H7emX2VzcVC4RGJeKlcJrMTGLRWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kVFGWA4vlnvHGqq1JkQQXIB1SOPJqVT47VGXYJ9zQzQ=;
 b=r96of1PwW21LYp7LuzgIRQCkLvE6IVTeNxmLeTwJVPHeLBR0e0v1WkL+c0RyTT7BAB
 9PKjp+bSFUOidrrFdTGk2eq/UvCWpygzJ3m17EfrF1/fgJ6J81oW7mRqX/6WRKJe2dfT
 O/+Jo4g4rynsiokLN8KqwjQ9YGpWH8WV/owIRMwAGENf2p2D/98siOGamyWA8Ng+xSbQ
 OvxuCITGZjV0biBR+kUq36VGnkxSmeDCWuaBrVNYn6MX440tKq9M20UC+IrGi4TCkaIY
 HcISgn68yfkouVQeLMks+vjBU0cR7yozSyvjjg8+DALZcC7AdChwS7nI0H4Ohsk84v3m
 V8tA==
X-Gm-Message-State: ACrzQf3UJuHMbZtvdPs5FNnrAFuVvimwocrSxDF61pQW2wq4sqiG62Dn
 Y+MlEZdJTT2aK3M+1sxgFTcLqNY8+UGxsjIHOS/Low==
X-Google-Smtp-Source: AMsMyM5Agp1aOVhkq7OF9uzqr9qECybxmYU2DZoosoRxoqFzJVZqRhr3dILQjk73C7gegAWPQRkQgGvxZMgHSZbPxk8=
X-Received: by 2002:a05:6808:128e:b0:355:35f5:c939 with SMTP id
 a14-20020a056808128e00b0035535f5c939mr1742589oiw.276.1665979138999; Sun, 16
 Oct 2022 20:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
 <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
In-Reply-To: <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 09:28:48 +0530
Message-ID: <CAMty3ZAAmeHFG-n6LKeq6Mb2GcHxFBJr5DDPJcxrgYn=J_XHmg@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
>
> [...]
>
> > @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > +#define MAX_INPUT_SEL_FORMATS        1
> > +
> > +static u32 *
> > +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state *bridge_state,
> > +                                    struct drm_crtc_state *crtc_state,
> > +                                    struct drm_connector_state *conn_state,
> > +                                    u32 output_fmt,
> > +                                    unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     *num_input_fmts = 0;
> > +
> > +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> > +                          GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     /* This is the DSI-end bus format */
> > +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +     *num_input_fmts = 1;
>
> Is this the only supported format ? NXP AN13573 lists the following:

At least it only formats I have tested on my panel.

>
> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
>
> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> Packed Pixel Stream, 30-bit RGB, 10-10-10
> Packed Pixel Stream, 36-bit RGB, 12-12-12
> Packed Pixel Stream, 12-bit YCbCr, 4:2:0
> Packed Pixel Stream, 16-bit RGB, 5-6-5
> Packed Pixel Stream, 18-bit RGB, 6-6-6
> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format
>
> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
> LCDIFv3 can also generate the 16bit YCbCr .
>
> It seems there should be more formats here.

The idea of this patch is to support the default format first, and can
possibly add future patches with the addition of new formats.

Thanks,
Jagan.
