Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B732A34BE0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF910EB5E;
	Thu, 13 Feb 2025 17:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Ws91bnDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62110EB5E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739467611; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DBi2zEpYnKy4XuIgWkaFTscHZ7nB/Yg9TWfeiuiqUtEh568pSlCHcprWV131jLiyNkPrV0PgXxkXOJF+7/joCDKC38TqYAzrCGxvzkMLV61uE0Cy2Cwlt0NXSVaWUu1C8LJGg9BVDEm9IeAAEWyTtJSM2Co8i4iQRkugciWGig0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739467611;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=M5hWV7zpzfxrkj20JGXs36bIgvWN+f1eZBOfQY7SIjM=; 
 b=H0UaH685Fnf6T5gMeeM3s5UsaIRb+Y9jD6hk4aLgNe8A/HDjoAfNj3RgTEr/Ns0Ic1/pqf25ULiccEHjw+hz1YVZWFRt3ym5UmhNWh9KuCsdH1zQlXoXByMo2ZcWskNHcK8jc1AROJSMHLG/aY76r7gaZ/wj/4twi58HWGWV70s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739467611; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=M5hWV7zpzfxrkj20JGXs36bIgvWN+f1eZBOfQY7SIjM=;
 b=Ws91bnDMeBkWP5IXglfIKxIRozeYMM8MzNL39X6Jq2/pVSfbuX7EarFMbKklR5mw
 dd0tn8C8fZF4DPbhVIEG9+xawrfjR7jTOJWby3nlBp6hy7bDlg7VSU5flovBjG3uei0
 tgMsDOs+DMRcUp6k8/mTn4NIl9WKVT5S3z6qjrNw=
Received: by mx.zohomail.com with SMTPS id 1739467608754665.7670786696585;
 Thu, 13 Feb 2025 09:26:48 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id 785651806DE; Thu, 13 Feb 2025 18:26:43 +0100 (CET)
Date: Thu, 13 Feb 2025 18:26:43 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, 
 robh@kernel.org, conor+dt@kernel.org, algea.cao@rock-chips.com,
 rfoss@kernel.org, 
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 hjc@rock-chips.com, kever.yang@rock-chips.com, dmitry.baryshkov@linaro.org, 
 vkoul@kernel.org, andy.yan@rock-chips.com, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
Message-ID: <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jnxis7mvi3ww4bac"
Content-Disposition: inline
In-Reply-To: <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/239.417.30
X-ZohoMailClient: External
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


--jnxis7mvi3ww4bac
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
MIME-Version: 1.0

Hello Piotr,

On Thu, Feb 13, 2025 at 03:54:00PM +0100, Piotr Oniszczuk wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Damon Ding <damon.ding@rock-chips.co=
m> w dniu 23 sty 2025, o godz. 11:07:
> >=20
> > Picked from:
> > https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D9235=
93
> >=20
> > These patchs have been tested with a 1536x2048p60 eDP panel on
> > RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> > on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> > on RK3399 sapphire excavator board.
> >=20
> > Patch 1~4   are preparations for the RK3588 eDP support on both Analogix
> >            side and Rockchip side.
> > Patch 5~8  are to support to get panel from the DP AUX bus.
> > Patch 9~11 are the RK3588 Analogix DP driver support.
> > Patch 12    is to add the power sequencing delays for panel model
> >            LP079QX1-SP0V.
> > Patch 13    is the addition of RK3588 eDP0 node.
> > Patch 14    is to enable the eDP0 display on RK3588S EVB1 board.
> >=20
> > Damon Ding (14):
> >  drm/rockchip: analogix_dp: Replace DRM_...() functions with drm_...()
> >  drm/rockchip: analogix_dp: Use formalized struct definition for grf
> >    field
> >  drm/rockchip: analogix_dp: Expand device data to support multiple edp
> >    display
> >  drm/bridge: analogix_dp: Add support for phy configuration.
> >  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
> >    from the DP AUX bus
> >  drm/bridge: analogix_dp: support to get &analogix_dp_device.plat_data
> >    and &analogix_dp_device.aux
> >  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
> >  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
> >    bus
> >  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
> >  drm/bridge: analogix_dp: Add support for RK3588
> >  drm/rockchip: analogix_dp: Add support for RK3588
> >  drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
> >  arm64: dts: rockchip: Add eDP0 node for RK3588
> >  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
> >=20
> > .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
> > arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++
> > .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  54 ++++
> > .../drm/bridge/analogix/analogix_dp_core.c    |  76 +++---
> > .../drm/bridge/analogix/analogix_dp_core.h    |   1 +
> > .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 ++++
> > drivers/gpu/drm/panel/panel-edp.c             |   8 +
> > .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 238 +++++++++++++-----
> > include/drm/bridge/analogix_dp.h              |   8 +-
> > 9 files changed, 401 insertions(+), 89 deletions(-)
> >=20
> > --=20
> > 2.34.1
> >=20
>=20
> Damon,
>=20
> I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx board w=
ith 6.14 mainline.
>=20
> rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1
> eDP with ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
> (see page3 & page29 at
> https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.pdf)

The RK3588 has two different DP controllers. The one handled in this
series should get the eDP port running, which is routed to the
"eDP Panel" in the block diagram on page 3 of the Rock 5 ITX schematics.
So this series adds support for using "HDMI/eDP TX0" and "HDMI/eDP TX1"
in DP mode.

The port routed to HDMI0 via RA620 is the other DP controller, which
also exists twice: "TYPEC0/DP0" and "TYPEC1/DP1". This DP controller
is not yet supported upstream and there is no pending patchset. As far
as I know Rockchip plans to work on preparing upstream support for that
soon.

Note, that the two DisplayPort controllers are completely different.
The HDMI/eDP controller is a design from Analogix and the TypeC/DP
controller is a design from Synopsys.

P.S.: Heiko merged support for HDMI1 (RK3588 SoC level) recently. So you
should be able to get that running by some DT additions to the Rock 5
ITX board DT with the latest linux-next code :)

Greetings,

-- Sebastian

--jnxis7mvi3ww4bac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmeuK0wACgkQ2O7X88g7
+prlexAApJeFewv/JsqSV3wCoT23yhvxdlzYKIVVL/yo98r9WQPC4i1qmYmKRBI4
vzvIr65JV41ReaTQs/q/BoIL0rHdfgn0ZkatJ0H7wbNbH2IztSS2VukNrAz9DwT4
TvyUoo10hpaHiFTfKKSzDkL5/NI3d9pvi6AmUs+SmWMD7f2eXmyav5L2WHTZ0Nzl
kLA4FPpSVS/3NQ5qTlhHsyM0kDVsL7R6G7ObMrQ9gAp9qkp6BJ353pHWEWtXgagu
Dj4iMS5wfJ1VXYyQDJSFgeiibznIzIMlOR83c7AG7IMvowXL7IniG2Q8vUz1nPgC
syKJOH3btyQzxkc9AYqXYXr7NUldDWhK84iqzsA0E+imxauPhXgfeQxQOR63uTXG
fvZKtmVjM2gyqGp0ro5rEXSczzcnKj8tSC42AZm0d/ACS/TsCi8CcOKEsgtkCM+L
7HhI7qlJUNihK6x90i+R9i2k7Ar9STYe+lUqxybSkZnNymp3nZwpkDVYLkuf53Ot
pwrWkcRYXOhEggDrQNTe6xq3W1C+w/sNPflgnA33KAL2+xFCyt3RQq++BrLN4Aa/
ECjWYGebnHLh+hFA8FToTF3KG6CjTNiyIvAsFBsjRoF9x/uLrZt+davDhGf1D3fP
l/jfGWpAOhK6VBdKArybnrr6GEUTvZtb25x6f9eTbsVVTEGORmk=
=iYP4
-----END PGP SIGNATURE-----

--jnxis7mvi3ww4bac--
