Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10D9112AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343CE10EBBA;
	Thu, 20 Jun 2024 20:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="upBpxnym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7EA10E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 20:00:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cc14815c3so1333489e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718913600; x=1719518400; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gMilNXtwVzUh+PE2x1zMrBwSzBscyeknBF0WgBRu6Ys=;
 b=upBpxnymb2fHzHQ552DRZPTSOwaShylXFwTrLmKPMQpus293OrpcNicSvAIOnx++IP
 eV0b3LDyyn1SWv64sBZ8c6sbWnNpDTMTzBCF4gAju59nmKrbAY0cxUNNi6FTXT/5gzeW
 zgUJugWRyHy7OkRIK0PzYUCa5AuhtbKSJ9X3nT5BmV1oxGY1Au9WV1EvgkcQp2GOvFq8
 Nnijcg0dKCVJjjLM3Ov9n4wKFrH5vAc+mD5RgqF7hCTtTP7phM6kKww2T/I4icJwxPdx
 TTrdnchElDTTNqML1kB4GiBnAMXH8rgYNsb0ZMiRxiXjKtBmIaVRLaWHWqUK0+O7jLzH
 bGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718913600; x=1719518400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMilNXtwVzUh+PE2x1zMrBwSzBscyeknBF0WgBRu6Ys=;
 b=tZ4TuW2qbA4UIPZBnxrQasu6AYOBG6Xxcg3/1OnYy/NQGCAhaGTrHpE/kSh35Ku/oz
 axrA3t/cgE+8MI+PIYFF/KXXBE4pYM3f2dOSJU2xNLbXWvnY7kAHkfR1mY87+ktJRDpq
 +k8I9rvqX0uAG6NS3XMtI74h9blg+wTnCrkj2FPntq0k+fp44zF+3ZnJ+zl5eoiFeWUu
 WJUwnpf4AfAUcOqWso2jKOmeFrmsk2ANqO5TJ79royIEH5CLpNhggG5phz1kzB2WfwNW
 Uj7ZeXSmLFDQ8QT1NA7UujoyLOzk1MuC2oYTmza1CwXIaj4lKr7sOWWit90eD2N1Tfij
 ZmDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm0iGgr2gCBA7Ja/p91JwXAIPCkBj+NwIvyPTfbMFYLu0ATSUU3O9EC/nQhv+tF7wNi88DQ38JTgLhPzcSvjRmInOi77KZ9/OwjG7BtnHN
X-Gm-Message-State: AOJu0Yw68149v2CanSyzentmIYSNtfk5sgs69R4Ol3eCqrjEGMCKpVAd
 32Ck9lvpTeE/ZRrQ00WW+O1jBI5+7rhB1s8Ox1djV0skw5kx+WRNBOtIrsYQ2tE=
X-Google-Smtp-Source: AGHT+IHdCVdixc3RWfaztM0Yax6GeQG03rZH2fQxNQj3MXGnPGiL+pdPpHyRVEOOF2kRgRIM885D1Q==
X-Received: by 2002:a05:6512:ac4:b0:52c:cb56:8e8d with SMTP id
 2adb3069b0e04-52ccb568fc9mr4688542e87.37.1718913600095; 
 Thu, 20 Jun 2024 13:00:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cae91a0ccsm1763627e87.97.2024.06.20.12.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 12:59:59 -0700 (PDT)
Date: Thu, 20 Jun 2024 22:59:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <2fwo2pbplaxkkviln7m6jgidlspnur25qrth42s6jozksb22w6@qkyt2og57baj>
References: <20240620191228.3673550-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620191228.3673550-1-quic_abhinavk@quicinc.com>
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

On Thu, Jun 20, 2024 at 12:12:27PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 4 +++-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ef56280bea93..6f8c7ffa2d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -83,7 +83,9 @@ struct dpu_hw_ctl_ops {
>  
>  	/**
>  	 * Clear the value of the cached pending_flush_mask
> -	 * No effect on hardware
> +	 * No effect on hardware. This ctl op is always assigned
> +	 * irrespective of hw version and hence no check is needed
> +	 * for the callers to check its availability before calling it.

A simple 'Required to be imlemented' or just 'Required' should be enough.

>  	 * @ctx       : ctl path ctx pointer
>  	 */
>  	void (*clear_pending_flush)(struct dpu_hw_ctl *ctx);
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
