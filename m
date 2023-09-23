Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55727AC3C7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A2010E03B;
	Sat, 23 Sep 2023 16:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4969A10E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 16:44:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3231df054c4so136605f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695487442; x=1696092242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
 b=pk/MxYqvF28L7IqRdRCC3DGrsdFY//avIVYUnQ6ZCKmBvspFbnVGxK+tTX13VnDykH
 Py5+snfHBhi1Nia2jaH/QB3Wrx396USi9na0Cv6c9QGA7jy4B5OCKiFv2mbVtm+Q/yBu
 brOFpU24vtp9sU4KqqCLuv80YK4NXr4J+ZmFLOU4QNOO2xTosdv9uXocJySmmUatgQSm
 yuKvy6tFQUSLREXmMFP6qnMJXaJpzL9+PasIYwp3/7sm7T/XoX1JK8+gO/E90obNDpPj
 v2tvTruUlv25EUwVLMorj393WMKWAy8Eb3Qnhcq+jjA4nWXVKTLtLbySHRJySLTBszkd
 mIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695487442; x=1696092242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
 b=OE0DeFkrjIng3RcBQPwYSalPMhkEq5XCp1NedkBbusiHW6ysP63UI8kSHrHzgNaZrr
 HyR4T4rnZ89Tz+VXAl+LZCqJ0V4/r2OpSDf4b1hp5ooNkHUeZz24zr4O3e1K0/euJdws
 zXEqpS4eBmaAf6bTjRcKIXpxS1h/nFu/upqwSUui4aSeMEoXNABJ2xac9QVZsD/Mh8t+
 jYejI4e3Tq7cUElbSmYL7rzT4j1+87G2WndE40Gtbpx723mx+3JqGF5NRJIS1l02Lx0C
 AdgicOutDuJgzVB/4v8GUGC0SfiU6b0FpfGE57aD3wPe6Qczt7W53BsXiIB6iJ2Gh6wR
 48KQ==
X-Gm-Message-State: AOJu0Yz2HaE6lCH27VypJqTQjue4bdzrY4T6mc1wbKZCDC6spxI8v2/I
 TgWdVIbuWQUBgot4KHM6hK4uNQ==
X-Google-Smtp-Source: AGHT+IGUp9vWURoqWCtTYN6CKaYvUBZmRKeL0YoxcxOlYDVcQJOgyOxbi3Pq3R8mE4CSABKxCOgFMg==
X-Received: by 2002:adf:fcc5:0:b0:320:b2a:4ea6 with SMTP id
 f5-20020adffcc5000000b003200b2a4ea6mr2618848wrs.9.1695487442674; 
 Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfea87000000b0030ada01ca78sm7299990wrm.10.2023.09.23.09.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Message-ID: <4e21d965-b7b6-8b2a-5e78-37b9da69b2f1@linaro.org>
Date: Sat, 23 Sep 2023 18:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include
 common properties
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-4-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-4-moudy.ho@mediatek.com>
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2023 09:21, Moudy Ho wrote:
> To minimize duplication and standardize the document style,
> include the common properties for MT8183 RDMA.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..0539badc9821 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MediaTek Read Direct Memory Access
> +title: MediaTek MT8183 Read Direct Memory Access

How is this related to patch? Why rename is separate? This is poor way
to split your work.

Best regards,
Krzysztof

