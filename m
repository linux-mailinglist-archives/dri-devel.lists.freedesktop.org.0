Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F56E0052
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243E10E211;
	Wed, 12 Apr 2023 21:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A8A10E979
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:51 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-18779252f7fso3063989fac.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333430; x=1683925430;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FLw3uwkCeeUAAV03Tbbd6RIpAi5xQgVb6ft9jGrKTas=;
 b=cm6NtVAKsxZ2hRPnXjGYfjmWPPa9eNCgsCYLdku3ewJa9gS6jjxh0EvCvZKWWycp9s
 yKg3Ic64SVBmKu3sR92YjgYqKqQ0waLISC3F/KwUyRKI6AIvCfbIlciCzmF7fDCaM5LV
 aX0TATBnGKmj2/szHJm42moymNf/AjE4GkApN+5VF8NznGzdx8X/CwoAZxaH8DdY3QnN
 XUElZPdIs5HUTTzSohN0pfKpjuAniRR79rVTvBHTnQD2GiDrebGw5ScuyMdZOkXBJOsA
 pMAv5nVpOLkVutOI56tO1IFRfMguzsvD/4yvEiQ+x9UdwFwD6tVT9ZRJ55WzoPlhjF2s
 PByQ==
X-Gm-Message-State: AAQBX9e7YTzrOomX16GFXXuljf1l+dZbwPC9OiFKEu9x+4J66hva1rL8
 3Ij4h2Z4v5YnBIOvJqIgFg==
X-Google-Smtp-Source: AKy350ZSC5jj3xISsp6oFnvk6oBWEtks02c+F/U24WBNcLmHcB6s1GI9dgP3edZehcoihI5kfSHupw==
X-Received: by 2002:a05:6870:c6a3:b0:187:76e6:7527 with SMTP id
 cv35-20020a056870c6a300b0018776e67527mr202541oab.17.1681333430215; 
 Wed, 12 Apr 2023 14:03:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z21-20020a056871039500b00183ff6b45a2sm66090oaf.10.2023.04.12.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:49 -0700 (PDT)
Received: (nullmailer pid 3200541 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319930.3191493.4677860733560353143.robh@kernel.org>
Subject: Re: [PATCH 14/27] dt-bindings: display: mediatek: od: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
 xinlei.lee@mediatek.com, kishon@kernel.org, kernel@collabora.com,
 jassisinghbrar@gmail.com, linux-pwm@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 jitao.shi@mediatek.com, houlong.wei@mediatek.com, chunfeng.yun@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:26 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OverDrive (OD)
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,od.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-15-angelogioacchino.delregno@collabora.com


od@14023000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

