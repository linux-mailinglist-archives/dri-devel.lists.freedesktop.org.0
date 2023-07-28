Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48256766551
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25C110E65D;
	Fri, 28 Jul 2023 07:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7C510E061
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:27:52 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9540031acso29247031fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690529270; x=1691134070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YNafLEWKCWHk1Q/GCD8fpQN53csIuJxGCApzHzUl+J4=;
 b=cvbyYal9w/8O6TpbNSfZiSB3NPbKpNrbwA0Pl8KoO5akeSN1cstQQ/3b0Fwq5nboJa
 W08NUyupLmp7hVAHqGvmTwGWEGWFcoJkFHiRpf3aSGISo6EOlUr58+O1Pq8nh6qD8Vel
 F5lc7uKMMCdsGa/lT6eEXEp2HB5NxHnf/6OgoZ3Rv+76Beok3p2FReGLgoN66L48ODYs
 hZjqrlnys23DUbaZ/bMns+GJOosP8dE4lok2/iWDK2md5NnzBPteZaFOcZ8Gb4AdoOss
 FmoH0YZQnBM8pZ2bpljO4kMA0tkUFV0HwoBUIlVCPZtQCZFk4ZEfRJ3gOOAFZGiRntch
 9/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690529270; x=1691134070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YNafLEWKCWHk1Q/GCD8fpQN53csIuJxGCApzHzUl+J4=;
 b=c3oLk5Y80g6U7mkSbfLDdR+ayogDoeSIaGhLnEIvjeJUMf+7IEzE/uadaCa2Beat+5
 qbrLZPDNhldhCHvBpWzdTJUOcDsZ3V0sE8nFasw2lADjVRqvucsr+vcePxk86KulWzn8
 0ElB5D5AubTVHyDVY5G+v3pu2uGkr9v0eA7swV99+b5w3HmczyUutyvbaghBPbGB/Fz4
 viAABoWCtnG7HSI+iW1w8dR6R2LjlBXoTYmI8DiGC3aupgynXJu6BUui3wq2cjldMJuS
 2tf9jK+51dUmFdkyHqfMdZ8XJ2tF/p5KGSgqgT8T9R1DLs19npMW79fORoTmIjsYKtAZ
 32rw==
X-Gm-Message-State: ABy/qLZYhvef6Nn82bcfx5IT6NWduJjPHEjqWoSmHE8vFd5QmqrcD45x
 bmXR5dVX7HtjZyT+nYO6Bd5NXg==
X-Google-Smtp-Source: APBJJlHbQY+iRJVVhNPkSxL+x0Z0ZzSaBO/HRp6/q5HSe9MRZCYGRTErk6fUi0vWZuvnX7tYEjn/Ew==
X-Received: by 2002:a2e:2e17:0:b0:2b9:6d6e:df5c with SMTP id
 u23-20020a2e2e17000000b002b96d6edf5cmr1067297lju.5.1690529270007; 
 Fri, 28 Jul 2023 00:27:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a7bc5c5000000b003fbe4cecc3bsm6430037wmk.16.2023.07.28.00.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 00:27:49 -0700 (PDT)
Message-ID: <08cd9bb5-678f-e03e-4598-dd1785f0d7a7@linaro.org>
Date: Fri, 28 Jul 2023 09:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/13] dt-bindings: drm/msm/gpu: Extend bindings for
 chip-id
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-13-robdclark@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727212208.102501-13-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 23:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Upcoming GPUs use an opaque chip-id for identifying the GPU.

Examples?

Anyway, I think we should insist here of using something human-readable,
even if Qualcomm/Adreno internally use some weird numbers.

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 58ca8912a8c3..56b9b247e8c2 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - description: |
> +          The driver is parsing the compat string for Adreno to
> +          figure out the chip-id.
> +        items:
> +          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'

{8} should work?



Best regards,
Krzysztof

