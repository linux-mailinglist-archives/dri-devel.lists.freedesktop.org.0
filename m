Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B09466ED
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2024 04:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C610E03D;
	Sat,  3 Aug 2024 02:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPNeQmWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32610E03D;
 Sat,  3 Aug 2024 02:37:58 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6b7b28442f9so8229286d6.3; 
 Fri, 02 Aug 2024 19:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722652677; x=1723257477; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+tHm0XRKhcukZsBzcu2vuKzIiUg/x7QNB9tMmshFIF8=;
 b=DPNeQmWqFI+pwcraiDYLdmawvJvxe2bOWap1RT74gP2razYhB7tzubjyJtR1mrBlsn
 7HxHADrQXErGwPHBWXid31qnrhGJvCCCoJEqSYq26XfT/bEQ95Ae5OdWeDKU1qnmUqPZ
 tFPbX8B7tcOTD5ACxH2LAC0HT0QhtJvmVW9AToZWRNiK5kQ0LrKV2mxE1pI8gLX0e0DV
 l33Svugma61u7eHPa/+q6Ibx65pFa2e+rqyZ4/rnGxoTCOeEsWLoKE2s4APRC9MrrdpM
 H7gGycv8FBlLuIKuW0vuw+2ujrHZhcbdVrk+8wLQb9WvHOHZnmVXnS4M6TEjuesk547o
 NB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722652677; x=1723257477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tHm0XRKhcukZsBzcu2vuKzIiUg/x7QNB9tMmshFIF8=;
 b=hIZmogLZMvSZFXBfRHVxUACKzj0btTXFMGEFImCUBQxpOCD68hpNpydqPN4ZKtxsJu
 joSjIETuxx9CO8XPJyns1a32gejhnBEpXf9qHxprjONQCcB1toRzE/rDLmJ1zkpXdgmi
 M7Kod1Qk3l5l2XEW+bVj/t37bUh+TpreBN5Dn4lhwX1ShACUl7K8c9Ubvts8ChQRcOpF
 HXa86askECBhymUm2RcK0i1RO6AHk3b3dLZp87Ts2Ds8Ui8mQXZHMFyVfupUbB2IHsTZ
 iPB8lyhF9O4dekmJh98/kPXSxkzGzPkqd8JJ+EJVQaVXnAiGr8AbHCgokaKza+q4wIet
 fr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5OTDvLp/qDl9YYAuKuy0/gMc8JVgGgHQOsZ/O3HW5Os/sZ44T6ttobACfrjo+g/m8wOW8m2ZMpUzvVxS7P/NlsdxXv4ej9JFZfyjDHAyZiiHsC99evGawpJNajPTtxbm+DasrWNLw2VWEpoCTMQT2
X-Gm-Message-State: AOJu0YzaRojIGkv1g9U73T/8Ok2pTZ561liaEADRsWy6LJ47d1iSU+lf
 we7h70RKYaiqbactySIKd9nmandv2v/IjU6DioE8kUaGlIm+6zi1
X-Google-Smtp-Source: AGHT+IHeW0oCuAYUKqNSkpMpIeXd9TfeijaXWhrzLO4R4P+EqckTLZqUm5DHdUGJdI1qvA79KSWVFg==
X-Received: by 2002:a05:6214:4a02:b0:6b7:4398:594c with SMTP id
 6a1803df08f44-6bb9843efd0mr63557096d6.38.1722652676662; 
 Fri, 02 Aug 2024 19:37:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c765e4asm12355006d6.25.2024.08.02.19.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 19:37:56 -0700 (PDT)
Date: Fri, 2 Aug 2024 22:37:54 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Message-ID: <Zq2YAuxK5wRcNnve@radian>
References: <20240730013844.41951-6-mailingradian@gmail.com>
 <20240730013844.41951-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730013844.41951-9-mailingradian@gmail.com>
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

On Mon, Jul 29, 2024 at 09:38:48PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
> tree dependencies.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 187c6698835d..467006ab2bcb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[snip]

> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-780000000 {
> +					opp-hz = /bits/ 64 <780000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0x8>;
> +				};
> +
> +				opp-750000000 {
> +					opp-hz = /bits/ 64 <750000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xc>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xc>;
> +				};
> +
> +				opp-565000000 {
> +					opp-hz = /bits/ 64 <565000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xe>;

The speed bins aren't entirely accurate. There is a single speed bin
that can reach exactly 504 MHz, but no higher, and one other speed bin
that can reach exactly 700 MHz. Let's add their exclusive OPPs.

> +				};
> +
> +				opp-430000000 {
> +					opp-hz = /bits/ 64 <430000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-355000000 {
> +					opp-hz = /bits/ 64 <355000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <6220000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-267000000 {
> +					opp-hz = /bits/ 64 <267000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <4068000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-180000000 {
> +					opp-hz = /bits/ 64 <180000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					opp-peak-kBps = <1804000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +			};
