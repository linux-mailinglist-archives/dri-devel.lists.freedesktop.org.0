Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511759EFCAE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 20:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDD710EE90;
	Thu, 12 Dec 2024 19:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K1495VFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827410EE81
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 19:44:09 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4678f681608so10539181cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734032649; x=1734637449;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
 b=K1495VFm6BpMTQrPAJs1LVhSDQkqiupFQodeu0UQ2gWU0a4CmcHXkfe4Pait7f02Zn
 KRPxXLHg7F+vMQupfpwuNDqmgrEqowL4ZcMrZa7KXU3p0bBK6G7cM5AgCbgvBo56Esm7
 vZBlFR0QOG+82e/AMWkjQKh/q/3SUTMug/QhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734032649; x=1734637449;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
 b=hbyVCXSzbz8hEgx4N/CVO9YeiHtvfUD7r/VEtBgYow2C/GAQ0Q3chzaR/0J7MjhCR+
 Aa62L67/fYiWdu4TxZ74gVdACbISdNm53NoFAGu4aEg1EnlHObGSHXltESK44BCM+xo2
 /l+CaT7vp+4zwhkNyIbIUvML5LZn6HMNiHn5nD1uTia4qPJI4N/XJo5KTE4c+WeDk8Nl
 Y02m+gff5KgP7RtQrUbrnqcxsjwi061OGu4OWwN9JEXXg16qB4FOA+w+JZc8MkWOZBfx
 OEgP3U/ZzF6ZxmcWQFbSyMNMi/FhqCp1Bl2lgKfsDRbftvvH+dkdtXk1iURLtscR36ss
 D1EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdzBd7WfULQEEJ2XAcfitsZoOpX//tEe5UKfLOOU2vGSIaxFMkcTNBWXKSMH3+VQR+HNC2pzapoPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc/MikGzN6itKwCMFtNgm/dtsdq/3Nla26Ifn21TbCRn1BZSdn
 Rt6fXKS39EjfNeIpuCH3rsJaLs4aIPnwltYWcI+BtX0RWt/2lf43xICbJhNbCHKCSzrPLP+Kiun
 YobHQBIi74UK+b8Ol2VVlOPhAy+JeGQTUXgAK
X-Gm-Gg: ASbGncsU6sdwXQE/jcU0UbJWpVu0vtdpjmM8jrk7+7dEF1HqTZDuqJiAMQKpKSOZM9F
 ulTy1Fcx30luEMtEe5OtY7P+YztTcg9jCHcYLbsXj/2ca+ecigin62KjipIfeecb6sg==
X-Google-Smtp-Source: AGHT+IHlXSEQ2wG5xyF2Aa1OBgLaNUi0yxcdOEzjtF/Id9mL9j+4TPLwCfOsk3qZGjqHtCyb1hPI6wo56A7bYwjCxyw=
X-Received: by 2002:ac8:7fc2:0:b0:467:81f0:6d63 with SMTP id
 d75a77b69052e-467a15c7a0bmr31511991cf.17.1734032648880; Thu, 12 Dec 2024
 11:44:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 14:44:08 -0500
MIME-Version: 1.0
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 14:44:08 -0500
Message-ID: <CAE-0n509akHPXM8t6QCTO1cydhJzv_Tu9xTtGze8=bY-rUN=oQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-12-11 11:50:26)
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
