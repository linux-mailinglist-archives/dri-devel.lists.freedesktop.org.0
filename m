Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4185948B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 05:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2FA10E098;
	Sun, 18 Feb 2024 04:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sV4zdIZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B610E098
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 04:18:03 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6077444cb51so30828797b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229882; x=1708834682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
 b=sV4zdIZolUU1Irtqv6S1d3Eg/OwTaoigYIgxYabHDh0DjLwoJaLNwLr8uJJgDxYm5p
 Cudcb6x4G1LMR/Le9KgQ84ZNyQFt2xvEEvOnkYiF+D8b+BsUiYPvDcbJ/MNmAwfRmdo7
 DGqiPDWzyYGVYePUYeQ7Ep75qjQJZ9p0PooKfqUJ4GrV7cRYWEf+udJA0dPJLKbv7RLm
 wLSwFMVMCWXQk570bWLcYcxTaiC8+eQAnfn7nMLhYVwuesTi7jU/WyLBd9qL9SiXlL4M
 bxJ7wSCvEF79UomChjP/3cZpWdJYPdliidBG9nVYz2UCnO07hIG6F5fw4QTQIEcLbl9x
 tSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229882; x=1708834682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
 b=iGva4s0UfD0pWVh0VdciMkCZOYF9jrtO4TrMCteRB3w/+ujSOnCwozjDyPcA5rL4+r
 b8JIHSM3fhfSIUJyzEJARo8dsgPUH/zc5svshOFI+WLgfzIhN8cnYohxEgG/nR4+UpZ9
 0oMPmolM1/cgpXEJ48ZPRQZPmF1HNsJ9bu+qANzNelG1aH74f/LmRMbL5wAggVMxXjx5
 +fl0t7RTZ7nbEYYhOlBZNi36wvZh/8HP86jW9k1u8d4VXa4Axv/Nt9iqxqUY/0EpBiO/
 sYnw9hpl8ffwaPJdSnKIpJjA9PyKyPJ5wNlnWdLiTmpadtdRqWQ6rtTdSYsZn2YZd6J+
 MQLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnFzp0yXvc2/82ahEJu1Ai9+JBxXiEU9VpJ8Rk69GmlAlJPpNzrzJ8c92ngnXWRIcj4jOJ0yAi6eg8ix/EiJOiUV3cabVS8IWD5FwMeuU1
X-Gm-Message-State: AOJu0YxdWb/8syGOZjXW7W53D7fX8pkuelafRtFqIRZHuMymL28aKEX8
 uZr1ej5k4/GuQ0G/mgvSqackit7SK+GgPOrhhZj9vBCGv5fAhEFnc+mNVSUIs41DwSejaJBIIdt
 yrWoPe0MrNmythxwyYGvCMGzUEQHs77ojoqze8Q==
X-Google-Smtp-Source: AGHT+IEpgMf3VvMWakVwv7fghI9Fa7G7wYfMJAdAyHJSmdQW1S3Ff0ESfxQKn12qZsKW7JtlMbzrJ7Lgo1P4FfdpkMU=
X-Received: by 2002:a05:690c:16:b0:608:b86:7c9f with SMTP id
 bc22-20020a05690c001600b006080b867c9fmr2610027ywb.7.1708229882487; Sat, 17
 Feb 2024 20:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-17-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 06:17:51 +0200
Message-ID: <CAA8EJpoVFEXRCnePop20cv7vy0+=gsZ_cgdgkLSoQ0QsHjNYdg@mail.gmail.com>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
>
> Changes in v4:
>         - Remove hw_cdm check in dpu_encoder_needs_periph_flush()
>         - Remove hw_cdm check when getting the fmt_fourcc in
>           dpu_encoder_phys_vid_enable()
>
> Changes in v2:
>         - Move timing engine programming to a separate patch from this
>           one
>         - Move update_pending_flush_periph() invocation completely to
>           this patch
>         - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>           calls drm_mode_is_420_only() instead of doing additional
>           unnecessary checks
>         - Create new functions msm_dp_needs_periph_flush() and it's
>           supporting function dpu_encoder_needs_periph_flush() to check
>           if the mode is YUV420 and VSC SDP is enabled before doing a
>           peripheral flush
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 16 +++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>  5 files changed, 98 insertions(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
