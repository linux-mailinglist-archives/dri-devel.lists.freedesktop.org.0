Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC627DAD3E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 17:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360CE10E18C;
	Sun, 29 Oct 2023 16:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EE510E18D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 16:39:39 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a7d9d357faso32427177b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698597578; x=1699202378; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tl1cBv3dYTwBgbuAiIEubgr/5XL2B88gltLfW0waoWc=;
 b=mPs2qPGh3s4C7PwH0MmTxSUgeaq7dkuHy8mVbaxbcZWInAbiSaUjTmIQiWi0J4Kt5C
 fE/xIK0DEYncJpzOjFelmDZFzh6gf4oHWu7PyLUEnWSRTo07FgK6kZengFYVO0djXmp+
 Nxd9oPNVc5u0hpk0Q1l1/yUcwoMEen9W+XORGt2+ny/vWd0NUv+OXMTqSE3EKTicl4sc
 Bjl4a1OgeDxON977kasIgTcv2dXEvqy+yxRFf0cxPX8M+jBBBwerGonAFKz4W39NdlzX
 wuOv5LdiP85pdqI+wK3C7b9Lt2Bv5JaiLcwemY+ZoONlJW40wMMYOkmsR61rdDRbngt4
 0nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698597578; x=1699202378;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tl1cBv3dYTwBgbuAiIEubgr/5XL2B88gltLfW0waoWc=;
 b=pEYKgGM873iGmfI2vfkeXSmrvHG7DNxHrNya992wc9gCg4AkhRmYUX6+ER6YgP7EQC
 3QhraZenafM8hoInKL8CyPOMkkRHwpFOa/HMaYnG6+TMmFLnUyAvxJEInN7fidcGPmIN
 er/vshJqvGjgvAfQSM7r4xokjwJ4FpPreri8t1NgXWP4uEhv5tWUkgSzH7hQ3+cvcn2F
 Md9/Zip4MlGl7GDlWafNWIE65aKIGicW+mfGSCt03AHPHinLSY9yFYCaj3P3+wERHS/J
 fL9btTZ9n6m+ltmMdwEdZ5Vd4M5+ORclpUfpweMwlFrF+eSOBlHOzCpLeWtb8Dy1T4gR
 GwKQ==
X-Gm-Message-State: AOJu0YyGaasN91U/IdBbTjUAFiV/wMayD6kp3O4dKgPyi53Oq/vQ54xZ
 xq9aYYdPTGyAnbquu4IXns7XYOcklWjc3kC5uULtRQ==
X-Google-Smtp-Source: AGHT+IGjPBBWyNNN0IUoNRwk6XwQlBXRCJ8+mgcNMtr7YdPC3bwRkZo25mPX9aJNUaKgoHKiqak2ZR6uslFegHWl1hc=
X-Received: by 2002:a25:d411:0:b0:da0:c64f:ea10 with SMTP id
 m17-20020a25d411000000b00da0c64fea10mr6985485ybf.43.1698597578053; Sun, 29
 Oct 2023 09:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
 <20231029150740.6434-3-robdclark@gmail.com>
In-Reply-To: <20231029150740.6434-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Oct 2023 18:39:30 +0200
Message-ID: <CAA8EJpp-pwho=GRX1WuA3TbNTdOjM57SR52-=G=LU3rSeifohA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/gem: Add metadata
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 29 Oct 2023 at 17:07, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The EXT_external_objects extension is a bit awkward as it doesn't pass
> explicit modifiers, leaving the importer to guess with incomplete
> information.  In the case of vk (turnip) exporting and gl (freedreno)
> importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
> flags (among other things), which the importer does not know.  Which
> unfortunately leaves us with the need for a metadata back-channel.
>
> The contents of the metadata are defined by userspace.  The
> EXT_external_objects extension is only required to work between
> compatible versions of gl and vk drivers, as defined by device and
> driver UUIDs.
>
> v2: add missing metadata kfree
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 57 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gem.c |  1 +
>  drivers/gpu/drm/msm/msm_gem.h |  4 +++
>  include/uapi/drm/msm_drm.h    |  2 ++
>  4 files changed, 63 insertions(+), 1 deletion(-)

-- 
With best wishes
Dmitry
