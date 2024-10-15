Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDA99ED40
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 15:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9732110E5A0;
	Tue, 15 Oct 2024 13:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BEe1tpbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D95010E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 13:26:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E08A85C5D08;
 Tue, 15 Oct 2024 13:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBC9C4CECF;
 Tue, 15 Oct 2024 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728998778;
 bh=UpHokupAtjlDauqa70fE2fQJZrcfyQZ3EvXkwOwsheY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BEe1tpbRQRTtSRuN4OXaCHRF+kwB/JEnlK1e/0lPAhiN0YN4QMigvsa2wPcYIuu0y
 5Z4fF/34tOfOcT+q8jRDPt8zcbw+sZmcoSmA3bn+SpVELbN1S/HbIJ4BRENhzmJUQE
 ZRUjsqs8i0l3XL1Pr9TJG0ib8x8fQOJpzC9Nj9UX+slS1Yjq6MYT+sUBmac5f2A37t
 CZy4AMcw1F2wea9wIJNRv9tFdITShoS5V+0AodawCMRFnfiT5MuDecr2D+r2SwJ39L
 kAUce5JOBmW7mvu80X7v3iUmv1kXciem1B3RyORsAjONhurY1RBBtDKBzQ62oUSSmB
 3DuPKnnx8D0gw==
Date: Tue, 15 Oct 2024 08:26:14 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, quic_vtanuku@quicinc.com, 
 Bjorn Andersson <andersson@kernel.org>, dmaengine@vger.kernel.org, 
 Andi Shyti <andi.shyti@kernel.org>, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, quic_msavaliy@quicinc.com, 
 devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20241015120750.21217-2-quic_jseerapu@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com>
Message-Id: <172899877472.523926.14548368912530185631.robh@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add
 additional arg to dma-cell property
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


On Tue, 15 Oct 2024 17:37:46 +0530, Jyothi Kumar Seerapu wrote:
> When high performance with multiple i2c messages in a single transfer
> is required, employ Block Event Interrupt (BEI) to trigger interrupts
> after specific messages transfer and the last message transfer,
> thereby reducing interrupts.
> 
> For each i2c message transfer, a series of Transfer Request Elements(TREs)
> must be programmed, including config tre for frequency configuration,
> go tre for holding i2c address and dma tre for holding dma buffer address,
> length as per the hardware programming guide. For transfer using BEI,
> multiple I2C messages may necessitate the preparation of config, go,
> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
> potentially leading to failures due to inadequate memory space.
> 
> Add additional argument to dma-cell property for channel TRE size.
> With this, adjust the channel TRE size via the device tree.
> The default size is 64, but clients can modify this value based on
> their specific requirements.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/qcom,gpi.yaml: properties:#dma-cells: 'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/qcom,gpi.yaml: properties:#dma-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241015120750.21217-2-quic_jseerapu@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

