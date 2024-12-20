Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2C9F8C23
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B71C10EEE2;
	Fri, 20 Dec 2024 05:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DXT1W3+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131B510EEE2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:55:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-540254357c8so1419016e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734674141; x=1735278941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
 b=DXT1W3+OuihnYT176GRHKv+xwRPBOLjvhaiEDKlfVVERt5RQpzmSWYWqHoxPQP852p
 ttN7HQW5OWLdDUB8HGEM6NRQMMQF4c1+Q8s09JGmFPYI2sT05J9obDP2hZDzgaIiJ9Ey
 C3uaAflbYSICr9yKL/eoIPb7ebrlpCFZH3edmNjA4jvyopRzTcJkBkTl5Ic6QAl/gzFw
 cgmLhJCWonViWcUTwAhq1hQ7rj+XIgrWEzvRnFzV4Va6p6Q8CECWSzUlvcSt2ufZVcPp
 z5an2/wlLiKMpX8vwUwfA5QzJ4sFn36pVrKyp4ynqG/HAEjgxwFTt++/U7Gpjy8NqOW5
 6MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734674141; x=1735278941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
 b=YGn3sciupnWvp9CCeKUItZ3DY6EjdC3uve0shXjbCeCH5RikzOwGPEaed6IKqD5C3K
 J8gNvpRMb7/SufubjKrYhHBslV3Zda9V51lqRiaSh9i15A6rgh2Dqwf895+83CXTE6Zx
 WWuKYxK4cQiCA7e73fVcwHuk6Xq0boRWxmXohMLNowSXfLDSOIbLjsmw1njw51Vf+YCX
 rHKI0PfjOHyF21WkiB+kALMsxlqxuqZvNChdzBjvg9faB0uMBHvn9GMAR+kVHaHt9Sxv
 opf1iIilmRFajE4ZCPUKSfb57St/64cv5xFaUb22qbUsHLFSf/VsF1Ud2jPFJBERLkEb
 mcBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfSDvIhTtwFUVSVLk1dnykdmi0r54sMwJ9SpH2d68h3JZSJRTWi+GMomAXhm31M2/mp4bxGDGrDj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmcDcy4/2w2cHwie6JwqV4LjCpOwFMic4OyXtKxNpks2Uumiin
 Th7BCdnR4EemQLTzl8qiwx5reIOv8dhJUOLTXiXZAbNvDX9xqNduaRVHE/05lvY=
X-Gm-Gg: ASbGnct0SWMJREOfbrMhrAyVkj8Gik5ZU4fVVcl7e1xLNQ4Jo8yGAYFobXqiYTzO5Ne
 ys8ILv4ttycBfLFuK6dAzftgyVV2zhY9p8xMjrGwiU9hTyAVLuApeBigHjRQDFr6rkEX2o923SU
 3tG6LrCy1RlTxWSZAo2yMqhxKVTy7ZPdYTAMUv9/cSZMGUB5nh3/3uB+2wbi4q1vctq2UQFYyOx
 Qu8Yk29UlOBz5WOHyP8RvuiGcBAAHwDKCPc2AAz5M+MEYQ1p/suAj0ckysuWiPopmOpeVzAPKJB
 I/6aMhdBK/DWtd+TFOsD+zDVC8AfzzVay5gE
X-Google-Smtp-Source: AGHT+IETemAVTmQyZ9rbwPDBncgy1nlOXafMgvgGBZDfwJJZOMq7B3fJHMrkOYNfkHSOT4TqKqybDw==
X-Received: by 2002:a05:6512:350e:b0:542:2991:e984 with SMTP id
 2adb3069b0e04-5422991e989mr241894e87.9.1734674141403; 
 Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f57sm386381e87.33.2024.12.19.21.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Date: Fri, 20 Dec 2024 07:55:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 19/25] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <i6xj5p5jbn6hdu6uip5q3k4umz4b4daqmbwsgfuaw2guf23kjj@lkq42furh3sh>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:30PM -0800, Jessica Zhang wrote:
> Cache the CWB block mask in the DPU virtual encoder and configure CWB
> according to the CWB block mask within the writeback phys encoder
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 75 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  7 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>  3 files changed, 83 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
