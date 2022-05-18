Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB78152C0EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A671910FA5B;
	Wed, 18 May 2022 17:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B6810FA17
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:16:50 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id y20so1959881qvx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AeSKmYpRieplJqbY6dZu9gnBsUw6uzmIsnN1W8K30V0=;
 b=rLbXfVPr7deF6X6x3JTT+dODTXXHBuyYgpS/GGl1rtEAy1CEVGDA170Y9JrQu7WGzk
 +cA8BopAxiZh9kaM0hqE2z1HxRmdGQbfwZdIjXDtR8mULrC+rOMwQ6mV1O6Y9QiaBRWy
 f72wu3ZVo3173GbjXSNByN983NuGJzJIpnX7TtpZ+/K8+CMuWbm5R/igzyLyW2ffewlJ
 yOted1Uir1/frn7sScctDnEm/BMkgP0Ukb1xP005pgvK/tXxe+z/VQ5hpzq0qZeictTC
 e5ggi7/m3fB+TBwqa6jfyibDPjfdTckiNK4Lnl8FiDEs5PN42VklBFT0BPIPmabmkHgw
 Mz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeSKmYpRieplJqbY6dZu9gnBsUw6uzmIsnN1W8K30V0=;
 b=NBfe2WGSkyrpztmCsFKze+fjf4JWr9JeOdLitHxecjw/ujQa+pYLPaLqvTrLxsmLcu
 svQgzVuUtM1bE1vXXmy6vTKUxlw5luHBhhQJpg7xaopg9WaZguyNFgNlbmjK99/8aqcC
 ynBG1U5CPofEmqwqNSIz47NWM7740FTIsMCubrp9ZJVUvXNRE9J8rJ80U3DBwbk4eYjL
 6vo7yZxWLrXAmmPcS+kmEfOR0HlBYdeppB3Bg4MXEc7Oi8CGCWFgtgn2+m2/U2JHI404
 Uk7c6NIHQCvyPRxTilE2E6yasexeA16WiK3w6NgNhUnY6cJXc/A8jYO3XEDxJK7CUaZg
 2X4g==
X-Gm-Message-State: AOAM532qfagPZK2Mt4AhiYgmxOM4YsdffEdaGCISbN4oYKxgZcbf8Ew1
 TcOg6dF370+wVhHtmFBukTP/1+bGz6dvYV1nMkQaTA==
X-Google-Smtp-Source: ABdhPJzVWhb7JxBV/NHJBAs5arvGPcD2jM/v5t6AhXoRsB6n8cdbpK+D+p5XHnapodoBy5oTR6gn44rqH5iIEDFC8Kg=
X-Received: by 2002:a05:6214:931:b0:461:d289:b7f6 with SMTP id
 dk17-20020a056214093100b00461d289b7f6mr558590qvb.55.1652894209627; Wed, 18
 May 2022 10:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 May 2022 20:16:38 +0300
Message-ID: <CAA8EJpqq4fxxgY0mj0JBans3GE-HAuad4Zsf7Ntwy1WW3bHbTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] eDP/DP Phy vdda realted function
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

On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> 1) add regulator_set_load() to eDP/DP phy
> 2) remove vdda related function out of eDP/DP controller

These patches touch two subsystems and have a dependency between them.
How do we merge them?

>
> Kuogee Hsieh (2):
>   phy/qcom: add regulator_set_load to edp/dp phy
>   drm/msm/dp: delete vdda regulator related functions from eDP/DP
>     controller
>
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
>  drivers/gpu/drm/msm/dp/dp_power.c   | 95 +------------------------------------
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 ++++++++--
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++
>  5 files changed, 36 insertions(+), 117 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
