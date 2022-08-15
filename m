Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8F5929CC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 08:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB85AD3F6;
	Mon, 15 Aug 2022 06:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78ABAD389;
 Mon, 15 Aug 2022 06:45:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 164125C00B3;
 Mon, 15 Aug 2022 02:45:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 Aug 2022 02:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660545956; x=1660632356; bh=I3bsKRHOO5
 koHFElg4jKWV2Q90G+oaIQtRvqhr/uf04=; b=gDAxKUVv6i5RB5gU86Ll/XVZue
 vjmi42p4oxpPBNTfsMwwz8Wv9MQMck8oodNTJkEEy2w0UQa1bM6+frhPB/plYcEE
 lWti3Jbki7ZYiuBUqEnE7H3e70R3+aoJfYut/vcZeyPi9UitrgFOc0QJVHIwG+lh
 v+Nx2B30KeSQjnlqlKRStvc5F7ednw6AwhhKS8YBHlta2DW67Jzf9dUC36tYB0mi
 IVEgpZ5j8SkkZx5IoGnwNl169CpKfyo7unYgNT5a2R4dloLSTF7lrkcQcpQedM1k
 Km2NgzcDzQyJh4Ywgfw6jX2l2tpHUYnHxVwkniSA/IoBTaifQFVfXiXU7CsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660545956; x=1660632356; bh=I3bsKRHOO5koHFElg4jKWV2Q90G+
 oaIQtRvqhr/uf04=; b=ft8+hWHQY5h1d6kkB46ajlmU2N9in58/qztOoIPxozYW
 YE/gJt/l1W3TztoEFzKZKCSNiJPoACr9caYQ94Fk3ERxFHu2R42k88CLODr6LaJD
 0BYf5fLslIYeBvAEV5d159grNKawDhc7aSq4t0CwORi/GIQZR6qAHICtgfLNWVq1
 6qalW7VAuCUuRtFTDKU83c7Rqh4iq4boW5THl3WRmirOju+12ZNyfs8a9c60QdEH
 zVHXhlUvuQJ1KOqslSuBjtrqEKB1S01T1lW8ejZSIoNtI5D3O75m1Srf5rhYX3L+
 w2WvWOIFhzLNDvHEnW787PlELXjjt8j3U1ZTgGZLKA==
X-ME-Sender: <xms:o-v5YnK_VezOItFUChzkhBMbOxRJ2FKu3YwGs7MhoF-jVEm13zDtKg>
 <xme:o-v5YrILkUsWULOtnglpcCeFBM2E0cjQdmFZcVzi_cE90NweEo0HNacSNeGpB3Urt
 BSCNsVs_he6A1WfbZw>
X-ME-Received: <xmr:o-v5Yvs-vJj5Hsgr0-6GBAg2rQI9FSbSkbjy_swky3qdt3Nu4AxFkE2ySEWb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:o-v5Yga_Ayc0undwdem13qvtm6ibFZg7PGEwWKpxewXB4-ynHo3E7g>
 <xmx:o-v5YuZ9A4R9p15Ox9Fxiq3oPv1V7L8T_UBrgUHOkcFmPEBUqUJpDQ>
 <xmx:o-v5YkDbh126zUKAI01Ch4zAUszrMXupkhSjRA0XgYMs1HkNV2XSuQ>
 <xmx:pOv5YkmtPtsl4t-pfVFh5h41-eRribxPJonAXTqUfvdUNkPGqY8BqQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 02:45:55 -0400 (EDT)
Date: Mon, 15 Aug 2022 08:45:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
Message-ID: <20220815064543.g7loqfb6rtwkookl@houat>
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
 <20220729075118.ofnpk52tk4usm3n3@penduick>
 <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
 <20220729164136.opucqg64qz4ypmvo@penduick>
 <CAD=FV=UKYksHjuVR27DPdUFFtJrQKB2KbT08qjeYLNW_3y_Mfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wzbntj3bd7k5xk65"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UKYksHjuVR27DPdUFFtJrQKB2KbT08qjeYLNW_3y_Mfg@mail.gmail.com>
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


--wzbntj3bd7k5xk65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 12:57:40PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Jul 29, 2022 at 9:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Jul 29, 2022 at 07:50:20AM -0700, Doug Anderson wrote:
> > > On Fri, Jul 29, 2022 at 12:51 AM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> > > >
> > > > On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> > > > > <quic_abhinavk@quicinc.com> wrote:
> > > > > >
> > > > > > Hi Rob and Doug
> > > > > >
> > > > > > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > > > > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > > > > >>
> > > > > > >> Hi,
> > > > > > >>
> > > > > > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk=
@quicinc.com> wrote:
> > > > > > >>>
> > > > > > >>> + sankeerth
> > > > > > >>>
> > > > > > >>> Hi Doug
> > > > > > >>>
> > > > > > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > > > > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD =
reference
> > > > > > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, =
the 144 Hz
> > > > > > >>>> mode is listed first and thus is marked preferred. The EDI=
D decode I
> > > > > > >>>> ran says:
> > > > > > >>>>
> > > > > > >>>>     First detailed timing includes the native pixel format=
 and preferred
> > > > > > >>>>     refresh rate.
> > > > > > >>>>
> > > > > > >>>>     ...
> > > > > > >>>>
> > > > > > >>>>     Detailed Timing Descriptors:
> > > > > > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  3=
46.500 MHz
> > > > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > > > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  1=
44.370 MHz
> > > > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > > > >>>>
> > > > > > >>>> I'm proposing here that the above is actually a bug and th=
at the 60 Hz
> > > > > > >>>> mode really should be considered preferred by Linux.
> > > > > >
> > > > > > Its a bit tricky to say that this is a bug but I think we can c=
ertainly
> > > > > > add here that for an internal display we would have ideally had=
 the
> > > > > > lower resolution first to indicate it as default.
> > > > >
> > > > > Yeah, it gets into the vagueness of the EDID spec in general. As =
far
> > > > > as I can find it's really up to the monitor to decide by what mea=
ns it
> > > > > chooses the "preferred" refresh rate if the monitor can support m=
any.
> > > > > Some displays may decide that the normal rate is "preferred" and =
some
> > > > > may decide that the high refresh rate is "preferred". Neither dis=
play
> > > > > is "wrong" per say, but it's nice to have some consistency here a=
nd to
> > > > > make it so that otherwise "dumb" userspace will get something
> > > > > reasonable by default. I'll change it to say:
> > > > >
> > > > > While the EDID spec appears to allow a display to use any criteri=
a for
> > > > > picking which refresh mode is "preferred" or "optimal", that vagu=
eness
> > > > > is a bit annoying. From Linux's point of view let's choose the 60=
 Hz
> > > > > one as the default.
> > > >
> > > > And if we start making that decision, it should be for all panels w=
ith a
> > > > similar constraint, so most likely handled by the core, and the new
> > > > policy properly documented.
> > > >
> > > > Doing that just for a single panel is weird.
> > >
> > > Yeah, though having a "general policy" in the core can be problematic.
> > >
> > > In general I think panel EDIDs are only trustworthy as far as you can
> > > throw them. They are notorious for having wrong and incorrect
> > > information, which is why the EDID quirk list exists to begin with.
> > > Trying to change how we're going to interpret all EDIDs, even all
> > > EDIDs for eDP panels, seems like it will break someone somewhere.
> > > Maybe there are EDIDs out there that were only ever validated at the
> > > higher refresh rate and they don't work / flicker / cause digitizer
> > > noise at the lower refresh rate. Heck, we've seen eDP panel vendors
> > > that can't even get their checksum correct, so I'm not sure I want to
> > > make a global assertion that all panels validated their "secondary"
> > > display mode.
> > >
> > > In this particular case, we have validated that this particular Sharp
> > > panel works fine at the lower refresh rate.
> > >
> > > I would also note that, as far as I understand it, ODMs actually can
> > > request different EDIDs from the panel vendors. In the past we have
> > > been able to get panel vendors to change EDIDs. Thus for most panels
> > > I'd expect that we would discover this early, change the EDID default,
> > > and be done with it. The case here is a little unusual in that by the
> > > time we got involved and started digging into this panel too many were
> > > created and nobody wants to throw away those old panels. This is why
> > > I'm treating it as a quirk/bug. Really: we should have updated the
> > > EDID of the panel but we're unable to in this case.
> >
> > You raise some good points, but most of the discussion around that patch
> > were mostly around performances, power consumption and so on.
> >
> > This is very much a policy decision, and if there is some panel where
> > the EDID reports 60Hz but is broken, then that panel should be the
> > exception to the policy
> >
> > But doing it for a single panel is just odd
>=20
> OK, fair enough. I'll abandon this patch at least as far as mainline
> is concerned, then.

That wasn't really my point though :)

If you think that this change is needed, then we should totally discuss
it and I'm not opposed to it.

What I don't really like about this patch is that it's about a single
panel: if we're doing it we should do it for all the panels.

Where we do it can also be discussed, but we should remain consistent
there.

Maxime

--wzbntj3bd7k5xk65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvnrlwAKCRDj7w1vZxhR
xaVpAQCkpLNIcSznLiwriHSHcXQmxwAgbpV0rZ1L2Xvo43kqVQD/RVC2++yCix/1
0Wq6Wm6rhIe0Cq+R41OyyQASUA2w4gM=
=Qk4w
-----END PGP SIGNATURE-----

--wzbntj3bd7k5xk65--
