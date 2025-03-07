Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067BAA56049
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8510EADA;
	Fri,  7 Mar 2025 05:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gtX6yhjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC64A10EAD7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:49:03 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30615661f98so14774961fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326542; x=1741931342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
 b=gtX6yhjgWhZMYMNGSSsNsFFP6h+FLbwj+qenTvI7EbBKFmUqV+fWdBtX9a9BzWIuor
 3/n3pafg9M2YIwVCw1LdlggGYbsBNa7trBKoFz0rpFNMFvwi0br8PXCh5PaZplteWTAr
 UGFLzTK/BYGhVBo+I9mKfn4xAJxyhmfDJL9atC05CphznEe+Sb3pPasj4gp6tGwRGXkN
 PpELp/dG6iIQ+JyqFwMYWN4cQkfaUqbvLIlmHEN/JrH4Xz5ogdJjQ3mOun6MZhRjrF1R
 ONuHQdbrkeZfeH3McF8S65H8ggQYClt//w0Em5jDCtPZB19oSrTAkRIpVdTdaCW5wiCC
 Knig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326542; x=1741931342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
 b=Skp2Sg2AHMbLYQombHPUUc8OfD+IRmBUqrvtYA2h1hbqEnKwdOlOz4JSwWfp6uRoOl
 qq9KG0GdRwCSdz2NIH5viqN0vnSNZdc7H3sWdovC7u2qrUf499y7W/CWISv51W0CxYaQ
 /Soe/psltc8rCI/6B84wBfgiyBf6Q1zJ7jA6oSXCMmUxulMTLsG/Mhtgz8G0bgWK05ST
 Dpv5TVpSX+f9FFQ+FvDw9kpsz19DNIOq1XC7TzivYxMo32QtEOocmC67LiAV0yLCzwNt
 /rJTSY60NrNg/TRRvOdElDkUdN45a9WUXLhxv2gIXgb9n/PCZx2oF/LIBZXhBwhuOQD0
 TznA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuIlAxz9PyQQHnFOIl2hiPcqUwqScW8CoP/+DZpHFZjXf2GFIFk/RIqigqYvhdQm5xUygMyaCtpM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDWmvhSRkViPZXIRN0HA+rdZ5fMRSMaN/Gdp0yfT9dsTzbqkMo
 Arpn3PPDJqB3sTdd0DD+b2oB7CQflxsiGmFKo8NIGh4RJ6cm/lG1X5kWv2+cc/Y=
X-Gm-Gg: ASbGncsPCLKC8Ygf4/iyHWOxqPA2GUzDyhclU+pQJQzPfdErEgvmA3Rn8DOnwdAyZPn
 io17C5sIil596/SKFzRbUSXNzbQ1I8t1N0vXHSek2j7Rincv4h/L7TIjPH+yKbSFV5fxAj6GNSq
 q8TrzBaVmWlrzEWH0flXMWKnZ05sbFhedi25cgQ+rAmqlClurPAKF1Dy82uUFhjJsBe3Org8ubQ
 ljRL0i/m/JXX7C+z0B1RhV9irg5pyqU9XQ6oDKwSBZej60H/g+D24sG58RlH82SqeGYO+sOTrLV
 BOQUFCGDBYrDng1ul82nQpPewSWgot9ghTRXQUrHP5u3YGbgyl3yNw5ZzNdcEHpQybeUmDkqD4c
 N82i1bBXdZ3t1z7i37bdwh2qK
X-Google-Smtp-Source: AGHT+IEQXgwPTN0zWE14o/eWd+esiKQ+JOKkgZz1V9e0jKN/Xjh/s0kS262qvqbdXkWzD17f+19+eQ==
X-Received: by 2002:a2e:b88b:0:b0:30b:cceb:1e9a with SMTP id
 38308e7fff4ca-30bf451104amr5734371fa.14.1741326541966; 
 Thu, 06 Mar 2025 21:49:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98ec3f5sm4209511fa.28.2025.03.06.21.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:49:00 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:58 +0200
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
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to
 power-management
Message-ID: <6fqpulpczqnzabdnpckd2rtrcdhxryydhkuou7vdhmsftquckt@wzuoxvhyep5d>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c310000: '#power-domain-cells' is a required property
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
