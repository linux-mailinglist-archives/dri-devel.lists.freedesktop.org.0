Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CA6F683C
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3B10E40C;
	Thu,  4 May 2023 09:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF410E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683192237; x=1714728237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NR2UbKIf9odHdN64bSha7oCbxta5plUI/SyYGxOOLwM=;
 b=IoyCTD71rWGRrqnIDXrBP21h/ObwitqX+qPjChPlkxchtKcSOmbQ6wh8
 zrJlzJiVfDgc/1+DHjKu0iGQHay74qHV9PWh4U2Xx2nOZe+6O+Lle6BFt
 j4YEMc5ulO3//sIdew5dIY+eDix8S86tYa6F0fmtV8fvZcDFJFeL2dgSw
 zXkvGdDAAbgY8KOIDfk+hCnLcwrQLXQO4/safyG5tCl2tTdekVmKhxe4P
 Wj3BvoY4aMau29lPIhvTgGgEBJ3U1DKAA69xQ3JSYOYUsj8x6CGTlxb0G
 uTB1whW55Bozp2PH4Qi9YhIE5+TQKzCIxJP7VTmnzN7BAMiQnwpb/xCa5 w==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30715364"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 11:23:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 11:23:55 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 11:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683192235; x=1714728235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NR2UbKIf9odHdN64bSha7oCbxta5plUI/SyYGxOOLwM=;
 b=GZ4Oj5d/vbrK3eP3eqjb5JkrqTbabWywkuuvfHEyxgWEkn8vQEXUWoHx
 QsLPPI+2/lysFqt7lfCGluvnOAdVGFQbL4Nm3VRnTZ7vniBUPOwR1qJWN
 F6EKkbHoSCeNrX8zgkGYZtG7qumKPbBDl+jocv1BXlJs2/3n5lhVQskiF
 dKWUxVubacNixWy30+Xmxp0ewGws/bG508iGxJpMYs137BeSz9s5/SgKZ
 9mUZcNYfxodn0uUC1pZcBrZ32ZKi9EHvrdRYBKR3uSsnZFzxU7LaI3jSz
 QAW7+HAwW8XCWQof9E06NxPQaKNf3sKPsqZJP0iAzfIDSlryaz592NfOK Q==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30715362"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 11:23:53 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 14418280056;
 Thu,  4 May 2023 11:23:53 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V3 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Date: Thu, 04 May 2023 11:23:51 +0200
Message-ID: <3496931.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

Am Dienstag, 2. Mai 2023, 03:07:52 CEST schrieb Adam Ford:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the va=
lue
> requested by the bridge chip.
>=20
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should w=
ork
> on i.MX8M Mini as well.
>=20
> Adam Ford (6):
>   drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>   drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>   drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>   drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>   drm: bridge: samsung-dsim: Support non-burst mode
>   drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
>     mode
>=20
> Lucas Stach (1):
>   drm: bridge: samsung-dsim: fix blanking packet size calculation
>=20
>  drivers/gpu/drm/bridge/Kconfig        |   1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c | 150 ++++++++++++++++++++++----
>  include/drm/bridge/samsung-dsim.h     |   5 +
>  3 files changed, 136 insertions(+), 20 deletions(-)

Whole series tested on TQMa8MxML/MBa8Mx using a SN65DSI84 + Tianma TM070JVH=
G33=20
display.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> V3:  When checking if the bust-clock is present, only check for it
>      in the device tree, and don't check the presence of the
>      MIPI_DSI_MODE_VIDEO_BURST flag as it breaks an existing Exynos
>      board.
>=20
>      Add a new patch to the series to select GENERIC_PHY_MIPI_DPHY in
>      Kconfig otherwise the build breaks on the 32-bit Exynos.
>=20
>      Change vco_min variable name to min_freq
>=20
>      Added tested-by from Chen-Yu Tsai
>=20
> V2:  Instead of using my packet blanking calculation, this integrates
>      on from Lucas Stach which gets modified later in the series to
>      cache the value of the HS-clock instead of having to do the
>      calucations again.
>=20
>      Instead of completely eliminating the PLL clock frequency from
>      the device tree, this makes it optional to avoid breaking some
>      Samsung devices.  When the samsung,pll-clock-frequency is not
>      found, it reads the value of the clock named "sclk_mipi"
>      This also maintains backwords compatibility with older device
>      trees.
>=20
>      This also changes the DPHY calcuation from a Look-up table,
>      a reverse engineered algorithm which uses
>      phy_mipi_dphy_get_default_config to determine the standard
>      nominal values and calculates the cycles necessary to update
>      the DPHY timings accordingly.


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


