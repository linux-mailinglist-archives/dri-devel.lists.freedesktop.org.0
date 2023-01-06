Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6D660386
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6508810E87B;
	Fri,  6 Jan 2023 15:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DE110E880
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 15:39:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d17so1616398wrs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gdITn0BNEFwYE+yxhugbd2XPXZtNiB3TXaZnxOed4cM=;
 b=XAZHSD3rziy8mh+f+LxkAIsDMq75Ed2nYqzR5a8pLK8MdmDxNycMZo2uBSd+w3+tOZ
 jDO2BOkVUczCNMKIs8Jqe6CMdteBNLpuTtkRSKyXc+kebufsq046ykhjwHJCksQIjFNH
 Dex1OSUe0jwFTGJh6WWwiE5RB9x3eMXmpOJUlSwh4ck8oxUQx4pllvSF0y/mqIv24HrC
 XMW/+SEMAZh6KMeHjXh0xjr7LmBDg6IeOjEGSasnFcVJgi5PaBzmru0epLLF5nQuT18w
 id/+1uIfG4YIb6JEqiiWrsImoWSdY1tJWj7jDB/u2D/7dQP84kjFns7NYmFiyZSsmpHY
 6htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdITn0BNEFwYE+yxhugbd2XPXZtNiB3TXaZnxOed4cM=;
 b=H/AqmfIca4iqoiPgDM+TK889PPcMcYqebEhJKlXPy38SDnP1n8qI2A+TEcbaYrMYmC
 YZNBGrRY4aieMrlhMGg9Th1TfZVnJRekzGA1tp1nTtaBBQW1z4WAp9AodgcrV8mAnbJe
 yqBSCh87xLIEemSvedCF5LOXpit1tMAxV2jABClSm+ECvLRTo9ZHhpjsawW4evXa4Z88
 4Ulr8z4E+me1boLyXwN0iiQ+DmOMkySrt+GJdLOhG9Kim2VDajOroY9Iw83lV6Gswy+I
 AByKEApjCDhm0/GNEHCYV1dOqHmNOWfC8eOux1G0/S3SqWFWDXRpo22MPIjwKPNacbLw
 DXqw==
X-Gm-Message-State: AFqh2kr53hJF6ifj4FG7yGF9IJTeiFNMOvbuNnykH7onC9sUhKVhsh8u
 dczyq82mjhP0dcoFS5BHPGkOqQ==
X-Google-Smtp-Source: AMrXdXs/RYhlbOq3F2sJdykuBYlTqYFsB43Tc1Tc0FcoMHlw98bKEbw4cUWU/Q2XI1SyQwLrccM29w==
X-Received: by 2002:a5d:4ad0:0:b0:27f:43c6:9ab0 with SMTP id
 y16-20020a5d4ad0000000b0027f43c69ab0mr23839427wrs.20.1673019596308; 
 Fri, 06 Jan 2023 07:39:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm7466724wmq.22.2023.01.06.07.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 07:39:55 -0800 (PST)
Message-ID: <ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org>
Date: Fri, 6 Jan 2023 16:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 03/11] dt-bindings: display/msm: add sm8350 and sm8450
 DSI PHYs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
 <20221207012231.112059-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207012231.112059-4-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/12/2022 02:22, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index c851770bbdf2..bffd161fedfd 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -15,6 +15,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - qcom,dsi-phy-5nm-8350
> +      - qcom,dsi-phy-5nm-8450

If this patch was not merged (so far nothing in next), can we make it
proper SoC compatible?

qcom,sm8450-dsi-phy-5nm

The SC7280 already uses such pattern.

>        - qcom,dsi-phy-7nm
>        - qcom,dsi-phy-7nm-8150
>        - qcom,sc7280-dsi-phy-7nm

Best regards,
Krzysztof

