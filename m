Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C6E79C995
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90410E3AD;
	Tue, 12 Sep 2023 08:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391C810E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:16:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a33fd0dso38761766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694506577; x=1695111377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQQyuvgw2Ih8CCznL4czbdJi4u/aUR5st1Zl8jdFdis=;
 b=BdgHdzkeBp1W+GWsLdbWTL7g/UwHv+i2doadF0wIDpcRPhWCk3W/vRIMwgQ+1pviKu
 docJC3lDThwpqZ+JcQX7AfTImQ2iQeBmeAqtUW+43PjKJWM/9upzKKSWrUwVoUXXl7re
 9oALXQO29LaPsefUWDOT+tKwHTVxfXwHFT3JRA/ga/IMk6WsrKCI82gy9O06rva70R5T
 hthln+SpMLpVaWgJrkwlVFDlpB3PP4FfjId1G3lqwjEJCO2XwOVGYIkVSjhRJVi/sMRC
 rsViai6lg+q2t2eeBM9R9ekakC1AJw3ioIvasWZx9fuqFoo3ySy64A8kpNMkSoUZ8f/k
 ctrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694506577; x=1695111377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQQyuvgw2Ih8CCznL4czbdJi4u/aUR5st1Zl8jdFdis=;
 b=By/37U/z41t3ODAUo4YBwzW+LqNOvyFbgvYSK1DqnLj090qOLsvZG6S4RahhTatnGX
 RuXRJpiEeFpy/+e99ECNjRlBFozaK/UN5cQ+tbg3osNDxnQVsvPJpWPcFJoFbjyjMl+i
 +5x8uMsBw/TeINWr1yZDqexCT3N1+hrpMONZfF+ymHMcMkcBptsYnomr5UuYSpfiHFfU
 lz96VQEW1jUC8MGG42jXqGwOSJm80ArvxtsQVfquAv0oouArBdLaRsXwAlQ/smAErzqo
 pgfBbRMcSfb9mx9DaNbSwkbsCuj9tYgZrGX7cLJCiZEXEOwKPteNdCy9NeA8dRkFl2NC
 28JQ==
X-Gm-Message-State: AOJu0YxeIusA/wMYgxX6ES2rhc+JtEo6rpy2ODnmu7EwnnePyuzA3Ean
 ZCRn02aHP6a2Q5aJ/w9m+1W85Q==
X-Google-Smtp-Source: AGHT+IGnDIjB1E0+PM78RIHPjXSnqOuV7g/f+t4r79vgK/6WUopYnar+OQmHMaOMcvof7mrFdmwNsQ==
X-Received: by 2002:a17:906:8469:b0:9aa:165:aefc with SMTP id
 hx9-20020a170906846900b009aa0165aefcmr9205509ejc.33.1694506577602; 
 Tue, 12 Sep 2023 01:16:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a170906851300b0099297782aa9sm6357666ejx.49.2023.09.12.01.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:16:16 -0700 (PDT)
Message-ID: <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
Date: Tue, 12 Sep 2023 10:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075651.10693-3-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 09:56, Moudy Ho wrote:
> Due to the same hardware design, MDP RDMA needs to
> be integrated into the same binding.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

This applies to entire patchset. It is not dt-binding, but dt-bindings.

> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  5 +-
>  2 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> deleted file mode 100644
> index dd12e2ff685c..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: MediaTek MDP RDMA
> -
> -maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> -
> -description:
> -  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> -  It provides real time data to the back-end panel driver, such as DSI,
> -  DPI and DP_INTF.
> -  It contains one line buffer to store the sufficient pixel data.
> -  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> -
> -properties:
> -  compatible:
> -    const: mediatek,mt8195-vdo1-rdma
> -
> -  reg:
> -    maxItems: 1
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  power-domains:
> -    maxItems: 1
> -
> -  clocks:
> -    items:
> -      - description: RDMA Clock

This is different and you did not explain it in commit msg.

Another difference - mboxes. Looks like you did not test your DTS...

Best regards,
Krzysztof

