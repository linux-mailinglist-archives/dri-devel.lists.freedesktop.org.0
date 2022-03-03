Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF00B4CC9C8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A319210E349;
	Thu,  3 Mar 2022 23:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845A010E33B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 23:04:32 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso7489230oop.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jZQpccdlXEVBV5XW48/HF6CSAPH1NUoB+GZhDpANl/I=;
 b=c/qUAjUweKw2rta2i7GR4qIr9spmKWqQxkGSY/VbfQLtOj3u9qkS+pxYMXypmV8idJ
 xCGueq1dZ1dGwfvzRR/Zfa5GbHQXBQYI9P2IlQdoPt9xeZH9lE6CTy/xWd4s573YBKnM
 g8n8ZF1rrZ9Y/t0b9ZxHyq1X76YF/yqafoqYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jZQpccdlXEVBV5XW48/HF6CSAPH1NUoB+GZhDpANl/I=;
 b=H9a3eAMGsKQpMfScxVbU3yUmvq4hl5AmxOW1k380U0unJ92E/5rU+GWRPKoJgsogWp
 fORVhvUgEiHe6WwaXXFhI0YOb8wMletUBwVpy1TjjVsKkup/zIJLU/DFIq6869iBL2Dd
 kORTorRRlLfiINVL/odrussNP3RE/hPuYyrkR1tGinU8jE2FxdNTWih9cMX0X1VSELqf
 VuxaEczrPvjLxZuFC1hDxMU25D1OsvxZ6rXwfTP7Jo2P+wpMftSCuLufgm2ZDVq4boOl
 oxogk+Azq8qDBIrC3GxyeGZMeotBvrx2ycAO6MKb7Gs2JmNBED2Nw/xk2s1XQSnGcYXR
 yDtA==
X-Gm-Message-State: AOAM53388oaq+SVTtPI0nwZPuKwN40xB+sBLKFuAJthe9dtJsLl9PJRh
 bbOUudDCoy1y1+DGFjVVGY43fOcDq5ogtxO+5/UCoA==
X-Google-Smtp-Source: ABdhPJwtxRzTqJwjec3If3NOvx+suns7yeg8hgpj6o6n3vB3ZASvqDKWo0zR3tmGIuShX71IDVuArXoKwiJ4Dd2Jau8=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr6999481ooi.1.1646348671847; Thu, 03 Mar
 2022 15:04:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 15:04:31 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-5-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 15:04:31 -0800
Message-ID: <CAE-0n50KN-9G6ty40ZDwwLNMMn3xFPzDzkWVRDU+_rgz2UKsGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm: stop using device's match data pointer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-19 14:40:05)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 759076357e0e..f83dca99f03d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -314,11 +314,11 @@ static const struct dev_pm_ops mdss_pm_ops = {
>         .complete = msm_pm_complete,
>  };
>
> -static int get_mdp_ver(struct platform_device *pdev)
> +static bool get_is_mdp5(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>
> -       return (int) (unsigned long) of_device_get_match_data(dev);
> +       return (bool) (unsigned long) of_device_get_match_data(dev);
>  }
>
>  static int find_mdp_node(struct device *dev, void *data)
> @@ -331,21 +331,18 @@ static int mdss_probe(struct platform_device *pdev)
>  {
>         struct msm_mdss *mdss;
>         struct msm_drm_private *priv;
> -       int mdp_ver = get_mdp_ver(pdev);
> +       bool is_mdp5 = get_is_mdp5(pdev);

	is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");

>         struct device *mdp_dev;
>         struct device *dev = &pdev->dev;
>         int ret;
>
> -       if (mdp_ver != KMS_MDP5 && mdp_ver != KMS_DPU)
> -               return -EINVAL;
> -
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>         platform_set_drvdata(pdev, priv);
>
> -       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +       mdss = msm_mdss_init(pdev, is_mdp5);
>         if (IS_ERR(mdss)) {
>                 ret = PTR_ERR(mdss);
>                 platform_set_drvdata(pdev, NULL);
> @@ -409,12 +406,12 @@ static int mdss_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id mdss_dt_match[] = {
> -       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> -       { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,mdss", .data = (void *)true },
> +       { .compatible = "qcom,sdm845-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sc7180-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sc7280-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)false },

And then no data needed?
