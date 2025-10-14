Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37024BD96C8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016B410E285;
	Tue, 14 Oct 2025 12:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxRmkO54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBB710E285;
 Tue, 14 Oct 2025 12:44:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BAE9762889;
 Tue, 14 Oct 2025 12:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3621C4CEE7;
 Tue, 14 Oct 2025 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760445841;
 bh=/tXEkBV2iz6VIBxhFaqv+T+Om6XqiroS3jlzqMPzr7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxRmkO541/EHC4Q2cqeAFfz8gm88AZdpTPJSlXAulRZhX0venAuYbb/iSkyCZREtT
 C5JGgvwTCDbvLkeOOsDEKk1h+tYXp67GJ4d2nLjbsirGWWecG9SPOon/ziGm5HL70k
 aJ5r7SyidsW2sp/mJfdDoL1sflQE8QcI/E7NotdNBaC/SiIpuOF8OYReJGskFT9R6Y
 xYpGfj2ndPjQCgtFq8V4KgtBnA3eYPEbzP9wnJi6b4HypRvkyY6vaKUB/3XCHUfbKi
 i5qAWfahu1WlH5/65MQCbo2IbJY+ylmDK9NXQI1uEt5vx52js8gnIvddcVWxI+fqLh
 hDvmXlZwdrmNQ==
Date: Tue, 14 Oct 2025 14:43:58 +0200
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sfmxdzujh2ysmgjl"
Content-Disposition: inline
In-Reply-To: <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
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


--sfmxdzujh2ysmgjl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> On 03/10/2025 17:23, Maxime Ripard wrote:
> > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > As we will be getting more and more features, some of the InfoFra=
mes
> > > > > or data packets will be 'good to have, but not required'.
> > > >=20
> > > > And drivers would be free to ignore those.
> > > >=20
> > > > > > So, no, sorry. That's still a no for me. Please stop sending th=
at patch
> > > > >=20
> > > > > Oops :-)
> > > > >=20
> > > > > > unless we have a discussion about it and you convince me that i=
t's
> > > > > > actually something that we'd need.
> > > > >=20
> > > > > My main concern is that the drivers should not opt-out of the fea=
tures.
> > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI Info=
Frames
> > > > > (yes, stupid examples), it should not be required to go through a=
ll the
> > > > > drivers, making sure that they disable those. Instead the DRM fra=
mework
> > > > > should be able to make decisions like:
> > > > >=20
> > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be=
 sending
> > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > >=20
> > > > > - The driver hints that the pixel data has only 10 meaninful bits=
 of
> > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink=
 has
> > > > >    HF-VSDB, send HF-VSIF.
> > > > >=20
> > > > > - The driver has enabled 3D stereo mode, but it doesn't declare s=
upport
> > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > >=20
> > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > examples):
> > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > >=20
> > > > > - The driver defines support for ISRC packets, register ISRC-rela=
ted
> > > > >    properties.
> > > > >=20
> > > > > - The driver defines support for MPEG Source InfoFrame, provide a=
 way
> > > > >    for media players to report frame type and bit rate.
> > > > >=20
> > > > > - The driver provides limited support for Extended HDR DM InfoFra=
mes,
> > > > >    select the correct frame type according to driver capabilities.
> > > > >=20
> > > > > Without the 'supported' information we should change atomic_check=
()
> > > > > functions to set infoframe->set to false for all unsupported Info=
Frames
> > > > > _and_ go through all the drivers again each time we add support f=
or a
> > > > > feature (e.g. after adding HF-VSIF support).
> > > >=20
> > > >  From what you described here, I think we share a similar goal and =
have
> > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me bef=
ore),
> > > > we just disagree on the trade-offs and ideal solution :)
> > > >=20
> > > > I agree that we need to sanity check the drivers, and I don't want =
to go
> > > > back to the situation we had before where drivers could just ignore
> > > > infoframes and take the easy way out.
> > > >=20
> > > > It should be hard, and easy to catch during review.
> > > >=20
> > > > I don't think bitflag are a solution because, to me, it kind of fai=
ls
> > > > both.
> > > >=20
> > > > What if, just like the debugfs discussion, we split write_infoframe=
 into
> > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) a=
nd
> > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc=
 > 8)
> > > >=20
> > > > How does that sound?
> > >=20
> > > I'd say, I really like the single function to be called for writing t=
he
> > > infoframes. It makes it much harder for drivers to misbehave or to sk=
ip
> > > something.
> >=20
> >  From a driver PoV, I believe we should still have that single function
> > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > job to fan out and call the multiple callbacks, not the drivers.
>=20
> I like this idea, however it stops at the drm_bridge_connector abstractio=
n.
> The only way to handle this I can foresee is to make individual bridges
> provide struct drm_connector_hdmi_funcs implementation (which I'm fine wi=
th)
> and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> struct drm_connector_hdmi in order to let bridge drivers find their data.

Does it change anything? The last HDMI bridge should implement all the
infoframes it supports. I don't think we should take care of one bridge
with one infoframe type and some other with another?

Maxime

--sfmxdzujh2ysmgjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaO5FigAKCRAnX84Zoj2+
dsJzAYDfo6ak7CwTSlc4o7ed4CNYZ1L2YAhtwDiaUffpOTN/dXXcROoKHGgFXSFc
pvUUc7gBf0zB/jj7BZZ+x1NVnSNKuXdhcpZfp7zgGMTrLBClgApQMqJ+ODdDvpPq
p8TSGgZYKw==
=gAKl
-----END PGP SIGNATURE-----

--sfmxdzujh2ysmgjl--
