Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704857BB71A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 14:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBCD10E4DC;
	Fri,  6 Oct 2023 12:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E22910E1F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 12:00:16 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso2516522e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696593615; x=1697198415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gcUqK1NW/dA5bg/50jl0q11SkwovBNOgvNnB+Ups9ZQ=;
 b=fnbBDKZY1h6o1Xi9p4DsXktqwsVpRqihxhl128YbLnfvR/PFgM73dGMVKYqsN2Pm7K
 fZSAaphw9d+1weTG2eTtcOZB+WMLuR/Kfe/Imkk8okjfEDoIfJrfE4gjfQYWV0XJe1Q+
 w07lXb3zGxdqZpZ7iq8UYET/lUVSVNMb3tbdx64wRCPhCuu8OiO5Mt5OQImfGoQCCTe1
 M+9fgrDizezMLyeVPERcB5tYMf60HUDjRZy+qPZdr70I54vPAHbMOQx5pZMyGbKuVOgT
 KpK3llW2srEAIPI9TLvHCr+cHSpt0Zuk3gRcpJoC4CEYVxKfqL3qmsYnumX3jgnjyA0P
 vLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696593615; x=1697198415;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gcUqK1NW/dA5bg/50jl0q11SkwovBNOgvNnB+Ups9ZQ=;
 b=aKKDGD+iW9uh0Um6uKPzXfW6wQfoyk/TrmgjgB0bLXe/5XUGxxEOYZ0rPrXL6nr2lR
 FcPBbWnIx8IzqUOMxOhAUewFiFs8ZEHVVdeSgZcYcpBpMtqA1lpiocxHi2EH+kyuK8wU
 KB0uvlGfKjVv4qF8XZTY4L9VBk0Adq7vAeB5hdirSs2Bnfx6eQmaBRB4vmkLaAQ7lGyJ
 ZBglGL2VLLeyhkPKR/Lxly3rSLTs4toEGpwACt5NCEeEFWuG7vSY/3hoJ1oIeRtrSWph
 +bk+OR1r2dTBlzYHxd3rNXF6/aerAuct/LEFQdpTkFKysz3q2e8k5wS5qojhTy4K8LEv
 sNUg==
X-Gm-Message-State: AOJu0Yy6aFR6U6rdtBp8bqJjMoOW1ZO7qbysKzRuqLGDOA3RVwRUxq+H
 zEsIKRvY3JmYh5S4sPV+Pxuf4g==
X-Google-Smtp-Source: AGHT+IFJWJNl4YXCaP30ZQCTHcwBJawdDelacTX9CWxRzhZbAxlknHF5JhucrQH8GQCOvS2QSU/D6Q==
X-Received: by 2002:a05:6512:e9f:b0:500:d960:8b6d with SMTP id
 bi31-20020a0565120e9f00b00500d9608b6dmr8796566lfb.33.1696593614656; 
 Fri, 06 Oct 2023 05:00:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a19ad09000000b00503fb2e5594sm275387lfc.211.2023.10.06.05.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 05:00:14 -0700 (PDT)
Message-ID: <5eb8fac4-36f1-4515-ac83-0051cce275f5@linaro.org>
Date: Fri, 6 Oct 2023 15:00:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/msm: mdss: add support for SDM670
Content-Language: en-GB
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin
 <liushixin2@huawei.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-13-mailingradian@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231003012119.857198-13-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/10/2023 04:21, Richard Acayan wrote:
> Add support for the MDSS block on the SDM670 platform.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

