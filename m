Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362BA03E2F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6510E23C;
	Tue,  7 Jan 2025 11:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YXCu5uDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EEA10E23C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:47:41 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-304d760f118so38825471fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736250400; x=1736855200; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
 b=YXCu5uDEnbhG05m6OnFPGRAGLRte2YNrOlvUAC88sbv35pW1SRsJKYaszghrgoZ++y
 7zeri2qx4uoZQTc/7acoc0BXECW8LSorV1Czfm9Ms1nznGowmPdJeqbMF0Q0v2dEX3N+
 gpKPS+rDfw+HrRqnogPejTlUdD+MSSnkfDntDkXqsv3iR4kk1mwrWn4dn9Sz1REWssSp
 7lZSSGbzuYWBx/quAxSsTmRKCOs2unABuwoC0nP+FHWPYGm0iKqzZtCPOQGeIWt7sDVU
 vEyEse2btLKzjFG4XKcvgZvM9pugIWf4rICidb1RWlBLkQ0ns8o9+CS7Tjbf7J4hQIvJ
 xkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736250400; x=1736855200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
 b=YiVCtfWft6Jpn4WKdlJUGAQ8JVJaTDmB7O+KWO0p4ybhD3S07wKvIGdMRD3qNCWLUI
 1I87wYz6oqEeA/D6ZlIoifJ0yvyyVC2Sic5R2ozwjlmBaGUKyge6oSnWtUK83HMe3Z1R
 lahyXa0pZFD/jupBQg8Ui/2qHvx+/m0AYLOI8a3Ae8BuCvijHWlEO0L6lZp7jWCxDJwR
 aiVuNMnf0ZmiYa8LZv7NqkjNqqldf3jM/YO+V0wc1NLuSjbTaIydZNK9MqIWcVL9pXB+
 VfrEm5aC4YS+nXucWR+vtNTFAwZPYGPFSmU4OGVajnJ4CnHvg/y9MuHjkE9t2GMC67ZQ
 YdPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8IyZ2IBhynZCe3pjp2idxgK+/RNUgFbaaF9xKvY3nV0SavuAzdRNB7ISbTjo1LNPV/FQrieft+qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5ZbGUoVqLyaLGe+itou9A7bQ5LGBwpvochjbVyTourXp4Jnep
 HTDLC/f4/QrPtO0Qr2o80/YgD/uHoiqy0b1/S9N2otiXL4Z3gPUSPLor6g/Lals=
X-Gm-Gg: ASbGnctsdPOZMhNL1ZllPWO2MsYYeXYo9mm7U+j+2fJNe+sSU2MPIql655RLrPmgfbc
 KEOjZodFPneS5sV66iIr8YPlC3ZwXCw9ctRcggVMg7L3KjdJu3E4cTRIGuCVDB7lKqsejH8rQ4l
 wiVynFNNo3BruViIjhM3zgtwvJfbyKi/71YAhzzHLdZFyCvssFVzf2KLwsVvm6ROxQHl28c9Re/
 Ebsgqr1j/hPuA+v2dVv9ACei674V2HIUWB+jcjG88WJBUGA94mfMkvftQJnF/4u5aGjVYrER/gu
 mTRMn0cZ4xCpJCXdbtkpZfPENvWxi6BLsX2M
X-Google-Smtp-Source: AGHT+IHc6EgVBLn9/SQM53EGhpryw3Dq5lMmYc0JINGrSFhjD24qHjoSL/GI445hMcy9tZWQjpzLZA==
X-Received: by 2002:a05:651c:1a0c:b0:302:3534:1fba with SMTP id
 38308e7fff4ca-30468547e32mr208884401fa.17.1736250399600; 
 Tue, 07 Jan 2025 03:46:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082e01sm58637631fa.98.2025.01.07.03.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:46:38 -0800 (PST)
Date: Tue, 7 Jan 2025 13:46:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <6etymzv5vziexe6kcgzas6pr2qgxbgsw3weobydwst7np77col@jszgjhnvcsy7>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
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

On Tue, Jan 07, 2025 at 09:16:21AM +0100, neil.armstrong@linaro.org wrote:
> On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> 
> 
> Can you specify how to validate this ?

Use YUV for Writeback or DP output.

> 
> Thanks,
> Neil
> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >        drm/msm/dpu: rename CDM block definition
> >        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
> >        drm/msm/dpu: enable CDM_0 for SC8280XP platform
> >        drm/msm/dpu: enable CDM_0 for X Elite platform
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
> >   26 files changed, 26 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> > change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
