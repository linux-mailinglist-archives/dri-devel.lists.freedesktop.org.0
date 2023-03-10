Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D396B38EF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA2210E987;
	Fri, 10 Mar 2023 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902F010E997
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:39:54 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cw28so17443259edb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cdseOTNh621EKmpqbEpL631jgufcpzaPsbaGb0u5w10=;
 b=gv1m73ZIi7XGNzWH+OmD64J0OzTplBXcQSocEEdL2QUmF0AXQ1/9bWH80ddM5j0x7Z
 KZ65c7plre85naGIZQLNQanh4M7XodTboeoJ9a8cIO6kGMVFzmj7eMFCM5pHb3Eqjo9t
 nu0fhxWpaj5gHZA+86rt1HmcZXmcfwcRlCN1whV+sTYxxeKikocOrbz0wY8kGawHHnP8
 BwyPuAzbyULYajWk9kjidsl282EpSPx1hdmdFpVx+vnWbKiZ31JY+JuwWKVACeM0eH/o
 PPz+6c0YpmBkSVsyvl/TEEoLjyBki/z9UkLQ7W6xptbhM2R00/OM0GFXuMuqf9QNSPLm
 Mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cdseOTNh621EKmpqbEpL631jgufcpzaPsbaGb0u5w10=;
 b=yCypIYnuBICbqE/igX+E9yie15NlZQqWirdUgMS4eUP1T7HSZ1llIV275J88juHA4H
 GNby3TgMGjt1Zd/E0EzQLFUPTIghbFVSnG2GMJj0kFK7nLEnB7YIPc30yOfl8qo5Q+4W
 5TXoQcg74enJa6lpUh6Fj/+EjtrondSc7nxW1EJerl5np7ehfYkHs3FiHkElwkyZyO7B
 +2sv/BysUcPiSSyshYnSPo1HMkeueIp7LNiJZY2zqJLVPC/n9m+Ng1s9owltFoOBAtsB
 QDiiUZKr0V+EG6UN+XU0wZ110f7ABYksL8ONhprxkwZ3ncyvzhpshp7woB3C5FONgQEh
 dwRw==
X-Gm-Message-State: AO0yUKXqRoMxmByY8zeVcDQjc7L7vllL1b+V3pGQSrj09v+w0IddR5KJ
 3FsQj1N1aqO8qDQjBWVgG/r6rw==
X-Google-Smtp-Source: AK7set+lxQhevUPXYKqS7jtxNCvms4/+advMJ1dI2u0ZlQIAtqX95l06i6g/8T6Oo0vZH3lkYkCzfA==
X-Received: by 2002:a17:907:3f90:b0:878:711d:9310 with SMTP id
 hr16-20020a1709073f9000b00878711d9310mr27459148ejc.1.1678437592913; 
 Fri, 10 Mar 2023 00:39:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 dt22-20020a170906b79600b008d47cd2edfbsm684140ejb.60.2023.03.10.00.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:39:52 -0800 (PST)
Message-ID: <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
Date: Fri, 10 Mar 2023 09:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index ca0ca549257d..931d66893dff 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,7 @@ properties:
>        - mediatek,mt8186-mdp3-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex

All these look compatible. Either make mt8635 compatible with something
or even rework entire list and make everything compatible.

Best regards,
Krzysztof

