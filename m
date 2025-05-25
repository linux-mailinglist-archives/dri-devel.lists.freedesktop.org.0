Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3419AC33F7
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 12:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728210E0E4;
	Sun, 25 May 2025 10:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="IGxGFoKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804C10E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 10:48:57 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7c5e39d1db2so68995185a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1748170136; x=1748774936;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
 b=IGxGFoKJgyaSTEpGa9p0mTTzEK96QdEzHjwcB72v4KG3Vb+rWciM7v7TOFnmKmWJM5
 vIImW28j8dlQ8guTOnTxeXhvl1HU1Jeuk6CXA5wBXuiCCiUTtmW8gxDbG24Kh9W51KNM
 E7wk/fAUmwe6ECmYixu6kW3nGxG2JQK1GRZStsGDJJHbmrUbVSkGHdP68UM9ube7aKQz
 PMUtu9NH3vdMqpJvZJvkF1xlCGcPiQwaW3FRux19bnIDaqAaGPuMp4iHGdQbiv3IVzIm
 r1rSNqTCpaJ1Of2oPg0qPY5fadYLkDdXvMu7C9vW8LeN8mHYk/oLXUdxtEy4VyrTDKqq
 NAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748170136; x=1748774936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
 b=KO40gViy6ZkNSvpRcU6eyuOcG+vE/TRIiImcitq2Bf2ha37EP1IiJMBklTRgxtjgyh
 v8PfJ9c2IhEX/sCNSYJX+D7Uv3cKpcoe8GPvobYlZp8ww+hxGkYCROufePMQfQfHtpa7
 0EvoS44GRMapxXWzNB8nmCbGohejMV9LYKKBLsDeN9hy7Q0Jso2ut1Wf7jYMgeXG9/k2
 x+8aYL3Hd8ylbbyVAsHW9mhzzWKv6zZEbwDIz4PHZLSqSlt4dUTGNJddOf+WKW0MAXEb
 LJVxh+i7nqG7q8fUvYIFLM9J2wpLB0ED/3XxNpckHRnVbh5qiO+g4AKl7G+c4g/mHDfJ
 nRMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK7nD/oqxwhqSrRW/JunUcdn/x/KyPThhZZi++lagqWoTORmcfibks+s+58DUs8ouv3NejUoElpF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn7Nntpfddul5MEqZUWzK/ygDn368C+4BlZZJtBPID8mNEXfml
 0HT8TEmteF1tCWeuEPKzJluA66EUeETg2J98thSjsiHspqRwyEiwZP5G+s+RzClbTvSAghjxN1l
 idbtJ3CLG1PzQcqdcs7SJEwtbpHgdO8WWv60e4miTkw==
X-Gm-Gg: ASbGnctv3xdUg7jXNU+7qDCSaqyuySrowXHNDpaRhGW+UGSRTYqLJsh1QqEQgwCwITk
 lacbFYZngQ0+fVprfRuvFJ1Zl7fhBH5IyPHpAHCmz4Yz5LiCHJIUCh1xgPofyE4iKaLQOQjk3Kv
 lCo32wTjizPIBQDgiXLvTUoYdELXDPoPj5bgJw2qyf
X-Google-Smtp-Source: AGHT+IHfLSQWm00np5MOUI9iSgjHG0uz8ZjLmKg3AyhQjzrIGk08erFcga0ZJK90E1+3HR6kZwenz2fYr+3ziRhndi0=
X-Received: by 2002:a05:622a:488e:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-49f46750736mr95207921cf.19.1748170136440; Sun, 25 May 2025
 03:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 25 May 2025 11:48:44 +0100
X-Gm-Features: AX0GCFtHF5h48b9Isl1N9tQLNjTjzN8BGszS3KNow9_vXa4svv2OiPk4eOV2_U8
Message-ID: <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -45,9 +45,8 @@ properties:
>        - description: OVL-2L Clock
>
>    iommus:
> -    description:
> -      This property should point to the respective IOMMU block with master port as argument,
> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +    minItems: 1
> +    maxItems: 2

The comment removals are not documented in the commit message, and
it's not clear why removing information and references would be a good
thing.

Please see https://www.kernel.org/doc/html/latest/process/submitting-patches.html
for information on how to submit good-quality patches that can be
better reviwed by maintainers.
