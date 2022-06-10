Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E915A546EA0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDC9113ED9;
	Fri, 10 Jun 2022 20:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF7D113ED9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:46:36 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bl34so664103oib.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
 b=ZJj1KqgR1rdW1l/uVn+xdn9Uy5h5YJC3oGspYfLYmJCRSQeLZEWnQpZdwnMnSyrtoo
 8GPARFoFuqYRU69ZPicw7P8yJiycawGkEBlmAzh5nxQCxcta+6eTUuJCHwqUjjHaLALT
 6bZi2BmlRX6cZTvVBfVuh1+9L384gU+pRXglw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
 b=bLrH8W/GaK9tZvD7QCNjshzqERxYpYAjyGW3tmlARap0pR3RHu/MrTKcPfqC4em/pp
 dL8vpKVrzAQXth44Idnl1CCegEt+GCtd3pdxw4RMxwyIPxerkPCY2UXAbZhdrPQB0/9C
 c2tpmgQ6sET5R/tTc4gY2Bb9pqtmsDUYZPE3HAz1t0YMVC/lptC5xS4pKCTvqtWwCbqN
 QWhHN/jeewjsJUOH9tKAmLnHyNuIxucJqTwqghgelq/DTcwhZJEGs++1DXTSzeUgFiCf
 AUpNphoHIPmU6rsb4ZZp+I8R6h4MHAlXm3di5B8DmqJlpM1GpUAUTBVKuJtt+0UHp8S9
 jaww==
X-Gm-Message-State: AOAM5301K8zXfbE9LsvJF55/mvRDzguMZRjyl/uqRXJtIr4zPSnIGmXQ
 1JETJurOWrCTzvdYzh5GwO1qFNmmGN+YuVX2TD3SiA==
X-Google-Smtp-Source: ABdhPJz6T8iyP5MXE+PWGWDiJ+4fCVtVAbI+1HHpHDGwLRZ4/RlvOsKQRvifEGJuMz7pt9TYFPJ0sL5BhGArjtPw9lY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr891625oib.63.1654893995898; Fri, 10 Jun
 2022 13:46:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:46:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 13:46:35 -0700
Message-ID: <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-09 05:23:42)
> The HDMI driver has code to configure extra GPIOs, which predates
> pinctrl support. Nowadays all platforms should use pinctrl instead.
> Neither of upstreamed Qualcomm platforms uses these properties, so it's
> safe to drop them.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

One question

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7267167d5ef1..6d79f1b910a5 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>                 hdmi->pwr_clks[i] = clk;
>         }
>
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -EPROBE_DEFER */
> +       if (IS_ERR(hdmi->hpd_gpiod)) {
> +               ret = PTR_ERR(hdmi->hpd_gpiod);
> +               DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);

Did you want to print an error with eprobe defer in it?

> +               goto fail;
> +       }
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");
> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
> +
>         pm_runtime_enable(&pdev->dev);
>
>         hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
