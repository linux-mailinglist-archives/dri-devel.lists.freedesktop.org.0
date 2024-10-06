Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB883992164
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470410E2F2;
	Sun,  6 Oct 2024 20:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E8MNtkZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961B10E2F2
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:51:30 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fac3f20f1dso38101441fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247888; x=1728852688; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3HiBKSVX75LHHDNbaC77fS8s37J8jrwJ4P99mtP4pG4=;
 b=E8MNtkZBEkSQgs0deJ4NG/ubat9puzgYcEg96im7KFdXq3RP5C/gujmEMoRWcD/u6W
 sthxomisHWy0KePDreqjnvaJpvxe86Bvb20ZRap1fBJZpMuRYVUrklI3Ta7lA0PnGg+B
 e8SIC8X6F+8yL0/V6tjDPTdtPdZkzCv1SpEPb70cHVwjoshxJRJ3/3h5PG1nwxJc9wqc
 Zuk4lug7D4YzGOqwEO1r1LeRwrPeO14U7NmXb7BstQXWV9eQqV0xvTYnvxXN6KkY/OWS
 kBX0Dk8nRot1t3xmRPHa9of5M+iyJJm802jwKxP0Cc7AfKw2Y2+JdGS1hBsARF19nzjK
 4ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247888; x=1728852688;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3HiBKSVX75LHHDNbaC77fS8s37J8jrwJ4P99mtP4pG4=;
 b=l8c84o4oMbpzl0pZ5NfWJqirHJe0zynAeyYTI6lmznd/rNfmqIBzKr6McCSIq3eBis
 BcQiBN12EbiGULuxhv8iKUq1ln/xAuOzcmjr8X/BhuBdcZK6ZQET/sRu+AJOiUa7s3HL
 cG08Kf4cnFEOVzkGVFUIWZkWKozSEwc9uyBzhy0NEJNgfiwePlcLSk32Cfm+z3EpcxCe
 OlacNRi/u0LySopCMM4oNTBS3jiQRgkOYY87tDU0+GuD5sMpIODDtDf5naYBr6DPIVNy
 Y/DHG6eFnBm0itcvGK0+N6YxJBHmFFRFxJ5jV+RT+VnbAAwZCI/zBxFaKVbBzFtLETBc
 0K3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ03pytPS63z8HMeEfBE57oEUxJylgF2gZaFFdSbn7njo8ESCRS0ZDNCFCV+IosaZjCNYthPPp6H4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxiw3N+2LEiHeUZzzQJ7kc+gUrHUAhz4SxMycuWbR9BwubEaUnq
 AsfhZAQjayh8Wt+b0IIh6JoK+snLCYj8UfDDa38Soa5tgxn6DoXnc/spdB2kVzA=
X-Google-Smtp-Source: AGHT+IFYj5QIPKepGYx8O1cYCz5bguaSXuH74kBNDjDjaFAC/MHye9Vyl7Zez82XTrTQRF7q0Etevw==
X-Received: by 2002:a05:6512:230c:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-539ab858874mr4118687e87.16.1728247888476; 
 Sun, 06 Oct 2024 13:51:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff23334sm604877e87.184.2024.10.06.13.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:51:28 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:51:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 1/4] drm/msm/dpu: Add support for MSM8996
Message-ID: <c3fbm76ei3phw5y3nq76q76zkxcytiivdboe2nwifndguz7vun@pt3u6rzqxf77>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-1-594c3e3190b4@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-1-594c3e3190b4@mainlining.org>
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

On Mon, Sep 30, 2024 at 08:35:56PM GMT, Barnabás Czémán wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add support for MSM8996, which - fun fact - was the SoC that this driver
> (or rather SDE, its downstream origin) was meant for and first tested on.
> 
> It has some hardware that differs from the modern SoCs, so not a lot of
> current structs could have been reused. It's also seemingly the only SoC
> supported by DPU that uses RGB pipes.
> 
> Note, by default this platform is still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [DB: rebased on top of sblk changes, add dpu_rgb_sblk]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [Removed intr_start from CTLs config, removed LM_3 and LM_4]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  94 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 435 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
