Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475229ED83C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876310E634;
	Wed, 11 Dec 2024 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jKUR2A7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301110E634
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:14:42 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso5782998276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733951681; x=1734556481;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
 b=jKUR2A7xIZaeP2p1zdAXOmyfdjQvbZY5evnsOQecUzROuSkNrYK7feYOHbUxEaegzK
 Ia39wpAf9TNWJxzU+DxO021esHAT/u72Rbx7dhF3lCYnU7k1UEPZ4tGY7FoDhO/jfmAA
 NvGm82G7cUGJ/IiH4t1FkgPLqfgSfDkhmNDXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951681; x=1734556481;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
 b=YNgvyqdxV9uAwlUUvk9BMfuuPd8oiiq/mss5N++BhnQ+cxT9sZFDDLaFuDy0yu/fS6
 0uGfkd5xc5QisfTi25A0ts+hsR3CvGKfOr3fdUq2KX57awCVbyDozXq+IiM8lX6Oo+Of
 UwQ2BMWGoACcduA5DGGkLNB8yqwkA4WVLeS7gRoO3vUNF7QZiz22vM7HsObMwl//VNqr
 vkEz7CnRrmVI3fGtgqxatI0dtVCZ33n4ZskevcwaPdBGFiGsVqUmdCrnzdK+yBZQ66xq
 09sHvI7TNumwdJrH/sMcs/7SYU8tVTm5T4UFeaYmezqB6OVDslknjcv7ImxwFDISd4vU
 XLeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN3kKsr1vdVnduWALNdkAi/aZt5MxaVviQQqcZ2o6M7ZNDa9jFsjhevBjTkFumOGVvLwgll+ic3bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp3y7U+1dfrD+D1sKto35Eg2MFWgZXELrDrt6+YgILJFnYT4QK
 YMVU5QFZTG/PSYS3oUUxcKYVMvp8/QZzmKWucagkKZU2PxQ4mRg6kO37pD9GQwZADeY2aCaHfes
 3OFBQGc6yLXIWtZae5ejPWAt54C9htpmaDeAW
X-Gm-Gg: ASbGncvP1y1yBJ6LHep5r5ALpb9P6eAHjhkIBSN8ib9XTQffSp50g8tzQmbU1hl+cr4
 7Pdl4iaIm9le5i3wkXoZBok2Iaybhh4xQH6ytXfqGshaPfsdClHPzGqJd6+JLIbo=
X-Google-Smtp-Source: AGHT+IGVGcprZk95xhhOtOKM+7JPgPvLrPlsxoiz5xiivClwV1s7VtMi2gtLbOTTJ+cbuh16Xk9oGKjJ+Ksx04T7VN4=
X-Received: by 2002:a05:6902:1447:b0:e3a:5820:febb with SMTP id
 3f1490d57ef6-e3da1df70c1mr852810276.32.1733951681689; Wed, 11 Dec 2024
 13:14:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:14:41 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:14:41 -0800
Message-ID: <CAE-0n52+nKDyzUPzg_uFsLXRh4XQW+TngD6PyuvetTKXthi_tg@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] drm/msm/dp: move/inline AUX register functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:36)
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index bc8d46abfc619d669dce339477d58fb0c464a3ea..46e8a2e13ac1d1249fbad9b50a6d64c52d51cf38 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -45,6 +46,73 @@ struct msm_dp_aux_private {
>         struct drm_dp_aux msm_dp_aux;
>  };
>
> +static int msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)

Can you make this return void as well?

> +{
> +       struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
> +
> +       msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
> +
> +       return 0;
> +}
