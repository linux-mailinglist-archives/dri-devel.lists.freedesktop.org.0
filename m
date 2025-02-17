Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0FA38BC2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 19:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1FE10E5B2;
	Mon, 17 Feb 2025 18:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AVnpSC9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7326210E5B3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 18:58:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso1844328e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818707; x=1740423507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
 b=AVnpSC9n7/9vadi9DJP5hMNtEWfND96llxtFtYa0WhPnZN3tXncYRBRWsqdsPhJHec
 jCjtLWTHY3Op41hXqeVUCYnbXszVqbv6jpQV4ALl5Os88v6+olK9GcDrYqVJHLAvekEk
 3DUIOaMKZ+mnScg5DcMCLeAhyWyjeukBJWAc9kTCX5eG9l7F84iZ9zn2YdFtJUg9Nm1S
 saJYpBULqUnClXVtrxhlmt/7S03jrDhlWbHXgNtfnEDG7ql95ec8f0yVKYAK51PT+HNM
 0+CJwjj40NNdw3cgvc2RqY9OlfxVSR/zC6h6M2jFDiUDyWzskg4s0ibXluzX8lcEp9YK
 faVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818707; x=1740423507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
 b=Uo9eNDQR+zoaNkrK5a6x8juIjrNrZssJHspGvM/sb7+KHUrmvlvDR8onXuKmZXoqm5
 wuioR5GNNGLNtCAgdOCF6bDYJQZlvMAx5+07iAmC7n5c8/oOQyrHIdlr2kTWe3HohMle
 rg2xNEGdtlBkxw5z/vTEIuMSbM7SRlWG6d4weKB1f3I7K6onJjHQKVCqZ4PK12jfd02P
 h3E8YXFV22USUJ4bTQv6gziEcTU0Ybmd+7ofmurDJ4C9YIM6474T62YcX77c9O9kQHTb
 otErwb73uyEI6QdXA3dtBpD+zy/XXGq7ShFeuHXWW8zrdz1EhcCxO3/g4EEdpWT/CPxZ
 luPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvZS49BAh4ooe5eP1XBwoV5xuxiL1+v7+xUErX17UkZHpSwhTun0RzC6JPzzUzurvnUC3LAsoppgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx65W/aJmoWgtrKUjv9m7XswPrkWkwniPuAqXKbwJ08szgRCk9K
 cRe5smqEwBkh7pbWqzrhTlq63o1rUz6Faoi2/0Z3275o4RMlz2SnojSyphQ+kec=
X-Gm-Gg: ASbGncu+idBR5Rb1flbWy0J1Hmrwbhk2eONcD/NnErhqaxIjvsanlLqcb1QqhreuVbK
 gUNOpOEtjIhke6rVM7X9R5qunbKaH/NYJHkxHJcTEPOVeNbsLQ8c/aTwp559G6UVGQvhhnm0HMJ
 IcAs8MKIdRRM56rGaRMRdYC3zkM9+Kl0MR6IUvUq8DIqxs+HCxFRrvo6lJ/krUmqge59qBcue1X
 3gn3+7FoBCPn7wG9HWIF+JSsd848QQQ8SUlcYdYh/bM+wwzLTkrMk2cDUq8n8KSkG9td8hfWCdp
 DkOMIvLGSKe6Y+x/vUpw/WRFH9bGMaY5601yMCY3wmZXN4Epv9STAu4PuRYTNj6ed8U6N2M=
X-Google-Smtp-Source: AGHT+IEeMZ8fqELxvhpQNGcI5FA5HN3p7pDhUbzSFXQMFatRwo9m4DM5TDLR93eSFY/NJzp3zGXAHg==
X-Received: by 2002:a05:6512:ba6:b0:545:2c6a:ff6 with SMTP id
 2adb3069b0e04-5452fe450c9mr4006392e87.16.1739818706708; 
 Mon, 17 Feb 2025 10:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452f9aac11sm1131324e87.231.2025.02.17.10.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:58:25 -0800 (PST)
Date: Mon, 17 Feb 2025 20:58:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> fully compatible with earlier SM8650 variant.

As that became a question for QCS8300, does SM8750 also support exactly
two MST streams?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -37,6 +37,10 @@ properties:
>                - qcom,sm8450-dp
>                - qcom,sm8550-dp
>            - const: qcom,sm8350-dp
> +      - items:
> +          - enum:
> +              - qcom,sm8750-dp
> +          - const: qcom,sm8650-dp
>  
>    reg:
>      minItems: 4
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
