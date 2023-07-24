Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C975F3AF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 12:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CAA10E0FF;
	Mon, 24 Jul 2023 10:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5A10E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:44:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so6167951e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690195457; x=1690800257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBI9kM5NnGdYn3nIC1ZBkTtviA4H3pLeU5dB7m6uf+g=;
 b=JnPWYhSC4MPaMfPt85IQQAx/UOfIv4PMdpx1qNFUd6csIjn9rgeV0BX7HQhbyyLkT2
 GWsIdxMw3EQwA570Mkclmm8rD9dzHMZZ87zT5UtLFr49J2XcI4okl4cYK9SFNkGahPsg
 G0gLDzJBKlGaZu2lLEucdE3JUVG2DxLq2hu9v680oR5Hy2SUB5jHgxumvAZw7WROR89A
 HpmE/QhE6wW0QHC3D9Km1l8/7Xv3lOvEYmuN8sN+qwUAc78f3iPIruzkcI57MOyB9X/O
 WVQCwVOvu39vd6Lx5b6wtMJviasBmCVyroiEhjwfCXtsfimi0x0FiP+hmdg4ORYFA/oM
 N6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690195457; x=1690800257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBI9kM5NnGdYn3nIC1ZBkTtviA4H3pLeU5dB7m6uf+g=;
 b=DIam2eIGsgjtr9+XT7wxV6WHfbDiHnRzbD1IQ6/vz/xu3V/th6G6bG8Be2ff2IAoII
 gd0zTM36we603Fqv5Q/VkSIEAs2I0xkQb+N+Z7Zs1JTsPK0lqkHg47X68KBCrJLSWePK
 Ii83W+M53Ii71YJRJHhxm0nl4gA1+7GT7zPpzNgSgizr40dezG6nxDdM+SvdYwvHXh//
 qRx1EVSMOcXAsBP+jtkqGlMsEKCqeZ4aExFCLNtz6uPJ3KmE/9i7xx4Knof3CqgfUBgC
 KF9FbmLbSdOeE8Or2H0ETC+0xneAZwRgaR6HN/yrpXdKrjxYoxJXQbw5ozw3WcMc07dA
 /RiQ==
X-Gm-Message-State: ABy/qLaDtTuMYwa/EX/QNtrmD5g/uZ6NL7ncZJvkSIv0hazWawFRejFx
 ON1Fg80138p4NbGftmUmGiTwRA==
X-Google-Smtp-Source: APBJJlGH0BFLTMfOfJFp6DXr/KIrJISsrZB2/U65xfegxRJbSLfokCGQZDPk/t0kXSJZC9iYEG/n0A==
X-Received: by 2002:a19:ca5a:0:b0:4fd:d862:72a6 with SMTP id
 h26-20020a19ca5a000000b004fdd86272a6mr4558720lfj.53.1690195457091; 
 Mon, 24 Jul 2023 03:44:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a19ac48000000b004fdf4053786sm780255lfc.240.2023.07.24.03.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 03:44:16 -0700 (PDT)
Message-ID: <f3aaee16-edfd-6b2e-6c47-de48ec572609@linaro.org>
Date: Mon, 24 Jul 2023 13:44:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
 <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
 <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/07/2023 05:49, Bjorn Andersson wrote:
> On Tue, Jul 18, 2023 at 09:09:41AM +0300, Dmitry Baryshkov wrote:
>> On 18/07/2023 07:37, Bjorn Andersson wrote:
>>> On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
>>>> Implement DisplayPort support for the Qualcomm RB5 platform.
>>>>
>>>> Note: while testing this, I had link training issues with several
>>>> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
>>>> or VGA connectors) work perfectly.
>>>>
>>>> Dependencies: [1]
>>>> Soft-dependencies: [2], [3]
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
>>>
>>> I'm not able to find a version of this series ready to be merged, can
>>> you please help me find it?
>>
>> This = Bryan's? I have posted some (small) feedback regarding v8. You also
>> had issues with orientation switching bindings, etc. So there should be v9.
>>
> 
> Right, Bryan's series. You linked to v8 which has requests for changes,
> and I can't find v9. Am I just bad at searching?
> 

I think v9 has never been sent.

-- 
With best wishes
Dmitry

