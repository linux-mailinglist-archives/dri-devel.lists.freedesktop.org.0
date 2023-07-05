Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865067484DD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530CB10E19F;
	Wed,  5 Jul 2023 13:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B294710E17C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1688563362; x=1720099362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZUsSJckBzf9H7DIVezZWi/+l3dSTyRavKRYHkvSVGko=;
 b=pW6O0OGqvPxSv7h+dyFZaB3M26D1TGEWb9wektCHCoo2vmznaa+kcxYD
 CelI3UerDkrVKXw2iDOW/CAvWZPR959Ubb8ZE7qEZv4WlS3US4m1Eag9B
 FP0Lv5Xje8os/rwNX5Gnnc4KNqU4H0VQLttMWr+eAW4LnkwU3S8eONq6D
 TeM46UytPG/vhE/EHw4h6n/8yUKHyYkrp6xSbBeeFwnJkQFeG2lF9c3vP
 bdU2lSvmOJ/hT6EplNKnel+iu4NkePmx8/Cj/cVUnI174/CG0iIXptEWD
 8XBRe+xE/8a/J0Lx3SzAW1QrDuGf6ORep31+t9hesyp7apeaCEY1g5Czo g==;
X-IronPort-AV: E=Sophos;i="6.01,183,1684792800"; d="scan'208";a="31771950"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Jul 2023 15:22:39 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8D434280078;
 Wed,  5 Jul 2023 15:22:39 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Date: Wed, 05 Jul 2023 15:22:39 +0200
Message-ID: <4295711.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230125145215.3631071-1-alexander.stein@ew.tq-group.com>
References: <20230125145215.3631071-1-alexander.stein@ew.tq-group.com>
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

another gentle ping

Best regards,
Alexander

Am Mittwoch, 25. Januar 2023, 15:52:15 CEST schrieb Alexander Stein:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> The DE signal is active high on this display, fill in the missing
> bus_flags. This aligns panel_desc with its display_timing.
>=20
> Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
> Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c index 065f378bba9d..fbccaf1cb6f2
> 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3598,6 +3598,7 @@ static const struct panel_desc tianma_tm070jdhg30 =
=3D {
>  	},
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
>  };
>=20
>  static const struct panel_desc tianma_tm070jvhg33 =3D {
> @@ -3610,6 +3611,7 @@ static const struct panel_desc tianma_tm070jvhg33 =
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


