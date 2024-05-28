Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB218D1118
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C1610EB4D;
	Tue, 28 May 2024 00:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yRPgEYhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9910EB4D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:45:55 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-529661f2552so335581e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857153; x=1717461953; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
 b=yRPgEYhWqHAejXzjNBqQ91h/4/ntl9GSq8B7LZ8+OydSfoSqiuB9pze4q+cpnwLSFB
 3APnKEC/f9Psonbhazqk4w2XBBbW4uHMEeVx7VXV7f4pKab/hrMNqQDRV4ApJEETEyCs
 w8kPaVzJPMW0C6iAEb6wISyhLSGPZk+NjzKvuAlJEY7ljA2oybESGmFZivXMpUDC9K1R
 8R3mTNk883cJTCf0L7wXD0voBwTjGtAweXFLOgfPYI8KWgvev4I9gkQtp+h3M+dfmBzl
 4ZB1+JVqEikmbxhDzD2x8qhSEcGkT3D86t6EYk+TDqb4bKH1bjCfMVEvV8QEYaU6AY2G
 llGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857153; x=1717461953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
 b=M10/NbhrZWU8gI6UwseYeD97DrdTArtBWcCeZI2Buyf5h2jVv9j3ccydWmOOJTubaI
 xwPdfEXPiMO/jQ3+wKocH1JZd5GHcgtMwDSbzodmYQuHOO4E8P8mE8/N74SqQEm6oCN5
 XJabm0vmmDNsAQGEADH6Z2fAy2P4aKE+CD62Kave51wxcnxJAmw3OXTPNof4+modns54
 N26RwU8zmIf6eJ+WEjsExt/qFKEZq/JmGbtmZqzwhvYduUTEbsEsrpES08zxYOWYnNCd
 wT5sbQ4DD5Fb6VDA2sXfseRNJ3ohTZvUQ6SPyakNbTizPz3QBsnrAqTEIuDlVgGrnr8h
 AT+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvLQ97Y8ekDZLQ4Vp7IFC7decuCRpkbKAgdHtRwjvP/x8WXSb3cciJL/ozalvj5YC4lR/y8yGCS0Y3Zh+ethlAEwnxzF9mLmKWGcbTYyWq
X-Gm-Message-State: AOJu0YzJCir2eMo4v0gLUt6RZ4eqfQhOsJVx/TTd7T6nm1916DrWyHUK
 JXHW2tMkXqyMyBbAT33DxrxYThypqRj3sWa+N6RHmXfExS2cS/+OapzBS2EiXsI=
X-Google-Smtp-Source: AGHT+IEeVOq5H+mPCLvlXwPGTkXAziCy2DXE3RRA3lEao7/kITRzHNGqTbqSesNqPvwwhBkkwxU/JA==
X-Received: by 2002:a05:6512:2387:b0:51e:41a1:4d5 with SMTP id
 2adb3069b0e04-529646e363bmr8255722e87.9.1716857153315; 
 Mon, 27 May 2024 17:45:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bb04sm812775e87.142.2024.05.27.17.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:45:52 -0700 (PDT)
Date: Tue, 28 May 2024 03:45:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
Message-ID: <w5qtzevizjq3626uzhdnspefnojcludcdrbcbxnre2fxjfdei7@s7yqvofew3tu>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
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

On Mon, May 27, 2024 at 10:21:47PM +0800, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add width change in DPU timing for DSC compression case to work with
> DSI video mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
