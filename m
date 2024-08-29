Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A29642BB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CC710E61B;
	Thu, 29 Aug 2024 11:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X+po/v1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A26210E61B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:10:27 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e026a2238d8so604647276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929826; x=1725534626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
 b=X+po/v1hV7ppAP7m/Tug1UGZ5LmNRQ/gXqQ3DshM4PgYa29gBnev62vaDBYYfG+752
 UXn0oHdThrKAVDfPBZomk1TG+3HU3KqWM8h0lSMCeXGGaf+3zEe7YXpcoe2xBuSY+cvN
 IY4q6yGC8oiaQ0/2CngzaCDi0SkrYymrmjkq5mMlXR+pdG4a42+L6SS+srJO1gahOKZO
 mDaznlrj8QXiG9/ibQ7q0Ae1V8nKO6W3FJLAdC32th0FK8orgRjDUxdWawRwdrsc7yja
 wK/o9eA4MxRZTscW8ZP7rKPrevCqO6UyICyKoBxFmTU88O0hwqnZWmzkw7zHpd2tE9jX
 y/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929826; x=1725534626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
 b=P9rk7VyvyWpAuoQr+JaLrcuuy7HztpgJ/W6esleResegZpayOv4LtqkOcYI8OULNaS
 +qmt6ev6m6FGuEovzW8P4Gfi1YpkbnbcS93RrGTnZ7uPjL2P5fcTd4+FMwaO2d8TTohn
 xgiceHRV3N9NkROcyxGVdo/M9Q2gzdQ7wvM8oGa7sAaRPOV2i5UC9WKTbnSWwufCITDc
 Btg00uYZupPtVx8LXpkb6Lx9bic9kZMXIGWznIdmkdHTpJHtO5y/G4XqacpuS1c2EvMa
 B5Z2N/LPh0MrA7VnZ76SmToYUyj6BfhVSNQCO1WAJMP3TnbY9WpA9XrZcqA5YHv9juj8
 +CNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKKvNUnzXio4jcruISLXO7XPQUjWW7T2uu1p+7iPveDAqenE+cg6fvMeM+wep6YouhwuX+I/7Wl0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwujK4whO9wgTvDNfseP2JIFQi8oA1AHWmH2xYxBIMtz13qo6cu
 na/W87L3G8UsM3qKbqc0bqY38Bt8ECSCT4J5ReB9JQiSwnobDL6jYpzCep3wgS+fMmaHLix58a9
 LvPHqITd6Qsnxa0CYx9SiK6BKjLYmVkRcL0quiA==
X-Google-Smtp-Source: AGHT+IExKB2y+YYKi+w/X2u1O51Cl6dOZJ7yQ6Ws+aZXHZmk8aKxUzPH5YQQBBnmoCI91r2oWOFUFXCggGYyUusPgOo=
X-Received: by 2002:a05:6902:e0b:b0:e13:cb58:dd15 with SMTP id
 3f1490d57ef6-e1a5ab47dfbmr2665701276.8.1724929826178; Thu, 29 Aug 2024
 04:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:10:15 +0300
Message-ID: <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
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

On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
>
> Do not assume DSC number as 2. Because there are 4 DSC in
> quad pipe case.

Please expand the commit message. You prefer brevity, but your
comments lack clarifications.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6bdd9c21ff3ed..05b203be2a9bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>                 if (dpu_enc->phys_encs[i])
>                         intf_count++;
>
> -       /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */

Why? DSCmerge is a valid topology even if it is not supported yet.

>         if (dpu_enc->dsc)
> -               num_dsc = 2;
> +               num_dsc = dpu_crtc_get_lm_num(drm_enc->crtc->state);
>
>         return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
