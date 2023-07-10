Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A174DD4E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437A710E2C0;
	Mon, 10 Jul 2023 18:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C7F10E185
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 18:24:51 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b5d1498670so3969679a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689013490; x=1691605490;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5fYArT4F4wyQhowae//dXBBkxIpu1Zo/tKwap9qaUSc=;
 b=L3dTBdKUkIywU38zEpkMs0y8Xfj7JHyFZvd45bFXZU26770otkc1ngWqbDzoiOOoVy
 ETf8E+Gc6EAhgHnv82ya2BY0SzRU3V3tBXGK9x8KQ+ndaR8nVuPn56ZwbfxPuGMjzbOC
 6SRu/t4OHyhbspY87kpH9P1shufo26VcUI8zfV3T9WfgZHz9+jCOHLWXTiJf3sJtoIz8
 W+OrK1DwYMX1eOzNdNbUACJ99Fa8p+dQzRBCiozv/TgMXGY78pPju3xPuTgzO6ZlDrfz
 f02cIkADqeMC/GNdIwvLze6wDllGu7HYyBm8dXRAwY33gtmxvvtJNw+TBY113IeFFgUv
 2A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689013490; x=1691605490;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5fYArT4F4wyQhowae//dXBBkxIpu1Zo/tKwap9qaUSc=;
 b=FPEz636I3M3sl+N9m9JeInH6MYhmmd7lthCQi0LHLVQhcpGoiFQTUO3WHbFCX39Sdg
 hVxH+WeOME9IA6LwBjMKp8ubUAYj9fhaUlstDTVqSpXzRG0+UeJmFzp9494jbzmmxL+0
 AhqSwFYaF5Jmmh/yq0n3DwA6uA0mbin9okxZylL4nvO1ddKDw+yfRntr3B9OhsUEGUrA
 Q/OFZ7Is1aIiauFV/r36TjpNexfmhKk1/Ks+FzU8u6z0spXMESlHSktusHH/KEeguRtE
 HF4I168oW3WMmh5yXqVz4/enx06326cbdIGbzrquKACoKjPlMPk/Qnx0WK0fLShEkIQR
 Eweg==
X-Gm-Message-State: ABy/qLZ2ONNw/8dOnxvdfJ75gdrSjBVMRrCBamIIAeCwfoj8M6F/Zm6J
 f+rqLw3zKUFZaP5aj4Gd4SFBiSn6vPmEU2Vkv+dc4Q==
X-Google-Smtp-Source: APBJJlHwSLd34YXuyPLg8jXMYmyOVnyot2U91AQJrkOXDKDIjQnuHe7gdhhf/hozkoZHU9BMz3V/yQ53yLONLrXDjtQ=
X-Received: by 2002:a05:6830:1e33:b0:6b0:c67c:96f3 with SMTP id
 t19-20020a0568301e3300b006b0c67c96f3mr10929476otr.18.1689013490139; Mon, 10
 Jul 2023 11:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-6-git-send-email-quic_khsieh@quicinc.com>
 <0cac7c17-c822-927e-cc15-456b1423689c@linaro.org>
 <2278c46c-cb2c-2842-ab20-e6a334fe002b@quicinc.com>
In-Reply-To: <2278c46c-cb2c-2842-ab20-e6a334fe002b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jul 2023 21:24:39 +0300
Message-ID: <CAA8EJpoJ4Tqew5oFSE44vnBrnO+nfizffLvHV3uwrvcvjZTk0A@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/msm/dp: move of_dp_aux_populate_bus() to probe
 for eDP
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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

[Restored CC list]

On Mon, 10 Jul 2023 at 20:08, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 7/7/2023 5:32 PM, Dmitry Baryshkov wrote:
> > On 08/07/2023 02:52, Kuogee Hsieh wrote:
> >> Move of_dp_aux_populate_bus() to dp_display_probe() for eDP
> >> from dp_display_bind() so that probe deferral cases can be
> >> handled effectively
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_aux.c     | 25 ++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 79
> >> +++++++++++++++++++------------------
> >>   2 files changed, 65 insertions(+), 39 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> index c592064..c1baffb 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> @@ -505,6 +505,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
> >>       drm_dp_aux_unregister(dp_aux);
> >>   }
> >>   +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
> >> +                 unsigned long wait_us)
> >> +{
> >> +    int ret;
> >> +    struct dp_aux_private *aux;
> >> +
> >> +    aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >> +
> >> +    pm_runtime_get_sync(aux->dev);
> >> +    ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> >> +    pm_runtime_put_sync(aux->dev);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog
> >> *catalog,
> >>                     bool is_edp)
> >>   {
> >> @@ -528,6 +543,16 @@ struct drm_dp_aux *dp_aux_get(struct device
> >> *dev, struct dp_catalog *catalog,
> >>       aux->catalog = catalog;
> >>       aux->retry_cnt = 0;
> >>   +    /*
> >> +     * Use the drm_dp_aux_init() to use the aux adapter
> >> +     * before registering aux with the DRM device.
> >> +     */
> >> +    aux->dp_aux.name = "dpu_dp_aux";
> >> +    aux->dp_aux.dev = dev;
> >> +    aux->dp_aux.transfer = dp_aux_transfer;
> >> +    aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
> >> +    drm_dp_aux_init(&aux->dp_aux);
> >> +
> >>       return &aux->dp_aux;
> >>   }
> >>   diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 185f1eb..7ed4bea 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -302,10 +302,6 @@ static int dp_display_bind(struct device *dev,
> >> struct device *master,
> >>           goto end;
> >>       }
> >>   -    pm_runtime_enable(dev);
> >> -    pm_runtime_set_autosuspend_delay(dev, 1000);
> >> -    pm_runtime_use_autosuspend(dev);
> >> -
> >>       return 0;
> >>   end:
> >>       return rc;
> >> @@ -322,8 +318,6 @@ static void dp_display_unbind(struct device *dev,
> >> struct device *master,
> >>         kthread_stop(dp->ev_tsk);
> >>   -    of_dp_aux_depopulate_bus(dp->aux);
> >> -
> >>       dp_power_client_deinit(dp->power);
> >>       dp_unregister_audio_driver(dev, dp->audio);
> >>       dp_aux_unregister(dp->aux);
> >> @@ -1245,6 +1239,29 @@ static const struct msm_dp_desc
> >> *dp_display_get_desc(struct platform_device *pde
> >>       return NULL;
> >>   }
> >>   +static void of_dp_aux_depopulate_bus_void(void *data)
> >> +{
> >> +    of_dp_aux_depopulate_bus(data);
> >> +}
> >> +
> >> +static int dp_display_auxbus_emulation(struct dp_display_private *dp)
> >
> > Why is it called emulation?
> >
> >> +{
> >> +    struct device *dev = &dp->pdev->dev;
> >> +    struct device_node *aux_bus;
> >> +    int ret = 0;
> >> +
> >> +    aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> >> +
> >> +    if (aux_bus) {
> >> +        ret = devm_of_dp_aux_populate_bus(dp->aux, NULL);
> >
> > And here you missed the whole point of why we have been asking for.
> > Please add a sensible `done_probing' callback, which will call
> > component_add(). This way the DP component will only be registered
> > when the panel has been probed. Keeping us from the component binding
> > retries and corresponding side effects.
> >
> >> +
> >> +        devm_add_action_or_reset(dev, of_dp_aux_depopulate_bus_void,
> >> +                     dp->aux);
> >
> > Useless, it's already handled by the devm_ part of the
> > devm_of_dp_aux_populate_bus().
> >
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static int dp_display_probe(struct platform_device *pdev)
> >>   {
> >>       int rc = 0;
> >> @@ -1290,8 +1307,18 @@ static int dp_display_probe(struct
> >> platform_device *pdev)
> >>         platform_set_drvdata(pdev, &dp->dp_display);
> >>   +    pm_runtime_enable(&pdev->dev);
> >> +    pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> >> +    pm_runtime_use_autosuspend(&pdev->dev);
> >
> > Can we have this in probe right from the patch #2?
>
> no, at patch#2, devm_of_dp_aux_populate_bus() is done ta bind timing.
>
> The device used by pm_runtime_get_sync() of generic_edp_panel_probe()
> which is derived from devm_of_dp_aux_populate_bus() is different the
> &pdev->dev here.

Excuse me, I don't get your answer. In patch #2 you have added
pm_runtime_enable() / etc to dp_display_bind().
In this patch you are moving these calls to dp_display_probe(). I
think that the latter is a better place for enabling runtime PM and as
such I've asked you to squash this chunk into patch #2.
Why isn't that going to work?

If I'm not mistaken here, the panel's call to pm_runtime_get_sync()
will wake up the panel and all the parent devices, including the DP.
That's what I meant in my comment regarding PM calls in the patch #1.
pm_runtime_get_sync() / resume() / etc. do not only increase the
runtime PM count. They do other things to parent devices, linked
devices, etc.

>
> >
> >> +
> >>       dp_display_request_irq(dp);
> >>   +    if (dp->dp_display.is_edp) {
> >> +        rc = dp_display_auxbus_emulation(dp);
> >> +        if (rc)
> >> +            DRM_ERROR("eDP aux-bus emulation failed, rc=%d\n", rc);
> >> +    }
> >> +
> >>       rc = component_add(&pdev->dev, &dp_display_comp_ops);
> >>       if (rc) {
> >>           DRM_ERROR("component add failed, rc=%d\n", rc);
> >> @@ -1306,11 +1333,14 @@ static int dp_display_remove(struct
> >> platform_device *pdev)
> >>       struct dp_display_private *dp =
> >> dev_get_dp_display_private(&pdev->dev);
> >>         component_del(&pdev->dev, &dp_display_comp_ops);
> >> -    dp_display_deinit_sub_modules(dp);
> >> -
> >>       platform_set_drvdata(pdev, NULL);
> >> +
> >> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
> >> +    pm_runtime_disable(&pdev->dev);
> >>       pm_runtime_put_sync_suspend(&pdev->dev);
> >>   +    dp_display_deinit_sub_modules(dp);
> >> +
> >>       return 0;
> >>   }
> >>   @@ -1514,31 +1544,10 @@ void msm_dp_debugfs_init(struct msm_dp
> >> *dp_display, struct drm_minor *minor)
> >>     static int dp_display_get_next_bridge(struct msm_dp *dp)
> >>   {
> >> -    int rc;
> >> +    int rc = 0;
> >>       struct dp_display_private *dp_priv;
> >> -    struct device_node *aux_bus;
> >> -    struct device *dev;
> >>         dp_priv = container_of(dp, struct dp_display_private,
> >> dp_display);
> >> -    dev = &dp_priv->pdev->dev;
> >> -    aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> >> -
> >> -    if (aux_bus && dp->is_edp) {
> >> -        /*
> >> -         * The code below assumes that the panel will finish probing
> >> -         * by the time devm_of_dp_aux_populate_ep_devices() returns.
> >> -         * This isn't a great assumption since it will fail if the
> >> -         * panel driver is probed asynchronously but is the best we
> >> -         * can do without a bigger driver reorganization.
> >> -         */
> >> -        rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
> >> -        of_node_put(aux_bus);
> >> -        if (rc)
> >> -            goto error;
> >> -    } else if (dp->is_edp) {
> >> -        DRM_ERROR("eDP aux_bus not found\n");
> >> -        return -ENODEV;
> >> -    }
> >>         /*
> >>        * External bridges are mandatory for eDP interfaces: one has to
> >> @@ -1551,17 +1560,9 @@ static int dp_display_get_next_bridge(struct
> >> msm_dp *dp)
> >>       if (!dp->is_edp && rc == -ENODEV)
> >>           return 0;
> >>   -    if (!rc) {
> >> +    if (!rc)
> >>           dp->next_bridge = dp_priv->parser->next_bridge;
> >> -        return 0;
> >> -    }
> >>   -error:
> >> -    if (dp->is_edp) {
> >> -        of_dp_aux_depopulate_bus(dp_priv->aux);
> >> -        dp_display_host_phy_exit(dp_priv);
> >> -        dp_display_host_deinit(dp_priv);
> >> -    }
> >>       return rc;
> >>   }
> >



-- 
With best wishes
Dmitry
