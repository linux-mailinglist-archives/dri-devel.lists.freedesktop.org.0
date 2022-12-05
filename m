Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1B642D5A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1B910E259;
	Mon,  5 Dec 2022 16:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081E10E259
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:44:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d6so19473270lfs.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lskTxKH+t6SUryPNvJXQQ0pZb/SpXRtbjFLLir4Ar4M=;
 b=LrR7ogg+ecgNfv1NCRwIL0j22WGHuhcG25cwmQFRPBpxTt7GT1X8BSFy4xxV/STO12
 7lMN1Dtzoec/2ZTkSMvM+r6L/dsboolQ62y4E5R+bYicqEwqeAXJLfaLMh7D66QIiBoI
 YDWOY9V0fdyYFUFwPWkgZOsn+4q1trEEVM5Ee4VFOhF1wpF6w40KriZxX7zMOyOD1680
 7s/9l78J9AJQBOuDcs2T/OKoO8SkLYzW79dX7J4/3uyu1k7Ot8D5MBmgL0Guv4xNkus/
 +HwStbmSSY97hppUcr7wXWbQPdcJVxGKpF+YtRt/o5LIEiaqtxUPUgWhMjQUnmU+wl3h
 kU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lskTxKH+t6SUryPNvJXQQ0pZb/SpXRtbjFLLir4Ar4M=;
 b=g/9ViVBgJJknnO8NoVvqaih7HB1QDedvVfs/IjvxlbIVL6xnmxAp6tOyBWpQOUqmFL
 ZsAn21hQJSLpG9KUE2LvDYXbvhxZW4ezDTZywl2ax20L24WlLrjULwfMa4zMIeZRdV/U
 j8myZovCWvLwsFFbeTWnPNOaS8DQKZE0JTQ4yUQgAmomNqD3+Zq/fNVJCkMBYAFMtRkK
 QLNSOrShuEqdPd+on+lHDWje/LNNFS+Cnn4tUHQY47ulJKr6ElHxRC6G5OC8oybVrh3K
 xlXEV45JA0AhMSC7FLspmvUd3wUr8zrC/yHh+1GFM8VDp4AQCtJjMZ84wU0Ky75zlvK6
 DCcQ==
X-Gm-Message-State: ANoB5pmkc3eFtWsI7MSNIRFLrd9M6ci8DahaY8NcSTT1A8QwwqyxtagC
 ptvZR66ksRfw7kco3lNMkE4JmQ==
X-Google-Smtp-Source: AA0mqf7aaa+iyHbN5guJ5DZaq0bWlf+dyX+2CkS4vLp8/0MczFDO+EraDsfZeovoeMOqgX49Tf8E6g==
X-Received: by 2002:a05:6512:2382:b0:4a2:70de:3546 with SMTP id
 c2-20020a056512238200b004a270de3546mr21326771lfv.420.1670258685066; 
 Mon, 05 Dec 2022 08:44:45 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b00499b27a329esm1328342lfb.300.2022.12.05.08.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 08:44:44 -0800 (PST)
Message-ID: <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
Date: Mon, 5 Dec 2022 18:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk: Enable display &
 dsi nodes
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-11-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-11-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 05/12/2022 18:37, Robert Foss wrote:
> Enable the display subsystem and the dsi0 output for
> the sm8350-hdk board.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index e6deb08c6da0..39462c659c58 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -213,10 +213,32 @@ &cdsp {
>   	firmware-name = "qcom/sm8350/cdsp.mbn";
>   };
>   
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&dsi0 {

Bjorn suggested using mdss_dsi0 / mdss_dsi0_phy labels for DSI host and 
PHY, as it allows us to group them nicely. WDYT?

> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&dsi0_phy  {
> +	vdds-supply = <&vreg_l5b_0p88>;
> +	status = "okay";
> +};
> +
>   &gpi_dma1 {
>   	status = "okay";
>   };
>   
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>   &mpss {
>   	status = "okay";
>   	firmware-name = "qcom/sm8350/modem.mbn";

-- 
With best wishes
Dmitry

