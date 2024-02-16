Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23353857678
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 08:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7576F10E319;
	Fri, 16 Feb 2024 07:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="aHTpKjqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1210E319
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708067252; x=1739603252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBfhOO5MG89bHmVdv1ErRWoZYXedtmnnpZfysTdIvno=;
 b=aHTpKjqjybz6VLtKZkgCYcSzYpKtiBBI7u9yd6McMVWmyvlqAN+5/aoc
 HOLTWQIAmHQPAskNNAojw6d2n9y79sYr/j+mnDkijZAnzn8oHp44csdgi
 t2UboEdeeXUPIHFtQyszdFclhA1aCDmXHO7qYC/qGv0x5kQuBlmkxemxF
 cPy+2Yky/zHVRa2pNx6ltDM/gl4ipBVgtVdZ08lvff7owZg6nEh8CWKP4
 TQtA5ZpqGSXlLEeAHE2wHDAVC5ZexnKZrJgJYgGhU9kCFrpZ0B3EB/RO8
 9IgoC4rB3N5pTIhorR6ZtdPRiKsBis/V3I42KyMZmTgQDjFS8Q3gLiWFX Q==;
X-IronPort-AV: E=Sophos;i="6.06,163,1705359600"; d="scan'208";a="35436739"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Feb 2024 08:07:29 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 56DA7280075;
 Fri, 16 Feb 2024 08:07:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Sandor Yu <Sandor.yu@nxp.com>
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, sam@ravnborg.org
Subject: Re: [PATCH v13 4/7] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Date: Fri, 16 Feb 2024 08:07:31 +0100
Message-ID: <3549548.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5bd01470cf971e2385ecd169c3d5ac659a020973.1707040881.git.Sandor.yu@nxp.com>
References: <cover.1707040881.git.Sandor.yu@nxp.com>
 <5bd01470cf971e2385ecd169c3d5ac659a020973.1707040881.git.Sandor.yu@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

thanks for the update.

Am Sonntag, 4. Februar 2024, 11:21:49 CET schrieb Sandor Yu:
> Add a new DRM DisplayPort and HDMI bridge driver for Candence MHDP8501
> used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> standards according embedded Firmware running in the uCPU.
>=20
> For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> SOC's ROM code. Bootload binary included respective specific firmware
> is required.
>=20
> Driver will check display connector type and
> then load the corresponding driver.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> v12->v13:
> - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> - Fix build warning
> - Order bit bpc and color_space in descending shit.
>=20
> v11->v12:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function
> cdns_dp_aux_transferi(). - Remove unused parmeter in function
> cdns_dp_get_msa_misc
>   and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
>=20
>  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
>  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 316 ++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699 ++++++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 679 +++++++++++++++++
>  6 files changed, 2077 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>=20
> [snip]
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c new file mode 100644
> index 0000000000000..0117cddb85694
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> @@ -0,0 +1,699 @@
> [snip]
> +
> +const struct drm_bridge_funcs cdns_dp_bridge_funcs =3D {
> +	.attach =3D cdns_dp_bridge_attach,
> +	.detect =3D cdns_dp_bridge_detect,
> +	.get_edid =3D cdns_dp_bridge_get_edid,

Please note that with commits d807ad80d811b ("drm/bridge: add ->edid_read h=
ook=20
and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge: remove ->get_e=
did=20
callback") the API has slightly changed meanwhile.

> +	.mode_valid =3D cdns_dp_bridge_mode_valid,
> +	.atomic_enable =3D cdns_dp_bridge_atomic_enable,
> +	.atomic_disable =3D cdns_dp_bridge_atomic_disable,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode 100644
> index 0000000000000..e6ed13b9f9ca3
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> @@ -0,0 +1,679 @@
> [snip]
> +
> +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs =3D {
> +	.attach =3D cdns_hdmi_bridge_attach,
> +	.detect =3D cdns_hdmi_bridge_detect,
> +	.get_edid =3D cdns_hdmi_bridge_get_edid,

Please note that with commits d807ad80d811b ("drm/bridge: add ->edid_read h=
ook=20
and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge: remove ->get_e=
did=20
callback") the API has slightly changed meanwhile.

> +	.mode_valid =3D cdns_hdmi_bridge_mode_valid,
> +	.mode_fixup =3D cdns_hdmi_bridge_mode_fixup,
> +	.atomic_enable =3D cdns_hdmi_bridge_atomic_enable,
> +	.atomic_disable =3D cdns_hdmi_bridge_atomic_disable,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};

Please rebase your patch series, thanks.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


