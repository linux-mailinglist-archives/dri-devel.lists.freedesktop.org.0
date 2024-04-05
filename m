Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C7B89A3F1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F99210E46C;
	Fri,  5 Apr 2024 18:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cSi77JlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F010E46C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 18:15:49 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61461580403so26462217b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712340948; x=1712945748; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jhJUaxFqXdP8RjNRyyUr2YeJgug8HchIqd4jcE8AeV4=;
 b=cSi77JlSRY1NcW0JieI7Hy/3pKq80Q/pJ7tFa6Y+S/pg5mYjL9C4y2djFsVy460+eZ
 R+OYq6GlDFgwlp6JtyhApQMlbwVFuOy3NuyCM3vzZEvx9QQfNgC7vB3wXFZv0xgvrcvl
 3DUMEzVbgn4FU02YYgFUlfoTgZJV9/b12xn6z0JeZRdHXTuqVt6WAxC3eKh8VqeWU4yT
 yEvtMnwR9blz+F7W4ogooTgobKNj5bUp7uU5iCZNC62EEETsuVDdRJmZhxkWPnsLy8SR
 C4DogH6zQHa6eMTYbFCg0eXQ8q4XftkZZdW4YN39XN1m8CRw/4DbJxpKl4JDqWVCsOg7
 tteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712340948; x=1712945748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jhJUaxFqXdP8RjNRyyUr2YeJgug8HchIqd4jcE8AeV4=;
 b=vmCJKyrygF+3yomwd4FIk8+Fb7W+3NkpLlmuenwM+OQQJDmOaT48gsM8fjlAH5GXrT
 RjkCluDv73DoVIdICatRvsXOFQ9W4vrpmlOlm8bB0OGtvETON6LGDjYmoarpzZcZbk6O
 sKN+qyWEOJneoiSQKx6qZDfT4UnqNCAxsxnALpdWOIIRtSYZ6ktv5h23mul4qyLbGy8e
 l11Hcxisk3SeLb8h0s1bCuKpyDurkD5W4lcr6GTP2VvaTaGHHGbfGo2LlYWA6HyrjixZ
 P6LNsV0sTdP/RfWsBZk5wI40B1gbzIEFaX30b7oinLOKtCTFqOSXgAKCWODdA8tX9Lv4
 Cmjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjn1RIVsPWAyOOUmFU4UAf8zCdTc+ULevzyjy++BeaJEcEKHEzcy1sT6Pkr5GXk1tpxYmac5d7idG3OKV4D/PyxnoHbn27um8Ve915pnE
X-Gm-Message-State: AOJu0YwVtbfI4/f6Nmcuv3tPAMkuaflzIJZRRA3MK0T71h9mbWEsMdNy
 zwSKLy9PFB/CDJGWt1opXdH+8DGmok32h6LPp2oP9iKxVMnxsFIrtVutd9unCzp8faggthxKmOe
 a6hM/GbqYiUPvYYFmCabwAZDP7vqDmjPe1/lKlw==
X-Google-Smtp-Source: AGHT+IG8NStLBJ/v3TNzYtzpORNsJBegPKWoMw/JsWIwCn17FZbnI1E8BDTcn0eeeyQ5TnsPEj0tSy6OlV0Jtf0188I=
X-Received: by 2002:a5b:b8b:0:b0:dcb:aa26:50fe with SMTP id
 l11-20020a5b0b8b000000b00dcbaa2650femr2010398ybq.15.1712340948409; Fri, 05
 Apr 2024 11:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
 <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
In-Reply-To: <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:15:37 +0300
Message-ID: <CAA8EJpodmW8+JDxLx8+1sYURsXGZfmV1q6wzyxF1cxAx2Jo5dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 5 Apr 2024 at 20:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> > Currently the MSM DSI driver looks for the next bridge during
> > msm_dsi_modeset_init(). If the bridge is not registered at that point,
> > this might result in -EPROBE_DEFER, which can be problematic that late
> > during the device probe process. Move next bridge acquisition to the
> > dsi_bind state so that probe deferral is returned as early as possible.
> >
>
> But msm_dsi_modeset)init() is also called during msm_drm_bind() only.
>
> What issue are you suggesting will be fixed by moving this from
> msm_drm_bind() to dsi_bind()?

The goal is to return as early as possible as not not cause
probe-deferral loops. See commit fbc35b45f9f6 ("Add documentation on
meaning of -EPROBE_DEFER"). It discusses returning from probe() but
the same logic applies to bind().

> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
> >   drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
> >   3 files changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index 37c4c07005fe..38f10f7a10d3 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -120,6 +120,22 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
> >       struct msm_drm_private *priv = dev_get_drvdata(master);
> >       struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
> >
> > +     /*
> > +      * Next bridge doesn't exist for the secondary DSI host in a bonded
> > +      * pair.
> > +      */
> > +     if (!msm_dsi_is_bonded_dsi(msm_dsi) ||
> > +         msm_dsi_is_master_dsi(msm_dsi)) {
> > +             struct drm_bridge *ext_bridge;
> > +
> > +             ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> > +                                                 msm_dsi->pdev->dev.of_node, 1, 0);
> > +             if (IS_ERR(ext_bridge))
> > +                     return PTR_ERR(ext_bridge);
> > +
> > +             msm_dsi->next_bridge = ext_bridge;
> > +     }
> > +
> >       priv->dsi[msm_dsi->id] = msm_dsi;
> >
> >       return 0;
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> > index 2ad9a842c678..0adef65be1de 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > @@ -38,6 +38,8 @@ struct msm_dsi {
> >       struct mipi_dsi_host *host;
> >       struct msm_dsi_phy *phy;
> >
> > +     struct drm_bridge *next_bridge;
> > +
> >       struct device *phy_dev;
> >       bool phy_enabled;
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index a7c7f85b73e4..b7c52b14c790 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -464,18 +464,12 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
> >       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >       struct drm_device *dev = msm_dsi->dev;
> >       struct drm_encoder *encoder;
> > -     struct drm_bridge *ext_bridge;
> >       struct drm_connector *connector;
> >       int ret;
> >
> > -     ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> > -                                         msm_dsi->pdev->dev.of_node, 1, 0);
> > -     if (IS_ERR(ext_bridge))
> > -             return PTR_ERR(ext_bridge);
> > -
> >       encoder = int_bridge->encoder;
> >
> > -     ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> > +     ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
> >                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >       if (ret)
> >               return ret;
> >



-- 
With best wishes
Dmitry
