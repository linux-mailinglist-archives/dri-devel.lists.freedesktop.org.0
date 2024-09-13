Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F279785E8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24B510EC3F;
	Fri, 13 Sep 2024 16:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZqrOfTdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831E710EC3F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 16:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 174EE5C53E9;
 Fri, 13 Sep 2024 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EAAC4CEC0;
 Fri, 13 Sep 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726245461;
 bh=701SKl8cKJX2QC6nh6wDA1oWgBjgHiBpfvUmT7+8aEQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZqrOfTdQNo9lA9khn2Kr1Jf8aIrBNNC7IhR/iy+eNgoAsZ69LHszScZBNZmHNCXQv
 CH1Uh6F3I07jCia9cqlaAwMfgc1MQCB6jp9u6fe0ccaGXGtq8TDWZyOkh97LaH2jc/
 tVHFohoHDKTmAY1xtY203INchHagPRVG9PU6L6k/9Mpa+VoGzjcCxCnut5SSRsjzEJ
 wex2vhiCSqmpO/TWg2qD3kG9DdtPn4AB+ml7gVumDjmxkA8MHgzGVVfqFvBpaKkNgL
 xHUTLPK+uJlA99ZzDwo6GkhjIXujy7BD30LROF+nfOATSU/sVulh/aIYdpEouVJmyk
 kk8JFL6bxlYgA==
Date: Fri, 13 Sep 2024 11:37:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Michael Turquette <mturquette@baylibre.com>, linux-pwm@vger.kernel.org, 
 Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-input@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 cros-qcom-dts-watchers@chromium.org, linux-leds@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com>
Message-Id: <172624546028.155976.17920164099975885299.robh@kernel.org>
Subject: Re: [PATCH v4 05/27] dt-bindings: mfd: add maxim,max77705
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


On Fri, 13 Sep 2024 18:07:48 +0300, Dzmitry Sankouski wrote:
> Add maxim,max77705 core binding part.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v4:
> - change dts example intendation from tabs
>  to spaces
> - remove interrupt-names property
> - remove obvious reg description
> - split long(>80) lines
> ---
>  .../devicetree/bindings/mfd/maxim,max77705.yaml    | 169 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77705.example.dtb: pmic@66: fuel_gauge: 'shunt-resistor-micro-ohms' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

