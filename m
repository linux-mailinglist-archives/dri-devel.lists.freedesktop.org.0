Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB678A8FAF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594010F95A;
	Wed, 17 Apr 2024 23:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w8M0ux+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A6110F95A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:49:32 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so5585551fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397770; x=1714002570; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IDyTmfUTB48zbrRJ3Ex/J4eaqhXRSOEtnoHY2dxsblE=;
 b=w8M0ux+6RjkF4q29Mu92meEaMqqCDfgViWSWZg6icYQA7/b6vYm8qSJMUVi7FpZq4X
 0vfv91kkvluHDZ7MxWR9mt20foU9IYOWqnTsRJqb7eNnCZjwvOp76w3ZsJ0yh4nKvGZ7
 Xag0sHqvIqCGf4pW66Eq7pKan2WOOMiAYkxkZoyD2Rh3HmTUta7YGGanqDaWBCDlTeOZ
 miwqFYawar2e1dYTkQ6Bh44ZmbxRhSWypb6aRLwkof78yGvcdAydJUKwdnGNpGBIp6r7
 jsPWPD5ufDSOzygp1w4YiKwAtOlBEVTgFzW8x8HqQsBKff8D05bejSjE7PnEHgcmYs6M
 K8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397770; x=1714002570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDyTmfUTB48zbrRJ3Ex/J4eaqhXRSOEtnoHY2dxsblE=;
 b=YAUOjw+urb0bvqyvq45BUSFYNYMX+gLE2djdYu/gRL8lOLM19zMGSE+Mj+MsRl0eq4
 a1ipoyw94IO10vhfWzSdqb0ClzyaOfCqWFCUiqMEHWuThnsxccXwmBtKxPR0WfMZXam/
 7vBqZesvnvzKHUuDj1Rv5NnoH2Tlmf5v50FixD/udRg2J3fG4n0ijps+RKiIGS6ohRGZ
 Y6wqTgbJzb6WrpJ2OAQRaW7KtDTxWiu1sQ03bJXV5xNSJ3wpxnSeuCrXAiYIZ6mxKxGh
 2pUcXzuV2TgWx0VZcC2RuH8RQ2jhMP4V+zmZX7+WV0NwczNA52zPDbW4gVpO8BB3Her/
 aNkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT7uJ1h5Z2GitvZ3HBVJ6YXfItuR+uYQJ1soPQHd9KzKdY9dhid03FMC37bjF48sYmnsFVOI1aZtqa51rkP5c7kUa6QJRZkuVgsQXLUbt1
X-Gm-Message-State: AOJu0Yyw/sljJSKm3GdpzRJ/PVASzO7eZCUQwIvCghQrTow/OiV1Qu6y
 LVgLrouAmJWzJrumCJ8jFpJw/wTf8hHVKTPaOIzqGgCk9U07KxkmUH2r6C28gWQ=
X-Google-Smtp-Source: AGHT+IH/MUOBgyPCemAoyY2nfZkjc3UXoMr2/x45ATSbPEjenP4BTGIPiOlkgeZVrWhJMW0EEXYW4w==
X-Received: by 2002:a05:651c:50c:b0:2d4:6893:24e1 with SMTP id
 o12-20020a05651c050c00b002d4689324e1mr536858ljp.50.1713397770075; 
 Wed, 17 Apr 2024 16:49:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a2ea555000000b002d70a040f21sm35241ljn.91.2024.04.17.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:49:29 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:49:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
Message-ID: <hykql6t7xy5uajvnzbslagrki6xvg3mjuba5hpjha36ue5ra76@4s3m2vsbxjav>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:59PM +0200, Konrad Dybcio wrote:
> Add the speedbin masks to ensure only the desired OPPs are available on
> chips of a given bin.
> 
> Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
