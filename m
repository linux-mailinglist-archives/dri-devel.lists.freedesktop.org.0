Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C66FC473
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAA010E37C;
	Tue,  9 May 2023 11:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E510E37C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683630185; x=1715166185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L67SAKg0gFeSqyv8C2RvE1OCd2ZFzCKbUgsPtTmEV0k=;
 b=hfzeqEe9ZM/OtasZgXSq2aT/tWsXo6wL30234cOLzqvT07U5+JyUg5rP
 W5Jyq3pqWHw4yykoP687XFHwsywqKXKGE42pHjFHtTDAm7UnW6bLc/ZG4
 rQy8jMiEt1Rn0aeR0Ahkv8OXnfMRciAtOReXlsaAyMK232ZTpuFgLjIoV
 TG50tN8VVCbzWVIuifCmEfZfdT2Jsp7vb0TFpsoL+LbERAghD00uU8B/q
 6upqCMFmzoJN88Kbo/CeYsoW0/rwfNOwZwtEtSDOyGI1NEf6ZsQxBBtGF
 vemH0e2iKM1n7Eg7kdvCEfvTg227AJcwkBGuW8shdS7850p2f6LIbY1h0 A==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677538800"; d="scan'208";a="30801865"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 May 2023 13:03:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 09 May 2023 13:03:02 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 09 May 2023 13:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683630182; x=1715166182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L67SAKg0gFeSqyv8C2RvE1OCd2ZFzCKbUgsPtTmEV0k=;
 b=WXLV34PZivoKHRT69bhxrKJV211M23i/9bb/EJJ07B+Cp5Oor7FyDlTV
 J0bFGLOKYw965wlPArVnLaCNvzqe3WbDtaLD64avibLACtXY9RsbsEtrq
 zzcxqMvwAkbKd0Y4rhw3fJ8opp+3i1wMBqFt7QvrfPR01wffo2XlRmaq4
 Y4GRKXukfO8RPZ+jzrWPIH3eKX/ClWFzeCFbQk+lIij8qJpSv1UBr2s5f
 MNWAFJ9eD4a1JAL28iiSCzIW+E+RDe8LEjvdESbBNfSnjImQEMU1GD5Kk
 Ml1qitajf3ptX3evVKuxsofcWot0Y+BL/DenPPvhmslVjK1BhCz3jD7/J w==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677538800"; d="scan'208";a="30801864"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 May 2023 13:03:02 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1AE75280056;
 Tue,  9 May 2023 13:03:02 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Date: Tue, 09 May 2023 13:03:01 +0200
Message-ID: <13263404.uLZWGnKmhe@steina-w>
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

Hello,

Another gentle ping.

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


