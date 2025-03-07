Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF632A5605A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D67A10EADB;
	Fri,  7 Mar 2025 05:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BTZC1037";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970AB10EADB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:50:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2249573e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326640; x=1741931440; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
 b=BTZC1037iPWdNFkQDwuFojxFcpApWneU844dw2Dowc13kFRC3+gx0PfTSnaQZTxgX1
 Z9CU03kUHcGJ6/7R86noATmUNUFjHkfAjtyfCWX6b2ghD82lV2ukXJP9cYxeCCZAe6cy
 1BY4Xevr4/TYZr5F7HAsIUn3ghhTnuNIqK8YKocrA+Y8I7X3/SsukFxK9GxoLcbEHFi2
 Tdj4mII8rhlDnBqCd3kW2AtVWwfpUrl9ssVdA6OqFoGVY/Kg895OG7Jf1OzH8wd20jYE
 wbt6wM73WwqND/AwYUy2gsrYftpZNA7HNNkeaU4zdplUdVheJCahWYKruAktOG/QmHyV
 CKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326640; x=1741931440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
 b=umoqyCtwfiZQQR+Lm1B+MM+uLQUrc7yhzrmmUocndKtt8uHxPt0ENZcrhU316gc2YB
 uqy0As40UzCyE3mMJbp2vBgJT5Bhi0x0xVflv56WJbc7wbPDKKpcQkl0NFUUHKU47/hg
 4by+ilUxSmcJYTVGQbY2q/Dy/t4MV9A/Td+GnGBCgLI9Bs5p8A8LcAN1rBubgUUFH8Qa
 FyAxD097MyzTJ3Ynw+6EKABGG9emAx5up9jkhrB/1dEBDjrVCrbRWmuKJFHkno7axVIM
 u58/YrbgLJI3g47EnKfMzodfsGB9VMLobgP0d++dP/gxjyhhgmE/8XDcn9nrEOPDAKK8
 yCwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAJ7EDR6Q/SazcgJdRYWU8J2Boj1BApaQ/e59doIIhHyq+OO/hbdMq29K+AdoBc67qP8l3nVELNj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHLeOmjzEBnjwPPn35vxle4PkDLraGXVhW+miKvCbZNUIAspJE
 CTzmHKx8ERNlR1MV0bADfhsOK5SzWNkuPvpprY8Zfm3InDWp4lZ2pOntERikS9g=
X-Gm-Gg: ASbGnctnkpbZfriZ3W/FD4jb2scw/DtlQQBDlCw7Oz050nzsQkwvYlINsOn1zXrnSOv
 P47P7QJGBdCB4rYlBo/iStPtR1AtwldzRYv5jeknsZBS0N4K0/002+shadRExwEp6mM7RvRT//u
 Kr7TecJxLwdkXs4htjMa2qxTlgT/s6RCVbuPG1l2TLOBi78iSwb8SwnuUEr+CUfaqzW7pLsWxSH
 RW5+QS20iI3UEbs5kqCFTZTJrgzT2Rh3h6cy7ETbT5nzYLpv7/4OqzKLmSPMC5IpTtA0ja+Hb3t
 B9YlFJrYTb8X/fvBjC2AEmpSJfdrJEegte7D+/ja7gB+Sue10+au/l2zxvkRsOMmN+XI8uykZrZ
 C9ryWzRTuJdRw8T2zb7fhxweT
X-Google-Smtp-Source: AGHT+IFxMJzgkc6aT8SLqY3HFH44f3uS0Pbx7E1LtfSoww8PpYJPAwYDmAvb6be7iccEdwfO0MQmLQ==
X-Received: by 2002:a05:6512:12c3:b0:549:8cc9:67b3 with SMTP id
 2adb3069b0e04-549910b5d9fmr492625e87.42.1741326639884; 
 Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1bc56asm382830e87.183.2025.03.06.21.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Date: Fri, 7 Mar 2025 07:50:37 +0200
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
Subject: Re: [PATCH 11/11] arm64: dts: qcom: x1e001de-devkit: Drop
 clock-names from PS8830
Message-ID: <ec272btbpxlewp2qiz42c7c77gpg476wdzx23dpv7fqoe2v5fj@53vu6jgpa7xc>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:23PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
