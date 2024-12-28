Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8029FDADF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 15:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01B710E00E;
	Sat, 28 Dec 2024 14:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NkUtz/tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EF810E00E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 14:09:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97B08A401AC;
 Sat, 28 Dec 2024 14:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99235C4CECD;
 Sat, 28 Dec 2024 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735394947;
 bh=Dkf6FNbmvczR6fwjr8TMuN/izWdItAgYtjp2h3zBUiU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=NkUtz/tztIW/PhXP2LF3lMOFGClVFeWa5CrOwlzULAlP5973gEksD+7QteiFALTfX
 VSrG2ZV1ClfYJDpFKZ/XSzsPFm2GjtPLNXHsKUVmZkcoWAnQBhLqH4L1djr6ivwuzQ
 CC6JmtEo318beq4yK6HdKuaJ9UuwZpRwaEa96mxruNafNt1TqwFjEW/m7G75atqVpD
 TnbkkQCn+Sx7zNmI/vIDziT47eiZN+iW/fsCXv6NlpeB2jmRfGWJyA9Ktj38jF2evD
 aG0lOQ5LaKRaEoQT2DEchPI/mGcC+gG6q7Ee9tX+OGlrm9jeH73dwV2T65TrWBCRmL
 ICN4mGxILIv4Q==
Date: Sat, 28 Dec 2024 08:09:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
 cristian.ciocaltea@collabora.com, Andy Yan <andy.yan@rock-chips.com>, 
 joro@8bytes.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 dri-devel@lists.freedesktop.org, cl@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 detlev.casanova@collabora.com, hjc@rock-chips.com, krzk+dt@kernel.org
To: Andy Yan <andyshrk@163.com>
In-Reply-To: <20241228122155.646957-6-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
 <20241228122155.646957-6-andyshrk@163.com>
Message-Id: <173539494517.1967895.2732995549466236200.robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
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


On Sat, 28 Dec 2024 20:21:48 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v1:
> - ordered by soc name
> - Add description for newly added interrupt
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
>  1 file changed, 56 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml: properties:interrupts: {'minItems': 1, 'maxItems': 4, 'items': [{'description': 'vop system interrupt, such as bus error, and vsync for vop version under rk3576.'}, {'description': 'independent interrupts for each video port, such as vsync and other video port related error interrupts.'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241228122155.646957-6-andyshrk@163.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

