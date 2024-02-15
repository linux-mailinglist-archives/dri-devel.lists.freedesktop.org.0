Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB385603D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832C589130;
	Thu, 15 Feb 2024 10:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iAvZvcYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0D89130
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F19CCE2569;
 Thu, 15 Feb 2024 10:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C24DC433F1;
 Thu, 15 Feb 2024 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707994400;
 bh=LzgZDdmJi87vl79IYM/Q5hPaD+AShpw1nj8TBggZ0Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iAvZvcYkWQYQQip1hTxBWcsJdV+g319REl+SkMeXoSFei7HVnjzPdxp0EA4jJgz24
 6e+JREhHhhz93fd1VBWmNVX++vaD7QcdUM6MFSD1mhtxAJYNO0LgOyQo0Zce4a3a6X
 jcr5cbrC7w13FErx0BhzU2wORl9DNq3CU3CAxBOuDJpmAR8jcWfV85LpqwehSy2+LN
 edtTn7GMJ01s0SAmq9Hi4XXQtFEyCGrihvuUsjs++8SH8fq77JBid6y08jAosnevkp
 BSN3HNuFX2MNCyaFYhl57P/E97DIa2RkA5uiCiyBFpwS5kknFVycPm9RA0hllF649D
 8vs3JTLT5lDhg==
Date: Thu, 15 Feb 2024 11:53:17 +0100
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
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi:
 Add Broadcast RGB property
Message-ID: <dti6zcuzszhut5m4g2bxiwfogwctfhktv2mwuqlij7wtvh3bny@ry4mxpiqidmt>
References: <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <ZcsqoPCJDjA5PJUF@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n6osyj5ryoqybs6l"
Content-Disposition: inline
In-Reply-To: <ZcsqoPCJDjA5PJUF@intel.com>
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


--n6osyj5ryoqybs6l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:38:56AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrj=C3=A4l=C3=
=A4 wrote:
> > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrj=C3=A4l=
=C3=A4 wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard w=
rote:
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wic=
k wrote:
> > > > > > > > > > > > >  /**
> > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > >   *
> > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Fu=
ll vs Limited) used.
> > > > > > > > > > > > > + *      Infoframes will be generated according t=
o that value.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      The value of this property can be one of=
 the following:
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > + *              RGB Range is selected automatica=
lly based on the mode
> > > > > > > > > > > > > + *              according to the HDMI specificat=
ions.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > + *              Limited RGB Range is forced. Unl=
ike the name suggests,
> > > > > > > > > > > > > + *              this works for any number of bit=
s-per-component.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Drivers can set up this property by call=
ing
> > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_prope=
rty().
> > > > > > > > > > > > > + *
> > > > > > > > > > > >=20
> > > > > > > > > > > > This is a good time to document this in more detail=
=2E There might be two
> > > > > > > > > > > > different things being affected:
> > > > > > > > > > > >=20
> > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > >=20
> > > > > > > > > > > > All values of Broadcast RGB always affect the color=
 pipeline processing
> > > > > > > > > > > > such that a full-range input to the CRTC is convert=
ed to either full- or
> > > > > > > > > > > > limited-range, depending on what the monitor is sup=
posed to accept.
> > > > > > > > > > > >=20
> > > > > > > > > > > > When automatic is selected, does that mean that the=
re is no signalling,
> > > > > > > > > > > > or that the signalling matches what the monitor is =
supposed to accept
> > > > > > > > > > > > according to the spec? Also, is this really HDMI sp=
ecific?
> > > > > > > > > > > >=20
> > > > > > > > > > > > When full or limited is selected and the monitor do=
esn't support the
> > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > >=20
> > > > > > > > > > > Forgot to mention: user-space still has no control ov=
er RGB vs YCbCr on
> > > > > > > > > > > the cable, so is this only affecting RGB? If not, how=
 does it affect
> > > > > > > > > > > YCbCr?
> > > > > > > > > >=20
> > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and =
it looks like if
> > > > > > > > > > we're using a YCbCr format, i915 will always use a limi=
ted range while
> > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > >=20
> > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > >=20
> > > > > > > > Right. And the limited range option is called "Limited 16:2=
35" despite
> > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and his=
tory happens
> > > > > > > > to make names inconsistent too, that's fine and not an argu=
ment in
> > > > > > > > itself.
> > > > > > > >=20
> > > > > > > > > Full range YCbCr is a much rarer beast so we've never bot=
hered
> > > > > > > > > to enable it.
> > > > > > > >=20
> > > > > > > > vc4 supports it.
> > > > > > >=20
> > > > > > > Someone implemented it incorrectly then.
> > > > > >=20
> > > > > > Incorrectly according to what documentation / specification? I'=
m sorry,
> > > > > > but I find it super ironic that i915 gets to do its own thing, =
not
> > > > > > document any of it, and when people try to clean things up they=
 get told
> > > > > > that we got it all wrong.
> > > > >=20
> > > > > FWIW, this was an i915 property and if another driver uses the sa=
me
> > > > > property name it must have the same behavior. Yes, it isn't stand=
ardized
> > > > > and yes, it's not documented (hence this effort here) but it's st=
ill on
> > > > > vc4 to make the property compatible.
> > > >=20
> > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > it's strictly compatible with it.
> > >=20
> > > No it is not.
> >=20
> > The property is compatible with i915 interpretation of it, whether you
> > like it or not. And that's what Sebastian was referring to.
> >=20
> > > Eg. what happens if you set the thing to full range for RGB (which you
> > > must on many broken monitors), and then the kernel automagically
> > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > support full range YCbCr? Answer: you get crap output.
> >=20
> > And that part is just moving goalposts.
>=20
> No. Allowing users to get correct colors with broken displays
> is the sole reason why this property even exists.

HDMI 1.4, Section 6.6 - Video Quantization Ranges:

  If the sink=E2=80=99s EDID declares a selectable YCC Quantization Range
  (QY=3D1), then it shall expect limited range pixel values if it receives
  AVI YQ=3D0 and it shall expect full range pixel values if it receives
  AVI YQ=3D1. For other values of YQ, the sink shall expect pixel values
  with the default range for the transmitted video format.

So, the only concern you have is if the EDID has QY set to 1 but the
monitor doesn't actually support it? If so, could we qualify the monitor
as a "broken display" and thus would require that property to apply to
YUV too?

Maxime

--n6osyj5ryoqybs6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZc3tHQAKCRDj7w1vZxhR
xbBYAP9ZltKFtiZtVibhzK531scwE2+TBHIUt6gHc1GZlUgg6gEA7bQXDY/gyU5H
uzPISsemHv3JMSR4hBL2y5Ql8gCJfgk=
=pR0a
-----END PGP SIGNATURE-----

--n6osyj5ryoqybs6l--
