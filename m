Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C936DCE36
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 01:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F510E332;
	Mon, 10 Apr 2023 23:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A912110E332
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 23:39:00 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h12so3317122lfj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681169937;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=rJ31ZihTsj7BqFMhLU8sqsCWE1qhH5SDejc9nQiQy+s=;
 b=hBkprc6F16wliwY1n352lea2LlV8B3ZWByS9Otf2VX5BRNrEgEmqyraV+yg1P29RQc
 YulzgqCfEvZBUMvbwbwJXhzAOyKEa/xr0+6qRrsz2/wPtAgF196JDvR4TNUnFaWbKxgD
 rzS0o9cXr4lmv1Ud/HgR+npppAdzedB+gEXEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681169937;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ31ZihTsj7BqFMhLU8sqsCWE1qhH5SDejc9nQiQy+s=;
 b=z5BQYyrXqrUO1wN737RyGvLTX6QQkow7D7ffmoQm747fh0yKMFrxu2FVxb1Fk6IJW7
 jwmV16Wbyc52EX3MyVMqsHOt9S0OHEgzAQ4xgM4hm2SrUn3StvltblE0IT1dMUYUxEW5
 KcqUrGrszBMdxkpRLxbHFTsbXuBQQFSaWdM/u2s+lG4toi81A4bwtfvaF5GlYWSL9QQG
 ybaKRuYOwKE4/I4ipXKB8e6B7aXqqHfCK3z0ivJTywjeWoZnBV16UPb3HipsEFy7Isl6
 PpADlCGKnhZaDZTZaLunwdhTKkD4hMBGm/B8Y+E98wImqu6sp7lpAqsWkspVlZuoRKY6
 nmkg==
X-Gm-Message-State: AAQBX9dUwn9tBolAfddTpQNSMLX5fkFMprRBdBBJKsf0V7eSmAl9vr/D
 ahgiYBDtA73pWe9SZTbhbpZXUhR8qjeZmQpvmEVHgw==
X-Google-Smtp-Source: AKy350YKBWAwplvBaUzF0rnPFrcqHdEcRGOoZtR0Ep8v4lU4JBnM3J5FVOHoKAMe6Fw+M1pWneNg6yBiNmIJpZKosgg=
X-Received: by 2002:ac2:4c14:0:b0:4eb:eaf:aa00 with SMTP id
 t20-20020ac24c14000000b004eb0eafaa00mr3474139lfq.4.1681169936786; Mon, 10 Apr
 2023 16:38:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 16:38:56 -0700
MIME-Version: 1.0
In-Reply-To: <20230410223836.442836-1-dmitry.baryshkov@linaro.org>
References: <20230410223836.442836-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 10 Apr 2023 16:38:56 -0700
Message-ID: <CAE-0n504Tt8MeWXF7xLeKoTMDciLEVsZagwC-t2nk+XGUc+v+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: warn if chip revn is verified before
 being set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-10 15:38:36)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 63 ++++++++++++++++---------
>  1 file changed, 40 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index f62612a5c70f..47e21d44ac24 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -145,40 +145,51 @@ struct adreno_platform_config {
>
>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
> +static inline bool adreno_cmp_revn(struct adreno_gpu *gpu, uint32_t revn)

'cmp' in the name makes me think it's comparing. Maybe 'is' is better
because we're testing for equality.

	adreno_is_revn()

Also 'const struct adreno_gpu *' because it isn't changing?

> +{
> +       WARN_ON_ONCE(!gpu->revn);
> +
> +       return gpu->revn == revn;
> +}
> +
>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)

And then these can all be const in a followup patch probably.
