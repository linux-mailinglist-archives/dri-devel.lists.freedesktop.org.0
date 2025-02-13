Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A878FA34B16
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6932010E04E;
	Thu, 13 Feb 2025 17:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CXPGVqOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD310E04E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:00:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54505c79649so948230e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739466011; x=1740070811; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eLTdc0mnszW35pcuuPl/ETu0QFfOhGZjVUBzq1yxI/g=;
 b=CXPGVqOVXX/3rXD4lX7eQdaSI2C7APDioqO5MjCDtSUhQRFTkzpzw4Zt6EBJAhH0Wk
 ulMApx0bfnNLhybX+E4aDstT1ofKRQesUZ++z4+TRNF/Y47f446RsKPR+b6nLlP2IL7o
 NOe91jJzO3XoiS7t64322PijNn1HrNAAraPI9NKG+PSUtBqwbnvtzckpolJIOqzaTWzu
 u6DNM1hGsvR8EbDH7fwMS6VHapCEbaxGzOagDeoLVgAGgW1Npip9FIQpye8v/G6ezi97
 Jl2blleU9Oft1+ovTlgZNuZl2rqg0+Qt+hzmE3gqAU0PbgGbagr6ieP9atpyGS+1Mg75
 CBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739466011; x=1740070811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLTdc0mnszW35pcuuPl/ETu0QFfOhGZjVUBzq1yxI/g=;
 b=VQRYQ8PRVdLrD3crMdPzRlwJ7Xqb73oOx2Kq+AWSW9UH9KeEYpNidqZpxikk4WYDMp
 x+lJOW9zY8YYJPfQ6DM/QMX6miN2Zl/M5KYCNMEWvccr2oEJpplOyVEjhZ/YXy0xN64J
 soqDOq10vMoWOCA3ZC1244a+AHl/2/7GwcwfSz0vsJmPY/52cZlgBOy/mOTU/jU4S60p
 jEs9NHeUmicHlNNQTOcVY82zlTdERoXPeiA7RC36Z9qIufDn0hgqq3rGmwmHTW+/Akoa
 onpIU9yLc0h/h1knnU4BkGtr2TEwGL62WhVJ/6BZUdY/6EgnRCgrEb41D8AWmK9bA2fp
 x2TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpup5w6Bwhhy+xSgaiTkw9AxtTCoYPIJVYzZbawtLMK6wG5s+uF3MxDDE209Qk3jB5jyzxO/sFi7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6LI+7sgl9U1sseGDah5flJwGFsRqAiOjxcitX72huXQTW0OkR
 xrD4SDEx9m2KqYtVQDQqMyfMtXdhsQzrkfqpnQBEc+yJFP12QaoP3FDF7Y/P6uI=
X-Gm-Gg: ASbGnctDCMxkeC9OjceVcXiHOiX/NTDb955hB7o6fOyA5GaNegQhJxH+m8qTizbv19O
 d1IkWzIH4og6aegYKnT1fW6tP39HALNH7piZwnHZcRLEmM6+MOw4xZrJ9btMJUmidFW3hA7qROy
 f8L322vxGrOHP7IwjNdMPSiD8RF9vQ1VHbjIZdbflVphl1JFaWHa0wWrzfdhQpKBc4LOLdYfMwA
 YT/JWm129Iv9jfDevNP//l0W0iXZeWehtGLs270G1l475nWnQzB1Z2uoYQo8dG0XBWppMlQ4gGA
 lqNN1wL4fd6RnnPT/fbO6vUd9pXl5uPMohdjmctENn0tizIH73YEHplfg4fOub5uxBYBVfY=
X-Google-Smtp-Source: AGHT+IECjSH9vRJLStWd+xD1ybGS+qcgRaQJyWQXD6FBqkvSQHj2aTj5q7HpRowg32NwdODaOMXJGw==
X-Received: by 2002:a05:6512:224a:b0:545:fad:a757 with SMTP id
 2adb3069b0e04-5451dd99d0bmr1143047e87.29.1739466010776; 
 Thu, 13 Feb 2025 09:00:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105e4csm219176e87.111.2025.02.13.09.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 09:00:09 -0800 (PST)
Date: Thu, 13 Feb 2025 19:00:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <pgwuzwohvnvrw7ism5zuaigjjsljvqylej2tyjxeo7cpcsycfk@lusbxdvvbetz>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
 <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-3-3fa0bc42dd38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-3-3fa0bc42dd38@linaro.org>
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

On Thu, Feb 13, 2025 at 05:27:58PM +0100, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.

I'd say that this is not just to 'fix dtbs check', but also to ensure
that MDSS has enough bandwidth to let HLOS write config registers.

> 
> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
