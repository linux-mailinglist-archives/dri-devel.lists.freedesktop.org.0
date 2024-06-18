Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0A90D9F3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7347010E728;
	Tue, 18 Jun 2024 16:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rGn76P3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409C10E726
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:53:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3ABA561A02;
 Tue, 18 Jun 2024 16:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C9AC3277B;
 Tue, 18 Jun 2024 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718729637;
 bh=gVRTf/IytGfnTahbvcX22LWVmgHV0CjJyuZCT03dLm8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rGn76P3inYALIrqOuHRyp3qYpyXdlDP1LcM8JfnRExzzdlHzNBsO7zK+jimOqoHxj
 l7OqtMzpIALi6Iw+RfB8UrV02NKx6DFHaG7o0E3rr6O1FwkcQTcaww9wUfkrNiBaCf
 Bdp97xroVof7T5P4o4PAzrN00GwtOOBDX9Q3a9rFKw+XhYgvb0OIyPaE9PFKPDkoDS
 rqOsRk4cxHy+pwtQuji0+mTqcOrWexRnDJuM2O9cfGerjwHXBgUMWjsWcLZYGRIeSZ
 pGKo/KKoTCZauyQHlh+5oLDCw/3WTnQ1F2GvNnzdQPykTCLfSvbcj39q2eV749C53d
 vhBPR5mRggmeA==
Date: Tue, 18 Jun 2024 10:53:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sebastian Reichel <sre@kernel.org>, linux-pwm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-leds@vger.kernel.org, 
 linux-input@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com>
Message-Id: <171872963372.3062561.18354991193259441972.robh@kernel.org>
Subject: Re: [PATCH v3 04/23] dt-bindings: mfd: add maxim,max77705
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


On Tue, 18 Jun 2024 16:59:38 +0300, Dzmitry Sankouski wrote:
> maxim,max77705 is MAX77705 pmic binding part
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  .../devicetree/bindings/mfd/maxim,max77705.yaml    | 112 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 113 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: pmic@66: charger: False schema does not allow {'compatible': ['maxim,max77705-charger'], 'monitored-battery': [[4294967295]], 'phandle': [[2]]}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: pmic@66: fuelgauge: False schema does not allow {'compatible': ['maxim,max77705-fg'], 'monitored-battery': [[4294967295]], 'power-supplies': [[2]], 'rsense': [[5]]}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: pmic@66: haptic: False schema does not allow {'compatible': ['maxim,max77705-haptic'], 'haptic-supply': [[4294967295]], 'pwms': [[4294967295, 0, 50000]]}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: pmic@66: leds: False schema does not allow {'compatible': ['maxim,max77705-led'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@1': {'reg': [[1]], 'label': ['red:usr1']}, 'led@2': {'reg': [[2]], 'label': ['green:usr2']}, 'led@3': {'reg': [[3]], 'label': ['blue:usr3']}}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: /example-0/i2c14/pmic@66/leds: failed to match any schema with compatible: ['maxim,max77705-led']
Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: /example-0/i2c14/pmic@66/charger: failed to match any schema with compatible: ['maxim,max77705-charger']
Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: /example-0/i2c14/pmic@66/fuelgauge: failed to match any schema with compatible: ['maxim,max77705-fg']
Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: /example-0/i2c14/pmic@66/haptic: failed to match any schema with compatible: ['maxim,max77705-haptic']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

