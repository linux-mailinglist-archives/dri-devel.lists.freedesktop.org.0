Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F34ECF5D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490210EB76;
	Wed, 30 Mar 2022 22:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED50E10EB6F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 22:08:14 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id kc20so18202577qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
 b=MrMWiYyQdINQwVp4gorVlwJbY2td0hmgU/oFNQE3AX6ulipZQWM3VZfF1PuxnzXbPQ
 s+7n6N9jfFqt9BMx/HsWKed8i1GMk7OS8V/tnboQJnOIRo98PT4ST5wx/yiA9oXvLcyI
 Iz/InO8LqH7YaQJ3Nn904oMAzpYKJbo+CslovCmLznn7W20dOdKBVyZCkTdns5VthPL2
 KTfl/1hI1DkypIk69BYPxS1340Yln2MMx2RB+1wh31OIIteFprSvjDcpvfVpOU864J8p
 RKc8Lx8DlFNrjnh+WIUi8WDsIOrld2ex9L7MzW2ytRTGHK9f9QwA7gKmh14MzcdNku44
 SmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
 b=S7Fx1OBWP1FnhvOANjhWOvmISKkTCFN7AVvbH6llIk/s/8+ppgkgz5eQGZ6DE9fpac
 3OmT30xU3V+UUE/ONH3J5MpImbW4OQgM5TeVyKdz0abnelpkkdb/tXCdaSt2VOqYaoW9
 IB+08xTeZneiiShcvCZyiIZrkPM1AIJDfHK7pKHeXDaKH7gZpSztjEmwln7lgplVaU34
 pBTL+WXxMW/TP/b2UqCA4PVoUigF9xglUYFVWv7rwoDqDVxAxl54vEoPumtsmoHs4+AK
 +DbHWt8oixuINNLdUNo/YzXbKdSVhi3xbwl3Bt//HwMNkFJU1RMIoCBFjwJkpShwX7cv
 iQXg==
X-Gm-Message-State: AOAM531YJFf0ePNDGa6csQPE8dfWHCPA9pVuTCiRhr8hzFlGye0974Of
 wWTlnSf1Yv+prdIN/8xmzIcNwTC7p1hSsv2X2+6qOA==
X-Google-Smtp-Source: ABdhPJxCxZBIWsAez7ZkGk/I9bUyMuxaiqD6go4xQEddYN9/PXcWZpTyR5GqlMGXgxMx7oeLUil/KGE0zAAmBV88l9w=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr1255162qvv.115.1648678093929; Wed, 30
 Mar 2022 15:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Mar 2022 01:08:02 +0300
Message-ID: <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 bjorn.andersson@linaro.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp driver modes needs to be validated differently from DP
> because the link capabilities are not available for EDP by that time.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

This should not be necessary after
https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
Could you please check?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8bafdd0..f9c7d9a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1003,6 +1003,12 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
> +                       return MODE_CLOCK_HIGH;
> +               return MODE_OK;
> +       }
> +
>         if ((dp->max_pclk_khz <= 0) ||
>                         (dp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
>                         (mode->clock > dp->max_pclk_khz))
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
