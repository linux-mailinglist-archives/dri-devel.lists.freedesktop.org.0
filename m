Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105D88B27B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF110E8F4;
	Mon, 25 Mar 2024 21:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GvXkDAEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006810E8F4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:16:43 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc742543119so4559922276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711401402; x=1712006202; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
 b=GvXkDAEdXHog9HdmP6TJqi2o0G4shpHqq2Ugr8zzDZIk/4e4DQJ3InYV1QucXjbrfO
 XzX4M9iJV4NEKWRMq4Nk0i3TVNiyhIIDhZAg0qpO3J0Pc/ETMoPq4olnoSDMFXNmve9f
 /wJWYzaxyAt2D9FNl4GSAW9gWLQ6BUMOQuPGtPEUTMVXt7t/BENcs3pbHJNr1s+DgEKE
 dztckC4BoJud74EdWDO1UGaZXJrXuvV2oefdHwrbko3oUa2cKe/VcrtEWnlrIbMlvDCl
 7XBqbl52nlmmpLkx3p8Vkx7tNursUuXTLZamQE/tH0qEUUFCbbtaAo/hTEcmEUf+8bVq
 XLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711401402; x=1712006202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
 b=gRomlizQ58PidoAybRUd4uLiMzEN4f1tmrVVOZjRU9VARRQzR8Z3xNxVfs0G0V3iOs
 j3bt+da6fHabYXufaNkXl4qAS/7VzG1DTO91dmyS91shUF272dA5rlvJKQBStuysr7Zl
 TW7pIFXObBJ1TiYA98043Ks9y5dPKv+/LCRQfwU0U+pbWjQBWHanIlfh0UNEPdyjIQWa
 o+nX48tB5vP21CSNt8Ei/CBbS7YgFFVKIe1FypdVjd2Uwh0gHzWyNPPQ8vq6dJWgjnIG
 fSETiV7gSPZApaTj1eqmpN5gCRww0ZX/QZqIVCVUqUdGy3Ywd1V7mufnzWKaNs6TEw6t
 nXcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfsU5BQdV9YUJ+Ue0UCZ/l4fqY0WRGTydcD2V+QrTvaDUq4mZ8ceHsnBVqgmRg0z7cxpNLJsr6YO3ydHzA0zzvHG3FzJceUZbQO0PLfm2H
X-Gm-Message-State: AOJu0YzxjHTpughvaO9VuVDaR/ocjZYVSOq8ZdN7jRrGQXs+jhjZu7Jg
 SokxgEsnOvDLrcMtAzQWFFy2GPED+W+06BYkkLi8DF8eZ5QOvMsDH3L1GRogxoNHKKXvuE59X4v
 K0Pvg1lQfxfHt2CyW2oFmys34HcPAA4PBtyiM5w==
X-Google-Smtp-Source: AGHT+IGmfJuEEZK0xXYu1atPPd7gdTrXAHTMAqXWgAFibdrfnqzHArI0XM86kbZ4hMgAFB1mDKzR3VsuVkcuM2xu2sk=
X-Received: by 2002:a25:a1c5:0:b0:dcc:52dc:deb5 with SMTP id
 a63-20020a25a1c5000000b00dcc52dcdeb5mr5391964ybi.20.1711401402341; Mon, 25
 Mar 2024 14:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240325210810.1340820-1-swboyd@chromium.org>
In-Reply-To: <20240325210810.1340820-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 23:16:31 +0200
Message-ID: <CAA8EJppFc7+ca1JA9cbtAEV3+Ln6BoTkzdqyq88_gfN+m9fiPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add newlines to some debug prints
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, 25 Mar 2024 at 23:08, Stephen Boyd <swboyd@chromium.org> wrote:
>
> These debug prints are missing newlines, leading to multiple messages
> being printed on one line and hard to read logs. Add newlines to have
> the debug prints on separate lines. The DBG macro used to add a newline,
> but I missed that while migrating to drm_dbg wrappers.
>
> Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
> Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry
