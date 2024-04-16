Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381488A748D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 21:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785C8112DFA;
	Tue, 16 Apr 2024 19:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X/uVauMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FCF112DFA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 19:20:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAE296129B;
 Tue, 16 Apr 2024 19:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B805C4AF07;
 Tue, 16 Apr 2024 19:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713295244;
 bh=JPCYyaNQ5aLMEvbd/QgJU8hMpf/HQ03GExzcJL2Qv/A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=X/uVauMKTrEJKeHSuimCQFH2qffGX5UJUXLGp1Lqc3Xd/2hDX3v0OBwGBl6m8PBmJ
 DJt3NYegAPxEIlk1Rbuzi190amVwRoVXW2W2DEdgFMHpGFbxq9ZgTBTtaWA2aX7QSq
 GU3xbx6+Ikyif5ExRKSpHxFKJ2wfDOGRkN4WtL/Gisu/3IY3+dDHj8gB+1v4gjoIUW
 KEfNA9D7tcxIyd1DtV2IHHCf2VeG50atxHUUxmYDW1XFQneVMwhCtYBmJ1GabzGVss
 XahY/K3DuAfbXRy7wT1+oBKfFxas8aEMBMAjK90vg7hvZqfssYTAN77R5i9m57VEfl
 stiZpF3I8DUyw==
Date: Tue, 16 Apr 2024 14:20:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, phone-devel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org>
References: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
 <20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org>
Message-Id: <171329524217.3866491.17133323798824607275.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Raydium
 RM69380
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


On Tue, 16 Apr 2024 20:30:48 +0200, David Wronek wrote:
> Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
> Add a dt-binding for it.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
> Note:
> Depends on commit 48a516363e29 ("dt-bindings: display: panel: add common dual-link schema")
> ---
>  .../bindings/display/panel/raydium,rm69380.yaml    | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/raydium,rm69380.example.dtb: panel@0: False schema does not allow {'compatible': ['lenovo,j716f-edo-rm69380', 'raydium,rm69380'], 'reg': [[0]], 'avdd-supply': [[4294967295]], 'vddio-supply': [[4294967295]], 'reset-gpios': [[4294967295, 75, 1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, '$nodename': ['panel@0']}
	from schema $id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

