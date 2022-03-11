Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115AF4D5CA9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8077110E2B9;
	Fri, 11 Mar 2022 07:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DB810E2B0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:46:25 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id x3so6414683qvd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eBJtZX0dzPWxpwxmqjeQIh/xkfS1YxZhhayomwwY87U=;
 b=SsQlwuWm27IS09GMJsh9DaQ0wIJ9Q4RoOYZxIInUmkFrgzpYiyrWiKJFXwe63XcHJB
 H0z3XLMDJwSV5+wo2jA9LSVdFB8Ojp+XGE0vO/3iM4mcdfcveP2gL7qthmUgGSlHphul
 tNFupXhmWPmBTEdGlzJ9bKIS1OIbVcC6hNAvSqa2s8wnEKvDXTcRwzDmhRPyp+Fobw6q
 Ijiqs7b9igFQ0upG3KaaYd8N52jLNd+7Jb5AtqpBWWktu0OTW+NoA1iGVf/hVxQpnVE5
 4Dkzgm8uVcdx3oTFKKJICQPdA9PY5PovnJ5J5P/vZ69eJQmwISYOIg+q6cC5g3y5KItr
 RJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eBJtZX0dzPWxpwxmqjeQIh/xkfS1YxZhhayomwwY87U=;
 b=QtoLtvfTig70WL4XNnw4qgF7ALUF42/Qbk+X3ZIJ/7GwcKdNfQx2l3JXv3F3JAu4EI
 ngHDhqH9jFRhB9xNj2rfkN0Q9pQ13tGWXW5DhwGTwE3dsB1J/GhtGOqpuY0DUqFadiH7
 78s/SzcRVVhUkxDRPsxFJao+o15XfzBhS2Q8m+MrEsuCWWHSn9XfAjwlha3gnSCFGpA1
 pWkF+7Jx6HJ7d2919/0oyTShw8e4zJK0rs5wQ2hFAp55HM6v7i/D7+nedNPtMw/s+P/t
 CK1dG5drHdw8UhD/1yxQCjSHtXP6ihZyTRI6YqDPLFj1y64d5hB0Xwv1fD3lXVBFTDri
 JpwQ==
X-Gm-Message-State: AOAM533/Jl217qMk44QgUle8H26L+Xw90HApH1Lyg7VyU9SEyK8fAeJP
 35GHTqbMJRICQ1tUm8SnPoaVQkvfnoXvnx4Vuqrjaw==
X-Google-Smtp-Source: ABdhPJzHZiuidIiXVLyE8yQTHwwAIgX5KOV1PKreLcwQl1Y/1isVwcm2zHXEdFlowBH8Y/9cHzfvZ9Sd2wbmuj9+Ieg=
X-Received: by 2002:a0c:b2cb:0:b0:435:cb61:322e with SMTP id
 d11-20020a0cb2cb000000b00435cb61322emr6782127qvf.122.1646984784148; Thu, 10
 Mar 2022 23:46:24 -0800 (PST)
MIME-Version: 1.0
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Mar 2022 10:46:13 +0300
Message-ID: <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 Laurent.pinchart@ideasonboard.com, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Mar 2022 at 04:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For some vendor driver implementations, display hardware can
> be shared between the encoder used for writeback and the physical
> display.
>
> In addition resources such as clocks and interrupts can
> also be shared between writeback and the real encoder.
>
> To accommodate such vendor drivers and hardware, allow
> real encoder to be passed for drm_writeback_connector.
>
> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c |  8 ++++----
>  include/drm/drm_writeback.h     | 13 +++++++++++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504..4dad687 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>         if (IS_ERR(blob))
>                 return PTR_ERR(blob);
>
> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> +       ret = drm_encoder_init(dev, wb_connector->encoder,
>                                &drm_writeback_encoder_funcs,
>                                DRM_MODE_ENCODER_VIRTUAL, NULL);

If the encoder is provided by a separate driver, it might use a
different set of encoder funcs.

I'd suggest checking whether the wb_connector->encoder is NULL here.
If it is, allocate one using drmm_kzalloc and init it.
If it is not NULL, assume that it has been initialized already, so
skip the drm_encoder_init() and just call the drm_encoder_helper_add()

>         if (ret)
> @@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                 goto connector_fail;
>
>         ret = drm_connector_attach_encoder(connector,
> -                                               &wb_connector->encoder);
> +                                               wb_connector->encoder);
>         if (ret)
>                 goto attach_fail;
>
> @@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>         drm_connector_cleanup(connector);
>  connector_fail:
> -       drm_encoder_cleanup(&wb_connector->encoder);
> +       drm_encoder_cleanup(wb_connector->encoder);
>  fail:
>         drm_property_blob_put(blob);
>         return ret;
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d27..0ba266e 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,13 +25,22 @@ struct drm_writeback_connector {
>         struct drm_connector base;
>
>         /**
> -        * @encoder: Internal encoder used by the connector to fulfill
> +        * @encoder: handle to drm_encoder used by the connector to fulfill
>          * the DRM framework requirements. The users of the
>          * @drm_writeback_connector control the behaviour of the @encoder
>          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>          * function.
> +        *
> +        * For some vendor drivers, the hardware resources are shared between
> +        * writeback encoder and rest of the display pipeline.
> +        * To accommodate such cases, encoder is a handle to the real encoder
> +        * hardware.
> +        *
> +        * For current existing writeback users, this shall continue to be the
> +        * embedded encoder for the writeback connector.
> +        *
>          */
> -       struct drm_encoder encoder;
> +       struct drm_encoder *encoder;
>
>         /**
>          * @pixel_formats_blob_ptr:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
