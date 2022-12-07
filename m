Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0E5646213
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 21:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2310E41B;
	Wed,  7 Dec 2022 20:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8210E419
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 20:06:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p36so26054297lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVZZ17cW0EmuZRh2nTo/dxOsOvCo68gbOMlI0qg0Oes=;
 b=f83oDLXIKgXTvGRYKqZtWpfPU8ufCWVDcdrjasaCLvpkw7nA/JC9IYESereH++ibEn
 dyVjnTTFusrXcYYJqJXpKhfVOrZoWAEBj3AxokAfqEvE6nDqEVi9Uxat0xtez4s1+Wr2
 f90QZSh2x+gG0xb1yApoMeZNSB1FxEDyC7wVP90pwRrPLXi88cepilas96RCOzMH+nfG
 KQ79MkzVpLTfDPbMFnVm3/AJGgNui4KuB9lms45NY87q8eP7BeiiU8Vx5B6CnRzKdFw5
 4fcWEUcP03ArwhKl7wAVOYsk0sMBXuUlDkGdrrlJM9qABic+vfz5BkHLKBj+GpCFk0K2
 DH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVZZ17cW0EmuZRh2nTo/dxOsOvCo68gbOMlI0qg0Oes=;
 b=07d3ix9aGqBTsvB0ub4Qsa2toWy7WqrsskpN+GzAbzTrbjTOvLoIvmMEHeRPctaoRq
 ijUorLDm2h3fYBJGmtvy7CEUqedxXHrKi7linoNy2Sws55EXP6eAKdZfsfb+kyOuSiyl
 7j9MKfFRX+ldxKWvBL0mi16h218iGfgHT/MlmSdleQbCPOV1gzy2rAn9h6qivtk9w6/d
 RBEZlRkKSuEe0iDkc/1qWS6Xc4oZ6RQUvSWNcF2vFVorLRXYYxQhvBD6G5URA1c6nsty
 a8M4sNE9XFZMKDzzmSZ0qP6M/9UmuqH4lmy14CSN4IwFXnOY7SzdBePG0u9PFXXNjzCh
 9odA==
X-Gm-Message-State: ANoB5pnALZy1zexi9tUp62xDx+E6Ijy/zUG7vgYKhYfb3BtozAnhJ+CR
 rWeZlgp2WE9VgBBtgH0k/MDGGA==
X-Google-Smtp-Source: AA0mqf6lF43siP7A8cs36cAr32BfjPsWC/tEMDD+5bQ4FNR5cgq2SC2e+dr0o9VhXGZ0Qy5V7AFotQ==
X-Received: by 2002:ac2:4e07:0:b0:4a2:2a60:ecf5 with SMTP id
 e7-20020ac24e07000000b004a22a60ecf5mr32619085lfr.57.1670443572075; 
 Wed, 07 Dec 2022 12:06:12 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a0565123e0a00b004b59067142bsm474079lfv.8.2022.12.07.12.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 12:06:11 -0800 (PST)
Message-ID: <fc1b64dc-938e-0bb2-ef28-c09c7ec17efd@linaro.org>
Date: Wed, 7 Dec 2022 22:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v10 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670432278-30643-1-git-send-email-quic_khsieh@quicinc.com>
 <1670432278-30643-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1670432278-30643-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/12/2022 18:57, Kuogee Hsieh wrote:
> Add both data-lanes and link-frequencies property into endpoint
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> ---
>   .../devicetree/bindings/display/msm/dp-controller.yaml      | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..c4a278f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -81,6 +81,7 @@ properties:
>   
>     data-lanes:
>       $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true
>       minItems: 1
>       maxItems: 4
>       items:
> @@ -104,6 +105,15 @@ properties:
>         port@1:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: Output endpoint of the controller
> +          data-lanes:
> +          $ref: /schemas/types.yaml#/definitions/uint32-array
> +          minItems: 1
> +          maxItems: 4
> +
> +          link-frequencies:
> +          $ref: /schemas/types.yaml#/definitions/uint64-array
> +          minItems: 1
> +          maxItems: 4

There is an issue here. You are describing the properties beneath the 
port@1, while in reality they are found beneath the endpoint node. See 
analogix,anx7625.yaml for a proper example.

>   
>   required:
>     - compatible
> @@ -193,6 +203,9 @@ examples:
>                   reg = <1>;
>                   endpoint {
>                       remote-endpoint = <&typec>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000
> +                                                  5400000000 8100000000>;
>                   };
>               };
>           };

-- 
With best wishes
Dmitry

