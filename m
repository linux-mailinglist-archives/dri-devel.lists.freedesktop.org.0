Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604664E69A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5E510E2BA;
	Thu, 24 Mar 2022 20:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E410B10E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:10:56 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so963890oof.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
 b=kcOz4sNHlAPOruy7YCAfNWOY1Gd/j/5RqZFCbHSd3KEUCGEtbWxia0dq3R0vcmxkRU
 vqPA3yD3ug1UmK2QW4h/2ZY29MaIJekC67w+7BZNk7EDgZkZ0pJzb4MyR72evX3wksDl
 HA8f2MHUbOW7qeuHOtp8o++v1e95s8lLdm8sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
 b=3PCUdDQJpJFAPvqdniBnElX6v0qb6Bn0fBh7/Ar8byakW8Qrjk/i8C3G+rBmbgTeSr
 8KXWKQh/1fuWv6Yi7FDmysvmTNtQqsXqorDkWtugyG4kiQSnFaPw59VoVpfeBCjiepi9
 EcBL4+NqZnaXoZRlD7lhG0ANzs8Srzyld4EbcV7qOCw9eiLVtNUNL3+QopQxJX95rEwM
 rdSN7dZzGOpcn26J4gygEpWj/p4BiL/3hJ+VCjpUX43sfyqmnvTxbZOVNkRwcMDmghJR
 KbepqYic+2zKFYJ/JIhuAa47jVew3Q4ZX5tUNHTtDUvYjM/9PIMHSYAiVVR8hgM48gM0
 vuDg==
X-Gm-Message-State: AOAM532eZzb9vNAp+DpGRcNARzV4NU8V94PeymYAeEMxcUeJMkrpSo9c
 MPB47JfbCcsHeRSZJO7PXuAY+Kp6zqvZgv+ZfxAKCg==
X-Google-Smtp-Source: ABdhPJzVqotRv3dsKpqXe41FlcBvnEMyajt3qss8lRnEfrhr4dODFNc3DYv6JPQ1uI1GUFupgzeU+ZOO6Qs85MrhkTc=
X-Received: by 2002:a4a:650c:0:b0:324:b0a0:2d23 with SMTP id
 y12-20020a4a650c000000b00324b0a02d23mr2658457ooc.25.1648152656210; Thu, 24
 Mar 2022 13:10:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:10:55 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:10:55 -0500
Message-ID: <CAE-0n53pUrV77PiYDpaoNX-wkaiJOWzPApokrk1bQhiWbL_=VQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field from
 dp_panel/dp_display
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 03:35:46)
> Since the last commit, the max_pclk_khz became constant, it's set to
> DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
> and use DP_MAX_PIXEL_CLK_KHZ directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index af5f1b001192..a94c9b34f397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
>
>         dp_disp = to_dp_connector(connector)->dp_display;
>
> -       if ((dp_disp->max_pclk_khz <= 0) ||
> -                       (dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
> -                       (mode->clock > dp_disp->max_pclk_khz))
> +       if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>                 return MODE_BAD;

Can we have a followup patch to return MODE_CLOCK_HIGH?
