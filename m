Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC669D668B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 01:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D9210E21E;
	Sat, 23 Nov 2024 00:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j9kLMGpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180C10E21E
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 00:00:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53da5a27771so3209831e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732320020; x=1732924820; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
 b=j9kLMGpqlxp+lYIVWhZIpzTrBf5zLYLAs1Yxya6e/hFuJVBMnTh+BRm2D/IZiSBWl8
 ZbDQzSCtuKMKEGi1pIMP+cITATPV8c6k7DMUnhOjvd76JF94dW97NmNlYQrkK/ufn9MF
 gxuihubbiLt06RbmxXbq5pNRS5dUCmCP0VL2DN/1I9ysfRxrppl2nKYW0v765nK9ANNS
 BfG4ECf+3F+fbYlCiN2xQDzkp+fcbP9+shJ1u1hlvNBJrpkvLicHQAsfW5fyi510kK1A
 16qZ2VfrPeiN6vah30nk9cNoDuKhXcgPFfGqiZfCi8kWSfD4nS+owXN6KoUNByGbDeaZ
 HxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732320020; x=1732924820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
 b=kjqTqO1DukBujjq/PapwfyAHnxWTafPFKvSM1BzVLeaIsTWvCw37NN76vWnM0M99Il
 d1Htf0nT0FqVPXoXmXuWNFL4nU4DojxKANKvqcqWGJetJTVA7Nfd8xB4MqzCyXmQDl8N
 CkCm9JtlxECxl0vRI1B/p66KcL7+U0y+lE3gQy4H8zATd1e92cJGJ8gSRR/Zm8k9LYnn
 ihLDrgza7txJozLBgCUZPsSpM3INB2kLLSnHCtp15ZSc9usUQ+PUduVUxGANQS3H1fq7
 vEwObqkqesa3UF2GKuqopevVg4eKZv6NljaS4RDiUQm331CVRGPrSuoBFe8U75oy0Xlw
 MqCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkK/kwAdBVkv/Z1ZnjXxNZzaFN5Zn5LvCvH/eNvoi1RDTR9AGG3qbhtff8SfIm8mclCiSYBb1Vuf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUyIckUZt44B+4zS4Mu+hYRoJ+IgN94L2cF0CZqFbSng8CLbyJ
 HD3WqozJDF9T8tl8pdZTc8yg9VIUnMBE+3w/frHVIfSxaiGy02vakRnHAbwAcNo=
X-Gm-Gg: ASbGnct7g26OjgqmXfX30cq+cWv1fus80pzLNOk9rX2Mr/yiavlOoSWrcQcpD+JooIu
 74Yj3I0eYPptAaAGiudnKN+1/rbe9HIWx5+ExBUtIsMrNnq8j4n3S68dBMa4c02OAV0HZrAN5x6
 zGDAEOQJwBU81vb0ZwtXeeJLtgYXNPflsHkY2zjeoOB9BcplPNUD3Qz8ptH9Rl8Y5qkIj8oHZaF
 kGBh4zfkbaDwhV5qHc/TCEx/yayg/vu1E/CXVuvwkfBmp927whPR1RQEFzrLNZBTDStaO2o0icf
 Ok/TQB6V/gGFSLqp2bGQPSqvRJnazg==
X-Google-Smtp-Source: AGHT+IFzdu68PpAVcH2MaPOLobnSuhzBLFuGpwZtzC/B7jvw+8UWRjpP5qmwwColoKW5tz3fO1q7LQ==
X-Received: by 2002:a05:6512:118d:b0:53d:dc12:7cb4 with SMTP id
 2adb3069b0e04-53ddc127db7mr103246e87.29.1732320019290; 
 Fri, 22 Nov 2024 16:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2497cfdsm610900e87.248.2024.11.22.16.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 16:00:18 -0800 (PST)
Date: Sat, 23 Nov 2024 02:00:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Message-ID: <mue2tzzik4hiu3i4jjl457inbrveq7oifsy35fzwclfbqwn5xz@awtruuphsjzb>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
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

On Fri, Nov 22, 2024 at 03:09:10PM -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
