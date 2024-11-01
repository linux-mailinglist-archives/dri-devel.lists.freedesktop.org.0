Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89B9B9677
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 18:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB3210E9EC;
	Fri,  1 Nov 2024 17:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oltbq8yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD65C10E9EC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 17:21:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3A085C55AB;
 Fri,  1 Nov 2024 17:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB98C4CECD;
 Fri,  1 Nov 2024 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730481712;
 bh=3A2/E11RnZgbKpQM60gPR6/16KeHF4eQh342j9UDESM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oltbq8yl/+NgUCRoK5gDXZ6TqGHRBXXNP0l8DZunO8JLxAsOlx04a2jPRDnpDwNaz
 Uij8n+ekZoW3LkB/iapCqXKieuqN3HpmXQaR54bKDfs8yhZ7v9aEsNYAxPVmTRO0nb
 1zWngrKGYJ+7tvVXm6145d4H13gbQWqbvYk20ZJ/eXjK/koeWE8gStyXHWNlWZZzRY
 vKdWq+p01gxF+1j0ruIM74qz7+e+THH9S2zLTzdYwEJ1Ct7ScITRPJKyzgw3WHNikK
 mjQyfL6nBYAuXO4iwFYRC2ip56c1drrEEKtD3ihVOhBj3Sqq0xpjNQQibLKTaLeTgE
 i5GJwlmmFCynQ==
Date: Fri, 1 Nov 2024 12:21:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de,
 jernej.skrabec@gmail.com, imx@lists.linux.dev,
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com, jonas@kwiboo.se,
 catalin.marinas@arm.com, will@kernel.org, mripard@kernel.org,
 shawnguo@kernel.org, hverkuil@xs4all.nl,
 maarten.lankhorst@linux.intel.com, festevam@gmail.com,
 quic_bjorande@quicinc.com, sakari.ailus@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
 s.hauer@pengutronix.de, geert+renesas@glider.be,
 thierry.reding@gmail.com, neil.armstrong@linaro.org, marex@denx.de,
 mchehab@kernel.org, simona@ffwll.ch, linux-media@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de,
 prabhakar.mahadev-lad.rj@bp.renesas.com, krzk+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, arnd@arndb.de, sam@ravnborg.org,
 andrzej.hajda@intel.com, rfoss@kernel.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263
 LVDS to HDMI converter
Message-ID: <173048170995.3772353.5460654511674582491.robh@kernel.org>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-10-victor.liu@nxp.com>
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


On Mon, 28 Oct 2024 10:37:36 +0800, Liu Ying wrote:
> Document ITE IT6263 LVDS to HDMI converter.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for
>   port@1.
> * Drop "data-mirror: true"(30-bit LVDS data bit order is not reversed).
> 
> v3:
> * Reference lvds-dual-ports.yaml.  (Dmitry)
> * Add data-mapping DT property.  (Dmitry, Biju)
> * Allow data-mirror.
> * Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)
> 
> v2:
> * Document number of LVDS link data lanes.  (Biju)
> * Simplify ports property by dropping "oneOf".  (Rob)
> 
>  .../bindings/display/bridge/ite,it6263.yaml   | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

