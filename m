Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653174400B1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 18:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13BA6E15E;
	Fri, 29 Oct 2021 16:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19DF6E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:55:12 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z14so17184254wrg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gfVkEHpdBtWqt01d6C0hwgm97z1TIBlCEjs4ZFs4TA4=;
 b=VY4KqC0sKehgeEijN1AyzYebc27u+stHhXKhHnvNzZ+Fy97GkFCV8A3SlsMWusrfzM
 cRpX5qV9Gs8taKNtrEkXA9oNpngITpLSqTCRCK92s8YKbAE8acswmA/vpuyNsGKdOmwI
 WVuihVIjg4OR03u+7dsouP5CvSpfFSVRvHLfufMUso5EZT0vBPBtYAMzDenm5aPEyxSs
 Va/sb4pxSApCyLPLaY9EHN2VlfoojvMol1xN6Pc8K5qkqe0uJjjslb/z5kVK8OhTafb9
 EkDdzq/HR0tA5sEjmvYi7cdeqWxbfpN0YlBEgGXF++dap/mqRzG05x2v+laHSnkGcudH
 E3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gfVkEHpdBtWqt01d6C0hwgm97z1TIBlCEjs4ZFs4TA4=;
 b=1wVBUPANAGdjncQazLQAdQ4hFciTZwo+XZKzgb+zZcKpB9fuuAoywWHhADEEGIBIU0
 TI4YGIxXae40A/r1evfTH15sM3EEnn8TVQ9lZfyYwd/G6TgeAMXkY+0h4xKOmOOJDK6j
 VDMRlzjzJrV9XrfJr56kaGm9dDJBDUpr+tUz2km9ZvkjRk6I+Lb23raEHhRXOhIB8Zu3
 EjioCosDaWM24jTqR4d9jqyxB5BnZtEzKSdljoZTNe3K1X92LYSg2e/HWKVjjoCUVT2/
 bQAvdPPO/mnSS7koKCmNPoQ6hg0Abdk0aMeUacG+nOyB/DXFcQqp5gVRv5EI3AwDu6xr
 Wzgg==
X-Gm-Message-State: AOAM533hkfPNQZJqFA19iBD5rGRFFigto/xNnJktqNkhxO2mhgWc4NJv
 dOylYhIRJfhErV8wqfNZRlC6/oiic5aEslFQ02o=
X-Google-Smtp-Source: ABdhPJzAxAti/A+jDIDa9TQ6zE8i7JBXuosYOyK4I2IwY4HqaeuVZMXKhS54fKIwndK3xD3CSlYD438Ps9vBWpHsLBM=
X-Received: by 2002:a5d:604b:: with SMTP id j11mr15375512wrt.162.1635526511336; 
 Fri, 29 Oct 2021 09:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181240.213806-1-paul@crapouillou.net>
 <20211026181240.213806-3-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-3-paul@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Fri, 29 Oct 2021 18:55:00 +0200
Message-ID: <CAFsFa85xQzfcbX6dVd7E0wbucV8da1JuXbEsG=jUQ2o7GwqTNA@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/6] drm/ingenic: Add support for private objects
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie <paul@boddie.org.uk>,
 list@opendingux.net, 
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>

On Tue, Oct 26, 2021 at 8:12 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Until now, the ingenic-drm as well as the ingenic-ipu drivers used to
> put state-specific information in their respective private structure.
>
> Add boilerplate code to support private objects in the two drivers, so
> that state-specific information can be put in the state-specific private
> structure.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 61 +++++++++++++++++++++++
>  drivers/gpu/drm/ingenic/ingenic-ipu.c     | 54 ++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 95c12c2aba14..5dbeca0f8f37 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -64,6 +64,10 @@ struct jz_soc_info {
>         unsigned int num_formats_f0, num_formats_f1;
>  };
>
> +struct ingenic_drm_private_state {
> +       struct drm_private_state base;
> +};
> +
>  struct ingenic_drm {
>         struct drm_device drm;
>         /*
> @@ -99,8 +103,16 @@ struct ingenic_drm {
>         struct mutex clk_mutex;
>         bool update_clk_rate;
>         struct notifier_block clock_nb;
> +
> +       struct drm_private_obj private_obj;
>  };
>
> +static inline struct ingenic_drm_private_state *
> +to_ingenic_drm_priv_state(struct drm_private_state *state)
> +{
> +       return container_of(state, struct ingenic_drm_private_state, base);
> +}
> +
>  static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
>  {
>         switch (reg) {
> @@ -766,6 +778,28 @@ ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
>         return &obj->base;
>  }
>
> +static struct drm_private_state *
> +ingenic_drm_duplicate_state(struct drm_private_obj *obj)
> +{
> +       struct ingenic_drm_private_state *state = to_ingenic_drm_priv_state(obj->state);
> +
> +       state = kmemdup(state, sizeof(*state), GFP_KERNEL);
> +       if (!state)
> +               return NULL;
> +
> +       __drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> +
> +       return &state->base;
> +}
> +
> +static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
> +                                     struct drm_private_state *state)
> +{
> +       struct ingenic_drm_private_state *priv_state = to_ingenic_drm_priv_state(state);
> +
> +       kfree(priv_state);
> +}
> +
>  DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>
>  static const struct drm_driver ingenic_drm_driver_data = {
> @@ -836,6 +870,11 @@ static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
>         .atomic_commit_tail = drm_atomic_helper_commit_tail,
>  };
>
> +static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
> +       .atomic_duplicate_state = ingenic_drm_duplicate_state,
> +       .atomic_destroy_state = ingenic_drm_destroy_state,
> +};
> +
>  static void ingenic_drm_unbind_all(void *d)
>  {
>         struct ingenic_drm *priv = d;
> @@ -877,9 +916,15 @@ static void ingenic_drm_configure_hwdesc_plane(struct ingenic_drm *priv,
>         ingenic_drm_configure_hwdesc(priv, plane, plane, 0xf0 | plane);
>  }
>
> +static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *private_obj)
> +{
> +       drm_atomic_private_obj_fini(private_obj);
> +}
> +
>  static int ingenic_drm_bind(struct device *dev, bool has_components)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> +       struct ingenic_drm_private_state *private_state;
>         const struct jz_soc_info *soc_info;
>         struct ingenic_drm *priv;
>         struct clk *parent_clk;
> @@ -1148,6 +1193,20 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>                 goto err_devclk_disable;
>         }
>
> +       private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
> +       if (!private_state) {
> +               ret = -ENOMEM;
> +               goto err_clk_notifier_unregister;
> +       }
> +
> +       drm_atomic_private_obj_init(drm, &priv->private_obj, &private_state->base,
> +                                   &ingenic_drm_private_state_funcs);
> +
> +       ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
> +                                      &priv->private_obj);
> +       if (ret)
> +               goto err_private_state_free;
> +
>         ret = drm_dev_register(drm, 0);
>         if (ret) {
>                 dev_err(dev, "Failed to register DRM driver\n");
> @@ -1158,6 +1217,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>
>         return 0;
>
> +err_private_state_free:
> +       kfree(private_state);
>  err_clk_notifier_unregister:
>         clk_notifier_unregister(parent_clk, &priv->clock_nb);
>  err_devclk_disable:
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index aeb8a757d213..c819293b8317 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -45,6 +45,10 @@ struct soc_info {
>                           unsigned int weight, unsigned int offset);
>  };
>
> +struct ingenic_ipu_private_state {
> +       struct drm_private_state base;
> +};
> +
>  struct ingenic_ipu {
>         struct drm_plane plane;
>         struct drm_device *drm;
> @@ -60,6 +64,8 @@ struct ingenic_ipu {
>
>         struct drm_property *sharpness_prop;
>         unsigned int sharpness;
> +
> +       struct drm_private_obj private_obj;
>  };
>
>  /* Signed 15.16 fixed-point math (for bicubic scaling coefficients) */
> @@ -73,6 +79,12 @@ static inline struct ingenic_ipu *plane_to_ingenic_ipu(struct drm_plane *plane)
>         return container_of(plane, struct ingenic_ipu, plane);
>  }
>
> +static inline struct ingenic_ipu_private_state *
> +to_ingenic_ipu_priv_state(struct drm_private_state *state)
> +{
> +       return container_of(state, struct ingenic_ipu_private_state, base);
> +}
> +
>  /*
>   * Apply conventional cubic convolution kernel. Both parameters
>   *  and return value are 15.16 signed fixed-point.
> @@ -679,6 +691,33 @@ static const struct drm_plane_funcs ingenic_ipu_plane_funcs = {
>         .atomic_set_property    = ingenic_ipu_plane_atomic_set_property,
>  };
>
> +static struct drm_private_state *
> +ingenic_ipu_duplicate_state(struct drm_private_obj *obj)
> +{
> +       struct ingenic_ipu_private_state *state = to_ingenic_ipu_priv_state(obj->state);
> +
> +       state = kmemdup(state, sizeof(*state), GFP_KERNEL);
> +       if (!state)
> +               return NULL;
> +
> +       __drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> +
> +       return &state->base;
> +}
> +
> +static void ingenic_ipu_destroy_state(struct drm_private_obj *obj,
> +                                     struct drm_private_state *state)
> +{
> +       struct ingenic_ipu_private_state *priv_state = to_ingenic_ipu_priv_state(state);
> +
> +       kfree(priv_state);
> +}
> +
> +static const struct drm_private_state_funcs ingenic_ipu_private_state_funcs = {
> +       .atomic_duplicate_state = ingenic_ipu_duplicate_state,
> +       .atomic_destroy_state = ingenic_ipu_destroy_state,
> +};
> +
>  static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
>  {
>         struct ingenic_ipu *ipu = arg;
> @@ -717,6 +756,7 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
>  static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> +       struct ingenic_ipu_private_state *private_state;
>         const struct soc_info *soc_info;
>         struct drm_device *drm = d;
>         struct drm_plane *plane;
> @@ -810,7 +850,20 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
>                 return err;
>         }
>
> +       private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
> +       if (!private_state) {
> +               err = -ENOMEM;
> +               goto err_clk_unprepare;
> +       }
> +
> +       drm_atomic_private_obj_init(drm, &ipu->private_obj, &private_state->base,
> +                                   &ingenic_ipu_private_state_funcs);
> +
>         return 0;
> +
> +err_clk_unprepare:
> +       clk_unprepare(ipu->clk);
> +       return err;
>  }
>
>  static void ingenic_ipu_unbind(struct device *dev,
> @@ -818,6 +871,7 @@ static void ingenic_ipu_unbind(struct device *dev,
>  {
>         struct ingenic_ipu *ipu = dev_get_drvdata(dev);
>
> +       drm_atomic_private_obj_fini(&ipu->private_obj);
>         clk_unprepare(ipu->clk);
>  }
>
> --
> 2.33.0
>
