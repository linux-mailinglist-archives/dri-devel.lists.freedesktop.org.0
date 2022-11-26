Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10C6397F4
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518310E174;
	Sat, 26 Nov 2022 19:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EBA10E16B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:01:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id s8so11528126lfc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=npduQyctwPNwbrvgK5EV990wakFndbnwODmRKUwPZ0c=;
 b=YYDXJrlDz5fAunQJeW2HJc+UnzJx/7HXQvjdVLpMqfp+JXxPYtLlQFHrlg6y7kRps6
 IuglpHw3CwIRW9cheafiCbS0cQM7tPK9hLvxNxu2dJlFMcRG/ZsOfa+EyMu2An+INn+Y
 nJXA7ftESS/os65D8GZ5hujNTqO1ykODmF1iSvkVtXN3a3ajQdtkK/VU+JOZzinjzcA5
 oDxnog4o9hud04y8TNwvgQkyYAzC7vHiSmiFPcBan94w71ie+yTcgsxY2fNl9K9pC5yw
 UDoIlGN4w17bVxjOLFTRV5T+lTKuzALe8j27brPecExBLVEfBknj9T0vlYTGADAUSCMN
 8Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npduQyctwPNwbrvgK5EV990wakFndbnwODmRKUwPZ0c=;
 b=RYG4v5Q81MflsSe+cAL6EtBkhrV6dVXamo/yCg9xKBnIp/3NyDt4wRDUJvA4207kO9
 E/uMwgQj3eTcjE2puWab32Ja47SYhL7fH6FyQCwKAp42w1gP5zM0kmMgwbb57arKwZm5
 GK/TwlbQgALf+Tly6rGkHIZfGoP4tZ66CHWNGqmj6e/pVhttJ3sblrzae2s+e83GODzE
 Q8NKjziA3hF3vGL1c3/jC4MqsYd2+vP9nwjtIG2OW6DqckodILUblAg1qjr8tiTaJUac
 WQ9y34lSnlDZtc6SWlgCqSyYNogguYDj26PVKuDfa46vdGwm4JZhjo9BImtu3F9c8k6s
 /gMg==
X-Gm-Message-State: ANoB5pm7gSC0/ahP3IkgYKeKiZ9LiPpdmmsIQpumPTXoxRFCbuhsQsav
 PXukhuOh5WNUp6sTzKwWQkkWQw==
X-Google-Smtp-Source: AA0mqf6tuqwwCF6uoWwBZbyez9jbdMM/tWE0H2vrRLPARhOE6xVIfLJNfMh/ndzgO9UGY1vq7OUfaw==
X-Received: by 2002:a05:6512:2a89:b0:4b4:dffc:62a8 with SMTP id
 dt9-20020a0565122a8900b004b4dffc62a8mr8007174lfb.585.1669489304609; 
 Sat, 26 Nov 2022 11:01:44 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a056512052d00b004b48cc444ccsm1001380lfc.100.2022.11.26.11.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:01:44 -0800 (PST)
Message-ID: <a6a65a81-1f37-74b0-6bd4-df8ffc6d28ab@linaro.org>
Date: Sat, 26 Nov 2022 21:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 14/18] arm64: dts: qcom: sc7280: Add compat
 qcom,sc7280-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-15-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-15-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sc7280 against the yaml documentation.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

