Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E263A13472
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5C610E8C6;
	Thu, 16 Jan 2025 07:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bGSV7q/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EF210E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:56:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so5570361fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014121; x=1737618921; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
 b=bGSV7q/nbcuDbX6z7sW8nMqS0PDmZ11W2+F77AM59IU9JJO5Ge5qLTZdRluZROCO/y
 hFH6hVj9UWA+PRVe3Be2+N8iRals7APsGE9ejP/HngY71iZTWEa4LoOI2GeeTZQCjyjr
 S48HS8ZMjqSrNeUm4QOSQjYDoUbs5VlW4LyQCrd8kNnvDwy53R2xSoVMU9dau923Ayby
 irCGmicUOBwNBRVfiqHryE8a3+qsA+nAH4V2dX8QfXDns7lqGLpHUOP17muiBV2JkUIe
 E4WuJ5ax/8pcpeRFEFK41gxXMz9Acrxkl0MfzIyvskQKsQq/k+fdKb2z3YhtdF2ZNVi9
 rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014121; x=1737618921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
 b=peyw7Vufg+87ML3P5imA94/juLnyHGRC7Orm5TV1GdsAmQmjNuIqf/giQHxQVE8Wp1
 Jw/pe5AzPHbIf8N5BLJz6mDG2atZ1kdonOnRNVShXwfdbc2PVWBdkfgTUpjC5lMxDIDJ
 5cRmKQfQfTT15r0+z4MowEKN9eXj+qavCSouBWNrYzxzaNK0hyrAxilbmTR6Xd4Jqgnd
 UxK2Vxeaz0TcRWVjE8/qqt5H0mxveMEx8uB5Qp1QbHtwkpdCZ+m91qHaocUTgSizdXaV
 9ouqiyIIyQe+AuQHoX5S/tE+iSOlAM/aihUG+wCGwAeWLX/9B1H+4S7YW/C2udTjfe4G
 c+Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCdErYlovwKhCb2NPTjiZVJBrbtHODEWu7038+si6nQrbaLBNMmHi2JxmjoMwq2uJAW1CgfnrD0VQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytZvMR9Xu5OIsaS8seXNxC7WDHsj8LiqG6io1HTaT3g+y50TSY
 Qt6vmtZKwZIB1pIImfh+AOGzi2KgUpz4Im19MuIgNdtfvOB+fDA8onYaRIIYS+Y=
X-Gm-Gg: ASbGnctznEFQtS+tdhs9lZc3n4uk5EbBGtyoqM44zvB6WYSvjOkwzaFP3RhSCzMGhGV
 COuP8nTVtyDYiMtjR4zUnC8olcowKazqU9wPVSrysLtNaehjX0xps4tCAjK4h8R2CJJ20wlTz3H
 k2xYArxXhL+Hn9UIguQ/6DWCXxRn75GU5e+EJmZ6evIRdXtURTYlsWMsCDD/ApMIxOjLPNzxB/2
 scJY6xL47EpqKWVgiCh+pSY0if5xUKcE+MfwDG3EkW5hS55eWlOIq4qgbgDS1+12SfD+dravZco
 pJX/TNuEXayJXaNmlCyt/WV7E7y4+lKiq8xM
X-Google-Smtp-Source: AGHT+IHfj3JfIrhEc5djBNosWJ+fiBasPZMlyhcF4dJudhn38zLrNos988Dhlf2AaunAFR7XhZyUEA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id
 38308e7fff4ca-305f45ba080mr114128361fa.27.1737014120610; 
 Wed, 15 Jan 2025 23:55:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0e712dsm24319121fa.51.2025.01.15.23.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:55:19 -0800 (PST)
Date: Thu, 16 Jan 2025 09:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/16] drm/msm/dpu: Add pipe as trace argument
Message-ID: <jnazuwxroizov6hysv7bhsjtqnzfrtqotjmjzar4lbhrdokf64@wzbfkkpcfch7>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:58PM +0800, Jun Nie wrote:
> Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
> converting pipe into pipe array later.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
