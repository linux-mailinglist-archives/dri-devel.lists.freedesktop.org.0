Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316BC4234DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 02:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136A26E486;
	Wed,  6 Oct 2021 00:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA736E47B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 00:15:33 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so1025578otv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 17:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9tzMxEXeRZ9vZ6WKGHD8GdqG31K/v2rLyNRBux+Swf4=;
 b=OQygNhVVehGtg+wS+bXFa/5K4w+jHJ8XiWZZc9xqBeysMV0N1n9NlIwDng1+Cojt5u
 TRNVm2MYGpXYZIg/Z4wzA5EMFkwgvIy1kC8LA8oorAxOy3dN7WqdJT8YHWrb0mhSPmlt
 pOVWRrrO4p9IeMsttWIJAuM9EAtEVukvZfZP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9tzMxEXeRZ9vZ6WKGHD8GdqG31K/v2rLyNRBux+Swf4=;
 b=TCmtDpS81slkYuvDPAAPQWDdqWwJjia3ernIC0eh7oZoopbfqX9Kb/yin9n/ir4+BE
 CfIxfbNKVTcA/kJdwK3dT/IVKROphe3HM5/3jqY0alpnHNjIkL7JqXpaXvjdTHQE2CS0
 LZD1ff8j9nDo9y+JEt/PqsZ4kw7vKZJaGR/mLHG0kU8A/NTR6plmCzf6zna13qHQzCpo
 aZtAhypLDT3MomE0X9zB+v6J1DGGtxZjpSNG+Fxcxyq5bAKTO8V/nIOtVG+dKj2+mgC3
 2asahAlzCKqBA9fWssxr1xCOeE7wvZ9i02fbF9JFbUtbSiZzxR0ocBSohXSQDjKdh0GT
 mx/g==
X-Gm-Message-State: AOAM532DapTAwXopRu0h5adBwMWNwodshVqTzYm5krrGPHeIVk0AlJ3F
 LwzjWhEkDACYodDcKlOML+4oUvHuFi/GojEaBT71jw==
X-Google-Smtp-Source: ABdhPJzSi7rJ/j68GKHBK0r+knYE/P5yBIQ/VbjAnJL7ff/zbZl98PnkJ9ta6ivRwIe2lxeGGKRz/NNCimqJP8IUsLk=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr16675560ote.77.1633479332704; 
 Tue, 05 Oct 2021 17:15:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:15:32 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:15:32 -0700
Message-ID: <CAE-0n53cQwmz2j1TDkfmt7+JLFD3QBkY8_Tb1HPALqsWJFWmUA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per
 controller
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..eaf08f9e7d87 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,8 +115,25 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +struct msm_dp_desc {
> +       phys_addr_t io_start;
> +       int connector_type;
> +};
> +
> +struct msm_dp_config {
> +       struct msm_dp_desc *descs;

const?

> +       size_t num_descs;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const?

> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       },
> +       .num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -       {.compatible = "qcom,sc7180-dp"},
> +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         {}
>  };
>
> @@ -1180,10 +1197,29 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)

const msm_dp_desc?

> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return NULL;
> +
> +       for (i = 0; i < cfg->num_descs; i++)
> +               if (cfg->descs[i].io_start == res->start)
> +                       return &cfg->descs[i];
> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return NULL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
>         struct dp_display_private *dp;
> +       struct msm_dp_desc *desc;

const?

>
>         if (!pdev || !pdev->dev.of_node) {
>                 DRM_ERROR("pdev not found\n");
> @@ -1194,8 +1230,13 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> +       desc = dp_display_get_desc(pdev);
> +       if (!desc)
> +               return -EINVAL;
> +
>         dp->pdev = pdev;
>         dp->name = "drm_dp";
> +       dp->dp_display.connector_type = desc->connector_type;
>
>         rc = dp_init_sub_modules(dp);
>         if (rc) {
