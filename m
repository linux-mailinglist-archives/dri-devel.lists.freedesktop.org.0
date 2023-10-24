Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5357D5C62
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 22:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE9610E4C4;
	Tue, 24 Oct 2023 20:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3710E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 20:30:13 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1e9a757e04eso89846fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 13:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698179412; x=1698784212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3qsgjZUiGkI+HnQU8qd10Dy5+V7e3QdrB1P5/64d/0=;
 b=fQ32JwvcIstk1u12KXR0aeEwuKcTaCACzSujrXb1cM0pUqH/vMlZWiC4S/BB2rvAzX
 DPF3/6TnjrWrgmo6Q+kafUfYUl55vJlXXh+U3zS750/CCJRQPcORA3du5ss8pWil258K
 PnrO/EqRUlpBCgQspXer22T6iP3nQRlU6lnxK08BuE1qYHHhl0U0nAEZvqG9hJvdbq03
 cXpdXxZElDSbwcKzlue6vG76Un7d8wIehg+rF+rw1NRq8gxkASkExO5u24EmO/0xGNvD
 QEy3qFOI8HazoFZdRVr7TCqXKKuQF4rapKPIuCToDnrH70yK5JezLJicSUWGmyQAIUX2
 ECLw==
X-Gm-Message-State: AOJu0Ywhiz4xC7kxcX7MhO/fuLCs31rhECQC/zVx+Uy/KCkYLA8R0yZZ
 DReWHCT0uVMCrvDo79o1Dg==
X-Google-Smtp-Source: AGHT+IE0whMUPrsoD9gh5o2IGz/Y8fxi2DnAYWxZTqLGtOQkx7r5SAEcn/I7BBShMQO37QiqQon48g==
X-Received: by 2002:a05:6870:e38e:b0:1e9:e413:b9d with SMTP id
 x14-20020a056870e38e00b001e9e4130b9dmr8879744oad.2.1698179412672; 
 Tue, 24 Oct 2023 13:30:12 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056870530200b001e9b02b00e9sm2285355oan.22.2023.10.24.13.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 13:30:12 -0700 (PDT)
Received: (nullmailer pid 520032 invoked by uid 1000);
 Tue, 24 Oct 2023 20:30:10 -0000
Date: Tue, 24 Oct 2023 15:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
Message-ID: <20231024203010.GA518520-robh@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 04:40:05PM +0200, Alexandre Mergnat wrote:
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 12441b937684..2479b9e4abd2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -34,6 +34,8 @@ properties:
>            - enum:
>                - mediatek,mt6795-dsi
>            - const: mediatek,mt8173-dsi
> +              - mediatek,mt8365-dsi

Not valid YAML nor json-schema. Please test your series before sending.

> +          - const: mediatek,mt8183-dsi
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 
