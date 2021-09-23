Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5CE41628E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 17:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57486ED8A;
	Thu, 23 Sep 2021 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54E56ED8A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 15:58:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4F87B580B62;
 Thu, 23 Sep 2021 11:58:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 11:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GQm+lTPGhYJNn4ipzUG6VTqMd9N
 Xez8sQDJ2zFiixKI=; b=tgnoC48Id1WDYUDv9RxeXPUAIYove4djVcPR97Szt1Y
 DK0HVKKSc7NTw2qWo4kJpXiKasCx3JpmWAfWqLwfwBq4+qlqLiu25ZhMd/neYxIA
 wAHW8lpC3Wa7Cen5PIdCIpmhTfUApC2BzR8KoGLTgKsY5PUzmv7owKdW8nFPf6v7
 5Fr/SZDrOM3cKFMbanaM2zUTafLb1qB6rau8PuY+lRCIuB/qcde6Jc90kKb54wh2
 rvn/FTJbevwWQx1YS8SxGNtDmcANx/pwmWFQUoc+i5P8rugawWainJfD1NNCHFX6
 zK3j8b7sj6OAgKaBOoPwepis9C2+BKd/VXA0/Y1XNhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GQm+lT
 PGhYJNn4ipzUG6VTqMd9NXez8sQDJ2zFiixKI=; b=ombkJ8DHd9cFMT9psLE0Ae
 0XJMAQw1YGeHdYFXALKuAgtKVM1VRDefvvNPe6Rlc/ioecO+6zF6dlpuFaTUXgJH
 lmD3oA8bljZpUn0rScMXXKGWNgrzkG4otg4+9R0Th/7G9TELDIcv/f7C5ky7ltvB
 ClU1SxD9GPDW+sWVRJxIPh7P3TzvsGYi3poSCJZCsjrgtLn8548uAOn1RKvvgylG
 GdVMB11H2qRg/i/rlObIAl/4oWoqGYwjBEmN5d5gD+CTLkgPQdshde/CzWIlsf3G
 FKriodbeRu7JuE9CtUIUMHjiSi5QeAmOkepektCDbGgFz3GV6xK83AbffUJPlLsA
 ==
X-ME-Sender: <xms:PaRMYcuem_DDG0DoVw2__pmFPN1HFpwX1FyVzoWxdeT6L1ES-hr33Q>
 <xme:PaRMYZcaB_jTPIxN6Ym8QoxbytBK7txwqx98XYInCJAfhyFYrHruNrGtBhc27Me5p
 IP6jOQQiRKM3D9YpwQ>
X-ME-Received: <xmr:PaRMYXxUfmnHlVMTWZCle9FPd4E8KrpEzAc34hdi5tUARtImDn8I3Ms9OnuY58UECPRMu5-ciJ2KqVhKJ_f3cRfgX7AsKFddSHs7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PaRMYfPM5BnF6AE2eUyZ2napn_laIPuhBSadymRd7FY7LjGJI64sKg>
 <xmx:PaRMYc9Z1XwxY0g5AexQxh-pq3YWrS7C1pdHOyRK8k1Vrb-wACW-uw>
 <xmx:PaRMYXXTQaORjvQSR9Jdc9W_9qD1p3xk8nDkVSbBh-2r57b456v50g>
 <xmx:PqRMYfdIsL1HfDnWlDW14HzSo_zwMsJFoyCpcdBCmwR_Z17fvXKW9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 11:58:52 -0400 (EDT)
Date: Thu, 23 Sep 2021 17:58:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
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
Message-ID: <20210923155851.dyttkomkza5pxqg3@gilmour>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
 <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
 <20210922084156.xqru5fdjkarbkyew@gilmour>
 <YUtQnml8FO8BC7sM@archlinux-ax161>
 <20210923145208.433zaqldird2vnxk@gilmour>
 <YUyVZCEeRPE8VJ7w@archlinux-ax161>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tntwzof3quwqbntb"
Content-Disposition: inline
In-Reply-To: <YUyVZCEeRPE8VJ7w@archlinux-ax161>
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


--tntwzof3quwqbntb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 07:55:32AM -0700, Nathan Chancellor wrote:
> On Thu, Sep 23, 2021 at 04:52:08PM +0200, Maxime Ripard wrote:
> > Hi Nathan,
> >=20
> > On Wed, Sep 22, 2021 at 08:49:50AM -0700, Nathan Chancellor wrote:
> > > On Wed, Sep 22, 2021 at 10:41:56AM +0200, Maxime Ripard wrote:
> > > > Hi Randy,
> > > >=20
> > > > On Sun, Sep 19, 2021 at 09:40:44AM -0700, Randy Dunlap wrote:
> > > > > On 8/19/21 6:59 AM, Maxime Ripard wrote:
> > > > > > We already depend on runtime PM to get the power domains and cl=
ocks for
> > > > > > most of the devices supported by the vc4 driver, so let's just =
select it
> > > > > > to make sure it's there, and remove the ifdef.
> > > > > >=20
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > ---
> > > > > >   drivers/gpu/drm/vc4/Kconfig    | 1 +
> > > > > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
> > > > > >   2 files changed, 1 insertion(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/=
Kconfig
> > > > > > index 118e8a426b1a..f774ab340863 100644
> > > > > > --- a/drivers/gpu/drm/vc4/Kconfig
> > > > > > +++ b/drivers/gpu/drm/vc4/Kconfig
> > > > > > @@ -9,6 +9,7 @@ config DRM_VC4
> > > > > >   	select DRM_KMS_CMA_HELPER
> > > > > >   	select DRM_GEM_CMA_HELPER
> > > > > >   	select DRM_PANEL_BRIDGE
> > > > > > +	select PM
> > > > > >   	select SND_PCM
> > > > > >   	select SND_PCM_ELD
> > > > > >   	select SND_SOC_GENERIC_DMAENGINE_PCM
> > > > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/v=
c4/vc4_hdmi.c
> > > > > > index c2876731ee2d..602203b2d8e1 100644
> > > > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > > @@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct=
 vc4_hdmi *vc4_hdmi)
> > > > > >   	return 0;
> > > > > >   }
> > > > > > -#ifdef CONFIG_PM
> > > > > >   static int vc4_hdmi_runtime_suspend(struct device *dev)
> > > > > >   {
> > > > > >   	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
> > > > > > @@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct=
 device *dev)
> > > > > >   	return 0;
> > > > > >   }
> > > > > > -#endif
> > > > > >   static int vc4_hdmi_bind(struct device *dev, struct device *m=
aster, void *data)
> > > > > >   {
> > > > > >=20
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > FYI.
> > > > >=20
> > > > > This still causes a build error on arch/openrisc/ since it does n=
ot support
> > > > > CONFIG_PM (it does not source "kernel/power/Kconfig" like some ot=
her arches do):
> > > > >=20
> > > > > ./arch/riscv/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/x86/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/nds32/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/sh/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/arc/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/arm64/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/xtensa/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/sparc/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/arm/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/mips/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/powerpc/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/um/Kconfig:source "kernel/power/Kconfig"
> > > > > ./arch/ia64/Kconfig:source "kernel/power/Kconfig"
> > > > >=20
> > > > > so with
> > > > > CONFIG_DRM_VC4=3Dy
> > > > > # CONFIG_DRM_VC4_HDMI_CEC is not set
> > > > >=20
> > > > > I still see
> > > > > ../drivers/gpu/drm/vc4/vc4_hdmi.c:2139:12: warning: 'vc4_hdmi_run=
time_suspend' defined but not used [-Wunused-function]
> > > > >  2139 | static int vc4_hdmi_runtime_suspend(struct device *dev)
> > > > >       |            ^~~~~~~~~~~~~~~~~~~~~~~~
> > > >=20
> > > > With what version did you get that build error? -rc2 shouldn't have=
 it
> > > > anymore since the runtime_pm hooks introduction got reverted.
> > >=20
> > > -next still contains these patches as Stephen effectively reverted the
> > > changes in Linus' tree when merging in the drm-misc-fixes tree:
> > >=20
> > > https://lore.kernel.org/r/20210920090729.19458953@canb.auug.org.au/
> >=20
> > Ah, indeed, thanks.
> >=20
> > What's the typical fix for these errors?
> >=20
> > I guess adding a depends on ARM || ARM64 || COMPILE_TEST would work?
>=20
> I think the typical fix from most people is marking these functions as
> __maybe_unused so that they are always defined but the compiler does not
> warn. An alternative would be changing the "select PM" to be
> "depends on PM" I believe but that is less frequent.

Thanks for the suggestion. Since those functions are always going to be
used anyway (but on COMPILE_TEST), I've chosen the opposite approach of
dropping SET_RUNTIME_PM_OPS instead. You're in CC of that patch so feel
free to comment there if you think this is wrong.

Maxime

--tntwzof3quwqbntb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUykOwAKCRDj7w1vZxhR
xXGgAQD3EAxhXlcx5HvILvemGEJLCfFbdWysU0UD8yhxeV+FUAD+P80ZrQ0TxB7l
QIeyGdWHroAgFhg8vd9TlLujD8BiSgI=
=ZsrP
-----END PGP SIGNATURE-----

--tntwzof3quwqbntb--
