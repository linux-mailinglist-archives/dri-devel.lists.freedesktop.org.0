Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE650DB2A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA8D10E047;
	Mon, 25 Apr 2022 08:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13B410E047
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:29:25 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7d621d1caso28788797b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLjj604aJ7sHEbPUV47iK7rgaLEe0P0beg+dD9hS6lc=;
 b=SFhnKBXU/UoiSainjH14yGlXHVY1TCnE3bbkrsyj88ZPnfIBVGkpYgLUsRFdHl7cuf
 3Nh8YwXkIl/DRTq1xBF7XGETNWEBxYUp08qU5XOpj/yAVTxjsPN3YjsQvslxdSBYf4tJ
 GPUTy8e4URgKxFH+/l5/2SxcabWjluQtjFiNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLjj604aJ7sHEbPUV47iK7rgaLEe0P0beg+dD9hS6lc=;
 b=UZbDULad8LlRtC9KVwZH+OWogQyavkZC/7y+NLGeOuqHyMucGJz0GGxpVUMjZJt2+w
 Jxnn0izinQDQQmKfD+3er+HVUjdLJqeHS4w/5vF16fN0PfIAcAwoqeHs1mP66z6/eSWe
 YNsY7zURypWHX1vw+BeKMAfL6ir7+sPLO7omA5vtfdBVcPXi80Bm54EC2UdBY0FYbyA+
 B4eQ2RqaXtcNJBCpLg8nZMBR51r/rrqTLopcL2TLjkukxnTlmZ48bAKkebZ2fzmWg1Q/
 ZrYFzKSx4yaPBS4Txw+xTn9GXNuqUtR5bHtXOd8pZOuc2zNijeLsxCOcFhB4oE/FlcKX
 usng==
X-Gm-Message-State: AOAM533h6JNCqk1q+fAbRkUer7Fh01KKVY5IrcNNq6r1ZlFEjXuWvye6
 JpGLYlD+6s12TRIJpMo3jaCuEgcVRaq7zK10NtpwYA==
X-Google-Smtp-Source: ABdhPJwqYRvt7Vb3m7Q6P1D51j+GjSTWnNRPZZoBEj0fljZ1FwsRCpSU/FqHs0B0mkHYdDgH/ZSj/w6EoS0MAahUiu4=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr15457087ywk.27.1650875364952; Mon, 25
 Apr 2022 01:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
In-Reply-To: <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Apr 2022 16:29:14 +0800
Message-ID: <CAGXv+5GUq=9v2q3A7aR+NK_oR=z7MpQQznjWa7bqWR1xEYoobw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Robert Foss <robert.foss@linaro.org>, Xin Ji <xji@analogixsemi.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 4:24 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > >
> > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 376da01243a3..71df977e8f53 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > >
> > > >         anx7625_get_swing_setting(dev, pdata);
> > > >
> > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > >         if (!pdata->mipi_host_node) {
> > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > >                 return -ENODEV;
> > > >         }
> > > >
> > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > +       bus_type = 0;
> > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > >         if (ep0) {
> > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > >         }
> > > >
> > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > -               pdata->is_dpi = 0;
> > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > +               pdata->is_dpi = 1;
> > > >
> > > >         pdata->mipi_lanes = mipi_lanes;
> > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > >
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> >
> > Acked-by: Robert Foss <robert.foss@linaro.org>
>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> mainline (next-20220422).

Forgot to mention, this device uses the already supported but broken (by
previous DPI patch) DSI interface.
