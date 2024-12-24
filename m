Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D89FB9F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269D10E4AB;
	Tue, 24 Dec 2024 06:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yiaJ62Iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E410E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:44:13 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e39841c8fd6so4293821276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 22:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735022652; x=1735627452; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
 b=yiaJ62Iy8oFfXh/dcvNqY/uck4CTXERGZ8ALtIvNzXmATnOR0TS0W4jLxiM2PszOde
 heQ4JRgZiY1Lp8uwR+1BMaEY8r6DAEkY4S13y16i+KXbf7FoqfmGzNNTRfBch4kiJOyK
 2viTJ/uabHw2uv6SNYTAZg2VD0b8sbkQk/RQZYDx2kwfZ3/ntxmXReW0ovRvpCnf84v1
 PHH4PPoPpP5rz5Y1Yw6rMF9+HiNeJ9kl+q52JYh664fs0wu4KhVrjvnuDVC34gXMdn3/
 uJkB2LttlbjFvOnT9CBL9XEmi+iNavROQXOvrfWISRJy+gyj48xDchEd0Hank7KS8fWt
 5jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735022652; x=1735627452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
 b=QVrTgyu0Z/jMwmzZxn3Jt8N71pTurQw4raBQ9eUMUHicWPi29zR2M1eUGNutQmd8RX
 rT7/Zf2e3XWLRO6RZqdcdL2Z+AUByXCp10T+cyuc+3mP1Gdp3ei+MhYpeN6m29L8lTID
 i8dIYlCmZ0l8vuy7n3XV3JWOr0JdX/B7G/aZGqYPLZT5d69ygzVsVxlPSFPbRioyLKsi
 4vP8SeopIPVI3NhQxaO7EjYhqIhO7yeoxVCKjNau9AYgntHNKbprKxpE8Kod2Q1BMvYh
 fOFQMFHLwo7cPBUWFU8hid/xSqF447OwIkLuQflGiHpeDwpu5Iwrbe/H6js5Lbhy04TJ
 WQZQ==
X-Gm-Message-State: AOJu0YzZipk19wmsyM0RPNmHKDGT/WwGr86vrYd1GUQIq0Jn9NFVZWJ0
 Bzz9kwCnC0ZSJACLvEoG5bVAER1gV9kQyTtuFRZfwLnGsbmIW+Y1Nh6yrzjXB8Tbb0T8SvDxp/R
 SaLO6Dr/l9M+YpHOl0wl349SKZ/xxqcGmr8Qlhw==
X-Gm-Gg: ASbGncvjFM5WR9IieVLyqiJJBUswrCnDI1ZTtwWFDbGuSa/+kfYP0rVhp2PL5NcTRD1
 AgaGACJdqVfY0fjkbmqA+QiTagpIc9bgd7SAlejXUXrGk8G5NVnkI
X-Google-Smtp-Source: AGHT+IH+tUx3wsKXoRccfhQ9sC/ui1pPyLa1/HDfJqJRr5j8UEnntJ1fSPiiiZze29cEu6LVIRZLDndyqvIvmsnlI1A=
X-Received: by 2002:a05:690c:6182:b0:6ef:5fee:1ca6 with SMTP id
 00721157ae682-6f3f8110472mr107964417b3.18.1735022652292; Mon, 23 Dec 2024
 22:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
 <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
 <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
In-Reply-To: <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 08:44:01 +0200
Message-ID: <CAA8EJpom94QfZm5es7i1eVpzeL0svQYDEcGzd0atbgNYCv1osA@mail.gmail.com>
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
 agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
 frank.li@nxp.com
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

On Tue, 24 Dec 2024 at 08:21, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller display engine consists of all processing
> >> units that operate in a display clock domain.  Add minimal feature
> >> support with FrameGen and TCon so that the engine can output display
> >> timings.  The FrameGen driver, TCon driver and display engine driver
> >> are components to be aggregated by a master registered in the upcoming
> >> DRM driver.
> >>
> >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Add kernel doc for struct dc_drm_device. (Dmitry)
> >> * Fix regmap_config definitions by correcting name field, correcting read
> >>   ranges and setting max_register field.
> >> * Get instance numbers from device data(compatible strings) instead of OF
> >>   aliases.
> >
> > Unfortunately no. Your instances are compatible on the hardware level
> > (at least they were with the previous versions, I don't think that
> > there was a silicon change).
>
> v5/v6 use OF aliases to the instance numbers, but in v6 Rob said it's
> abusing aliases because the aliases contain display controller instance
> number, like "dc0-display-engine0"(i.MX8QM SoC has two display controllers).
> Or, use OF graph to describe all connections between the display controller's
> internal devices, but it's too complex. So, I choose to add the instance
> numbers to compatible strings.
>
> >
> >> * Collect Maxime's R-b tag.
> >> * Trivial tweaks.
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> >> * Select REGMAP and REGMAP_MMIO Kconfig options.
> >> * Fix commit message to state that display engine driver is a component driver
> >>   instead of a master/aggregate driver.
> >>
> >> v4:
> >> * Use regmap to define register map for all registers. (Dmitry)
> >> * Use regmap APIs to access registers. (Dmitry)
> >> * Inline some small functions. (Dmitry)
> >> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
> >>   KMS routine to initialization stage. (Dmitry)
> >> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> >> * Drop unnecessary private struct dc_*_priv.
> >> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
> >>   interfaces to bind/unbind the drivers.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Use OF alias id to get instance id.
> >> * Add dev member to struct dc_tc.
> >>
> >>  drivers/gpu/drm/imx/Kconfig     |   1 +
> >>  drivers/gpu/drm/imx/Makefile    |   1 +
> >>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
> >>  drivers/gpu/drm/imx/dc/Makefile |   5 +
> >>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
> >>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
> >>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
> >>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
> >>  10 files changed, 810 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> >>
> >
> > [...]
> >
> >> +
> >> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base_top;
> >> +    struct dc_de *de;
> >> +    int ret;
> >> +
> >> +    de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> >> +    if (!de)
> >> +            return -ENOMEM;
> >> +
> >> +    de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> >> +    if (IS_ERR(base_top))
> >> +            return PTR_ERR(base_top);
> >> +
> >> +    de->reg_top = devm_regmap_init_mmio(dev, base_top,
> >> +                                        &dc_de_top_regmap_config);
> >> +    if (IS_ERR(de->reg_top))
> >> +            return PTR_ERR(de->reg_top);
> >> +
> >> +    de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
> >
> > Nit: shdload or shdld? Which one is used in the documentation?
> >
> >> +    if (de->irq_shdld < 0)
> >> +            return de->irq_shdld;
> >> +
> >> +    de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> >> +    if (de->irq_framecomplete < 0)
> >> +            return de->irq_framecomplete;
> >> +
> >> +    de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> >> +    if (de->irq_seqcomplete < 0)
> >> +            return de->irq_seqcomplete;
> >> +
> >> +    de->dev = dev;
> >> +
> >> +    dev_set_drvdata(dev, de);
> >> +
> >> +    ret = devm_pm_runtime_enable(dev);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    dc_drm->de[de->id] = de;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
> > [...]
> >
> >> +
> >> +struct dc_de {
> >> +    struct device *dev;
> >> +    struct regmap *reg_top;
> >> +    struct dc_fg *fg;
> >> +    struct dc_tc *tc;
> >> +    int irq_shdld;
> >> +    int irq_framecomplete;
> >> +    int irq_seqcomplete;
> >> +    enum dc_de_id id;
> >
> > Why do you need to store it? This patch makes use of it just for the
> > registration.
>
> dc-crtc.c added in patch 12 would reference de->id. If no strong opinions,
> I'd keep this as-is.

Patch 12 uses de->id for two purposes: to assign dc_drm->de[ID] and to
include ID into error messages. It might be better to use the DE
device in dev_err instead of using generic DRM device and de->id.

>
> >
> >> +};
> >> +
> >
> > [...]
> >
> >> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base;
> >> +    enum dc_fg_id id;
> >> +    struct dc_fg *fg;
> >> +    struct dc_de *de;
> >> +
> >> +    fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> >> +    if (!fg)
> >> +            return -ENOMEM;
> >> +
> >> +    id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base = devm_platform_ioremap_resource(pdev, 0);
> >> +    if (IS_ERR(base))
> >> +            return PTR_ERR(base);
> >> +
> >> +    fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> >> +    if (IS_ERR(fg->reg))
> >> +            return PTR_ERR(fg->reg);
> >> +
> >> +    fg->clk_disp = devm_clk_get(dev, NULL);
> >> +    if (IS_ERR(fg->clk_disp))
> >> +            return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> >> +                                 "failed to get display clock\n");
> >> +
> >> +    fg->dev = dev;
> >> +
> >> +    de = dc_drm->de[id];
> >
> > This depends on a particular order of component's being bound. If the
> > order changes for whatever reason (e.g. due to component.c
> > implementation being changed) then your driver might crash here.
>
> Nope. There is no chance to crash here, because
> 1) dc_drm is not NULL here
> dc_drm is allocated in dc_drm_bind() and before component_bind_all() is
> called.  dc_fg_bind() is called by component_bind_all().
>
> 2) dc_drm->de[id] is not NULL here
> It's already set by dc_de_bind(), because component_bind_all() binds
> components in match order and the component match for DE is added before
> the one for FG(DE is a child device of display controller and FG is a
> _grandchild_ of display controller).
>
> component_bind_all():
>         /* Bind components in match order */
>         for (i = 0; i < adev->match->num; i++)
>                 if (!adev->match->compare[i].duplicate) {
>                         c = adev->match->compare[i].component;
>                         ret = component_bind(c, adev, data);

Yes, this depends on the particular behaviour of both
component_bind_all() (which is not documented this way, so somebody
might decide to optimise things somehow) and of your component
management. While you have control on the latter, you don't have
control on the former code.

Please, don't depend on the undocumented behaviour!

>
> dc_add_components():
>         for_each_available_child_of_node(dev->of_node, child) {
>                 ...
>
>                 drm_of_component_match_add(dev, matchptr, component_compare_of,
>                                            child);
>
>                 for_each_available_child_of_node(child, grandchild)
>                         drm_of_component_match_add(dev, matchptr,
>                                                    component_compare_of,
>                                                    grandchild);
>         }
>
> >
> > This applies to several other places in the driver.
>
> I don't see any other potential crash caused by the binding order of the
> components.
>
> >
> >> +    de->fg = fg;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
>
> --
> Regards,
> Liu Ying



-- 
With best wishes
Dmitry
