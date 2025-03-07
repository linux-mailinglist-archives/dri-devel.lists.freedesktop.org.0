Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4166A56CF0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0A10EBC1;
	Fri,  7 Mar 2025 16:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P/ejF1cs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B810EBC1;
 Fri,  7 Mar 2025 16:01:58 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3d442a77a03so3100175ab.1; 
 Fri, 07 Mar 2025 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741363317; x=1741968117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyzCZ6tPew94XfiS+4OSnxV4WHqqsy2FInPHfaV1vig=;
 b=P/ejF1csdH/oLoNOtWzejQO0iFVxeIUbWEYZZZm5m+5rNWw4tq1vr8o7kIA3L9O8Jn
 WiZfM1bWWxuG4t3GjbR1K6V1jWyZMvwMkmGmnzExbctJTqKgN7wXn5qEByOX7AN3kqLl
 jekXr+AZgYlSNRBB+y32VEaVySlrSeNf2vwSKMYCpR1fYNU87z9bmcjYq+nDU83lw7Dl
 mD0Xm7f7i94dDFyvyEUEK5dEC7vWNFi3Tc0zE1ZLc2SCx5iTj1sCSgFPwRe26KeW2Bd1
 F7DBxSsPXXjOefLJrwS5NTdchZPBqXcx8O7doFxBuFOeDvHcomtHe5h+nUq8f6ISp2mL
 f95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741363317; x=1741968117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyzCZ6tPew94XfiS+4OSnxV4WHqqsy2FInPHfaV1vig=;
 b=KMKDMETIrEL1YoX0AdEc8OCkDROoByhd/6MCh39C2Azw35qNmwTJsWx7OnZ4HsOshM
 vZyiX6Vvb3OewPOa8iCE07Z0UVbOs1JMoqezZOs+9uWjndFbNZw14wsaEcYvhhC0qGa5
 A/PhfYVlY/05KfepEpy1CDmNgraTHZWO/WL0Jkw95BEJhOqXgCV+VMz/yYL6BRqjGzh3
 DgPeXu2Lkq2+yQ1oVOBMxqYbafsqGO8b93gf1NtnAk8KSndiAAToGW8qe6B+sepvee11
 siTe++7dBj6Yhg4Hg3KoKRPvWmrR3zTCX9cPcAYy7V7EAESebo+QWNOlMYcG7/wNxvgd
 mJqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfBhbLJAo+7Q149atwDAegfQuGTd9SDhfGr5KGDJQLOGf6h5CtEn2W8oFLncSOT3AFsXyO9VXphfKw@lists.freedesktop.org,
 AJvYcCXZvJT1jvvjFYtvXZa4PzCeVpmxsy5Nqjla6IZ2QlP+PHvh3NtSUgWtl+GKP75WS94eez4i1qqR3dc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyLwqmidQvOpAOU0pDBLOa9umj8DsPTy13PnXa1zySN5OLAbgp
 A0iKHuYQfX+jQ67c2FqWpLvwXKGz44EUe3ZV6P4JrLci7D6ceVhLjU8bzdHPN99mr7BiPf2Saih
 zwLvG1qsSpDE6RTs7onT+xv9buWj4rQ==
X-Gm-Gg: ASbGncvnU8iy0INb6pS2Zf3Kdb+wyi3X/nNMDI3eHEuHorXMWrpa00q7MNRtlSaNEKv
 C4fj1+X+3gVZgXoyZBG8Ol/uO5GTtMCNGElSVCospTC+i7KNb6caZcNymVyRVWvRedciukW7yxR
 tz2R9MAu6Pr3r1wFE1QW/OWXejtg==
X-Google-Smtp-Source: AGHT+IEqkZPqqdSckRO+B/IhTs42SUAvVrOyCHyKIDGjAnzV0O98IKKaPcGzJ9vvbFiyM8RlpzW+Mc3ryp1hFh9MUp8=
X-Received: by 2002:a05:6e02:1a0a:b0:3cf:f844:68eb with SMTP id
 e9e14a558f8ab-3d4419712b4mr45334665ab.4.1741363317257; Fri, 07 Mar 2025
 08:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
 <20250306-dpu-fix-docs-v1-1-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-1-e51b71e8ad84@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 08:01:44 -0800
X-Gm-Features: AQ5f1JqcVpnB0n6If-cKi8SOKwKukooOgmurcZp1EWDwVWSRGs12k5HWlnnV4MI
Message-ID: <CAF6AEGv9ViJtvnYM-n-+oHY_Ky7KvBtng_2EOBDtyTL53SB_hA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 6, 2025 at 12:22=E2=80=AFAM Dmitry Baryshkov <lumag@kernel.org>=
 wrote:
>
> Correct commit 20972609d12c ("drm/msm/dpu: Require modeset if clone mode
> status changes") and describe old_crtc_state and new_crtc_state params
> instead of the single previously used parameter crtc_state.
>
> Fixes: 20972609d12c ("drm/msm/dpu: Require modeset if clone mode status c=
hanges")
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index b0a062d6fa3bf942ffd687a91bccac3aa4f06f02..536d15818ba24f8b11f24e3bd=
9726d31c57ef531 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1395,7 +1395,8 @@ static int dpu_crtc_assign_resources(struct drm_crt=
c *crtc,
>
>  /**
>   * dpu_crtc_check_mode_changed: check if full modeset is required
> - * @crtc_state:        Corresponding CRTC state to be checked
> + * @old_crtc_state:    Previous CRTC state
> + * @new_crtc_state:    Corresponding CRTC state to be checked
>   *
>   * Check if the changes in the object properties demand full mode set.
>   */
>
> --
> 2.39.5
>
