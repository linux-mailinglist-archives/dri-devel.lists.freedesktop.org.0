Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EDB76B35D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1478010E3E3;
	Tue,  1 Aug 2023 11:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313D610E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:37:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CC506154A;
 Tue,  1 Aug 2023 11:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49766C433C7;
 Tue,  1 Aug 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690889834;
 bh=nDCDGYvtjb1LnlZeSZWFBHuiMyZdQvnHV1UhBHgSAAs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ORD4V7a0hezEs+CAdVmhQntOWNo2IHKNAIOCqMGSmVqwZYTfnCq+/hGBmmMPkNn4O
 0JjHxpsK9KN5+dzPhFq1YLVZKUxdu42eYM9yNPJ5MeBCi8NYATdNIud1CyoC86+Hz3
 h3CqZ0AuxHKTh/SzqFz0lCyNhFVeDmpKtQcCa+g+mWB3r4zNnI9loEys2tXBLbXkVb
 UzhwtjPS1bHIvw8VZzDBBC4O78e0+pgwCthB8qChulFLzJxaSPWEaMRY/OYJhZor5i
 mb6Hdxxfj2fcJFAyvDNmFvc4x0aCC8J4Z7wd7l+tC5q+b/fJQJCmW592j8oW1rqjvG
 AeDDE5tHUq/uQ==
Received: (nullmailer pid 1253242 invoked by uid 1000);
 Tue, 01 Aug 2023 11:37:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <20230801101030.2040-3-keith.zhao@starfivetech.com>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-3-keith.zhao@starfivetech.com>
Message-Id: <169088983013.1253226.12148549682473320838.robh@kernel.org>
Subject: Re: [PATCH v1 v1 2/7] dt-bindings: display: Add yamls for JH7110
 display system
Date: Tue, 01 Aug 2023 05:37:10 -0600
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
Cc: , Emil Renner Berthing <kernel@esmil.dk>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
	linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Andersson <andersson@kernel.org>, m@freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Chris Morgan <macromorgan@hotmail.co>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 01 Aug 2023 18:10:25 +0800, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> lcd-controller bases verisilicon dc8200 IP,
> and hdmi bases Innosilicon IP.
> Add bindings for them.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
>  .../starfive/starfive,jh7110-dc8200.yaml      | 107 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  92 +++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.example.dtb: display-subsystem: ports: [[4294967295]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.example.dtb: display-subsystem: ports: More than one condition true in oneOf schema:
	{'additionalProperties': False,
	 'oneOf': [{'required': ['port']},
	           {'required': ['#address-cells', '#size-cells']}],
	 'patternProperties': {'^port@[0-9a-f]+$': {'required': ['reg'],
	                                            'type': 'object'},
	                       'pinctrl-[0-9]+': True},
	 'properties': {'#address-cells': {'items': [{'items': [{'const': 1}],
	                                              'maxItems': 1,
	                                              'minItems': 1,
	                                              'type': 'array'}],
	                                   'maxItems': 1,
	                                   'minItems': 1,
	                                   'type': 'array'},
	                '#size-cells': {'items': [{'items': [{'const': 0}],
	                                           'maxItems': 1,
	                                           'minItems': 1,
	                                           'type': 'array'}],
	                                'maxItems': 1,
	                                'minItems': 1,
	                                'type': 'array'},
	                '$nodename': True,
	                'bootph-all': True,
	                'bootph-pre-ram': True,
	                'bootph-pre-sram': True,
	                'bootph-some-ram': True,
	                'bootph-verify': True,
	                'phandle': True,
	                'pinctrl-names': True,
	                'port': {'type': 'object'},
	                'secure-status': True,
	                'status': True},
	 'type': 'object'}
	from schema $id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230801101030.2040-3-keith.zhao@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

