Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE84605F85
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 13:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55F10E45B;
	Thu, 20 Oct 2022 11:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6D10E0BB;
 Thu, 20 Oct 2022 11:58:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A6D412B066E1;
 Thu, 20 Oct 2022 07:58:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 07:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666267132; x=1666274332; bh=ZpTpDn39WC
 JGSChIdFbiWkCndVEfRKpNniONagZhJUQ=; b=F0GcQVNz5Su7yyTQiCx7B4FkAM
 7LS/qSCmR75xLiKg9b3P/5rF8nHEjMbvkHrCrn9Wq10wbTJSsBY7VGwePlcfRaPV
 e+6RMUW508vKRtqmaP8d0omH3UzvdB2K2M/JJqi0Ej6EYckHrxmxiJzanhJrweZN
 H+aklhcIfeNJRuut6GE2w+vokq4dwIwzut9335Tqq13vjXMQGgNdQekp0X5rwyRo
 shiNv7iPnoQTu1ZSM4W4ZQy9SIpK1u4jgRQIwtIRhNhDycKem8AoE+kYL857qFwD
 YcvqMhwirH54GQtOdgZ/IDOsSUt4zoWrWdDNGeIplNqy5L127RuSsYh9w1/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666267132; x=1666274332; bh=ZpTpDn39WCJGSChIdFbiWkCndVEf
 RKpNniONagZhJUQ=; b=af6vWiN47RMgelCZd+0kbw643vgGF3xWdDa3f7WnCEsY
 X0H8oreXkV9/CrnwfZ0Td7KAWy/w3AqSzJYriwAm58b7J/QPGJ4Y876ErwPstzrW
 J0hpVU1BjFYUKTpf5i+2XZnELTDOU3yhRA+fbjfdYRYHypMDnr9YqL3NJGnR3LeC
 EbmWW3Mh5o1HDSKbXO/ntup/lWdErqkIuBP4EAWz8CeOcPP5YHtqZOduMfLUXZcN
 Dnvv8n24pO8oxQlsssXpraPFQcny1r8RcemUdrVOkyR0v2u6WAb5b/j8Z26Wb1Eh
 2+LVIFEszIZ0UJodIj+8M54PBQ+izBvDwZUmKNvI8w==
X-ME-Sender: <xms:-zdRY93Evv092xHu00TfA9m-EN_ghbQ33bMP1CQXIC_p5NLHZUzrtw>
 <xme:-zdRY0F8ytjgQe7uAy0FLktiWns6hniu1VjSbLB37BysuIYluDnYIf4WHeUgKheIo
 U5AlWASgpRC6bb2J8g>
X-ME-Received: <xmr:-zdRY96lJRueA-Xcgv6C0Y_joEMXkJXQIUlzDquvcZGm4iKpCNS7UtitSvratnepl-XJMeh_lCatvBfliStjNRtVMgl-YqnoMGnGO_Jz28HTDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeekgeelvdeujeelveehtd
 ffhedtudeuleetuddugfefgedtuefggeduffdtvdelheenucffohhmrghinhepkhgvrhhn
 vghlrdhorhhgpdhgihhthhhusgdrtghomhdpthigthdrshhonecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:-zdRY61_mBOzjXV-e8bCn6IREbeWXlBc2YOIrkDjg_TjURkb_Dx54A>
 <xmx:-zdRYwGPY1CTGB1XFiObgK0lx61WIL6z-AH_M7zVoKSfDoL0lURNgA>
 <xmx:-zdRY79lseAUX7AQUG3yElIz9UTdRLn1O3m28SL1rR25NpOTcSxrcw>
 <xmx:_DdRY7m_pSxW0GjBYzLpTTDYTYIrbiMa_cvivkk0M_2SCd7tvadtz460KUQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 07:58:50 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 13:58:49 +0200
To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
Message-ID: <20221020115849.pvefnyn4wxibycwt@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
 <81936381-ae37-8c84-4681-9eff19f653b5@tronnes.org>
 <20221018100033.d2sf7xagyycx5d4p@houat>
 <da2b4cb4-5d12-3161-64e3-e87a8cc63e81@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kngtkif3uvhg4p7e"
Content-Disposition: inline
In-Reply-To: <da2b4cb4-5d12-3161-64e3-e87a8cc63e81@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kngtkif3uvhg4p7e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 18, 2022 at 11:28:35PM +0200, Mateusz Kwiatkowski wrote:
> W dniu 18.10.2022 o 12:00, Maxime Ripard pisze:
> > On Mon, Oct 17, 2022 at 12:31:31PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 16.10.2022 20.52, skrev Mateusz Kwiatkowski:
> >>>>  static int vc4_vec_connector_get_modes(struct drm_connector *connec=
tor)
> >>>>  {
> >>>> -	struct drm_connector_state *state =3D connector->state;
> >>>>  	struct drm_display_mode *mode;
> >>>> =20
> >>>> -	mode =3D drm_mode_duplicate(connector->dev,
> >>>> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
> >>>> +	mode =3D drm_mode_analog_ntsc_480i(connector->dev);
> >>>>  	if (!mode) {
> >>>>  		DRM_ERROR("Failed to create a new display mode\n");
> >>>>  		return -ENOMEM;
> >>>>  	}
> >>>> =20
> >>>> +	mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> >>>>  	drm_mode_probed_add(connector, mode);
> >>>> =20
> >>>> -	return 1;
> >>>> +	mode =3D drm_mode_analog_pal_576i(connector->dev);
> >>>> +	if (!mode) {
> >>>> +		DRM_ERROR("Failed to create a new display mode\n");
> >>>> +		return -ENOMEM;
> >>>> +	}
> >>>> +
> >>>> +	drm_mode_probed_add(connector, mode);
> >>>> +
> >>>> +	return 2;
> >>>> +}
> >>>
> >>> Referencing those previous discussions:
> >>> - https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee=
5d6@tronnes.org/
> >>> - https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cac=
d16@gmail.com/
> >>>
> >>> Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED caus=
es Xorg
> >>> (at least on current Raspberry Pi OS) to display garbage when
> >>> video=3DComposite1:PAL is specified on the command line, so I'm afrai=
d this won't
> >>> do.
> >>>
> >>> As I see it, there are three viable solutions for this issue:
> >>>
> >>> a) Somehow query the video=3D command line option from this function,=
 and set
> >>>    DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstra=
ction
> >>>    provided by global DRM code, but should work fine.
> >>>
> >>> b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
> >>>    DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This=
 seems
> >>>    pretty robust, but affects the entire DRM subsystem, which may bre=
ak
> >>>    userspace in different ways.
> >>>
> >>>    - Maybe this could be mitigated by adding some additional conditio=
ns, e.g.
> >>>      setting the PREFERRED flag only if no modes are already flagged =
as such
> >>>      and/or only if the cmdline mode is a named one (~=3D analog TV m=
ode)
> >>>
> >>> c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor =
the USERDEF
> >>>    flag.
> >>>
> >>> Either way, hardcoding 480i as PREFERRED does not seem right.
> >>>
> >>
> >> My solution for this is to look at tv.mode to know which mode to mark =
as
> >> preferred. Maxime didn't like this since it changes things behind
> >> userspace's back. I don't see how that can cause any problems for user=
space.
> >>
> >> If userspace uses atomic and sets tv_mode, it has to know which mode to
> >> use before hand, so it doesn't look at the preferreded flag.
> >>
> >> If it uses legacy and sets tv_mode, it can end up with a stale preferr=
ed
> >> flag, but no worse than not having the flag or that ntsc is always
> >> preferred.
> >>
> >> If it doesn't change tv_mode, there's no problem, the preferred flag
> >> doesn't change.
> >
> > I don't like it because I just see no way to make this reliable. When we
> > set tv_mode, we're not only going to change the preferred flag, but also
> > the order of the modes to make the preferred mode first.
> >
> > Since we just changed the mode lists, we also want to send a hotplug
> > event to userspace so that it gets notified of it. It will pick up the
> > new preferred mode, great.
> >
> > But what if it doesn't? There's no requirement for userspace to handle
> > hotplug events, and Kodi won't for example. So we just changed the TV
> > mode but not the actual mode, and that's it. It's just as broken for
> > Kodi as it is for X11 right now.
> >
> > If we can't get a bullet-proof solution, then I'm not convinced it's
> > worth addressing. Especially since it's already the current state, and
> > it doesn't seem to bother a lot of people.
>=20
> I wouldn't rely on the "doesn't seem to bother a lot of people" bit too m=
uch.
> Here's why:
>=20
> - Analog TV output is a relatively obscure feature in this day and age in=
 the
>   first place.
>=20
> - Out of the people interested in using it with VC4/VEC, many are actuall=
y using
>   the downstream kernel from https://github.com/raspberrypi/linux instead=
 of the
>   upstream kernel, and/or firmware mode-switching instead of proper KMS.
>=20
>   - The downstream kernel only reports modes that match the TV mode set a=
t boot
>     either via vc4.tv_norm=3D, or implied by the resolution set via video=
=3D; note
>     that video=3D is also set appropriately at boot by Pi firmware, based=
 on the
>     value of sdtv_mode set in config.txt. See also the
>     vc4_vec_connector_get_modes() and vc4_vec_get_default_mode() function=
s in
>     https://github.com/raspberrypi/linux/blob/dbd073e4028580a09b6ee507e0c=
137441cb52650/drivers/gpu/drm/vc4/vc4_vec.c
>=20
>   - When firmware mode-switching is used, it sets the appropriate TV mode=
 and
>     resolution based on the sdtv_mode set in config.txt.
>=20
> So, all in all, the number of people who would use 1. analog TV out with =
VC4,
> 2. the upstream kernel, 3. full KMS (and thus the vc4_vec.c code) is rath=
er
> small, so the fact that you're not hearing too many complaints doesn't me=
an that
> the current behavior is OK. If anybody ran into problems and was bothered=
 by
> that, they likely migrated to the downstream kernel and/or firmware
> mode-switching.
>
> That being said, I completely forgot that there's a cmdline_mode field in
> struct drm_connector, even though I actually added code that examines it =
inside
> vc4_vec_connector_get_modes() that's in the downstream kernel. So... what=
 do
> you think about just examining connector->cmdline_mode.tv_mode there? It =
seems
> to solve all the problems.

It's a very good idea, I'll work on it, thanks :)

Maxime

--kngtkif3uvhg4p7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1E3+AAKCRDj7w1vZxhR
xafkAQDgQNtnP50CK4yhNqKMZFtxmkX10yJT33hGLDCT6TE8PgD/QcWMJEWdc9aV
1ov3fdoP/cA1BHg/dvO2qgLkB1+TlQ8=
=LeLr
-----END PGP SIGNATURE-----

--kngtkif3uvhg4p7e--
