Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704FD6CC65D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2610E8F6;
	Tue, 28 Mar 2023 15:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FBA10E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:31:30 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s20so12997740ljp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCfLdVb7TI1yqO2qnnBtIkreowcg0oCZEFmkk9g0KqY=;
 b=OYu298mz0Km6mev/DZ3Z+2oKlFfDgAdV3rz4AY0vddeyWToeqyu8M6tDOS/CpWyQh3
 7RADjOgHYdPgPcz83qBykcvtc3lXOcrXCkh7gG5OEUMwJ8hdYnn/4yEhDdsFloWa5oY1
 a6bGH30PlPfxE1SFUOZ9H3wjFw+NdEYbRBOOvCVBprfwfG30pJIdS+fgGbgNWt19CHHN
 pRuxzNWZVJRREZI5iOaaGWry+gFU5FXekUbIg9UVdDNNZB4gb8qNpsk6dZEg6rf/r+er
 5z3n0ca9kpjXfOMN6pymbC3X5ggfIZBf9yWOwKRtmOAMKjY+S3uQi+/IqKZCpj+rbaYW
 a8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCfLdVb7TI1yqO2qnnBtIkreowcg0oCZEFmkk9g0KqY=;
 b=RF7UIv1zF1KkT05yM0UzunaS7j71xApGDDOTfMcgAA/yQy38dMHTdn3lcIbA5RJT6G
 34cS4BtrH5XBTNCgu/3ucjB0ZKMMM3/hSbpcU7v8s7h+94ZSL2QKz3WT3lRNMQQbHjJU
 FA3NWcjiWyoRwwBUmTbSG6hiWewXmwRMt8H4YJVZ2sGGJg6TZw+DLYq7D6OGycZ137xp
 UX91WD+xAByci+nQsA4R2oYfRno5u2HdN6kf4kwUCGC3UdbCe6qhHnFKTUsNa7VceEwO
 opMXmV0+xCzjYOrxlof/9ZnFerssdfAmWstsLONq+uHVh0Fx3tr4yloZF4Use4oieQDE
 rx4Q==
X-Gm-Message-State: AAQBX9eRU4l39ykDgPXOFCjqX7CmqqbJUwcPv+hlLVspenWixUnfopea
 LRem2NA4+bIFpSJLZnDIqUsJqA==
X-Google-Smtp-Source: AKy350YprgK0doz3jlfS4Un0uNGa0u3/hWuIAMuK+uqdb4YwcZi5ITxG4ccIDF6oSsTaUbWZSYsyFA==
X-Received: by 2002:a2e:910e:0:b0:29a:fe9:3b2 with SMTP id
 m14-20020a2e910e000000b0029a0fe903b2mr4886135ljg.36.1680017488507; 
 Tue, 28 Mar 2023 08:31:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a2e3008000000b002a4bb086610sm1522966ljw.123.2023.03.28.08.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:31:28 -0700 (PDT)
Message-ID: <1e300a26-099c-1f00-2c90-b4832199748b@linaro.org>
Date: Tue, 28 Mar 2023 18:31:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-13-e987eb79d03f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-13-e987eb79d03f@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 17:28, Konrad Dybcio wrote:
> A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
> (blair). This is what seems to be a first occurrence of this happening,
> but it's easy to overcome by guarding the SoC-specific fuse values with
> of_machine_is_compatible(). Do just that to enable frequency limiting
> on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

