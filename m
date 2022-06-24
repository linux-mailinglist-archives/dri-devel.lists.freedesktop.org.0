Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB355A51F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BF810E989;
	Fri, 24 Jun 2022 23:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706210E78C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:56:46 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id cs6so6834300qvb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bDqcC2b/5E2itIbFrgVYQxn7bAcfIKhqscuNTJZx+CA=;
 b=a9mE97C3QaiYWUG64qjCNkOPtCdN8jzRl8JZKYxOyZz0b9y7+MwI4XGSm8ixBsGDby
 Zm7jjSZvM2QrhKZq92yMle23dgXLeYmtjTrwEJ+waWnXxfw2gkQ0GyQ7p7euwPtI+IKn
 XZsNd51AbT/HULq4mYTapVRZUjcKTTFDcCXmtsI2xI2kkjsLPLwTvukcyXptdqAYNAQ6
 8c8OmPSWTJkyHqxxSzHjmSmIi9BHTabogvlsKcvSYAUCGgIy+pkkHGUd3kcCnOXZFrYM
 UhU0vJ22TWqt/iMR41h20ztEia6xsn7CsGS5DJUKuxZPAaxn0lQIDEsD9dZw8maW//aG
 Rh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bDqcC2b/5E2itIbFrgVYQxn7bAcfIKhqscuNTJZx+CA=;
 b=6HSHQGoEwXzYyCBo9M0rJjkjnNfJnCDuRH+9PRqWqEFAjwU/2V1TbA3GMDyU0vGIui
 RRKSSffN+sczea5KL4kaWcYV/3KQDD9W/DVVU+8OK49oCr7cMGthbalfU1gi5SgyMljr
 8tRFwsPrLYf6eOKgOzOuH/Ru1CQfoCtEzuKhW6gg+ouoVN4GY6TNzdSoXQ1D5z0M33lE
 BJBYoqOGnN/BW/1nPeMANMMeJbnZZh0y8JBNjlvxMW15wHyhvurIVF8UD4Eh7p3wShKt
 eK2auhDBVylXUSD9iRKUjHx5dVHkMDrTRzGucwmbS1+yMMfv34ZEYUiC4HQOYal1fqcH
 SXag==
X-Gm-Message-State: AJIora+dKGgslWIonVzV1/kB6d/9CS/KIrytwvdboMdve9pwAAuj6vYD
 Gg+qU44+Ml5lDtrjoAPvaShxpMZCA9PJvsNGyQXOyw==
X-Google-Smtp-Source: AGRyM1tBPqtZTmiqo/rFRTDaEkcl5dCeMpdanVuGujU7QBwRNzyiHPfJ4k4LbCShiUJN+35Huj4wIXG1XxVN+LcSKn8=
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id
 r10-20020a05622a034a00b00304f25aecf0mr1448087qtw.62.1656115005671; Fri, 24
 Jun 2022 16:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656090912-18074-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 02:56:34 +0300
Message-ID: <CAA8EJpoppiw=vxkw9vvsn0mYmgYjU-WCd3w_pRyd-7PNneRv1A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/msm/dp: place edp at head of drm bridge chain
 to fix screen corruption
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

On Fri, 24 Jun 2022 at 20:15, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The msm_dp_modeset_init() is used to attach DP driver to drm bridge chain.
> msm_dp_modeset_init() is executed in the order of index (dp->id) of DP
> descriptor table.
>
> Currently, DP is placed at first entry (dp->id = 0) of descriptor table
> and eDP is placed at secondary entry (dp->id = 1 ) of descriptor table.
> This means DP will be placed at head of bridge chain and eDP will be
> placed right after DP at bridge chain.

No, the dp->ids do not have anything to do with the bridge chains.

> Drm screen update is happen sequentially in the order from head to tail
> of bridge chain. Therefore external DP display will have screen updated
> happen before primary eDP display if external DP display presented.
> This is wrong screen update order and cause one frame time screen
> corruption happen at primary display during external DP plugged in.
>
> This patch place eDP at first entry (dp->id = 0) of descriptor table and
> place DP at secondary entry (dp->id = 1) to have primary eDP locate at
> head of bridge chain. This correct screen update order and eliminated
> the one frame time screen corruption happen d at primary display.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a87a9d8..2755ff3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -143,10 +143,10 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>
>  static const struct msm_dp_config sc7280_dp_cfg = {
>         .descs = (const struct msm_dp_desc[]) {
> -               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
> -               .controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
>                 { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP,
>                 .controller_id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
> +               .controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },

If the correctness of DP display depends on the order of entries in
the dp_desc table, something is terribly wrong in the driver. Please
fix that rather than working around it by shuffling the entries in the
array.

>         },
>         .num_descs = 2,
>  };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
