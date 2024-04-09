Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AB89D8E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 14:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1D9112D1E;
	Tue,  9 Apr 2024 12:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eF1TAvKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82F8112D1D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 12:10:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 676C5616D4;
 Tue,  9 Apr 2024 12:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED3EC433C7;
 Tue,  9 Apr 2024 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712664646;
 bh=Kqt0iwwTPC3AOYTlEZgew0NErAZ3Ys/2OHVWI4y3Xd4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eF1TAvKhRb0ECUTHSgTfdE50JOT/NZ1JcNC1PvF4Q/IQymUhXQ0OKu7tcU6E2gt1Y
 JBfBEJEiL7kboOpY9vf5D5sQyRNv7jVstOpNjWGTKb74Fso+biJHlXXyQxcD8DniMX
 3sMQRksrPADdIEwwz1rRpULXWQCBv4tdIQQZYvmGTFVchOQRU4lvxn6U99BgjSBtbr
 //vjZWzhQcwOwONnIzsnnTm2lZnwb/OlSXc4z9NsZCQAr2wMelgrNtbuN6S5van+GB
 MZg7hF5JXU7tJreJXYtnvzCOeAympCSPPG7cBsJSor/mL82KsJPKkvTCCqUsVhkWtC
 IlagK8/TsStug==
Date: Tue, 09 Apr 2024 07:10:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-media@vger.kernel.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Flora Fu <flora.fu@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Will Deacon <will@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
 <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
Message-Id: <171266464251.692374.12025555863069807976.robh@kernel.org>
Subject: Re: [PATCH v2 03/18] dt-bindings: mfd: mediatek: Add codec
 property for MT6357 PMIC
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


On Tue, 09 Apr 2024 12:13:24 +0200, Alexandre Mergnat wrote:
> Add the audio codec sub-device. This sub-device is used to set required
> and optional voltage properties between the codec and the board.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/mt6357.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240226-audio-i350-v2-3-3043d483de0d@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

