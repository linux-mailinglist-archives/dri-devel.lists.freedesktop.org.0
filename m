Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3294534F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 21:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8010E92A;
	Thu,  1 Aug 2024 19:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lQ9q+Lh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFE910E92B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 19:25:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52ed9b802ceso8982869e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722540312; x=1723145112; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
 b=lQ9q+Lh51orWwAvANDfq59hI/RChrELI8VdZo3GWr06mpAsPeV+jwlJaACvXoRsVfV
 rON6exMEp0t4X9nDs6lEF9rV0e3QkQlK9copdjnyzZE7TsmvdZnbpr/FmHzKCBY/do7k
 jKqb0dVqxRwAYUNoYoDqO0ySUffVEElNEjPbK9HRU9l6B0hlw66M/rWVApAB26+YGQZy
 8xTdm+ebwelEEXQSYDOI2d/rvzxGj/eaVA1IjoRuyO+rFo0nKdRXnDXZzLTJxIxLQJy4
 Z3ZAkB5nqWW0drtsQDbTT0qC7ParA0VY/WzavCS7xY13uf289j1L08+4fRT5ENV88ZZa
 Z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722540312; x=1723145112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
 b=AfFRC6qJYmI4vzIZ81tovhMGZHSq6NU3aaPNlHt9ewVm8BAtnolStkn1HlWkYXnZuc
 pL+xewYB/k2DUKlA90h9v3XxndNS0/HFps58F2arc1aZwjvGkIcASjn7/wXtdd29L0Lx
 NB+rh5bOu6z0NhmcvmK6GWO1s0onoBtoN/dvCc76YFlcRV2e9xbbpUhr1x2oj/MfEJr/
 xChLf9xjXyxllE5PksotOtpkAn0QD6fJFtprYC1xs2nXdIT/G5gOPgfzhG41dLZvSbqx
 JaRJWOAxJW+rWMAAd6zi2PvGmD/1tXIBww5WWYco5/OjLbFRni4i+zBI6JvOnZ67RSvD
 qf8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK2oSGgBn+vzJB2TQu9OXUpCz84S4GYFwwUrmB5PilJ+KP2fRIuFrU9blduRxK7tsAnKWRz1DaiSmGjW+INsO3oeU/fviFVj9ZCpvG5k9N
X-Gm-Message-State: AOJu0Yyu73Q6B6JUiI0SYdDL/0RaxLBVtLF4N9eK4Y5ZiohIYwv9zcCx
 Rw49IsK5SFbjnfWekbR8K6WTLjjGTSUaDTZ982YjOdBJGxUI2w2a+icVrbiF22k=
X-Google-Smtp-Source: AGHT+IHyvHO6F0PypSn/UmfAHe+RChPC8zWKCvyEdtI5ipmD0BkNJ+h95UKmnYJ0E129Lj7ff5XZnA==
X-Received: by 2002:a05:6512:a96:b0:52c:8c4d:f8d6 with SMTP id
 2adb3069b0e04-530bb39b0b0mr724584e87.45.1722540312231; 
 Thu, 01 Aug 2024 12:25:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba10fd9sm35859e87.99.2024.08.01.12.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 12:25:11 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Message-ID: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
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

On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
> This patch series add dpu support for MSM8996/MSM8953 devices.
> 
> Note, by default these platforms are still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.

Could you please provide a summary of features actually tested with the
DPU driver? Have you tested YUV output? Have you tested RGB planes?
Which LMs have you tested?

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Dmitry Baryshkov (1):
>       drm/msm/dpu: add support for MSM8953
> 
> Konrad Dybcio (1):
>       drm/msm/dpu: Add MSM8996 support
> 
>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
>  6 files changed, 678 insertions(+)
> ---
> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

-- 
With best wishes
Dmitry
