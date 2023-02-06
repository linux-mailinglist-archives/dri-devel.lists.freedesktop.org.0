Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F868BAA5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABF110E36D;
	Mon,  6 Feb 2023 10:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D48410E36D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:45:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v10so11160149edi.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m5Y0mNXjAeDacVk2A8snpL6epbayz6NzAhHHcuooMxs=;
 b=TZxxzIdpHF5oOjul60rFqB7O49OucJoTkJZvTtKapn/Mba7W1n5oHdAxKvrFjjltbE
 5Hj8eaT5OjE1e0BYl5/xsuGmA6Pe28TvdGMg3AQt23WGnlipsmZ2Rj26+CX/jnWBGEbQ
 nC7h81O86DYSCCeam32hs9nwH1T8iYixFT9EOhfOThtUydgI0gBDnLfzm1pjgznRooT+
 Ivb0JUYJdoGmmiv4n0aiBsTLaatQ597KvHvBUSF0ppM5jAblMbx3xsYmk/H7td8yR5s3
 13pbomY2LBbwbvitUJDerDFHkuVQOMhlkecqe3fos6XH1DQ6te8MeWp4bopV/3Hv5Qa7
 4Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m5Y0mNXjAeDacVk2A8snpL6epbayz6NzAhHHcuooMxs=;
 b=A69vaQose+AdY1waSd06cWtaURC9Hz995Feu6FEiA4jmcGm+jRMEJanBQG7h76Nnys
 a6Bd/ZqYq6Le55J9HA3ZbiWsOgs+vr6AMwUz67lyESexjcjhcQs4Ykyt+9IU3giWgm9N
 COYM6Rp0msnQ9TysO0qKFj66b4TZqyeqLbn6hfqz/LqWQtwGUkJtVfz5MvZmqT16Std1
 9R8flhRhWjStMo4Nj2pD94CFRRcyI3ohYwZeGKfUQLgK6ePWApVOcZsBR1kCDTkQoqKn
 hs/g55C0bdljlhoCcsLQ7/kPELxD5YWS/bdZxVW6YUHil0EUqJdOrX8EClbtlNaeWsnd
 QZpQ==
X-Gm-Message-State: AO0yUKXQOsum96c58XSiIFoZwwzuQnLvWR2Z+arG8+2qV8HqSKgMrafM
 B8q6RGES6B/zlN5LGh/B0ORV3Q==
X-Google-Smtp-Source: AK7set8NRH9yQ/CFflkdpBvM3kM+7gdpF2OPGo09zPNM+wrZ2EyV/GNdylfSysaa0+sQwTY1yeyGwA==
X-Received: by 2002:a05:6402:4508:b0:49f:bf08:b60c with SMTP id
 ez8-20020a056402450800b0049fbf08b60cmr18145115edb.26.1675680298615; 
 Mon, 06 Feb 2023 02:44:58 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 ew10-20020a056402538a00b0048ecd372fc9sm4907004edb.2.2023.02.06.02.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:44:58 -0800 (PST)
Message-ID: <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
Date: Mon, 6 Feb 2023 11:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6.02.2023 01:27, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8350.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
Wrong patch once more?

Konrad
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4a30d10e6b7d..1bf8e87ecd7e 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -211,6 +211,7 @@
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>  #define RPMH_REGULATOR_LEVEL_SVS	128
>  #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>  #define RPMH_REGULATOR_LEVEL_SVS_L1	192
