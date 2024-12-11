Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D29ED829
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB8510E62F;
	Wed, 11 Dec 2024 21:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EWsoaNA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBA210E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:09:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54026562221so1960403e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733951371; x=1734556171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
 b=EWsoaNA8q15t6lAtJ8s4pKNFwOetDk/DDGJx51RKLPY3sMNLQzsgUD9L5HegLruXWd
 XTdZXoVCNwtkc1HZfiZlzwx7SPBUxpxwGKVbVU0beM2k+DxmFB74PbiUbO97n+mi1VDX
 sz+plxPckK832J+y2JLrEatlWmfpfWMWKbMye5DmcpXk/LJDTQTVeeoF5EBMKYGqH0t3
 P55rFOaopmsDm6dyVNmdZVAz0lIYEwG96KlKhRtgNu9vpVgdMHNIc1uJxHyLZ41U0V8P
 1P1zxW6iHyWEeKTjM32GVvQc2Rcwhpc+9VVPVN99sNrIdNX2RBiuE/IkICdbkwQUTDrx
 q4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951371; x=1734556171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
 b=I9hfNhsIJdweCXbC4V7JjyCzC/0LTkN1QG4Xep/VM64inLfVDikFUMfhTH9EI1GPVl
 GGbuXBIPaLbdTYn5IBVeXpukaLN3QmZ4dw7KqHojPju2EL4OyPUKaLsEdzLpUQo0/6NO
 it5txJdNFwUtpAfIgW6z/29iqnSqC4kBuYimHBSHl/zMVNW+0SGQRDslER3xC0xbxpLW
 WVvnM26L+gfIdGecgFTdv5LR66SM5DqJ+W9e65hnhYgQbyXPklNSgjx6+9PM5u+zhDim
 iwPlTN5TYBc+jjRC+b1SKjq+LWd0L8/UmhWO6anTJKWryPjjBVKQC6Fc6tVc8vfBPvjj
 8ReA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhTOr8J6FGUpMGoF0VRnNibqTOUyp3fxhgpDN73hJHei2eDtpjGQml9jIoDIdjh/v1gjKHI6jeVNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyANNVIjdJEmdM3tfty2m5yU74k/uLr6OcxYmnOk5IW/ddToZW0
 dRynLxaZFuQ5VeHKtp/DfjA3B637QMGfxsXVvYM5PRSTIXnIrKW3Rv+5cEYibzA=
X-Gm-Gg: ASbGncsY/yfsTRyZ62k+FDtZ2jYFF0VFLU+EyPdffxFxgC9GIPMc1jygQXGcf1lws8z
 x3CekeiRtjlUcOaWay59HSSAuNEfayHtKYyaIEs6CZRsCz8K80ILBpgmzOX0zK8HImTjcVb+swG
 rF+GtBbcV0hje4AVDD1NDD23LwoD7vyyFCbomdSDHD5t8vL/YS7j/itTdpdE1yJALvnFx5HhOHx
 zPtDdCpuCPlIJaDmVcBdtLd87WmEgKHpTa6+I0BPQsW/2JMF49qs1Dw76/eJs5cHdDdasB0foNy
 NMNmE+8xd1OXtCpJSuyqo+eWM65vHz+bGg==
X-Google-Smtp-Source: AGHT+IE2nngXJnaAUtwl9k5Kp0+1aSGdWZRqw4X43BjQNC/SURzvx+f5grBltDBz9C5ghuG1lIXKDg==
X-Received: by 2002:a05:6512:b11:b0:53e:3bb9:5e02 with SMTP id
 2adb3069b0e04-5402a60b1b0mr1317831e87.56.1733951371282; 
 Wed, 11 Dec 2024 13:09:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3aa94b60sm1561872e87.114.2024.12.11.13.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 13:09:29 -0800 (PST)
Date: Wed, 11 Dec 2024 23:09:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
Message-ID: <rggt2smcj547el3bovp5djilydxe5wygqasborwunejihbqygc@xanqsyxqgyke>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
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

On Wed, Dec 11, 2024 at 11:50:26AM -0800, Abhinav Kumar wrote:
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
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
