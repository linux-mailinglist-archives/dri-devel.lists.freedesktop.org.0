Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836D42C2B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA06EA3D;
	Wed, 13 Oct 2021 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7846EA27;
 Wed, 13 Oct 2021 14:16:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EFE4580693;
 Wed, 13 Oct 2021 10:16:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 13 Oct 2021 10:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rGNU8kUNWf7tAnmnlNM2GITTDVA
 GlhsbYEpSWnytylk=; b=BVPqeKTkvAtWIQoRe2eSalP7zJRo/c68m9s3z16Zfqc
 nn2Rnfo+w+6k3PzVho1ftDBv2ds4RFbIglm3+t47r7J90w11TqUk/OxGLYNm85Gg
 BdLq1lZlJTSYGuG9BFNRUOdUbfCai9/BZhlBjPqVblqKAEpN60WSWmwSK8t+s3lh
 riPJRLwYBkKw+j8cEFAmUbjwoIf3FWhDEYFAvJ0xl04gZvrPwqH0lrOF+0LbWj8F
 Xm2kSIA1sPHQGF+H0Cgo/quR0FpcOGN/cnb3KKIjorI9WbBeXoviFs65d7dbcDq9
 LSyCVR2m4/hubErBvPhk5Fn9/cRxzT+UXMl6/oSm6Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rGNU8k
 UNWf7tAnmnlNM2GITTDVAGlhsbYEpSWnytylk=; b=LuQ5gvEGAGY9AFPS1OJ8R8
 6PH5lRPtp7oFk21QzE/+4qPUqskShFmaJxlabtL8IKUGyxjkxkllcIhBs6nuiMZs
 2RoJf/akIMmKZ5kcTXXGVnWoHjKm1bxiI4yNdFa1zxE5zzgCrTp2utAy2BqsiX0N
 zNW1j53byqhxa/yrbVliTVahpFcOqMrT/4a5l8VGLo3MWcVl1cHfuq4O4Q5+qfqj
 P8ycTu5tpv/fGw8yAylyJ+OKk+bn4kJ2dwXnVKS8wwcJYTBaV6VH34Z8aJVLFcHc
 YDMLDg7jz9UHuE5fAqg+vc2buz3FIfs+aUNjZ8685IGiFAo2GN49xiSW4A7yCCSg
 ==
X-ME-Sender: <xms:P-pmYdns-rWvS-4r6xyklkIGU14AVU2a8X46PWxo5g6i8UVbaid1Og>
 <xme:P-pmYY3qo7or-LaQDNj3r0Ky1em9nALLkqD06phYlYjJWX-C6z0qu4JYoQQMsTBre
 jObXWOhODy1pYvVjWQ>
X-ME-Received: <xmr:P-pmYTrk4TPDWI52t0Cqc8mIS_4BvPQJ2WYKpRdyfYvtKVIf4e3TUSllNy3g0wyREPaFmF1pVwEn5tBUjknHO2zWz8u3HlvsYCfHgLvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkefgffekffelgfeukedvhffggeehtedugfekgeeihfefhfehieeukeevffev
 hfefnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgtrghlvggsshdrug
 gvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:P-pmYdm0lQBxSkcxsDnGJq7LCQdLAuBnaJgtAAK_4Fvyv0PhjW42bg>
 <xmx:P-pmYb26iOIzYfale8JdDrWm9VKEfeNVRnzXgLcWxM0dG8YxgeZZSQ>
 <xmx:P-pmYcvsH9lWxXJjCtMV0ppzt9f5o2_TNeqbfNrdfxmLTc1MVTHd7g>
 <xmx:QOpmYaBNUIPJQ_ZlRoLIc31Ei5BVLrlUt7xRfhbvD4fNU7nWbYnKVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 10:16:30 -0400 (EDT)
Date: Wed, 13 Oct 2021 16:16:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Clark <robdclark@gmail.com>, Caleb Connolly <caleb.connolly@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, John Stultz <john.stultz@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,	Sam Ravnborg <sam@ravnborg.org>,
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <20211013141629.qfeqwsyi5yobzjca@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
 <YXiZIuao6wNch7j-D3ZktdSR3_IRAQ3oSeL8sLCCX8lEhwsoWaouE6_eV6C2Zv9r2_dww_Mtal18UBJfc4fz4g==@protonmail.internalid>
 <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
 <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bigl5w3rjallwyk4"
Content-Disposition: inline
In-Reply-To: <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org>
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


--bigl5w3rjallwyk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Caleb,

On Thu, Sep 30, 2021 at 09:20:52PM +0100, Caleb Connolly wrote:
> Hi,
>=20
> On 30/09/2021 20:49, Amit Pundir wrote:
> > On Thu, 30 Sept 2021 at 04:50, Rob Clark <robdclark@gmail.com> wrote:
> > >=20
> > > On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> =
wrote:
> > > >=20
> > > > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org=
> wrote:
> > > > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.o=
rg> wrote:
> > > > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > > The best practice to avoid those issues is to register its fu=
nctions only after
> > > > > > > all its dependencies are live. We also shouldn't wait any lon=
ger than we should
> > > > > > > to play nice with the other components that are waiting for u=
s, so in our case
> > > > > > > that would mean moving the DSI device registration to the bri=
dge probe.
> > > > > > >=20
> > > > > > > I also had a look at all the DSI hosts, and it seems that exy=
nos, kirin and msm
> > > > > > > would be affected by this and wouldn't probe anymore after th=
ose changes.
> > > > > > > Exynos and kirin seems to be simple enough for a mechanical c=
hange (that still
> > > > > > > requires to be tested), but the changes in msm seemed to be f=
ar more important
> > > > > > > and I wasn't confortable doing them.
> > > > > >=20
> > > > > >=20
> > > > > > Hey Maxime,
> > > > > >    Sorry for taking so long to get to this, but now that plumbe=
rs is
> > > > > > over I've had a chance to check it out on kirin
> > > > > >=20
> > > > > > Rob Clark pointed me to his branch with some fixups here:
> > > > > >     https://gitlab.freedesktop.org/robclark/msm/-/commits/for-m=
ripard/bridge-rework
> > > > > >=20
> > > > > > But trying to boot hikey with that, I see the following loop in=
definitely:
> > > > > > [    4.632132] adv7511 2-0039: supply avdd not found, using dum=
my regulator
> > > > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dum=
my regulator
> > > > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dum=
my regulator
> > > > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using du=
mmy regulator
> > > > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dum=
my regulator
> > > > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dum=
my regulator
> > > > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > > > >=20
> > > > > I just realized Rob's tree is missing the kirin patch. My apologi=
es!
> > > > > I'll retest and let you know.
> > > >=20
> > > > Ok, just retested including the kirin patch and unfortunately I'm
> > > > still seeing the same thing.  :(
> > > >=20
> > > > Will dig a bit and let you know when I find more.
> > >=20
> > > Did you have a chance to test it on anything using drm/msm with DSI
> > > panels?  That would at least confirm that I didn't miss anything in
> > > the drm/msm patch to swap the dsi-host vs bridge ordering..
> >=20
> > Hi, smoke tested
> > https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridg=
e-rework
> > on Pocophone F1 (sdm845 / A630) with v5.15-rc3. I see no obvious
> > regressions in my limited testing so far including video (youtube)
> > playback.
> Tested on the OnePlus 6 too booting AOSP, works fine. This *fixes*
> FBDEV_EMULATION (so we can get a working framebuffer console) which was
> otherwise broken on 5.15.
>=20
> However it spits out some warnings during boot: https://p.calebs.dev/gucy=
sowyna.yaml

Thanks for testing. It looks like the runtime_pm ordering between the
msm devices changed a bit with the conversion Rob did.

Rob, do you know what could be going on?

Thanks!
Maxime

--bigl5w3rjallwyk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWbqPQAKCRDj7w1vZxhR
xdOTAQDjb3huzaE7pHvCyz07hJC57832ndc9T6cZOvvFbklnIQD7BQXSVG/1e0Hb
rq4X+WgysJ3GbuqAFdQEOjb839HmzAE=
=KNRT
-----END PGP SIGNATURE-----

--bigl5w3rjallwyk4--
