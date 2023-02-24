Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955FB6A1688
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 07:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1244E10E073;
	Fri, 24 Feb 2023 06:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178B10E073
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 06:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1677219284; x=1708755284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWznpWg9RbuSLRBMMC3vBtYtnTxJTP+ci55CRfYpUEc=;
 b=Jc8kpy1gJh1qkcsm+K5xpeZT4dCBaX4Hss7M4LSWVkbrY1NBgb3uObvp
 xpbKoX0Mhwz7V3EFyaVO0VHod21lVR6WT4Eyke35xs5HV/u0SSPZXWNqX
 2DfC/+4JNDUJ4YWkASwR/BnIVlCbqQuPrVAxcBk6uBVnyOjnu67oBcu9z
 z+Uchb4MXEWkCADzo2mHa4thOjjVQa2gnsai7M06KWFK7uYYgjMbFHaG+
 dYiTll4/ZcQ6Tq9xYuFk03wttM+nuZnuEeZxUxbXGgiVpQaaAsJjLGMkf
 hfrvLK4Do5FXPMIiGxohVvFJysCSCQCzMN3wuytvViJ+4H4LiD35+GL+e g==;
X-IronPort-AV: E=Sophos;i="5.97,322,1669071600"; d="scan'208";a="29287579"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 24 Feb 2023 07:14:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 24 Feb 2023 07:14:42 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 24 Feb 2023 07:14:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1677219282; x=1708755282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWznpWg9RbuSLRBMMC3vBtYtnTxJTP+ci55CRfYpUEc=;
 b=i7PrPYNPThvIBq9V0n0woiKcXyon53/Kg9y5UGsX9wyIp8rXTlsnrpLp
 AOsISZrpCoqpEVMJQzDS/UnHm7VLv6YO1d2hSGjOj84+ZSc0uposSyegS
 nluUtG8NxfBW9/6MKni7Goz1z3VunJ+M+nQ4JguU4/+kdqhmPlih2AyeC
 AcJNqsmz5yUQamABPx2aj8fGoWPbsMaBaSfkZ50+nna+cnicL36SXbSj5
 56kXvtwyL7gQThvdvKDqreHapjettKDKUGZpU3/R9XwGcw+tsh2aSaI7c
 F5WJnG4qHgvJsEdBkJnlqf2tkKTN41HpJ590Fs7VN0fa1paM+6dUiD4wo w==;
X-IronPort-AV: E=Sophos;i="5.97,322,1669071600"; d="scan'208";a="29287578"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Feb 2023 07:14:41 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0AB69280056;
 Fri, 24 Feb 2023 07:14:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Date: Fri, 24 Feb 2023 07:14:35 +0100
Message-ID: <2671044.mvXUDI8C0e@steina-w>
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

a gentle ping

Best regards,
Alexander

Am Mittwoch, 25. Januar 2023, 15:52:15 CET schrieb Alexander Stein:
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


