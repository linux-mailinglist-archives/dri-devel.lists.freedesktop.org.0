Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42E806A7A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB62410E6BA;
	Wed,  6 Dec 2023 09:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9374F10E6D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:12:47 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-db538b07865so5269569276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853966; x=1702458766; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
 b=rJajSRrWz5LSZ7op188dBFWUY6nL1CBlEbMrpZr9T5nqoj9b9fyq2QmCKd3cMngo64
 OKLXa6d4g86qvRKz8MeOFtKyy9XW+rcJ4F4Htu2zQ7n2Sg6XsGy2+/QEBkSmOirvohx9
 t5yo94R8IyGd0gUHXm4aKzAGvvdqXqeSyJpvgqCGdEaOUsWf0BSG2fYVQUPM5xGVrGWA
 qPdW/tXJQtpuF5evxaTtdPPitxipT5cJDAo4hhZcOmgBXF9c1gDS45ril4vYlxYOA9T8
 +a8FV7D5+3i/FtqCySHWrgwOkxJf6dGeakwIobLZch+3UrYZb0cjW0YSWJhW/C61o/lv
 d3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853966; x=1702458766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
 b=igUnE6x0c9hHWOg+83KFn/DXbPl4ayRglZtqEKvLtESpayQuh7dDTkUYVYMJCsBguo
 4TakH05BsJkrZVidz9YKazBcQquM+mPoikrwOGYC8W3UpHL/pFFmdy9uBg2tcnFMulbv
 a3wlBFHVJ7b5QkbMogwVH7APC4P857VOO+36V+CuIlXzWSIv4mf8JwSQZAWQVOOwhOo9
 cNVtMyyaBJE5EO19nHBzhyZNSie/+tDdgkARYtok1s8JjPb6tcEAnrCazNMapXbuAkM5
 nAGv0BkAigrI59p2pXa7xNufEuBc4QMKuTJRb0UhudNG138/vr5ZKGCgv74YCxt/t3JM
 MMqg==
X-Gm-Message-State: AOJu0YxulK8tTivWV26XcVxZmj34arPb1DNvdGdoWD/NawX/mb0oYIAh
 Txgj023bR15J95cd37aQ1kK8jBP2FBxbLxA13Sxd9A==
X-Google-Smtp-Source: AGHT+IF0IeDJuQTQHa31o0GrY9n748UF5ySeUAAC+78Y2uK2gEvwmXjDq5q4H7heMWz5QEHQTEqoZpREOkNduuqkEVs=
X-Received: by 2002:a25:2fca:0:b0:db5:4e46:891d with SMTP id
 v193-20020a252fca000000b00db54e46891dmr385828ybv.12.1701853966723; Wed, 06
 Dec 2023 01:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-4-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:12:35 +0200
Message-ID: <CAA8EJpppdueDRZ+J+X=QVViQNdhdY93TnDRfUyHXE7-AfQM6+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Move the hwcg tables into the hw catalog.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 560 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 558 ---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   3 -
>  3 files changed, 560 insertions(+), 561 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
