Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057345853B6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E5512B496;
	Fri, 29 Jul 2022 16:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FBB10F8FE;
 Fri, 29 Jul 2022 16:41:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 986255C00BF;
 Fri, 29 Jul 2022 12:41:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1659112899; x=1659199299; bh=vwJQ7sD4dG
 7A8X3sl4630p9ybNJbGIZPkCYHWDFRHOw=; b=nrQh9TATJ0OuMlig2AOr1ZntXY
 KU4u61qMFVMlEBwNZ4IZZcc5MmGTz9EOcLvKr3kSzlrdHZXfF0P8d8WtjLrppS3k
 PvgBE9jz0VEqnJBi2K9+z1Cl3/O69lXCwEXQW+zKYajT63PJHroXCFhQg8d6Jorb
 rIQcFR5uNXqe8E8A8qKc1SwDSXwdr6S9tiI5JgbzmLyITAFJeFWNgw/N24wBfl7q
 E9XhlD62gB6Gxs/lhHkjjfiKpijtmIMPoN08uOIXAb3BRZH6ZtFSRzEou0SaHCCi
 CssmSeayqZ49dZkI7Tw+JlhQZ5NtaLllvavpr5B+2s+8i64NHjKlLWnisSkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659112899; x=1659199299; bh=vwJQ7sD4dG7A8X3sl4630p9ybNJb
 GIZPkCYHWDFRHOw=; b=vspUWQJZtY3/RMVDt3OwYtIZFUFyfUI0y/KyDGjjqo7s
 v6XuTaLxcuw3bU+2p5M4666jwTAVvcVAIPgHEdEWdremwHGkHzvUKWlTqq8228wJ
 VMWhfY33skzOver9P9k36SEct7mYuzEiUx53lhDK+wdYaUgpA3DebKepWNKtAIIV
 uucp2awRnstfO0pVqgMa/4fsJyZPPLD1+lZpR+fU0NDp/iGFmlEAzg0WFD1RAdGP
 I5aWrxTXj+lKqhPQ01CFu9V9ZU9MgNXT765qUctvRzQuvhu2mtwx/rESKrhu/GnG
 FLBlQpUudD8l+dI1qQRp6xL8IdPE33C54J8Reip9yQ==
X-ME-Sender: <xms:ww3kYt9nIZ_NZQkj-7yXIDhmxVEjy3lT25ITx0BMatv2SWHoEF7wEg>
 <xme:ww3kYhuwFTBY8YgMbnJLIwvlsuHwassnPtzRKRGsD6BWNBgoRJnWORK95SfrpGRt1
 TZBRuYC-sE6LFEUyww>
X-ME-Received: <xmr:ww3kYrCVuK90gokBAUGueeKioFX53eU84Iln3c9-1PofaodJ7bch3e3h7XNkZg_AVcq5_tISYeE1HziFvMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ww3kYhdIN4vbnHbTvJazERlLA8AMdkclpSR-AJxLgUc6zDD3S4crsA>
 <xmx:ww3kYiMgxpTzUwDxt62LMntejyIGGl_qdM2he3BD1PkNgk5vSsyVnA>
 <xmx:ww3kYjm9ZdQOoWNH8_r-ljnc1W2f_lWjFBiA0Zmn7HX9ItHz8Nw1ZQ>
 <xmx:ww3kYpqcGi_8EgEjNqoOjPu0dDOqcyj9x6RSOxG3DLHNe4Tj0ovYsA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:41:38 -0400 (EDT)
Date: Fri, 29 Jul 2022 18:41:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
Message-ID: <20220729164136.opucqg64qz4ypmvo@penduick>
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
 <20220729075118.ofnpk52tk4usm3n3@penduick>
 <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nmnf5qri3rvyhvwr"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nmnf5qri3rvyhvwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 07:50:20AM -0700, Doug Anderson wrote:
> On Fri, Jul 29, 2022 at 12:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> > > <quic_abhinavk@quicinc.com> wrote:
> > > >
> > > > Hi Rob and Doug
> > > >
> > > > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.=
org> wrote:
> > > > >>
> > > > >> Hi,
> > > > >>
> > > > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@qui=
cinc.com> wrote:
> > > > >>>
> > > > >>> + sankeerth
> > > > >>>
> > > > >>> Hi Doug
> > > > >>>
> > > > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD refe=
rence
> > > > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the =
144 Hz
> > > > >>>> mode is listed first and thus is marked preferred. The EDID de=
code I
> > > > >>>> ran says:
> > > > >>>>
> > > > >>>>     First detailed timing includes the native pixel format and=
 preferred
> > > > >>>>     refresh rate.
> > > > >>>>
> > > > >>>>     ...
> > > > >>>>
> > > > >>>>     Detailed Timing Descriptors:
> > > > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.5=
00 MHz
> > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.3=
70 MHz
> > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > >>>>
> > > > >>>> I'm proposing here that the above is actually a bug and that t=
he 60 Hz
> > > > >>>> mode really should be considered preferred by Linux.
> > > >
> > > > Its a bit tricky to say that this is a bug but I think we can certa=
inly
> > > > add here that for an internal display we would have ideally had the
> > > > lower resolution first to indicate it as default.
> > >
> > > Yeah, it gets into the vagueness of the EDID spec in general. As far
> > > as I can find it's really up to the monitor to decide by what means it
> > > chooses the "preferred" refresh rate if the monitor can support many.
> > > Some displays may decide that the normal rate is "preferred" and some
> > > may decide that the high refresh rate is "preferred". Neither display
> > > is "wrong" per say, but it's nice to have some consistency here and to
> > > make it so that otherwise "dumb" userspace will get something
> > > reasonable by default. I'll change it to say:
> > >
> > > While the EDID spec appears to allow a display to use any criteria for
> > > picking which refresh mode is "preferred" or "optimal", that vagueness
> > > is a bit annoying. From Linux's point of view let's choose the 60 Hz
> > > one as the default.
> >
> > And if we start making that decision, it should be for all panels with a
> > similar constraint, so most likely handled by the core, and the new
> > policy properly documented.
> >
> > Doing that just for a single panel is weird.
>=20
> Yeah, though having a "general policy" in the core can be problematic.
>=20
> In general I think panel EDIDs are only trustworthy as far as you can
> throw them. They are notorious for having wrong and incorrect
> information, which is why the EDID quirk list exists to begin with.
> Trying to change how we're going to interpret all EDIDs, even all
> EDIDs for eDP panels, seems like it will break someone somewhere.
> Maybe there are EDIDs out there that were only ever validated at the
> higher refresh rate and they don't work / flicker / cause digitizer
> noise at the lower refresh rate. Heck, we've seen eDP panel vendors
> that can't even get their checksum correct, so I'm not sure I want to
> make a global assertion that all panels validated their "secondary"
> display mode.
>
> In this particular case, we have validated that this particular Sharp
> panel works fine at the lower refresh rate.
>=20
> I would also note that, as far as I understand it, ODMs actually can
> request different EDIDs from the panel vendors. In the past we have
> been able to get panel vendors to change EDIDs. Thus for most panels
> I'd expect that we would discover this early, change the EDID default,
> and be done with it. The case here is a little unusual in that by the
> time we got involved and started digging into this panel too many were
> created and nobody wants to throw away those old panels. This is why
> I'm treating it as a quirk/bug. Really: we should have updated the
> EDID of the panel but we're unable to in this case.

You raise some good points, but most of the discussion around that patch
were mostly around performances, power consumption and so on.

This is very much a policy decision, and if there is some panel where
the EDID reports 60Hz but is broken, then that panel should be the
exception to the policy

But doing it for a single panel is just odd

Maxime

--nmnf5qri3rvyhvwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYuQNwAAKCRCIQ8rmN6G3
y5K/AQDd8eMgde6zHk1UUtFFYseaBoCI45v37aTnSvYvhz5dGAD9HdDh4twH58Ei
LYXUH5k7b/x3Tui590b7dKKqyxIT+9E=
=5sio
-----END PGP SIGNATURE-----

--nmnf5qri3rvyhvwr--
