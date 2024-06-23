Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B9913E7A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853B610E31C;
	Sun, 23 Jun 2024 21:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eb+99jeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2512610E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:23:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so4257178e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719177824; x=1719782624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jVqPPOYq/l25Fj/g6B1LeAJoOYkFmgg6jrPDZkmyB8I=;
 b=Eb+99jeqtnrVJ1lLU9VnVtRbhvZBOO1tx8EnX6MNpCVSG4Wihivf2QwdLsjoCytpWl
 SDeG/VFTTHp9OxWUffrr+tfiRngd5KY2CZgvEKvwfOUgOeLur05/0qhbKS5K0gKbz+N8
 GdLwD7K67ZOSr5FVZBE4PxyNClPl90lXrrgqEa8y4kpG0tNYxq224rsh9H6oqWaxI4SF
 dXlLMRc6VjpU8HVm/2DATw33UrRTgXWm/aA33JzJZ7D634JGqq/jsys0BWhlO4YtpE+F
 FFSTQx3E4QszFNu72SVnuH3H9fSb/D3nQoYF57zF/awYFaxC/qwmQW1s2tMeQfFyiJZk
 tKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719177824; x=1719782624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVqPPOYq/l25Fj/g6B1LeAJoOYkFmgg6jrPDZkmyB8I=;
 b=iCWxcjb1oCYgj8iv3uRhnrv5XFVP/p1Vm8ugS/TEUIGEAEwLw2fDMQ2qsGRA2pV8bk
 ciW8O8G6zUIRxv8zG4dg9mZNLQiFpC+dU+Y/xUSXwDHBKrxTqXNcu9x9AGj+K9T3BC+o
 PiuzYO44fjLOj/VRwHrPLFQCLkAhcPn8mlUec9Me2lezaPr8XnDauhsvYiTkImkpcGKA
 ZxqL+aQMEfAB+RvdmdayuyDjJJ1TFUnO0Pm4UsqN69Ik9OCY8KRfnJ6S3TJWwBV7DFdS
 RtFVPihYoM+3BnzrRGfzvjZoqcvI6rzNw2Hu+8uO+13/DTFItA8F67mCajmNtCkhPjQb
 2x6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuBy32vHjZNbQaHOsGEEZgdG/tB2F/lV9wH5DeCGaDo/PQ656QWslLXLqm4amwgzuMnbPq0TUFSyy7HtTWrT1jQOns6qFc8KkumdA8wnmR
X-Gm-Message-State: AOJu0YwdM2ZK7rIQxNQnRW2x55hA1f/vkVJ744c15Qe3yjhc85GS4GJn
 GOi35OczTSpLiU0eKNPuSvJmt3JXHgGASGlXeYVLPhJtY+V26f52uaFkfjsFs1o=
X-Google-Smtp-Source: AGHT+IFhS87TfxpvmZ1+wkQPSgcCq7a9bj2sbGnuntdnh8f2/UxXXs198UOXsp3whu7KPM/2ddEfLw==
X-Received: by 2002:a05:6512:31d2:b0:52c:e3bd:c708 with SMTP id
 2adb3069b0e04-52ce3bdc757mr1719307e87.10.1719177824001; 
 Sun, 23 Jun 2024 14:23:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdec145f9sm494773e87.182.2024.06.23.14.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:23:43 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:23:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <ionw2k6rz5eokroilrluq2nvh7uap4oans62z66o7fydray7l5@a52bkrf2plkb>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623110753.141400-4-quic_akhilpo@quicinc.com>
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

On Sun, Jun 23, 2024 at 04:36:30PM GMT, Akhil P Oommen wrote:
> Add the necessary dt nodes for gpu support in X1E80100.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 195 +++++++++++++++++++++++++
>  1 file changed, 195 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5f90a0b3c016..3e887286bab4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>


> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d50000 0x0 0x10000>,
> +			      <0x0 0x03d6a000 0x0 0x35000>,
> +			      <0x0 0x0b280000 0x0 0x10000>;
> +			reg-names =  "rscc", "gmu", "gmu_pdc";

Ther @address should match the first resource defined for a device.

> +
-- 
With best wishes
Dmitry
