Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF69763A5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB9210E78F;
	Thu, 12 Sep 2024 07:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vIGrQv7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6210E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:56:45 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f758f84dfbso6135961fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127804; x=1726732604; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rzUy16PQ8SDXmHcug8jXm/7h574vKZnBpTKJTICvI5k=;
 b=vIGrQv7uxOeU9fUw4jiKGb7HMmeY2GV4NKz1phviMLR3zkGiAXv3lJp9G0gvD19xkc
 UJALbvLpo7uPtvjf1+aUjWfG6qiztNJFYXi71+VHjbcBzLMWTRePa4n6voWUOS4hWxES
 Voj7R9EzGvzVbZWYtN/+mtNFIj7hPnpYX6F1wgUlPv6/tt1p1Jxf5ngdg/iwEoE/f2Vl
 QFx4WTi8+l37KzUfunTsCALjCfXuadkmusIre0gy+LfYiPagdS5D1lld8uWqY/jeXF/w
 s9ngkYsPvRGM2WyIR1+s8EJ362O0H/xD8xrhN1Myb26k/4HhZS6zwrKoige/+1gyzOZe
 b9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127804; x=1726732604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzUy16PQ8SDXmHcug8jXm/7h574vKZnBpTKJTICvI5k=;
 b=oIC/VrSRw5J9CKZgX5a4d4+4btSG8SVyHHF/GwxG+l9yb7IHiWQb3IC7tc6km1IGMk
 Y1ttEMJr2apEXB8xPJBIwXsn2vTvtSE2/uEnAX/X+vdjP11tId8r2uEloO78li8wZRQ4
 6xguI/jnF//0ICHM4WE9sRqIFhj/zyXPyZ9h62AFgF59KOV48QrXU5oI64Uv6iNh0Aff
 4zGa1VQtOg4HCN6QZ+5pwppL7Tkq3rGNQ+eTDsijKJKAeBIHHGpHyzLOWqkcl2xm8jg/
 P0XhTgu+4+QCUwO5kjkRgJMUcASyWRXq94YFeOTdol+zcnSgnqCCQJ80Va0bYRf9ijdG
 bqKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbhRvPKpaX0lsnzlxez9rdxvZ+alKqoUTVzAc+ud6gOin0iqsYsDaRIGd0em8TWhyL2JuYNpYs4Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuKwvu3XCkI6rwQIdblH7+Tgg9aEwjhG/OZNdUxMPqfKmWScc5
 zNV0cU+9BJLauLqW5zAR0uYqgzGAIyQipurEUAZgFiv6SQki4Uuw3L0/7yDOWvc=
X-Google-Smtp-Source: AGHT+IEO+oaR2J+/C5HWt9j3Jqj2WBAglLEJ+Odvyq26KObdZCTNoi/+ljmrdSm1pK1NNmf0NzUFaQ==
X-Received: by 2002:a2e:be91:0:b0:2ef:2016:262e with SMTP id
 38308e7fff4ca-2f787ca97e6mr12162111fa.0.1726127803444; 
 Thu, 12 Sep 2024 00:56:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c07c897sm18188401fa.75.2024.09.12.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:56:43 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Message-ID: <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-1-quic_mahap@quicinc.com>
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

On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
> 
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

As such, it probably can not be merged before 6.14 (the mentioned series
will go on 6.13, we usually don't do cross-tree merges into drm). Please
rework the bindings to drop the dependency (it is possible, use fake
nodes instead of using dispcc + ID). Then you can specify that only the
DTS patch depends on the dispcc support, allowing driver changes to go
in first.

> ---
> 
> Mahadevan (5):
>   dt-bindings: display/msm: Document MDSS on SA8775P
>   dt-bindings: display/msm: Document the DPU for SA8775P
>   drm/msm: mdss: Add SA8775P support
>   drm/msm/dpu: Add SA8775P support
>   arm64: dts: qcom: sa8775p: add display dt nodes
> 
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
>  .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>  drivers/gpu/drm/msm/msm_mdss.c                |  10 +
>  8 files changed, 931 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
