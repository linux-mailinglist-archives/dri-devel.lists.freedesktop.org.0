Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1890D9F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457D10E726;
	Tue, 18 Jun 2024 16:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GK8Nog0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BCE10E726
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:54:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C35D661A7B;
 Tue, 18 Jun 2024 16:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA0FC4AF64;
 Tue, 18 Jun 2024 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718729640;
 bh=pi1s9JzXbV/imk2EIUojuF6yHVD4/lluGwnh58k352E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GK8Nog0GRPQFKv4Bfioz4q801P9MX5gLhJJ5Kjvcl1VR+0ZUukb2CL1FMiKZ5ye4r
 tYXSTjDQYOiJOtY944SglSxxtZvRN02hIWk1OEcECVDiur5hjXLkDnsDg6L+/uS0na
 hd9XmxrIBipeGMozPvpqkTU3RK3i55zNrvwmJdaeR7Q5SI+JGIlLgVLd3KLNDIfqt9
 LRRmFZujT8xd2Zm1tOXonz63uJY/zky0jeF4IVtlPgnUBRzOnRx6jOc5nKBwh4kz5P
 pbt6GWIviEmxO2JLnOuX9LGWIuB57pxCgbZnH5riGuw6MU+FSw6J6JcRBEwJFWllb0
 4yeYwmEW89tDw==
Date: Tue, 18 Jun 2024 10:53:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-input@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 linux-leds@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-9-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-9-e3f6662017ac@gmail.com>
Message-Id: <171872963565.3062659.8558146217368306841.robh@kernel.org>
Subject: Re: [PATCH v3 09/23] dt-bindings: mfd: add samsung,s2dos05
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


On Tue, 18 Jun 2024 16:59:43 +0300, Dzmitry Sankouski wrote:
> add samsung,s2dos05 core MFD module binding
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  .../devicetree/bindings/mfd/samsung,s2dos05.yaml   | 89 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/samsung,s2dos05.example.dtb: /example-0/i2c/pmic@60: failed to match any schema with compatible: ['samsung,s2dos05']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240618-starqltechn_integration_upstream-v3-9-e3f6662017ac@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

