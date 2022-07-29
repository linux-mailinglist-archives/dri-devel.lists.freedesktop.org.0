Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337EE584CF4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DFA10E324;
	Fri, 29 Jul 2022 07:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317A10E324;
 Fri, 29 Jul 2022 07:51:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8BD2C320097D;
 Fri, 29 Jul 2022 03:51:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 03:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1659081083; x=1659167483; bh=x/uGRUiGzR
 Dd3km1ZgnwtdHQHNmvSMC7sQG/+Jd4zoo=; b=DemEI6dSqK7EJVTyXhNlRLZ/jk
 k7DuMlQ/vpPv6NeJz7Bsf8jOI+1qCyZvR4CAB/ZSSDgr2ORETFcrvwqd17nsVQQm
 wMX/Bnc+EZDdc+cYEqzCMXjfuWhKjbNmxuB94eb5HFUlApQitdLn2iCXoUbmxAMo
 dr1IvCPOySBmMkkS0vJlSfUKf7IFkX6PNUWB3CPmVgX+8/vUbbxZoEU47YvvDlRZ
 iJTcTYFMhJsTbR7kPUXM/+aRPUG1wX/Rdizj/lBE5D53i2wqwUcWAAiSxjlYVvTv
 XompauWC9IXADu9AkQVuVkl/EOKvskqqKB7cmP7wLzGS/LUqsa5haXoXFKEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659081083; x=1659167483; bh=x/uGRUiGzRDd3km1ZgnwtdHQHNmv
 SMC7sQG/+Jd4zoo=; b=YRxavZe8a60Zm2BU6GWIO89qBmmH6m3uHtBgAo5dZZjK
 xlNhYLJDOTnVRhfXL5fbhEKYyHeAMmOCupZTuDJeP8aXqofgfXYJxIBUM5HlbdTX
 edIjwU3cu8P/L45pT8ivnU46u0uEmu0mZkcDOgMwPETKnrgUc5EbFhMT83+PRL3D
 j38RG2eMBhCqgNcZqUdhV9X6Kok/pRIXVx4Tz9IM1eQz63u4xULwlt86sM6xVD6J
 ZhrKu4y67fbC6PKQxkBuA9tEcHKDu1cUYNVX6wszaBBbQTUCpvHl2XJecTh0bvbT
 nfW+UUDOBqvLx7do5AYAZS4aN3ngDyaiJdL7kZAYtg==
X-ME-Sender: <xms:epHjYsGPGlfLbMJnIjGS219YhZe8iia-4GjqzkFPO1s_lMY-1xFRvA>
 <xme:epHjYlW3WB_cEB9HU4F90CwFvzrNgsqrURaFCELLXD7RsgDp4p5o3VZEUOO8KzTSI
 N6-172Gm7OYgkIMTgU>
X-ME-Received: <xmr:epHjYmLFOL3FEU8_KR1zIkjoEBRTmyxWIjgP87-prKtA7l5PCZo-Iuvxc0nAnkqwWyxU52I0QTNA-fqgCJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:epHjYuGCvckobZGg9GCAjTHdxWPHM8UynsXwmU6WWQjtqkR2CIM5Ug>
 <xmx:epHjYiWk9irHe7OTCgM7TgPYExB3KIYEhlRit_Yg76baHatbsXt0OQ>
 <xmx:epHjYhO-f8uOdSaBFz8oRQtnh6nU9H6sBa6dZVjQzxaJDy5iJfb0Bw>
 <xmx:e5HjYuQdLX9DQoA4-k3XGTf0wDmM4uT9Mi1wsjV0fIPo35pwH5jY7Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 03:51:21 -0400 (EDT)
Date: Fri, 29 Jul 2022 09:51:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
Message-ID: <20220729075118.ofnpk52tk4usm3n3@penduick>
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oklsttshcgwhfm5m"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
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


--oklsttshcgwhfm5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> <quic_abhinavk@quicinc.com> wrote:
> >
> > Hi Rob and Doug
> >
> > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org>=
 wrote:
> > >>
> > >> Hi,
> > >>
> > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc=
=2Ecom> wrote:
> > >>>
> > >>> + sankeerth
> > >>>
> > >>> Hi Doug
> > >>>
> > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 =
Hz
> > >>>> mode is listed first and thus is marked preferred. The EDID decode=
 I
> > >>>> ran says:
> > >>>>
> > >>>>     First detailed timing includes the native pixel format and pre=
ferred
> > >>>>     refresh rate.
> > >>>>
> > >>>>     ...
> > >>>>
> > >>>>     Detailed Timing Descriptors:
> > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 M=
Hz
> > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 M=
Hz
> > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > >>>>
> > >>>> I'm proposing here that the above is actually a bug and that the 6=
0 Hz
> > >>>> mode really should be considered preferred by Linux.
> >
> > Its a bit tricky to say that this is a bug but I think we can certainly
> > add here that for an internal display we would have ideally had the
> > lower resolution first to indicate it as default.
>=20
> Yeah, it gets into the vagueness of the EDID spec in general. As far
> as I can find it's really up to the monitor to decide by what means it
> chooses the "preferred" refresh rate if the monitor can support many.
> Some displays may decide that the normal rate is "preferred" and some
> may decide that the high refresh rate is "preferred". Neither display
> is "wrong" per say, but it's nice to have some consistency here and to
> make it so that otherwise "dumb" userspace will get something
> reasonable by default. I'll change it to say:
>=20
> While the EDID spec appears to allow a display to use any criteria for
> picking which refresh mode is "preferred" or "optimal", that vagueness
> is a bit annoying. From Linux's point of view let's choose the 60 Hz
> one as the default.

And if we start making that decision, it should be for all panels with a
similar constraint, so most likely handled by the core, and the new
policy properly documented.

Doing that just for a single panel is weird.

Maxime

--oklsttshcgwhfm5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYuORdgAKCRCIQ8rmN6G3
y0z+AP9ojmTlQhu5iNapifR8TkVj5GwhktAW8TUwGoGL14Ci4QEA9Otjl7UEG2oM
Fy+ESHA52LQtiaNfS8fUHkPZnBQYz6Q=
=cdJ8
-----END PGP SIGNATURE-----

--oklsttshcgwhfm5m--
