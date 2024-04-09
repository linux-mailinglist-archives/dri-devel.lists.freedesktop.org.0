Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D289D8E9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 14:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53E7112D1B;
	Tue,  9 Apr 2024 12:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lr6otbaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840C9112D1D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 12:10:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEBDE616E0;
 Tue,  9 Apr 2024 12:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACE4C43399;
 Tue,  9 Apr 2024 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712664648;
 bh=qPcpjQQA+x/Lp3zoDAguMcAnH3yp4AUeYMdHe1M4OcE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Lr6otbaZHkCwc8rTE3hO5aEBmzcZW1GmC9RB07B4BUlkpRRo/Dj2uW7ymS7cIqQtf
 TI2U0yDOEl9WMMGHLaetqQHVpaud3bzGlHx/8A3G2rWc1KZvLSMiSxIrR2NQODkaNx
 S3F/X6kQBtaW8yaX0qCwVBdU791lVnJAxFWyXEvnjr8FcFPkrdf6HjM6YoWDjtL1sA
 /JSfcsu/7hCuCFyx4sBOlIDjyxfSf8VJqnSUS3MRT6HWxVpvdE9IcXtO1vs0ACEucf
 io9RlHyjH0Z/JkbCJmtALKfb5HFty6qkFWsqmjkNQmx0Vd9rkRpc5aK3MNjNdTsR3u
 Q7nZ6uDer/jzA==
Date: Tue, 09 Apr 2024 07:10:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Flora Fu <flora.fu@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Takashi Iwai <tiwai@suse.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
 <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
Message-Id: <171266464354.692403.15935267584546388532.robh@kernel.org>
Subject: Re: [PATCH v2 04/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
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


On Tue, 09 Apr 2024 12:13:25 +0200, Alexandre Mergnat wrote:
> Add MT8365 audio codec bindings to set required
> and optional voltage properties between the codec and the board.
> The properties are:
> - phandle of the requiered power supply.
> - Setup of microphone bias voltage.
> - Setup of the speaker pin pull-down.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt6357.yaml: properties:vaud28-supply: '$ref' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240226-audio-i350-v2-4-3043d483de0d@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

