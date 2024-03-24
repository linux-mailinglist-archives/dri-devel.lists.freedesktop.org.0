Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861A887C78
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 12:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3384610E0F3;
	Sun, 24 Mar 2024 11:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MoObhDNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9210E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 11:14:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so3481053276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711278846; x=1711883646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
 b=MoObhDNiwgOeB/hlkmRkoz7fwBSCkMeX+4nAuqRcgQXXWuMRe3N5Yqo3uDC1PSsjiE
 bFsu1kA9e4MGMKBnHXaQnJxzt7R/j8b7Ymom+X04UICMycRLeWLhOwdTR8qrMCDShWe/
 i+vtr7dlFEh1rmKnutzBSKsBDB95DHu2IIBvxNIOqzTjXqIUo48LshKyteiVNd5N2yL3
 J2b0FGpPhKBA9Jch9Is3DMWsKLDxtWOF8mcpCP2m0caRxzEfvPiRXrZ7yFxxllfGEn9g
 Rh1gA18VLFpmcLn+jD+pTYZkmCI5Yr6sbYCQ3gpYma7qct8rCxgCGqVjjaccxy8be5hO
 rQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711278846; x=1711883646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
 b=N9Ko5X0WrQVmA2n4zbIC2cIVoUNrc8eeQTxPjkGx6AuLCV14NIZeeyGKJTCtzJToF9
 iBooY42pvFVIDIS444ZcwSbnZ2bjg+GHHXnWiKw14kGGRV+04+7CW6F9J/2LsOgXomZu
 B3D/tQgnKG38CcDI3AJQeaK81gW+ADZS4/8YGNnBZWwTE9e8/Ao4a2ctZEdQlu1SOTAu
 lbPFBd7Mb2tbLG8MCSnIAgVTc1dFZfkNzgLpqzc7StyF7AauDq35z816nY0bjUcT2gUE
 P40C8Slvr2W6tV937rcJ04nr594wEp2zt9l270AK9/NKw9EtPY8wAsK5sBOD22W6YC56
 QWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Vog8kBq3TVuRwaOBuoGRsGX2mK72IU6/K+2YXnOI83wU66c59cT904M1mNLWwNFpCqgUUeQu0f2OPjEIg6xk33odfBXT5g9nevRUm5T/
X-Gm-Message-State: AOJu0YybrIJdBh1z9ynFGP2xCPCNGfP4Zji7Cf6tJaLy8e4rsmTSlZaI
 3xE2+p8vBfDT4gliEWC/8fToPffJMi6bN0JS+4o0gc6KVFUlPD+ZlVwYT8/PAMOxSRZ6uQ1GYa9
 nnwxy19MT6abtjhJF6Woofw8LsbXUoHMqotju8A==
X-Google-Smtp-Source: AGHT+IGr0tNnaqUlmK0eR1f5FzQiWKbsnubMD9+Wo9vIvgCqe8WTw3q8zUfy/4luXP0YRCD2+8dSeF51lmB7BvOZ22A=
X-Received: by 2002:a25:ba90:0:b0:dcd:a28e:e5e0 with SMTP id
 s16-20020a25ba90000000b00dcda28ee5e0mr2155613ybg.25.1711278846456; Sun, 24
 Mar 2024 04:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org>
 <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 13:13:55 +0200
Message-ID: <CAA8EJppAsy9a0b4WzqWCaa=-fPYrKOMePo3vsAaJ4Nu3okoL7Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
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

On Sun, 24 Mar 2024 at 11:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:56:56AM +0200, Dmitry Baryshkov wrote:
> > The msm_gpummu.c implementation is used only on A2xx and it is tied to
> > the A2xx registers. Rename the source file accordingly.
> >
>
> There are very few functions in this file and a2xx_gpu.c is a relatively
> small source file too. Shall we just move them to a2xx_gpu.c instead of
> renaming?

I'd prefer to keep them separate, at least within this series. Let's
leave that to Rob's discretion.

> -Akhil
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile                       |  2 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
> >  .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
> >  drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
> >  5 files changed, 31 insertions(+), 29 deletions(-)


-- 
With best wishes
Dmitry
