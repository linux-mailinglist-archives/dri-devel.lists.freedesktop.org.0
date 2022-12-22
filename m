Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8A653E8B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 11:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104C10E53F;
	Thu, 22 Dec 2022 10:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBF210E53F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 10:48:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so2148583lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 02:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ia8KJdyr/weiXXqDeFy3RTipajicAjUGTpWBPLkZVJ0=;
 b=MzAOSxLWjD0lC/pnVpkUG4qU7fFfbpeMEKTypsZlFhqZWKl2Q6t+wZieDQLuJDcdSY
 rQL0ddVlYCruoBG9VqMAmT5nGxkx0dKT5rLygLRsR3Vs2WyiABzv7VeU2l5ptt9Zkvbv
 kSDxSFKUsQicfk+teRXS5v2RbSgqCvWSy+fJ8Q22G618W8YmR/seO+/JEi5nNw4rADos
 v1uAq0AKukd3y0ouieyOeiH+AUal0vIRa6f6rU2wGtt/9e4Pusbk8/NnsG6XgfFP6UCB
 gfgMRNJpyjk3qvFjWdM8ZViqIvTzA4JYqohRIyKqvuLHIlgIXHo35nrcibFKk52py7db
 XbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ia8KJdyr/weiXXqDeFy3RTipajicAjUGTpWBPLkZVJ0=;
 b=lPBWNUqIyIKT6zJtJzLslZJMxpykJZI19xEXfHw/vKlqHGpxbK4OtJV30nVoqaXGwz
 7DdteNQukveSA0pY+l47KuDxhQIdAr9RomWrCrWh7cpTLKLvg4Yf8zNMZjnveLJNWHcP
 w9Uyuyhpg0PV8hJXF1lpmERDS8NzhqKfprsoiWpMSrF9MwD11PXSwRePtUtu3apQh6JZ
 ReyYlsslbgz4DkaeFcPwAp0QLOEZwdBHvpJGH1s0h8lnikDp6TafLZMnMlHmFhTAzXVV
 gCHFFkRDBB4bqXs7Ljn56zIhIrTaTj9aPTAPcsmSD/Zi2XyWE3e9YMtc6v4VPqK1auwv
 HSUg==
X-Gm-Message-State: AFqh2ko8b+MvT34zzPDuAdpAmYp9s0qSx8dP4z1XhlG+fiCsE2tw68qh
 RccRwSUk/jrr6KtvnnuR8QEVQjC9mKUR/hf2
X-Google-Smtp-Source: AMrXdXsDo+FPzvd6zDJCEeGLBfA4RrWUpce4uDKCGO5owSQeUsOnswwVLMSAN96lC8QBw7TJDLei/Q==
X-Received: by 2002:a05:6512:4014:b0:4b6:f22c:8001 with SMTP id
 br20-20020a056512401400b004b6f22c8001mr2181830lfb.56.1671706115054; 
 Thu, 22 Dec 2022 02:48:35 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19710c000000b004b700ba3cf3sm29773lfc.203.2022.12.22.02.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:48:34 -0800 (PST)
Message-ID: <a9cf2812-bf12-0127-d156-1cbdc133f6b5@linaro.org>
Date: Thu, 22 Dec 2022 11:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671227102-21717-1-git-send-email-quic_khsieh@quicinc.com>
 <1671227102-21717-2-git-send-email-quic_khsieh@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1671227102-21717-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 16/12/2022 22:44, Kuogee Hsieh wrote:
> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> add link-frequencies property into dp_out endpoint as well. The last
> frequency specified at link-frequencies will be the max link rate
> supported by DP.
> 
> Changes in v5:
> -- revert changes at sc7180.dtsi and sc7280.dtsi
> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
> 
> Changes in v6:
> -- add data-lanes and link-frequencies to yaml
> 
> Changes in v7:
> -- change 160000000 to 1620000000
> -- separate yaml to different patch
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v9:
> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
> 
> Changes in v13:
> -- delete an extra space at data-lanes
> 
> Changes in v15:
> -- replace space with tab at sc7180-trogdor.dtsi
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index eae22e6..ad98a87 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
> +};
> +
> +&dp_out {

Still wrong order, I think.


Best regards,
Krzysztof

