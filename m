Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F44143EB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E356EB11;
	Wed, 22 Sep 2021 08:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EC26EB11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:42:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EE655802A0;
 Wed, 22 Sep 2021 04:42:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Sep 2021 04:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=yoA2Ii3axXPN7X/c5B/JJ2aU3f5
 xmDOavqnZKLWOwGI=; b=bD20vs5Eiv2VzwwdLP5aJY0qaNmLmsNoCiA4YNs3st8
 5QN/ENVa1SUEPMTMXtETZC9a1TRmp4gQIiDscATsGeR/a0Mky7AnZXc0joYVNlO9
 Q+8nFFZkzf/HUPw/LQv4SbmuFmNRoBzGHkhd6EGE7cq553pni5Zxsfe1qjDsx//m
 M6fZD0SCaW600TggsuxlLbKxlVVuNUb7n7ASm32aWhY6CQlJyh883clvlU7gf32O
 Ztj9Dz/pJXWcVzMWUeOid1vfyVa/lbCDKHvG8RHkvydFhkcknpl1G7z8o5z5+AdN
 xquqL2BIYUlSk9jq18l+XsyaRZMuGiUbt00d4RFcPVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yoA2Ii
 3axXPN7X/c5B/JJ2aU3f5xmDOavqnZKLWOwGI=; b=HxvbmiS7peC+aSJzBbjFTo
 DwXG/2eAbUkdtT5pxS+gkiPHyUa95N9+uusXaK0JpIsftsHGuBoFGMCbmnKtmcfu
 q5opv+zBUs9d3CD9Yw9AQ5hWznVogHWzptHTVH4GvVGWnc4pDLwCZL395BCIF3+6
 cbk8iL66EML7W+oswJeZd39V0WRzLmCZJdhKozYUTdxnCP7NB7tTtAw1JkZcHiCB
 OOOgYVAddUZaPgxANeb9fQyraSXFG1k+veKgVcZsi3X3WbtEIc/fwukHydBbwBD/
 idWXmctPT90yjPX3S7T53AiCBmbjnTYsBYvu+WAJE90C73L20pIGysEzi5QcfoaA
 ==
X-ME-Sender: <xms:VuxKYcgL6aoCgh02rEx50Ih2s0vhbdIDcU1oIPLLpp0m60uNVmSQ2w>
 <xme:VuxKYVDQJbqEXHvkC6blHIZG60uKUgOn1mJ6NcN2zMTWdugqQRS-jXt55-dVeYqef
 g0i5_RHc1SXdxrD2H0>
X-ME-Received: <xmr:VuxKYUHqYZyI0uZmF0gLQickQOpIJHAZ1gb5nARrqvro1wqognq9MelwR0SdLmS0EPCl9vD1Q4BW_RDgatyAPDTXM-EPz97O1-uD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VuxKYdSP9iQZD-Fhv8Bu0i4OjGjk9Xt2QTArkcXrhTFPiyk1d6RV6w>
 <xmx:VuxKYZx55-18gnF6uKnFtjvJ-UjWKxp_tRYknFRywR8eEHp8l-3G8Q>
 <xmx:VuxKYb6LhydO-LNHGFxElJDCgsVL6qLDQmz4pOVtOTDLB0OFIAkoew>
 <xmx:WOxKYSHddCiT4db0vBw-2gZu8R7cxNLPayrJMbzbvmYDF7fHOfJZHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 04:41:57 -0400 (EDT)
Date: Wed, 22 Sep 2021 10:41:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Openrisc <openrisc@lists.librecores.org>
Subject: Re: [PATCH v3 1/6] drm/vc4: select PM (openrisc)
Message-ID: <20210922084156.xqru5fdjkarbkyew@gilmour>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
 <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5x75oq3heiuvzqmo"
Content-Disposition: inline
In-Reply-To: <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
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


--5x75oq3heiuvzqmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun, Sep 19, 2021 at 09:40:44AM -0700, Randy Dunlap wrote:
> On 8/19/21 6:59 AM, Maxime Ripard wrote:
> > We already depend on runtime PM to get the power domains and clocks for
> > most of the devices supported by the vc4 driver, so let's just select it
> > to make sure it's there, and remove the ifdef.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/Kconfig    | 1 +
> >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
> >   2 files changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> > index 118e8a426b1a..f774ab340863 100644
> > --- a/drivers/gpu/drm/vc4/Kconfig
> > +++ b/drivers/gpu/drm/vc4/Kconfig
> > @@ -9,6 +9,7 @@ config DRM_VC4
> >   	select DRM_KMS_CMA_HELPER
> >   	select DRM_GEM_CMA_HELPER
> >   	select DRM_PANEL_BRIDGE
> > +	select PM
> >   	select SND_PCM
> >   	select SND_PCM_ELD
> >   	select SND_SOC_GENERIC_DMAENGINE_PCM
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index c2876731ee2d..602203b2d8e1 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct vc4_hdm=
i *vc4_hdmi)
> >   	return 0;
> >   }
> > -#ifdef CONFIG_PM
> >   static int vc4_hdmi_runtime_suspend(struct device *dev)
> >   {
> >   	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
> > @@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct device =
*dev)
> >   	return 0;
> >   }
> > -#endif
> >   static int vc4_hdmi_bind(struct device *dev, struct device *master, v=
oid *data)
> >   {
> >=20
>=20
> Hi,
>=20
> FYI.
>=20
> This still causes a build error on arch/openrisc/ since it does not suppo=
rt
> CONFIG_PM (it does not source "kernel/power/Kconfig" like some other arch=
es do):
>=20
> ./arch/riscv/Kconfig:source "kernel/power/Kconfig"
> ./arch/x86/Kconfig:source "kernel/power/Kconfig"
> ./arch/nds32/Kconfig:source "kernel/power/Kconfig"
> ./arch/sh/Kconfig:source "kernel/power/Kconfig"
> ./arch/arc/Kconfig:source "kernel/power/Kconfig"
> ./arch/arm64/Kconfig:source "kernel/power/Kconfig"
> ./arch/xtensa/Kconfig:source "kernel/power/Kconfig"
> ./arch/sparc/Kconfig:source "kernel/power/Kconfig"
> ./arch/arm/Kconfig:source "kernel/power/Kconfig"
> ./arch/mips/Kconfig:source "kernel/power/Kconfig"
> ./arch/powerpc/Kconfig:source "kernel/power/Kconfig"
> ./arch/um/Kconfig:source "kernel/power/Kconfig"
> ./arch/ia64/Kconfig:source "kernel/power/Kconfig"
>=20
> so with
> CONFIG_DRM_VC4=3Dy
> # CONFIG_DRM_VC4_HDMI_CEC is not set
>=20
> I still see
> ../drivers/gpu/drm/vc4/vc4_hdmi.c:2139:12: warning: 'vc4_hdmi_runtime_sus=
pend' defined but not used [-Wunused-function]
>  2139 | static int vc4_hdmi_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~

With what version did you get that build error? -rc2 shouldn't have it
anymore since the runtime_pm hooks introduction got reverted.

Maxime

--5x75oq3heiuvzqmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUrsVAAKCRDj7w1vZxhR
xcJDAP9CgeyoZOknS4cqvZ9EHhMJxZmRdv9kzQ1KIRH2UxvZqwD/e7AQfR48+Phw
iC0PWsKBXpNQ9/dhgtzAPUq3pEeNOQE=
=dGOO
-----END PGP SIGNATURE-----

--5x75oq3heiuvzqmo--
