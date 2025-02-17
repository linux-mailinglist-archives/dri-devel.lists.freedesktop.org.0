Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09604A38C33
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422510E5C0;
	Mon, 17 Feb 2025 19:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WssupDFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0AE10E5C0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:18:44 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54626a71b40so838733e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819923; x=1740424723; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
 b=WssupDFL0J68EGxTKhR9i6FdTixdAcIBgvLMJrEL+R0W9FPPA8bb/FqVwekQ8A26Bt
 5WYzurCw6JzT2TcnoP+V2AfTIJTX/Nti21vhWJx6SHUqzen5XDk2tmQDV+rrg2kbIfPg
 NYg3HPnKNosQQRH1H6Fhh8q/pPKGa40cDPpGMysP6qz57bFmMGVmTGIazq+bysy0GrXs
 /NXYx6BXZML8Hh/mty/aDqR6G5EhA/D69STDIEdIEbR31OhPCUN/2/s5fpjH8WD/EjhU
 DpajDrMD9jrwx+pJBRqeEzoRjxKCXzZnvRZV0jyoEu+yJcSS+wPwdpLslUNx11nVH4c1
 OivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819923; x=1740424723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
 b=ganwMLnQh85CCh6AvGfUPNSD0MAlFIkwH/Be4fKwncIy4AwnGg4+kIQ4EROHsLrpnf
 ZTe+s+p4mv70/OOw9qc7LppeD6rzGR5dHpzZTGhWbaODl3PoSQdNxwd1o/jISppA0BVP
 3xB30mPt8sxI/7RyrtXCgjcmDCt2EdPWvqtNbAK+lhFZsKzuGOYtXMKC9uq9rSavFlNN
 FkgjZR6m+efiUboV2crYEoYWashZpjHWi/T7frQuLLP3CrB2SKSRXl5qZm6XnQDGD668
 EYTSI9+P0lGlYkVj9bD85L7Zno/HKU1d2Qpfdu2l/fwyeDB7cN9xv7jishyWY9x5GWZC
 SH8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8An66nU0E3ht+xDjAMWVhm82LHUlXA46Xyn5HHRVfPtSzYz9vgdMV6ZwtzpnsoFZRGhJYxHkqEGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+OXQ2dTFV2x1sLDjy+6CORQil2serQgoCAYy8mGEXr5ApcxIO
 AatIBP6PQgaAjDyxUmwYV4uNZNrUXecZG9AzDdYMyL1mmvCGGbGDbMpAzhYuUQA=
X-Gm-Gg: ASbGncsgU88fRW//grZiSrxpvcqpB80Db4JwUlOeSPN01OZ/6y9X2+ZBthvJvkO+iSi
 j1lrCIDMR3rQ9VO4+k8Pt8pPJLkOow7NxvYDc69w3/deiUlYqyGJRJTrxqSZaCtEkuKPGb2NeMB
 9mrdo2keEnEe+h72ccDHAQuXI2FnRy6bjUkly09Z+ZBj+ShtHRiN7u86SLXzxQQpr7KHwbrp3wg
 3CPLH6Ibd5YuWIP5e57h493WshDGqW8e98qiOxvxz5Jpxm6e61WgkjAOIpjfGw5RaEfcgAUCaC5
 bd7FLv0RMgdZH2pcnFX9Adz6iam4KIn5FLhYInZs6/IXtYu0o+XZM5v08epHr/F/46AvHoY=
X-Google-Smtp-Source: AGHT+IH7pPe9WdA9acnmeu4tM6FBkJrCmOJkB/cGc23MUQGTJZAedW80zQq+KjfFc7YHQvnbMFONmg==
X-Received: by 2002:a19:2d11:0:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-54627f02773mr695030e87.49.1739819922816; 
 Mon, 17 Feb 2025 11:18:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461d4f2aa5sm694294e87.0.2025.02.17.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:18:41 -0800 (PST)
Date: Mon, 17 Feb 2025 21:18:39 +0200
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
Message-ID: <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> Implement new features and differences coming in v12.0 of DPU present on
> Qualcomm SM8750 SoC:
> 1. 10-bit color alpha.
> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
>    layer mixers.
> 2. Several differences in LM registers (also changed offsets) for LM
>    crossbar hardware changes.

I'd really prefer for this patch to be split into a logical chunks
rather than "everything for 12.x"

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  49 +++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  12 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  59 +++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  17 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 210 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 +++
>  6 files changed, 350 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
