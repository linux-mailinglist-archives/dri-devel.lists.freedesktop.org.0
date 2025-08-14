Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7BB26FA4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 21:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9ED10E123;
	Thu, 14 Aug 2025 19:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mlb6TUs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1181A10E123
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 19:21:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DDF626020A;
 Thu, 14 Aug 2025 19:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7156EC4CEED;
 Thu, 14 Aug 2025 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755199273;
 bh=dq982r/AGUJviv6Tq6qfbL5MF+uO2Bkx/27uyYzXpME=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=mlb6TUs5WKp7knR8qxZJ2aAPETXXSKNIA9vVz+mf+9q1RqadjO7sqWW/ILwLXYzGn
 fhEAbh6CP5kgjXBCUH/R0QM36T8rVW0hnhfhPTPUVpkcpq8U0w9fXUOtuqj0qMtZWr
 GeGjWi6hR0tQzQJcG6ae4TXI6Vb8IPNY6/42f677jX/VaVPhP+NdrcjzUJ8SIi7ifR
 8F+R3mcTG3894jKnUH+oxVZPj3NfjxBqhnfu5YeiN9NcixODS3nlRBkafpb6BYk/Oc
 Ak2mW0bS6yursdWdMxkDPV3QqGZlJZHI/AhRLVpo2zvi6XI3YgN8r7aZKeOEpsuajR
 S8dDGnOq1PehQ==
Date: Thu, 14 Aug 2025 14:21:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Yao Zi <ziyao@disroot.org>, 
 Maxime Ripard <mripard@kernel.org>, Han Gao <rabenda.cn@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 linux-riscv@lists.infradead.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
In-Reply-To: <20250814164048.2336043-3-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-3-uwu@icenowy.me>
Message-Id: <175519927193.3738618.6789267440737807645.robh@kernel.org>
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
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


On Fri, 15 Aug 2025 00:40:42 +0800, Icenowy Zheng wrote:
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../bindings/display/verisilicon,dc.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/display/verisilicon,dc.example.dts:41.28-52 Unexpected 'TH1520_RESET_ID_DPU_CORE'
Lexical error: Documentation/devicetree/bindings/display/verisilicon,dc.example.dts:42.22-45 Unexpected 'TH1520_RESET_ID_DPU_AXI'
Lexical error: Documentation/devicetree/bindings/display/verisilicon,dc.example.dts:43.22-45 Unexpected 'TH1520_RESET_ID_DPU_AHB'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/display/verisilicon,dc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250814164048.2336043-3-uwu@icenowy.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

