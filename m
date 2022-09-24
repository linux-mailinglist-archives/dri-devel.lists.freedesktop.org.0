Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256565E8AED
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D1D10E5AF;
	Sat, 24 Sep 2022 09:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8C10E5AA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:32:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a2so3709729lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=LJaLm182QkoKzGWu5uXx5putxoguYh6AcVXczHW8BbwZmR5tvIlT4rubtVEYkcTM+g
 gU2B/dACe/XMk/5j0mzgccCVAkOCZPiJFKenwghxIXAcTuU0SAv4/KovX1aeILDICz4B
 G0sTQpqUzbll0jsFHNVKyNW1sMTJuD7I76nwBjwvMn5fySSHfiu4e4LokzMjzLyAKe0x
 t64jtzuSDJY0qNeJUAwLIg74NjySWq5wzdXnXGSsxQUj8Mnh296273SIjYX5dfxYERwb
 QYHEJoZJKt2Jbp5hNn2Yq6ay0gsGFgczpoTaWOhWRP4eX4TIGvlUwvMkrQhBCVDUpRZY
 kpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=HmiRoOTO4AIzmDbItW0l5JvDNcP52/op6j+N098MAz7/BU6hRI18GeiAYlNB703WzL
 8nEoyZbfRgspDSy58+KyQT4nKwPw9w0v0NYGngQX16YCX7uRsh0vmLGIGRqjzyPtRaJc
 +smwpC+HMIPisVpwj5NrySrhYpB0D/HBH/bbsCDiLCiX1YMDFbWVBnJ+nWbRdMtyYZSt
 7OcXGVV+elDI2ALxJokpcAnQ6J6bOsumaWwZJhj4vDpS6BOWwDQNft01+S2u/4WlNH6H
 /uimp8+rfT5wtDbagtL5jGHygRVWOwHx/SAyB7L/KdX3ZHK+puyQVdLcR0HLk0bD3Buo
 Pe5A==
X-Gm-Message-State: ACrzQf2oPnEKX0YKBVTJWrIvGt45p0Y8e3V4aaVoOzoBNnYigYmxXaWR
 QRedkjWg3HAjUEyER80d79IbQQ==
X-Google-Smtp-Source: AMsMyM7rUVXbSCob+vZTjIU2JFurM6xW76UMUJQQvpdFWCrYg7ZGgStla+hlXC08Iddk5YCHIeLicQ==
X-Received: by 2002:a19:6446:0:b0:49a:9b06:f4be with SMTP id
 b6-20020a196446000000b0049a9b06f4bemr5056375lfj.157.1664011942279; 
 Sat, 24 Sep 2022 02:32:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k1-20020ac257c1000000b00492e98c27ebsm1841892lfo.91.2022.09.24.02.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:32:21 -0700 (PDT)
Message-ID: <4847bee8-6370-5be5-1ef2-e3deef1a395d@linaro.org>
Date: Sat, 24 Sep 2022 11:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sdm845: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

