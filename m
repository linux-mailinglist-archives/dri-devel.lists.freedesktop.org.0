Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647359A5D47
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 09:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C48510E07A;
	Mon, 21 Oct 2024 07:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BDMEv9Cd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1639410E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:39:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D7FBA41B75;
 Mon, 21 Oct 2024 07:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34A9C4CEC3;
 Mon, 21 Oct 2024 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729496397;
 bh=t7UAac/htt4W25ejQemVdCOasvKrcJlRzstvxEL64Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BDMEv9Cd9HxMft6YXRpvVjtTrMfioKFRW4haEgoqv+DR6MV4NCJSHDjMy7iC4ZJP9
 i+g9IrXdtSSzLCOA78mwb1s+7nT1/3XTkA2PinHuBoQkfJ5oGh8jNtvtgz9vhLO3Ym
 +SsbKgOLme2Vt1Jc7COmGX9drY+ukMtNTKZbJdlkhW5ZeM+CC3jtZCOaH2Wq3eYLON
 6cBH6mvf5gqybshixouMzvCO+0p0O8TCKddHG+Ij4/8il+u0wDsL+OAX8XjyFeBoSi
 CT0x2QrNvq69EOx5BOp/a9F05nwULABHM770Gfp2zn15WfdnC717zSMnBokkAL+9VO
 Gryg6knxtH4oA==
Date: Mon, 21 Oct 2024 09:39:53 +0200
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
Subject: Re: [PATCH v3 07/15] dt-bindings: display: lvds-data-mapping: Add
 30-bit RGB pixel data mappings
Message-ID: <zcqpk37cxe76jqui5k3yyi5tlsm63zhkpsktg7h655e7cvv42g@nlhd2s3h3a7f>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-8-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-8-victor.liu@nxp.com>
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

On Mon, Oct 21, 2024 at 02:44:38PM +0800, Liu Ying wrote:
> Add "jeida-30" and "vesa-30" data mappings that are compatible with JEIDA
> and VESA respectively.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.
> 
>  .../bindings/display/lvds-data-mapping.yaml   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

