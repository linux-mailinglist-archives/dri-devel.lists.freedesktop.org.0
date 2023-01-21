Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4867653A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986E10E1CC;
	Sat, 21 Jan 2023 08:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716710E1CC
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:48:04 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id br9so11273265lfb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H10VW+xEg3DX5kE57CYgEU08kcjqqLocBifj9fl974A=;
 b=oPPK6jwSu6wF18Q6YJKvr4hzat05yDF3cvvX1mjjRBpu4hvtrUbTjCXIA4xvsg9STl
 t0sPoYP2GLk7NjXx/saq/RliBN45Y3VctkwokmZHrhzwMCLbj2126Cmpbn60Fg92Afiy
 sllB5W1gSKzYeLNyVc2iGYbgrm3TYD1LOkaUruKhW2vQUaz+A6GeUUiTlEQ3TiYFmtwk
 uOI7ivQ968U9VvsDG/38LyGDYIp8du9Cl6VBKueZGg+YUziddxvjGMUcQXj+iyCDzCei
 B+YTU9LkM0G9jjIKNOupq85U9JvRNsxxeI9M+fQSsWPwNs2E1FswqIDGFHc1lzkmUV9d
 naHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H10VW+xEg3DX5kE57CYgEU08kcjqqLocBifj9fl974A=;
 b=QsS5vAaV19oCbZhpLXUh46WWAAoukk+TdIbHL68ha0LKjTWSZNnc+OUqKEimVvYHwd
 +rM6RddJn25bMqV8nCpsNIwYgPM1ubMigNDH3TMjP+2xJmLddGXwwcShB6NFvkJspuRB
 4+KlpWWt6fYPRjxz5XW16tkMHoIS9BUnhlDn/dcpiLZL6nFtO3VV8U64Q3jslNfkJaeh
 ra+37WAoj+QINpREd7bvp+zt6B93E6QlaTAU0wH0TdjXH4Xl+PolIL2DPg9NI22r0Vwe
 cTuffkDbbHRR1T+5wwN7R2VwgRdcyIoREcue5HhOhhz39+79C7ufoRLn3oMrgyUtqEtk
 BrLg==
X-Gm-Message-State: AFqh2kqydRFAF/XAEHxe6TAhx5fjt/ECN2lqgR8Sa0+q3IdXp+Y3Ij6Y
 npyOMtt7E42R2VzHrUyUlvyASA==
X-Google-Smtp-Source: AMrXdXuTJi1DKWpTKn9ZgZ92EMIbiHdTEpu8XWSLYmf3cjTDsQ09kWsV/SGG3xYYkkyiZ33wH3JVDQ==
X-Received: by 2002:a05:6512:158d:b0:4b5:8054:1ded with SMTP id
 bp13-20020a056512158d00b004b580541dedmr10409354lfb.9.1674290884148; 
 Sat, 21 Jan 2023 00:48:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a2ea552000000b0028b7cb86d9dsm1937649ljn.56.2023.01.21.00.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:48:03 -0800 (PST)
Message-ID: <fc955b13-cd54-a567-8a94-2b828af0e2f9@linaro.org>
Date: Sat, 21 Jan 2023 10:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn
 out labels
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-7-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-7-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> Add the mdss_ prefix to DSIn labels, so that the hardware blocks can
> be organized near each other while retaining the alphabetical order
> in device DTs when referencing by label.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts |  2 +-
>   arch/arm64/boot/dts/qcom/sm8350.dtsi    | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

