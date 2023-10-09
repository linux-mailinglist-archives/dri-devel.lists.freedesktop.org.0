Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1547BE864
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C80F10E29E;
	Mon,  9 Oct 2023 17:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B85310E29E;
 Mon,  9 Oct 2023 17:40:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so8432505a12.3; 
 Mon, 09 Oct 2023 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696873226; x=1697478026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0Hg74zU6ESH8XSh7ezPeKEnzmx/gMQe+/lsq3fFNmM=;
 b=QYjBYeHYLkmbgFB/iPCPLGUtIThS5wU9AzPKfOwRyv9VZy+Z6kqQsNalfdpdYOa10v
 y6OxcS9agc2egNk1glKWW/a7CHaqTphLKx1BHjrH2CuZSQfk+/650TAYjcIUrFAdtl4W
 rDWaV/ORMl6QS1HuFFTuX1SzW8kmHGHPI6Q2H0FyPHWyT+8dCREEV1vl+SOvxkGj4NwL
 Fe0VTZVfQi0lKf+E96MzWhSucTF9NyNng6JJ43am0QEPUDux+I/6HyOHTTM8fMWdJ1+m
 /ULAMp+bet/luhx1Iuqw85BHDasMHqyvb4l/l32M5Ll5HFiL7wqf+SzS0qYn40xKNnP7
 zNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873226; x=1697478026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0Hg74zU6ESH8XSh7ezPeKEnzmx/gMQe+/lsq3fFNmM=;
 b=wzqVbwWu4I/meEtpGoBKuI/J4c3yyP9Ee6Qz/kI8LRHTfDm0qMIZ07jxg4y2V2kaSc
 w7fWlguLTJjrahNCT6FF0ehRPh3AQd/xyIz6QXA9UDpdowWVUGCgraKpAKnNORfqWTwt
 vcRe/URy5D5eAi5tJ9VrbZkB0XjV1KQXBd4SSeWxsHh29mgMFeTpTfH6A67sdbKu5NCj
 TK3SFg22i6ZJk4qGeZJ4xjF8SoZv6atmkjA+0miiJBCxO3afnEfri35nqdtHnggENoTb
 oQOdqgvBjKc4ehB/MEHo/UMbafTnice8YCN6FCCovnJvH8wZ7yd4wkqtWPhAS+a+hKDR
 axZg==
X-Gm-Message-State: AOJu0YxKzMTuW4i2vNgvds9CObkzUvyQ6+mm0UG0JrRNaIlRYSY8ev1P
 H3FmUOwf9TQsOeVCbbMlNhVyv65eeNNvMOagmS0=
X-Google-Smtp-Source: AGHT+IEsjuGbN899zDjU9g+Ja6nOILX/d8R6MyZMLqwXE7TZqyeBrzEE089Layp1ZBdFnj1gZy4x69oWN2wfKnmsCPo=
X-Received: by 2002:aa7:d1d7:0:b0:52f:a42a:85a3 with SMTP id
 g23-20020aa7d1d7000000b0052fa42a85a3mr13979430edp.0.1696873226254; Mon, 09
 Oct 2023 10:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Oct 2023 10:40:13 -0700
Message-ID: <CAF6AEGs-Ar0+gRrsEg_LuAXmsAhFg7MKZ=kLpQ=jZKTfdXBtOQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] drm/msm: move KMS code from msm_drv.c
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 2, 2023 at 5:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Currently both msm_drm_init() and msm_drm_uninit() functions are trying
> to handle both normal and headless Adreno cases. This results in a
> suboptimal code, since headless case still gets modesetting and atomic
> interfaces enabled. Two mentioned functions are a spaghetti of
> `if (priv->kms)' conditional code.
>
> Move all KMS-related code (not limiting the init / teardown path) from
> msm_drv.c to msm_kms.c, making it more self-contained. This also
> disables ATOMIC and MODESET features for the headless case.
>
> Dependencies: [1]
> [1] https://patchwork.freedesktop.org/series/105392/
>
> Dmitry Baryshkov (13):
>   drm/msm/dsi: switch to devm_drm_bridge_add()
>   drm/msm/hdmi: switch to devm_drm_bridge_add()
>   drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
>   drm/msm/dp: switch to devm_drm_bridge_add()
>   drm/msm: remove msm_drm_private::bridges field
>   drm/msm: drop pm ops from the headless msm driver
>   drm/msm: rename msm_pm_prepare/complete to note the KMS nature
>   drm/msm: remove shutdown callback from msm_platform_driver
>   drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
>   drm/msm: switch to drmm_mode_config_init()
>   drm/msm: only register 'kms' debug file if KMS is used
>   drm/msm: make fb debugfs file available only in KMS case
>   drm/msm: carve out KMS code from msm_drv.c

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
>  drivers/gpu/drm/msm/Makefile             |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |   6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   6 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |   6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c      |  34 +--
>  drivers/gpu/drm/msm/dp/dp_display.h      |   1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c          |  21 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h          |   2 +-
>  drivers/gpu/drm/msm/dsi/dsi.c            |  28 +-
>  drivers/gpu/drm/msm/dsi/dsi.h            |   3 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c    |  30 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c          |  22 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.h          |   5 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   |  30 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_hpd.c      |   3 +-
>  drivers/gpu/drm/msm/msm_debugfs.c        |  12 +-
>  drivers/gpu/drm/msm/msm_drv.c            | 363 ++---------------------
>  drivers/gpu/drm/msm/msm_drv.h            |   9 +-
>  drivers/gpu/drm/msm/msm_kms.c            | 345 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_kms.h            |   3 +
>  20 files changed, 452 insertions(+), 478 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_kms.c
>
> --
> 2.39.2
>
