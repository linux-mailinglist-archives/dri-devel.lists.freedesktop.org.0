Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1515A38BCF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EBE10E1A6;
	Mon, 17 Feb 2025 19:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r9ClpqaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229110E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:00:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso5038968e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818845; x=1740423645; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
 b=r9ClpqaWijJX2tFuQ4MwU4XWzXFaSHa3CEjJEQl1zq5X1m0tcZX0gvddL1AKtcovca
 bs1TPypgIIaDB+fC0nw8gWBLSnEoKlMlUkJTEdcgM04EP0vHlLheawLQRsrPoOtHNXl+
 uKAquKPFQBUxlMnPoZiKIg4yOw2+wIat0GqzQbsNMwZQza4hhvvbbBKGE7NozFKCs85G
 d3bh3XHqrXvHCjdrGeWrEJt58wNM3X7OU18N90HCXCRSAcmftlOvMGgt/nd2s5xEHVIC
 NWyVk9E753JZSqt7p6OpwcZEo5EmTWWhFoPAY1RfkvMfrB4g6ywPsaV5R2tbjHUIIAiF
 t1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818845; x=1740423645;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
 b=gxm8vYbegcW93XJvmk5ICFXlYB+EBzULpgBKhTR7Q1hCEOchYRTVMYFFlKrDxfzYds
 86RXTPVsYK65jXzWtSu2NepHe0AW8ZdVHSHYRgoQn+gbOJmb5MIWRgWGwVlATLtHfsff
 smHeO8+aBeiQtruNGU9laOSo+WKvbScObAPGfwTpd5RS2ath5b4fQCFe+vU4U2Nl2Ee7
 E2eb1GHaC8ZGnLlSxxNBcQFywHSFAvuv7JQ2Dai5KSD1Dc1JjmDLZ1QrqnX5T7ilsRYf
 AJ4tK54OOVRzBrShWq2NMz6KsPNwKK81WW/rn7qVWimTr0EZTyRP/acqkmvHCs6VgqN6
 dBDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP+fwdrqO0i5Yv2epjsQZFeUNgOCjJb2MI+e4v0nIAIg1pGEvShVFz+vCzf/6yrhljPW942x2JbuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUnGCrhfL5fprNaX9TdsPatlO/OTbKIuJSvgCU34Zb+S+giuCr
 ZmnyOC4nXyRt9MC2ay78mdY80u3d/wbcX8ziPvgQugF0IPqmpdfp4EieSzXX8Ss=
X-Gm-Gg: ASbGncvPu7zba1ldyNFASFf7iayh3HXdoII2wZoS33TGWPdi440HEpjgLqw98YDEVRf
 Fe65oyoZfUFgEV7YQyUeexBELqftFgPQGb0rHnEVK287PTkmaFG5VzkeEm5y1Qbt+l/+z0bvy0T
 F3UjkbONQtAxly4xqy6VYxL1aEgAAra/bHOZX2uTvZuioWNcvzSapqGpS5VIrOlOJ6hbvT8o73+
 5IYb7UffqJi4FwD5/oN7K+vHU2sI2r5VZz18/9vSCmpuQyk0H3KNdvoleXTwU2XRhLzXHqCcvQe
 LYg7SZAhOXAVwoEHNCneC4V0hZ+6lbLnsmoy7cysZ+kgg4s04bHmiU5NgQB2T4C/C/uc8cs=
X-Google-Smtp-Source: AGHT+IEslo4JCXXW70CatTE3GyUrVciwejCa+A19BXKrlebG5EgoNg1Rdkp6bulWdiqf9EJHhBrftQ==
X-Received: by 2002:a05:6512:3990:b0:545:746:f36a with SMTP id
 2adb3069b0e04-5452fe90480mr4199200e87.34.1739818845416; 
 Mon, 17 Feb 2025 11:00:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531d76843sm923155e87.84.2025.02.17.11.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:00:44 -0800 (PST)
Date: Mon, 17 Feb 2025 21:00:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Message-ID: <eetx7fuv2vearihvpu3mvfaokmfihiq2plstyhkblh5hklspz4@p7fslha5nong>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:30PM +0100, Krzysztof Kozlowski wrote:
> Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
> MERGE_3D blocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
