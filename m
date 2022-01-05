Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6D485AC4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 22:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DFE10E1FE;
	Wed,  5 Jan 2022 21:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72A710E1FE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:34:48 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id w7so999677oiw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 13:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aikMCKgudfdNFplAVHd5dZZXnejy0/EJjuSG/0Dh+Qk=;
 b=nojXfc3QeDa4iaP71sncYrCB3wu7bLLyOe3E6RLAx+SoyIv3/xzrXSplCVbTaqycvs
 jNlEcorkEg3VtM6xmPuL5OnmRIjchtMFOWw/kWuJQ3rJQGIkvo/eqxUo5B7jMsgSX/mw
 xLLXbTEalgpY7wNm4bRtUSyYCxO6JUWHZyDZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aikMCKgudfdNFplAVHd5dZZXnejy0/EJjuSG/0Dh+Qk=;
 b=1OotrAsNFiP+gAktAKG0UCwqDHRGs7M8p9QfaYQkppQbbQseQ9ks2GDTBMGZDW+UK8
 0jcUMO1H5U5W1evKteIkdzhMl40FQN+RLKXk5KMWdXV9WHYGoYoxAAKc7sy7VP8pm8mt
 FoPTanefgI2k5ZbPx2gpLZTMiM7eFtw14yTvLhXGefrPZnQxKJ7SOtuRaRKPwIU3Cnjo
 Ihb9KXlpD8MizdsZyoqAVRlEG4angp5U9fh1384r2CfIN90OBpSnsnJtaeIFEMlfHIzX
 CFI7nesMYsgvYRioW/9+yGuTaJ7+y8WbWVnxwC7KruAxqB3Uj3Cl4gy9MooB78hfxWRB
 p+4w==
X-Gm-Message-State: AOAM531TF4BXkmrD0JMT8DA7Nn2ZBxZrdTkIFHKcIHZvNwHk/Xhu4Mv9
 DZucsIsEJS/7KRmsZgKvb7JNeYC1tmSmzp6qHWgK3w==
X-Google-Smtp-Source: ABdhPJz8SSN2Fj+FwJmMI6TRwdHCqoAnptzNFxaptsVJlo0Hr4xuSL1iBnb3nFWwft46rigEC0UuSxDvQnlNciU7W5Q=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4028697oik.32.1641418488161; 
 Wed, 05 Jan 2022 13:34:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 13:34:47 -0800
MIME-Version: 1.0
In-Reply-To: <1640805422-21904-1-git-send-email-quic_khsieh@quicinc.com>
References: <1640805422-21904-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 13:34:47 -0800
Message-ID: <CAE-0n50Bi2v3D1B8Ee1ckdUWLhpyNrCEVqikbuS8wMfT0+2VnA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: populate connector of struct dp_panel
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-29 11:17:02)
> There is kernel crashed due to unable to handle kernel NULL
> pointer dereference of dp_panel->connector while running DP link
> layer compliance test case 4.2.2.6 (EDID Corruption Detection).

Can you explain how we get into that situation? Like

"We never assign struct dp_panel::connector, instead the connector is
stored in struct msm_dp::connector. When we run compliance testing test
case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid edid set
in struct dp_panel::edid so we'll try to use the connectors
real_edid_checksum and hit a NULL pointer deref error because the
connector pointer is never assigned."

> This patch fixes this problem by populating connector of dp_panel.
>
> [drm:dp_panel_read_sink_caps] *ERROR* panel edid read failed
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000006e1
> Mem abort info:
>   ESR = 0x96000006
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000006
>   CM = 0, WnR = 0
> user pgtable: 4k pages, 39-bit VAs, pgdp=0000000115f25000
> [00000000000006e1] pgd=00000001174fe003, p4d=00000001174fe003, pud=00000001174fe003, pmd=0000000000000000
> Internal error: Oops: 96000006 [#1] PREEMPT SMP

This sort of stuff isn't really useful because it takes quite a few
lines to say "We hit a NULL pointer deref" which was already stated. I'd
rather have a clear description of what goes wrong and how setting the
pointer in msm_dp_modeset_init() fixes it.

> {...]
>
> Changes in V2:
> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
>
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3449d3f..c282bbf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1495,36 +1495,41 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> -int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> +int msm_dp_modeset_init(struct msm_dp *dp, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {
>         struct msm_drm_private *priv;
> +       struct dp_display_private *dp_display;
>         int ret;
>
> -       if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> +       if (WARN_ON(!encoder) || WARN_ON(!dp) || WARN_ON(!dev))
>                 return -EINVAL;
>
>         priv = dev->dev_private;
> -       dp_display->drm_dev = dev;
> +       dp->drm_dev = dev;
> +
> +       dp_display = container_of(dp, struct dp_display_private, dp_display);
>
> -       ret = dp_display_request_irq(dp_display);
> +       ret = dp_display_request_irq(dp);
>         if (ret) {
>                 DRM_ERROR("request_irq failed, ret=%d\n", ret);
>                 return ret;
>         }
>
> -       dp_display->encoder = encoder;
> +       dp->encoder = encoder;
>
> -       dp_display->connector = dp_drm_connector_init(dp_display);
> -       if (IS_ERR(dp_display->connector)) {
> -               ret = PTR_ERR(dp_display->connector);
> +       dp->connector = dp_drm_connector_init(dp);
> +       if (IS_ERR(dp->connector)) {
> +               ret = PTR_ERR(dp->connector);
>                 DRM_DEV_ERROR(dev->dev,
>                         "failed to create dp connector: %d\n", ret);
> -               dp_display->connector = NULL;
> +               dp->connector = NULL;
>                 return ret;
>         }
>
> -       priv->connectors[priv->num_connectors++] = dp_display->connector;
> +       dp_display->panel->connector = dp->connector;

This is the one line that matters I think? Can we reach the connector
for the dp device without going through the panel in
dp_panel_handle_sink_request()? That would reduce the number of struct
elements if possible.

> +
> +       priv->connectors[priv->num_connectors++] = dp->connector;

Can we not rename all the local variables in this patch and do it later
or never? Reading this patch takes a long time because we have to make
sure nothing has actually changed with the rename of 'dp_display' to
'dp'.

>         return 0;
>  }
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
