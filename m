Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85717577B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908F10E306;
	Tue, 18 Jul 2023 09:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D70E10E306
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:19:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA8E6614DA;
 Tue, 18 Jul 2023 09:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA20C433C8;
 Tue, 18 Jul 2023 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689671977;
 bh=hO5EzDtJUJpNoHo8brEsTUnqJsLjzJEcU/q1SwyRLAg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G56zDGJUEcogP2ywZ1hWd4eZlOhgeum0fkFqMvVLjUBMvMeBD/Ra4HoOUf8TZNRG1
 ybcNSfb9qapMSJcvPNxkS1hMnFUoRZH6sPraUu58jpWdvcQwxdPf7YfjG6L57EsGLI
 vjOLfJFPOmUAWGWBZT+M0ZUTnXHQo7uOwCNxXzUCOj5j+QR1R43Xl6Rn4J1jB6f/is
 6JcGQyt/5fY5o0Wfyoal8JK2IGeknYAq8XUPpR1F2oxFsveIO2RvZM1RS7pGgio87s
 vj0ygsqaXsxa01NOaWzph8jCShGnlmyaJ8AuE7gHzuHuGwM3WDdpPltZ0/R7fVwFFC
 v46/gweYqgvxQ==
Received: (nullmailer pid 343549 invoked by uid 1000);
 Tue, 18 Jul 2023 09:19:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Viktar Simanenka <viteosen@gmail.com>
In-Reply-To: <20230718080727.323426-1-viteosen@gmail.com>
References: <20230718080727.323426-1-viteosen@gmail.com>
Message-Id: <168967197544.343533.16496491344005174471.robh@kernel.org>
Subject: Re: [PATCH] TinyDRM display driver for Philips PCD8544 display
 controller
Date: Tue, 18 Jul 2023 03:19:35 -0600
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 18 Jul 2023 11:07:27 +0300, Viktar Simanenka wrote:
> Support for common monochrome LCD displays based on PCD8544 (such as Nokia 5110/3310 LCD) SPI controlled displays.
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---
>  .../bindings/display/philips,pcd8544.yaml     |  92 ++++
>  drivers/gpu/drm/tiny/Kconfig                  |  11 +
>  drivers/gpu/drm/tiny/pcd8544.c                | 506 ++++++++++++++++++
>  3 files changed, 609 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/philips,pcd8544.yaml
>  create mode 100644 drivers/gpu/drm/tiny/pcd8544.c
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/philips,pcd8544.example.dts:21.13-23: Warning (reg_format): /example-0/display@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/philips,pcd8544.example.dtb: display@0: Unevaluated properties are not allowed ('write-only' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/philips,pcd8544.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230718080727.323426-1-viteosen@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

