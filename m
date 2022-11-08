Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94E6211A2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC02E10E433;
	Tue,  8 Nov 2022 12:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672E910E430
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:59:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c1so19469144lfi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8L3H6W6oTJMJdFXCnhanw0HNqYGnHy5fmO+vbXUeMH0=;
 b=o9Ly1gbpN+idILPFeSxz4eOwCpyhasZOzQXDwPubs+I3PFMhAy2EgmnY6507J+eC4+
 OHT/oVSLNmV/ADMON8We2NcyT1j7BmbKyBhcu0/d61iJ2jHdqtPPAruY/92h/+L9WkX4
 HIIIzytwt/nXiSD78R6vvJBDB1sRZuGpuB4PcEKWEpyu4otQ11WqFZIoIa2Arh7A9yVG
 GKkMEDNJzM3M6Y9xHluwBRQt2Oie58WD+nHaEm0HW0jmuXIbhOZMiEIH9M58luibLFrs
 djaHIQcQGfledsIXqtOItRYn1ulvIOcWtv/03O4QxHf7fO3KwFgTa2MvwAl64CsDq2qU
 r7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8L3H6W6oTJMJdFXCnhanw0HNqYGnHy5fmO+vbXUeMH0=;
 b=ttBzCeXqXNW6roICo3jxW1K6eoyRs/hZI6pVtI3Ji2hj6hn1HXgZzPhExkkD2wLP1q
 9TcSZXCzOc0dyGekE2iXIsNsyIIMDooCWnbGAc7kPER94u1UPuNI90p75Jdg9jRQ+GGA
 Y6Ez2mAV4g+1gLN18ufK1NxJecOYIaIA6VmBiewYSc4DQ/Ij1+KyNqINHC01XheqCYNd
 iu0vMkjUnAmPEfAGLPiK4Z4n8om9rV2pObKUEbp1t0aB2KHzOKbUj3vIEhXvL/NX0929
 pyJPDUBGDwZAcZVg5lrLwyUnqAKEUEbGUAn+bqbcASTxpa8vGqqval/3fPrvKojW9Fy6
 T5Tw==
X-Gm-Message-State: ACrzQf0wTadhxTZns2s9bwMRm0gY7p6MP0ZYOol4dcbyQHhj3giLQn1c
 auapTunjmCEC8jOa9Ad1zHkFog==
X-Google-Smtp-Source: AMsMyM6gcjtqNKxAqLANJMb4ITJRYeam2CrOZXpXHvLMegg+din9vntf4BHAXpIoKqVtl351DF3ekA==
X-Received: by 2002:ac2:5b50:0:b0:4af:d01:63d0 with SMTP id
 i16-20020ac25b50000000b004af0d0163d0mr19758839lfp.596.1667912345565; 
 Tue, 08 Nov 2022 04:59:05 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 h20-20020ac250d4000000b004a240eb0217sm1770485lfm.251.2022.11.08.04.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:59:05 -0800 (PST)
Message-ID: <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
Date: Tue, 8 Nov 2022 15:59:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. Mark the supplies as required as was previously the case in the
> .txt implementation.
> 
> Warnings about missing regulators can be resolved by updating the relevant
> dtsi files to point to fixed always-on regulators where appropriate.

Ugh. Are they missing or are they optional/not used on these platforms?
Can you possibly list all regulator warnings?

> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..0f7747e55b9be 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -124,6 +124,18 @@ properties:
>         - port@0
>         - port@1
>   
> +  vdd-supply:
> +    description:
> +      Phandle to vdd regulator device node
> +
> +  vddio-supply:
> +    description:
> +      Phandle to vdd-io regulator device node
> +
> +  vdda-supply:
> +    description:
> +      Phandle to vdda regulator device node
> +
>   required:
>     - compatible
>     - reg
> @@ -135,6 +147,9 @@ required:
>     - assigned-clocks
>     - assigned-clock-parents
>     - ports
> +  - vdd-supply
> +  - vddio-supply
> +  - vdda-supply
>   
>   additionalProperties: false
>   

-- 
With best wishes
Dmitry

