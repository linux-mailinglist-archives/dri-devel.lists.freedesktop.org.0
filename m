Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8156CCD8B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DD710EA1D;
	Tue, 28 Mar 2023 22:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADC810E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e21so14180569ljn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ES7yv6OWA07UGsRQ2Qrre927PWBN2JgohrtNzcIojBE=;
 b=HPfsmfVOqyQrYeZFNtR9ISFrSIT1mgUBhydxEyEU+B7bRS4kGBNHDfg7e0wQcqQQt1
 YcS7H99Ul3KxFoOtWhs0zLyeNp1u5T1U1Ep/+TURz50rQ2dGAp1P1rs1dXIu+m5M6wiM
 //wwkUJQD5e2IiOJchjI/T9PIT2BbD1LZ+glOLJ7UIueU0liKPqpJevUjltWGP3JF/VB
 8hyGwRLsjathIop9r6mhBGD4p52HyOaPOUY9KSvDhrWmcekB8N8cTrAaxU5OaDz1Hi8J
 6C306PK0p/aAEJ+NVtAiYc3sWewWL5j8/M+UrteMTVorOCyjTylIw+xiDmo2rxinZuvn
 Ei2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ES7yv6OWA07UGsRQ2Qrre927PWBN2JgohrtNzcIojBE=;
 b=eQQ20M6/Y5aN0ETLYLS2OJ72B7+6poBCghU7P5+PDgfmDIx+f2YECVj2JJ3qSkLrhg
 8Er1SC3H891ziTKRGCpK0W+WtJNwMMoLgxf0dzs02Mx45W1E0FP7uE4njj+mGAUheGP9
 mEJw2xyz5p2EmahEnrdugf9zU6AFmHYEvFLO8ghb3LS7Au/cxodP+/9TYkNKQFiswQ7x
 FoaZi5zpOmbAxS+PhnIuqh41dUFnpqQYpFT9BQI0JE7SWh5AXdZf5R7iqc0saqImF3V7
 dzfiT5WkNIS04sEglDo0m3VU9fvkrNo6GNNMSS7EpvaA9ygDAFK56NCOFIO3cRPdpsjT
 Odxg==
X-Gm-Message-State: AAQBX9cf0hGU+mTVzO99h6KoJrbI0X+vtoEtYgl5yDaqM94AD+0KqYAj
 RJRKfwgwFOIBhbrPIW/xutb+mA==
X-Google-Smtp-Source: AKy350bodgR/uNywBBZhoaq7ZTPqwnTdTPuEbN0vkQg40ku+hzIFmCQpIJtS/oUFmTzLhW0qTCzE/w==
X-Received: by 2002:a2e:930c:0:b0:29f:3e2e:fbd0 with SMTP id
 e12-20020a2e930c000000b0029f3e2efbd0mr43107ljh.15.1680043091058; 
 Tue, 28 Mar 2023 15:38:11 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Date: Wed, 29 Mar 2023 01:37:56 +0300
Message-Id: <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
> 
> This patchset is based on the SM8450 display support serie at [1].
> 
> In order to work, the following patchsets are required:
> - PM8550 LDO fix at [2]
> - DISPCC driver at [3]
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: display/msm: document DPU on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
[3/7] dt-bindings: display/msm: document MDSS on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
