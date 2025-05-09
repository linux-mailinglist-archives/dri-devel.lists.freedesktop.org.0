Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DDAB1597
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72BC10EA4D;
	Fri,  9 May 2025 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iHMEwdP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8D10EA42
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 13:45:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1033B62A1F;
 Fri,  9 May 2025 13:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC6C4CEEF;
 Fri,  9 May 2025 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746798331;
 bh=v5Uak0RcmfjhTO5Ysk+NhysPrBjg5pgA9cE1Hgd2gfE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=iHMEwdP23ywmij2dIw06QIo1o6RyOrSI+/zsCUo5nDKnUyppRzFrGEvOZ5PXwhj/F
 HMaL5F7Jd+nsTV2PeECplWgyg998OJc2hYhu0RYzRRzdUi39Hr7hZ+dEE96nl4KanE
 Mf7qKeRNhFFHkUHpkgMbdpEu8el4vEHEb8cjcLbIVIQgBjPQyzPpQ+gRJkfsrexTkk
 TJUd/vwH+S6QEvA2mxVyMV4q4QIXAlQYHgAU8eek2BOkuGqMFdCL1Cu4Im9S4Y4Asy
 X5ALlmXBPwdgyXhNwqVPVZRU5vJaVnqW2yv3ewUpZm1hFQqcPjfwNokpZNt6FarIvL
 nAxP6/23PbmFg==
Date: Fri, 09 May 2025 08:45:29 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sandy Huang <hjc@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250509070247.868-3-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
Message-Id: <174679832782.3268212.14187145716217204354.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
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


On Fri, 09 May 2025 15:02:47 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Rename binding file name to match compatible
> - Add more description about grf/phy/extcon
> - Fix coding style
> 
> 
>  .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
>  .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250509070247.868-3-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

