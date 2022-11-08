Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D220E621B03
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85AD10E4DE;
	Tue,  8 Nov 2022 17:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07310E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:47:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l14so22193222wrw.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
 b=dhZDqwf14fe2j9UdiqdGAWf/ff1Enkmy8X7284TTYgt4vFS5oxwGlWCk44cjNOIWeh
 C7X1k7EWwaNcYfTW7s6c2Asy79xj6KnQhtDGuXcw6iRSMJnLb8BfC1BPXc+f1CpfS3xD
 lGHz09ZV17PRqZYjpnOERIqukj8eVPBJfhKQbBWMtYRHGTA2BqHThsVGAsJoCZH8Saxk
 dDc3M+rhEaszbLQntXKf7vAtyFZzlOb0phkUD/JBrSuEPQMbGR379flWMVr+i7RBWLq8
 IS6zMymo8wmzuP+pZh5NlJ7HuVoFGgidpe7eW2S/X4l4ByZdmR+JdBMjOyeIJPvKh4lp
 jVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
 b=b9e2oEgYBFcAnMbBaqM9sM3w9Py40Hlnes+mTgsLY8B1ZvVz9tEK0uglEBFbo3LA9O
 kr+KALxilgDborx77ND3xGMxDESJn9ueqLSBXZs+Tf9vRAWPqHT1Su6QAZRaDvLSpdvo
 MLrJfAMFAINuj3K81HrEKf9IgTDFYR6PquZmBHhrj8ws4rjfyUgbdf54GxNPPrCcB/z3
 fU+Mvw3O+NO044Fq69Zb7qGUJbraLnBnb63Z5pZIjaPmeU66eOjG62lOrmQEFoyNEEcO
 v9WDUirIiT0dcQShFlg2n1HH0HxnmXAEmOTJl4wEXUjNP4Yl/6QA+W4uj+v9+FCx9M5f
 gz3A==
X-Gm-Message-State: ACrzQf1hgXJJRK/mVeLacioEVC1mMkbjcTtR3J+61hXwMeTr4A0PlvoF
 xEyojek3yvmCD+epUzzS8SE=
X-Google-Smtp-Source: AMsMyM6KcCnDX4sMDQZ66dZ+DyYmTDlrlRon5/4mXWx4R8J1wOheJBCVno0GUU2uAy7tiO5R+7rzEQ==
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id
 m18-20020adff392000000b002362c41d3f5mr37236832wro.596.1667929620336; 
 Tue, 08 Nov 2022 09:47:00 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c35d100b003c6cd82596esm16687600wmq.43.2022.11.08.09.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 09:46:58 -0800 (PST)
Message-ID: <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
Date: Tue, 8 Nov 2022 18:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
In-Reply-To: <20221107072243.15748-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/11/2022 08:22, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..aaabe2196185 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -48,7 +48,9 @@ properties:
>             - const: syscon
>   
>         - items:
> -          - const: mediatek,mt8195-vdosys0
> +          - enum:
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>             - const: mediatek,mt8195-mmsys
>             - const: syscon
>   

I think we had that several times already:
https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/

We will something like this, but please check that this does not give any 
errors/warnings:

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml 
b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index eb451bec23d3d..8e9c4f4d7c389 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,13 +32,22 @@ properties:
                - mediatek,mt8183-mmsys
                - mediatek,mt8186-mmsys
                - mediatek,mt8192-mmsys
-              - mediatek,mt8195-mmsys
                - mediatek,mt8365-mmsys
            - const: syscon
        - items:
            - const: mediatek,mt7623-mmsys
            - const: mediatek,mt2701-mmsys
            - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys0
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys1
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-mmsys
+          - const: syscon
+      deprecated: true

    reg:
      maxItems: 1
