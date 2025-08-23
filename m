Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C3B32932
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5F10E12B;
	Sat, 23 Aug 2025 14:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="q0plEv6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876510E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=qgOhBWr0VH5vsqKN3OIl1v6yHrxWu6HVlafZRGepUuY=; b=q0plEv6FrjIOqQEFTKYMVTWCFU
 pG9D2Y0KESLkIMyT8pGdkHgwR6I4cT+0uoSMIMpGqUzJOhvN+aVl9C04Ezv+hWciV4e5M2dhSn2nT
 O2LVNiWGjWfAlp6n+RYaFGG469Az7nawP0Li6p0m42FGrCHntxNlw1Lyy7w6phzshxFM99LCbOLaZ
 MPy+xaZZZcGOlfcDXbpw8Ffp0IRCbjARsSQs4y7fnmZz50ZF05hMEmKqmM2Q9sDiItBCacb8IDdcZ
 Xr+F6G73ZjnMNp2MmWyB69u9A5xwDQSTEmkr/uIZxzmKDDqjEeWxmQ88FMaJFjijsyQyXkPstF4Q1
 BcVPZOHA==;
Received: from i53875b90.versanet.de ([83.135.91.144] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uppLC-0000VC-06; Sat, 23 Aug 2025 16:35:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 04/10] MAINTAINERS: Add entry for DW DPTX Controller
 bridge
Date: Sat, 23 Aug 2025 16:35:32 +0200
Message-ID: <6121390.uKWtJMOXK1@diego>
In-Reply-To: <20250822063959.692098-5-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
 <20250822063959.692098-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 22. August 2025, 08:39:48 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Add an entry for the DW DPTX Controller bridge driver.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> (no changes since v5)
>=20
> Changes in v5:
> - First included in this version.
>=20
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfa28b3470ab6..0ae7d13c2b3c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7999,6 +7999,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
>  F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
> =20
> +DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
> +M:	Andy Yan <andy.yan@rock-chips.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> +F:	drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +F:	include/drm/bridge/dw_dp.h
> +
>  DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  S:	Maintained
>=20




