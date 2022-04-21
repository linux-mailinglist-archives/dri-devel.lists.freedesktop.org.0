Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44550A3F1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 17:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1410E52B;
	Thu, 21 Apr 2022 15:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BF910E52B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:23:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ks6so10813090ejb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
 b=T72udbyPW1VL0ZRokeN2lVKk3WmrP25bUUbwuR1yQnvwLB9IKLveCQxYQaPiAtb23v
 G2F4yUKDMn/rihEoo3k0eVGpN3867P45pzCTx9T+LCW/SnfTrsvNyCiSIgzbqaZb+xHW
 my2utY+f/CJ/ShNW34MbXTj9YkokSsMPlgEo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
 b=WfFPVxD2Lk5+1M6jizWB4haUnW4uJb3QIqJ4qtO7UdO6GPtOzIgL/4pEmaKX7+fL4F
 ShH2cFc+/YZDGDwjRyBpYDI3AwI/U7QGtEPdCKS9mD2mo9wCdtB7ccEa6RZ4+kAo9Vi6
 0ghP3Ku7w1AiDj/8N5zqgOXXST9hSD5BlqCXhKmGH72MxfYQfWGNg9rzBM61/nnPO+mb
 9ZzkbE3rGGzyeW/vvhzhrXZgjaE8KRrfjTE5RJa03YIbtLlA+1YqkS419Du0WBEUyom+
 +Ot2FQs4JRcxi4Y9LA34Z7Ffng9we0saYMMpPheh+cP7xWUZpMd7V3qktkcA2fjllKbL
 fNqA==
X-Gm-Message-State: AOAM533CFqC5tFFJUayGcI67X0YOS2e3cx3LqDM524u4KCIVau+YTBtJ
 iQeE27nN6L0egg/q3VMzVaAclJVWdm6D+aK2
X-Google-Smtp-Source: ABdhPJxMYyzedTiumkz9SAqAoEhnl+nSK817vXurKTipJ+NlkmE27jeiLrR2b0moqAfjVp//0tKG3A==
X-Received: by 2002:a17:907:6d9f:b0:6f0:1077:eaf4 with SMTP id
 sb31-20020a1709076d9f00b006f01077eaf4mr55782ejc.708.1650554600255; 
 Thu, 21 Apr 2022 08:23:20 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 yy18-20020a170906dc1200b006d6e5c75029sm7745215ejb.187.2022.04.21.08.23.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id t6so3750950wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
X-Received: by 2002:adf:dbc3:0:b0:20a:88bf:6d83 with SMTP id
 e3-20020adfdbc3000000b0020a88bf6d83mr187757wrj.301.1650554598823; Thu, 21 Apr
 2022 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 08:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
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

On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1530,6 +1532,61 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
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

I think a comment was requested above that line saying something like:

/*
 * The code below assumes that the panel will finish probing
 * by the time devm_of_dp_aux_populate_ep_devices() returns.
 * This isn't a great assumption since it will fail if the
 * panel driver is probed asynchronously but is the best we
 * can do without a bigger driver reorganization.
 */


> +               of_node_put(aux_bus);
> +               if (rc)
> +                       goto edp_error;
> +       } else if (dp->is_edp) {
> +               DRM_ERROR("eDP aux_bus not found\n");
> +               rc = -ENODEV;
> +               goto error;

This goto doesn't add much. Just leave the above like it was in v7.
return -ENODEV w/ no goto.


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
> +       if (rc && dp->is_edp) {
> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> +               goto edp_error;
> +       } else if (rc && rc != -ENODEV) {
> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> +               goto error;
> +       }

The above wouldn't be my favorite way of doing this. Instead, I would
have written:

  if (rc) {
    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
    goto err;
  }
  ...

err:
  if (dp->is_edp) {
    disable_irq(...);
    dp_display_host_phy_exit(...);
    dp_display_host_deinit(...);
  }
  return rc;

> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +       return 0;
> +
> +edp_error:
> +       disable_irq(dp_priv->irq);
> +       dp_display_host_phy_exit(dp_priv);
> +       dp_display_host_deinit(dp_priv);
> +error:
> +       return rc;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {

With the above fixes, I'd be happy enough for my Reviewed-by tag with
the expectation that continued work will happen to continue cleaning
this up.


-Doug
