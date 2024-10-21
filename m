Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E79A5D5A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 09:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BDF10E429;
	Mon, 21 Oct 2024 07:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LB912OwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5410E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:43:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC6735C55B5;
 Mon, 21 Oct 2024 07:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC73CC4CEC3;
 Mon, 21 Oct 2024 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729496614;
 bh=NH5HPey058GB0TD3/kCCLHNV5gW+T94GSK3qrZ1VWiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LB912OwVWVQBbCAUgaq4D1R/4Og6UCpREUBV4dKCf+HA9Zj1HV8KK0m4R4hcz7jJT
 K2DNo2u9RJOAMvm8oGHCeIjoGOc82wg+Z/uAMrQF59mRFlxLrw/Dvtusk+/XPgHAbG
 RwLfXTRZ8inyMo7QDAGkTp+Dl7LRT2sq8HZFZAyC/KHUw+3NxIc7+0N5f5fnHOPiYA
 JpntmH9LClGKULiEDJwj1TkRzVY4R7wUl3i92nI205HTbxF3n2HVNy8GCQqdtHNXo0
 aK46AjjWGwMFbpvJyvMWjlIdRfUwNt4W4wF1axsJUEV95dtWi6NYIoSBaoE0PD6Mhv
 qL42rpN3KVVAA==
Date: Mon, 21 Oct 2024 09:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-10-victor.liu@nxp.com>
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

On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> documents dual-link LVDS display common properties.  Reference the ports
> property defined in lvds-dual-ports.yaml to save lines.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> index 10ed4b57232b..e80fc7006984 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -22,6 +22,7 @@ description: |
>    If the panel is more advanced a dedicated binding file is required.
>  
>  allOf:
> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>    - $ref: panel-common.yaml#

So dual link panels common binding does not fit here? sorry, this is
just introducing mess and confusion.

Best regards,
Krzysztof

