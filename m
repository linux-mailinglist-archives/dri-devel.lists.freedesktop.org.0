Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857A49E2FFD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 00:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72410E273;
	Tue,  3 Dec 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gw/zaVH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182010E273
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 23:41:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53df63230d0so7499119e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733269292; x=1733874092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
 b=gw/zaVH7WqVhJxbraw999YeUs5b4jZ0pe+LAjXBSmdKmLxgTiJmk5tn1nc68Kkb3W6
 v3VmkqjYB3HRcpsN4QG6fuWzpFBHRzRAL5qaUNuhV5rTiGoKgB8le647EWbQbZLbj70W
 Pzfe6QV7jXSvyWSfvlvfZC28zRS0k04JV+nAVfzbx3BUpNFBhqLzGKvEC+HWsuzALNuD
 jgMBrhULq+Yx4v6q0i3kb/UwkgR/eAEGmJwNSoLBQAzxY9dzhT9WkDW0nWICM/no1uT5
 N1/Zk2TpWCMNNZHFUh+8UgpcAYLKQPNnyjRePoiQrqf34k2oNVWDG0J+uW35t5DSLs2k
 PkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733269292; x=1733874092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
 b=qyyr4+Zi05Um3rX764lRqf0g+NAJo2uOevmGQYH3uOYfnZTcL8dMfNcPPDQZYvrT5f
 a4zJA5Rl4I5XGJa599ruGc3YyyL4Y7uyO++Gp50woMkuEmrc2nH4hRvIMGDDHBXZxmgz
 uX2ea6PnZ/n32CdLgibE9bV95ocSzoQDm0+U5Xr64gRPAmszuZZZrdTwAfmQs6qcnFUx
 W8cIoit9xW9tKKo3zLPeJiQ3Ho40dNfpF6ieBIArbbXpsD0vANnjlzQLy0EWti/E4uo1
 fHvzwc9SYqivHj7cGPM67KgDIRcfcY/fJbeNzyyt+5nhDTStfOyJ3AEcxwyTcKXSjFoE
 fpmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZSi8VAy7H57OfKmt+8FD/byXDxp22VZb5KIR0dvUeEkEDCavwN4hqqu6m6wTqbxK0Evo0EC74v7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwhpj4Xj/44DIppO955ADXCbiXaExKzi6Ks9AYLS+Eo+sYZgQp
 v38Pc80pW4j4fK61WiPDJ8Er9uAD9SuZGvDJraRLQUBPqpFKzCbGpf1UkX7jpQs=
X-Gm-Gg: ASbGncvtSOztgrxo9y441hCIF+/RMxNcjlcq8Sm3xBi5QEb6FJb6PPwLtBHEmZ3Ydp3
 fxQFyMRNB5fUHZzkVefkGobsi3zGVzppjnuaGjg+NJNyRrAR7BeZqUlDvjyNw5A3n9NIlTh8mEa
 tOBiFb+kPRgt+ssTEsKFyR95Zs02BdVISI7QuBl+Y3L/bsOijH+HxK68p4WQiLY4tXoMcU0EkEP
 Eqth2LwJ99ORjJXQ0/82eAGJ6PbDk7/tcev22SY9OxMQE8vhyJItGgInsBjEvz3P+7QhR9AM1Km
 v5besZRI/b7eJYAHRch41hf/akXqeA==
X-Google-Smtp-Source: AGHT+IHKVny7lfTjFjv8vQ1LYIothrll+JFM6c9K9LYC/aAoAQoTnV/eiGZCUxd2b4XbU8ATpvpJTA==
X-Received: by 2002:a05:6512:239a:b0:53e:1364:f982 with SMTP id
 2adb3069b0e04-53e1364fa93mr2296539e87.17.1733269292308; 
 Tue, 03 Dec 2024 15:41:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1356906esm371633e87.15.2024.12.03.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:41:30 -0800 (PST)
Date: Wed, 4 Dec 2024 01:41:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <owl2yqfvo3riismpltxu2puytquy63hrx375mxedntfjxq3wve@yhofuagrozeh>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203174011.731980-1-dpiliaiev@igalia.com>
 <20241203174011.731980-2-dpiliaiev@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203174011.731980-2-dpiliaiev@igalia.com>
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

On Tue, Dec 03, 2024 at 06:40:11PM +0100, Danylo Piliaiev wrote:
> On at least a6xx+, shader could read 64b ALWAYSON counter
> from UCHE_TRAP_BASE+0 address. In Mesa it will be used
> to implement VK_KHR_shader_clock and GL_ARB_shader_clock.
> These extensions provide shader functions to query a real-time or
> monotonically incrementing counter at the subgroup level or
> across the device level.
> 
> On a4xx and a5xx it was not tested what is at UCHE_TRAP_BASE
> address, there uche trap base is exposed just for completeness.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
> Changes in v2:
> - Rebased on top of https://patchwork.freedesktop.org/series/141667/
>   in order to return error via UERR when there is no uche trap base.
> - Updated commit message to explain why we need to expose the value.
> 
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 25 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: in future please don't send new versions of the patch as a reply to
the previous version. Please start a new thread for each new revision.

-- 
With best wishes
Dmitry
