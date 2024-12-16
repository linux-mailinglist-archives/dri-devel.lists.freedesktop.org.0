Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D29F2D2E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4610E569;
	Mon, 16 Dec 2024 09:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UNa3Iinn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292B10E569
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:44:26 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3824e1adcdso2619310276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734342265; x=1734947065; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JuUwiwam2NLEhcEaeDlZ9kN1aj2SGwFO1wzDqoeRp0Q=;
 b=UNa3IinnUmXP4Q5qaA8wCy0RxT7Pdam3GWwyRswuRFHxuAGouhcwHrrVe5APmZ0vBb
 QanooIcvvu4zi8HQG6R6ArHhwkiHH6IStLlR0sxhB9LLmSl5YVU1Faz1ELzFO2FxjjsX
 Y1WkazNtbDmhKrJPwdIt2kc3v+j9afbNLaqsBinBW0e0wDZL0t5K1TDtRhW2mIKM11iz
 4iLEJjZjjuqTzroSOfVRCsi7ZBz+NhzxCjkHU8cCL5CiEZYq7WlyrEP3QK1WqrRgSofc
 z+WtOITNv40YpQylyLSEmM9oXJzuHElcg9Pb0DakIvuJJBDKFZb5QobDzG9fgwCGrHTU
 O0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734342265; x=1734947065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuUwiwam2NLEhcEaeDlZ9kN1aj2SGwFO1wzDqoeRp0Q=;
 b=d30dtmDAqWbhjFCT3MSI+I7T3QywpJhfcwl3+zFI8awVhn6LOZoVSQlX2cz8Ghs18k
 o7LMlrwOu4NxJYE06twZSsdCuMwoBp2XRRkNpq//tQWNX35gjuISxsH3lF5ltwVaiXJF
 X7HNtPZDl4JzXsxx9ZunpYzVQcaIg5rJPSTuswvpWFgrkXqJ8REKzdcJgqkdASPm3pJr
 Ev363NQEIYKnKiJzwOTLXGo/IopxDgjQR7+vVrLyPW0h5LoxoNUIObJggpQ9OUOwGM1N
 6uIGVY7w3Ro4QE8nc0KnDw/KwgzUCd5MXtMOnQPOinUM4MNRhOFqcvA2+Hv9caTawXWb
 za4w==
X-Gm-Message-State: AOJu0YzR5dxwTfiLSdhYg2twjdB4ZO2l/y2DsRHmGVPvhXSKIzRZGsJF
 tehAMvlLOTTfJE7fSxRxDJb49Jmot3k6Po8yve0UYjym/Piy0Kw1GOKnxvlZMqZycXe7ms68cwB
 o5C9+NUYg9sMJPWY5ei1a7h0lrZLZMjBURYXV7Q==
X-Gm-Gg: ASbGncscO4UodvuJrbBiG3zrp49Kl7IFeLUFYkL7ZSZJmZtMSO9eAju/7W1TGpraSkv
 T6nxfoSrFiSFeKCjiCH+B9J5sC3HNYRwvr/o1Ni0cVyw/nTQjlOBI
X-Google-Smtp-Source: AGHT+IEaxgr5zAENdkbhHhWLUWeddBiATkm12WTcfnkIBrtIL6G9ABG6kqvlOs/mlL45ibQg3MGgK6n9x3gh6NKZnko=
X-Received: by 2002:a05:6902:1587:b0:e4d:d319:ba6 with SMTP id
 3f1490d57ef6-e4dd3190cc0mr2042157276.39.1734342265011; Mon, 16 Dec 2024
 01:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-13-victor.liu@nxp.com>
 <3j4fguv4oienfaj4fghpiqpmnq3aczu4azhdo5jzvywc5mawm5@hh33p3dhf6xa>
 <db4d9d4e-855f-4647-9b93-ccc5ec0202b3@nxp.com>
 <q6pdop6ucowtoxxr66czq7yooujyvp6qs5vcg6gpmi3q4rs4l3@szyqt5pxteoz>
 <b02fb998-9420-4954-8e48-82447493bbb7@nxp.com>
 <CAA8EJppBpeMA3aSzk025tvzfTW-bFxeZS4kj0Ujk_AuCyoxnEg@mail.gmail.com>
 <95a5c779-941a-4942-8988-65fbe1c4cf82@nxp.com>
In-Reply-To: <95a5c779-941a-4942-8988-65fbe1c4cf82@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 11:44:13 +0200
Message-ID: <CAA8EJpoUa9y9nfrrDf47aLs5zr4XKSghySXNLnCGwDyYdOvMog@mail.gmail.com>
Subject: Re: [PATCH v6 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
 agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
 u.kleine-koenig@baylibre.com
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

On Mon, 16 Dec 2024 at 08:28, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/13/2024, Dmitry Baryshkov wrote:
> > On Fri, 13 Dec 2024 at 08:06, Liu Ying <victor.liu@nxp.com> wrote:
> >>
> >> On 12/12/2024, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 11, 2024 at 03:43:20PM +0800, Liu Ying wrote:
> >>>> On 12/10/2024, Dmitry Baryshkov wrote:
> >>>>> On Mon, Dec 09, 2024 at 11:39:16AM +0800, Liu Ying wrote:
> >>>>>> i.MX8qxp Display Controller(DC) is comprised of three main components that
> >>>>>> include a blit engine for 2D graphics accelerations, display controller for
> >>>>>> display output processing, as well as a command sequencer.  Add kernel
> >>>>>> mode setting support for the display controller part with two CRTCs and
> >>>>>> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
> >>>>>> registers of the display controller are accessed without command sequencer
> >>>>>> involved, instead just by using CPU.  The command sequencer is supposed to
> >>>>>> be used by the blit engine.
> >>>>>>
> >>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>>>> ---
> >>>>>> v6:
> >>>>>> * No change.
> >>>>>>
> >>>>>> v5:
> >>>>>> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
> >>>>>>
> >>>>>> v4:
> >>>>>> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
> >>>>>>   function calls from KMS routine to initialization stage. (Dmitry)
> >>>>>> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
> >>>>>>   appropriate .h header files or .c source files. (Dmitry)
> >>>>>> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> >>>>>> * Drop dc_drm->pe_rpm_count. (Dmitry)
> >>>>>> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> >>>>>> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
> >>>>>>   Instead, put it in struct dc_crtc.  (Dmitry)
> >>>>>> * Call devm_request_irq() to request IRQs, instead of using drmm action.
> >>>>>>   (Dmitry)
> >>>>>> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> >>>>>> * Select DRM_CLIENT_SELECTION due to rebase.
> >>>>>> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> >>>>>> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> >>>>>> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
> >>>>>>   rebase.
> >>>>>> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
> >>>>>>   register dc_drm_component_unbind_all() action.
> >>>>>> * Request interrupts in dc_crtc_post_init() after encoder initialization to
> >>>>>>   make sure next bridge is found first.
> >>>>>>
> >>>>>> v3:
> >>>>>> * No change.
> >>>>>>
> >>>>>> v2:
> >>>>>> * Find next bridge from TCon's port.
> >>>>>> * Drop drm/drm_module.h include from dc-drv.c.
> >>>>>>
> >>>>>>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
> >>>>>>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
> >>>>>>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 558 ++++++++++++++++++++++++++++++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
> >>>>>>  drivers/gpu/drm/imx/dc/dc-drv.c   | 244 +++++++++++++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-drv.h   |  19 +
> >>>>>>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-kms.h   |  58 ++++
> >>>>>>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
> >>>>>>  9 files changed, 1274 insertions(+), 2 deletions(-)
> >>>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
> >>>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
> >>>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
> >>>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
> >>>>>>

> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>> +static const struct component_master_ops dc_drm_ops = {
> >>>>>> +  .bind = dc_drm_bind,
> >>>>>> +  .unbind = dc_drm_unbind,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static int dc_probe(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +  struct component_match *match = NULL;
> >>>>>> +  struct dc_priv *priv;
> >>>>>> +  int ret;
> >>>>>> +
> >>>>>> +  priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >>>>>> +  if (!priv)
> >>>>>> +          return -ENOMEM;
> >>>>>> +
> >>>>>> +  priv->clk_cfg = devm_clk_get(&pdev->dev, NULL);
> >>>>>> +  if (IS_ERR(priv->clk_cfg))
> >>>>>> +          return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cfg),
> >>>>>> +                               "failed to get cfg clock\n");
> >>>>>> +
> >>>>>> +  dev_set_drvdata(&pdev->dev, priv);
> >>>>>> +
> >>>>>> +  ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> >>>>>> +  if (ret)
> >>>>>> +          return ret;
> >>>>>> +
> >>>>>> +  ret = devm_pm_runtime_enable(&pdev->dev);
> >>>>>> +  if (ret)
> >>>>>> +          return ret;
> >>>>>> +
> >>>>>> +  ret = devm_of_platform_populate(&pdev->dev);
> >>>>>> +  if (ret)
> >>>>>> +          return ret;
> >>>>>> +
> >>>>>> +  dc_add_components(&pdev->dev, &match);
> >>>>>> +
> >>>>>> +  ret = component_master_add_with_match(&pdev->dev, &dc_drm_ops, match);
> >>>>>> +  if (ret)
> >>>>>> +          return dev_err_probe(&pdev->dev, ret,
> >>>>>> +                               "failed to add component master\n");
> >>>>>> +
> >>>>>> +  return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_remove(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +  component_master_del(&pdev->dev, &dc_drm_ops);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_runtime_suspend(struct device *dev)
> >>>>>> +{
> >>>>>> +  struct dc_priv *priv = dev_get_drvdata(dev);
> >>>>>> +
> >>>>>> +  clk_disable_unprepare(priv->clk_cfg);
> >>>>>> +
> >>>>>> +  return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_runtime_resume(struct device *dev)
> >>>>>> +{
> >>>>>> +  struct dc_priv *priv = dev_get_drvdata(dev);
> >>>>>> +  int ret;
> >>>>>> +
> >>>>>> +  ret = clk_prepare_enable(priv->clk_cfg);
> >>>>>> +  if (ret)
> >>>>>> +          dev_err(dev, "failed to enable cfg clock: %d\n", ret);
> >>>>>> +
> >>>>>> +  return ret;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_suspend(struct device *dev)
> >>>>>> +{
> >>>>>> +  struct dc_priv *priv = dev_get_drvdata(dev);
> >>>>>> +
> >>>>>> +  return drm_mode_config_helper_suspend(priv->drm);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int dc_resume(struct device *dev)
> >>>>>> +{
> >>>>>> +  struct dc_priv *priv = dev_get_drvdata(dev);
> >>>>>> +
> >>>>>> +  return drm_mode_config_helper_resume(priv->drm);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dc_shutdown(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +  struct dc_priv *priv = dev_get_drvdata(&pdev->dev);
> >>>>>> +
> >>>>>> +  drm_atomic_helper_shutdown(priv->drm);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static const struct dev_pm_ops dc_pm_ops = {
> >>>>>> +  RUNTIME_PM_OPS(dc_runtime_suspend, dc_runtime_resume, NULL)
> >>>>>> +  SYSTEM_SLEEP_PM_OPS(dc_suspend, dc_resume)
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct of_device_id dc_dt_ids[] = {
> >>>>>> +  { .compatible = "fsl,imx8qxp-dc", },
> >>>>>> +  { /* sentinel */ }
> >>>>>> +};
> >>>>>> +MODULE_DEVICE_TABLE(of, dc_dt_ids);
> >>>>>> +
> >>>>>> +static struct platform_driver dc_driver = {
> >>>>>> +  .probe = dc_probe,
> >>>>>> +  .remove = dc_remove,
> >>>>>> +  .shutdown = dc_shutdown,
> >>>>>> +  .driver = {
> >>>>>> +          .name = "imx8-dc",
> >>>>>> +          .of_match_table = dc_dt_ids,
> >>>>>> +          .pm = pm_sleep_ptr(&dc_pm_ops),
> >>>>>> +  },
> >>>>>> +};
> >>>>>> +
> >>>>>>  static struct platform_driver * const dc_drivers[] = {
> >>>>>>    &dc_cf_driver,
> >>>>>>    &dc_de_driver,
> >>>>>> @@ -19,6 +262,7 @@ static struct platform_driver * const dc_drivers[] = {
> >>>>>>    &dc_lb_driver,
> >>>>>>    &dc_pe_driver,
> >>>>>>    &dc_tc_driver,
> >>>>>> +  &dc_driver,
> >>>>>>  };
> >>>>>>
> >>>>>>  static int __init dc_drm_init(void)
> >>>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> >>>>>> index 3b11f4862c6c..39a771a13933 100644
> >>>>>> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> >>>>>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> >>>>>> @@ -6,19 +6,38 @@
> >>>>>>  #ifndef __DC_DRV_H__
> >>>>>>  #define __DC_DRV_H__
> >>>>>>
> >>>>>> +#include <linux/container_of.h>
> >>>>>>  #include <linux/platform_device.h>
> >>>>>>
> >>>>>>  #include <drm/drm_device.h>
> >>>>>> +#include <drm/drm_encoder.h>
> >>>>>>
> >>>>>>  #include "dc-de.h"
> >>>>>> +#include "dc-kms.h"
> >>>>>>  #include "dc-pe.h"
> >>>>>>
> >>>>>>  struct dc_drm_device {
> >>>>>>    struct drm_device base;
> >>>>>> +  struct dc_crtc dc_crtc[DC_DISPLAYS];
> >>>>>> +  struct dc_plane dc_primary[DC_DISPLAYS];
> >>>>>> +  struct drm_encoder encoder[DC_DISPLAYS];
> >>>>>>    struct dc_de *de[DC_DISPLAYS];
> >>>>>>    struct dc_pe *pe;
> >>>>>>  };
> >>>>>>
> >>>>>> +static inline struct dc_drm_device *to_dc_drm_device(struct drm_device *drm)
> >>>>>> +{
> >>>>>> +  return container_of(drm, struct dc_drm_device, base);
> >>>>>> +}
> >>>>>> +
> >>>>>> +int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index);
> >>>>>> +int dc_crtc_post_init(struct dc_drm_device *dc_drm, int crtc_index);
> >>>>>> +
> >>>>>> +int dc_kms_init(struct dc_drm_device *dc_drm);
> >>>>>> +void dc_kms_uninit(struct dc_drm_device *dc_drm);
> >>>>>> +
> >>>>>> +int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
> >>>>>> +
> >>>>>>  extern struct platform_driver dc_cf_driver;
> >>>>>>  extern struct platform_driver dc_ed_driver;
> >>>>>>  extern struct platform_driver dc_de_driver;
> >>>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..2b18aa37a4a8
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/gpu/drm/imx/dc/dc-kms.c
> >>>>>> @@ -0,0 +1,143 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0+
> >>>>>> +/*
> >>>>>> + * Copyright 2024 NXP
> >>>>>> + */
> >>>>>> +
> >>>>>> +#include <linux/of.h>
> >>>>>> +#include <linux/of_graph.h>
> >>>>>> +
> >>>>>> +#include <drm/drm_atomic_helper.h>
> >>>>>> +#include <drm/drm_bridge.h>
> >>>>>> +#include <drm/drm_bridge_connector.h>
> >>>>>> +#include <drm/drm_connector.h>
> >>>>>> +#include <drm/drm_crtc.h>
> >>>>>> +#include <drm/drm_device.h>
> >>>>>> +#include <drm/drm_encoder.h>
> >>>>>> +#include <drm/drm_gem_framebuffer_helper.h>
> >>>>>> +#include <drm/drm_mode_config.h>
> >>>>>> +#include <drm/drm_print.h>
> >>>>>> +#include <drm/drm_probe_helper.h>
> >>>>>> +#include <drm/drm_simple_kms_helper.h>
> >>>>>> +#include <drm/drm_vblank.h>
> >>>>>> +
> >>>>>> +#include "dc-de.h"
> >>>>>> +#include "dc-drv.h"
> >>>>>> +#include "dc-kms.h"
> >>>>>> +
> >>>>>> +static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
> >>>>>> +  .fb_create = drm_gem_fb_create,
> >>>>>> +  .atomic_check = drm_atomic_helper_check,
> >>>>>> +  .atomic_commit = drm_atomic_helper_commit,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
> >>>>>> +                                  int crtc_index)
> >>>>>> +{
> >>>>>> +  struct dc_crtc *dc_crtc = &dc_drm->dc_crtc[crtc_index];
> >>>>>> +  struct drm_device *drm = &dc_drm->base;
> >>>>>> +  struct drm_crtc *crtc = &dc_crtc->base;
> >>>>>> +  struct drm_connector *connector;
> >>>>>> +  struct device *dev = drm->dev;
> >>>>>> +  struct drm_encoder *encoder;
> >>>>>> +  struct drm_bridge *bridge;
> >>>>>> +  int ret;
> >>>>>> +
> >>>>>> +  bridge = devm_drm_of_get_bridge(dev, dc_crtc->de->tc->dev->of_node,
> >>>>>> +                                  0, 0);
> >>>>>> +  if (IS_ERR(bridge)) {
> >>>>>> +          ret = PTR_ERR(bridge);
> >>>>>> +          if (ret == -ENODEV)
> >>>>>> +                  return 0;
> >>>>>> +
> >>>>>> +          return dev_err_probe(dev, ret,
> >>>>>> +                               "failed to find bridge for CRTC%u\n",
> >>>>>> +                               crtc->index);
> >>>>>> +  }
> >>>>>> +
> >>>>>> +  encoder = &dc_drm->encoder[crtc_index];
> >>>>>> +  ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> >>>>>> +  if (ret) {
> >>>>>> +          dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
> >>>>>> +                  crtc->index, ret);
> >>>>>> +          return ret;
> >>>>>> +  }
> >>>>>> +
> >>>>>> +  encoder->possible_crtcs = drm_crtc_mask(crtc);
> >>>>>> +
> >>>>>> +  ret = drm_bridge_attach(encoder, bridge, NULL,
> >>>>>> +                          DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>>> +  if (ret) {
> >>>>>> +          dev_err(dev,
> >>>>>> +                  "failed to attach bridge to encoder for CRTC%u: %d\n",
> >>>>>> +                  crtc->index, ret);
> >>>>>> +          return ret;
> >>>>>> +  }
> >>>>>> +
> >>>>>> +  connector = drm_bridge_connector_init(drm, encoder);
> >>>>>> +  if (IS_ERR(connector)) {
> >>>>>> +          ret = PTR_ERR(connector);
> >>>>>> +          dev_err(dev, "failed to init bridge connector for CRTC%u: %d\n",
> >>>>>> +                  crtc->index, ret);
> >>>>>> +          return ret;
> >>>>>> +  }
> >>>>>> +
> >>>>>> +  ret = drm_connector_attach_encoder(connector, encoder);
> >>>>>> +  if (ret)
> >>>>>> +          dev_err(dev,
> >>>>>> +                  "failed to attach encoder to connector for CRTC%u: %d\n",
> >>>>>> +                  crtc->index, ret);
> >>>>>> +
> >>>>>> +  return ret;
> >>>>>> +}
> >>>>>> +
> >>>>>> +int dc_kms_init(struct dc_drm_device *dc_drm)
> >>>>>> +{
> >>>>>> +  struct drm_device *drm = &dc_drm->base;
> >>>>>> +  int ret, i;
> >>>>>> +
> >>>>>> +  ret = drmm_mode_config_init(drm);
> >>>>>> +  if (ret)
> >>>>>> +          return ret;
> >>>>>> +
> >>>>>> +  drm->mode_config.min_width = 60;
> >>>>>> +  drm->mode_config.min_height = 60;
> >>>>>> +  drm->mode_config.max_width = 8192;
> >>>>>> +  drm->mode_config.max_height = 8192;
> >>>>>> +  drm->mode_config.funcs = &dc_drm_mode_config_funcs;
> >>>>>> +
> >>>>>> +  drm->vblank_disable_immediate = true;
> >>>>>> +  drm->max_vblank_count = DC_FRAMEGEN_MAX_FRAME_INDEX;
> >>>>>> +
> >>>>>> +  for (i = 0; i < DC_DISPLAYS; i++) {
> >>>>>> +          ret = dc_crtc_init(dc_drm, i);
> >>>>>> +          if (ret)
> >>>>>> +                  return ret;
> >>>>>> +
> >>>>>> +          ret = dc_kms_init_encoder_per_crtc(dc_drm, i);
> >>>>>> +          if (ret)
> >>>>>> +                  return ret;
> >>>>>> +  }
> >>>>>> +
> >>>>>> +  for (i = 0; i < DC_DISPLAYS; i++) {
> >>>>>> +          ret = dc_crtc_post_init(dc_drm, i);
> >>>>>
> >>>>> Can you use .late_register for this?
> >>>>
> >>>> Kerneldoc of struct drm_crtc_funcs::late_register says it's used to register
> >>>> additional userspace interfaces like debugfs interfaces. And, it seems that
> >>>> everyone implementing this uses it to add debugfs interfaces. So, it will
> >>>> kind of abuse it to do CRTC post initialization.
> >>>
> >>> Why can't they be requested earlier then?
> >>
> >> If I request them earlier in dc_crtc_init(), then they cannot be freed by
> >> devm_irq_release() when devm_drm_of_get_bridge() called by
> >> dc_kms_init_encoder_per_crtc() returns -EPROBE_DEFER(which means failing
> >> to find the first DRM bridge for the CRTC).  Why can't they be freed by
> >> devm_irq_release()?  Because they are requested by the devices of ExtDsts
> >> and Display Engines and their drivers are not removed during the probe
> >> deferral dance.  Furthermore, -EPROBE_DEFER won't be returned after
> >> dc_crtc_post_init() since the later called drm_vblank_init() doesn't
> >> return -EPROBE_DEFER anyway, so it's fine to call dc_crtc_post_init() here.
> >>
> >> I met the irq free issue on my i.MX8qxp MEK board before, i.e., -EBUSY is
> >> returned when requesting them again, so it's tested.
> >
> > A typical solution is to request all resources before binding the
> > device as a component. Don't tell me that your interrupt controller is
> > another component of the DRM device :-)
>
> The IRQ handlers are _highly_ related to the CRTC driver(especially the
> dc_crtc_dec_framecomplete_irq_handler() where vblank is handled), so maybe
> it's more appropriate to request the IRQs and implement the IRQ handlers in
> dc-crtc.c instead of doing them in dc-{de,ed}.c. No?

And CRTCs don't exist before master_bind(). Ack.

-- 
With best wishes
Dmitry
