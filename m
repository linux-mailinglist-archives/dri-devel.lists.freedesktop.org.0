Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49428BE722
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34B510E3FE;
	Tue,  7 May 2024 15:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dbAdNNIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283B810E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:14:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E6DA0CE1383;
 Tue,  7 May 2024 15:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0820C2BBFC;
 Tue,  7 May 2024 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715094890;
 bh=PjCTV7JX3phTYmApghlae2CUkayVRisRZ1IV02RHcnQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dbAdNNIBE5BaB+wRjqZ49wM9g1YM0gVZe02Rm0cjwLHjVLhtBZR1aPXgpeYbRMnGg
 vmaeLQBO4tBY+Keab/UbBTMraGLfNaTSbR9kLbKI7uRJ1AXm23+gD4Y5bF74ijPOAd
 ImNiajCdFbskPhJZ4Rg2q+5CfSfARELppPqbm8FkGSXOmnlhWhV5+VRWAAUMl6fPBs
 ihKIEwNKLVLzldd2dBvasLF+KjL2zOpji/o/RlQ+4+5EuB1aZGHET/kkx8KmyQdHwF
 JsiZRsgY6h7Denmo+nfxhDxoDZZ41sscorJEQdQae+j2yjYoBTkAZ5i8u9WzdyHHFJ
 9+CxSh2LoJDQw==
Date: Tue, 07 May 2024 10:14:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, dianders@chromium.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linus.walleij@linaro.org, 
 xuxinxiong@huaqin.corp-partner.google.com, airlied@gmail.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, daniel@ffwll.ch, 
 neil.armstrong@linaro.org
In-Reply-To: <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
Message-Id: <171509488827.493449.2668049686067198439.robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
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


On Tue, 07 May 2024 21:52:28 +0800, Cong Yang wrote:
> In V1, discussed with Doug and Linus [1], we need break out as separate
> driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
> and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> controller, they have some common CMDS. So add new documentation for
> this panels.
> 
> For himax83102-j02 controller, no need 3v3 supply, so remove it.
> 
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com
> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V4:
> 
> - Update commit message and add fallback compatible.
> 
> V3: https://lore.kernel.org/all/20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com
> 
> Chage since V3:
> 
> - Update commit message.
> 
> V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com
> 
> ---
>  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
>  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/himax,hx83102.example.dtb: panel@0: compatible:0: 'starry,himax83102-j02, himax,hx83102' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
Documentation/devicetree/bindings/display/panel/himax,hx83102.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['starry,himax83102-j02, himax,hx83102']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

