Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F9886E45
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB91124CC;
	Fri, 22 Mar 2024 14:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I0IuPWWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCE210F0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:15:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512f892500cso2607728e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711116926; x=1711721726; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9R3moE1H3kTWDrKb5bQHdR7IixtcbXzUsAraj0W58Qo=;
 b=I0IuPWWaAUmR9BL3kDF9oZItT4DnHrkA49dTML202goj5+tttPVuI+p2IE/e8FLLje
 kQssQnQTt1FF1CFO0CbtGJpv1vBjv4ohiCodJxH1ByrSZ/b5Hlyr6VjZPJRk5WJfGSmy
 y7XR3+RoqeNn425jGZIS5szZOqRaSqIIPhy70So/8vsko5PJPNRr3cyshs9P14WurGRI
 ZgSdDposbdpwyciZ3g6HNCksqh7CeMpuiYJbyvq5IDPnH6CoRZSdxsI1ZceDr9eOmPrc
 Z+34in/sofSf2We5zCN7v3gTpFQpfHkQjnV8zJHn79SEJgpykmfgoWWxupeFycZbGfT8
 SKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711116926; x=1711721726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9R3moE1H3kTWDrKb5bQHdR7IixtcbXzUsAraj0W58Qo=;
 b=nEatoS8mL5FIFoyJ9W1jOms9vUQ5DOs03BzYtXGypB/ATG9Edvei5Xx63zEIjq2+mP
 GUoabYp/6fz4WWJJ+x+ZOu38u/LjJr6eoof0VhFz2e8lmj/aEvC2gYN9c4Eh067/lUt6
 njan05AqaZU9g1SjgsiUW0k/MwWPNnj/yniHiKurSbdYKwOW7CO+trJ0Bsf8M6cFVozp
 WBG2yBQZVtXcy9gXRJxmtUjSxYEhy5v19eXIOhWxgYZZCSwSnowSuKWJdz4on3ayUiBs
 sf69Ljp++XNmY1xWHA0nlRSGqtZLrXrf+yX+3Igyzb6IZHS6b2wd1NZ9UnZEbH4SdJ2Z
 6qBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY74JykfW1NkbDomSTbzFI3IoWJKb+90C8wSb6VOFtV5/JCROXuc5+v2h616eDjOIQID3CLjsZLJCHFVYVIiZCeI47WhWsoKIxAy13lqM/
X-Gm-Message-State: AOJu0YxuewWHma29vdhi7U2AU4vHTlZk1s4sjo8WHq/OAmMG5l41Y2Ms
 EwHS4Y1CvqU9OAwizB2BUmVNKVK9HBu4+vmZNj6Ho1qTSKk8BTBLTy7cn7QiNSk=
X-Google-Smtp-Source: AGHT+IGOZKuMHViSi5fe+DQzsM7hBtZbHvu8a8ckWU7iav+adCl5d6BjwZ4KEmwhFjIWKg/9PLIaQQ==
X-Received: by 2002:ac2:4d9b:0:b0:512:fe25:550b with SMTP id
 g27-20020ac24d9b000000b00512fe25550bmr2266661lfe.47.1711116926198; 
 Fri, 22 Mar 2024 07:15:26 -0700 (PDT)
Received: from linaro.org ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 rp20-20020a170906d97400b00a46a2779475sm1059066ejb.101.2024.03.22.07.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 07:15:25 -0700 (PDT)
Date: Fri, 22 Mar 2024 16:15:23 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the
 eDP/DP mode from DT
Message-ID: <Zf2Se84QnWccpiM/@linaro.org>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
 <Zf2JYmm3DEaR8vB5@linaro.org>
 <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
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

On 24-03-22 15:38:03, Dmitry Baryshkov wrote:
> On Fri, 22 Mar 2024 at 15:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> > > On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > Instead of relying on different compatibles for eDP and DP, lookup
> > > > the panel node in devicetree to figure out the connector type and
> > > > then pass on that information to the PHY. External DP is not described
> > >
> > > Nit: External DP doesn't have a panel described in DT...
> > >
> >
> > Will fix.
> >
> > > > in DT, therefore, assume it's eDP if panel node is present.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
> > > >  1 file changed, 39 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index c4cb82af5c2f..c9763f77c832 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > > >         if (IS_ERR(phy))
> > > >                 return PTR_ERR(phy);
> > > >
> > > > +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> > > > +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> > > > +       if (rc) {
> > > > +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> > > > +               dp->catalog = NULL;
> > > > +               goto error;
> > > > +       }
> > > > +
> > > >         dp->catalog = dp_catalog_get(dev);
> > > >         if (IS_ERR(dp->catalog)) {
> > > >                 rc = PTR_ERR(dp->catalog);
> > > > @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > > >                 goto error;
> > > >         }
> > > >
> > > > -       dp->aux = dp_aux_get(dev, dp->catalog,
> > > > -                            phy,
> > > > -                            dp->dp_display.is_edp);
> > > > +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
> > >
> > > Unrelated
> > >
> >
> > Yep, will drop the change.
> >
> > > >         if (IS_ERR(dp->aux)) {
> > > >                 rc = PTR_ERR(dp->aux);
> > > >                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> > > > @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> > > >         return dp_display_probe_tail(aux->dev);
> > > >  }
> > > >
> > > > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > > > +                                        const struct msm_dp_desc *desc)
> > > > +{
> > > > +       struct device *dev = &pdev->dev;
> > > > +       struct device_node *aux_bus;
> > > > +       struct device_node *panel;
> > > > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > > > +
> > > > +       /* legacy platforms specify connector type in match data */
> > > > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > > > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> > >
> > > misaligned
> > >
> >
> > Sure, will fix.
> >
> > > > +               return desc->connector_type;
> > >
> > > Can we drop this part completely?
> > >
> >
> > You mean the whole if clause? How should we handle the legacy approach
> > then?
> 
> Legacy platforms still have the aux-bus/panel. so they should be
> handled by the check below.
> 

Oh, in that case we can drop the connector_type from every desc for all
platforms.

> >
> > > > +
> > > > +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > > > +       if (!aux_bus)
> > > > +               goto out;
> > > > +
> > > > +       panel = of_get_child_by_name(aux_bus, "panel");
> > > > +       if (!panel)
> > > > +               goto out;
> > > > +
> > > > +       ret = DRM_MODE_CONNECTOR_eDP;
> > > > +
> > > > +out:
> > > > +       of_node_put(panel);
> > > > +       of_node_put(aux_bus);
> > > > +       return ret;
> > > > +}
> > > > +
> > > >  static int dp_display_probe(struct platform_device *pdev)
> > > >  {
> > > >         int rc = 0;
> > > > @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > >         dp->dp_display.pdev = pdev;
> > > >         dp->name = "drm_dp";
> > > >         dp->id = desc->id;
> > > > -       dp->dp_display.connector_type = desc->connector_type;
> > > > +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
> > > >         dp->wide_bus_supported = desc->wide_bus_supported;
> > > >         dp->dp_display.is_edp =
> > > >                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry
