Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E8A90B1B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 20:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7B010E9A3;
	Wed, 16 Apr 2025 18:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vFwg2W7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7810E9A3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 18:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6CEAD5C3A7C;
 Wed, 16 Apr 2025 18:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98A1C4CEE2;
 Wed, 16 Apr 2025 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744827238;
 bh=E4ZCn18zFjw6q5PMnJTlMEpj3cHQAfhZ5PeKZVr6sKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vFwg2W7ulzfpoDWHo1BLmWMkAnQCxVGe2j5NOi6tePl5s07giWZMkhjfYjNaGhc+E
 DoBfd+PAHJHY/uyGUOngwGsQdhpWJHeDC6rfW5EjIw+t0fUgVImU6oGJEL7ADtGIxP
 6XJk9xzY9LEnlV+XZRLm/mfjI0maPA5jnsuQoRLQD7zcaiTgFVGcbomv13di2oNWOD
 CRvFOfgosj6N16eIFvBGl8ilBctjMJxXdAbEcVnGTxSMAnidclUHGCLaB9Qu8f16rt
 Rwpf8jN2dNbArsyt3fhr1k6LvGZP6RYSu6VLJDX54u6I0+4BdCLquqlRV0xVUbi3ZQ
 Fp+tph9YwLL/g==
Date: Wed, 16 Apr 2025 13:13:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 imx@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl-imx-drm.txt
 to yaml format
Message-ID: <174482723439.3590548.522151644513682982.robh@kernel.org>
References: <20250415212943.3400852-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415212943.3400852-1-Frank.Li@nxp.com>
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


On Tue, 15 Apr 2025 17:29:42 -0400, Frank Li wrote:
> Convert fsl-imx-drm.txt to yaml format and create 5 yaml files for
> differences purpose.
> 
> Additional changes:
> - add missed include file in examples.
> - add clocks, clock-names for ipu.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../imx/fsl,imx-display-subsystem.yaml        |  36 ++++
>  .../display/imx/fsl,imx-parallel-display.yaml |  74 ++++++++
>  .../bindings/display/imx/fsl,imx6q-ipu.yaml   |  97 +++++++++++
>  .../bindings/display/imx/fsl,imx6qp-pre.yaml  |  55 ++++++
>  .../bindings/display/imx/fsl,imx6qp-prg.yaml  |  52 ++++++
>  .../bindings/display/imx/fsl-imx-drm.txt      | 160 ------------------
>  6 files changed, 314 insertions(+), 160 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> 

Applied, thanks!

