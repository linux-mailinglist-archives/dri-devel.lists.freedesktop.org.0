Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C6794611
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0D710E061;
	Wed,  6 Sep 2023 22:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F40A10E061
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:17:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-501bef6e0d3so460637e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694038621; x=1694643421;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xvVwhpnlwNzr+usIzIqnD3cRa6Q/AiTqXgbhLyI/lno=;
 b=D0OfxY0cPjaGHYDsCAvQFna7QTrjX3x29T2qQ16EA4OyJKJnmCOV0BHwiPPL8IzCA9
 bliVBhgHZRY1rfVvjXVGyS9WYq76W1Ak3HsHuH8X2L49E2HlmvU2B22MclWNBxEzLvjY
 la1qgTcuD6syvNQxsS6L6mRe4y54Nvu/I6ezM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038621; x=1694643421;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvVwhpnlwNzr+usIzIqnD3cRa6Q/AiTqXgbhLyI/lno=;
 b=CMNa38hm0AtFiQRZRdloWqAFuABBmG8/J1Q15uIavz3uiyWCChvCmMQqiVB2H89OVX
 qXQfOE4EaOicQPcTL/w9VSjCLpdo99HyTsu4nq9jugZQnbxK3paTCYU6xPZJzhe61Z6e
 x2IGQS/GJZhLVa0m/6kil31DRQ7PfHD/RCqhnW0ECN8Yi0NlplljXMn0TNiZHCaprScU
 rvU5YKQUWtN2+7Q9+829IUMH+71EBT1KodCqeGBv3DheSGw+cjzq5pCxySbfVLhCD3rG
 PXguR+n0s6NPa5vW/GnoCRT6R4NijEeqqpy1Alc+zrviIqJ58AqcdugAtZ+XCOkF9xKw
 Hhew==
X-Gm-Message-State: AOJu0YyIUno3cdiXxFx61k/BAEkESgs/9COWO7Yp2tH/+zFcVHTJQqYX
 WNiOX3RfgaqEbEXTAFoGvAyg2OO4QL9n72ecI+pN+w==
X-Google-Smtp-Source: AGHT+IF0QN7CGrq5HjfoeEiLhMpFc/07tVOfGRJGFDdL6rXW2yk02UxhV34jvxb2uoMeKNEwmc97DMzMIp4V3NTlM9w=
X-Received: by 2002:a05:6512:3489:b0:500:c4f1:6bb6 with SMTP id
 v9-20020a056512348900b00500c4f16bb6mr3151846lfr.61.1694038620631; Wed, 06 Sep
 2023 15:17:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:17:00 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:17:00 -0500
Message-ID: <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-05 10:43:50)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 59d2788c4510..9d0d76f3a319 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -50,6 +50,24 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> +                              struct platform_device *pdev,
> +                              const char *name)
> +{
> +       struct resource *res;
> +       void __iomem *ptr;
> +
> +       res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> +       if (!res)
> +               return ERR_PTR(-EINVAL);
> +
> +       ptr = devm_ioremap_resource(&pdev->dev, res);
> +       if (!ptr)

devm_ioremap_resource() returns an error pointer. Too bad we can't use
devm_platform_ioremap_resource_byname() here.

> +               return ERR_PTR(-ENOMEM);
> +
> +       return ptr;
> +}
