Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8FA56044
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1374210EAD9;
	Fri,  7 Mar 2025 05:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cM8bqCmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B3B10EAD9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:48:46 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso16526171fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326525; x=1741931325; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZbBg036E5VQfq22pHnXrnX07SBhbwakhgnYEPNM1oo=;
 b=cM8bqCmhX/TaYiMFVU8LVRP4v1n9Pj+V1vKL9dXARt17lE3rlFXWrV9CoYU3HPGo0t
 04N94z4B74XkyzV1abaqVRQMxbzaaUbfdb3LQ2kZiSajhUDpktDLSzzKd0uvM9s3xPui
 sGRJvVz1x9Xh/yaSdCXj6GnGjDqhZrg8YqqJWnIPBb3vwhEgsxVrenQ0nlfWrIV+Juuw
 cg6g8qb3wQV89+3dQrjw7M9zeveAmeMV0GRYbm3hDoJUdVxOLHsP0BA6tuM6zSxDeHZN
 cOeka2nOiWopPp2vYtcjpp/ixhtbO6Sw2q+8VNdKZv4U3x6U+Gla2b9wtxcMnq+X8yTd
 k4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326525; x=1741931325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZbBg036E5VQfq22pHnXrnX07SBhbwakhgnYEPNM1oo=;
 b=XEmeViCL5TIDhSF+ZXuKc/gufQH/gMmvceTFy1M9qHHQs9BwtuC0j/qkoOD7jG9NIX
 Lz8qmycKnPxnwkM4gJ0pUO5ATlQBKhzsG3UeKJ5BocF0LeBduQRPjb7XecWY2LHkpUjz
 hloRIDJ275b89d8irLH1NRkSVuiD5Lr/eBNbCApo+TVtqwhenIn70TQu3cNV1Wgxr8mx
 gfpzWCXPnOp/I3cuvnr03hcC6+VtozIo6On8h2u2LfLH/EE9HTLx1Vpnul1QMI/ffK3y
 jucocY2nGt27ulNvgyAKzKi55JgNePmvbO2S6gZTYCGE9AQ7nBl2QK2WEuPy/3kaguoM
 pAmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ3y+KtxmB57AHHAKJyVBhrOHnIAzDNRwSOfOyAelDTO65wEjZms07PJkiBzamQ0AzeEtHEBJkJww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzztFS6mgdM4YtjNc6OI0yzYwqfhw1i9mdd6+4IuziYEvelhOk5
 YJXo/cqpz/zb0Q4if/j1txbOppoedjI1550z/z6b39dJx53vZ8tkyj612fV9a0I=
X-Gm-Gg: ASbGnctK/G0XEVKHAH1a8DqyiUNBdR+MX0Vivmc8tmMcCgBfyJoLqIcoynLdld1pwjG
 HE+L/8WALSFT2wE8hwMKTPVw3V+2w0Z1d5esxKebb8287ytkU7deucaJIj3n8++vxQ7D+pyhlXB
 2aR8cwkGAto2pNj3uORWV64h0sGt2prjOU/CN+dgob5Vbo4EbkVvEmOjBHE1NA0AhtSS071pQsm
 UqtqYrxwHGw24dgmCDIojJpyo08WW6y50faSm4FDldUj1Z9wE7iU1c1FXrZyU6BUy842fZGpeYJ
 R/yNa/qO5tlniearUJaNIPDzn3KQq7rDWeLCyz9Mcz/eLVD0SirXqcxA73ObRQeRN0RcppNJ6F3
 KI1jVXlPn+mcKWGjIc6MqJkyb
X-Google-Smtp-Source: AGHT+IHcVDS5X+VsoNTfLbd5EGvMqQkC6bXB00OiXoktlobfZRVvgZG5xWYx/7vdkvXRicvu3Fer6Q==
X-Received: by 2002:a05:6512:12c3:b0:545:17d:f96b with SMTP id
 2adb3069b0e04-54990e5d38amr514102e87.14.1741326525147; 
 Thu, 06 Mar 2025 21:48:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ff85e23sm181305e87.225.2025.03.06.21.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:48:43 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 07/11] arm64: dts: qcom: qcs615: Rename AOSS_QMP to
 power-management
Message-ID: <f5xqdwj7v4zpwlpkshfnofth6u5pyu4tkzlmr23laspv7q3wmx@ebsugcqok66a>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:19PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c300000: '#power-domain-cells' is a required property
> 
> Fixes: 0775021783b5 ("arm64: dts: qcom: qcs615: add AOSS_QMP node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
