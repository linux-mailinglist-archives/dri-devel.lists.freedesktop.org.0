Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258EC829598
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D207C10E576;
	Wed, 10 Jan 2024 09:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC6F10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1704877364; x=1736413364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8VAs8RD0D5Hld2XttaEPBvwgzeka2Fx31lJzGl7UAQ=;
 b=YKWxHeT3QrvVCGqdh3p5AS5mHcJfqMoCqWIvuk6IOwKRRrMCrI6lpPup
 r631m35puhOLk2x1lKGQbokXEEbd6hEau5lgroGuMN+rJd2V7hZ4orhDs
 A2e0uGm8ZafEJB0UnsO5xtMkhk4t2AQEWlSZT3Yr6B5Xxrkl75ribQI1V
 WsqvothUphKcbYQrkh8x6dSPrHHGUU4WHZ5I9m6Qz3spSXVBYcHyv7kaG
 /qhGywQPaeyjMrCnKCr8Ob0U1voRwVN30lHwM3mFie5ls5SP2faa1d/Ky
 fR63u+4QJC0Blg6Gay74SgyTMCez4s/ekjWYpE7Rfwmok56q9JBH9Ystq g==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; d="scan'208";a="34823019"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jan 2024 10:02:42 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 96421280075;
 Wed, 10 Jan 2024 10:02:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/1] drm: panel-simple: add missing bus flags for
 Tianma tm070jvhg[30/33]
Date: Wed, 10 Jan 2024 10:02:42 +0100
Message-ID: <2321069.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231012084208.2731650-1-alexander.stein@ew.tq-group.com>
References: <20231012084208.2731650-1-alexander.stein@ew.tq-group.com>
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
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

is there something missing? Or can someone pick this?

Thanks
Alexander

Am Donnerstag, 12. Oktober 2023, 10:42:08 CET schrieb Alexander Stein:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> The DE signal is active high on this display, fill in the missing
> bus_flags. This aligns panel_desc with its display_timing.
>=20
> Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
> Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")
>=20
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes in v2:
> * Collected Sam's R-b
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c index 07c627de70534..b5b79f1789519
> 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3867,6 +3867,7 @@ static const struct panel_desc tianma_tm070jdhg30 =
=3D {
>  	},
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
>  };
>=20
>  static const struct panel_desc tianma_tm070jvhg33 =3D {
> @@ -3879,6 +3880,7 @@ static const struct panel_desc tianma_tm070jvhg33 =
=3D {
>  	},
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
>  };
>=20
>  static const struct display_timing tianma_tm070rvhg71_timing =3D {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


