Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D09F64AD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221E10EB73;
	Wed, 18 Dec 2024 11:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bZdGe+h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F079110EB72
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:20:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso62891491fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734520811; x=1735125611; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
 b=bZdGe+h8PfepLb1dn8TXlgWwOnp2Go4BlekislIETEJ1Npw9bxndY8rGv+Wt9m7Mjl
 RWTfhsPWjFcNnjfRZHxHnenJUc2r0rpW6wz0HolIFoNwYU+7fSIQ4gto1jSLeTvheZ9p
 OBmmX/F+IRlpnHur6JXNLDEccCPQbX26zZP5CssRpgBuSycExevVZIAlUMVvOPJayxl5
 r3EkcwtizduPZofgaoeqB3UOm4N+NZ8EDej2/DilPoyv08VuRcB/8ofyTxIje9xqQSLw
 REFb5ChygL5meeevt5SLhsedYlKRMiDl0Dz0kaeilGq6bPHK8XeM0LIH7H/h3R+h94tF
 2Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734520811; x=1735125611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
 b=xGC1GGH9TyoijMqtetGQT+TYkZJ8og9ce2Yv5Q/GS3G5MNK6+TVoRegVnVu9FIIk5o
 X0YQO68ITaTDV4MpYBBLTPPq/YisBbdvveZuQw+PNZ02g4rubkW/CWJJc7DzdrWRM1ll
 bbCHpXbwEXDNxxlr+Vx4qV36BSTN3BlQgClBtOfWjA5u0h5A+xRpHTHuiV/rk/tQs7AB
 5WzMTKjH7TzPZUNJtjPC7CYTU85jLCemtG2ei6aECTnKj7ebMLSl0KaBtRLdaaA7P26t
 F1xGvS2mXbSTLm3sEhyySWpn5IyiFMUovFMoIQfoMaCT1cBoilrqIWJWGZlo9z0ndrBS
 68dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbNuVoFevbAzrq7rBYqsN0Cl+KVbczgCKuNZO1WFlSXPxuPIfFr3zC76uj4OlikvtHHaH17ZYdcxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+BFVmXvckU2yXe40o92PgoaKfnEUc1A/4taMl9ARnbHwP3u06
 fyVraVj7tJ67ou4UZX8Wl7YtxkT1IO9TnhopqOA14ELEvMAj6cdJkxe/syi4O5g=
X-Gm-Gg: ASbGncuCjCx0BEJrqDU5AKvdtLkw00lUNIOq5czVTYROQAVHyCQn67gUG3cB2wBeV/x
 s0m4ZM9kEkucXWjCDxtTEW+OeHFvrIvTnpCbZtaAJ6lhYlPMmStwmpOSeC5J08+iZ6jpPkNhKLO
 Fpy4YEatuEmTjxeMJrPOpLq/EcaCYEV/TTBum7+puLtdxhW3giKt2CVdLupsFPYrdQprucIEP/9
 ETX97DuAv3I6b8YHkp998vKYwKmK2dKJU01+lYGy72TphjtyRpI89yaDbAR/4YSCKTq51IZ0gwE
 mk5tpD4TK0F7/TmEgbKhRIie1plYjc9rBJiA
X-Google-Smtp-Source: AGHT+IGoMLpfK0AlU4GXbEuAfh2gfaHTUuRjjC5sL5Ab5KUlHrgJDsb/9UEzt0pS0syIvxRwbaMgOQ==
X-Received: by 2002:a05:6512:15a2:b0:540:c349:a80f with SMTP id
 2adb3069b0e04-541ed90142fmr1009563e87.38.1734520811195; 
 Wed, 18 Dec 2024 03:20:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm1412055e87.138.2024.12.18.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:20:09 -0800 (PST)
Date: Wed, 18 Dec 2024 13:20:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
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

On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_atomic_commit_tail() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of DPU
> snapshots getting captured for the same fault which is redundant
> and also might affect capturing even one snapshot accurately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>  drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	if (kms->funcs->prepare_commit)
>  		kms->funcs->prepare_commit(kms, state);
>  
> +	kms->fault_snapshot_capture = 0;
> +

- Please move it before the prepare_commit().
- You are accessing the same variable from different threads / cores.
  There should be some kind of a sync barrier.

>  	/*
>  	 * Push atomic updates down to hardware:
>  	 */
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>  {
>  	struct msm_kms *kms = arg;
>  
> -	msm_disp_snapshot_state(kms->dev);
> +	if (!kms->fault_snapshot_capture) {
> +		msm_disp_snapshot_state(kms->dev);
> +		kms->fault_snapshot_capture++;
> +	}
>  
>  	return -ENOSYS;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -128,6 +128,9 @@ struct msm_kms {
>  	int irq;
>  	bool irq_requested;
>  
> +	/* rate limit the snapshot capture to once per attach */
> +	int fault_snapshot_capture;
> +
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
