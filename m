Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301AC676527
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089610E1D1;
	Sat, 21 Jan 2023 08:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE610E1D1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a37so8050027ljq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTId012Gt6PWvQonFnbk4YKgwaLEuR7guf1cpuZhcdc=;
 b=AvgoHUPeLfhtPkFAC32ZIxPPeDAQrZNhLRXrU9i+vt0sIJ6oaTdVlE3k0HBG1RhBi1
 yDzh2lvVWzp8wsxQ8BVPd/hQJhGE608a3K068rBapLfV1FrreS4mZcCk69/C1JSB0/Ix
 Hkp2jQPeUr5iV9iE/J+u7gDBZmqJJoHsHjxNRAFHwi1NOlJphpe35XsvZorPk9E5hBD+
 QYtjG19EOAqTkp84BN4naMakh3d0Mjss1n5Eejmk5AWaFQIVqYhdodAdWj0bbjh+Oyyz
 oUDgdc5kbSbDGQLlUEG1rcGRJvHF3DFmkbd5wdUG9S0kEB+Hx3uC9KpDUucRDK+koy0L
 4E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTId012Gt6PWvQonFnbk4YKgwaLEuR7guf1cpuZhcdc=;
 b=khh5xv2NkhzhDSxbetbZjEoiZyVrsvp49E1bcTsiXRw6IZ7Nsjrg5LHIhBCkeGqNB1
 t+VWxA6HGkD1ZCQe3U74fMnbxYOXzkcYT9RsTYaO62Gz1PVPpuWVcSNo3B3LVhsQa0a4
 ujJLEpiNlbDvmSmSfAgOKP1zwFX9suv7aLo28JWsAT7KZfIYNPTC+4Vfl5XdU2M1HYHO
 sWIdh0PQM2RzwwaDFB2hFDINZUQrlCVAGWEiPXOr2uBxeH5oc465rN/jDF6JpPVFHbUh
 YcuaiOVv10gXbMblNGG1i1WQPFO+sMcz4hSKKWbcMmdj6tYnIVdJYlu65Ou2MF7wI/Ss
 ZMXw==
X-Gm-Message-State: AFqh2kr0HtTzvWuDYD5ir5FooJsuQ3nqXfnI/flBdDvn84JAzS1LAj9z
 71fGxseFfH7xXe1RBS8Hez/9Xg==
X-Google-Smtp-Source: AMrXdXur8w/pIdAGPL8mUMuc7WdalL3iKUhClyPKVUXZnlyW+pK+ZV5CNHrDP+Xayp5Gis9ElJ4cxA==
X-Received: by 2002:a2e:a22b:0:b0:28b:7a74:15a4 with SMTP id
 i11-20020a2ea22b000000b0028b7a7415a4mr5098563ljm.12.1674290819340; 
 Sat, 21 Jan 2023 00:46:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 be31-20020a05651c171f00b0028bc41df604sm448646ljb.39.2023.01.21.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:46:58 -0800 (PST)
Message-ID: <60f2da52-a757-87ae-5333-8275f98c986f@linaro.org>
Date: Sat, 21 Jan 2023 10:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm8350: Fix DSI1 interrupt
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-3-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-3-konrad.dybcio@linaro.org>
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

On 20/01/2023 23:00, Konrad Dybcio wrote:
> The interrupt was wrong, likely copypasted from DSI0. Fix it.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

