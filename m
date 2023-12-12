Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFE80F990
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 22:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410AA10E69C;
	Tue, 12 Dec 2023 21:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BB10E69C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 21:38:02 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d3644ca426so60949367b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702417082; x=1703021882; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hzxdy4DAqYYy/QedSXGsAE7/tNvWAE0PzW8vKkT/Z+Q=;
 b=xI7pUWPUBOCu4EkAqMOFlcYRxmskAZ1WJvrTJCVYvzBTzyokddykMzbOM7K8oJpYJw
 UxHbRb6Gb+BWpDiXeC3zFiLHHEqrWjCtTClj2r062fxXjCJMq1Y+8+KVFDrVW3AmBwRA
 YNTPBH03O0TRwUuTyLiO+YzMJ4XqXyYBWX+xKFoZDPrhuOq/Xzgszd6IEYtSkQwZQYbd
 YYlkm5otEDgDAtBHuZIybSN8T2cmor56ySx42Kno0rqkKuamJ1uaytmsBHrptz3uHhM4
 U1ZTUepEQoh8BwXHyohXYTLl7SgpWnJlHXC+TeRyY0RNvMnjYr8Qs89+cIfrlzMxNoT/
 21qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702417082; x=1703021882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hzxdy4DAqYYy/QedSXGsAE7/tNvWAE0PzW8vKkT/Z+Q=;
 b=HDeA1Nug6+PyiT/I6nvh84QgigGWijCGwolftvAo/UmgKKj/WWEe/X4IGSN87ZZs30
 TogAHW2u/5xcAT94q2hwWneDgoEylfl4mtZG1er83X6xRke5obBhbeg/+dUmF/44TnI0
 5P6gCPDVc1rt6EtBEhuu1A7GwpwlHBBJiE4qB8QarhTeakNz+a/WA66d81Aau3k5JZzo
 SSPrBU+/ZhhV6YZPgsoiUr0ur0WgzbaltvgTrfKocSF+f+KdnKAzIkizbHlV8GIlocML
 WUKUxi17FVKKwYLQloym7GjWkEaf2kJEQBPxpDBK2oMD0FuVIkKO4JtPvKIkuqxQS/8m
 obXA==
X-Gm-Message-State: AOJu0YwqtRcmI0zZba6+ByI3SpXDA64P2ogvx64ZWNWO8iArlBRY1qcV
 1fPkmeNu8vjHo1jchFvok7cK4fxxGxNdI8kCKwBDDw==
X-Google-Smtp-Source: AGHT+IHOaQxAO03DA1eRwI9KuaEK/YYi+78fp45l1XIByFOvK8wRRxPSjLqjbcQfM3q4ZBmUdltsfAN58G975GhgKo0=
X-Received: by 2002:a05:690c:4705:b0:5e1:80b6:a731 with SMTP id
 gz5-20020a05690c470500b005e180b6a731mr2364533ywb.60.1702417081817; Tue, 12
 Dec 2023 13:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-8-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212205254.12422-8-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:37:51 +0200
Message-ID: <CAA8EJprBF35zAhNjTrQ85yDOQwu3rssr3+xstSBVBLZyD0gfKQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM
 block
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: kernel test robot <lkp@intel.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block comes with its own set of registers and operations
> which can be done. In-line with other hardware blocks, this
> change adds the dpu_hw_cdm abstraction for the CDM block.
>
> changes in v4:
>         - used FIELD_PREP() for dpu_hw_cdm_setup_cdwn() operations
>         - change to lowercase hex in dpu_hw_cdm_bind_pingpong_blk()
>         - move disable assignment inside else in dpu_hw_cdm_bind_pingpong_blk()
>
> changes in v3:
>         - fix commit text from sub-blk to blk for CDM
>         - fix kbot issue for missing static for dpu_hw_cdm_enable()
>         - fix kbot issue for incorrect documentation style
>         - add more documentation for enums and struct in dpu_hw_cdm.h
>         - drop "enable" parameter from bind_pingpong_blk() as we can
>           just use PINGPONG_NONE for disable cases
>         - drop unnecessary bit operation for zero value of cdm_cfg
>
> changes in v2:
>         - replace bit magic with relevant defines
>         - use drmm_kzalloc instead of kzalloc/free
>         - some formatting fixes
>         - inline _setup_cdm_ops()
>         - protect bind_pingpong_blk with core_rev check
>         - drop setup_csc_data() and setup_cdwn() ops as they
>           are merged into enable()
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312101815.B3ZH7Pfy-lkp@intel.com/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 245 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 142 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
>  4 files changed, 389 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
