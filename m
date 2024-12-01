Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AF9DF753
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 00:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1C610E053;
	Sun,  1 Dec 2024 23:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="XU4v3l9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8710E053
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 22:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733093992; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bE0WtpXaK8QuDqsEc8P7YE2eJ11W+5K5q9JbFrcQc/1A6ud8HQ2rITJLIXnJwhAy/+j4gLCSWgUIHYpKPYRncvWL29atBpkaTHRDO7KC2refctyA8rz0Io7kcHKDOczkb8JAUiQX1iS5Je5SDeM2PCwYGP9n0dGsBOV7D/IHY7Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733093992;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wFU3BBsk/0IMP6GXJyqeVrQbjT8QvAYTSLEUrZjXm+Q=; 
 b=aY5PVHs04X4fQ07Lk2Sn8m1mhP3j4MsVayOiiwINFOEdgyukzfy5jwS7s0cRiZRjIHt5kwZhYar9jfgC4l8S5vwQHzJXS5GLEQuj9fzOfIIRelyPfAYiBR42GrSdMHSrFfMVrHON+FqcXEJBv9UTI5LZ2qZGnTJHeEN9hfSjgdM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733093992; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=wFU3BBsk/0IMP6GXJyqeVrQbjT8QvAYTSLEUrZjXm+Q=;
 b=XU4v3l9xaClvU1VdLFMm14fvcMNigi9JybtvULqmvWazK3Ya87JRiMrPMFDAYRpd
 oscHX7Dwgu8dnf/fSXQMVW7BhdqqgvqFXmcVG6Fn3KNYYuY2GlDUM9MwUeYIlmndur6
 AGWmSf9bLjJe6bu3MBzYnCHtftE7AVn8EDzsinxM=
Received: by mx.zohomail.com with SMTPS id 1733093989260596.7489467887624;
 Sun, 1 Dec 2024 14:59:49 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
 id 773D410604CF; Sun, 01 Dec 2024 23:59:43 +0100 (CET)
Date: Sun, 1 Dec 2024 23:59:43 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Damon Ding <damon.ding@rock-chips.com>, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, 
 hjc@rock-chips.com, algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
 <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
 <2886747.Y6S9NjorxK@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4uvvjljskgf7wmee"
Content-Disposition: inline
In-Reply-To: <2886747.Y6S9NjorxK@diego>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/233.51.66
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


--4uvvjljskgf7wmee
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
MIME-Version: 1.0

Hi,

On Sat, Nov 30, 2024 at 09:25:12PM +0100, Heiko St=FCbner wrote:
> Am Freitag, 29. November 2024, 03:43:57 CET schrieb Damon Ding:
> > On 2024/11/27 19:04, Heiko St=FCbner wrote:
> > > Am Mittwoch, 27. November 2024, 12:00:10 CET schrieb Damon Ding:
> > >> On 2024/11/27 17:29, Heiko St=FCbner wrote:
> > >>> Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
> > >>>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode m=
ode,
> > >>>> +				 int submode)
> > >>>> +{
> > >>>> +	return 0;
> > >>>> +}
> > >>>analogix_dp_phy_power_on
> > >>> I think it might make sense to go the same way as the DCPHY and also
> > >>> naneng combophy, to use #phy-cells =3D 1 to select the phy-mode via=
 DT .
> > >>>
> > >>> See [0] for Sebastians initial suggestion regarding the DC-PHY.
> > >>> The naneng combophy already uses that scheme of mode-selection too.
> > >>>
> > >>> There is of course the issue of backwards-compatibility, but that c=
an be
> > >>> worked around in the binding with something like:
> > >>>
> > >>>    '#phy-cells':
> > >>>       enum: [0, 1]
> > >>>       description: |
> > >>>         If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
> > >>>         If #phy-cells is 1 mode is set in the PHY cells. Supported =
modes are:
> > >>>           - PHY_TYPE_HDMI
> > >>>           - PHY_TYPE_DP
> > >>>         See include/dt-bindings/phy/phy.h for constants.
> > >>>
> > >>> PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
> > >>> but PHY_TYPE_DP is already there.
> > >>>
> > >>> That way we would standardize on one form of accessing phy-types
> > >>> on rk3588 :-) .
> > >>>
> > >>> Also see the Mediatek CSI rx phy doing this too already [1]
> > >>>
> > >>>
> > >>> Heiko
> > >>>
> > >>> [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsm=
prh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
> > >>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > >>>
> > >>
> > >> It is really a nice way to separate HDMI and DP modes.
> >=20
> > I apologize for reopening the discussion about the phy-types setting.
>=20
> there is definitly no need to apologize. We're trying to find the best
> solution afterall :-) .
>=20
> > With the .set_mode() of struct phy_ops, the HDMI and eDP dynamic=20
> > switching can be achieved, which just depends on the right setting of
> > enum phy_mode in include/linux/phy/phy.h. So the previous way of=20
> > configuring phy mode may be also good.
>=20
> I think the deciding factor is, is there a use-case for needing to switch
> modes at runtime.
>=20
> I do think the mode for the dc-phy and also the hdptx-phy is pretty much
> decided by the board design.
>=20
> I.e. when you end up in a DP-connector (or eDP-panel) on your board you
> need DP mode, and when you end up in a hdmi-connector you need the
> HDMI phy mode.
>=20
> So I think the phy-mode for the hdptx-phy is largely dictated by the stat=
ic
> board definition (like devicetree), hence going with the dt-argument for
> the mode.
>=20
> Like similar to the Naneng combophy, selecting its mode via argument
> because deciding if it ends up in a sata port is a board-design thing.
>
> Is there a use-case where you need to switch at runtime between
> HDMI and eDP? Like starting the phy in eDP mode but then needing
> to switch to HDMI mode, while the device is running?

I believe the eDP controller can only use the PHY in eDP mode and
the HDMI controller can only use it in HDMI mode. So in order to
support runtime switching, the following options are possible:

1. Enable both controllers, the PHY decides which one is really
   used, the other one is basically a non-functional dummy device
   until the PHY is reconfigured. This requires the set_mode()
   callback, since the HDMI and eDP drivers both expect their
   PHY to be enabled.

2. Properly enable / disable the used controller, so that only one
   controller is active at the same time. In this case the switching
   is handled one layer above and the PHY has nothing to do with it.
   The phy_enable call from each controller would just set it up in
   the right mode.

I guess option 1 is the hacked solution, which is easier to
implement as DRM's hotplug abilities are quite limited at the moment
as far as I know. I think the second solution looks much cleaner and
should be prefered for upstream. That solution does not require
calling set_mode() for runtime switching making this whole argument
void :)

FWIW I think the DT argument based mode setting and the runtime set_mode
are not necessarily mutual exclusive. In theory one could support both
and adding set_mode support later does not change any ABI as far as
I can see. Basically handle it like pin mux/configuration settings,
which are usually automatically handled by the device core based on
DT information, except for some drivers which have special needs.

> > And other phys may want to support dynamic switching too, like the=20
> > Rockchip USBDP combo phy.
>=20
> I guess USBDP is special in that in also does both modes dynamical
> depending on its use (like type-c with option DP altmode)

The USBDP PHY is indeed quite different from the PHYs in your list
above, but for a different reason: All the combined PHYs you listed
above only support one mode at the same time. E.g. you need to
decide between PCIe, SATA and USB3 mode for the Naneng combophy.

For the USBDP PHY the modes are not mutually exclusive. The USB
controller can request the USBDP PHY in USB mode at the same time
as the DP controller requests it in DP mode. Some additional
registers configure how the lanes are being muxed. A typcial setup
would be 2 lanes for USB3 and 2 lanes for DP.

Greetings,

-- Sebastian

--4uvvjljskgf7wmee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdM6lUACgkQ2O7X88g7
+poROg/9ERk55HG40SbfPg+6kCZ6sywLSwJTZweCCXGjvq9Q9R7JK/pVHrkgVhtJ
H28UpwMTj2wN+idMK64a1EGf4ls0jw8dpDXS9y6M8f7/5Lu7DpO+c6qu+HCEOavL
rVfk4ISVpT0KmbVrDDew1KRXekee9ch+uSO+VQAj/febMToxvkdqFS9PUibzmq0h
VoUsyfct/7Ek9NKhmDPkvLVlvMHYNOrk7RsmMqlRN53zcyzrJSnbHsHlLjKCobwl
s7zl6vhanR1sYBeoQ+4UdENOIQrDFuzJzdVp+zP6LvIpl4KbxbOD89bSI2tQLPPz
yQCC5vBj+lwwhca4SWBp7cwoAJnY2n8A5T8qbrqMYZA7bsjafmZTrYbg1Tqe1X/H
kAnmcZSue5fhQWV10xh9TuMcSc7LZyBZaRK+7rCooTOy5za7J/6VLHJ64uYE41sv
Bx1XvfG5uDUh4qz1s6cAoEHdu7FYs1q9tdFeBo+uAh6ei5eScxxgXcBISq0wlhsJ
D051T1P0DWRh5PgMWluGS6WuhBGlMxx10bqNQC1ad6sdYHXVsEFsXRwSioCSbhYf
YNdoLkCk7qKUdQ11PMzhDqAZtAqV4ddKz+g7ZdDQDBBx29WgKTR73UhWNA9LvIe7
pdClppVvA3Xgarmd0hbGt7P8LI/T6u6TemJ6Xo8zft6aYlaZ4zw=
=y/X7
-----END PGP SIGNATURE-----

--4uvvjljskgf7wmee--
