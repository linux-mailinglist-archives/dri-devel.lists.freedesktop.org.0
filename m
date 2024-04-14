Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B283D8A43C3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB27112089;
	Sun, 14 Apr 2024 16:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mM57ulN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C19112089
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:24:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F033460B8D;
 Sun, 14 Apr 2024 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96930C072AA;
 Sun, 14 Apr 2024 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713111863;
 bh=QeuvJ+PO6AYKR0nCyfG5EEKVnVTDcMMH6uM8m1EBOfw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mM57ulN4yzcL1i/NZgwZ45fXjHkAbnLyML+BgrzhXx+IT4kBGEWyDwfQAhA8Ic2uq
 7Rod5VeVh0tMMOwX3sWkv9iKPnLyoIWrUGnkueRLAY0HiHIVzjeGvgBjYWb4gSq6Aj
 7mVq3DQfr5fm+0F7k+RfDclBYgbT4SMO0ovRe1xty7yA8TjOdpAJVp0z45MiQPdmYX
 UmzDE/x2PRT2Yp1Sq8Y3D4lwkouIcEath11hWYBW2umFx57D8v0uWr9bxdX9SuFYXe
 UwLFvTyQ1aCZj/WdSH4KrOJT1KX7hXRjWLCbqvsgw4/ra1Tutk0LR5W4FoBNR111sH
 PCIdyQCDulWVA==
Date: Sun, 14 Apr 2024 11:24:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20240414-raydium-rm69380-driver-v1-1-5e86ba2490b5@mainlining.org>
References: <20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org>
 <20240414-raydium-rm69380-driver-v1-1-5e86ba2490b5@mainlining.org>
Message-Id: <171311185909.3846249.17342729762911919460.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Raydium RM69380
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


On Sun, 14 Apr 2024 17:22:30 +0200, David Wronek wrote:
> Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
> Add a dt-binding for it.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
>  .../bindings/display/panel/raydium,rm69380.yaml    | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/raydium,rm69380.example.dtb: panel@0: False schema does not allow {'compatible': ['lenovo,j716f-edo-rm69380', 'raydium,rm69380'], 'reg': [[0]], 'avdd-supply': [[4294967295]], 'vddio-supply': [[4294967295]], 'reset-gpios': [[4294967295, 75, 1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, '$nodename': ['panel@0']}
	from schema $id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240414-raydium-rm69380-driver-v1-1-5e86ba2490b5@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

