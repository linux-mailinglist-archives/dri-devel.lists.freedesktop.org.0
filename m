Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8D9454E5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 01:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576CD10E142;
	Thu,  1 Aug 2024 23:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xhGSElYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A7A10E0FC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 23:26:51 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f15790b472so14505821fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 16:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722554809; x=1723159609; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2VEGUPDRRqhVW/PJkPAae6CRq9ZnKyovwy6ZCh6qQPw=;
 b=xhGSElYz9cG3lNcHrn9wgu48Gn/a/8dNHru3vUMKsnRlFF513JCWb+uRlwILlufnw8
 U180sJjcBj5fzTBMXzz5yGRziq2+QuogvEsWo7YlGn0zDM2iwUq2a2RTRurvIitjuTGG
 GL9zGir5dcaTrT0FOq2i3rGxt5v01zNkwqokBjPf2unDgtlL6Fkgi7tH5soYORvNCNlg
 p2UBPOD3N+ACdCImcBYhA76dsbfyEUs5wE1Unukiy0cggPbzX3H214Z1JbMXqTZLjRu1
 A2Ji6wIgvxqI97bZvN9EjBnAs814Tltoon70zbcXKrjKUeqLyPNnHuTeKJ/bbd+RbG5c
 5pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722554809; x=1723159609;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VEGUPDRRqhVW/PJkPAae6CRq9ZnKyovwy6ZCh6qQPw=;
 b=cdfmjs0DwZRV0oeMpFlFx4KmXsKoTJQs1w40hb6r/J8UMrJrVwqz/4WTG3A4KbNLoR
 FTtj3on5L1tiCdXchjMAe17pk3l5AmGBYPsUBB1j2EgzXvO7q8cBeWmWC40vWuCb7YI8
 H+r+nAIjRohOwj4/qy8C0mys/a5HdFiUwXhMEAZ+36K6L1GC35IPzVOR/kKeqzSdcdNx
 VKNLihJh6zMfsV20EBHnfrO2THZgMNKVwfwntKN67mkgagrxjE0f0FPP25MdP1U+QNQ2
 6eodfSPL2ErALhvmx0bg815DzvmX8mZQxsj++aLXyG+xGVuNSEXs54XUODpMSwu71GQV
 lTBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8O1vwMarZMRtB5ZGHvl1cqBN60EDCPrxnbmfC9MRsaOYggyR6jDbrRawkitUq+I6xchk71l4tmJLLpr4i4jwDP5bVEyDt9qLwzwwvP04J
X-Gm-Message-State: AOJu0YxUE48/AAfKqEhL+5CWg2bDVcuHAD9ndLZ1fqmxK0DzHfpBg1Mr
 UDOgaUdbT2i+6SOapio0nXHciEHZOhk6bduKhPQGQ5UMtXewMagzFYiz4dn7IlE=
X-Google-Smtp-Source: AGHT+IE4Mua+Rvlk/mPH7ZfoTa6bGdKOO4U17oj0KhChirq7ABB8vqTIToIdDn48zSCe17DTxHCx/g==
X-Received: by 2002:a05:6512:118a:b0:52c:dc57:868b with SMTP id
 2adb3069b0e04-530bb3b150cmr1017683e87.13.1722554809015; 
 Thu, 01 Aug 2024 16:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba3cfe3sm75233e87.281.2024.08.01.16.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 16:26:48 -0700 (PDT)
Date: Fri, 2 Aug 2024 02:26:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: move dpu_encoder's connector assignment to
 atomic_enable()
Message-ID: <tdmzxhdd2hml4zrecawelmw5p2wrqqhzqoxip4wlbzmb2dvfpe@tmoinnmcpxsf>
References: <20240731191723.3050932-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191723.3050932-1-quic_abhinavk@quicinc.com>
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

On Wed, Jul 31, 2024 at 12:17:22PM GMT, Abhinav Kumar wrote:
> For cases where the crtc's connectors_changed was set without enable/active
> getting toggled , there is an atomic_enable() call followed by an
> atomic_disable() but without an atomic_mode_set().
> 
> This results in a NULL ptr access for the dpu_encoder_get_drm_fmt() call in
> the atomic_enable() as the dpu_encoder's connector was cleared in the
> atomic_disable() but not re-assigned as there was no atomic_mode_set() call.
> 
> Fix the NULL ptr access by moving the assignment for atomic_enable() and also
> use drm_atomic_get_new_connector_for_encoder() to get the connector from
> the atomic_state.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

Thanks a lot!

-- 
With best wishes
Dmitry
