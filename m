Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F259E8C71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050610E490;
	Mon,  9 Dec 2024 07:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GsBCo1Vu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682610E490
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:42:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D47BA40FC8;
 Mon,  9 Dec 2024 07:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40FFC4CED1;
 Mon,  9 Dec 2024 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733730125;
 bh=iXDqLuzxLZKBI8aoHt6mcXjhjBAUdKfhlnHvvviHoMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GsBCo1VuY3xVO6bn2VZVSkTjt9jLXpByR4Y6LEzN/Tpb3RJnl5Hu+64YUYFlnx4LH
 xapVtQWJGQE1cf5d5jIQKHE5/4MZ4IhM7AdyByGk5A0TP8BAejBaXgTMPxq17lkTyx
 qq0K7Tse3yot1UbEsfP6mb8QmDmBVV4t2SxCTOHHxaZAkD3MBgwHU+QyLsdpV62jEK
 ZwpkbeBEgS9DnFDwa5yfImwROByK/zE30UDxD1doaYey0CDJoedwRH57HxtOcVPvHe
 lv/X1rhrmznuTy2yB6JJRju3Jktp1AqS5jopYUyWrydCLrvHDTCodnujDRt/CUcJSh
 XmmSCL0H4K5BQ==
Date: Mon, 9 Dec 2024 08:42:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v4 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 properties for ti,lvds-vod-swing
Message-ID: <lbbayope3b6nkzfflgb2fbgakxpx7uewcslw7mynn5gki6vlxp@4amjbijjcrnt>
References: <20241205134021.2592013-1-andrej.picej@norik.com>
 <20241205134021.2592013-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205134021.2592013-2-andrej.picej@norik.com>
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

On Thu, Dec 05, 2024 at 02:40:19PM +0100, Andrej Picej wrote:
> Add properties which can be used to specify LVDS differential output
> voltage. Since this also depends on near-end signal termination also
> include property which sets this. LVDS differential output voltage is
> specified with an array (min, max), which should match the one from
> connected device.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

