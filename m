Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD89D5CFA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D710EB3E;
	Fri, 22 Nov 2024 10:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eIh8980B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1110EB3F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:08:56 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ffa12ad18cso17812591fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732270134; x=1732874934; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
 b=eIh8980B1+BVXvv8iwvwju/mifvGeiujgZv+tB3HF7YQF91IbZjp9bmazz26RnJHMV
 NhmB9GS2se7bl5ruJQbSPF+k2J8E6LYrJPSladYQETqp2aex5Z18X/Ju+gEcJdcwMNp0
 lrRSAquhNCQGOJQ5lD2tAi2/M1969An/VRcByBYUCL9km5ZamsNxxqgoXd3sZi3uJuKy
 s+u9xXIc44J3CJ815vNIKLA0xo48Pvu2DKnQ5ZfXGhdzv/KslOWKIEqtgwsX3lMUbzPQ
 NEwXkzdiF0cbCPl6MhU6GaYLERCNo1nRxDgs6VMoEeFIKh3wcOtBXffmCCSLGx3VYOVp
 WD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270134; x=1732874934;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
 b=oeffZbexfMDhuIiCy1nTZSjnSk0IP7oh++DjkhggXFxAkTGn709sfRCjwHIPOSKnVg
 dHtCeoHsUO/8UvxBPjWZP0R6xbf/IugkYpEoza6w809OUMahsyYs7zBl9oA3mWyZ+YBT
 uz2VTdOQzCE5GA4KBlT4vGpVEEGKxP/zPomwre+4NPJ3cgTu9wDiiMRvDJnVKvGsM2st
 1DgC7di/+6biO+SrFMwDiANeX6c9mu/iMsSjutUWkGlYKUsWjwfOUT3Ql207HiCjNyjc
 Xq3+ftn7e19mpL+YbL7IAK/irnhB+rLur+FIYa2Z+P208MaifRSSrOBMf7cSNSdJWbkY
 bwEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWslEu2/bbI4jpPsqjIeDJcH2fVJkj2YGZDIucTsY9MgdVmy6ePkaHEv/zvb8e52XyUX4bAth153gc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWikR7ytdq8rTBeTVSabWOxZ+GyvwO27zDQ3KQgy1mNDmTe5k9
 3BLE87gnXtt7sHepNAdQR95W1dW1ghwMyqBfoSEJU3oMqX4HyM5e31f/jKiw26M=
X-Gm-Gg: ASbGncsT1aEPZH3ERmEVV5g1OEpL8KiwauzV2qDfVavdO5Yjbl26lbe1PtjaeqWLhkv
 6EASOKJdB88JCiFKlPR5gx6+zuwnm5iq7GR6f269ddNwVzFxJVTaPoQGj8mz95eSZpSf0+3xJ6T
 464OJUfm7QV+Uwpl4QWa3ZncW2bvRE7jFmsuXgjh+Sho7IW9YIqnFHw8vMRVjUOg7Zer9RiaSjV
 EacNxGKcOnMtgYN7q5TftUq9wH6EY43O7FaQlDSJ+rxnQp8HZzCEsvKKNZrdWG351P9you26jX+
 nW1ShmGorfYU7Ee8AZqmsVk7rYeMig==
X-Google-Smtp-Source: AGHT+IF1XEF/8Gyn2P+dzKuFrYGukbKDM9XOQg3PsZRAmJKFMQcRvEJoruUPypP/45RqggGEEbK2gw==
X-Received: by 2002:a2e:80ce:0:b0:2ff:a8e9:a64a with SMTP id
 38308e7fff4ca-2ffa8e9a6e6mr6070311fa.6.1732270134081; 
 Fri, 22 Nov 2024 02:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa4d58592sm2762491fa.68.2024.11.22.02.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:08:53 -0800 (PST)
Date: Fri, 22 Nov 2024 12:08:51 +0200
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
Subject: Re: [PATCH v3 6/9] drm/msm/dsi: Add dsi phy support for SM6150
Message-ID: <nwgfas7oxaumusdeoaheph6rj535szahfkfnbmv55y3nhhmf5p@3gg3ddjgaysr>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:49PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add phy configuration for SM6150
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
