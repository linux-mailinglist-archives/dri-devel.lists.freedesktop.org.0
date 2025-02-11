Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C492AA30241
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FDE10E2DF;
	Tue, 11 Feb 2025 03:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UFRhgMGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F096E10E412
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:42:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54504bf07cdso3033143e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739245330; x=1739850130; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
 b=UFRhgMGmk8kadEJqn6TxIp7pnEYz0csDy/I79/bE42XjiegEwGb6aGpJyZTvbZhUTX
 NZHyAOuVge0a7hEiD+VbuBWTvhV8OWvEKWiealS52ylzb4HPCtHIKJBToyY9szuTwoUy
 Xf71ZMx5PwdEkUVua/5hHrn1kijF0EPyVU1PolUrQq+pFksf+hd4xC0uQBVEO9xZZ1eR
 42G5S7n4xTzZxXSFPxD3vIXqa8FY11lokOZ9HdsLaKad8PI9oN+8lokyDeAK8urAzyOw
 aG7wY20BUab1RoFWaRrFdvQJeXvoLvooQ9fprLIPiRqg40Tc9ts+MIxHUimnHVhVgm7M
 TVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739245330; x=1739850130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
 b=iZRbIG8B9OwJ7LR9i1zRzdCAW2WAR3kmHv0h/qhydQRreLZYccee/zgkLuUSuAXyAU
 GSR0eSSu+t2gO6NhGOSf919BiLsZ1bQTslZ32l0ikZuoRzwmVY40x/vg7qvMQNZOXY0/
 PAtkrT98h2QiY/bKveIAaqRnQRKN3sEVt1vPwZKt9q2/0m74yYPo52UJScMjmxqCet8j
 2G/okKjj0wEIK+21rf8QqhnAt4AcfXhnEGUQdPGEr0cSzrYjO+WYMCCBdTqoDkmOeWCc
 x0oMc+ysYhq1tkqgKKXm9+mZoqQrH7F0yHJ9mS4dB0vKz1ICoy8IzNZRPAuxxiGitmOu
 CwOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW+V0EI+xkNNTYyti4IQSg7U+U9/i0GZFDDidnkHc/XNMgtlZHorIfSZvPxIzooXQ5vWeEk2bBNvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6ZQv14QD5VNXW/fAeCT6T3AZ+nUiYB2KN60pniP/HrqsM2ss6
 I55E88TES1WB6iRZImrIX4qbJGVde0B+zgksZ4AyKHHDmASslvMQMAOoDfrJtNQ=
X-Gm-Gg: ASbGncvccwxT8ItzuLe66+vpeYZ4/1widhy3/SPF2zr77RO9AyYnrrWb7X34naeUj+s
 Wkf8NMJ2XSHhqROxrWSztCp5syBhkR6uGy3U9o5aYNrNzyC/JA6d8QxD0BLRfHnvh5vKEOijIKR
 uTZeoSLVQcHzIRs6471bGb0P+xlGo2V12x3jOIIXfN86TbWeoU80rM7U9D93qZoFhEiCRyXdsqj
 1MpiEkJ4q/ucijnDBcjzM7n2JuVTaT3Et8ciTbSS9rzxgQ1eTp1SJorkabbU4Mn22wbkV+7KptP
 VB6OXnnGEdIhdYXyVeeb7pjk/fh62GJhUaQSrVrU4n7C2Qm8LB3zUOk4OGRYUfebiOXKy1c=
X-Google-Smtp-Source: AGHT+IEpuTZOAkvVDyVOUqFsqHiob4PAIXyJxs6eBLCg9MdHYmCorlqmyE3GpuhdGXaaTLkizjdVqQ==
X-Received: by 2002:ac2:5f6a:0:b0:545:95b:a333 with SMTP id
 2adb3069b0e04-545095ba432mr2186571e87.16.1739245330219; 
 Mon, 10 Feb 2025 19:42:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450608a74fsm804870e87.179.2025.02.10.19.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 19:42:08 -0800 (PST)
Date: Tue, 11 Feb 2025 05:42:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Use existing per-interface slice
 count in DSC timing
Message-ID: <guhjhtm54xttaech3jpnsqqzfevadure6clecb5elruxxd6trd@sunww3caiial>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
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

On Sun, Feb 09, 2025 at 10:42:52PM +0100, Marijn Suijten wrote:
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking
> bonded-mode into account by dividing the original mode width by 2
> (half the data is sent over each of the two DSI hosts), but the full
> width instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
> 
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode) resulting in all
> subsequent values to be completely off.
> 
> However, as soon as we start to pass the halved hdisplay
> into dsi_update_dsc_timing() we might as well discard
> msm_dsc_get_slices_per_intf() since the value it calculates is already
> available in dsc->slice_count which is per-interface by the current
> design of MSM DPU/DSI implementations and their use of the DRM DSC
> helpers.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c   |  8 ++++----
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 11 -----------
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
