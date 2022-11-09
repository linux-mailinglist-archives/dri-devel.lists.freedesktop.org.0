Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18A623374
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 20:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107B210E627;
	Wed,  9 Nov 2022 19:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9A010E626
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 19:27:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j16so27392820lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXJn3wRJvG74Ahsr/X+Onmc/VKFhlVPUovnUVOo53U4=;
 b=YbYvLSxSpYE+jt7vwxj7OVhLmXgAPOA/TY5Je8XqU9owlGQFKjDO3t/JmRNDnjxxLV
 H5L3GQJwuG/EOjwoT7lkMxIDqwPg3uQfnzHV+XfFQ5QPMbqmRZqO20kMCA+VmSNyCkvn
 BmspsC9tMAaWus3aLITiTU9yP/TCJ/qw7Zc4lAkmC/1cUHPCcaNMzdjtdJruAY10tpRm
 7Mz9g0NSrpqQejpQ0br+TUli0qY9eZ8z5/VwK2eu8HFqEWF9xgBKcvGrQD+yRMCcA4OX
 GhL+biyiE3/t5Y4wxA7OPX8wq/VCIwxtslhHCZgWu5spdi+iAB99DhVIyy57uQt47BR3
 dtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXJn3wRJvG74Ahsr/X+Onmc/VKFhlVPUovnUVOo53U4=;
 b=3pJ/ckvyt/9oPNsH8Yv7wR5dsTdY20CN4LPvsAVFlTNRegmoVYZpqqlL1/shl21Wgu
 N84Bj6X13kDRwWyX13VB5MpxxvvNXnoSl/9bayOevOVUFB8x2j34rVLn8KN+UlL8nKNz
 Sujfv9kMH/op/blKzo6jOD2K3vaoi+VVkZ+XLne9Witxuy7JbRWiBvx91lp9allSzxPf
 jt6mW9XJencXKsYZXj9Dz1TjFqoEwunnE0qTjw84aqEFxpay8RhSeYTHLMq9lWnD77zJ
 rJVfIsTBRU65fKt6buu/sVyNE+EHzIStN8qrDTf60h8jP8+LE7C0APLl+dxEYdAVb9YR
 gZ/w==
X-Gm-Message-State: ACrzQf2OfO4o/4/h+2w4h7uY9oCn5zKUV0Y/JRRcyyVPcglKkW7TLUHe
 VA1IAbGSVB9D8pQ0hH21Zcd2lIetlaDpuA==
X-Google-Smtp-Source: AMsMyM4EbNcHKhibXcvKZHiCPuO2vkJu1vdpocAjRZub4zhkTfio9MoqToCwPRo7wk7zZeYvd0WJJQ==
X-Received: by 2002:a05:6512:12c9:b0:4a2:8760:47f1 with SMTP id
 p9-20020a05651212c900b004a2876047f1mr20715550lfg.24.1668022067060; 
 Wed, 09 Nov 2022 11:27:47 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a196917000000b004979df1c1fasm2378780lfc.61.2022.11.09.11.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 11:27:46 -0800 (PST)
Message-ID: <776f0e3b-932f-d4fe-d949-9001866d0093@linaro.org>
Date: Wed, 9 Nov 2022 22:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add link-frequencies property to
 specify the max link rate allowed
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1668018895-29023-1-git-send-email-quic_khsieh@quicinc.com>
 <1668018895-29023-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668018895-29023-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 21:34, Kuogee Hsieh wrote:
> This patch add link-frequencies property to allow each platform to specify its
> DP max link rate.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 93e39fc..7e5d755 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -441,6 +441,7 @@ ap_i2c_tpm: &i2c14 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dp_hot_plug_det>;
>   	data-lanes = <0 1>;
> +        link-frequencies = <810000>;

The link frequency is a property of the link - in other words a graph 
connection. Please don't put random propreties into DT nodes where they 
are not to be used.


>   };
>   
>   &mdss_mdp {

-- 
With best wishes
Dmitry

