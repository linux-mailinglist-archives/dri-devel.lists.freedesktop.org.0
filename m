Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA3B40CC8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 20:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45910E064;
	Tue,  2 Sep 2025 18:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oUJUzb/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48410E064;
 Tue,  2 Sep 2025 18:06:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D548437C6;
 Tue,  2 Sep 2025 18:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD5BC4CEED;
 Tue,  2 Sep 2025 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756836418;
 bh=gHqutckRXz5XP4RgC8sLZI2+EMilxv4s1+VahX0x4KQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUJUzb/FCp7NMEMYs7VrpnjLkQ4z3xyyxo0dFDOlkccenX3RYl+IjxI6ZrfoPzpmb
 o3t7H7+LF+M5QWFZbWBjtREhH/ttv7QweXoz7ucvQ6jH15IElwi1u+MnpZn9y4Zlkm
 NnqrxijmeZelPHcqMtV0fEAat5SSKrTAPlYvDofyYf/fakv7h0PWcuLC7IB4Ty8Gp0
 qPHxHaXT8pfXbKj6V9XvRnxWCvyq0WXViZ6Ymt6Xp31vL/zpTKgU2nlss3Lm8lapEP
 UTmDxT+ybdxll8FHpizGh8N5C0+jFYyqoOCByleDes9gcVPFLDmyUqNG8fin5TmUQJ
 s5gCqTYfkaVtA==
Date: Tue, 2 Sep 2025 20:06:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="w4agiwtkcjwsgz6j"
Content-Disposition: inline
In-Reply-To: <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
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


--w4agiwtkcjwsgz6j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > Hi Dmitry,
> > > >=20
> > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > It's not uncommon for the particular device to support only a sub=
set of
> > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we =
adopted
> > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > problem for the userspace: we end up having files in debugfs whic=
h do
> > > > > mot match what is being sent on the wire.
> > > > >
> > > > > Sort that out, making sure that all interfaces are consistent.
> > > >=20
> > > > Thanks for the series, it's a really good cleanup.
> > > >=20
> > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > packing it into the two GHDMI banks. So the supported set there is
> > > > 'all of the currently well-known ones, plus any two others, but only
> > > > two and not more'. I wonder if that has any effect on the interface
> > > > you were thinking about for userspace?
> > >=20
> > > I was mostly concerned with the existing debugfs interface (as it is
> > > also used e.g. for edid-decode, etc).
> > >=20
> > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > HDMI also have those. I don't have at hand the proper datasheet for
> > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > generic).  Maybe we should change debugfs integration to register the
> > > file when the frame is being enabled and removing it when it gets uns=
et.
> >=20
> > But, like, for what benefit?
> >=20
> > It's a debugfs interface for userspace to consume. The current setup
> > works fine with edid-decode already. Why should we complicate the design
> > that much and create fun races like "I'm running edid-decode in parallel
> > to a modeset that would remove the file I just opened, what is the file
> > now?".
>=20
> Aren't we trading that with the 'I'm running edid-decode in paralle with
> to a modeset and the file suddenly becomes empty'?

In that case, you know what the file is going to be: empty. And you went
=66rom a racy, straightforward, design to a racy, complicated, design.

It was my question before, but I still don't really see what benefits it
would have, and why we need to care about it in the core, when it could
be dealt with in the drivers just fine on a case by case basis.

> > > Then in the long run we can add 'slots' and allocate some of the fram=
es
> > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably=
 be
> > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > want to use). Then the framework might be able to prioritize whether =
to
> > > use generic slots for important data (as DRM HDR, HDMI) or less impor=
tant
> > > (SPD).
> >=20
> > Why is it something for the framework to deal with? If you want to have
> > extra infoframes in there, just go ahead and create additional debugfs
> > files in your driver.
> >=20
> > If you want to have the slot mechanism, check in your atomic_check that
> > only $NUM_SLOT at most infoframes are set.
>=20
> The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> decide 'the device has 2 generic slots, we have HDR data, use VSI and
> DRM InfoFrames and disable SPD for now'.

I mean... the spec does? The spec says when a particular feature
requires to send a particular infoframe. If your device cannot support
to have more than two "features" enabled at the same time, so be it. It
something that should be checked in that driver atomic_check.

Or just don't register the SPD debugfs file, ignore it, put a comment
there, and we're done too.

> But... We are not there yet and I don't have clear usecase (we support
> HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> guide I realised that ADV7511 has normal audio infoframes). Maybe I
> should drop all the 'auto' features, simplifying this series and land
> [1] for LT9611UXC as I wanted origianlly.
>=20
> [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1=
793acf@oss.qualcomm.com/

Looking back at that series, I think it still has value to rely on the
HDMI infrastructure at the very least for the atomic_check sanitization.

But since you wouldn't use the generated infoframes, just skip the
debugfs files registration. You're not lying to userspace anymore, and
you get the benefits of the HDMI framework.

Maxime

--w4agiwtkcjwsgz6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLcyPgAKCRAnX84Zoj2+
doX0AX93Q4zANj52tF9dUYikkKhfOnVgebYAQL9Lxom3OCpl8W6kZ2Ik+VcbTiyU
1tDN4eoBgIeHZ7m/7ekMpxpStDQ1y4lq8smmLkNZ3KMveJKiM0MD3WjPNuxmmLEZ
63+ZOyFlqA==
=5/yk
-----END PGP SIGNATURE-----

--w4agiwtkcjwsgz6j--
