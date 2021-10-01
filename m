Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E341F415
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CF56EEAB;
	Fri,  1 Oct 2021 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941936EEA9;
 Fri,  1 Oct 2021 17:57:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d6so16668819wrc.11;
 Fri, 01 Oct 2021 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vb73lg9qsqwiLmqj85NjUPL2xZVz8BzLOB9BceFTR54=;
 b=iKrOVmWDyChr95wi0Eq5QO8i+oz/O3kLyjfsadbWMX4hO+WBoI+OIMQZxE1dLkZGWM
 /XoObslVzWTfjtdK1Cfc9UCe6IesS3bcjuhEF2CNAszzjlTzjlezvdDICJuw0JnVhXzZ
 WMLUdLRpDT24l46SofDJO1s85nOVl77XCDgRKnySR/Ys0ImYngf2rsFwFnRkyLqExXUq
 TDI5vIIHrqwz1mRAlXjRb1csubqWR4sZ+MucNgLf/OrCElqIXTmLZZIZN3advEO/QYRs
 5UDCBPL124qq9zc2QfMiJ9+G1eabUxNDa7g2vLeVcPAwEEVIkDVkbiozKI2GBpycLFeE
 ZsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vb73lg9qsqwiLmqj85NjUPL2xZVz8BzLOB9BceFTR54=;
 b=aeBbZPtBFuzkfkLRG3gSFZSqeDRHOqFIJcy1102yaSSjBm8AN9BBE1yHvP3fiH/l/X
 LDmmaXnLtW5uqrU82dH6QM7hDo/podBHRf5b0bVxLEPrU1784xrrjKWVD53uNYohcmUD
 Sc3C0maJqtiq0WMeZTmVzakH53JIhn7nGjfKClvcCSUnomewNyZSAhryIdNmstWUlk2S
 sSDud65tVcnxYK5hEA7iicohSWBvAMFQmD1VgY/xMkCaQS4kcz0dlyUpfTIsfGvh4rG8
 olDuL/YzRKAcq5KygqPBqQCQkWOHiyVw96UhSGNd2nLQtT5evBlovKhWPLTel2VJJmdQ
 x/SQ==
X-Gm-Message-State: AOAM532rJp7COvUJYxF49gHHTHbGFcectBYe0PdtcmAazhbb8RkHy5fg
 +9qoRXiOkql16gOPlMbp5c77mzYOUxMfH8fhk9WIk1Oa
X-Google-Smtp-Source: ABdhPJytVyeFma0MtJUTeP9fqX/qokpdavenH1L8LAggVgfF26XCTfWt9vkXs6TbhVUk+tgO9aYRvxTlnv1n1o47bl8=
X-Received: by 2002:adf:a289:: with SMTP id s9mr2359018wra.260.1633111073891; 
 Fri, 01 Oct 2021 10:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-2-robdclark@gmail.com>
 <bbcf5361-32e7-a2db-ffcc-986e012f000d@linaro.org>
In-Reply-To: <bbcf5361-32e7-a2db-ffcc-986e012f000d@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 Oct 2021 11:02:27 -0700
Message-ID: <CAF6AEGuRVEy1mXnHoAuD1TfzL+UUi8q0j0N1M3kUoVfgJWOwEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Support NO_CONNECTOR bridges
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Fri, Oct 1, 2021 at 10:28 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 21/09/2021 01:57, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For now, since we have a mix of bridges which support this flag, which
> > which do *not* support this flag, or work both ways, try it once with
> > NO_CONNECTOR and then fall back to the old way if that doesn't work.
> > Eventually we can drop the fallback path.
> >
> > v2: Add missing drm_connector_attach_encoder() so display actually comes
> >      up when the bridge properly handles the NO_CONNECTOR flag
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I think this patch can go through the drm/msm, while two other patches
> would need to through the drm-misc. Is it correct?

Correct, I made sure things worked in either order (ie. with msm patch
but without bridge patches, and visa versa), so they can land through
different trees

BR,
-R

>
> > ---
> >   drivers/gpu/drm/msm/Kconfig           |  2 ++
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 50 ++++++++++++++++++++-------
> >   2 files changed, 39 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index e9c6af78b1d7..36e5ba3ccc28 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -14,6 +14,8 @@ config DRM_MSM
> >       select REGULATOR
> >       select DRM_KMS_HELPER
> >       select DRM_PANEL
> > +     select DRM_BRIDGE
> > +     select DRM_PANEL_BRIDGE
> >       select DRM_SCHED
> >       select SHMEM
> >       select TMPFS
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index c41d39f5b7cf..e25877073d31 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -3,6 +3,8 @@
> >    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include "drm/drm_bridge_connector.h"
> > +
> >   #include "msm_kms.h"
> >   #include "dsi.h"
> >
> > @@ -688,10 +690,10 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
> >   {
> >       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >       struct drm_device *dev = msm_dsi->dev;
> > +     struct drm_connector *connector;
> >       struct drm_encoder *encoder;
> >       struct drm_bridge *int_bridge, *ext_bridge;
> > -     struct drm_connector *connector;
> > -     struct list_head *connector_list;
> > +     int ret;
> >
> >       int_bridge = msm_dsi->bridge;
> >       ext_bridge = msm_dsi->external_bridge =
> > @@ -699,22 +701,44 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
> >
> >       encoder = msm_dsi->encoder;
> >
> > -     /* link the internal dsi bridge to the external bridge */
> > -     drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> > -
> >       /*
> > -      * we need the drm_connector created by the external bridge
> > -      * driver (or someone else) to feed it to our driver's
> > -      * priv->connector[] list, mainly for msm_fbdev_init()
> > +      * Try first to create the bridge without it creating its own
> > +      * connector.. currently some bridges support this, and others
> > +      * do not (and some support both modes)
> >        */
> > -     connector_list = &dev->mode_config.connector_list;
> > +     ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> > +                     DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +     if (ret == -EINVAL) {
> > +             struct drm_connector *connector;
> > +             struct list_head *connector_list;
> > +
> > +             /* link the internal dsi bridge to the external bridge */
> > +             drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> > +
> > +             /*
> > +              * we need the drm_connector created by the external bridge
> > +              * driver (or someone else) to feed it to our driver's
> > +              * priv->connector[] list, mainly for msm_fbdev_init()
> > +              */
> > +             connector_list = &dev->mode_config.connector_list;
> >
> > -     list_for_each_entry(connector, connector_list, head) {
> > -             if (drm_connector_has_possible_encoder(connector, encoder))
> > -                     return connector;
> > +             list_for_each_entry(connector, connector_list, head) {
> > +                     if (drm_connector_has_possible_encoder(connector, encoder))
> > +                             return connector;
> > +             }
> > +
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     connector = drm_bridge_connector_init(dev, encoder);
> > +     if (IS_ERR(connector)) {
> > +             DRM_ERROR("Unable to create bridge connector\n");
> > +             return ERR_CAST(connector);
> >       }
> >
> > -     return ERR_PTR(-ENODEV);
> > +     drm_connector_attach_encoder(connector, encoder);
> > +
> > +     return connector;
> >   }
> >
> >   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
> >
>
>
> --
> With best wishes
> Dmitry
