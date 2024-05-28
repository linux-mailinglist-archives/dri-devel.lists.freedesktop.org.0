Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834188D19EA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4BF10E12E;
	Tue, 28 May 2024 11:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n0l64Ixl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0506810E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BEAC1CE10E4;
 Tue, 28 May 2024 11:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D12C32781;
 Tue, 28 May 2024 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716896632;
 bh=HrjSPIlSibenR/t/WUDonRTFgyHsxFp8LmQe+/2SIrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0l64IxlPpIoHV/2I8M1lM4aqN5ArxYY989tdmNEwov1ctKERj3zOu/7pj8lHDfln
 NptgeQl9MpOYq5mqrUksgMVL1Wm/QaPZS1Wc0SuAU39nIOCUCFKoM09NUiH0GWXLFq
 uI+7tfCqHGoixOlOB9dI/sNJOpnCRhJmry5iob59J/m7jlCU1ZC6t44qEK8zFTaEEl
 Z/qab1+gPdOtlqbFI5yuxZZrvsUCeX07adTT1a7eO1xkNMzntVWPzCqHAKFsXnoHlI
 MoOepgr5QIXWoFIipAXYAjaLn5c6FOrp1gd3dZ056u2JbCv+isKHdSFWInGQidYuqH
 6uysy7/lwsNhA==
Date: Tue, 28 May 2024 13:43:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Boris Brezillon <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 6/7] drm/bridge: Introduce early_enable and late disable
Message-ID: <20240528-encouraging-gray-lionfish-54ca83@houat>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-7-a-bhatia1@ti.com>
 <20240516-bipedal-keen-taipan-eedbe7@penduick>
 <ba8d0b98-67d2-41e2-b568-a40543a9b0fa@ti.com>
 <20240521-realistic-imposing-lemur-aac3ad@houat>
 <1a6b8a83-b378-4869-b536-0fca76e428bf@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tklrjkgnqec3vn6j"
Content-Disposition: inline
In-Reply-To: <1a6b8a83-b378-4869-b536-0fca76e428bf@ti.com>
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


--tklrjkgnqec3vn6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 04:38:13PM GMT, Aradhya Bhatia wrote:
> Hi Maxime,
>=20
> On 21/05/24 18:45, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, May 16, 2024 at 03:10:15PM GMT, Aradhya Bhatia wrote:
> >>>>  	/**
> >>>>  	 * @pre_enable:
> >>>>  	 *
> >>>> @@ -285,6 +319,26 @@ struct drm_bridge_funcs {
> >>>>  	 */
> >>>>  	void (*enable)(struct drm_bridge *bridge);
> >>>> =20
> >>>> +	/**
> >>>> +	 * @atomic_early_enable:
> >>>> +	 *
> >>>> +	 * This callback should enable the bridge. It is called right befo=
re
> >>>> +	 * the preceding element in the display pipe is enabled. If the
> >>>> +	 * preceding element is a bridge this means it's called before that
> >>>> +	 * bridge's @atomic_early_enable. If the preceding element is a
> >>>> +	 * &drm_crtc it's called right before the crtc's
> >>>> +	 * &drm_crtc_helper_funcs.atomic_enable hook.
> >>>> +	 *
> >>>> +	 * The display pipe (i.e. clocks and timing signals) feeding this =
bridge
> >>>> +	 * will not yet be running when this callback is called. The bridg=
e can
> >>>> +	 * enable the display link feeding the next bridge in the chain (if
> >>>> +	 * there is one) when this callback is called.
> >>>> +	 *
> >>>> +	 * The @early_enable callback is optional.
> >>>> +	 */
> >>>> +	void (*atomic_early_enable)(struct drm_bridge *bridge,
> >>>> +				    struct drm_bridge_state *old_bridge_state);
> >>>> +
> >>>>  	/**
> >>>>  	 * @atomic_pre_enable:
> >>>>  	 *
> >>>> @@ -361,6 +415,21 @@ struct drm_bridge_funcs {
> >>>>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> >>>>  				    struct drm_bridge_state *old_bridge_state);
> >>>> =20
> >>>> +	/**
> >>>> +	 * @atomic_late_disable:
> >>>> +	 *
> >>>> +	 * This callback should disable the bridge. It is called right aft=
er the
> >>>> +	 * preceding element in the display pipe is disabled. If the prece=
ding
> >>>> +	 * element is a bridge this means it's called after that bridge's
> >>>> +	 * @atomic_late_disable. If the preceding element is a &drm_crtc i=
t's
> >>>> +	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_dis=
able
> >>>> +	 * hook.
> >>>> +	 *
> >>>> +	 * The @atomic_late_disable callback is optional.
> >>>> +	 */
> >>>> +	void (*atomic_late_disable)(struct drm_bridge *bridge,
> >>>> +				    struct drm_bridge_state *old_bridge_state);
> >>>> +
> >>>
> >>> But more importantly, I don't quite get the use case you're trying to
> >>> solve here.
> >>>
> >>> If I got the rest of your series, the Cadence DSI bridge needs to be
> >>> powered up before its source is started. You can't use atomic_enable =
or
> >>> atomic_pre_enable because it would start the source before the DSI
> >>> bridge. Is that correct?
> >>>
> >>
> >> That's right. I cannot use bridge_atomic_pre_enable /
> >> bridge_atomic_enable here. But that's because my source is CRTC, which
> >> gets enabled via crtc_atomic_enable.
> >>
> >>
> >>> If it is, then how is it different from what
> >>> drm_atomic_bridge_chain_pre_enable is doing? The assumption there is
> >>> that it starts enabling bridges last to first, to it should be enabled
> >>> before anything starts.
> >>>
> >>> The whole bridge enabling order code starts to be a bit of a mess, so=
 it
> >>> would be great if you could list all the order variations we have
> >>> currently, and why none work for cdns-dsi.
> >>>
> >>
> >> Of course! I can elaborate on the order.
> >>
> >> Without my patches (and given there isn't any bridge setting the
> >> "pre_enable_prev_first" flag) the order of enable for any single displ=
ay
> >> chain, looks like this -
> >>
> >> 	crtc_enable
> >> =09
> >> 	bridge[n]_pre_enable
> >> 	---
> >> 	bridge[1]_pre_enable
> >>
> >> 	encoder_enable
> >>
> >> 	bridge[1]_enable
> >> 	---
> >> 	bridge[n]_enable
> >>
> >> The tidss enables at the crtc_enable level, and hence is the first
> >> entity with stream on. cdns-dsi doesn't stand a chance with
> >> bridge_atmoic_pre_enable / bridge_atmoic_enable hooks. And there is no
> >> bridge call happening before crtc currently.
> >=20
> > Thanks for filling the blanks :)
> >=20
> > I assume that since cdns-dsi is a bridge, and it only has a simple
> > encoder implementation, for it to receive some video signal we need to
> > enable the CRTC before the bridge.
> >=20
> > If so, I think that's the original intent between the bridge pre_enable.
> > The original documentation had:
> >=20
> >   pre_enable: this contains things needed to be done for the bridge
> >   before this contains things needed to be done for the bridge before
> >   this contains things needed to be done for the bridge before.
> >=20
> > and the current one has:
> >=20
> >   The display pipe (i.e. clocks and timing signals) feeding this bridge
> >   will not yet be running when this callback is called. The bridge must
> >   not enable the display link feeding the next bridge in the chain (if
> >   there is one) when this callback is called.
> >=20
> > I would say the CRTC is such a source, even more so now that the encoder
> > is usually transparent, so I think we should instead move the crtc
> > enable call after the bridge pre_enable.
>=20
> Hmm, if I understand you right, the newer sequence of calls will look
> like this,
>=20
> 	bridge[n]_pre_enable
> 	---
> 	bridge[1]_pre_enable
>=20
> 	crtc_enable
> 	encoder_enable
>=20
> 	bridge[1]_enable
> 	---
> 	bridge[n]_enable

Yes :)

> I do agree with this. This makes sense. CRTC is indeed such a source,
> and should ideally be enabled after the bridges are pre_enabled.
>=20
> >=20
> > Would that work?
> >=20
>=20
> So, this could potentially work, yes. The cdns-dsi would get pre_enabled
> after all bridges after cdns-dsi are pre_enabled. But over a quick test
> with BBAI64 + RPi Panel, I don't see any issue.
>=20
> However, the one concern that I have right now, is about breaking any
> existing (albeit faulty) implementation which relies on CRTC being
> enabled before the bridges are pre_enabled. =3D)

I don't think it'll be a big deal. If there was a proper encoder driver,
it was probably gating the signal until it's enabled. If there isn't,
then yeah it might disrupt things, but it mostly means that the driver
wasn't properly split between pre_enable and enable.

So I think it's worth trying, and we'll see the outcome.

Maxime

--tklrjkgnqec3vn6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlXDdQAKCRAnX84Zoj2+
dmdaAYDJ9IOmLyZ+QRTLxDDLHdiDc69zetJ2vxDt7h7ulP9GmJz4ZKwVqdFeoMNb
d0jtce8BgIGejT4WzfcKb5nfpbNyx4+Jwzs64G5qbh7T6LqLqLi9nhwi3M08n5ka
FhjuOX/RFg==
=gg61
-----END PGP SIGNATURE-----

--tklrjkgnqec3vn6j--
