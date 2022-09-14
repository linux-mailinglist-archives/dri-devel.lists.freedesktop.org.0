Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EF5B9011
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 23:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2AA10EA05;
	Wed, 14 Sep 2022 21:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1110E049
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 21:24:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso3180499wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cgZkkoB1Bz/RFAHmuKSBre2q5MgmdKHQaadiUhQuwwI=;
 b=FdPcRIe2gfQoQCjx1QOFkmGSVgwgHEsr++MZRUCMzJE3Gcaf5+etZRi3EQbCidd10v
 twQrXPlzLivRZUJ1R+dE/qZTWuiVHDGNr1ffeusOuRSHuCA831r6P5sya+sS7wXO6DLy
 SgrqggAbmAZY6ydB3BLwpozplPD3Ts6GR2JPVAt6I80V7plsYzFai0lLopZcp60+Dji2
 9eHgVLAXCCoRLe7zo6ZiFvzrmP89NLmmxtqP779jY8gMZcd+pPwc0NzBVDJuZ4g2ppRw
 FULL20YpZmoqhpUD0AK7WVHOIYg4hBzRGEX0XcxR+alvdpo56XTcGW62njpb3ejILjOc
 SG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cgZkkoB1Bz/RFAHmuKSBre2q5MgmdKHQaadiUhQuwwI=;
 b=nYK9fVowgsWdWXPZP71FHFGeBN4atpJRiKsgZ2Ann8AsBE6Vw1cAsOEIc7WCe+gyCo
 VO3Px6lHu/bsQeLFBiunkzreglfMQWhDlKQLTLtdhANTIljVEp65yryYfCYd3ytGkGzo
 sYPoch4hG8tbQtAJWyOPXP2a3AOjjFDj+u+nrTJySQco8wQKhaVFRXJNDtVqIf5aUB9S
 LuVKui84De6VOhwplifnUfglVabdAUwHsgodrEgc6inTszICOlFibCRMlCw1BWFo/maH
 n++XWPUcCO4Hq9QRllQnHJPPp+ZHu2z0bscNH47jzyBBLB/+GbbJbDayfrTh8rUsbVJ4
 WF3A==
X-Gm-Message-State: ACgBeo3N5PN2G3i/AowtQCZ8y2pPfs/s1PoPALqToEbyme1cp9RoCSsM
 nqrEO3guAudrvudACRZ6EmM=
X-Google-Smtp-Source: AA6agR6BDx5TGK4RjiRpwjFmyhCS3CrrcO0KEfqjytiVgYBb1lg3M4YSvUYYT25pLio+NHumVC6uEQ==
X-Received: by 2002:a05:600c:6d2:b0:3b4:8361:6154 with SMTP id
 b18-20020a05600c06d200b003b483616154mr4648444wmn.89.1663190644349; 
 Wed, 14 Sep 2022 14:24:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b002252ec781f7sm317708wrs.8.2022.09.14.14.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 14:24:02 -0700 (PDT)
Message-ID: <1b739216-8bb1-162b-1af5-24acba7324bf@gmail.com>
Date: Wed, 14 Sep 2022 23:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-2-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-2-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/09/2022 20:23, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I'm not sure Krzysztof gave his Acked-by tag.

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..a53b32c0a608 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -32,6 +32,8 @@ properties:
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8195-mmsys
> +              - mediatek,mt8195-vdosys0

As I said in the last submission, we should make mediatek,mt8195-mmsys as a 
fallback of vdosys0. Actually mediatek,mt8195-mmsys is only used for the 
fallback of vdosys0.

Regards,
Matthias

> +              - mediatek,mt8195-vdosys1
>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:
