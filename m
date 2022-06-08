Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1D543445
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8905E10E05B;
	Wed,  8 Jun 2022 14:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26D10E05B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:48:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 135225C01D7;
 Wed,  8 Jun 2022 10:48:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 08 Jun 2022 10:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654699731; x=1654786131; bh=wvfHGDUJj5
 HTe8KNpI/We7HJo6zHxzE6/zDY7YQE62U=; b=gjQXF1atg0p2d3bAa3gaA/bP1t
 MIcmOetW6epvjQL6zhjlxYMCXxPSSuhMSMSjap9/8qE+mkBw4h9ZNKTgV7a0RaZl
 /SfgjXQZocDn36RpJDFoXpWRf2ee7O4vnq6TDpis57kBZdOeKbf0PEoQB0ojyUuT
 23hZ84CHt/9hOUGahKKqSmw/NQsS7YnT+4gncv7hc+X9ecSRixmkCl84oRPBJEj8
 amo01RLfXRfiaTCpBlHrL2BlV+e+mIPhRSVnBaAC9eo8isN3ov8tq5TwzgXGi+Nt
 e0PaR9B0YWFnjgmJrO6ARKDyqAQ9EF5G5ftClY/W8Fgdzojv1r0Uk53I6dow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654699731; x=1654786131; bh=wvfHGDUJj5HTe8KNpI/We7HJo6zH
 xzE6/zDY7YQE62U=; b=LU/8i0p8cid4FsmSI7SS17u0V5nOI8l3a236Wusg/0oM
 UZXwTqWLee9gqeHJf2VqkDphlnpyToDjVAoY9SXoDUC8s8/GrQglyXmjZQKWdWnD
 maQmBy+xqVVhPxg9aB1zwI0Uo8Qj/Nn+bw3o9L6UP29CzBNJ62toSwBXyIzITq5O
 rUBXCfutEey5JfCPlQX3W0sJEjw6U+2isCSyi1U2cR6qWp4KdqVXuLH7h9c23FDT
 y3xSX4cSU+8DfYzRJRBqTzaI5O0wlI0w036LeJ0Bt3EvHV2EtAdBlUuzugSb2ZXV
 GKsbym/x9JX3zeZomXtm6VfRY+pNRFQrxIxIPJrEMw==
X-ME-Sender: <xms:0bagYtkcOfjSf1LetKWt9Q6GizidLuAcxtZ1_XzefPJBJSFsReQb8g>
 <xme:0bagYo1aPg61L0nGu7Ey2t0Gk7Iluyzova92m-rLm0PxSWYrdV6--Zf2-XnZsyHE5
 3gDJZeCqwqhaagJW8Y>
X-ME-Received: <xmr:0bagYjqUQ83G3wCejlwGrVXEpxPAQDFqspVmfpqgrzPtOxOQhoYkbWeV2C1qZknM8X_dTmwYZqiZYitUzW3uZK3_atgyjthfmovdYqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0bagYtmkTVNSjqLc8P_jRx9cqqXJR4-0gMWm6lnGBJF-V36C7t3uMA>
 <xmx:0bagYr3qeZy7Q1gQvm9rq3vy-XB4gx_bkcLZE2b123uE8TxzYP9UOA>
 <xmx:0bagYstc8fV8xzQ2fkfbaNjwQn8UE93Jj7voutWxAYHBmwwEHo3m1w>
 <xmx:07agYi8PM4SWSSTAdcyiQZayWLeHRbZXiE6ge11fRK0xiOHFIVRCWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 10:48:49 -0400 (EDT)
Date: Wed, 8 Jun 2022 16:48:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
 Andreas Kemnade <andreas@kemnade.info>, David Airlie <airlied@linux.ie>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liang Chen <cl@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <20220608144847.3ibr4buxcbmfj3al@houat>
References: <20220413221916.50995-1-samuel@sholland.org>
 <20220414085018.ayjvscgdkoen5nw5@houat>
 <Yo5kz/9cSd6ewC5f@phenom.ffwll.local>
 <20220531085835.grw5nt4vyofis3po@penduick>
 <YpddFxvC9pCsobNB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5uxifszvnbelvki3"
Content-Disposition: inline
In-Reply-To: <YpddFxvC9pCsobNB@phenom.ffwll.local>
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


--5uxifszvnbelvki3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 02:35:35PM +0200, Daniel Vetter wrote:
> On Tue, May 31, 2022 at 10:58:35AM +0200, Maxime Ripard wrote:
> > Hi Daniel,
> >=20
> > Thanks for your feedback
> >=20
> > On Wed, May 25, 2022 at 07:18:07PM +0200, Daniel Vetter wrote:
> > > > > VBLANK Events and Asynchronous Commits
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > When should the VBLANK event complete? When the pixels have been =
blitted
> > > > > to the kernel's shadow buffer? When the first frame of the wavefo=
rm is
> > > > > sent to the panel? When the last frame is sent to the panel?
> > > > >=20
> > > > > Currently, the driver is taking the first option, letting
> > > > > drm_atomic_helper_fake_vblank() send the VBLANK event without wai=
ting on
> > > > > the refresh thread. This is the only way I was able to get good
> > > > > performance with existing userspace.
> > > >=20
> > > > I've been having the same kind of discussions in private lately, so=
 I'm
> > > > interested by the answer as well :)
> > > >=20
> > > > It would be worth looking into the SPI/I2C panels for this, since i=
t's
> > > > basically the same case.
> > >=20
> > > So it's maybe a bit misnamed and maybe kerneldocs aren't super clear =
(pls
> > > help improve them), but there's two modes:
> > >=20
> > > - drivers which have vblank, which might be somewhat variable (VRR) or
> > >   become simulated (self-refresh panels), but otherwise is a more-or-=
less
> > >   regular clock. For this case the atomic commit event must match the
> > >   vblank events exactly (frame count and timestamp)
> >=20
> > Part of my interrogation there is do we have any kind of expectation
> > on whether or not, when we commit, the next vblank is going to be the
> > one matching that commit or we're allowed to defer it by an arbitrary
> > number of frames (provided that the frame count and timestamps are
> > correct) ?
>=20
> In general yes, but there's no guarantee. The only guarante we give for
> drivers with vblank counters is that if you receive a vblank event (flip
> complete or vblank event) for frame #n, then an immediate flip/atomic
> ioctl call will display earliest for frame #n+1.
>=20
> Also usually you should be able to hit #n+1, but even today with fun stuff
> like self refresh panels getting out of self refresh mode might take a bit
> more than a few frames, and so you might end up being late. But otoh if
> you just do a page flip loop then on average (after the crtc is fully
> resumed) you should be able to update at vrefresh rate exactly.

I had more the next item in mind there: if we were to write something in
the kernel that would transparently behave like a full-blown KMS driver,
but would pipe the commits through a KMS writeback driver before sending
them to our SPI panel, we would always be at best two vblanks late.

So this would mean that userspace would do a page flip, get a first
vblank, but the actual vblank for that commit would be the next one (at
best), consistently.

> > > - drivers which don't have vblank at all, mostly these are i2c/spi pa=
nels
> > >   or virtual hw and stuff like that. In this case the event simply ha=
ppens
> > >   when the driver is done with refresh/upload, and the frame count sh=
ould
> > >   be zero (since it's meaningless).
> > >=20
> > > Unfortuantely the helper to dtrt has fake_vblank in it's name, maybe
> > > should be renamed to no_vblank or so (the various flags that control =
it
> > > are a bit better named).
> > >=20
> > > Again the docs should explain it all, but maybe we should clarify the=
m or
> > > perhaps rename that helper to be more meaningful.
> > >=20
> > > > > Blitting/Blending in Software
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > There are multiple layers to this topic (pun slightly intended):
> > > > >  1) Today's userspace does not expect a grayscale framebuffer.
> > > > >     Currently, the driver advertises XRGB8888 and converts to Y4
> > > > >     in software. This seems to match other drivers (e.g. repaper).
> > > > >
> > > > >  2) Ignoring what userspace "wants", the closest existing format =
is
> > > > >     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 th=
rough
> > > > >     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" fo=
rmats
> > > > >     to use.
> > > > >=20
> > > > >  3) The RK356x SoCs have an "RGA" hardware block that can do the
> > > > >     RGB-to-grayscale conversion, and also RGB-to-dithered-monochr=
ome
> > > > >     which is needed for animation/video. Currently this is expose=
d with
> > > > >     a V4L2 platform driver. Can this be inserted into the pipelin=
e in a
> > > > >     way that is transparent to userspace? Or must some userspace =
library
> > > > >     be responsible for setting up the RGA =3D> EBC pipeline?
> > > >=20
> > > > I'm very interested in this answer as well :)
> > > >=20
> > > > I think the current consensus is that it's up to userspace to set t=
his
> > > > up though.
> > >=20
> > > Yeah I think v4l mem2mem device is the answer for these, and then
> > > userspace gets to set it all up.
> >=20
> > I think the question wasn't really about where that driver should be,
> > but more about who gets to set it up, and if the kernel could have
> > some component to expose the formats supported by the converter, but
> > whenever a commit is being done pipe that to the v4l2 device before
> > doing a page flip.
> >=20
> > We have a similar use-case for the RaspberryPi where the hardware
> > codec will produce a framebuffer format that isn't standard. That
> > format is understood by the display pipeline, and it can do
> > writeback.
> >=20
> > However, some people are using a separate display (like a SPI display
> > supported by tinydrm) and we would still like to be able to output the
> > decoded frames there.
> >=20
> > Is there some way we could plumb things to "route" that buffer through
> > the writeback engine to perform a format conversion before sending it
> > over to the SPI display automatically?
>=20
> Currently not transparently. Or at least no one has done that, and I'm not
> sure that's really a great idea. With big gpus all that stuff is done with
> separate command submission to the render side of things, and you can
> fully pipeline all that with in/out-fences.
>=20
> Doing that in the kms driver side in the kernel feels very wrong to me :-/

So I guess what you're saying is that there's a close to 0% chance of it
being accepted if we were to come up with such an architecture?

Thanks!
Maxime

--5uxifszvnbelvki3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqC2zwAKCRDj7w1vZxhR
xfFhAQDpMG8318nD1cMM0/HpUu4Jvkjq5pn1/sC4MDW1ViKg7gEAifSRNemz4cgr
ZtPYHR4j21YFIDjjzeYl80Rl/2PoBwc=
=iUBo
-----END PGP SIGNATURE-----

--5uxifszvnbelvki3--
