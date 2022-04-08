Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EF4F958D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9475D10F0FF;
	Fri,  8 Apr 2022 12:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291C410F0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:21:53 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id 10so10385648qtz.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
 b=K+SFu/xAxfSv8ptmfSt0vivA6W2FAX95a45VvUQlpVTHnKOdxmllKplZItjMf+HOQC
 9DYIktpng9TB25OnHxCrL64xd6fagaJZqoStF5Wx0Hy3ikDlXsYpsImSLq3jJX7NTozr
 jtJAtIG8hw7MQ1aH37SBKuyIZgS9cGBl6TipnChp/SytE1xsSgwhG4Uzcr65ZrCPcP+H
 sAhYViuQqi8e3dsmU1FBooELOGstjUC1c8KwpSr76ErlET7J3vbBGnI1/nfA4XuHLqHU
 HNG9mVm9fFu/DvOkx0m06XL6cqKui8Sturp1GWXhuphbUv9x0d4AJRfHRzn1njbuw5PG
 NScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
 b=XFjlYUtjJuJBxSM2WqEzFUoL6eMWUx+W9siujPigrLydpxxWnOGzrq6PYMQZCn2ybQ
 7/Hz6SKGobCTe/ve0Ee8FNYcVZ1loebWNje0ACh6+P8tESeA0rW4KiUungcGIc991kbA
 l89FZ+q3A6E9e+ObkekihDvz1j2R0w6j/JL/pM7FwQynH8Wz7WvxylRc+On/dEHljgjy
 9koGpLoEuKlUezcBn1a0kdZGpMjiRfnUSk4+yE7mUVz0VNDZCz43R5ZuugbbE9mFJ84W
 DxRHrvGjo9U/KsVUOtoqlei2jXF4razspefiqBu2Cr1Dd69803124jVb73zbQM6YPP9c
 0fSg==
X-Gm-Message-State: AOAM533f3ujGpbFTuQnNIONqVqWgsq7oS7nqEIyIu+5ADpxfmiAG+vfE
 uyMG3Nj43Kuo7kXDHGhkFXKilW84RbuyFk5LrdTI1g==
X-Google-Smtp-Source: ABdhPJwFncjOacPlNFbEfJskgVWNz1y73VUg9c9DTYFByySPmUZZzySIYxy5P7V4YxD2DiJx66tjsu6VB/xf/JxBQmg=
X-Received: by 2002:ac8:7dd1:0:b0:2e0:6fe1:189b with SMTP id
 c17-20020ac87dd1000000b002e06fe1189bmr16058848qte.629.1649420512329; Fri, 08
 Apr 2022 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
In-Reply-To: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 15:21:42 +0300
Message-ID: <CAA8EJprFBJeQQo79LOdJR0pA75wbzM64KRnPLHqLOGJ2KpJkEg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: check the return of kzalloc()
To: xkernel.wang@foxmail.com
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 05:33, <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check it to
> prevent potential wrong memory access.
>
> Besides, since mdp5_plane_reset() is void type, so we should better
> set `plane-state` to NULL after releasing it.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> ChangeLog:
> v1->v2 simplify the patch and update the description.
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69af..50e8542 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -90,7 +90,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>                 __drm_atomic_helper_plane_destroy_state(plane->state);
>
>         kfree(to_mdp5_plane_state(plane->state));
> +       plane->state = NULL;
>         mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +       if (!mdp5_state)
> +               return;
>
>         if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>                 mdp5_state->base.zpos = STAGE_BASE;
> --



-- 
With best wishes
Dmitry
