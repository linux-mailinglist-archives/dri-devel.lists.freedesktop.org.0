Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73C5622A5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BC512A881;
	Thu, 30 Jun 2022 19:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709D112A881
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:07:15 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ay16so40827157ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=piUvaKld1qnxNrwH7NkZMI/BexFhn+OSQaZXyTTeJsI=;
 b=eQw6FUbHKgkJq1YC9al1cNe3NQgmszYemmYaTiH1/rsAigg5ZM1R5g1fWZGQyi8OtI
 cZYdnaLOcyS3TdfPJaFd+QYRKRKQNA24W/PbMEyn4VQwLsEiRzf5BKAaW+lXS6t/fqJy
 pAI+SGeQ8kuqDVz24cIxREJAnuOSlYDQEqj/93nnnIFZ403sQwUN+Cvvu7H7nGkBTocd
 1R9pwmDlFrMy4o0/O5Y+ZK573GqPjvOOYaQ2R5JAMo13kgIZSDOofajkaoqo/H+05r0a
 n7iymGYTobF/QUFBZDqxebkdLVhUzKgsswOfJH9p7AtjBpOrKr44Ard2UehbZMAm8dwp
 tfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=piUvaKld1qnxNrwH7NkZMI/BexFhn+OSQaZXyTTeJsI=;
 b=GGY1neN/Jsrg+Mu5sN3Fr01/E0OhL/n01zcD73jdp5gYyrlQ3xaz90ozY+ewi2DC9M
 mNO+d7AUCIx+GYvwlVntn2weK5BWe7Vz+7ISMkqXmu+GxEiE4Vyn26VPSc51Zn8rILKW
 FJAYRtoqioeGExLP9Zk0NlWTxIV0zMfjjGKRElOa/RhQkYJ+pfGG1fU+tCrBtuQm3Iop
 pGpXX1Ynsw6CDEgAxx2ZWl6iZY+tDS4hjbjpY1SL1nDTNvcHuhUzugDMfvRrCMgigmbN
 34WsXBFxur2caqBUQ0/OxUAWe1D1ixr7/fFtOLMkl3vgDd1sEjgtgb2zU5nYMebSawyS
 oGWw==
X-Gm-Message-State: AJIora+vPyyYSVRP9Tokl6b1P8UFXXkEkLdtv0VCeGIgLJWAKbbUGJt4
 2pOXhmr+ZE3e4Puja/AEZBcL0g==
X-Google-Smtp-Source: AGRyM1sN9V+G1ISGzNAljgC1ZskGE8aiGAvRJTluEXUI/K/w5Rtck42hyZUKEfhoNWVmdkLfJ0jXlA==
X-Received: by 2002:a17:906:c151:b0:726:9266:ab90 with SMTP id
 dp17-20020a170906c15100b007269266ab90mr10468471ejc.525.1656616033978; 
 Thu, 30 Jun 2022 12:07:13 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 fi9-20020a170906da0900b00722e5b234basm9496996ejb.179.2022.06.30.12.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:07:13 -0700 (PDT)
Message-ID: <f1d3cd34-bece-c0de-1c3f-ed53b9a8118b@linaro.org>
Date: Thu, 30 Jun 2022 21:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 7/7] dt-bindings: msm: dsi: Add missing
 qcom,dsi-phy-regulator-ldo-mode
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed this one.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 9ecd513d93661..3551e166db966 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -40,6 +40,9 @@ properties:
>        - description: dsi phy register set
>        - description: dsi phy regulator register set
>  
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    description: Boolean value indicating if the LDO mode PHY regulator is wanted.

You need type:boolean. Didn't dt_bindings_check complain?

Then description can be shorter "Whether the LDO mode PHY regulator is
wanted."

> +
>    reg-names:
>      items:
>        - const: dsi_pll


Best regards,
Krzysztof
