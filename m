Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51CA5AF7E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 00:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A55310E0D7;
	Mon, 10 Mar 2025 23:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MZhBfjYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DE210E4E5;
 Mon, 10 Mar 2025 18:53:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso4615131a12.2; 
 Mon, 10 Mar 2025 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741632815; x=1742237615; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iho3W+on/N75gV3bzXMK3KP/OeD/0YyFIl0pc8ybBsU=;
 b=MZhBfjYMb0PNvshzUb13QY1JEvRAgzmpZuUgdJ9W8lqdAljrIei774tKueZBFd1y+H
 JgLI/Ha5fL3zGz/geGP784trUkzQUCnuezvbWRr6887+BrSB6/X0S6FJJx2UJ0m9uMXh
 uOUckIulKrcCg/r7/Y05AV0Y8isQSRe3ivfQFy6fsumM8fisphI/VzMbY/yWu2BNV46X
 Y9DtoIwHTswByt5BzqcBSDlNV9X3BFEbGe7EYbH6nATCCkhA0N9aebQgyKyL5yO7SqYQ
 vdu+CnHqa0jFVxxCJq8KeCoLcd30xi8qhO5ey9XFLk6YKFYEjYRouET04N4hS/bcusyp
 kczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741632815; x=1742237615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iho3W+on/N75gV3bzXMK3KP/OeD/0YyFIl0pc8ybBsU=;
 b=n7RdfBxHZne491SCwNRtaxN61H/LpRZ0s/1OMiiABDVHlMtWbmAS6ykfusMt1KaWeS
 PTWzkrNeFXD39m1gz23u55UtZ8yFC0oPhhpqoiUSLid8n5rM45FTxvrXiSLOeA4oUtAg
 FbLPGZsTwrmPYIMRVFOEdrsrVJmvuEH11X/lREiX0asmP50+thdbAfNxzEUy4elp4IeU
 ihURfFjDtZMwECKESnl51RGigZFmQQUN6cZG7qkzc5dD5/kieDCFH8SOed920PnmqTnv
 6aZs4u8vJIiinTKMi11xSrwngB0lOa2H/e8feqE4ZEys/yMcny+F4hUU0vxYqYJ4QBn/
 sZ1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY4AZTJrZs/YymjVSM4rlg0yU+G3vOYkLQ9tQb6uuPeAjcwEOaeUhzTx1fer0Lx+vsGoNC6QLxQmM=@lists.freedesktop.org,
 AJvYcCUuXOxbl6UdxqCXzXDFP74QdS9lHq/lhN0/+bsdxQXRyQJjPTAK8ChMwMidry3JCFNYH3qv/YAWvlZV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1ygr4tfWqW60fC5IULCQ7BNB00Aw20kaZAT6gsKDa+oljf2D7
 zypnryMRmN6oT90uC+7G4BUJX39E7OtRlCvirze2V9v1PbNiy3lHxq/MopD/XDW53x+P1ZrmAgB
 R/voR2lXP/Yp2bcwy4WY4kVbgOWs=
X-Gm-Gg: ASbGncvn9xEge1LdioNIM7K8wk+3OJiDF6l/zt7bY8Mdsu9ejZy2z9652Tlx7h64waX
 8tsinVPwunI3VwNTh3hVaHvw/hKdiA0iBVpHEoF0GZQYC4hKAVsTITEfSU+QYABfLJKLz4NKDdm
 8fC2KcrThWQthtDU2Y+2y7IE8=
X-Google-Smtp-Source: AGHT+IFj2StyJDg8zD4+4OYRlXLPXJNcU5Jtcm4ExyNxF52AN+gkr26ntR7ajNz1qA9VYVgHyTLLvsClcakzJMJaJi4=
X-Received: by 2002:a17:907:6ea8:b0:ac2:8a59:92f4 with SMTP id
 a640c23a62f3a-ac28a5997fdmr958819166b.51.1741632815001; Mon, 10 Mar 2025
 11:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
 <20250310-daft-bittern-of-foundation-67c657@houat>
In-Reply-To: <20250310-daft-bittern-of-foundation-67c657@houat>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 10 Mar 2025 20:53:24 +0200
X-Gm-Features: AQ5f1JqlmlLOpUwZ-kWfmAsXGhTE0IXiFeiLkgthHrJ2sgZ6D0uTL6LbkYiaKKM
Message-ID: <CALT56yMSs7K_0b5YtkCW5Ypyt9Hu_YLkitFFJwTtBkwUJk-NHA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec implementation
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 10 Mar 2025 23:50:52 +0000
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

On Mon, 10 Mar 2025 at 17:08, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Mar 07, 2025 at 07:55:53AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Kconfig         |   1 +
> >  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >  6 files changed, 31 insertions(+), 170 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 974bc7c0ea761147d3326bdce9039d6f26f290d0..7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -104,6 +104,7 @@ config DRM_MSM_DPU
> >  config DRM_MSM_DP
> >       bool "Enable DisplayPort support in MSM DRM driver"
> >       depends on DRM_MSM
> > +     select DRM_DISPLAY_HDMI_AUDIO_HELPER
> >       select RATIONAL
> >       default y
> >       help
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f0785e3aed23dde160 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -13,13 +13,13 @@
> >
> >  #include "dp_catalog.h"
> >  #include "dp_audio.h"
> > +#include "dp_drm.h"
> >  #include "dp_panel.h"
> >  #include "dp_reg.h"
> >  #include "dp_display.h"
> >  #include "dp_utils.h"
> >
> >  struct msm_dp_audio_private {
> > -     struct platform_device *audio_pdev;
> >       struct platform_device *pdev;
> >       struct drm_device *drm_dev;
> >       struct msm_dp_catalog *catalog;
> > @@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
> >       msm_dp_catalog_audio_enable(catalog, enable);
> >  }
> >
> > -static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
> > +static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_display)
> >  {
> >       struct msm_dp_audio *msm_dp_audio;
> > -     struct msm_dp *msm_dp_display;
> > -
> > -     if (!pdev) {
> > -             DRM_ERROR("invalid input\n");
> > -             return ERR_PTR(-ENODEV);
> > -     }
> > -
> > -     msm_dp_display = platform_get_drvdata(pdev);
> > -     if (!msm_dp_display) {
> > -             DRM_ERROR("invalid input\n");
> > -             return ERR_PTR(-ENODEV);
> > -     }
> >
> >       msm_dp_audio = msm_dp_display->msm_dp_audio;
> > -
> >       if (!msm_dp_audio) {
> >               DRM_ERROR("invalid msm_dp_audio data\n");
> >               return ERR_PTR(-EINVAL);
> > @@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device
> >       return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
> >  }
> >
> > -static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
> > -             hdmi_codec_plugged_cb fn,
> > -             struct device *codec_dev)
> > -{
> > -
> > -     struct platform_device *pdev;
> > -     struct msm_dp *msm_dp_display;
> > -
> > -     pdev = to_platform_device(dev);
> > -     if (!pdev) {
> > -             pr_err("invalid input\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     msm_dp_display = platform_get_drvdata(pdev);
> > -     if (!msm_dp_display) {
> > -             pr_err("invalid input\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
> > -}
> > -
> > -static int msm_dp_audio_get_eld(struct device *dev,
> > -     void *data, uint8_t *buf, size_t len)
> > -{
> > -     struct platform_device *pdev;
> > -     struct msm_dp *msm_dp_display;
> > -
> > -     pdev = to_platform_device(dev);
> > -
> > -     if (!pdev) {
> > -             DRM_ERROR("invalid input\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     msm_dp_display = platform_get_drvdata(pdev);
> > -     if (!msm_dp_display) {
> > -             DRM_ERROR("invalid input\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     mutex_lock(&msm_dp_display->connector->eld_mutex);
> > -     memcpy(buf, msm_dp_display->connector->eld,
> > -             min(sizeof(msm_dp_display->connector->eld), len));
> > -     mutex_unlock(&msm_dp_display->connector->eld_mutex);
> > -
> > -     return 0;
> > -}
> > -
> > -int msm_dp_audio_hw_params(struct device *dev,
> > -     void *data,
> > -     struct hdmi_codec_daifmt *daifmt,
> > -     struct hdmi_codec_params *params)
> > +int msm_dp_audio_prepare(struct drm_connector *connector,
> > +                      struct drm_bridge *bridge,
> > +                      struct hdmi_codec_daifmt *daifmt,
> > +                      struct hdmi_codec_params *params)
> >  {
> >       int rc = 0;
> >       struct msm_dp_audio_private *audio;
> > -     struct platform_device *pdev;
> >       struct msm_dp *msm_dp_display;
> >
> > -     pdev = to_platform_device(dev);
> > -     msm_dp_display = platform_get_drvdata(pdev);
> > +     msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
> >
> >       /*
> >        * there could be cases where sound card can be opened even
> > @@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
> >               goto end;
> >       }
> >
> > -     audio = msm_dp_audio_get_data(pdev);
> > +     audio = msm_dp_audio_get_data(msm_dp_display);
> >       if (IS_ERR(audio)) {
> >               rc = PTR_ERR(audio);
> >               goto end;
> > @@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
> >       return rc;
> >  }
> >
> > -static void msm_dp_audio_shutdown(struct device *dev, void *data)
> > +void msm_dp_audio_shutdown(struct drm_connector *connector,
> > +                        struct drm_bridge *bridge)
> >  {
> >       struct msm_dp_audio_private *audio;
> > -     struct platform_device *pdev;
> >       struct msm_dp *msm_dp_display;
> >
> > -     pdev = to_platform_device(dev);
> > -     msm_dp_display = platform_get_drvdata(pdev);
> > -     audio = msm_dp_audio_get_data(pdev);
> > +     msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
> > +     audio = msm_dp_audio_get_data(msm_dp_display);
> >       if (IS_ERR(audio)) {
> >               DRM_ERROR("failed to get audio data\n");
> >               return;
> > @@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev, void *data)
> >       msm_dp_display_signal_audio_complete(msm_dp_display);
> >  }
> >
> > -static const struct hdmi_codec_ops msm_dp_audio_codec_ops = {
> > -     .hw_params = msm_dp_audio_hw_params,
> > -     .audio_shutdown = msm_dp_audio_shutdown,
> > -     .get_eld = msm_dp_audio_get_eld,
> > -     .hook_plugged_cb = msm_dp_audio_hook_plugged_cb,
> > -};
> > -
> > -static struct hdmi_codec_pdata codec_data = {
> > -     .ops = &msm_dp_audio_codec_ops,
> > -     .max_i2s_channels = 8,
> > -     .i2s = 1,
> > -};
> > -
> > -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio)
> > -{
> > -     struct msm_dp_audio_private *audio_priv;
> > -
> > -     audio_priv = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
> > -
> > -     if (audio_priv->audio_pdev) {
> > -             platform_device_unregister(audio_priv->audio_pdev);
> > -             audio_priv->audio_pdev = NULL;
> > -     }
> > -}
> > -
> > -int msm_dp_register_audio_driver(struct device *dev,
> > -             struct msm_dp_audio *msm_dp_audio)
> > -{
> > -     struct msm_dp_audio_private *audio_priv;
> > -
> > -     audio_priv = container_of(msm_dp_audio,
> > -                     struct msm_dp_audio_private, msm_dp_audio);
> > -
> > -     audio_priv->audio_pdev = platform_device_register_data(dev,
> > -                                             HDMI_CODEC_DRV_NAME,
> > -                                             PLATFORM_DEVID_AUTO,
> > -                                             &codec_data,
> > -                                             sizeof(codec_data));
> > -     return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
> > -}
> > -
> >  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
> >                       struct msm_dp_catalog *catalog)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
> > index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278983e5f21ee80ac7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.h
> > @@ -35,23 +35,6 @@ struct msm_dp_audio {
> >  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
> >                       struct msm_dp_catalog *catalog);
> >
> > -/**
> > - * msm_dp_register_audio_driver()
> > - *
> > - * Registers DP device with hdmi_codec interface.
> > - *
> > - * @dev: DP device instance.
> > - * @msm_dp_audio: an instance of msm_dp_audio module.
> > - *
> > - *
> > - * Returns the error code in case of failure, otherwise
> > - * zero on success.
> > - */
> > -int msm_dp_register_audio_driver(struct device *dev,
> > -             struct msm_dp_audio *msm_dp_audio);
> > -
> > -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio);
> > -
> >  /**
> >   * msm_dp_audio_put()
> >   *
> > @@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm
> >   */
> >  void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
> >
> > -int msm_dp_audio_hw_params(struct device *dev,
> > -     void *data,
> > -     struct hdmi_codec_daifmt *daifmt,
> > -     struct hdmi_codec_params *params);
> > +int msm_dp_audio_prepare(struct drm_connector *connector,
> > +                      struct drm_bridge *bridge,
> > +                      struct hdmi_codec_daifmt *daifmt,
> > +                      struct hdmi_codec_params *params);
> > +void msm_dp_audio_shutdown(struct drm_connector *connector,
> > +                        struct drm_bridge *bridge);
> >
> >  #endif /* _DP_AUDIO_H_ */
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index bbc47d86ae9e67245c87a8365df366cce0dc529e..ece184d20c0f8bffa3c2a48216015185d6cbc99e 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/string_choices.h>
> >  #include <drm/display/drm_dp_aux_bus.h>
> > +#include <drm/display/drm_hdmi_audio_helper.h>
> >  #include <drm/drm_edid.h>
> >
> >  #include "msm_drv.h"
> > @@ -288,13 +289,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
> >               goto end;
> >       }
> >
> > -
> > -     rc = msm_dp_register_audio_driver(dev, dp->audio);
> > -     if (rc) {
> > -             DRM_ERROR("Audio registration Dp failed\n");
> > -             goto end;
> > -     }
> > -
> >       rc = msm_dp_hpd_event_thread_start(dp);
> >       if (rc) {
> >               DRM_ERROR("Event thread create failed\n");
> > @@ -316,7 +310,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
> >
> >       of_dp_aux_depopulate_bus(dp->aux);
> >
> > -     msm_dp_unregister_audio_driver(dev, dp->audio);
> >       msm_dp_aux_unregister(dp->aux);
> >       dp->drm_dev = NULL;
> >       dp->aux->drm_dev = NULL;
> > @@ -626,9 +619,9 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
> >                       struct msm_dp_display_private, msm_dp_display);
> >
> >       /* notify audio subsystem only if sink supports audio */
> > -     if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
> > -                     dp->audio_supported)
> > -             msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
> > +     if (dp->audio_supported)
> > +             drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
> > +                                                     plugged);
> >  }
> >
> >  static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
> > @@ -907,19 +900,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> >       return 0;
> >  }
> >
> > -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> > -             hdmi_codec_plugged_cb fn, struct device *codec_dev)
> > -{
> > -     bool plugged;
> > -
> > -     msm_dp_display->plugged_cb = fn;
> > -     msm_dp_display->codec_dev = codec_dev;
> > -     plugged = msm_dp_display->link_ready;
> > -     msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
> > -
> > -     return 0;
> > -}
> > -
> >  /**
> >   * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
> >   * @bridge: Pointer to drm bridge structure
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > @@ -7,7 +7,6 @@
> >  #define _DP_DISPLAY_H_
> >
> >  #include "dp_panel.h"
> > -#include <sound/hdmi-codec.h>
> >  #include "disp/msm_disp_snapshot.h"
> >
> >  #define DP_MAX_PIXEL_CLK_KHZ 675000
> > @@ -15,7 +14,6 @@
> >  struct msm_dp {
> >       struct drm_device *drm_dev;
> >       struct platform_device *pdev;
> > -     struct device *codec_dev;
> >       struct drm_connector *connector;
> >       struct drm_bridge *next_bridge;
> >       bool link_ready;
> > @@ -25,14 +23,10 @@ struct msm_dp {
> >       bool is_edp;
> >       bool internal_hpd;
> >
> > -     hdmi_codec_plugged_cb plugged_cb;
> > -
> >       struct msm_dp_audio *msm_dp_audio;
> >       bool psr_supported;
> >  };
> >
> > -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> > -             hdmi_codec_plugged_cb fn, struct device *codec_dev);
> >  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
> >  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
> >  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index cca57e56c906255a315e759e85a5af5982c80e9c..20b24eea0a4b619598079fbe4a32188485852b04 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -12,6 +12,7 @@
> >
> >  #include "msm_drv.h"
> >  #include "msm_kms.h"
> > +#include "dp_audio.h"
> >  #include "dp_drm.h"
> >
> >  /**
> > @@ -114,6 +115,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
> >       .hpd_disable  = msm_dp_bridge_hpd_disable,
> >       .hpd_notify   = msm_dp_bridge_hpd_notify,
> >       .debugfs_init = msm_dp_bridge_debugfs_init,
> > +
> > +     .hdmi_audio_prepare = msm_dp_audio_prepare,
> > +     .hdmi_audio_shutdown = msm_dp_audio_shutdown,
> >  };
> >
> >  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
> >        */
> >       if (!msm_dp_display->is_edp) {
> >               bridge->ops =
> > +                     DRM_BRIDGE_OP_HDMI_AUDIO |
> >                       DRM_BRIDGE_OP_DETECT |
> >                       DRM_BRIDGE_OP_HPD |
> >                       DRM_BRIDGE_OP_MODES;
> > +             bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
> > +             bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > +             bridge->hdmi_audio_dai_port = -1;
> >       }
>
> I think I'd prefer the toggle to be OP_DP_AUDIO, even if the
> implementation is exactly the same. That way, we'll be able to condition
> it to the DP support when that arrives, and we have the latitude to
> rework it to accomodate some DP subtleties without affecting the drivers
> later on.

I don't think that there is a point in having OP_DP_AUDIO. There is
not so much difference in the driver. Also currently OP_HDMI_AUDIO
follows existing approach (which was pointed out by Laurent) - that
OP_foo should guard a particular set of callbacks. From this
perspective, OP_HDMI_AUDIO is fine - it guards usage of
hdmi_audio_foo(). OP_DP_AUDIO would duplicate that.


-- 
With best wishes
Dmitry
