Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C442EA3FB2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4331B10EAF6;
	Fri, 21 Feb 2025 16:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rL2calm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E753110EAF6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:27:08 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso2599033e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155227; x=1740760027; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RO/xULPiLg/cqk8vEEmcPFhJpvcf/cIfAW6O8KBIGk4=;
 b=rL2calm9WWQF39IimfcP1vkvRny5ENxpAOyM3UunAMk8g3nLD5Vf5219ZZDzhWhJ22
 SIx2DUKMK4AgJ3Nle4qYD5aBus/FV/CVprWvo8gCdG1aKHlsiSztT773h4IMtrUeHWUH
 g4qM1IHcyxQbz8OQ92OsHEO0dxpDm8b6C4gjEdjTpxCm3ez2UAVB7fU46A0mAzyBN2To
 Ac7FOExhuwwYkG2Qtutq15bLxmLoXRx5m/TYYGNEuFwqYpLX4DCzwmhTAk0dyWeNmcDs
 R+mBrBGeNXfhSQIo6EgaHUDA3CRQ5v6+1K6GGB6ZYpFKy0YPpUDSqZgcv96Oxqv013FD
 vMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155227; x=1740760027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RO/xULPiLg/cqk8vEEmcPFhJpvcf/cIfAW6O8KBIGk4=;
 b=scjOPKGuEjBPNvqOOaeuhsk2QGXRl+rtTHzlcOnimGvnbNTpbsEY6diNyc1wkStU15
 BP5SldVscoA51uT6kELEPMtSqgm3WvRiwaCH0iq82mdvX63KEW93/I3Z8HyyZs4BeuXX
 DrwYT4j1+KCds/P6PP08zwxPL62OycZ4LcTzpZKmHpAfy2dLYHwr6hmrWs33OYZrBjli
 DHzQ5wYSwLiSa0OgUaPUpy6ykCvsjblAm/ZwoP5tSFtcIc5XqMOv+ELDmEVHYa/U/NcH
 noq+qrfdaf42tLwHBluWNy32aLvv+/Fe9I4YdTdn/vDOD8N5urch5pxd6Yh5kNNhXxUl
 NpAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1M0LmkLYvPLvjQNu5FPliGfRp3wjNYR9HCmP07aPjrb6ZRR+n14KZG/Sawy1X3EZ3LjEBocWX7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx555xozYphJ3CYZnUdgjR9HQTzrtWcw0yxuqCOSpKgP78aZ9K
 9wLBMhpqqYy0OU1NHFbrdcrNAsXXpNKbe69rGBdea8KEt8cZftwhgDI7wH2zHRM=
X-Gm-Gg: ASbGncvQuUcDoT8+X8Fyl/hbh4wRiQhVWYoyK+LbtKDTHvSC5s2A+wwTKQSxst2qzVn
 KWC7Om7IxzXa2neKDDoBZeM/OoBLUK1pFkeDSYp61CC2EJe/zzRXQLQk0Wa/7nq8SkUtlJGEpKp
 bbJMfGhoc7Z4Y/vLGPWIebOTuXFKkJno+lhk8/Xp2uVnpZiv7OuSaIAO6QDmKnRoOM9c2Ko/ml2
 wC9IoNZGnjFSvDUdIwoYvBIvVzx+9xvSjtdgGlZiDjiZzZL5LxFYsjqYMSo5c5BkLe7AreAkw4r
 eSs+XX5i7jF2gpxQ8G5KYgFkbvimwkH4233KkKnfz5TXPPcVmWG9IJoyJ4XzdSn+nCF3pGgHM73
 EXD7i0w==
X-Google-Smtp-Source: AGHT+IEMuaPFm2VqydkoNq2irXckzsYYhwuYOiNxJjx5gnYeCmDTClKpB1kOxjoJ7uto3x+2JhCDUw==
X-Received: by 2002:a05:6512:3e1b:b0:545:8cb:218d with SMTP id
 2adb3069b0e04-54839268650mr1523943e87.41.1740155227153; 
 Fri, 21 Feb 2025 08:27:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531afdbdcsm1984161e87.247.2025.02.21.08.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:27:06 -0800 (PST)
Date: Fri, 21 Feb 2025 18:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 20/21] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
Message-ID: <vdayz63gfjnm7rwaamd36i5fbgtaedvpobuvp5u76iypdrwcsq@atgj263lo5g6>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-20-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-20-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:30PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with new LM crossbar that requires each pipe
> rectangle to be programmed separately in blend stage.  Implement support
> for this along with a new CTL_LAYER_ACTIVE register and setting the
> blend stage in layer mixer code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  27 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |   9 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 126 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 ++++
>  6 files changed, 201 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
