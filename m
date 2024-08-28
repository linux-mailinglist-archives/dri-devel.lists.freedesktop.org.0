Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CB96310C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EBA10E0EB;
	Wed, 28 Aug 2024 19:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eC/jy8kv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3510E062
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:38:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5334c4cc17fso9973918e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724873916; x=1725478716; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S2boCnau9cNyFJbbhnQn5xxnCB2xmtbbHbu9uGAoNXM=;
 b=eC/jy8kvfLiBYStqPXyjrLGw6RzDP3RsrMdOJ+3TIRIdD8eHaQ6mXf8czDj+4Mo/ur
 i/y8bgW95mq1231GKoRzPQPHgxj4m5m4FW5V8EQsELNvCJbcKNXNa/FqLP/h2NTb4m0x
 DycAGm7rqE0LCfXtFTAppb3ixsDs8E50Vafrrwa3uY7n6VVU+gHpVQA/VZ2Vb3DEOisY
 KnwKHMrppKCZ0l4fjOUp8In1oPGK77S6UGZRRcGE0lIqTfxVIsQr0uI69BXa4HCTeuK3
 ouz25eBkO5xnvHwO0ZL/jkRfjUihyNuvsNSTE6Gr+SSSVGmol2CZJMjrcwFwwzyadzz0
 Ztpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724873916; x=1725478716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2boCnau9cNyFJbbhnQn5xxnCB2xmtbbHbu9uGAoNXM=;
 b=c7R9z/0jIhURkK6CyXVszdoUTbDBw28RHt2NOdydHgXUX11wLIqN/P7Py9fhB2bf/X
 L+sCXnn9LiDl8Z02I5GWFw9xeyff6iNYB85ASOAwT+fAUlYs4Z0ew3xXYLyFimxrHi8O
 8PhbXUzyQqo/+XP40EYmapZNxEbw5sdoXBlwFPeBp15POTDsjyVZOT5OJIdTQtqCUHMI
 /f0PoS7HQqgM8cXEYS8LV+Is4vq2hmt6+7lTSPtnBiQlxVYbiFGaO5DcCloUo79ihhjZ
 O36IUX5K4juDt6YgeXrS2yMcdhsGXfpJ5yiNlDIrXz+azQDyMKMK5ixxx8xDXgIzUwAb
 TSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW70iY4ZEo2Ac9Qu89Evl6dkHl+tuq8EXIj2psquWefpBGetHiOwA+M4TyAVQIOticCSlQ2x5BY+Y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfoQWs0vpGLnnVAzS6jZjfZDbnOBtIl9miWji9IU/ThoQ0ooBx
 um5/ef76uVCj1miX+BQRCNZ4w/lp2+1n5ntauKRqAUg7BSB1n6eMEIYh8lAaYqY=
X-Google-Smtp-Source: AGHT+IFX0ICTjWKM1raHcDBZYIJQJARuE3gnbn2GEX7Oc+LTxOmCamgvksbRuiWzNjzPy3Id1Vcj8w==
X-Received: by 2002:a05:6512:b84:b0:533:466d:698c with SMTP id
 2adb3069b0e04-5353e5aad3bmr216482e87.39.1724873915220; 
 Wed, 28 Aug 2024 12:38:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea5d34fsm2321105e87.192.2024.08.28.12.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 12:38:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:38:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
Message-ID: <sfdha2ywvtuffsyyrrbwzjt6nkjojpbnribp2vva6fp62swftp@mjhm6r74rq7e>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
 <1efd71c4-3bee-4c71-9e40-1284b9483824@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1efd71c4-3bee-4c71-9e40-1284b9483824@kernel.org>
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

On Tue, Aug 27, 2024 at 11:39:45AM GMT, Konrad Dybcio wrote:
> On 2.08.2024 9:47 PM, Dmitry Baryshkov wrote:
> > DPU debugging macros need to be converted to a proper drm_debug_*
> > macros, however this is a going an intrusive patch, not suitable for a
> > fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> > to make sure that DPU debugging messages always end up in the drm debug
> > messages and are controlled via the usual drm.debug mask.
> > 
> > I don't think that it is a good idea for a generic DPU_DEBUG macro to be
> > tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
> > default it should go to the DRM_UT_DRIVER channel. While refactoring
> > debug macros later on we might end up with particular messages going to
> > ATOMIC or KMS, but DRIVER should be the default.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index e2adc937ea63..935ff6fd172c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -31,24 +31,14 @@
> >   * @fmt: Pointer to format string
> >   */
> >  #define DPU_DEBUG(fmt, ...)                                                \
> > -	do {                                                               \
> > -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> > -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> > -		else                                                       \
> > -			pr_debug(fmt, ##__VA_ARGS__);                      \
> > -	} while (0)
> > +	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> 
> Should we just get rid of these macros at this point and use
> DRM_DEBUG_DRIVER directly?

I was hoping to get this into 6.11 as shown by the series subject.
Reworking the debug macros is on my plate, but it going to be more
intrusive. As such, it will probably be a 6.13+ material.

-- 
With best wishes
Dmitry
