Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08ACB45B73
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B21610EBE5;
	Fri,  5 Sep 2025 15:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j6Jgl871";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038510EBE6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 15:02:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 909F0602A3;
 Fri,  5 Sep 2025 15:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F108EC4CEF1;
 Fri,  5 Sep 2025 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757084577;
 bh=0tSTOuBy2edUU22nf2u/6hjfDK4cj0VMfFcTtP7ysrY=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=j6Jgl871ZpOGLLTVIGzZAbMETn7GA9+trGgNUUA2jiCbTiQJLwJcSrdD1PCH+4lLj
 JM3MKCro/j4AU0DKFB2la6zhfv+7RlZzKxoO941U42scBfrYKi9uKfg3dkplvZIWcW
 7vOfR7Agjjoe7mDcpcElnCfxrudzh7wcTLPhk2JKsoRrYHfcbXMu+Xc2ErXX9RWfm+
 7EFZxP+46sNGrLn3w2BSSDIOteP/dxgTGfqqFkkGGipddPlZY1RK3m+EZmfblbmytM
 OQbgRbyx1yIg/v4z66o1S1CoCwGzFcfOQa/cUhe4FOzO4pxz13P/UJ0EulOvY9Y9d1
 knm2JLTAQvWCw==
Date: Fri, 05 Sep 2025 10:02:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Message-Id: <175708448034.930549.7632913810070724509.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
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


On Fri, 05 Sep 2025 09:59:29 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250905-leds-v2-1-ed8f66f56da8@vinarskis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

