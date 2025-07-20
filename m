Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A50B0B66B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 16:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6CF10E20A;
	Sun, 20 Jul 2025 14:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LJoms7f3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB710E20A
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 14:32:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E3DAA52574;
 Sun, 20 Jul 2025 14:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08D9C4CEE7;
 Sun, 20 Jul 2025 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753021940;
 bh=uSx96+KzW5uSVtm6QxLt0ynjUYHR1GTPKf5JRTP4qIw=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=LJoms7f3GofnOd3wdsHXW7ThunP+oLJ9ETKMRaFxT9zXQjEdSLkVkL86VxXCVBcWX
 AriodnEgDqkzd9nYqN3qE5DKAG3eJ/xp7MUZzBPeB5swEfAW3BCotvBJh3sDffWaIs
 Uzjp8FeZX0C8fBYaP/dK0i5+55Tw2yTGl6hcgXDNzsY7abxzfsUi081kUaK2654Mg2
 JLJR1pqeKxzFbnA9odBHDSgqyyF5O3eD3AM5F+Z8VgfKO5eAn44DIxEk3Iyd2kYdpR
 yD0Xf4VNx4NE2cTI8JcJYerIIkr4I4/nzLMxSCbn9Ad6Qem5VXWZ0rdMBB4mSSxZug
 R4xle/EKtGNsg==
Date: Sun, 20 Jul 2025 09:32:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250720-panel-samsung-s6e8aa5x01-v4-1-7d9258fa3f4a@disroot.org>
References: <20250720-panel-samsung-s6e8aa5x01-v4-0-7d9258fa3f4a@disroot.org>
 <20250720-panel-samsung-s6e8aa5x01-v4-1-7d9258fa3f4a@disroot.org>
Message-Id: <175302193978.2019800.11858097552460826975.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: document Samsung
 AMS561RA01 panel with S6E8AA5X01 controller
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


On Sun, 20 Jul 2025 17:33:07 +0530, Kaustabh Chakraborty wrote:
> Samsung AMS561RA01 is an AMOLED panel, using the Samsung S6E8AA5X01 MIPI
> DSI panel controller. Document the compatible and devicetree properties
> of this hardware. It has a reset GPIO and two voltage regulators.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['samsung,s6e8aa5x01']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250720-panel-samsung-s6e8aa5x01-v4-1-7d9258fa3f4a@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

