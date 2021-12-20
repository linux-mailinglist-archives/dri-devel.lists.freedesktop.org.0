Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05647AB46
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9335F10FFA7;
	Mon, 20 Dec 2021 14:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015D11212A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:27:51 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u74so16021428oie.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 06:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=zDWGu9cBBF+UZjp8vTj9QW+U99MkhuncHEZaTav2MHE=;
 b=AWvO2TbcKPM8+O7b6zt/0oobUgXwU9t100hnUiyclQAtw3P3N7Vw7SDK+dNC7zjjia
 hQxolVbTcimKgGi9/77boYip8mICVKjRTYtvPZN8SCwPTMSkt5dDmgzPhNNXyamyVbbt
 TSkRd5eKS4nOgJpUJ4/yhkDLCPy32HOQGX8CV67xaDNaOe44/mXcOBPBSzyvt73namH1
 k04Wf9+xnbSoA2bo18snWYFcHJBcZ3mCJg2g00wN0KE8sDYeXt7L/Sj8dSwCk+kPB/8i
 7oeR4koMAwybiGHIi/1LEdMTSPJuzpdkHRacXTuZFc/f+ZFKFvSBOszorVNugM0WLFx4
 tHCA==
X-Gm-Message-State: AOAM533nwyRay5f8IRz7PvkP+RnWgNYbpzjDk+Jq/b+4M06wlkJQaXMa
 PE2xvFH1wAxpvLQgBuckyg==
X-Google-Smtp-Source: ABdhPJymnJA4Z6UpMSbt9RnHYH7HHxzlTJRAorVIPXmvkAT2YhfCFGWf8mSZby1/CnTgxJObaa5ggA==
X-Received: by 2002:a54:4401:: with SMTP id k1mr18534287oiw.143.1640010470666; 
 Mon, 20 Dec 2021 06:27:50 -0800 (PST)
Received: from robh.at.kernel.org ([12.252.7.226])
 by smtp.gmail.com with ESMTPSA id g17sm3438953oiy.14.2021.12.20.06.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 06:27:50 -0800 (PST)
Received: (nullmailer pid 3388824 invoked by uid 1000);
 Mon, 20 Dec 2021 14:27:43 -0000
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20211220110630.3521121-8-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-8-s.hauer@pengutronix.de>
Subject: Re: [PATCH 07/22] dt-bindings: display: rockchip: dw-hdmi: Make
 unwedge pinctrl optional
Date: Mon, 20 Dec 2021 08:27:43 -0600
Message-Id: <1640010463.872107.3388823.nullmailer@robh.at.kernel.org>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Dec 2021 12:06:15 +0100, Sascha Hauer wrote:
> None of the upstream device tree files has a "unwedge" pinctrl
> specified. Make it optional.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1570970


hdmi@200a0000: clock-names:0: 'iahb' was expected
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

hdmi@200a0000: clock-names:1: 'isfr' was expected
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

hdmi@200a0000: ports:port: 'endpoint@1' is a required property
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

hdmi@200a0000: Unevaluated properties are not allowed ('reg', 'interrupts', 'pinctrl-0', 'resets', 'reset-names', 'ports' were unexpected)
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

hdmi@ff3c0000: interrupts: [[0, 35, 4], [0, 71, 4]] is too long
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dt.yaml

hdmi@ff3c0000: ports:port: 'endpoint@0' is a required property
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dt.yaml

hdmi@ff3c0000: ports:port: 'endpoint@1' is a required property
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dt.yaml

hdmi@ff3c0000: Unevaluated properties are not allowed ('reg', 'interrupts', 'pinctrl-0', '#sound-dai-cells', 'ports' were unexpected)
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dt.yaml

hdmi@ff940000: clock-names:4: 'vpll' was expected
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

