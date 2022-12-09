Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224A647F53
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEE310E502;
	Fri,  9 Dec 2022 08:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4610E502
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:35:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a7so4185776ljq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 00:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
 b=Dz4L0SfClKX1bHZ81SYcCTOpqPl/TgBLy411jpBd64n3fzciV3rClVWbCDT5GZKmRV
 PP4eUU6/sz8gWqwRx4Rd0yI72rh+vELPXT2Vj4pq1Eiklx1jHNFD46pZnTX9BxP1cq91
 gHfxpu3JJ953kXLi5spr8CtCUdp5Zzc20A75r8x4yZWWNFxTdSjMs0H1I3pex/PSX0D7
 SIN0VvErlW0bTBtizX/T8Q1oKsAP+7wel/FagaS/1+bkt4lue8Aa+gaYf2SaaugUVVB4
 DrH+xVOGbM3EFQmO5KGIZsY2wk2V7cbA1Bl2BdHImwOkn0Sjl09w90hMyf3SKtPWUpq1
 m0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
 b=rM1ukMaRgcd8ZzyE7csz1xl0h27vs60kQfwP7TdDy7eIUnekh5ZtToFf18OQEiwp15
 Gu//ipYPI4u6y1tCAqG5zwjb5ItkwpXmAeVRjSwiq/COmtabbVX0t0CnMxFPWD1nhIQf
 DLaH79KY40RfDvNIrz7KG8KxrA4/k7oZPVBtRxv/n9BwS9FJkbYqC6GwXD6nr/jnl51D
 tGMOKPeNKFyyDqXXz71gP4q9VTrCbGom0CFb3IejjMTvPmfaKVNwE3Vz8LeLYYVAfHa0
 0zLm5/C7ecth/T44t90DfVdgC4lzCAYBonxODM6ItRHBOEuu2vMh/T9mzbJwSgUrnFWg
 zAxg==
X-Gm-Message-State: ANoB5pkvCzNdmOgVdCSnxy9/kmr+R6i5JYPLxgy35AmPe0Zs0Lr/NITQ
 NLbGmFixkmlcKNeqlnTrQmLP/Q==
X-Google-Smtp-Source: AA0mqf4BnUchN5dAKoDAdQcRawUxcca7TShvvAE+vweS7atuhK1MMnvaPvUhFPB+lJePI5J9QSLU3w==
X-Received: by 2002:a05:651c:1187:b0:278:ea26:af88 with SMTP id
 w7-20020a05651c118700b00278ea26af88mr1713866ljo.42.1670574913010; 
 Fri, 09 Dec 2022 00:35:13 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a2e894b000000b0026bca725cd0sm131502ljk.39.2022.12.09.00.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:35:12 -0800 (PST)
Message-ID: <be4b57bc-2d1e-3bbe-b5f1-8a3946c2a9a7@linaro.org>
Date: Fri, 9 Dec 2022 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
 <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
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

On 08/12/2022 01:54, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

