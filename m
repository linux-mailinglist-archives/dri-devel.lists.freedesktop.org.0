Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C6B426F9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94B10E1A4;
	Wed,  3 Sep 2025 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T5BLGUmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B5D10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:33:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E83A560248;
 Wed,  3 Sep 2025 16:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEC2C4CEE7;
 Wed,  3 Sep 2025 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756917194;
 bh=lXGbRbBGPukctJiSqyL/CgDyF8977mhP+cJ851KLN20=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=T5BLGUmjdfEK8W/sDyCOl/2csWAxLz0kRN1hBp5T87MlliGPflUg2uOYpARqtxpj+
 HcG0JU+aI5k8ENu/dsIXOr5DqBLnwtRihq0hN+aU1qopV+YoTUoE11wqAnZZaxrkhw
 nPAjDQD4qtPKsKzSyG7txdpD4etFhBEUoS9t1LRUHII2bTTjskXxyJ3VmEj21ZNzBH
 +73nPfw33w50jXZny0Eo3KCIr6bL5iQA19lvz8aU2+5dzaxoRZ2ISysaA+aQDABf+H
 j/dkaYQ8s8pJR8KiT/X8leXhWfYlAZkN1HVWVyTsXSkLtcESMb1Zog3qM8PtVxgWB1
 hZCUKUcjNImPQ==
Date: Wed, 03 Sep 2025 11:33:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, 
 Laurent.pinchart@ideasonboard.com, yangsunyun1993@gmail.com, 
 andrzej.hajda@intel.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org, 
 rfoss@kernel.org, jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
To: syyang <syyang@lontium.com>
In-Reply-To: <20250903123825.1721443-2-syyang@lontium.com>
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-2-syyang@lontium.com>
Message-Id: <175691717884.2393851.6340903042726389490.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] This patch adds a new device tree binding
 documentation.
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


On Wed, 03 Sep 2025 05:38:24 -0700, syyang wrote:
> - New device tree binding documentation at
>   Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> 
> Signed-off-by: syyang <syyang@lontium.com>
> ---
>  .../display/bridge/lontium,lt9611c.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.example.dtb: /example-0/i2c10/hdmi-bridge@41: failed to match any schema with compatible: ['lontium,lt9611c']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250903123825.1721443-2-syyang@lontium.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

