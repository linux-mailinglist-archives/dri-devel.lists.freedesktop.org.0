Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82EB3DA50
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 08:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFD010E0A3;
	Mon,  1 Sep 2025 06:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LmFUTpLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19710E0A3;
 Mon,  1 Sep 2025 06:54:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B6B04467E;
 Mon,  1 Sep 2025 06:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC11C4AF0C;
 Mon,  1 Sep 2025 06:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756709661;
 bh=fwrdXGVjUYTBQheWc/IsdqXrl6C9veTKc/wEeMzy6Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LmFUTpLl5iNLL2/TUwx1oABydVV7GBecXV4IgcoopSl28MYX7ugia5dDbWbet1kRl
 2cUHjwsW3S1ULyP/3pVqmTKsG83ZwlsxcbqtcoS+Ri4DqcNDsJfc5SRP4tYq2CRoF6
 PIv881LCWriz19Xc0NTpcm53tr9N6JTq6TOgM1EX+vSkoTNFJkBm2apRhZs+a6qXnw
 SJE+f2KobYNeXxhWHfGsDH23e5HjX092guokAQUjSCOhALU8BWA2+TOe6hrmoORmJd
 LVmQpsWHJLRV97+Xaco5MOtBzfHz0xWnXt9F8njQLdoj1v42qRayegs8nHKmE2UEGC
 7NppgdOlpgS9A==
Date: Mon, 1 Sep 2025 08:54:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <20250901-illustrious-dark-kagu-f4ef76@houat>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
 <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
 <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="y4s6v275ws7f4w3b"
Content-Disposition: inline
In-Reply-To: <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
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


--y4s6v275ws7f4w3b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0

On Wed, Aug 27, 2025 at 05:04:53PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 09:30:20AM +0200, Maxime Ripard wrote:
> > On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > > > > Currently DRM framework expects that the HDMI connector driver su=
pports
> > > > > all infoframe types: it generates the data as required and calls =
into
> > > > > the driver to program all of them, letting the driver to soft-fai=
l if
> > > > > the infoframe is unsupported. This has a major drawback on usersp=
ace
> > > > > API: the framework also registers debugfs files for all Infoframe=
 types,
> > > > > possibly surprising the users when infoframe is visible in the de=
bugfs
> > > > > file, but it is not visible on the wire.
> > > > >=20
> > > > > Let drivers declare that they support only a subset of infoframes,
> > > > > creating a more consistent interface.
> > > > >=20
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > >=20
> > > > I'm not really convinced. Infoframes aren't really something you sh=
ould
> > > > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is=
 if
> > > > audio support is enabled, DRM is mandatory if HDR is used.
> > >=20
> > > Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> > > provide support only for the AVI infoframe.
> >=20
> > Yes, but it's still something we shouldn't paper over. The spec mandates
> > it, if drivers want to deviate from it it's something we should warn
> > about, not silence.
> >=20
> > sun4i is a good example, to me at least since I have the doc. The
> > hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so DRM
> > isn't either. The only missing one is HDMI, but the documentation isn't
> > the best so it might still be supported. In short, it's a driver issue.
> >=20
> > adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
> > mechanism to send any infoframe as is. So, again, driver issue.
>=20
> I've send a patch, enabling SPD and VSI (HDMI) InfoFrames on ADV7511.
>=20
> >=20
> > I couldn't find the other datasheet, but I'd be very surprised if it
> > wasn't the case for these too.
> >=20
> > > Some of them can be extended to support other infoframe kinds (e.g.
> > > ADV7511 has two spare infoframes which can be used for HDMI and SPD).
> > >=20
> > > > SPD is indeed optional though.
> > > >=20
> > > > So, it's really dynamic in essence, and not really something we sho=
uld
> > > > expect drivers to ignore.
> > > >=20
> > > > I do acknowledge that a lot of drivers just silently ignore the
> > > > infoframes they don't support at the moment, which isn't great eith=
er.
> > > >=20
> > > > Maybe we should standardize and document what drivers should do when
> > > > they don't support a given infoframe type?
> > >=20
> > > The chips might be generating infoframes internally. This series was
> > > triggered by LT9611UXC, which does all HDMI work under the hood in the
> > > firmware. See [1]. The series I posted hooks HDMI audio directly into
> > > the bridge driver, but I'd really prefer to be able to use
> > > drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get =
to
> > > implementing CEC support for it.
> > >=20
> > > ADV7511 likewise generates audio infoframe without Linux
> > > help (audio-related fields are programmed, but it's not the
> > > infoframe itself).
> >=20
> > Implementing the write_infoframe hooks as a nop with a comment in those
> > case is totally reasonable to me.
> >=20
> > I'd still like to document that drivers should only return 0 if they
> > programmed the infoframe, and -ENOTSUPP (and the core logging a warning)
> > otherwise.
> >=20
> > That way, we would be able to differentiate between the legimitate
> > LT9611UXC case, and the "driver is broken" sun4i (and others) case.
>=20
> I don't want to end up in a sitation where userspace has a different
> idea of the InfoFrame being sent than the actual one being present on
> the wire.

It's not ideal, sure, but also, what's wrong with it? We're doing it
*all the time*. Modes programmed by userspace are adjusted for the
hardware, and thus the mode reported by the CRTC turns out different
than the one actually used in hardware. Audio sampling rates might not
match exactly what we're doing. The quirks infrastructure disables part
of the EDID the userspace has access to, etc.

And all those are under the userspace control, which the infoframes
aren't.

> It seems, we need several states per the infoframe:
>=20
> - Not supported

Honestly, I'm not sure we need a state for that one. If that infoframe
was set by the framework, then the driver must support it. And if it
wasn't, then there's nothing in debugfs.

> - Autogenerated

Do we have any way to read them back on those?

> - Generated by software
>=20
> E.g. in case of ADV7511 we can declare that Audio InfofFrame is
> autogenerated, AVI, HDMI and SPD as 'software-generated' and DRM (HDR)
> as unsupported. LT9611UXC will declare all (need to check) frame types
> as auto.
>=20
> This way we can implement the checks and still keep userspace from
> having irrelevant data in debugfs.

If the only thing you're after is to prevent inconsistent data in
userpace for devices that can generate it automatically, then I guess we
could just implement an (optional) callback to read an infoframe from
the hardware when reading from debugfs. Would that work?

> I will update my patchset to implement this, but I have another question
> beforehand: should we just declare VSI support or should it be more exact,
> specifying that the driver support HVS (00:0c:03), HVFS (c4:5d:d8), etc?

I guess you're talking about HDMI 1.4 Vendor specific Infoframe vs HDMI
2.0 HF-VSIF here?

If so, the toggle should be HDMI 2.0 support. We'll need that toggle for
other things anyway (scrambler, YUV420, etc.)

> I'm asking, because e.g. MSM HDMI controller has hardware support for
> generating HVS frames (but only HVS, the OUI is not programmed, register
> format doesn't match 1:1 frame contents, etc). I instead ended up using
> GENERIC0, because it was more flexible (it's like SPARE packets on
> ADV7511, the contents is being sent as is). However if we ever need to
> send DRM infoframes, we might need to switch from GENERIC0 to HVS, for
> the price of being unable to send HVFS frames.

Section 10.2 of the HDMI 2.0 states:

  Transmission of the HF-VSIF by Source Devices is optional unless one (or
  more) of the features listed in Table 10-1 is active 1. If such features
  are active, transmission of the HF-VSIF is mandatory.

The features in question being 3d.

So unless you're supporting 3d, suppporting VSI only seems ok to me.

Maxime

--y4s6v275ws7f4w3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVDFgAKCRAnX84Zoj2+
dsW/AX0U83PxVz2ZFGRVhJWXbdOSlFJaS3ZJB3hJQHhEvUxAjMDyEmsQtJpab64J
jlTA8AgBgJFA5ObmVPWx35prpq51wIE1WmPfaEIYnyIy9Nwy/I77gfqMjdFA5fGb
bQYMz+U6mQ==
=xcRb
-----END PGP SIGNATURE-----

--y4s6v275ws7f4w3b--
