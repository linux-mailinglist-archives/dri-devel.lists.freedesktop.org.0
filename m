Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E424450C59B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 02:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6210E093;
	Sat, 23 Apr 2022 00:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58A510E093
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 00:13:46 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e656032735so9022318fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zfFaHSOoCxM9k7WKIO+SokAw11U0tu3SQrHG+UYnnlM=;
 b=SMTCDHnxPQC5SWcOnrjWlUXYfTnq2kSb7H1LnbYRP0ofrUmzM0854ZNXMkmhrSDnWT
 3RZUnfA5zAxRFraIm7Qjx9cilV+2Ss7wB7JctfUBW0X5wdAlynDjUAwvHAr+dMNJ44BZ
 s/fxmjw3HKSl+k+EjZ4bHrJ/VUc44pDQvSTwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zfFaHSOoCxM9k7WKIO+SokAw11U0tu3SQrHG+UYnnlM=;
 b=Pzf4dQWtsJmN/0UoxSPtONZJT39Bd3WG5TxAV0THsvNx2ks4TIoS/Nkq/eE8yJzUw8
 L4dqJ88CgPkX6W/04IR6fhNa1okLw7ay2XMywiIYgnjAddqRwMBGbAgNbbUkXqin6vdk
 mV9B0DwvwnEgI2RG+8jHUzPbpBlD4/J8301dYM1wdWzGztfUmpB+E0ZfyeXV4//FrLr4
 2jerZRTE54cblZHu9ZkujhHbRLb+IUh9FDHmKmAA7GtdJbbfsRuWhPRS1IUvLMtUbF8r
 MhcApsPOmokaEnIItkouiVzIACQ8Xhr11ftN6JDleY/Gm2KpCT54hlNAh9XanlEvizF2
 ktPQ==
X-Gm-Message-State: AOAM530E1zhXb3AEqsclK4W1qXPZCWhKualDw5S1oV8p7TUj03GCqSvd
 1zqUN4znHejc82/TJdIUojTN3vrAKrXYrAEeSw1Ojw==
X-Google-Smtp-Source: ABdhPJyDBwXV+rdQrcRoHA6+8NjnidEoQADmYUSSgyUssOflCC+zmPxyfEsir5j8jsvIFyT+93lwtCnrCsLX4JuITZg=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr1773145oad.193.1650672826133; Fri, 22
 Apr 2022 17:13:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 17:13:45 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 17:13:45 -0700
Message-ID: <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:03)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d7a19d6..055681a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c

Some nitpicks

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> @@ -1508,7 +1509,8 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       if (!dp_display->is_edp)
> +               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);

Did it turn out that in fact DP isn't ready still to setup even after
delaying the irq?

>  }
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
> @@ -1530,6 +1532,65 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +       int rc;
> +       struct dp_display_private *dp_priv;
> +       struct device_node *aux_bus;
> +       struct device *dev;
> +
> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +       dev = &dp_priv->pdev->dev;
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +       if (aux_bus && dp->is_edp) {
> +               dp_display_host_init(dp_priv);
> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               dp_display_host_phy_init(dp_priv);
> +               enable_irq(dp_priv->irq);
> +
> +               /*
> +                * The code below assumes that the panel will finish probing
> +                * by the time devm_of_dp_aux_populate_ep_devices() returns.
> +                * This isn't a great assumption since it will fail if the
> +                * panel driver is probed asynchronously but is the best we
> +                * can do without a bigger driver reorganization.
> +                */
> +               rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +               of_node_put(aux_bus);
> +               if (rc)
> +                       goto error;
> +       } else if (dp->is_edp) {
> +               DRM_ERROR("eDP aux_bus not found\n");
> +               return -ENODEV;
> +       }
> +
> +       /*
> +        * External bridges are mandatory for eDP interfaces: one has to
> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +        *
> +        * For DisplayPort interfaces external bridges are optional, so
> +        * silently ignore an error if one is not present (-ENODEV).
> +        */
> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> +       if (!dp->is_edp && rc == -ENODEV)
> +               return 0;
> +       else if (rc)

Just an if because there's a return above.

> +               goto error;
> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;

In which case it almost feels like it could be written

	if (!dp->is_edp && rc == -ENODEV)
		return 0;
	if (!rc) {
		dp->next_bridge = dp_priv->parser->next_bridge;
		return 0;
	}
error:
	if (dp->is_edp) {

but I'm not worried either way, besides removing the else from the else-if.

> +
> +       return 0;
> +
> +error:
> +       if (dp->is_edp) {
> +               disable_irq(dp_priv->irq);
> +               dp_display_host_phy_exit(dp_priv);
> +               dp_display_host_deinit(dp_priv);
> +       }
> +       return rc;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index d371bae..950416c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -125,7 +125,7 @@ struct dp_parser {
>         u32 max_dp_lanes;
>         struct drm_bridge *next_bridge;
>
> -       int (*parse)(struct dp_parser *parser, int connector_type);
> +       int (*parse)(struct dp_parser *parser);
>  };
>
>  /**
> @@ -141,4 +141,15 @@ struct dp_parser {
>   */
>  struct dp_parser *dp_parser_get(struct platform_device *pdev);
>
> +/**
> + * dp_parser_find_next_bridge() - find an additional bridge to DP
> + *
> + * @parser: dp_parser data from client
> + * return: 0 if able to get the bridge else return an error code

return comes after the description below. Also should be capitalized.
You can check this by compiling with W=1 I believe, or run the
kernel doc format script on the file..

> + *
> + * This function is used to find any additional bridge attached to
> + * the DP controller. The eDP interface requires a panel bridge.

Return: 0 if able to get the bridge, otherwise negative errno for failure

> + */
> +int dp_parser_find_next_bridge(struct dp_parser *parser);
> +
