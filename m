Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581E67652B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689E710E16C;
	Sat, 21 Jan 2023 08:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0110E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f34so11239262lfv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cm74fKZ7PZKO31bFrqMzbCutmQbZrACGraN6keA/CmQ=;
 b=uj6cCnvWG0/ZX8xm8FR+j1zcbSNOW3rIXuCUo4T7P5iCD6z0owTIqRJjIDmlXFZWTO
 ui/Vo+4rRrrh8YGN1DZd73mD06Aa4/qrDZja9bF3CTb69ulx1Gm5ONYd5PpPKtwycV3i
 1ga251Lw3HlSsEA3BM2McwlgV+51FombUViiXBjRfZALziGab9ooI/gKYysiIYy9xVMj
 cqwZXI9YlXxzilhpS36wa6k9GmQQtt6jGSuIw69qnL6U/FpnCx4gvoBuvV2komsSF7BY
 MTA578W+8PmZ3jCkn/HCliatmpe+0E6Pwte4avVRyTCw58kpB8Au/kbGevdLgzLESum5
 t2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cm74fKZ7PZKO31bFrqMzbCutmQbZrACGraN6keA/CmQ=;
 b=glKBa1HF5LfxoiYHw8pS/BDsRyyawIkw7FLAyYnSNLUBIiQtsEKiwOsKXlWXIh9gZW
 46ncmr9X/JANFDLT5rkll/Wg9xIRo/3Q9OJ8lsCwik8AYW9Yfpmu/HBqeTGDf1zhSABk
 2POMjAu/3/i7yewP09Q0ednKgwzGKUw4VIpIzbwfd85vK/78fbXfh7+12bh2ydm7eabI
 VHET6GrhBv/L/JI5maG3QG0IAzA76OKeXiz70Cnxls4fsy4fg+GWTmfUWYCsfHblI7JR
 hPkDvaGnu1CtPLxWN+q+qwNQYlN0/RJZidUCJV5IslmQqimJd9/wrR68whov4ldb066B
 lbEA==
X-Gm-Message-State: AFqh2kqQANmKrrXs+03KI2mLmuNG9wjOC0E+acReSxLsU8d59n0UHAjn
 Ot2HUQqKH4gY61ToqEGJZeVyCQ==
X-Google-Smtp-Source: AMrXdXvf4thwlAFvQa5ElA008GmdQU1GQgdTR0z3t1Z5PgAMFsJ/qN1VUM0x207OjxGo8TxT3dJ14g==
X-Received: by 2002:ac2:4bd2:0:b0:4a4:68b7:f878 with SMTP id
 o18-20020ac24bd2000000b004a468b7f878mr5454709lfq.28.1674290832741; 
 Sat, 21 Jan 2023 00:47:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2eb989000000b0027fb76a4b44sm2074958ljp.97.2023.01.21.00.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:47:12 -0800 (PST)
Message-ID: <26fc1ff5-d150-35cc-867c-23683f104521@linaro.org>
Date: Sat, 21 Jan 2023 10:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to
 DISPCC
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-4-konrad.dybcio@linaro.org>
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
> This was omitted but is necessary for DSI1 to function. Fix it.
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

