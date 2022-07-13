Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DF5732F6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8C998AF2;
	Wed, 13 Jul 2022 09:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9398AF2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 09:37:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 23C963200A17;
 Wed, 13 Jul 2022 05:37:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Jul 2022 05:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657705031; x=1657791431; bh=/d4IjXjSux
 tGdLJBbQdN/ZhVrhONcOUztD4n0X+bpf4=; b=SK8VcU5VCrf3uUICQJVJY8pQvL
 k6sfCKd+DtadU7hOrWq1LE0LNFl4F0vFjmBVW98ZZGQUardkAozVkLvTaF0pqujN
 xVbICiDYToWi9AnM8M2vS4KAH7GHWcnWV6qcxiqoqcceSFOq7CuEp+/FJUZsBwE+
 G61LEIWSrw8x0/32dgsI5ZCVNFpNz5aYWy2g2XfDmGpV/2Cq7Io2iEbRxMDYVUiV
 okyPW3dVv/BSQRHWZ6kVL1xdYt0PN9l3XwcgCqH+e5gmpv+xab3qQrEiTO/ZMJa4
 qN6+zPEqz/4IISpH+wsgL6+29Uj4vL9tBuhKp4jm/f2SNfI15Y3RhD9SD1xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657705031; x=1657791431; bh=/d4IjXjSuxtGdLJBbQdN/ZhVrhON
 cOUztD4n0X+bpf4=; b=YQyIJrO8bncgi71trGSfZ+2U2Gu8xsAS8Qz52a7+PcCy
 0nTHrDaw8eOQQqVrQ+NODY5prB1YM1BT/4bb7m+a8i8dkIcdmDpxNTMg4b5lcb1n
 pv65ZAJQymjkB+ZNaEDCDppRhTJeDiF7FPJFCt3hQa+gv1q6wnU9CtawrNeQoP9T
 0qTND/A0wo1Yk8EJKIn+S1U5ktwP8Y5dc2coI4iKrhMinegOdDe2Jgl9dZBmpETi
 jLjXbx3lr7FQQrKr20AyPVOcwWlbGEcRS469Wfwt+MxkBbMm9tyRTZld/9sXMbpe
 Fgv478zya4yXAP9HHBXnAmS1akG7ScaBoRNti7DL9A==
X-ME-Sender: <xms:R5LOYkemlrv4iwO-SIy8cbnyNwhBoTH4HvBHDfBuKZ_Q2nAepM85GQ>
 <xme:R5LOYmOy8ltauW4S_l-yDXDFpe3dKk2ffjrnRypHosnpT5jihGlg5JCdoPCHkJEOy
 kn8aZeM_eKXQNbe7Ls>
X-ME-Received: <xmr:R5LOYlg-P3fqwXHWLhrlM9lMgax-E5wSdgIbx5I1UTIHDIlt8-YnBVzxeg4txkkrJuDuHQHigB5yJrPl9LwPd7-eLSNFDmNuJq_WTFU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeftefggedutedvgeelheekudevkefhhedvgefgteffleeuvdfggfduudff
 leekheenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpfihikhhiphgvughirgdroh
 hrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R5LOYp8H9KXg9uB6egZ1vCYTwiMQV_CQiqRR316Mr6XDGxa6ZeyLkA>
 <xmx:R5LOYgvdlwzQteayLMRIkoEkapqNdXKwaaK8AeAz0PSrhFD5MDXsDA>
 <xmx:R5LOYgGcS56CXBJ-h0Fomyu94u_81j8s0rr7DiE3FGBxVWgPBAU6bg>
 <xmx:R5LOYuBsGj2wLZd5-6WUHTSqRGsv_XRzy47wtr4Mtc7ue0Io6VcJoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 05:37:10 -0400 (EDT)
Date: Wed, 13 Jul 2022 11:37:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Message-ID: <20220713093708.jaa3og2fablqr723@houat>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
 <20220711114206.sawqdl54ibuxsxp4@houat>
 <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
 <20220711120243.v6lwoynqigle2aot@houat>
 <CAMuHMdXhmf5TudQ6a1PUVV8KXff6JjgMmZOmOWVb2qW6eXF7Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="awtk4wasf5vxs4te"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXhmf5TudQ6a1PUVV8KXff6JjgMmZOmOWVb2qW6eXF7Ow@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--awtk4wasf5vxs4te
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Jul 11, 2022 at 02:08:06PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 11, 2022 at 2:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Mon, Jul 11, 2022 at 01:59:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Jul 11, 2022 at 1:42 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> > > > > Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > > > > > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wro=
te:
> > > > > > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > > > > > The mode parsing code recognizes named modes only if they a=
re explicitly
> > > > > > > > listed in the internal whitelist, which is currently limite=
d to "NTSC"
> > > > > > > > and "PAL".
> > > > > > > >
> > > > > > > > Provide a mechanism for drivers to override this list to su=
pport custom
> > > > > > > > mode names.
> > > > > > > >
> > > > > > > > Ideally, this list should just come from the driver's actua=
l list of
> > > > > > > > modes, but connector->probed_modes is not yet populated at =
the time of
> > > > > > > > parsing.
> > > > > > >
> > > > > > > I've looked for code that uses these names, couldn't find any=
=2E How is this
> > > > > > > being used in practice? For example, if I say "PAL" on the co=
mmand line, is
> > > > > > > there DRM code that fills in the PAL mode parameters?
> > > > > >
> > > > > > We have some code to deal with this in sun4i:
> > > > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/=
sun4i/sun4i_tv.c#L292
> > > > > >
> > > > > > It's a bit off topic, but for TV standards, I'm still not sure =
what the
> > > > > > best course of action is. There's several interactions that mak=
e this a
> > > > > > bit troublesome:
> > > > > >
> > > > > >    * Some TV standards differ by their mode (ie, PAL vs NSTC), =
but some
> > > > > >      other differ by parameters that are not part of drm_displa=
y_mode
> > > > > >      (NTSC vs NSTC-J where the only difference is the black and=
 blanking
> > > > > >      signal levels for example).
> > > > > >
> > > > > >    * The mode names allow to provide a fairly convenient way to=
 add that
> > > > > >      extra information, but the userspace is free to create its=
 own mode
> > > > > >      and might omit the mode name entirely.
> > > > > >
> > > > > > So in the code above, if the name has been preserved we match b=
y name,
> > > > > > but we fall back to matching by mode if it hasn't been, which i=
n this
> > > > > > case means that we have no way to differentiate between NTSC, N=
TSC-J,
> > > > > > PAL-M in this case.
> > > > > >
> > > > > > We have some patches downstream for the RaspberryPi that has th=
e TV
> > > > > > standard as a property. There's a few extra logic required for =
the
> > > > > > userspace (like setting the PAL property, with the NTSC mode) s=
o I'm not
> > > > > > sure it's preferable.
> > > > > >
> > > > > > Or we could do something like a property to try that standard, =
and
> > > > > > another that reports the one we actually chose.
> > > > > >
> > > > > > > And another question I have is whether this whitelist belongs=
 into the
> > > > > > > driver at all. Standard modes exist independent from drivers =
or hardware.
> > > > > > > Shouldn't there simply be a global list of all possible mode =
names? Drivers
> > > > > > > would filter out the unsupported modes anyway.
> > > > > >
> > > > > > We should totally do something like that, yeah
> > > > >
> > > > > That sun code already looks like sometihng the DRM core/helpers s=
hould be
> > > > > doing. And if we want to support named modes well, there's a long=
 list of
> > > > > modes in Wikipedia.
> > > > >
> > > > > https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Ve=
ctor_Video_Standards2.svg
> > > >
> > > > Yeah, and NTSC is missing :)
> > >
> > > And that diagram is about the "digital" variant of PAL.
> > > If you go the analog route, the only fixed parts are vfreq/hfreq,
> > > number of lines, and synchronization. Other parameters like overscan
> > > can vary.  The actual dot clock can vary wildly: while there is an
> > > upper limit due to bandwidth limitations, you can come up with an
> > > almost infinite number of video modes that can be called PAL, which
> > > is one of the reasons why I don't want hardware-specific variants to
> > > end up in a global video mode database.
> >
> > Do you have an example of what that would look like?
>=20
> You mean a PAL mode that does not use 768x576?

I meant what the almost infinite number of video modes that can be
called PAL and would have to be defined in drivers

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/video/fbdev/amifb.c#n834

But that works :)

I don't see what really is troublesome if we go with the mode + property
setup here.

We can deal easily with the interlaced vs non-interlaced variants
already with DRM_MODE_FLAG_INTERLACE, and the ff variants can be dealt
with DRM_MODE_FLAG_DBLCLK.

We still need something to differentiate between, say, PAL-M and NTSC-J
where the differences are between things not exposed by the mode itself
(black and blanking levels differ from NSTC for NTSC-J, and the color
carrier frequency is PAL's for PAL-M)

Am I missing something?

> (TAG_HIRES is replaced by the actual dot clock at runtime, as it
>  depends on the crystal present on the mainboard).

If we have the crystal frequency in the kernel somehow, we could filter
them out from the driver (or fill them in) depending on that frequency.

I still think the mode + property is the way to go, possibly with some
generic component that would take the mode name from the command line
and create that initial state depending on the value for backward
compatibility.

What do you think?

Maxime

--awtk4wasf5vxs4te
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYs6SRAAKCRDj7w1vZxhR
xVOqAQCg8vTs8wjnkjxq9f7GbLL1CPsCzmkp+121iy7WWZO0jgD/fo4NskitaI9Y
+N28obtx7F+LsKeaMFth1fzu0FdT7gk=
=UWV0
-----END PGP SIGNATURE-----

--awtk4wasf5vxs4te--
