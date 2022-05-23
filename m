Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016C5311C9
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA9F10E29F;
	Mon, 23 May 2022 16:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4142510E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:06:08 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f189b07f57so19064984fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfWyXqKDw6KMyeqQToN3+pb4tfYQnyQoFUsrYr2tg34=;
 b=kU/xLlvMMyizZPnrw/4g+bnPtd5LqlyHH+Wc94Nexqf4uQOgnwARiQhcDDDorC42GV
 f+4eN4fP6cKJUo1p5XyyBY5O+rFnPqiEyC9e6YUpIxAbC67AnnKN5mqBPvGl846M+Ft8
 Th/vxhr4vaBwomnkON2BJHdsPuv4Y2lnbNQAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfWyXqKDw6KMyeqQToN3+pb4tfYQnyQoFUsrYr2tg34=;
 b=KtTHSi17TzRBQY9pcxctv9pZdXzbkxrtpXWPx5rKcOVNgPgZS6H9Hsgyq7WyUVy+lJ
 i7OKL5HuqlZCUtyMe0+E9bqqtpGt5O5rPghFxXEvZdCFQwluW35lI7w1kRV2t5mjMGDb
 FKqJreUD/fMPCxDPhqGxLi9QF839V75dKmArPZFmjtvm5ccwDkkKv69YiHDyOwKY5+xk
 9zbA/SxqZqird745gyLe39Z32Smn9dPZjd1PE8VhTInSn7ke0193KyntOrU39kwcAfx0
 V5m9p+Ox1AQCax6K+b9djmKAQ5VoS4LVOjATNl7ipkn09qYLpw7WL5123n+d+mGmE5uD
 kdBg==
X-Gm-Message-State: AOAM531BHOwmVkY1vVsN3h6GCNhN/w1PMsyRMvtm2mM2LWePbha+GSym
 hMUfvx3qG6FX6ZRorIU2cG5CAgPy29Md6X0zCM2eWw==
X-Google-Smtp-Source: ABdhPJxCSCqEX0AX/mFMKV9Nszvd1kSvfb5PoopVXRLMDu0j/BF8/r6jTeX7U8ExRKBQB1j15KZ26tYC51B1MxbiPjE=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr13576965oap.228.1653321967446; Mon, 23
 May 2022 09:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084615.13510-1-robert.foss@linaro.org>
 <CAG3jFytkFcmYjj6AHye3imsTDyP1LxHQvAzjswuRBsVVHRTnKg@mail.gmail.com>
 <CAG3jFytGDm29GVAQ5bs7XQ+hMDABd7btggFGN2pASBEzRPE50A@mail.gmail.com>
In-Reply-To: <CAG3jFytGDm29GVAQ5bs7XQ+hMDABd7btggFGN2pASBEzRPE50A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 23 May 2022 18:05:56 +0200
Message-ID: <CAKMK7uGmnM1GXi_6yovZApBo34B5ojrN1KZOqpKBDgUUDorQ6w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
To: Robert Foss <robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, airlied@linux.ie, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 hsinyi@chromium.org, jose.exposito89@gmail.com, sam@ravnborg.org,
 xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 14:54, Robert Foss <robert.foss@linaro.org> wrote:
> These two patches need to be reverted since they were part (3/4 & 4/4)
> of a series, that was partially (1/4 + 2/4) on the linux-media tree.
> These two patches depend on the patches in the media tree, and will
> not build without them, which leaves linux-drm-misc-next in a broken
> state. Let's revert the two latter patches until rc1 has been branched

"rc1 has been backmerged into drm-misc-next" is missing here.

> and the dependency wont cause issues any more.

With explainer and sob added to both:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>
> On Mon, 23 May 2022 at 14:50, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Mon, 23 May 2022 at 10:46, Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 01f46d9189c1..53a5da6c49dd 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > >
> > >         anx7625_get_swing_setting(dev, pdata);
> > >
> > > -       pdata->is_dpi = 0; /* default dsi mode */
> > > +       pdata->is_dpi = 1; /* default dpi mode */
> > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > >         if (!pdata->mipi_host_node) {
> > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > >                 return -ENODEV;
> > >         }
> > >
> > > -       bus_type = 0;
> > > +       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > >         mipi_lanes = MAX_LANES_SUPPORT;
> > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > >         if (ep0) {
> > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > >         }
> > >
> > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > -               pdata->is_dpi = 1;
> > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > +               pdata->is_dpi = 0;
> > >
> > >         pdata->mipi_lanes = mipi_lanes;
> > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > --
> > > 2.34.1
> > >
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
