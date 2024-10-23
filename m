Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0059ACD1B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335B310E7F9;
	Wed, 23 Oct 2024 14:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d0WLA0BG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C692710E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:46:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BAF85C5D78;
 Wed, 23 Oct 2024 14:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93675C4CEC6;
 Wed, 23 Oct 2024 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729694801;
 bh=EL/3ucxGBsVCpCHRgw+6AeG2SCSvou58vtDN4x5Ord0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=d0WLA0BGAbQPxtzol4nS3o9iEdMjuYeEzVqJUqhEmQhALFj3eiSH5k3HUEEH0E/pH
 q13+k0Ct3bB/Qq/aXGCNrTrWuUaTtVZ+ywOTCoGkrPploouaL7dutYnq2wbiJRcZ3S
 qNtMBZ9++Jh53d4t8mYwnzUxEeZejluMO/AtQXfoH+RxapgGPdb9/BwygkAX6UIvdl
 zeOVakVMQKNTQwQvz6k8tomrGl2XmjwMhuAA0YZ6WIIjEG5WlcsrB0vUBzKEyq40FU
 sOI+khxfkzH4CIrhmfDQwg75iMiCX28ZNfpxwo2pLlZKRUq/eIo4rOocke0UM1ReyJ
 J4WCD1DLAeoFw==
Date: Wed, 23 Oct 2024 09:46:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20241023124411.1153552-2-r.czerwinski@pengutronix.de>
References: <20241023124411.1153552-1-r.czerwinski@pengutronix.de>
 <20241023124411.1153552-2-r.czerwinski@pengutronix.de>
Message-Id: <172969480074.910010.7226152766419071066.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: add YAML schema for
 LXD M9189A
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


On Wed, 23 Oct 2024 14:44:09 +0200, Rouven Czerwinski wrote:
> The LXD M9189A is a 1024x600 MIPI-DSI panel.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>  .../bindings/display/panel/lxd,m9189a.yaml    | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "ronbo,rb070d30" found in schemas matching "$id":
	http://devicetree.org/schemas/display/panel/ronbo,rb070d30.yaml#
	http://devicetree.org/schemas/display/panel/lxd,m9189a.yaml#
Documentation/devicetree/bindings/display/panel/lxd,m9189a.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['lxd,m9189a']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241023124411.1153552-2-r.czerwinski@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

