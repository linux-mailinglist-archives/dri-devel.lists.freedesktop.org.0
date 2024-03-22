Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6FB886D47
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF59711248F;
	Fri, 22 Mar 2024 13:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z4YyuCdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4C0112491
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:36:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56be0860060so917154a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711114597; x=1711719397; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nnd6ibXxUQf/CK/aaQKXsb3cInWcKtPxZxIk6K6GCqM=;
 b=Z4YyuCdmhGgAhXG7SdXtlKyppaN2f071K20J/G9vlgsQRMkpJHv+twacCRJb8hTTtg
 Kn94bY0DVCwuhu9PHuYQ+q5SrEqInoVqgbcEXVg0xPZI+nz9zGeDs8ah16cqdNPuOu9x
 2qqmxUWe+amz+5yPaFbw6DDP22NC1EZzgB8SOtraONSw+G95eH8ZgO4W7lZ7P16WdqbK
 cuu5voxDlS3wLvhB03gN38TmvXE4buPXbT42uXiO7+ZM6tXL5K9ylB+Nn1Dzv1KE8iOp
 kzYUtkAwtKFJxKwTQ3wh2TEoUqC0obRrGu60dewjC1xQUnvL/+BQ+xGDkm3JhBsxIVOV
 a8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711114597; x=1711719397;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nnd6ibXxUQf/CK/aaQKXsb3cInWcKtPxZxIk6K6GCqM=;
 b=qNIlSAScpopVCnUHn3GVZaIFL5iEcboagNwdiZZf4+LHu6jKpS2g6HbgpDYl630Gj4
 PAExhE81RyrrdzHzcJHdG3HkIOc+c/nFT7ZPk2/9iS4X0/oMqjrsQ/TRyIsYKjj81JBP
 +Oh2CmLKy1eWZzRywQTd3/Moex8RqRfGfzQHxrSj/KtpndzrDkpG7MUKwny425ISjwXH
 2wYxXGUy1cEkz4Q425O43OluCVzmPDv6jm1pDgiMEX6J6Zs946cByYhxctxWd03f5MZa
 e4ThtJ8p6piw4pNM6wMDEAkrSi8QVv7ZU2rszAdvGMWbk+mHWEg7/m3Xvj/pM/TWVzuV
 N4jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/SNkK4UhYyLTkFMmv6umMrmilTTkfY1bLtJ8kUBHt8qFaHXmJSmYVtFAQVuSo5KVHDb8Q6Y1SsWLsZTTNTmx1tg5oTRotM37K/FXSs9fS
X-Gm-Message-State: AOJu0YwBEndJ3+qPYXNvWNyCvnmPVlDOvvxjTdESds2Ayd7Gbn2YjuHt
 J7EOlDcdy7gv2+C1kp/q1yO95WZmYXPTL4I4SyAbanV9jDYFigWaTzgne0U2CzY=
X-Google-Smtp-Source: AGHT+IFoaXX1Dh5Xg/+nKkToAtA9OhmG/gb6cE5zvBDWJWXkJ4/21d6NlvsfBgwbrNf8MmMq9rhSlQ==
X-Received: by 2002:a17:906:b6d2:b0:a46:cc94:1677 with SMTP id
 ec18-20020a170906b6d200b00a46cc941677mr1618611ejb.17.1711114596679; 
 Fri, 22 Mar 2024 06:36:36 -0700 (PDT)
Received: from linaro.org ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 ch11-20020a170906c2cb00b00a47090964casm1010680ejb.184.2024.03.22.06.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 06:36:36 -0700 (PDT)
Date: Fri, 22 Mar 2024 15:36:34 +0200
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
Message-ID: <Zf2JYmm3DEaR8vB5@linaro.org>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
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

On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Instead of relying on different compatibles for eDP and DP, lookup
> > the panel node in devicetree to figure out the connector type and
> > then pass on that information to the PHY. External DP is not described
> 
> Nit: External DP doesn't have a panel described in DT...
> 

Will fix.

> > in DT, therefore, assume it's eDP if panel node is present.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index c4cb82af5c2f..c9763f77c832 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> >         if (IS_ERR(phy))
> >                 return PTR_ERR(phy);
> >
> > +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> > +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> > +       if (rc) {
> > +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> > +               dp->catalog = NULL;
> > +               goto error;
> > +       }
> > +
> >         dp->catalog = dp_catalog_get(dev);
> >         if (IS_ERR(dp->catalog)) {
> >                 rc = PTR_ERR(dp->catalog);
> > @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> >                 goto error;
> >         }
> >
> > -       dp->aux = dp_aux_get(dev, dp->catalog,
> > -                            phy,
> > -                            dp->dp_display.is_edp);
> > +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
> 
> Unrelated
> 

Yep, will drop the change.

> >         if (IS_ERR(dp->aux)) {
> >                 rc = PTR_ERR(dp->aux);
> >                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> > @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> >         return dp_display_probe_tail(aux->dev);
> >  }
> >
> > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > +                                        const struct msm_dp_desc *desc)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *aux_bus;
> > +       struct device_node *panel;
> > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > +
> > +       /* legacy platforms specify connector type in match data */
> > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> 
> misaligned
> 

Sure, will fix.

> > +               return desc->connector_type;
> 
> Can we drop this part completely?
> 

You mean the whole if clause? How should we handle the legacy approach
then?

> > +
> > +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > +       if (!aux_bus)
> > +               goto out;
> > +
> > +       panel = of_get_child_by_name(aux_bus, "panel");
> > +       if (!panel)
> > +               goto out;
> > +
> > +       ret = DRM_MODE_CONNECTOR_eDP;
> > +
> > +out:
> > +       of_node_put(panel);
> > +       of_node_put(aux_bus);
> > +       return ret;
> > +}
> > +
> >  static int dp_display_probe(struct platform_device *pdev)
> >  {
> >         int rc = 0;
> > @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
> >         dp->dp_display.pdev = pdev;
> >         dp->name = "drm_dp";
> >         dp->id = desc->id;
> > -       dp->dp_display.connector_type = desc->connector_type;
> > +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
> >         dp->wide_bus_supported = desc->wide_bus_supported;
> >         dp->dp_display.is_edp =
> >                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
