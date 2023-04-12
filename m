Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1A6E0060
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C0F10E984;
	Wed, 12 Apr 2023 21:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51CE10E982
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:58 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 q5-20020a056830232500b006a11eb19f8eso5506042otg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333438; x=1683925438;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xhMw93yysyOYrwKp1hI3dRgsA4+S2zDf16pTeQ0jQhE=;
 b=iDDTozLA1kl8M3k13t9Jfb+ungVbdr3MNnvy1Jodz8A180bsnf6yrB352g9AsOesVM
 sQe2LNyWukHwirrtUrjBJ/9Txw02nF6aDvrZttcKAroxo3J1lzV5wuPRMsRxofMLZ3hT
 KI+dbHlYbi/nUlqE8B6q2OunI2oC90fovem3dkMlrlISOqmOj10rhT/qeaxtlpHJFK9A
 P+fEk4jy/JC1t1VTCRUuOLvTAnrSkx/7pblaAZqhk9K+hCe3G9WCKTWfvMS9BZ5EdVeT
 s3Pg/9/0G33rLahA8cBlRjusrN84jJk9jE8TXTTk0VHR86al2RhExYzEm2sSsza1I3wg
 7wLA==
X-Gm-Message-State: AAQBX9dpoKN8tZNeYz3tR2S+7n/4XDUC3h0hibCak+n0zqw+JOGXhedL
 reuDwG8xF2gwdgJoJdx+4g==
X-Google-Smtp-Source: AKy350bDX+UH3xmkYuUvscW0CL6cCSZRAiDFFLGLOqiUOEqq1NjVCfl2xG/WT5gMBlmEZh0qKgWGKg==
X-Received: by 2002:a05:6830:146:b0:6a1:3101:8e29 with SMTP id
 j6-20020a056830014600b006a131018e29mr9619627otp.18.1681333437931; 
 Wed, 12 Apr 2023 14:03:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e26-20020a0568301e5a00b0069fa776d3c2sm54079otj.18.2023.04.12.14.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:57 -0700 (PDT)
Received: (nullmailer pid 3200535 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319439.3191194.3289065027670891182.robh@kernel.org>
Subject: Re: [PATCH 07/27] dt-bindings: display: mediatek: rdma: Add
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
 xinlei.lee@mediatek.com, kishon@kernel.org, kernel@collabora.com,
 jassisinghbrar@gmail.com, linux-pwm@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org,
 jitao.shi@mediatek.com, houlong.wei@mediatek.com, chunfeng.yun@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:19 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's RDMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-8-angelogioacchino.delregno@collabora.com


rdma@14008000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

rdma@14012000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

