Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E396E0056
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E35E10E979;
	Wed, 12 Apr 2023 21:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91610E211
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:52 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 m20-20020a4ae3d4000000b00538c0ec9567so1957691oov.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333431; x=1683925431;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iAvkCDu3hruxgiOJqmE1sAlKDaRv3MBstRHxkz3IG9s=;
 b=C5cTjQsr1bDNZnnEnHm8OWc1DB/J3yFm0CGIfqtHlUU9EbAhoYRwqAjvcPUV37DpKo
 RfQo7/R04sQfBhNfE967GG3jgTzU25d5IJYaa3ho5UDdK+JPN6weYHJ1uS84cQBA0aR7
 +n2g/QrvCjg7VH/sefv6mN5KZ7Fuhtcpe2P/UvHGHCiuE74N5HtR8ngZRArTPICf1kiG
 2cf1WaEkIsLQFmymkO43oEN0VpaHe/cC224+sBxQ5/+fEygLOg5+MflX9CIeF+mO3euC
 uMh/8GGCxAkLT56AymQLg1cuPVC+reefVmiLWAYoQ1dt0vshklU+wsNwVxnnpxl+ybFz
 5Abg==
X-Gm-Message-State: AAQBX9ePVhMI5sHGV3Zxi1vWNeM2u2Ik2GYs5LFd0V/ovIEdkLgJS8rp
 TSxlLPQ+ar58OJA0lDYIDQ==
X-Google-Smtp-Source: AKy350Z5Q9mJ1edtUqGeVZax9s2dgjb2Rbg2T6w0rBrdB1GGVndSVyqgynTnqgRdU1HgIe3DZDxvJQ==
X-Received: by 2002:a4a:4153:0:b0:532:7281:93fc with SMTP id
 x80-20020a4a4153000000b00532728193fcmr8643020ooa.2.1681333431639; 
 Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o7-20020acad707000000b0038b0dd1c040sm7217626oig.3.2023.04.12.14.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
Received: (nullmailer pid 3200533 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319361.3191144.6939545255340146019.robh@kernel.org>
Subject: Re: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add
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
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org, kishon@kernel.org,
 kernel@collabora.com, jassisinghbrar@gmail.com, linux-pwm@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, chunfeng.yun@mediatek.com,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:18 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-7-angelogioacchino.delregno@collabora.com


ovl@14007000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

