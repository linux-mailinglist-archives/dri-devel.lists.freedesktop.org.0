Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6095018CD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FA210FED7;
	Thu, 14 Apr 2022 16:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB4010FF0E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:39:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 11so2060773edw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/81+PkkPmPe/TTQwrTB+sxyYxn9iTbpRvnVkvTg+pC8=;
 b=B9wDWH42g9YW9AI0Nss9bPg2ke9AcgJPM27MaTf5FcLd2cYA8sez9IWCsZ1KH5qcqa
 Lu+dH/ZYnrkVAhHHkskGQMRfl28OXKQ8/hvdgxC+Gd1N0dqNrZq14l0edVEEzLsBFvGP
 IU9Ox5r96ULPR95h7HSZz6dMttqUaACHn8hkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/81+PkkPmPe/TTQwrTB+sxyYxn9iTbpRvnVkvTg+pC8=;
 b=fvGfFpF86UGJsPP3gYU/Ph+AwiebHL4ggQebcCpiPFGows7DkwcX9Z/VZ8lJL19zBy
 C0/6N0VHvwt+7QYZyKd+R4ICW+qgkXLn6v6doexkkuczTtWnY4WhWAKYcswXiNDwFL7a
 urY7w+8Kp7vD7fEgYX4MR+X99sqWjYR4wrhUupqbDK/RCx5V0JSQtkIlxdqRoIAg9vwc
 EZK6OOWhS9rKEbasLlgVfoo/NLWV0ESBueCzhfUGp64R8hy4OJdSHgnaqIW093lcs673
 7n0DLgPUlDPoTd/qx9H/LtBoGIfCDqtFxB03vgfNYSSMj5L8yVSzlsua5tIAHfXwL8g0
 b8FA==
X-Gm-Message-State: AOAM533sxvs3LtWMrdW/bT+HYOPUI1Rpkr0ZeRZgCmm8bMjtloEU8JuO
 RS1KzHPDcMrhwj/IEwkivKF6hOGBG044MH6Z
X-Google-Smtp-Source: ABdhPJykXLjQQC5XxkK2lQQXBsYMY+ergzc0ZAPlDQGoYgbYMiXNM9CY9NRV+XQYCQSSJKHCUSfX9Q==
X-Received: by 2002:a05:6402:d5:b0:41d:6518:86e4 with SMTP id
 i21-20020a05640200d500b0041d651886e4mr3954928edu.322.1649954377387; 
 Thu, 14 Apr 2022 09:39:37 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 fy29-20020a1709069f1d00b006e8d248fc2csm736269ejc.108.2022.04.14.09.39.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:39:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id g18so7678048wrb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:31 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr2610564wrb.513.1649954370738; Thu, 14
 Apr 2022 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
Message-ID: <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1530,6 +1532,60 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
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
> +               rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +               of_node_put(aux_bus);
> +               if (rc) {
> +                       disable_irq(dp_priv->irq);
> +                       dp_display_host_phy_exit(dp_priv);
> +                       dp_display_host_deinit(dp_priv);
> +                       return rc;
> +               }
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

This gets into the same problem that Dmitry pointed out that ps8640
has that's addressed by my recent series [1].  Namely it's not
guaranteed that the panel will have finished probing by the time
devm_of_dp_aux_populate_ep_devices() finishes probing. I don't think
it's going to be really solvable without the bigger rewrite that we've
been discussing, though. ...it's probably OK to land something like
what you have here, but it might at least deserve a comment in the
code?

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org


> +       if (rc == -ENODEV) {
> +               if (dp->is_edp) {
> +                       DRM_ERROR("eDP: next bridge is not present\n");
> +                       return rc;
> +               }
> +       } else if (rc) {
> +               if (rc != -EPROBE_DEFER)
> +                       DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +               return rc;

In both of your two error returns here isn't it a problem that you don't do:

  disable_irq(dp_priv->irq);
  dp_display_host_phy_exit(dp_priv);
  dp_display_host_deinit(dp_priv);

Should probably at least fix that clear error before landing, unless
I'm misunderstanding and there's some reason not to do that?


As discussed previously, I'm not convinced that we've covered every
corner case for properly doing and undoing the above things. I'm
hoping that once we do the cleanup and move to pm_runtime() management
that it will be cleaned up?


> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>         bridge->funcs = &dp_bridge_ops;
>         bridge->type = dp_display->connector_type;
>
> -       bridge->ops =
> -               DRM_BRIDGE_OP_DETECT |
> -               DRM_BRIDGE_OP_HPD |
> -               DRM_BRIDGE_OP_MODES;
> +       if (!dp_display->is_edp) {
> +               bridge->ops =
> +                       DRM_BRIDGE_OP_DETECT |
> +                       DRM_BRIDGE_OP_HPD |
> +                       DRM_BRIDGE_OP_MODES;

Given that Dmitry had questions about why eDP has different ops in his
previous review of this code, the above probably deserves an inline
code comment. If you want to use my wording, you could paste this into
your code:

  /*
   * Many ops only make sense for DP. Why?
   * - Detect/HPD are used by DRM to know if a display is _physically_
   *   there, not whether the display is powered on / finished initting.
   *   On eDP we assume the display is always there because you can't
   *   know until power is applied. If we don't implement the ops DRM will
   *   assume our display is always there.
   * - Currently eDP mode reading is driven by the panel driver. This
   *   allows the panel driver to properly power itself on to read the
   *   modes.
   */


Overall: as discussed, I think that the current implementation is a
bit fragile and might have some wrong corner cases since it's hard for
me to reason about exactly when we init/de-init things. Even if it
works great, the fact that it's hard to reason about isn't wonderful.
That being said, I honestly believe that would benefit upstream to get
this landed and iterate on it. I don't think this should be causing
any existing behavior to be _worse_ and getting it landed upstream
will keep more people focused on the same codebase.


-Doug
