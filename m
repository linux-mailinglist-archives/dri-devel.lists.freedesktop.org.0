Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6674245B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A35910E12F;
	Thu, 29 Jun 2023 10:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BEC10E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:52:29 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so795934e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688035948; x=1690627948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UlNJGPdeRLhuq8bqjnDJ0UiciWKAic+2KZiOlQuvC6c=;
 b=DamM5VZs/lO5iA4xZe2PrxnJR2N0IAzDBmZowkeJ/lZnCEYhFxUjB6J3gqc38TMt67
 Oy+hyl/ymZN1R+F5AsKuoQsMsmcGgmH3AYAkYPoiEeWfLMTlNPaG5r2a4CXPYH8orfqf
 aERr2DgNX32sra+awK6jIcDaVWFR6yFE3Xeu2wrX5Sb2Ky7uz4ZKw/1iIQ2rVBGtPPJX
 q2JaB+P51dBu1B8tjuTbiUMxRAI1KLDWqZfDkBz7bcERf0SqUD2BAiSM5NMUPi47NBLc
 te1YNm9E8ijgKlDYPCLIrHyGqbTACN6Pmdh+UP/g6nKe1vRbcwYqwWwWEYqop0bxVthm
 RvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688035948; x=1690627948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UlNJGPdeRLhuq8bqjnDJ0UiciWKAic+2KZiOlQuvC6c=;
 b=brcUZfKTkflRUhdimK6qHV8vfh/WZi38r/3xyd28pUe2DH01X/qjNgzCzy5BMifRo2
 b8TzcDW9uIm3mPGl8lbBfV7o3oZxjmMzpdeA+VJGwroe76DnWy+3cwKeMb/jwtbq87ic
 uPjcOPBAWcasJiTpNEeFcHkZo1/YAyXPYZOujil22IgDt8nRyd+JE0ccShA0H5iGXP2R
 shK5Nvwpvf+dmdgIIaUTjqb7UwZH3zDVHDWg5/LljwQ8zcuhkmAM3IvUkR0WB42NNLBN
 QzvmvAaE0dLV9QejzNsNgw302wp5LcYv5BFis7cOSeh4exzB4n8FJx97BaLj2iON4QpO
 BRBw==
X-Gm-Message-State: AC+VfDz4Qxk5h4skOY+abrzbD1uMxwt5kIqmXbpTRaU5RxQUVWTgX/0X
 TluFLvcex9uHg3fsl3NgCnfKVw==
X-Google-Smtp-Source: ACHHUZ4dABRK2BfrjLDu0qPtXKOPHueOULm4fXuKzIBieK4pOQhtBj+Ysu2v1iw/uLjYljBUn8tpcQ==
X-Received: by 2002:a05:6512:3c81:b0:4fb:73ce:8e7d with SMTP id
 h1-20020a0565123c8100b004fb73ce8e7dmr9458729lfv.15.1688035948080; 
 Thu, 29 Jun 2023 03:52:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a18-20020ac25212000000b004fb8f4df9bdsm655205lfl.226.2023.06.29.03.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:52:27 -0700 (PDT)
Message-ID: <a4ff3447-1e4f-7877-6f2f-d90b8cb8184e@linaro.org>
Date: Thu, 29 Jun 2023 13:52:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 09/15] drm/msm/mdss: Add SM6125 support
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-9-03e430a2078c@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-9-03e430a2078c@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2023 23:14, Marijn Suijten wrote:
> SM6125 has an UBWC 3.0 decoder but only an UBWC 1.0 encoder.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

