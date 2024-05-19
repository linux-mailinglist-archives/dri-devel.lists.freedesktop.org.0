Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497F8C9415
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AB110E1EC;
	Sun, 19 May 2024 08:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ueVEjSep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCB410E1EC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:40:33 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e3fa13f018so24516681fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 01:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716108031; x=1716712831; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MgTrllwDYHTgB7C+QKVDFFRer7No5HD5l0LPXbNp0Rc=;
 b=ueVEjSep622IqV1fqPS4PGWCD3UeeeOBvS+WyBl6VbCIPB3TRMNNn3TOzOP70rZVPP
 9wyHINaSVXt3aP02Y4Pw71ioxeWDeNMzICzMdtxy8p16A2BVaRA92gno93aDHkgrI/zw
 9KcvvJe31/lJ9PZdCl05OpRLqhugIHlVZCAV00CihKlClne1hpCp3hTp5Db+ZEKgPt5J
 adm01Z1bFvimjkIZEYgYk/Lx9rj+4RLukWe8gwDNVuajKWIHpa0sooocKfK6w6vpWPBn
 5arDfiKtppKWCSHwbzWo12nEvhNPXv4yqlxPfrHeXl5omfIjtIg2582WNRIuMsHf6f03
 /luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716108031; x=1716712831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgTrllwDYHTgB7C+QKVDFFRer7No5HD5l0LPXbNp0Rc=;
 b=kyjEwR2UoFtEttEAyf/P9r7RidgqzNJe6hZIyZ7TW1i5ksciqy+02bIWIGyEd9d2VC
 hHfPRtJ9s/Q6l5NUoA8gN3xlWg2ZZ9RV1+Ri7XOLCek6AXFGnMKgEuFU07MVfFZPQW+k
 MjNLz3ERUTmxtbHiLhJs5ltFf3ExxXj+pjdlY4lYp5Y0PJmrpLSXiJb/Ssaa2Y6alpDi
 d+6vNy7z+zCuydCmCVw2z2Ed5x2xf/jEgIIo9gVsxpQLzfueVvTWkpgUAfjXw/hyUEoc
 cwxkm4B0BQ9I/fQqJkxWsnf2nRMFXpjC3xXd0Svt0l+gtcWxWzoT6dTUQM4QQ7F7A5ca
 J8FQ==
X-Gm-Message-State: AOJu0Yx2q1yyQy9YVlt+5oz8PlkClLM2LduPYpKo8+1L2FvcXT5jsI1Q
 Fg8sOKQVwnaT4r5l8nWDNogzyarEORql47CSywGD8wk0loCN0/EWcijtbETBYtw=
X-Google-Smtp-Source: AGHT+IEj+o0GE3iSfy5vy0xWlDi14/h6b+B2BzuNrvjjBdZo1C91BvTjjcT+ES/qsBFTc1EsXLX9fg==
X-Received: by 2002:a2e:960f:0:b0:2df:b7cf:9607 with SMTP id
 38308e7fff4ca-2e51ff4d030mr186327031fa.22.1716108031394; 
 Sun, 19 May 2024 01:40:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbd57fsm29637451fa.22.2024.05.19.01.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:40:30 -0700 (PDT)
Date: Sun, 19 May 2024 11:40:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, 
 Ruan Jinjie <ruanjinjie@huawei.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Add obj flags to gpu devcoredump
Message-ID: <npo6qfweuwlo36gsrseb2oldsqpuv6z2soie3rt4u4zmoxdyzf@hlwx7zd22osl>
References: <20240513155150.166924-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513155150.166924-1-robdclark@gmail.com>
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

On Mon, May 13, 2024 at 08:51:47AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When debugging faults, it is useful to know how the BO is mapped (cached
> vs WC, gpu readonly, etc).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
>  drivers/gpu/drm/msm/msm_gpu.c           | 6 ++++--
>  drivers/gpu/drm/msm/msm_gpu.h           | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
