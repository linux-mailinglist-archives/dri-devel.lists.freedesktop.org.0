Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC942C1AE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400826E057;
	Wed, 13 Oct 2021 13:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD276E04E;
 Wed, 13 Oct 2021 13:45:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E91658109A;
 Wed, 13 Oct 2021 09:45:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 09:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FgY2hnPsjJYOKFF2DfGAEdLl833
 3nbKBOAi3tBKnQlQ=; b=ILAGaEIzzGT1Crwgs6sVwiM8jp7fDV292TfRxD9WjM3
 nLQuvEp7LxnDwPl1JxXScK1ThPlXr4Wf49BDFVjOdlOqjYi4pTMXr45knwt8FhRO
 ckI1ffIItH6jTDPHsxyOee0Vp6brQISi1OJuf4jMReH/04LAi2CeRvWmCnxI+jJf
 6RTKViyIiRk/EzZf8+voCBu1+rodC5nYkFMtqnrOm46yKv/SRareb1ZcSBA8kNgh
 6nInIt13Gs3YMi77ME49LtJtwSCSbP2zHBOECWl1vOcrDVOwmi/IykIIIsN76YIv
 9rq4xzNZB4B8ghtuVHx0fjuDbd19pbONRY5JR96sClw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FgY2hn
 PsjJYOKFF2DfGAEdLl8333nbKBOAi3tBKnQlQ=; b=MCzneJUdJskivibM/B8m58
 p2fJLYMp7cyea/+gacO5Q5XzORoDOfwMLAuHquGTCq+IubJQtv8azQTrSFtmfY+T
 xI3QG2RpB71HWqh/nV2uukpdKivNfJmIMX1UtjwghV2kEvwi5oS5GpPDHwdujSyD
 eu1HU7jVf4oMxdjgMJ9GpsZcIfrAHk+ngxFzOLWShE+blBVtTKn4gJkS269elpSU
 cO4AOodQSEOOr50Ur7bJ6wfWzqSoAzEnuIBbsz82iFFUUmewYkzlPJsCpFBUY1lx
 6m8Be/NzoY4gM7vBWt38OSeYvkBgWr8SadMPsgQlpyfhLVJ1sc/riwGsoVB8op7Q
 ==
X-ME-Sender: <xms:6-JmYT_Z-TnrdWsnG0qgims4_VgA5CMDoXKnsChz4Hi9tQEkX9i40g>
 <xme:6-JmYfs1mlil60fbhZCpXwSBBQhGDAbSiWZlMPPM8xuLcufbMIM-lLYKPZVhHrT3C
 Oc8oDIMSVglG0qVfKs>
X-ME-Received: <xmr:6-JmYRDW7Ko8H9rRg5acJMSiNT3bm9NH7S1_rjcsTzsk9GgmguxJX8lqdPGfBiPNPrB_C19niqYJQIXemaYSb42GMmHmW18oBwdGDBbP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepudfhgeffjedvueegudehgeevgefhgfdujeeguedvgeelgeeuffeifedtheet
 leeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhlihhnrghrohdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6-JmYffwzApL3L4WQhcOYb-3771Otqxn9jsWg_yLnO87TsS8nZvBEg>
 <xmx:6-JmYYNHuEuEJKhvTyNMtYEUHSe7hNvRytMC7_3KoGGmt-qktJ1vbQ>
 <xmx:6-JmYRnBYNUJTjZusigkIzqQJ_hxZTVsvrH6WhonWbSoc8PzZNOQbA>
 <xmx:7eJmYbioKLHlBrVGP2IgnvTOW-FAvO43thR-PKrmfHMMsh-wnfd0Cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 09:45:15 -0400 (EDT)
Date: Wed, 13 Oct 2021 15:45:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: John Stultz <john.stultz@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,	Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <20211013134513.hm6ftktkbh4kpudv@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CALAqxLW=dJSmfaHAL=BfYVVxZHQvzJWu4UjMixwgM=Nh85JVNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yp3sab3u3qe3qd7a"
Content-Disposition: inline
In-Reply-To: <CALAqxLW=dJSmfaHAL=BfYVVxZHQvzJWu4UjMixwgM=Nh85JVNw@mail.gmail.com>
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


--yp3sab3u3qe3qd7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Wed, Sep 29, 2021 at 04:29:42PM -0700, John Stultz wrote:
> On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrot=
e:
> >
> > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wr=
ote:
> > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> =
wrote:
> > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > The best practice to avoid those issues is to register its functi=
ons only after
> > > > > all its dependencies are live. We also shouldn't wait any longer =
than we should
> > > > > to play nice with the other components that are waiting for us, s=
o in our case
> > > > > that would mean moving the DSI device registration to the bridge =
probe.
> > > > >
> > > > > I also had a look at all the DSI hosts, and it seems that exynos,=
 kirin and msm
> > > > > would be affected by this and wouldn't probe anymore after those =
changes.
> > > > > Exynos and kirin seems to be simple enough for a mechanical chang=
e (that still
> > > > > requires to be tested), but the changes in msm seemed to be far m=
ore important
> > > > > and I wasn't confortable doing them.
> > > >
> > > >
> > > > Hey Maxime,
> > > >   Sorry for taking so long to get to this, but now that plumbers is
> > > > over I've had a chance to check it out on kirin
> > > >
> > > > Rob Clark pointed me to his branch with some fixups here:
> > > >    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripar=
d/bridge-rework
> > > >
> > > > But trying to boot hikey with that, I see the following loop indefi=
nitely:
> > > > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy r=
egulator
> > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy r=
egulator
> > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy r=
egulator
> > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy =
regulator
> > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy r=
egulator
> > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy r=
egulator
> > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > >
> > > I just realized Rob's tree is missing the kirin patch. My apologies!
> > > I'll retest and let you know.
> >
> > Ok, just retested including the kirin patch and unfortunately I'm
> > still seeing the same thing.  :(
> >
> > Will dig a bit and let you know when I find more.
>=20
> Hey Maxime!
>   I chased down the issue. The dsi probe code was still calling
> drm_of_find_panel_or_bridge() in order to succeed.
>=20
> I've moved the logic that looks for the bridge into the bridge_init
> and with that it seems to work.
>=20
> Feel free (assuming it looks ok) to fold this change into your kirin patc=
h:
>   https://git.linaro.org/people/john.stultz/android-dev.git/commit/?id=3D=
4a35ccc4d7a53f68d6d93da3b47e232a7c75b91d

Thanks for testing, I've picked and squashed your fixup

Maxime

--yp3sab3u3qe3qd7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWbi6QAKCRDj7w1vZxhR
xWrqAQDj1jImF6Y4lt74Rko+bxO0mdKNx+0pGLW7VlQhBEicrwEAk7tEp5uOOwcw
jaEEUSlRzwDB0bV4i3OaMZN48bhI7wA=
=KNVX
-----END PGP SIGNATURE-----

--yp3sab3u3qe3qd7a--
