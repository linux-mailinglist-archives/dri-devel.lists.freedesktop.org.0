Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A048C88CCC2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 20:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC210E7A0;
	Tue, 26 Mar 2024 19:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K8FB7W9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1ED10E7A0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 19:10:58 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso6110626276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 12:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711480257; x=1712085057; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IE7xk3OV0JEnARvb245KGQxZo7yTliXOcGgjSpwEcXU=;
 b=K8FB7W9hzipRutcqKninsJeeMvE0MKbL9Wwd3EH26bsGDezK5u53Z35rTeuthw92+x
 lyNmp/WSHbALgC40xoihmCeQbSf4zOAeKK+1rhGXSriwb50jbqAXJ7E3KE2A/ebY8ok1
 g/AyIS2BzGlDZtQOCxVU+uf66QZWFrL4p7YuJsNGjumM3zppKiOY+XG5/UkGKmDhT5Xk
 jfZKBliespIUlwkm/hgSs2/vLynKNKBYuB8Fo7Y+M27LpHDxccqU5riSVZHwB0ywXUga
 SVJhkYJgX3k7LN7Cf4cWiQjf8v+zQQSLcY/3s+GZFxfdsjYV5hbbjr+d96g8AklrlJ6R
 seCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711480257; x=1712085057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IE7xk3OV0JEnARvb245KGQxZo7yTliXOcGgjSpwEcXU=;
 b=Ocux/suvmMocs9H9nlYDZO0TLh9oZTUJtYVAJaNzB67/zgC5dIufdokcdgSvMjs5Wu
 +FJDDudXMDfNZTAb7xsjZm8suF3OobNdlHy7Iylq3eRWwHEUQIVL6gnq3AD9nYJetjEL
 3JWF0D28lnVFK5UaFzovcG/cAhjEyGtBlPITiPLMzyL1j3UPZmptnRH/XbjoQoJGC5Ks
 pRoSyfkMSv7uTqLEmIQtWg4yzbX3Gaz6NbabgwwUIwohI95cdXOI0NdGDp9NrTmeBN25
 aCxcL1hCj8YaM/rzwRd5Aw7t1HXPlb05/An9x1kywPxZa2lI5zD6FJRUMgEsUbigxh8D
 vZUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPlmQes3jIErjb9n51a4IJtrukni+E9b6vBlYmBpxLYhM1ULCUSzMD4nbsyvEF+5xhhGPBDaobnVJmUwucVZ3dLHDcQ96lwBEXCwDxfBoH
X-Gm-Message-State: AOJu0YypV3JVM0qtWet5NgED0B/ZV3bQVGIjd7UDztWpxQBt/ZYnTbG8
 /+zH8RTdwuSTf0jpjnBKFsAGWK5z8bXefkQPCGdAxKjchNkuO9EQ/5P1aBURzTJkJFSO1+q7PaH
 Hg30dtglg4N+SKpg8HoeiIUgR+rYtDk45RaJ/Mw==
X-Google-Smtp-Source: AGHT+IHxqKh1R1vXRToBFH4FuBo80Q2nNxyZ5k8075XA5DVC95AeGuZIe36QWl9BniHxxTeZsSRtUf9UFqbtNqvcfSo=
X-Received: by 2002:a25:b103:0:b0:dcf:4663:ecd8 with SMTP id
 g3-20020a25b103000000b00dcf4663ecd8mr2128971ybj.8.1711480257065; Tue, 26 Mar
 2024 12:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
In-Reply-To: <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 21:10:45 +0200
Message-ID: <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> > On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> In today's next, I got:
> >>
> >>      drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> >> 'out' set but not used [-Werror,-Wunused-but-set-variable]
> >>
> >> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> >> fully implement devcoredump for a7xx").
> >>
> >> Untested diff below assuming `dumper->iova` is constant -- if you want
> >> a formal patch, please let me know.
> >
> > Please send a proper patch that we can pick up.
> >
>
> This should be fixed with https://patchwork.freedesktop.org/patch/581853/.

Is that a correct fix? If you check other usage locations for
CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
being incremented.

>
> We can pickup that one with a Fixes tag applied.
>
> >>
> >> Cheers,
> >> Miguel
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> index 1f5245fc2cdc..a847a0f7a73c 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
> >>               (block->type << 8) | i);
> >>
> >>           in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> >> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> >> +            block->size, out);
> >>
> >>           out += block->size * sizeof(u32);
> >>       }
> >
> >
> >



-- 
With best wishes
Dmitry
