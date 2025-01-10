Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA63A09293
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7BE10F0CA;
	Fri, 10 Jan 2025 13:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H1i7iDdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9382010F0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:54:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15E8EA41BA6;
 Fri, 10 Jan 2025 13:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A59C4CED6;
 Fri, 10 Jan 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736517258;
 bh=LPyn4zGg07EcDbmN8qbWXQu2T7iAh+g4Zanw4aY6Nh8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=H1i7iDdofr9qkOBohfvLG/GVjtxC9Z00nO04TIA58X6C+keS8dUXICi6bBaeuj2Dt
 Pko98ZdIdgOUMCofPtQTgxwmYZ4PP0hvo9WK3mPj0/7ZauGM1Ad5oD0iBtoZWe0IDX
 y2L2PvkOLyFXzC2q2C6TaNSeaEzT3XXnmfCGR+3Vy1eiN0UuxU0ftygmGgz699MRId
 3jxq4Jpt78UNbLt0mhHc0gPZqS2v6IhEXsEwHweBQ0ZYYdLaZI8jmM0Sjgdy9I1Osr
 umyM4/UBnwruuY8eBJ+Hlv2zVHLS9NOGSm35xNbSseytgAIT0635GCHA5xEBPJf60E
 CcSS/oesWAREg==
Date: Fri, 10 Jan 2025 07:54:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, singo.chang@mediatek.com, sunny.shen@mediatek.com, 
 chunkuang.hu@kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 fshao@chromium.org, sirius.wang@mediatek.com, 
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 xiandong.wang@mediatek.com, treapking@chromium.org, nancy.lin@mediatek.com, 
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, 
 jason-jh.lin@mediatek.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
Message-Id: <173651725269.2671643.2891127782637834272.robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 10 Jan 2025 20:33:59 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> #include <dt-bindings/power/mt8196-power.h>
> are not upstreamed yet.
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,exdma.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-5-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

