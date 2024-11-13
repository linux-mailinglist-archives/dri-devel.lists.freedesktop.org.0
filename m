Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97329C6EB4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4B10E6E0;
	Wed, 13 Nov 2024 12:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IxUquB8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407E10E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 12:09:54 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e35e9e993f9so1311243276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731499794; x=1732104594; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
 b=IxUquB8uiQhA6cPrjgWi6O1XkYYQXgxQN7GWJdZaxr8TFZ0K7t9XCF9R/Gi0Ljuf/9
 B2AjsnIA+LzIEu+Ho5Ubpt5dfuWM/K25taEqy+Kn9FQg2zW2cJM1cBelZHOyMtDgSg1D
 +bk6vQbyHH45VGgPVJCe8XXBFgX/MvqNlxk9f3SAezHlOTPt0PJIwASNXqifCnIMQBHm
 T+2w8pbMAvHUgvu2DoPcF5vo8ruoGZ/UKkQksbiUJCx7h2++Bd3JE7aY5bEHLNpRg9HB
 DDl1JhgA8v+DQLAnuiHuxoc5MskhNr23Oh3X9lVY9nWvfHhloYsoAV1lx/gwh8qJJBHe
 6xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731499794; x=1732104594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
 b=BRx6g1PLVZV1wKaPkvOJFNCQ8dv1F9gXDe0K5gU0jCtnodBP2gWh2u08OYOTlFPDBD
 SjVdoKl5vKMfMIgpZoV7Wg0ZTd44Cl3hpAtsQEt/VJ76t0pD9FlxvOI3xCTo/TbxVq+e
 T2SotYknNHaz5IRCmg1vZIXqR0sOsb43RbKt82uh0GcD9+bRA2gGUh559Un/GjgdCHJl
 fqpYa5CXcAIz6RqS/KWlNu59uMxppTg2o2odQBP2sRCybROIKEVHGDpwWMC2MMty49ij
 x7Iy/TtrNlUixUmimOEPE3GWF6Sd9dB57Rvp7dXrXYyJZJuRC9rAygrh4eK66B5l6fEn
 yFyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRqISEvGUjIsi/xJ6sBJS5qKh5eDXnbUjC5bFkWddHXDGBRewq4x7yR90Nt9o/T3F1bWcQVpaG6EM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7jur3ElLfeD7j0R7qF9wJ4FfbVq2ZrnI5Vz6cLdpzIvOFvAcb
 CcpCbm43cWob0t2/JP14IvDC33EupqUApSLP1s9DGB3MVrNeCRBQ7HuH7X2YeEGRmPrLLiSYQN8
 7T2I5qxG1ZPLeFzGSXdBLfQ7BEIHlP4wioMM7/w==
X-Google-Smtp-Source: AGHT+IEbVbENHDimLrclLq81k2K+eV3PjRDffS3YjYrYwNAjJe5acWC3fJAW8eAeTcDDEGpWp1iOm9mjfIL5BjU6U0s=
X-Received: by 2002:a05:6902:848:b0:e30:d4e4:b9ea with SMTP id
 3f1490d57ef6-e33a1f73693mr11483612276.28.1731499793667; Wed, 13 Nov 2024
 04:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:09:42 +0200
Message-ID: <CAA8EJpp2MyXZ28GQV3GDgQp9uCbr4devi++nzkeHA1fk6UZXxw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/dpu: Add QCS615 support
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add definitions for the display hardware
> used on the Qualcomm QCS615 platform.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
>

This patch completely ignored some bits of the review done for v1.
Please take a step back, check what you have missed, respond to those
comments, etc.

-- 
With best wishes
Dmitry
