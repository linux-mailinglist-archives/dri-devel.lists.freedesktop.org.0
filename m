Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA49D5CD7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2B10EB38;
	Fri, 22 Nov 2024 10:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZEE53tjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CD410EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:03:40 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so1355261e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732269819; x=1732874619; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
 b=ZEE53tjrixeCLndJUJ5rKvXbP2T62CasgH65NYW3B5CfNwNqoekF3kegDZAQByy3Fa
 pEFb3WgLxsg2Nyb5HXFU5JTv8rB9sT+2bVh8+KocYh+v9j/+XbJwSWpmyznReAzL0MLX
 LBlDpf/CXyNXcatsXsZ3E2F3np4hegrGXn+tkGQNynNZtt4c/QKbjuynuUOXtCZOHrJu
 oJbTnrkltjmuwX3CPXoaJJyc+3G8pLXUgw6bR4McNj5+/mN3BHHdb0L4Qhch4fwElO4F
 c5PuGsaCuo3kK9uYKe3oARufivG9t/Bx4HtYj9ic4NNK13QmrIH0SWbISkx6sv5IJFzK
 2ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732269819; x=1732874619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
 b=p81uXwsRKM/IBU7NiWh/RV8xPN6J/VHWM+iAfXXFJlpLG38KvXFuQDcRFhAnhR1imk
 9SQnVeaNsXl0/jqFQTeN7M+z2IJdaSpu5+m1DGJueWFD3Cx0qdCVu1iiLrmYZo4WM90z
 /fs7WDPkJ9vIYvNzRsthp3OD7Kl8MbWRSwDhj/Ka+RwkuQazyrYEou1MCgswUWZDvBOn
 tqa+6N75bvric4213zJK6CZRqGn7AyHQzGyEtLHka9AsvFS81Q2bdv+ZkTWAyA4jeZFn
 TZZ/pBoVzeML/i5pWJZEuvrUPfM+hStE3ivUhgZYYEu/jWTFoXKGjkN6wjE/Adm+CpAc
 /8dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgTy6ufZIZqTwOJKjLB7PNJIvjKTDYnFQSMXSmWuQhYLztzBm+yGpbM02Ov30jlBczUZ3XyzcoseQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5jHwFIYNMRj6Bts+wDcTW7GBO1dLiWEvARwwGvxk1bgVPP6Wq
 jdUR+wsPdMGlsCgy/niqWRV/FT2WUxxocmHbGvUgIo03YgEY2IXmKeQj54HKzDM=
X-Gm-Gg: ASbGnctNWJA6lTkSUIlXrsc3n94A+RvxfJRBl0HQXQztk5beyw/zyoAl8Klo+f2Mo12
 w7T9QfWbL0mkU11Dhkyz7kovZdsOp1piM1KI06vxY+Q7SR9YB8FT4YZQplWj8rIaUDzGN88oEVz
 ZrkVS+QgL+OFN8IrSs0vAHd9UePm4/R3tONMed7ryf9yndif99kexfxoxh0O/KJXSXUIDWgf6D9
 09tJ3O2vSn3+gljpcEggATEGnVOEedRze3fcZXXEmHjLy4G+PeiPdGXqVXF8Kk+UzpD0XmtqCiH
 Lz+SS2WvWCCoYMJsEWFGgHAxtUVG/Q==
X-Google-Smtp-Source: AGHT+IE3PHq2qPNqY+QbYoKQGe6R086mqzI0wJSLMJ+g6h7CmPQMNZmjuqoEun+JNczYZAXDctuzeg==
X-Received: by 2002:a05:6512:2311:b0:539:ee0a:4f8f with SMTP id
 2adb3069b0e04-53dd39b2dbemr1081114e87.44.1732269818813; 
 Fri, 22 Nov 2024 02:03:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24517e8sm318249e87.91.2024.11.22.02.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:03:37 -0800 (PST)
Date: Fri, 22 Nov 2024 12:03:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] drm/msm: mdss: Add SM6150 support
Message-ID: <jquwvnj7s3n5ki63ooz52ys3cbenuedr7mkrdkdujrnza3ewa7@i4y2uhy63yvq>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:47PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for MDSS on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
