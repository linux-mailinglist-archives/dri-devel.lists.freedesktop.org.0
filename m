Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41D4305E0
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 03:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9B06E90E;
	Sun, 17 Oct 2021 01:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F06E90E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 01:31:21 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v77so14780491oie.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
 b=h9Pokhi4AVZI55uOa2jKdmsv1a9iMYO6Olt4WTnzPXHH1FearCdMb+CLrENVdDFx9F
 r+dk3bWzipc0ifqGDMW8qvRcQGRlZU//OAQbH/kZbfAKAh25odMFAv6FZdL1fDv5ixBe
 0qIlOENPlbW5mFiKP9X5w4oAif6j1ttN8V8Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
 b=4UIGXVja/KcGV0zU0OLsyisj/HbunoRLqnIcYpM1aMHFdlEzc5hA511ZtynZbSma+7
 roVqGJnKKNrfUjSmgmPWfUZd11g501OlxEaVgtGtKC2nZDcLP85szXjVgSLpkuBYLoZQ
 PoYWQGxaAlnhFKx6LS3RhDNiTrtfXemR+Tjyqq0LESYbpGhtvjpBNYJaKZllORf2ywqu
 AkKaMF7W1e2wVudV1sxkVUS8hnqPnaqqAzj5locurLKaqVXfVCR63EvCmqzOl9NUExv7
 qD6+0k2qZNpOrn3ndjKskp3o68Aqjpq55Sz0hM1TvRbqTuvP9aqxKeYePfCGT+PutfW/
 ZoRA==
X-Gm-Message-State: AOAM531amSTkxZkSZGXLtdoPZRFK1K+UeJnBoxIGyMxAyaObt4R/vdRu
 m4QSiAysk+WnKtyZPvFADfjIJf/pdamVAwM7eqHLAg==
X-Google-Smtp-Source: ABdhPJyugEUY5uN9Q+jCOvC6LoW1QUtqZ3z4ufKS9HicaDBtN79ngOQb5eAvAKrduNWR9bmcYtqK+pwYIsIhVnOfYlE=
X-Received: by 2002:aca:3306:: with SMTP id z6mr23201636oiz.164.1634434280958; 
 Sat, 16 Oct 2021 18:31:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:31:20 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-6-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:31:20 -0500
Message-ID: <CAE-0n51WqRgoY11x_y-LoNAwzaZZWDgWxU4z+bcfRRa7OfaAtw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/msm/dp: Support up to 3 DP controllers
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

Quoting Bjorn Andersson (2021-10-16 15:18:41)
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
>
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
>
> Then extend the initialization code to initialize struct drm_encoder for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
>
> A new enum is introduced to document the connection between the
> instances referenced in the dpu_intf_cfg array and the controllers in
> the DP driver and sc7180 is updated.
>
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
