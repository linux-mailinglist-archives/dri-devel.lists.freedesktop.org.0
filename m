Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369FA5606A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9A10EADE;
	Fri,  7 Mar 2025 05:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nMjQgzhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99C210EAE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:52:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54943bb8006so1640952e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326729; x=1741931529; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
 b=nMjQgzhUmc8DESceOocdmrybQboezm0JT0hcLBq6WNiAjxc0gNfXHAyzpov7mXo8F+
 p2XSX3ncfBvmeoFuawtyGh2525hNoMSfh029pvdYU0C5didNAakNL6xp+kM4LRgbtPo9
 NM/fP3LDGchMnZYD0KKeNje34LRXKuYo6H6psFwqQRwrpn7eFlSku2eRVHGXP7El8Gzk
 gx0R/t7cn5LBagnOxKjTrz9zqEpLBWqTeti2ZEUqT+0Ra7PX4P8NXiBI675GRud/N/r9
 b3U0W+Wp7VvfUEOpI1mLEEOCO1mRH4o5qik/5T5UAXC1XByJBQEeq5YzXaJfl/YG6apl
 TZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326729; x=1741931529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
 b=D5dZ2Bb6L9jsh6F4Rc2Fb3qlaqVQ9daQA3M66Y6UVKxBboKKgZ59wZUaLJOPYzz4DW
 d1L73Xt/rP1PZhSOYA9kizivfi23ZGs4UgoEv8q2JLEEt2sK1eKwizKxHRP8+f55khTK
 VlLZYl337pN/mDU3Nh2DywfDmrUUvB/pd4y+/EHAFoNy6RDG7sbL1WRcQ/o01AJR8DuK
 Pt22OgAwGHZZaeMgGbEwKK9FW4soQa5NixNpF1+cOC3ZOINmacaqMx1tzHkaIeOk8nuW
 35Tqd2BJMVtj840NTsL8XWcwB8BkPQB0qAJGXM/D9c0boI679wQSs+vnI2la9Y4bJUIF
 OFeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUClapp2/O9pwbeANd6gyEKdvtPZFiOYPntVGrtRDMevqxSdnlw1Ec/eQ9dqIZ+ibh4UF9iQ2c4/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMZnk8vc+jBU1CN6pF/t5b2IGWu8kzXckBGJyzhp/XCXjr8zIA
 MGueo4tR7+FfGTmQRu7pkYJ0h5vOBFWlQDUQKoQsdllFjVLRjo8wZYwKIRhHCmI=
X-Gm-Gg: ASbGncv09jCV7To2JpNL3ER3/c2yW6hL444YQH1usJv/ni34OzuQHD1h6ClM52PJu33
 hRu6eirIl10R9/Nkji/CLYBt178X48XWp0eC+oG2+M9r+xy2VWON6xSLbKQAbasXHH+Yvb0c32I
 aF3E1l3lRVMtAUGHH5YE+FerEYptovlJB8ivVkDOabSqW/RukwTZm+guPsNJAHARK+w0eBeNUS1
 omv0smIkhwsbd5bPiVOhmbzxHaGPl32ZlUCD2kaD+wVFl0aSYpx37M/6guJyqJGgqW4qAY3G8in
 EIV/9WcnDrZAWAC34lcJS+v0w115XZYnxIVjYE85icOyT5nfo2vmAv0aVsW6uy0K9bMfH0VD5oN
 d/lAWHTRD2RVokRJJuRABLSeM
X-Google-Smtp-Source: AGHT+IHunk8+MpzZDHTJkBgYb12y6m7jhuOmcjA3ogw1gP8DkwdgKWszNP4J5Id48vGNdylVuIQYaw==
X-Received: by 2002:a05:6512:2342:b0:549:4de9:22df with SMTP id
 2adb3069b0e04-54990da2057mr687182e87.0.1741326729036; 
 Thu, 06 Mar 2025 21:52:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45f8dsm384613e87.34.2025.03.06.21.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:52:07 -0800 (PST)
Date: Fri, 7 Mar 2025 07:52:05 +0200
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
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <nolgnvhb4ipmt64bhy3swibrjb5cxncz7nwk56osn7bkbrsy2b@6ntbn5pk22gf>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> whom this binding document was created). Add a new compatible for it.

Ok, I should have read dt-bindigns before sending a comment. But this
commit doesn't explain, why do you need an extra compat string.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> @@ -18,7 +18,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,kpss-acc-v2
> +    enum:
> +      - qcom,msm8916-kpss-acc
> +      - qcom,kpss-acc-v2
>  
>    reg:
>      items:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
