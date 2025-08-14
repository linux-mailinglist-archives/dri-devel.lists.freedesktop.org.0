Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C4B26FA6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 21:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1888A10E8D2;
	Thu, 14 Aug 2025 19:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E/CQr1WU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422710E218
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 19:21:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7E96A57733;
 Thu, 14 Aug 2025 19:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD5C4CEEF;
 Thu, 14 Aug 2025 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755199274;
 bh=ifOHHx6V2KJdZ0pCXCcV9hrJ66lyUldfnEN6tn1F6FQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=E/CQr1WU3wmFr4yYBtcvOxhjmvG+UqTkSdbQbsWGXyfo07dtdFD7dcJucf2eXNHEH
 tKcsfJ/7ilDp/xWqD2XoQbHZQMSYFmeTOfB4W9B9oPwaUxgJPjQnQqIZ9QM7eUW7fi
 unqvWfZwbOd+/0vjYMGYbWECyEkt5LuUecjt2x0wHTxRFYCPeAVZTjcRrqVMfQB4rX
 Pkcv8T5NblgShm3aKtWbIcJ6Ipe8iTxuAHYdMGon2vQzhw/GrzeQ1lTC0kyUQcJ8ux
 KYLyhveBccC7PXYUsQm4fGLDs2yQ51SRvWZqHQdPvWQfx07Xw06L2GvPiY+0CjKvkA
 XPmblu6HQWC2Q==
Date: Thu, 14 Aug 2025 14:21:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Han Gao <rabenda.cn@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Fu Wei <wefu@redhat.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Guo Ren <guoren@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Heiko Stuebner <heiko@sntech.de>, 
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Yao Zi <ziyao@disroot.org>
To: Icenowy Zheng <uwu@icenowy.me>
In-Reply-To: <20250814164048.2336043-5-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-5-uwu@icenowy.me>
Message-Id: <175519927254.3738647.1422282944471640003.robh@kernel.org>
Subject: Re: [RFC PATCH 4/8] dt-bindings: display/bridge: add binding for
 TH1520 HDMI controller
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


On Fri, 15 Aug 2025 00:40:44 +0800, Icenowy Zheng wrote:
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
> with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
> and two reset controls.
> 
> Add a device tree binding to it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250814164048.2336043-5-uwu@icenowy.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

