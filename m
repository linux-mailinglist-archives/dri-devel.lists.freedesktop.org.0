Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2909E6A08
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6E10F04B;
	Fri,  6 Dec 2024 09:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EwIFUu5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE2410F04B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:27:07 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ffdbc0c103so16622131fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733477226; x=1734082026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7broW1gZ7NVHflpX84N2WQlsqRcFTPMTUqNg9tqTtk8=;
 b=EwIFUu5qJQINaHdwp34O961RVfAJtGGs0eC+Z0gYo1LAgLpCwtayYL/sQDxofXsp7Z
 A5JO6DvEyuMPVabvKZ8EURW7eKnBvrs6eqDiQL4kF6OjK7B7VbsffffJatXok1QoRJ+W
 ZIq5pObExZRpZIimV8fc506XYzUnq5F9Cq86vuG8Ogf1tOiGlYvhfRATOumULAGaSzxw
 Y4lGrhS4U2b6tPjL3VKWp7g5+mM/awxcWmO9uy7gMM1+Ox3pcytLwWPe+PiInD2K5p4J
 VrdEzIYtyY+lhH2fCOFXzvDxzek9PVkgsxF7C7R/7Uzgo2s03c0LVU4cscre5kmMVzgv
 AHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733477226; x=1734082026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7broW1gZ7NVHflpX84N2WQlsqRcFTPMTUqNg9tqTtk8=;
 b=crvVFYrTT67zcWemLTrzDDveH78dNlW0cULCjDh7eGv+IfjqI9sDgiFWgHqKMVIjgN
 qUp2sVSpm9GBisutV/Ywz25ieqcRS4Yvfm+HOPm4pTgTYLRLLnAEguzMaMC0Dh2mj35A
 JPHFFeOnZFPfDyrNxmxZG66sC4rMI2Sw3clLz0ezLjxJKr6QbnlTiaCG1KE3c11Zx+Gh
 n8pvY3buLcX5HRASF5fM3+2SFaa7X7HsL/eoRrHu8kq9n3cFHRvvO0Co/xOmYUvgt3p1
 M0CmGfpKQQN+9Bdfcm5qmNnY69ZaLYIyPspw5lLxpYQUNHu880lt4EQimz6uY2Quyxfr
 h87g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO9fQpqIebqtcFeim82w9lrJXqIeHaC8wm1EXmQ9nwBdeRkMa3YZC8I5MD2TdoZ51C0Na+Ip20AtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC92ZjlSISkcIfJuS68j35180/f8Qpygt23qRufuVz9uydVC5i
 WQhT3Nrt8kPzeP5En/j4gwPz6Tk5Q6Lk2Fj2mGB4nU21sQsdZAkdjSRC6HvzKM8=
X-Gm-Gg: ASbGncuWxZpdAy1E1rlRhU3zAM6yeGq6NM16yeWADbGHK6TMpgECyJRSXaA1/ovQaOu
 1hWpMBvAq+gSiuvbpGLXx00NxqaGAmBxxgo4LKaGv7Drfi3r1MIPfxO7dGDjD7NYWWhcnCv4yGi
 gzwdZcWR5x4ScW9LvdQD7lmUwE18sItlssNQ+m5iZ3OLfZ3H2kwC6lw6DSaB73iNgJZMrl0ckxy
 MgM7e0yUQFUzZoqyRqSPhZ3wKpFcgKpMDAJCndK9fnnaD5T8IGibKiErfTydwWHiqSbhMU73Yuf
 ZHX3fM17vBC5UJKNvUo2LCU+MJ8Uzw==
X-Google-Smtp-Source: AGHT+IE19qPwbx3UFDXuLqxlrNLClxfZsWNhadyWFpGu/ahSESOQg+xnLVgzOuZizB2iVY3wNhLDgw==
X-Received: by 2002:a05:6512:3ba3:b0:53e:2751:84fd with SMTP id
 2adb3069b0e04-53e2c28e5d1mr584353e87.1.1733477225873; 
 Fri, 06 Dec 2024 01:27:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229c23d8sm445851e87.211.2024.12.06.01.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:27:04 -0800 (PST)
Date: Fri, 6 Dec 2024 11:27:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 37/45] drm/msm: add support for non-blocking commits
Message-ID: <odawd4djmpowav7beu76s3m7xtocw7tqsqjjkl7n5xxupn5u66@wpytoudtcizb>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-37-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-37-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:08PM -0800, Abhinav Kumar wrote:
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h    | 1 +
>  drivers/gpu/drm/msm/msm_kms.c    | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..801399419c3d26f68d9b0a65d41fc4e1706c70be 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -210,6 +210,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>  
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
> +
>  	kms->funcs->enable_commit(kms);
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d8c9a1b192632d3e29ff125bd7bb2d0bb491275d..1616a4682795f6b9b30cc0bef2baf448ccc62bc0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dp_mst_helper.h>

Please don't bring extra dependencies to the global list. Individual
files can perfectly include the header on their own.

>  #include <drm/msm_drm.h>
>  #include <drm/drm_gem.h>
>  
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index f3326d09bdbce19d40d0b48549c330c2b836476f..343ad9e9988f6c8d99c5867cf8e81ae625aaa90d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -28,6 +28,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>  
>  static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  	.atomic_commit_tail = msm_atomic_commit_tail,
> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
>  };
>  
>  static irqreturn_t msm_irq(int irq, void *arg)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
