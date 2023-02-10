Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEB6921CE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778D10E269;
	Fri, 10 Feb 2023 15:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFD010E18C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 15:18:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fj20so5033606edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
 b=d80SCFeeuXdzM2sc0gNhKexwi2OYpwvllAanBCtNQFUACaIKCwzcTKOlDp5lYf6Y14
 9WlT9bOY6ck+OsK9+bCwE60vkbmunWSO574f8WHJ1DqQ1vMXo8CaF2gY5N6v09fqENiC
 GNbW4T/3/0y33GHxS+cTuQgMJ/vp+xjDMmASxek7TaDBgADIXZk9M+6mlryf7wel7PJZ
 5TrwR9vpEmiNb/teZs7Rjz7uwYqVuouZWPsTRD8U/NivqPjlvXDE8KW6Z/wmNbvTobvm
 9bxRSX7pACBLWedpPQ6HxhEu45bBq3hRPibIpdUm3vGbJ4P7nHhbHxBEBXIjDmsgeTbL
 ms4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
 b=mhsvLd4iR5JKAsjM1TyoW4JT1IxXfQBhnSsUckQSqko6CmVIwsl17WmTKmWStd+puo
 GXQfGMD5+ThEMlBitc+vdwYORUIWc2wo52vNBJZwS8ZvrcBueurk+ky0uh3NxPDsvL83
 w/MdgRyvhPrbEU/HclJCaMhtjp1IpuggOdfjIavQWwhjdLYTNpGJfuvIO8aPcOZU0peJ
 h4qUOM4FLEiLKj3Sw3UipHveHsQHEXEgKPzjOaaCKVNx3ySUN2cYB9H+TYTwg7TdYIX9
 jqkzX1V//r53cPmsu3x5QwdkuCiydRwDlmIuR1dTOsynfNDEW+HupSiF+sRpWMB67Kjg
 Z6/w==
X-Gm-Message-State: AO0yUKWlcoKdiC/+Ukb5FPlOc336RKO+sq9lOqlwUrD6yA3zN80z6mS1
 p7WWDU3ctWi3JIybwuGbhYhNnQ==
X-Google-Smtp-Source: AK7set/iNkirutTUnbExRgezrYds0gZeyGu3ozG/ELlq3e0A3uK/LBqaiqxq4aGczsJNKJv1AGSCrQ==
X-Received: by 2002:a50:ce41:0:b0:4ab:4b85:a69f with SMTP id
 k1-20020a50ce41000000b004ab4b85a69fmr2491931edj.1.1676042286235; 
 Fri, 10 Feb 2023 07:18:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a50c252000000b0049148f6461dsm2321942edf.65.2023.02.10.07.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:18:05 -0800 (PST)
Message-ID: <44fa957a-b47d-d913-917c-a614884d62ca@linaro.org>
Date: Fri, 10 Feb 2023 17:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sm8350: add dp controller
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 16:44, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

