Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D885F97B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A7410E92A;
	Thu, 22 Feb 2024 13:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M0WEOm8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8261810E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4394ACE226A;
 Thu, 22 Feb 2024 13:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3265DC433F1;
 Thu, 22 Feb 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708608052;
 bh=Zu7T88OQKLjnCfKYveIU790NUrfbhEaWjmTCXZYnncA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M0WEOm8ktKGlyWLacF5Eq1chGM6nr37qP9xBp8Ka3xn4FV0USBItMRkpg5davyEDR
 i7hd5f9rPQhrU9qLcZEr9ZkBmkyEzuiMvdXWJrU6qIaNCtMX4Pv5Bri+IvvSBT9eNJ
 R30zOLoUEJtZYT88fo7qS96vyaW4RNP+B/Q0R6TTt8n20wvvjWFebgWLnI3TK78xu7
 hWDtONcnJbzb1GmEp7XrmUgYzGLDSORugYi3RB57zioad41pS0OMVfY8jVD3Al/OZs
 giIWtZJtXo924svaDlRRvGibfVoVwwckTcaHTVi1KwWopCvrYpqw0+Bc7SPP6IcE8W
 Cd2/y5xQ8erxA==
Date: Thu, 22 Feb 2024 14:20:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>, 
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
Message-ID: <cf6mfm7naqdgnr3ab2tkix7b2s2frpsamlgylwiwcgbsy6ngd7@iq6ezpdnehbf>
References: <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
 <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
 <20240219140144.GB1956149@toolbox>
 <euaujtp4jyyoud3ccg5qhyvixyq2p6vir4ojlzoky6kep754rj@wruidyfxssry>
 <ZddFBe4A-galsO91@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tbiepc54hbczafix"
Content-Disposition: inline
In-Reply-To: <ZddFBe4A-galsO91@intel.com>
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


--tbiepc54hbczafix
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 02:58:45PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Feb 22, 2024 at 11:54:04AM +0100, Maxime Ripard wrote:
> > On Mon, Feb 19, 2024 at 03:01:44PM +0100, Sebastian Wick wrote:
> > > On Thu, Feb 15, 2024 at 12:00:01PM +0100, Maxime Ripard wrote:
> > > > On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> > > > > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > > > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrj=E4l=E4 wro=
te:
> > > > > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wr=
ote:
> > > > > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard w=
rote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrj=E4=
l=E4 wrote:
> > > > > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripa=
rd wrote:
> > > > > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syr=
j=E4l=E4 wrote:
> > > > > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime =
Ripard wrote:
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebas=
tian Wick wrote:
> > > > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > > > > + *      Indicates the RGB Quantization R=
ange (Full vs Limited) used.
> > > > > > > > > > > > > > > > > + *      Infoframes will be generated acc=
ording to that value.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      The value of this property can b=
e one of the following:
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > > > > + *              RGB Range is selected au=
tomatically based on the mode
> > > > > > > > > > > > > > > > > + *              according to the HDMI sp=
ecifications.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > > > > + *              Limited RGB Range is for=
ced. Unlike the name suggests,
> > > > > > > > > > > > > > > > > + *              this works for any numbe=
r of bits-per-component.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Drivers can set up this property=
 by calling
> > > > > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_r=
gb_property().
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > This is a good time to document this in mor=
e detail. There might be two
> > > > > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > All values of Broadcast RGB always affect t=
he color pipeline processing
> > > > > > > > > > > > > > > > such that a full-range input to the CRTC is=
 converted to either full- or
> > > > > > > > > > > > > > > > limited-range, depending on what the monito=
r is supposed to accept.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > When automatic is selected, does that mean =
that there is no signalling,
> > > > > > > > > > > > > > > > or that the signalling matches what the mon=
itor is supposed to accept
> > > > > > > > > > > > > > > > according to the spec? Also, is this really=
 HDMI specific?
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > When full or limited is selected and the mo=
nitor doesn't support the
> > > > > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Forgot to mention: user-space still has no co=
ntrol over RGB vs YCbCr on
> > > > > > > > > > > > > > > the cable, so is this only affecting RGB? If =
not, how does it affect
> > > > > > > > > > > > > > > YCbCr?
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > So I dug a bit into both the i915 and vc4 drive=
rs, and it looks like if
> > > > > > > > > > > > > > we're using a YCbCr format, i915 will always us=
e a limited range while
> > > > > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The property is literally called "Broadcast *RGB*=
".
> > > > > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Right. And the limited range option is called "Limi=
ted 16:235" despite
> > > > > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs,=
 and history happens
> > > > > > > > > > > > to make names inconsistent too, that's fine and not=
 an argument in
> > > > > > > > > > > > itself.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > Full range YCbCr is a much rarer beast so we've n=
ever bothered
> > > > > > > > > > > > > to enable it.
> > > > > > > > > > > >=20
> > > > > > > > > > > > vc4 supports it.
> > > > > > > > > > >=20
> > > > > > > > > > > Someone implemented it incorrectly then.
> > > > > > > > > >=20
> > > > > > > > > > Incorrectly according to what documentation / specifica=
tion? I'm sorry,
> > > > > > > > > > but I find it super ironic that i915 gets to do its own=
 thing, not
> > > > > > > > > > document any of it, and when people try to clean things=
 up they get told
> > > > > > > > > > that we got it all wrong.
> > > > > > > > >=20
> > > > > > > > > FWIW, this was an i915 property and if another driver use=
s the same
> > > > > > > > > property name it must have the same behavior. Yes, it isn=
't standardized
> > > > > > > > > and yes, it's not documented (hence this effort here) but=
 it's still on
> > > > > > > > > vc4 to make the property compatible.
> > > > > > > >=20
> > > > > > > > How is it not compatible? It's a superset of what i915 prov=
ides, but
> > > > > > > > it's strictly compatible with it.
> > > > > > >=20
> > > > > > > No it is not.
> > > > > >=20
> > > > > > The property is compatible with i915 interpretation of it, whet=
her you
> > > > > > like it or not. And that's what Sebastian was referring to.
> > > > > >=20
> > > > > > > Eg. what happens if you set the thing to full range for RGB (=
which you
> > > > > > > must on many broken monitors), and then the kernel automagica=
lly
> > > > > > > switches to YCbCr (for whatever reason) but the monitor doesn=
't
> > > > > > > support full range YCbCr? Answer: you get crap output.
> > > > > >=20
> > > > > > And that part is just moving goalposts.
> > > > >=20
> > > > > But it's really not.
> > > >=20
> > > > It really is. This whole discussion started by "well it would be ni=
ce if
> > > > we made that property handled by the core", and we're now at the "we
> > > > need to deal with broken YCbCr displays and i915 opinion about them"
> > > > stage. After creating documentation, unit tests, etc. It's the text=
book
> > > > definition of moving goalposts. And while i915 won't be affected by=
 all
> > > > that work.
> > >=20
> > > Sorry, but what you're saying is just not true.
> > >=20
> > > The Broadcast RGB property is an Intel specific property.
> >=20
> > No, it's not. vc4 has been using it for a year now.
> >=20
> > > It lacked documentation but the user space contract exists and it
> > > based on how i915 implemented it. By changing the semantics you're
> > > breaking user space. The documentation has to document the current
> > > contract between i915 and user space, not whatever you want the
> > > property to be like.
> > >=20
> > > I get that you're frustrated that you have to do work while i915 does=
n't
> > > but none of that is relevant for what the property is and how user sp=
ace
> > > expects it to work.
> >=20
> > That's not it, really. I don't mind doing the work. I do mind losing
> > functionalities on something that was working fine. And getting the
> > blame for something that is, at best, just as much of an documentation
> > issue on i915 devs.
>=20
> We've had a couple of these cases recently where people have taken
> some old property implemented by i915 and implemented it differently
> in some other driver. Dunno if the reason was that people didn't try
> to understand what i915 is doing and why, or they misundestood it,
> or they understood it but decided to ignore it anyway.

I can't tell for the other cases, but in this particular case it's
definitely in the misunderstanding category. And implying that we didn't
even try to understand it, or that we didn't consult anyone when the
patches were posted on the ML for months doesn't seem fair either.

> Unfortunately having undocumented corners in the uapi is simply
> a fact of life when dealing with a >15 year old legacy codebase.
> Also there were basically no rules regarding properties in the
> past, so everyone just added random properties whenever they=20
> felt like it.
>=20
> I think going forward we should probably lay down some extra
> ground rules; if an old undocumented uapi is being extended
> to cover more than one driver we must first figure out what
> the de facto semantics are, and document things properly
> before anything else gets done.

That sounds reasonable, but you (not you personally, but the i915 team
in general) also have to engage, you can't just impose that on everyone
else, and then just hope they will figure it out perfectly without your
help.

I think that whole story is a testament to that.

Maxime

--tbiepc54hbczafix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZddKMQAKCRDj7w1vZxhR
xQZ0AP9xIjID3WRjPO9YmF5lo+fbKpeIUuu3c3a+WG/PCA+kOAD/d6a9EMFe7j7G
LSSIf9ENRHhLQi1d/PbumiFAR9PLeQM=
=aA2v
-----END PGP SIGNATURE-----

--tbiepc54hbczafix--
