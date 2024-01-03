Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B509822664
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 02:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7A010E14E;
	Wed,  3 Jan 2024 01:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6EE10E0B7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 01:09:48 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dbd99c08cd6so6291516276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 17:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704244188; x=1704848988; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DG4L4lYtCuZJbRBE8lQJs1HFF5YGxemE517QXOU6TF0=;
 b=ouhKvs7AcKANYdd2vzf/KS/2efs7bckkEmvcsbG3eCDDt4nKSMdtKvu7xSdbb5UYh2
 x2/cc8eVRVzVy9Tq5eX4T9XTQFgzQAXLkadhdQKXDqqniwWTK/LLQRx4GtHH+2AxHHer
 ++QBjrGVZNJUszId+YsHi9TIn1Bh6Fs93FK0PD4Saoh2F56BaNETDasIpLYRyjNSWh3T
 agb62cgXC5kdOAT2CTmLdVpA9bdy1ABhj6xB6Z0q+EVMhYJuiHPHZHGeXz7x1jvuyZSK
 aRi57Rl6WiEznRhvMVhJA8X1k+8HA6Sej2w3L8gHzXBYAuRRFD9qdPJVoKspFI+CRb2j
 ughQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704244188; x=1704848988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DG4L4lYtCuZJbRBE8lQJs1HFF5YGxemE517QXOU6TF0=;
 b=mSwCHoincVnbnwuV8hx5k8HlL7Ci0S6Pa9q1FJxrMwnvc07e/a7EaTq+P/wOUuHt9K
 y63Yw42t6NM4px0/7bkT1BM70nAkX0wWudOj2jRVrBYVfhmoB2arTwr0wSF/Dz5F0mTB
 C/88ApdR9/zdJMgLYnJGZjgei6Tddwjx/IJePF+L1iFQ1GHxKTpYxffFtF43/Z6t0Soj
 Ix+wTkOrgxz/+pII6UmV4TLgFGipUDOKr6UVXh38Cr6sKGgeUVEiZgFWk8diQweCxeQd
 4Osf9ke2xkT8WhnyF2+VV+fgUerLJKHuMhIpWtlpGoQyPu/M8cP1NXbQVL+eHqM2MdBQ
 nbjA==
X-Gm-Message-State: AOJu0Yzz1MAquCkLu0w8jt4f+xNHdAtyIiWdnghHE4ekrtFrEw5QQFo/
 +49UqYL5CUzd/14y1XRta8KFXxfkLlADTQSzcXOoyKGrQDyuEQ==
X-Google-Smtp-Source: AGHT+IF2SG5jIzKRHJmYZYwmnlnpiJrFcs9I5f2XICXUuB+krrM5Glrodkr57n36g6T86Q04dS384DBfSqPKcmQel8Y=
X-Received: by 2002:a5b:60b:0:b0:dbe:6c6a:af85 with SMTP id
 d11-20020a5b060b000000b00dbe6c6aaf85mr2226326ybq.91.1704244188068; Tue, 02
 Jan 2024 17:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20231231060823.1934-1-rdunlap@infradead.org>
In-Reply-To: <20231231060823.1934-1-rdunlap@infradead.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:09:37 +0200
Message-ID: <CAA8EJpprirmP1=2sJNozWe8GPKCCXXPtf1XQP2u6K2CfsD378w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: freedreno@lists.freedesktop.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 31 Dec 2023 at 08:08, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Correct all kernel-doc warnings in dpu_encoder.c and dpu_rm.c:
>
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'
>
> dpu_rm.c:35: warning: Excess struct member 'hw_res' description in 'dpu_rm_requirements'
> dpu_rm.c:208: warning: No description found for return value of '_dpu_rm_get_lm_peer'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vegard Nossum <vegard.nossum@oracle.com>
> --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |    4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |    3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
