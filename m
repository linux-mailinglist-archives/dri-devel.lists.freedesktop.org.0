Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36896E0062
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767F310E987;
	Wed, 12 Apr 2023 21:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FED10E982
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:57 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 cg19-20020a056830631300b0069f922cd5ceso6152857otb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333436; x=1683925436;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=djvELGPiz2X7+nxWdiXWHHU3TDK+TW+pNOfsGeO7c30=;
 b=kXWQlAVbmuBfmtSMOEPhJYh4GWLpNYFRMlZHK+6zmb7whAYCJ/vbYfynxLJHdovBGQ
 SZ/hkHJuYbGV/BM46Coa1wmdRpGsdVAT9W6k5+pnCLckqLfjdq17Z7EIfgVOs+lgU/Gl
 CNLIrxos4TnuPNcbIZct1NDrVhegtwjTicU70Jj67cOOGNbBU438Nd+Ia49v0MvZZZ2U
 4Kx+JO3JCdt8Xu44fL00MnOMUwRvyk3mHtAzFg8mduU1kpZGhuX13n8stRTNlJQvMdi5
 ljn65ZO0b6c0BhE3cgAom2dJqEJt4l9PEdi0XSo/6cCrUTFrFkuo2qwZLXCgHN7FJbZa
 ZTKw==
X-Gm-Message-State: AAQBX9cnO+Q5dUlq3MthHi9KIcTFu4IsYaWbHYk6fKu2pSZshYWTwW96
 vBYLsr0j89176kxy8qEULA==
X-Google-Smtp-Source: AKy350ZPaxQqCIVs+haHZm96AVYtUTY7Qo26AYMJnx+qKKJp/dAi3OmoVXf+cund9KGn0KbJXB+BWw==
X-Received: by 2002:a9d:7d0e:0:b0:6a1:42ee:1f5e with SMTP id
 v14-20020a9d7d0e000000b006a142ee1f5emr6568051otn.0.1681333436323; 
 Wed, 12 Apr 2023 14:03:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056830019600b0069d602841e7sm20803ota.72.2023.04.12.14.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:56 -0700 (PDT)
Received: (nullmailer pid 3200539 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319867.3191434.734350328370744826.robh@kernel.org>
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
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
Cc: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 kernel@collabora.com, kishon@kernel.org, phone-devel@vger.kernel.org,
 jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-14-angelogioacchino.delregno@collabora.com


ufoe@1401a000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

