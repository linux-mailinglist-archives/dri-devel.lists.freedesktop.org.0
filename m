Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3359DA900
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713D110EAD9;
	Wed, 27 Nov 2024 13:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gRQK3gvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DFA10E283
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 13:49:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53de84e4005so2963098e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715374; x=1733320174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
 b=gRQK3gvJnM8sYhCCl/W01/kHyvzIUa2Me/9I4DfXs6+ALkfx2+EnX4MeJEvGokiEV6
 2KN61HEZ63D1kC66zzMSglhRxrt50BySwwcoZf+7WF+ZUDTIksQ07pPiv3rdAtoQFFjX
 IBPqzIUxu9m4VUoDirmHEXpMR3z9CnvkZ6Rg9CdDaVON9devgi79hj5olrmzi/791wkz
 3Hq/yWQUDKNKkD35znhfmE3ZXZ7rXUJPfbjuML1/fxCe/Q32XRLg4vu0AbGaVDQvwQL3
 YVwxioYBYxLGBkBC3MwLifSqHbq8/QRsyNmffZdLiL5ZueO350dx5H9kxGGMq2onrN6x
 lugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715374; x=1733320174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
 b=mc1UqvxfVHiz+uq7ddBW/ww975c+HD1ovHYgP5JxqJ+/HO2ZTwQ5FoKvmznHMaP/sw
 J/Q7jlcGRkUepeTr3htPc1NVjlvVxEvRVtK6psh8Kled4LL0eIoGzJUpnAfsoMorp+9y
 ormSrNgT1ve8V6oAhrTxQxBxYc56N2jCqJULBz8SU31vRLMo6EEp9scGxJ908V2M1HtR
 6PgjE9AHocbkQohApuFUDTr1yK9VV50k5YmGBTetFQrZ84A8dh0FG1bV21ibgaoSdH8g
 ULo/geXwwqcT/QkTLJ4Z5kuHRIyzRGTLaTEMK67QQtdXI1diMuAVbpke5TWZzfV8SjkF
 yMNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnmhYwTLiAmz2KS6gLZzMcl/O71lpiiEqv8wMs9xOKxJw1gwMx3mMX3AjoinbD3tBzZemnV+R7Wck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw1WwXpJO+jlSdLb4QtD4ZCta6jFjpVdLMER+7ZtsxToMBhmtu
 Yf9pPJenu8WlFmmnZjruiwSsZEdSKo6kh47Hk9Eq7L15k+0vAdv9T79Uv59il+Tyu6Nq0dIqeIq
 W
X-Gm-Gg: ASbGncsmHF96Ovk7ClZ3OzzIwJY9i5xyCfxAEWhO0pCnjGBG0Ow61dIQ8lS5dNWRW7X
 4fw0YcvYl7VzGKoq/pAvecGqoDP2uQgy0VozliVJ/Nvb0rvPcThfRiRvTrNE/4xFX8q1i+Tg3gM
 2Sd9Z8XD+sSAUSXmDP5FLV6RgaofD96WPqbd/CI0touq1Sk5VVoXxKsWmhUI9R085ygjaGHL4Nz
 LArH14uDTsxaIC2gbPz+wwMb2QkbkOOWqybk+qGhh4IaWoJUqhtCmH/7uZRZnitTvCqZJbA5mxp
 /AvV2R4GChqxRxVJElDkpAIC2FSIlA==
X-Google-Smtp-Source: AGHT+IFxQkhy+KuEro7ZMNIqjxBcDKQk66j1eoYtbfEaE+Xo2Ghx/5z0Ju7Gw0TpK1R+/8bJQWa42w==
X-Received: by 2002:a05:6512:4012:b0:539:f7ba:c982 with SMTP id
 2adb3069b0e04-53df00de5aamr1541730e87.33.1732715373671; 
 Wed, 27 Nov 2024 05:49:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53de0c3ce8bsm1323963e87.116.2024.11.27.05.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:49:32 -0800 (PST)
Date: Wed, 27 Nov 2024 15:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
Message-ID: <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
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

On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
> Add definitions for the display hardware used on the
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 488 insertions(+)
> 
> 

NAK, there is no need for this.


-- 
With best wishes
Dmitry
