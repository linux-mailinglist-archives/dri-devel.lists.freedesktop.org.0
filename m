Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588E67653F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6674810E29E;
	Sat, 21 Jan 2023 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9518110E930
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:48:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j17so11294213lfr.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dXt2jMN4iiwvbP3cezivUWmGILp8z7wl3cRsehMoFJs=;
 b=Hi2O4NBZvvBOV4Bd1H2hjc+Ae0VTfXBFsjgWAEHNwfRSkP5VjQ93B5NAj1xLf7KMYj
 /4AKPG44ttdW3DqbjW/xJksDf44aOAcvJkzUzGrx684w3B3xczmV6HX0hFjtkjfwBYZD
 z8DQ0ZBRhZAj313Bz99SuyRiCBNwRL8n1fj7QyslubxPglV7og9n2taXrjwFpV6drk3M
 whrHhbRzNnPUbZK4GxYRNgt5GZiytnmf+Ya7kb58b/9TMqRse+dr2klfcS6A4S5z0GJx
 inskJXrEq1qcaLwotE5zIClLGhMUmX7+JZQApjFOultbNEwIc43gpDt7nfyXFuSUNbqd
 fwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dXt2jMN4iiwvbP3cezivUWmGILp8z7wl3cRsehMoFJs=;
 b=Utl3/aVaMuyOiYfbqMjUdnBJVVUR3kQotcDfqRO+TprB2DdzxnyLs23y28Ku+f+7yY
 zL5qzFbfsOA2iT3Tck761uS0be4KTdqHUuV4Z2DYvFB5PKSC2dfMy8iEdzQXAw+Lfpxf
 WOxu0iSGS+INrj1KXIhezpGqjV9KB7bDXNsdll4CeDKztL+Y/kzk4fT/6sysT5XoKixo
 E/HjT0Qotrn+ke+qdVwncjXFI5mLhb0Vhm3kFXSIwuKfe4L99R7AiDB1crJlNyfj2k1v
 rooLXN+gYhbVQYBTU9h7SSUIfYfXijiKHZ5K4WghwsK9cI51URAhOmLGjhVx+1YU5nl0
 Vvfw==
X-Gm-Message-State: AFqh2krAkzs4grlHbYYGl4XW05GH02WPzx2VYySPGFUBd3YOyq3tiPaA
 ToWomqgYJkeYtAgf/8SXDboY5w==
X-Google-Smtp-Source: AMrXdXvhbE4+AgbmpnRt6d5WKodQ08h3f+9/7ZW7Jd/+s6rlai+GYUY3U4Lxc0p6ycKRb1lCOgXfCw==
X-Received: by 2002:a05:6512:36c9:b0:4cc:6ca8:f308 with SMTP id
 e9-20020a05651236c900b004cc6ca8f308mr4110483lfs.37.1674290901157; 
 Sat, 21 Jan 2023 00:48:21 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2eb7c9000000b0028b974ac450sm1343259ljo.18.2023.01.21.00.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:48:20 -0800 (PST)
Message-ID: <3c63f52a-038f-6237-09b2-d1f44479611d@linaro.org>
Date: Sat, 21 Jan 2023 10:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-8-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-8-konrad.dybcio@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 23:01, Konrad Dybcio wrote:
> Somehow DSI1 was not hooked up to MDP resulting in it not working.
> Fix it.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

