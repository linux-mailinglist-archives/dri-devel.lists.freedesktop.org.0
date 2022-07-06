Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59664569060
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96C711A101;
	Wed,  6 Jul 2022 17:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D53D113D2B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 17:13:03 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id v6so11538472qkh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
 b=gX42jT2AYWNC7cGaOXGMeyQVMtNb6kCasYmmMrL9KFkEIIs2xt5sy2zzchC93vpHTz
 v59M7rdb5HcbOUm/cw6snNW3veLXa9nQ/4OOt25hR9nNGpne0qAyUW8245N7bqaVYfj2
 PssWLrzqWO/ag27nGs2Z0NxMqd7e/UBKiOUmhGkOGZ1vrMLZsmAMIOuACTwc9wOlpuYV
 XP8x0iru35oYUAPSM4qWwDPuYkF0Eeb1acBHz9B33aS8XmHty+Z8hUnQazIdlE9hJLe+
 PQ3ldCY0JGmq3J05OVVxEpsF5Cfqdqdbw1q1BkD3VIyTtrL3YBw/iOcwS5dQ1rULVFkL
 tU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
 b=FCdl7QffSuWfWo3PchT5lnJG6R98Q7X1uQNhaOvNiScabuM+TbZ3pFoGbdL1g4XuGf
 JsCKc80mbxMS1ggiW0H+REjQvyX7X0KOfJW5u8mk45DgX90pgzK1y9CCrEjuq5L/F4vZ
 vm+Cka+h1XuRpiImTsBkOfoRF5v4t0ueNLKhslkHwOBvk3c3gwGk/6cv7pZOvuZNWv0e
 H3D2VBTuwb7hkWeIJYpMAEthmHVxE0utpuACVdbADyNezNiTg8bT85s1BshY8nu6dETJ
 kbTs8IMd5h9VHjRhtycjetT2711chUqvJIA2z+xAJ68C54+CL29RtBz1H5gG0GoXFKeA
 dKCg==
X-Gm-Message-State: AJIora97f8c4oho3kZGiVXNJlEllvwxe60LZje31Kb45BjKRHRmdiyvn
 CWePtOjryC7lUe2cKVyXXjibAsbNda4ST4IzttWGFQ==
X-Google-Smtp-Source: AGRyM1u3X21Jwan4j95LttRmYI0ORhnnl1BSnKPKeE019vkiDLJpcdFvlA+szPY66CexrkV0lPm7pe6AVsuV3Mi3Ens=
X-Received: by 2002:ae9:ed56:0:b0:6ae:f7cf:7f5c with SMTP id
 c83-20020ae9ed56000000b006aef7cf7f5cmr27970088qkg.59.1657127581718; Wed, 06
 Jul 2022 10:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Jul 2022 20:12:50 +0300
Message-ID: <CAA8EJpr_u4PEOFE22EkAvDbvECzaY89oGHA+fjvrbZCYYYNK4A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: make eDP panel as the first connected
 connector
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 19:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Technically this patch was neither  Reviewed, nor Tested. Please
refrain from posting wrong tags.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931..50ff666 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>         if (ret)
>                 return ret;
>
> +       drm_helper_move_panel_connectors_to_head(dev);
> +
>         num_encoders = 0;
>         drm_for_each_encoder(encoder, dev)
>                 num_encoders++;

-- 
With best wishes
Dmitry
