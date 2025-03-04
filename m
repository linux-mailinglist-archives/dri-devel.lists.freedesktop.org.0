Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CFA4E21C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB08F10E2E4;
	Tue,  4 Mar 2025 15:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="MXl9PX4B";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HFuLYNrg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649A810E20D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1741100432; x=1772636432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lykf3xaLUig9uEA0bAfwrVFURjMxGoC8WA1DRVWsg3U=;
 b=MXl9PX4BvdcS5am8mt973KVWwjuY6rriN+7u5FWE7KgP9HqEbn53WFx3
 QMRqf99bxJGqI2+NrEaGYX58wz7dnUpF/68kRMsNfGtLrRJkPfarK44Ia
 BArrq1YUyo2oFl0V1oYi/+O43sB7XvzthCVQMb9bHvL72p16yWw63N2DS
 Httl97VlGn0uck6jLH4QGLjeDSQjn2Ds9NEDePX0QndtUSgpH9dCz0Q+8
 NGc8R20CYmojtnz90dxZm5vqKMGZaAdP8wQHB+4qFErkXMaycui/mm0kR
 vafLrKoPc0t7PWh7oN7Tdl24WvEOVKzyoKS8GBOlf31QA/lOfX7Sb0mg9 Q==;
X-CSE-ConnectionGUID: IRExU1k4THu6QG+Ybe9BqA==
X-CSE-MsgGUID: XSWG8FDkRNmak4xANBU0ww==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; d="scan'208";a="42271641"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:00:30 +0100
X-CheckPoint: {67C7158E-1E-903EAEAC-E04C76C8}
X-MAIL-CPID: C2F7047D101734CC6A65597C5FF5C1BA_5
X-Control-Analysis: str=0001.0A006369.67C71591.004C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CA0B16C670; Tue,  4 Mar 2025 16:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1741100425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lykf3xaLUig9uEA0bAfwrVFURjMxGoC8WA1DRVWsg3U=;
 b=HFuLYNrgATor3X44V0mhFXFM9yZTVQYOs9nf9eofeFEt8zh0aiX6SnpTHWS3ZjKzmQT3wk
 NPSksgs1prE95SLty+lkXiYQ6CCVGQf5Um7WehPNb+T5bjgHVCzCETclsaMeveuErfTBUJ
 Qqg/sqoxcYfwue0/+SaQqjkibmA4TIMY66ysDHmCAawZanMhtbljZY5rliBEccHwV20nEa
 L+WkFqpeuklmPkuWL1JQ5UfEm/7+bDk2tdwaLw4Kc96sOM41pSeRhBOs2RLAOCKc757ahi
 BHfILKL/SCJp0JiRygtITE/CgoJke523+rJeXxMFj+fvxtiF0EpkKvimBEBHMQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 0/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
Date: Tue, 04 Mar 2025 16:00:21 +0100
Message-ID: <22618349.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
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

Am Dienstag, 4. M=E4rz 2025, 11:15:25 CET schrieb Liu Ying:
> Hi,
>=20
> This patch series aims to add DPI color encoder support as a simple DRM
> bridge.  A DPI color encoder simply converts input DPI color coding to
> output DPI color coding, like Adafruit Kippah DPI hat[1] which converts
> input 18-bit pixel data to 24-bit pixel data(with 2 low padding bits in
> every color component though).  A real use case is that NXP i.MX93 11x11
> EVK[2] and i.MX93 9x9 QSB[3] boards may connect a 24-bit DPI panel through
> the Adafruit Kippah DPI hat.  The display pipeline is
>=20
> i.MX93 LCDIF display controller(RGB888) ->
> i.MX93 parallel display format configuration(RGB666) ->
> on-board Raspiberry Pi compatible interface(RPi)(RGB666) ->
> Adafruit Kippah DPI hat(RGB888 with 2 low padding bits in color component=
s) ->
> 24-bit "ontat,kd50g21-40nt-a1" DPI panel
>=20
> [1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downlo=
ads
> [2] https://www.nxp.com/design/design-center/development-boards-and-desig=
ns/i.MX93EVK
> [3] https://www.nxp.com/design/design-center/development-boards-and-desig=
ns/IMX93QSB

Thanks for this series.
Actually I was about to create a similar (dumb) bridge. My use case is wrong
wiring on hardware for DPI displays. The current workaround was to use a
"new" display compatible with bus_format changes from
MEDIA_BUS_FMT_RGB666_1X18 -> MEDIA_BUS_FMT_RGB888_1X24.

I added this new bridge and changed my DT and it works flawlessly.

Best regards
Alexander

> Liu Ying (5):
>   dt-bindings: display: Document DPI color codings
>   drm/of: Add drm_of_dpi_get_color_coding()
>   dt-bindings: display: simple-bridge: Document DPI color encoder
>   drm/bridge: simple-bridge: Add DPI color encoder support
>   drm/bridge: simple-bridge: Add next panel support
>=20
>  .../display/bridge/simple-bridge.yaml         |  89 +++++++++++-
>  .../bindings/display/dpi-color-coding.yaml    |  90 ++++++++++++
>  drivers/gpu/drm/bridge/Kconfig                |   1 +
>  drivers/gpu/drm/bridge/simple-bridge.c        | 132 ++++++++++++++++--
>  drivers/gpu/drm/drm_of.c                      |  43 ++++++
>  include/drm/drm_of.h                          |   7 +
>  6 files changed, 348 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/dpi-color-c=
oding.yaml
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


