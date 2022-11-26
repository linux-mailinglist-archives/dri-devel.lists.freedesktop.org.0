Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A760F6397C3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7E10E158;
	Sat, 26 Nov 2022 18:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F6A10E157
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u27so505092lfc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9Q+kwBqp4GZ8Niq6ZmZJP3/Rtvnjh5Frv97VKLaAyc=;
 b=k76ic81CY+jrZWPp62GjFg0/QRT7OpK2gmyR7jSWBNezRFH4DIbl7aOHdQh+YFW/Dh
 NMdMDtGERw4xQRyjJ7JG1JDl589L2wRIhN5tZzgIIL4mURXshTnbVriFngSJuCO17oEQ
 TdABo4c7eazDYnM/WUpqNq4vISNKqmZOnDJFiLgqr7D9BORYaOFzN8MPOTp5c3btzHXt
 gM7T0YERknAU2IKgAR33QjQi5chTSIa+K2qCPV1w+0wdkRu4cFPwc9b6zwDhwvnsG3Pb
 x76w4d3adMT6LI+fgpGiI88e4sg+lizoeZAZdgIQyr0oaD55K80MrLyUiDRcm4JLPHwB
 U66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9Q+kwBqp4GZ8Niq6ZmZJP3/Rtvnjh5Frv97VKLaAyc=;
 b=Mw27XtXoD/nqHwYVy5bjpMlJLKDAXd+qBeni8GPvRcYi7j6YfLQ6spWxQKL+ZP3i5F
 vCWPRi+SKArXGs7SD46czcIAQkAjp4IbWHPdyivnHmJy9gFDw4aQoe4+pLH/H3KjDqEu
 Om+LhMNajAD15zo7PABAtvjcLXNI86zmQE+U+j3MZMsGnbh0WPIHvtZyGXY4b0/sGPnC
 q21aKBC19aAH4uiSP+AW0WH+NkIPpJPibeTeW/uCpxhsBbgpMBNm36BvXU9RXCa5bLQC
 v+QsBlSFjsEAphHlGHGZUDKApoDLhSd2n0af9NL8Dae5hUKqWZ8mlpKczA1tax2kSyVd
 I3qw==
X-Gm-Message-State: ANoB5pmXHvxn0hsidePlmGIz+5OlDkBzd+04JsgtEBwJ0VlWgTapxxCp
 J+3E4ncbmryhZGw8ntasB4KrdA==
X-Google-Smtp-Source: AA0mqf622WS2PkHc043xXDBsWu67ZPigh/VrOYc0OcnPiMjNtPDXe+L0yFYhIBF59jyvH1E6GsSycQ==
X-Received: by 2002:a05:6512:68b:b0:4a8:d2b7:ed5c with SMTP id
 t11-20020a056512068b00b004a8d2b7ed5cmr17062933lfe.434.1669489139033; 
 Sat, 26 Nov 2022 10:58:59 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a056512208a00b00496d3e6b131sm998836lfr.234.2022.11.26.10.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:58:58 -0800 (PST)
Message-ID: <74ab6cf6-6edb-9ce4-7226-eca922338215@linaro.org>
Date: Sat, 26 Nov 2022 20:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 09/18] ARM: dts: qcom: apq8064: add compat
 qcom,apq8064-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-10-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-10-bryan.odonoghue@linaro.org>
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
> Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for apq8064 against the yaml documentation.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

