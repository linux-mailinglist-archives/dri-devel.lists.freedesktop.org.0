Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E3B9F474
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AEC10E8FA;
	Thu, 25 Sep 2025 12:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XkvQ1go5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2920F10E2C7;
 Thu, 25 Sep 2025 12:36:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60A8C6013A;
 Thu, 25 Sep 2025 12:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054A8C4CEF0;
 Thu, 25 Sep 2025 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758803811;
 bh=IBUAnul7b8BQqt3zLS4cohInRJ5Mx15MT7PNd8Nz5R4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkvQ1go55VUCHLla+6DHun6ac9iHj597k6xHzW2ehbWZf1qu17advzm0DOfLaJdX2
 CFK1pTszoqCLJrUFasnXEbhaA+1f/RSAgXuAlCqIPBFAunLcZSLWGiS/DqtgPo1lAz
 vd59DiKljlaDbik78b3p69oUNn/NqxQnsAOZKEj9miVMPRGtAD7JdxnTW3ZYETd/id
 3l8YdBfhuJ0+fEQ/tfJEwaZ73jeDNCtDBWibnzrzLBuVvq+35kOG7RWoaJ9NZ0Zvhk
 QMPN3eI4qbedD4PN9VBWseCLjfv6KabHrHPVkDmVcJZq2VK9elqC28msll8ZwXvERx
 rJPYbUQBQg33g==
Date: Thu, 25 Sep 2025 14:36:46 +0200
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
Message-ID: <20250925-didactic-spiked-lobster-fefabe@penduick>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5gspsh2yhbs7pucv"
Content-Disposition: inline
In-Reply-To: <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
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


--5gspsh2yhbs7pucv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 06:16:25PM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 10, 2025 at 01:03:47PM +0200, Maxime Ripard wrote:
> > On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> > > Currently DRM framework expects that the HDMI connector driver suppor=
ts
> > > all infoframe types: it generates the data as required and calls into
> > > the driver to program all of them, letting the driver to soft-fail if
> > > the infoframe is unsupported. This has a major drawback on userspace
> > > API: the framework also registers debugfs files for all Infoframe typ=
es,
> > > possibly surprising the users when infoframe is visible in the debugfs
> > > file, but it is not visible on the wire. Drivers are also expected to
> > > return success even for unsuppoted InfoFrame types.
> > >=20
> > > Let drivers declare that they support only a subset of infoframes,
> > > creating a more consistent interface. Make the affected drivers return
> > > -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which =
are
> > > not supported.
> > >=20
> > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >=20
> > Again, I still believe that it's a bad idea, goes against what the spec
> > states, and the framework was meant to be.
>=20
> Please correct me if I'm wrong. The specs (HDMI & CEA) define several
> infoframes and whether we should be sending them. If I'm reading it
> correctrly, CEA spec explicitly says 'If the Source supports the
> transmission of [foo] InfoFrame..." (6.4 - AVI, 6.6 - Audio, 6.7 MPEG,
> 6.9 - DRM). For other InfoFrames (6.5 SPD, 6.8 NTSC VBI) it just defines
> that sending those frames is optional.

SPD is indeed optional, but the HDMI spec, (HDMI 1.4b, Section 8.2.1 -
Auxiliary Video information (AVI) InfoFrame) states that:

  A Source shall always transmit an AVI InfoFrame at least once per two
  Video Fields if the Source:

   * is ever capable of transmitting an AVI InfoFrame or,
   * is ever capable of transmitting YCBCR pixel encoding or,
   * is ever capable of transmitting any colorimetry other than the
     transmitted video format=E2=80=99s default colorimetry or,
   * is ever capable of transmitting any xvYCC or future enhanced
     colorimetry or,
   * is ever capable of transmitting any Gamut Metadata packet or,
   * is ever capable of transmitting any video format with multiple
     allowed pixel repetitions or,
   * is ever capable of transmitting Content Type other than =E2=80=9Cno da=
ta=E2=80=9D or,
   * is ever capable of transmitting YCC Quantization Range.

  The AVI InfoFrame shall be transmitted even while such a Source is
  transmitting RGB and non-pixel-repeated video. When a Source is not
  explicitly required to transmit AVI InfoFrames, it is recommended that
  the Source transmit AVI InfoFrames.

So it's recommended in every case, and the list kind of makes it
mandatory for how Linux uses HDMI.

Also, did we ever encounter some hardware that couldn't send AVI?

Audio is mandatory when streaming audio, DRM when using HDR, and we
don't support the others yet.

So the only we support but don't have to send is SPD.

> We can't even infer support for InfoFrames from the Source features.
> E.g. CEA 6.6.1 defines a case when digital audio is allowed to be sent,
> without sending Audio InfoFrame.

HDMI 1.4 section 8.2.2 - Audio Infoframe states that:

  Whenever an active audio stream is being transmitted, an accurate
  Audio InfoFrame shall be transmitted at least once per two Video
  Fields.

I'd say it takes precedence over CTA-861.

> As we will be getting more and more features, some of the InfoFrames
> or data packets will be 'good to have, but not required'.

And drivers would be free to ignore those.

> > So, no, sorry. That's still a no for me. Please stop sending that patch
>=20
> Oops :-)
>=20
> > unless we have a discussion about it and you convince me that it's
> > actually something that we'd need.
>=20
> My main concern is that the drivers should not opt-out of the features.
> E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> (yes, stupid examples), it should not be required to go through all the
> drivers, making sure that they disable those. Instead the DRM framework
> should be able to make decisions like:
>=20
> - The driver supports SPD and the VSDB defines SPD, enable this
>   InfoFrame (BTW, this needs to be done anyway, we should not be sending
>   SPD if it's not defined in VSDB, if I read it correctly).
>=20
> - The driver hints that the pixel data has only 10 meaninful bits of
>   data per component (e.g. out of 12 for DeepColor 36), the Sink has
>   HF-VSDB, send HF-VSIF.
>=20
> - The driver has enabled 3D stereo mode, but it doesn't declare support
>   for HF-VSIF. Send only H14b-VSIF.
>=20
> Similarly (no, I don't have these on my TODO list, these are just
> examples):
> - The driver defines support for NTSC VBI, register a VBI device.
>=20
> - The driver defines support for ISRC packets, register ISRC-related
>   properties.
>=20
> - The driver defines support for MPEG Source InfoFrame, provide a way
>   for media players to report frame type and bit rate.
>=20
> - The driver provides limited support for Extended HDR DM InfoFrames,
>   select the correct frame type according to driver capabilities.
>=20
> Without the 'supported' information we should change atomic_check()
> functions to set infoframe->set to false for all unsupported InfoFrames
> _and_ go through all the drivers again each time we add support for a
> feature (e.g. after adding HF-VSIF support).

=46rom what you described here, I think we share a similar goal and have
somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
we just disagree on the trade-offs and ideal solution :)

I agree that we need to sanity check the drivers, and I don't want to go
back to the situation we had before where drivers could just ignore
infoframes and take the easy way out.

It should be hard, and easy to catch during review.

I don't think bitflag are a solution because, to me, it kind of fails
both.

What if, just like the debugfs discussion, we split write_infoframe into
write_avi_infoframe (mandatory), write_spd_infoframe (optional),
write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)

How does that sound?

Maxime

--5gspsh2yhbs7pucv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNU3XQAKCRAnX84Zoj2+
duiWAYCEQHaNpq1acegbRGgnWK7idyco+oNyb5OKUdG2mSrF8iG51+HcmQ30rpWH
OmNB+HsBf3AD+4uAstcClyYSies8sQ9MYWjuxdp67l9l23iryEuQM410hwJTA3iL
XSaP3z9ISQ==
=35Cr
-----END PGP SIGNATURE-----

--5gspsh2yhbs7pucv--
