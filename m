Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6250ECBF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 01:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4050F10EE97;
	Mon, 25 Apr 2022 23:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6710EE97
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 23:42:44 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so11918410otn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K4FutLiPYIeP/HOxIs4qYHrWa4LrVjZXyTDuVMwAdkE=;
 b=ZilM88c+fnY6fhL+dsclBFXXrJZ2HAsNMGm+Np/+Mt+Oc9B8TPZAw7q2viTTA6ak7B
 yoPgBTRydMcwU9nqmb2RwnJ6/9Ab+iVUtgpDZMQnsf8c60ouFHjhpnnlMa5L2jaUEi7S
 mNECsZCv8EsiAIE7sqJFlw+mv3p73HVE1KFXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K4FutLiPYIeP/HOxIs4qYHrWa4LrVjZXyTDuVMwAdkE=;
 b=XOM/X3h8mjYgbgKsVPjBf8oZe6AKmqSShiPETmFEoloLkqzdPt3fYBCRGmjsTZEJwi
 /1qV6Q6MKcQiDD+y7V1ZtnfItEjD0JKuWWIYkmUO3bGLH6QZ+/zEKZk68C7/DBIb7hx2
 NZDoYOp8DT0pb2wiyTNEVNW3RaRBhnoKdi57eolYKC9601TiQBWr5n6Se2XRD45yLuWv
 RlutleVzg273ME4W/vULVs+jqcylhZ8QcD8hEbFEWfKjRublfR8RPjrYIaRNlNdUu4CT
 OSnlHLsXkpD3HZXwzdOJowrF4yzRYkdF/KQYEjdkr9fnBouIjtqx/cgE548eGzKS7Oq5
 kjNQ==
X-Gm-Message-State: AOAM531QJKOjoOK9Ga7UiXdqXUgZoXJinuPVSQTgtzSPcCUkRkQNj4xz
 wZhcdfhtL2YgWuf/lY98D2knJHfHu6Bp7s9CCuSLMQ==
X-Google-Smtp-Source: ABdhPJzjMENQDYBD08IVFVW0/QWyMQfeTI6EyQhCyi/4NXFypeigA/5BTebt0pYawZnga1Nb8BVc8Zivs55QAsnebDU=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr7434111oth.77.1650930163239; Mon, 25 Apr
 2022 16:42:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 16:42:42 -0700
MIME-Version: 1.0
In-Reply-To: <1650924663-24892-3-git-send-email-quic_khsieh@quicinc.com>
References: <1650924663-24892-1-git-send-email-quic_khsieh@quicinc.com>
 <1650924663-24892-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 16:42:42 -0700
Message-ID: <CAE-0n5356Mf8AyW4ytNjuz95P5+T0fAD+EZ9p3Zkqp7hgpsYKw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/msm/dp: do not stop transmitting phy test
 pattern during DP phy compliance test
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 15:11:03)
> At normal operation, transmit phy test pattern has to be terminated before
> DP controller switch to video ready state. However during phy compliance
> testing, transmit phy test pattern should not be terminated until end of
> compliance test which usually indicated by unplugged interrupt.

And what does the patch do to fix it? We need more details in the commit
text. I think it should continue with:

Only stop sending the train pattern in dp_ctrl_on_stream() if we're not
doing compliance testing. We also no longer reset 'p_level' and
'v_level' because XYZ and it's OK/better to retrain the link after
enabling the stream clks because XYZ.

>
> Fixes: 64e190e720a7 ("drm/msm/dp: DisplayPort PHY compliance tests fixup")

Should be

Fixes: 6625e2637d93 ("drm/msm/dp: DisplayPort PHY compliance tests fixup")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 193cc1a..f99e173 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1699,8 +1699,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                 ctrl->link->link_params.rate,
>                 ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
>
> -       ctrl->link->phy_params.p_level = 0;
> -       ctrl->link->phy_params.v_level = 0;

Why is this removed? Can you mention in the commit text why we don't
need to zero it out anymore?

>
>         rc = dp_ctrl_enable_mainlink_clocks(ctrl);
>         if (rc)
> @@ -1822,12 +1820,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 }
>         }
>
> -       if (!dp_ctrl_channel_eq_ok(ctrl))
> -               dp_ctrl_link_retrain(ctrl);
> -
> -       /* stop txing train pattern to end link training */
> -       dp_ctrl_clear_training_pattern(ctrl);
> -
>         ret = dp_ctrl_enable_stream_clocks(ctrl);
>         if (ret) {
>                 DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> @@ -1839,6 +1831,13 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 return 0;
>         }
>
> +       if (!dp_ctrl_channel_eq_ok(ctrl)) {
> +               dp_ctrl_link_retrain(ctrl);
> +       }

Braces not needed. Please remove.

> +
> +       /* stop txing train pattern to end link training */
> +       dp_ctrl_clear_training_pattern(ctrl);
> +
