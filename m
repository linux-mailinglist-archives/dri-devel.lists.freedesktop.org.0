Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC67B7317
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 23:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DC910E31B;
	Tue,  3 Oct 2023 21:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13A10E31B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 21:11:50 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a1f00b75aaso16644037b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696367510; x=1696972310; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TfxDtijsU/A62NyvsK23Kej6jVvl6v8DWcOLSJPA8yU=;
 b=mwWzxB8lDY5hzsyfCf8WDrlDcpUpchkanQhNgR8oOKatl4xCRoTB1cB2wvFPYdgqvU
 4NG+Mb1Xn+NT7G+qkI3Pcz2UfOeZyG3eWQ041aJSW2JLxhqLPDrRyh2O9ulJjKccOqVe
 eOlMQ6Q10+JkRmscUbXZjRoAK+rs05JHPIQpAJr0G9SNJBNoXUEp3X9T+cnKxdLAnt45
 9id9Eby7pHaagJ1J25LqgiVJnzI0IMKVRDfvylItTHXIckSvzd9MbGydN0P0mFbPblbK
 m+j7eMEmo/+VauHWQj3Jszap0iGOWnayOLgQp3NGEgzgMtiZM7m3DkQx50vBWeRNuNpU
 ZfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696367510; x=1696972310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfxDtijsU/A62NyvsK23Kej6jVvl6v8DWcOLSJPA8yU=;
 b=YJ239PP8SwFm655lNTbuCwZYjBRB6OkCIQRLYMxuTUM0ndkW0u2PisIfb7L31eTJe1
 yc6w+A6J0X+aj9ykQkOWjXeDzsxhVcNS7wv/U0+BS9VVh9UJ1WH9S4KHctC0XEI813gC
 4UH/9lFMOv8tSGjWgcyNRVeobcPCfwqU0BwFVNTchxpE5EKyZ+PU1jUKrYGUdO/XULoX
 V8qDr8jSX2Duen9YYN30XyxWbms/gb0u61qCJkKuItKC/hxElUnV/G0SXmq0FxGCE834
 oFMkWv2zGNfa9HIEzJoQjqZQZfhmkW1sOub/ssOXztEZc5PaN3E6+UKzF0oVzGz6+156
 Pjpw==
X-Gm-Message-State: AOJu0Yz1Rlp+ibLrOBij6o6Rg/Rk3lTEmmzaA5TUU3n7tc0th2XLxQG9
 lcWj76iomz6KA9O4tIcxV30si5Sy8v+ZD+YgKSdgDg==
X-Google-Smtp-Source: AGHT+IFLs3Up9mRrT7uqjVWQ2HpVwb7VjjO/TsJKD4Hf68gSmLT/bVUgVrKHnaoe5fJZNFQ3RM24w/I1lIFVM8Qk+04=
X-Received: by 2002:a0d:ca02:0:b0:589:a4c6:a4ed with SMTP id
 m2-20020a0dca02000000b00589a4c6a4edmr791250ywd.3.1696367509732; Tue, 03 Oct
 2023 14:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
 <2d8d4354-6dbb-e810-6efb-ca6b31f71b45@quicinc.com>
 <e7576c3b-82d2-4902-a19c-af2878ef7dbd@linaro.org>
 <f2fbcf6e-65cf-c078-e11f-1ca74960a71e@quicinc.com>
In-Reply-To: <f2fbcf6e-65cf-c078-e11f-1ca74960a71e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Oct 2023 00:11:38 +0300
Message-ID: <CAA8EJpq6VOBx+E94bs39qXzNN1KBJL+Cbf_KMPJC1PcNoHO3wA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Oct 2023 at 23:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 10/3/2023 10:56 AM, Dmitry Baryshkov wrote:
> > On 03/10/2023 20:25, Kuogee Hsieh wrote:
> >>
> >> On 9/27/2023 2:57 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh
> >>> <quic_khsieh@quicinc.com> wrote:
> >>>> Currently eDP population is done at msm_dp_modeset_init() which happen
> >>>> at binding time. Move eDP population to be done at display probe time
> >>>> so that probe deferral cases can be handled effectively.
> >>>> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
> >>>> to ensure eDP's HPD is up before proceeding eDP population.
> >>>>
> >>>> Changes in v4:
> >>>> -- delete duplicate initialize code to dp_aux before
> >>>> drm_dp_aux_register()
> >>>> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline
> >>>> the function
> >>>> -- not initialize rc = 0
> >>>>
> >>>> Changes in v3:
> >>>> -- add done_probing callback into devm_of_dp_aux_populate_bus()
> >>>>
> >>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
> >>>>   drivers/gpu/drm/msm/dp/dp_display.c | 69
> >>>> ++++++++++++++++++-------------------
> >>>>   2 files changed, 60 insertions(+), 43 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> index 22eb774..425b5c5 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> @@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> >>>>
> >>>>   int dp_aux_register(struct drm_dp_aux *dp_aux)
> >>>>   {
> >>>> -       struct dp_aux_private *aux;
> >>>>          int ret;
> >>>>
> >>>>          if (!dp_aux) {
> >>>> @@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
> >>>>                  return -EINVAL;
> >>>>          }
> >>>>
> >>>> -       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >>>> -
> >>>> -       aux->dp_aux.name = "dpu_dp_aux";
> >>>> -       aux->dp_aux.dev = aux->dev;
> >>>> -       aux->dp_aux.transfer = dp_aux_transfer;
> >>>> -       ret = drm_dp_aux_register(&aux->dp_aux);
> >>>> +       ret = drm_dp_aux_register(dp_aux);
> >>>>          if (ret) {
> >>>>                  DRM_ERROR("%s: failed to register drm aux: %d\n",
> >>>> __func__,
> >>>>                                  ret);
> >>>> @@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
> >>>>          drm_dp_aux_unregister(dp_aux);
> >>>>   }
> >>>>
> >>>> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
> >>>> +                                unsigned long wait_us)
> >>>> +{
> >>>> +       int ret;
> >>>> +       struct dp_aux_private *aux;
> >>>> +
> >>>> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >>>> +
> >>>> +       pm_runtime_get_sync(aux->dev);
> >>>> +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> >>>> +       pm_runtime_put_sync(aux->dev);
> >>> Ok, so here you have used put_sync instead of autosuspend. Can we have
> >>> some uniformity? (I'd prefer to see put_sync or just put everywhere)
> >>
> >>
> >> my point is,
> >>
> >> since display is user interface,
> >>
> >> if there has any inputs before timer expire then there is no reason
> >> to execute  pm_runtime_suspend().
> >>
> >> otherwise pm_runtime_suspend() should be executed.
> >>
> >> Therefore I used autosuspend  at aux_transfer() an
> >> ddp_bridge_atomic_post_disable().
> >>
> >> here is not related to user interface so that i use put_sysn() directly.
> >>
> >> is my point make sense?
> >>
> >>   or should I drop all autosuspend and replace them with put_sync()?
> >
> > This was my question from the beginning: what was the reason for using
> > autosuspend? Did it bring any sensible improvement in the disable &
> > reenable path?
>
> ok, i got your point.
>
> 1) I will use put_sync() at dp_bridge_atomic_dsiable() and
> dp_bridge_hpd_disable() instead of put_autosuspend().
>
> 2) keep pm_runtime_put_autosuspend() at dp_aux_transfer().

Why? The panel driver should take care about keeping DP on between transfers.

>
> Is this good?
>
> >
> >>
> >>
> >>>
> >>>> +
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct
> >>>> dp_catalog *catalog,
> >>>>                                bool is_edp)
> >>>>   {
> >>>> @@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device
> >>>> *dev, struct dp_catalog *catalog,
> >>>>          aux->catalog = catalog;
> >>>>          aux->retry_cnt = 0;
> >>>>
> >>>> +       /*
> >>>> +        * Use the drm_dp_aux_init() to use the aux adapter
> >>>> +        * before registering aux with the DRM device so that
> >>>> +        * msm edp panel can be detected by generic_dep_panel_probe().
> >>> eDP, AUX, generic_edp_panel_probe().
> >>>
> >>>> +        */
> >>>> +       aux->dp_aux.name = "dpu_dp_aux";
> >>>> +       aux->dp_aux.dev = dev;
> >>>> +       aux->dp_aux.transfer = dp_aux_transfer;
> >>>> +       aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
> >>>> +       drm_dp_aux_init(&aux->dp_aux);
> >>>> +
> >>>>          return &aux->dp_aux;
> >>>>   }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index 711d262..9a2b403 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1203,6 +1203,28 @@ static const struct msm_dp_desc
> >>>> *dp_display_get_desc(struct platform_device *pde
> >>>>          return NULL;
> >>>>   }
> >>>>
> >>>> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> >>>> +{
> >>>> +       int rc;
> >>>> +
> >>>> +       rc = component_add(aux->dev, &dp_display_comp_ops);
> >>>> +       if (rc)
> >>>> +               DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> >>> drop.
> >>>
> >>>> +
> >>>> +       return rc;
> >>>> +}
> >>>> +
> >>>> +static inline int dp_display_auxbus_population(struct
> >>>> dp_display_private *dp)
> >>> It's not `population`. It is just `populate`.
> >>>
> >>> Also please inline this function.
> >>>
> >>>
> >>>> +{
> >>>> +       int ret;
> >>>> +
> >>>> +       ret = devm_of_dp_aux_populate_bus(dp->aux,
> >>>> dp_auxbus_done_probe);
> >>>> +       if (ret == -ENODEV)
> >>>> +               DRM_ERROR("aux-bus not found\n");
> >>>> +
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>>   static int dp_display_probe(struct platform_device *pdev)
> >>>>   {
> >>>>          int rc = 0;
> >>>> @@ -1271,10 +1293,16 @@ static int dp_display_probe(struct
> >>>> platform_device *pdev)
> >>>>          if (rc)
> >>>>                  return rc;
> >>>>
> >>>> -       rc = component_add(&pdev->dev, &dp_display_comp_ops);
> >>>> -       if (rc) {
> >>>> -               DRM_ERROR("component add failed, rc=%d\n", rc);
> >>>> -               dp_display_deinit_sub_modules(dp);
> >>>> +       if (dp->dp_display.is_edp) {
> >>>> +               rc = dp_display_auxbus_population(dp);
> >>>> +               if (rc)
> >>>> +                       DRM_ERROR("eDP auxbus population failed,
> >>>> rc=%d\n", rc);
> >>>> +       } else {
> >>>> +               rc = component_add(&pdev->dev, &dp_display_comp_ops);
> >>>> +               if (rc) {
> >>>> +                       DRM_ERROR("component add failed, rc=%d\n",
> >>>> rc);
> >>>> +                       dp_display_deinit_sub_modules(dp);
> >>>> +               }
> >>>>          }
> >>>>
> >>>>          return rc;
> >>>> @@ -1285,8 +1313,6 @@ static int dp_display_remove(struct
> >>>> platform_device *pdev)
> >>>>          struct dp_display_private *dp =
> >>>> dev_get_dp_display_private(&pdev->dev);
> >>>>
> >>>>          component_del(&pdev->dev, &dp_display_comp_ops);
> >>>> -       dp_display_deinit_sub_modules(dp);
> >>>> -
> >>>>          platform_set_drvdata(pdev, NULL);
> >>>>
> >>>>          dp_display_deinit_sub_modules(dp);
> >>>> @@ -1385,29 +1411,8 @@ static int dp_display_get_next_bridge(struct
> >>>> msm_dp *dp)
> >>>>   {
> >>>>          int rc;
> >>>>          struct dp_display_private *dp_priv;
> >>>> -       struct device_node *aux_bus;
> >>>> -       struct device *dev;
> >>>>
> >>>>          dp_priv = container_of(dp, struct dp_display_private,
> >>>> dp_display);
> >>>> -       dev = &dp_priv->pdev->dev;
> >>>> -       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> >>>> -
> >>>> -       if (aux_bus && dp->is_edp) {
> >>>> -               /*
> >>>> -                * The code below assumes that the panel will
> >>>> finish probing
> >>>> -                * by the time devm_of_dp_aux_populate_ep_devices()
> >>>> returns.
> >>>> -                * This isn't a great assumption since it will fail
> >>>> if the
> >>>> -                * panel driver is probed asynchronously but is the
> >>>> best we
> >>>> -                * can do without a bigger driver reorganization.
> >>>> -                */
> >>>> -               rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
> >>>> -               of_node_put(aux_bus);
> >>>> -               if (rc)
> >>>> -                       goto error;
> >>>> -       } else if (dp->is_edp) {
> >>>> -               DRM_ERROR("eDP aux_bus not found\n");
> >>>> -               return -ENODEV;
> >>>> -       }
> >>>>
> >>>>          /*
> >>>>           * External bridges are mandatory for eDP interfaces: one
> >>>> has to
> >>>> @@ -1420,17 +1425,9 @@ static int dp_display_get_next_bridge(struct
> >>>> msm_dp *dp)
> >>>>          if (!dp->is_edp && rc == -ENODEV)
> >>>>                  return 0;
> >>>>
> >>>> -       if (!rc) {
> >>>> +       if (!rc)
> >>>>                  dp->next_bridge = dp_priv->parser->next_bridge;
> >>>> -               return 0;
> >>>> -       }
> >>>>
> >>>> -error:
> >>>> -       if (dp->is_edp) {
> >>>> -               of_dp_aux_depopulate_bus(dp_priv->aux);
> >>>> -               dp_display_host_phy_exit(dp_priv);
> >>>> -               dp_display_host_deinit(dp_priv);
> >>>> -       }
> >>>>          return rc;
> >>>>   }
> >>>>
> >>>> --
> >>>> 2.7.4
> >>>>
> >>>
> >



-- 
With best wishes
Dmitry
