Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3AB85F62C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EA010E8AA;
	Thu, 22 Feb 2024 10:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p3wvyloe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98C10E6E4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:54:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 43E4DCE171B;
 Thu, 22 Feb 2024 10:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062AFC433F1;
 Thu, 22 Feb 2024 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708599247;
 bh=loLivqtLkCVCvcc36ob4PcvIWRrqM9ZGR67glJQXpxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p3wvyloeEyROYySZMhKhyijsbbEPmsXor7/vqv3JAmDrQirLk9J3HpQfxHf2AHS4g
 3Mfkl4Z2sWtuKKkFkziZqxoMBoCctyt+WE9cuGJGizwvG7yvpeRcurNfsWHiVi+mYH
 THcCJ1trswqTgqUw3+La26WaVeATB6DDGyEm3ySw3HZzniNsdtWbaEA9SWKHKmzLvR
 V5T0cnYVsMtXBcqZtBzkn+JR2bfkQmGT7/cIWQb5pB49yZCPIF2Ys527u/KCq+8nmH
 cUnfDQz5A0/fGs2+TufpQ3OdZXy0xGdNsd0keKdkoWu84ILsff6dzn0BFmmYCv2TXM
 tkSJQ6H9fU8HQ==
Date: Thu, 22 Feb 2024 11:54:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <euaujtp4jyyoud3ccg5qhyvixyq2p6vir4ojlzoky6kep754rj@wruidyfxssry>
References: <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
 <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
 <20240219140144.GB1956149@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gwyt2ovqrahookux"
Content-Disposition: inline
In-Reply-To: <20240219140144.GB1956149@toolbox>
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


--gwyt2ovqrahookux
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 03:01:44PM +0100, Sebastian Wick wrote:
> On Thu, Feb 15, 2024 at 12:00:01PM +0100, Maxime Ripard wrote:
> > On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> > > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrj=E4l=E4=
 wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard w=
rote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrj=E4=
l=E4 wrote:
> > > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripa=
rd wrote:
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian=
 Wick wrote:
> > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > > + *      Indicates the RGB Quantization Range=
 (Full vs Limited) used.
> > > > > > > > > > > > > > > + *      Infoframes will be generated accordi=
ng to that value.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + *      The value of this property can be on=
e of the following:
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > > + *              RGB Range is selected automa=
tically based on the mode
> > > > > > > > > > > > > > > + *              according to the HDMI specif=
ications.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > > + *              Limited RGB Range is forced.=
 Unlike the name suggests,
> > > > > > > > > > > > > > > + *              this works for any number of=
 bits-per-component.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + *      Drivers can set up this property by =
calling
> > > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_p=
roperty().
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This is a good time to document this in more de=
tail. There might be two
> > > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > All values of Broadcast RGB always affect the c=
olor pipeline processing
> > > > > > > > > > > > > > such that a full-range input to the CRTC is con=
verted to either full- or
> > > > > > > > > > > > > > limited-range, depending on what the monitor is=
 supposed to accept.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > When automatic is selected, does that mean that=
 there is no signalling,
> > > > > > > > > > > > > > or that the signalling matches what the monitor=
 is supposed to accept
> > > > > > > > > > > > > > according to the spec? Also, is this really HDM=
I specific?
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > When full or limited is selected and the monito=
r doesn't support the
> > > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Forgot to mention: user-space still has no contro=
l over RGB vs YCbCr on
> > > > > > > > > > > > > the cable, so is this only affecting RGB? If not,=
 how does it affect
> > > > > > > > > > > > > YCbCr?
> > > > > > > > > > > >=20
> > > > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, =
and it looks like if
> > > > > > > > > > > > we're using a YCbCr format, i915 will always use a =
limited range while
> > > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > >=20
> > > > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > >=20
> > > > > > > > > > Right. And the limited range option is called "Limited =
16:235" despite
> > > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and=
 history happens
> > > > > > > > > > to make names inconsistent too, that's fine and not an =
argument in
> > > > > > > > > > itself.
> > > > > > > > > >=20
> > > > > > > > > > > Full range YCbCr is a much rarer beast so we've never=
 bothered
> > > > > > > > > > > to enable it.
> > > > > > > > > >=20
> > > > > > > > > > vc4 supports it.
> > > > > > > > >=20
> > > > > > > > > Someone implemented it incorrectly then.
> > > > > > > >=20
> > > > > > > > Incorrectly according to what documentation / specification=
? I'm sorry,
> > > > > > > > but I find it super ironic that i915 gets to do its own thi=
ng, not
> > > > > > > > document any of it, and when people try to clean things up =
they get told
> > > > > > > > that we got it all wrong.
> > > > > > >=20
> > > > > > > FWIW, this was an i915 property and if another driver uses th=
e same
> > > > > > > property name it must have the same behavior. Yes, it isn't s=
tandardized
> > > > > > > and yes, it's not documented (hence this effort here) but it'=
s still on
> > > > > > > vc4 to make the property compatible.
> > > > > >=20
> > > > > > How is it not compatible? It's a superset of what i915 provides=
, but
> > > > > > it's strictly compatible with it.
> > > > >=20
> > > > > No it is not.
> > > >=20
> > > > The property is compatible with i915 interpretation of it, whether =
you
> > > > like it or not. And that's what Sebastian was referring to.
> > > >=20
> > > > > Eg. what happens if you set the thing to full range for RGB (whic=
h you
> > > > > must on many broken monitors), and then the kernel automagically
> > > > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > > > support full range YCbCr? Answer: you get crap output.
> > > >=20
> > > > And that part is just moving goalposts.
> > >=20
> > > But it's really not.
> >=20
> > It really is. This whole discussion started by "well it would be nice if
> > we made that property handled by the core", and we're now at the "we
> > need to deal with broken YCbCr displays and i915 opinion about them"
> > stage. After creating documentation, unit tests, etc. It's the textbook
> > definition of moving goalposts. And while i915 won't be affected by all
> > that work.
>=20
> Sorry, but what you're saying is just not true.
>=20
> The Broadcast RGB property is an Intel specific property.

No, it's not. vc4 has been using it for a year now.

> It lacked documentation but the user space contract exists and it
> based on how i915 implemented it. By changing the semantics you're
> breaking user space. The documentation has to document the current
> contract between i915 and user space, not whatever you want the
> property to be like.
>=20
> I get that you're frustrated that you have to do work while i915 doesn't
> but none of that is relevant for what the property is and how user space
> expects it to work.

That's not it, really. I don't mind doing the work. I do mind losing
functionalities on something that was working fine. And getting the
blame for something that is, at best, just as much of an documentation
issue on i915 devs.

> > That series has been stuck for multiple iterations on pointless and
> > mundane debates while the biggest part and whole point of it is not
> > getting any review. So yeah, sorry, it's frustrating.
>=20
> I'm reviewing the parts that I can, and that's the uAPI. I find it
> really offensive that you're saying that this is pointless and mundate.

I'm sorry I offended you, but I was talking about the whole debate
itself, not the uAPI. The uAPI itself exists. It's already there, it's
used in the wild on several drivers, and several user-space components.

What that patch does is trying to document it, and test it. It's a net
benefit. Is it perfect? Probably not.

It's a net benefit nonetheless. The part where I mostly disagree with
you I guess (and what we've actually been arguing obut) is trying to get
something perfect (to the best of our knowledge) out of it.

Anyway, I'll just shut up and to do the work I guess.

> The uAPI is your end product, if it can't be used, everything you do in
> your driver is utterly pointless.
>=20
> > > The Broadcast RGB property kind of works from a user space perspective
> > > because it's a workaround for broken sinks. If a sink expects limited
> > > range we can force full range. If this however affects YCbCr modes as
> > > well, then this isn't a workaround for broken RGB range anymore
> > > because it now breaks YCbCr.
> >=20
> > Or, you know, it's a workaround for broken YCbCr display.
>=20
> Displays can accept both RGB and YCbCr signals, drivers can chose
> whichever they want, and user space can not influence or even know which
> one is being used.
>=20
> The automatic selection of the range is very different between RGB and
> YCbCr. If user space forces the range to a specific value and the driver
> for whatever reason switches from RGB to YCbCr or the other way around,
> this forcing of the range will most likely be incorrect.
>=20
> This is what we're talking about when we say that the semantics of the
> vc4 Broadcast RGB property is broken. User space literally cannot use it
> consistenly. By restricting it to RGB signals, user space can user it
> consistently and fix monitors that do not follow the automatic
> quantization range algorithm correctly. Yes, if there is an issue with
> the quantization range of a YCbCr signal then this property doesn't
> help, but it never tried to help those cases.

Ack, thanks

Maxime

--gwyt2ovqrahookux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdcnzAAKCRDj7w1vZxhR
xRqnAQDefz6f2FBe9kLtuo09d0IXpRytvlJT3Y9pbl1YdRZYMgEApnLSteNUg63V
/mBTl1qxQbzQrR5ewp8lQ1kYaAXFwQM=
=eUkv
-----END PGP SIGNATURE-----

--gwyt2ovqrahookux--
