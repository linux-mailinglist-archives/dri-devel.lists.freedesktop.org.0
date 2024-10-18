Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283A9A3733
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078110E0A8;
	Fri, 18 Oct 2024 07:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="arjG7Dh2";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="M2Cewint";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8C10E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729236753; x=1760772753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iD4e3E6WAb3v3t3LKPK8kagukMfYt9x+P4AkPaprOXM=;
 b=arjG7Dh2PGaxAHZ9azxHKrIPuagLuyuunHB6A7yHpwlWE0/1j/xU6gbf
 T4klJx9I4X5rGYXeVjVyDEEETzb6ssOJLktwaU4/aNq9zYZ1NNaSWkrkG
 5oQ09y6XML7Dz7hze5gvJ3pmhiAjNOmfo61P9ZDcN6EfjpwMOhqvrBQee
 2Dw+I97SPpmtTXYF/d8Hh73PUvgYb8PyCwYdgfk8QWR4BxmpB5ljz4VyQ
 EdwFjkpV0aZkxMnHadp/WEfQmARPDERgKd4G8qsFSvUNAMYG2UYydgWrr
 Pa81mThnA1NtL93PzKjc4edfzRJ7mBCJObSLBlmCpmRloiQfK58/sNOno g==;
X-CSE-ConnectionGUID: 5s2JibW8TkKhBDmm3SSLwg==
X-CSE-MsgGUID: dPcjoGrGROOj/ycT4Q4aVw==
X-IronPort-AV: E=Sophos;i="6.11,213,1725314400"; d="scan'208";a="39534799"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Oct 2024 09:32:31 +0200
X-CheckPoint: {67120F0F-B-236878CD-F32272AF}
X-MAIL-CPID: 9916A76D1D510FFF75EFD12B72D979C2_2
X-Control-Analysis: str=0001.0A682F1B.67120F0F.00A7, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C735B17031A; Fri, 18 Oct 2024 09:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729236746;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iD4e3E6WAb3v3t3LKPK8kagukMfYt9x+P4AkPaprOXM=;
 b=M2CewintWs1uqCXwnMPUcVGIgkNZwGx05Xj/m43DnyXgqZOPCN2RQrUa55HHdXP/wMOzXU
 dMrwvNEJVLtiTcJdKSNSo+dJGuWtcimQoFMGSqaIh9pUekPd/a3ul7jtbWSu9GnaKCBMwp
 DDG3rd4DE1jvGaA2OO/Ff17o/XuDEOtlbUqf99Xz4xrkHCkLw9p++mm5LVrQd2ona9hunw
 kB+16dDFE+uZF+7dU+v1iAbGV6WnR5RFvUsFUcr7HeDbZfU9JtyhuvO6rxXGuMpy2dj1y2
 VyDSh+LhZEz4RBCtvZcX/TVkgstDPntK8nNDApeoajNaj9yaRnN9ZlHteOEM3g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch, dmitry.baryshkov@linaro.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 4/5] drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
Date: Fri, 18 Oct 2024 09:32:22 +0200
Message-ID: <46745071.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241018064813.2750016-5-victor.liu@nxp.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Freitag, 18. Oktober 2024, 08:48:12 CEST schrieb Liu Ying:
> Set DW HDMI platform data's output_port to 1 in imx8mp_dw_hdmi_probe()
> so that dw_hdmi_probe() called by imx8mp_dw_hdmi_probe() can tell the
> DW HDMI bridge core driver about the output port we are using, hence
> the next bridge can be found in dw_hdmi_parse_dt() according to the port
> index, and furthermore the next bridge can be attached to bridge chain in
> dw_hdmi_bridge_attach() when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
> set.  The output_port value aligns to the value used by devicetree.
> This is a preparation for making the i.MX8MP LCDIF driver use
> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/dr=
m/bridge/imx/imx8mp-hdmi-tx.c
> index 8fcc6d18f4ab..54a53f96929a 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -96,6 +96,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device =
*pdev)
>  		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
>  				     "Unable to get pixel clock\n");
> =20
> +	plat_data->output_port =3D 1;
>  	plat_data->mode_valid =3D imx8mp_hdmi_mode_valid;
>  	plat_data->phy_ops =3D &imx8mp_hdmi_phy_ops;
>  	plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


