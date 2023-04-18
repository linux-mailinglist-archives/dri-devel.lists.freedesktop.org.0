Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D46E561A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 02:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EC410E656;
	Tue, 18 Apr 2023 00:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8A210E656
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 00:58:33 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-187df75c908so77534fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 17:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681779512; x=1684371512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXYI9t+uhIrIqHGofk7KodCSd0KD+a+f9muMXWOvwoI=;
 b=cBeV6SC4XiGOIqTqEerl8LDdc5la1pCE7ky0DBUt7cHeoc9//GIPf4P1eCwBMPSR1G
 /MCVGte7zdCXA51ChDpxomDF/SkTUxuraFisvfiZvcd/kh1Xqy7mfpeP+X2ZE6P8vuet
 P4Xwf8sJURSa95lOhYeKz/phGoes/K/8h0d8tGFKfRkTvUDoMR1oUmd+N7uIOGCNlDBd
 DpPNwYHlFzU6f8dTf6fjStSa4EbXSAfZ/9drroPvPpNpE9+xUC5LyrV5WjN7V23MsUm3
 PfHPo4c135yygpsU28uFG2/VUFwNs2/wS5/ed57tmAbQyv8yRKaOtQOLrGOo3x01TOuM
 KS0A==
X-Gm-Message-State: AAQBX9eExKZFIQstcipLTjjI27cF397I7Gw3MPvCecmWyrizsmvEKnq3
 TgG3JgvM4D3d4U8htF2oaA==
X-Google-Smtp-Source: AKy350bPqPxucQ0TtF2gVHTpq49ndfYCjdXmxQpqh32tloC6VCltN0j5EIggvm/aGOCZJnEkxuXLNQ==
X-Received: by 2002:a05:6870:65a0:b0:183:fab4:efb9 with SMTP id
 fp32-20020a05687065a000b00183fab4efb9mr254235oab.43.1681779512502; 
 Mon, 17 Apr 2023 17:58:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 125-20020a4a0d83000000b005251e3f92ecsm5306962oob.47.2023.04.17.17.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:58:32 -0700 (PDT)
Received: (nullmailer pid 3814440 invoked by uid 1000);
 Tue, 18 Apr 2023 00:58:30 -0000
Date: Mon, 17 Apr 2023 19:58:30 -0500
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Message-ID: <20230418005830.GA3802030-robh@kernel.org>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <168133318912.3190428.16120880490622098945.robh@kernel.org>
 <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
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
 phone-devel@vger.kernel.org, kishon@kernel.org, kernel@collabora.com,
 jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 10:52:28AM +0200, Matthias Brugger wrote:
> 
> 
> On 12/04/2023 23:03, Rob Herring wrote:
> > 
> > On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
> > > Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> > > block: this is the same as MT8173.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> 
> These are not new warnings. I think we should address them in a different
> patch. In my opinion it shouldn't block this patch. In the end it only add
> as compatible here.

I disagree if it's the schema that needs fixing. From the looks of 
it, I'd say it's probably at least some schema fixes needed.

> 
> Regards,
> Matthias
> 
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-2-angelogioacchino.delregno@collabora.com
> > 
> > 
> > pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

Are you saying the MT6795 has no power-domains?

> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
> > 
> > pwm@1400a000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> > 
> > pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb
> > 
> > pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

The commit message says the MT6795 is the same as the MT8173. Which is 
wrong here, the dtb or the schema? 

Rob
