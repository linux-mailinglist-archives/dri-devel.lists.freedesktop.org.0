Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82012431938
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D868A6EA38;
	Mon, 18 Oct 2021 12:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5806EA34;
 Mon, 18 Oct 2021 12:35:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D747580B31;
 Mon, 18 Oct 2021 08:34:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 18 Oct 2021 08:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JDzR27XjpWVhhT/HjvP8lcBn6jm
 H4lkGCuYgmDjihJ4=; b=lP2VOyWu1ebz/g4Gnn5VQRD5s0QN5vqebY4j2zGaQWZ
 WxirDaLuYdegvSCbYQcWpbMgk2kt1mVFHBAC/CQuYAeZ9t4/zHxVBb19F84NUl16
 rbAtFfmiHj4LoAeakBomh2yxd90TWjRzQkI0PAwkYhuuc3KWvh7Z/wqwSWiu6ynr
 eGDU/62Xstk31q+Mqb3+VyX8SZc6MWh1bGeiLPFFKZcQxdrUgjoX8Aa1DJgsz7+O
 JDpK72hPLV4P2C157FYmY4NG1xx/IZFhR+5v4SzbR27efC5VRMV8VOyc/VBf7Oaj
 riXMnJsWzK13n2hQdvbZ6iRyKpOJTml2B+rDq2ez36g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JDzR27
 XjpWVhhT/HjvP8lcBn6jmH4lkGCuYgmDjihJ4=; b=WaqXf6aMKIlHL32mvYybKc
 LHhkGBjGWj7hpFnq+KEqeKoT05o7i4KbxIMSDrHMPqp/rPTPou375bf0kL0v3XTY
 6EVJAgIQEgKuWF8wsUE0WVQXSKFRWlkhJc0ZFbJEqv01FtGaSCGjrDd5y+ngwCvf
 O1PGzqpMwtUFOwnCS2shCTx2POqnUlLNLg83hexSxk5DtSSfFr1AwehNlEb9oCdj
 QSh0zhI72ScS+c35p76dxsJzZ0n7HNcz2d9u6DNZcREGNtgW11Ut9/LVihoNS4UU
 YSUNXMkNDmcIwHTXl3ZWsxji1ULGBauRF3VvTHfegx3qzM6i1hBMoSFICkwET/JQ
 ==
X-ME-Sender: <xms:72ltYfGZfkfbWLlDXmlo5-6NjGjaTB8FKcsz-iH5q3UdKbj_aREffg>
 <xme:72ltYcUtWF9kC4L5E93weNuRO9k73Z_HLfvrNZOwcaBTktE4md2HNEIhajFHcroL8
 DIQkImIIaC85S_TwAk>
X-ME-Received: <xmr:72ltYRLTptB_8B4nt9k0YGuSZOLfSzPKhFJh5EYsWDWRebxemxedsSotrZy9S69YF6-2eRDxuQdbzqELk7F29nHdedj7yUeDR0Wju9ak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkefgffekffelgfeukedvhffggeehtedugfekgeeihfefhfehieeukeevffev
 hfefnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgtrghlvggsshdrug
 gvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:72ltYdF2JS4fmhrgUht9RogaVJ0XPeydDW9pm8WTFX0qukFuPQgvKw>
 <xmx:72ltYVUho1H9PzUdDxtphBo4cAuil-eA0H3dV2AlIQc9MKPZ3CotuA>
 <xmx:72ltYYMrqkOpAYz8dTqliKzZzTGe5iUrB2UC8utlt7YbD1XNFoOzDw>
 <xmx:8WltYfhd9w57PWI7uceJqjcF6Tb3QT_hFL4q6wvZNey02HS6q4Pp9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 08:34:55 -0400 (EDT)
Date: Mon, 18 Oct 2021 14:34:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Clark <robdclark@gmail.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>, John Stultz <john.stultz@linaro.org>,
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
Subject: Re: [Freedreno] [PATCH v4 00/24] drm/bridge: Make panel and bridge
 probe order consistent
Message-ID: <20211018123452.efwx5varmxihsv6n@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
 <YXiZIuao6wNch7j-D3ZktdSR3_IRAQ3oSeL8sLCCX8lEhwsoWaouE6_eV6C2Zv9r2_dww_Mtal18UBJfc4fz4g==@protonmail.internalid>
 <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
 <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org>
 <20211013141629.qfeqwsyi5yobzjca@gilmour>
 <CAF6AEGu2CyQA6XZ=r4c9Z0tiiPUxyhTf0OAu3v6w0oswJ3567w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c73vrvulwt5myj34"
Content-Disposition: inline
In-Reply-To: <CAF6AEGu2CyQA6XZ=r4c9Z0tiiPUxyhTf0OAu3v6w0oswJ3567w@mail.gmail.com>
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


--c73vrvulwt5myj34
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Oct 13, 2021 at 05:16:58PM -0700, Rob Clark wrote:
> On Wed, Oct 13, 2021 at 7:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Caleb,
> >
> > On Thu, Sep 30, 2021 at 09:20:52PM +0100, Caleb Connolly wrote:
> > > Hi,
> > >
> > > On 30/09/2021 20:49, Amit Pundir wrote:
> > > > On Thu, 30 Sept 2021 at 04:50, Rob Clark <robdclark@gmail.com> wrot=
e:
> > > > >
> > > > > On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.o=
rg> wrote:
> > > > > >
> > > > > > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro=
=2Eorg> wrote:
> > > > > > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@lina=
ro.org> wrote:
> > > > > > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno=
=2Etech> wrote:
> > > > > > > > > The best practice to avoid those issues is to register it=
s functions only after
> > > > > > > > > all its dependencies are live. We also shouldn't wait any=
 longer than we should
> > > > > > > > > to play nice with the other components that are waiting f=
or us, so in our case
> > > > > > > > > that would mean moving the DSI device registration to the=
 bridge probe.
> > > > > > > > >
> > > > > > > > > I also had a look at all the DSI hosts, and it seems that=
 exynos, kirin and msm
> > > > > > > > > would be affected by this and wouldn't probe anymore afte=
r those changes.
> > > > > > > > > Exynos and kirin seems to be simple enough for a mechanic=
al change (that still
> > > > > > > > > requires to be tested), but the changes in msm seemed to =
be far more important
> > > > > > > > > and I wasn't confortable doing them.
> > > > > > > >
> > > > > > > >
> > > > > > > > Hey Maxime,
> > > > > > > >    Sorry for taking so long to get to this, but now that pl=
umbers is
> > > > > > > > over I've had a chance to check it out on kirin
> > > > > > > >
> > > > > > > > Rob Clark pointed me to his branch with some fixups here:
> > > > > > > >     https://gitlab.freedesktop.org/robclark/msm/-/commits/f=
or-mripard/bridge-rework
> > > > > > > >
> > > > > > > > But trying to boot hikey with that, I see the following loo=
p indefinitely:
> > > > > > > > [    4.632132] adv7511 2-0039: supply avdd not found, using=
 dummy regulator
> > > > > > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using=
 dummy regulator
> > > > > > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using=
 dummy regulator
> > > > > > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, usin=
g dummy regulator
> > > > > > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using=
 dummy regulator
> > > > > > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using=
 dummy regulator
> > > > > > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > > > > > >
> > > > > > > I just realized Rob's tree is missing the kirin patch. My apo=
logies!
> > > > > > > I'll retest and let you know.
> > > > > >
> > > > > > Ok, just retested including the kirin patch and unfortunately I=
'm
> > > > > > still seeing the same thing.  :(
> > > > > >
> > > > > > Will dig a bit and let you know when I find more.
> > > > >
> > > > > Did you have a chance to test it on anything using drm/msm with D=
SI
> > > > > panels?  That would at least confirm that I didn't miss anything =
in
> > > > > the drm/msm patch to swap the dsi-host vs bridge ordering..
> > > >
> > > > Hi, smoke tested
> > > > https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/b=
ridge-rework
> > > > on Pocophone F1 (sdm845 / A630) with v5.15-rc3. I see no obvious
> > > > regressions in my limited testing so far including video (youtube)
> > > > playback.
> > > Tested on the OnePlus 6 too booting AOSP, works fine. This *fixes*
> > > FBDEV_EMULATION (so we can get a working framebuffer console) which w=
as
> > > otherwise broken on 5.15.
> > >
> > > However it spits out some warnings during boot: https://p.calebs.dev/=
gucysowyna.yaml
> >
> > Thanks for testing. It looks like the runtime_pm ordering between the
> > msm devices changed a bit with the conversion Rob did.
> >
> > Rob, do you know what could be going on?
> >
>=20
> Not entirely sure.. I didn't see that first splat, but maybe I was
> missing some debug config? (The 2nd one is kind of "normal", I think
> related to bootloader leaving the display on)

So do you feel like this is a blocker or do you expect it to be fixed
sometime down the road?

Maxime

--c73vrvulwt5myj34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW1p7AAKCRDj7w1vZxhR
xfplAP4yJr2s6Y5qrWgoFIp1L95G4i4FWj0MWRxHMozE1tgeIgD/U5MlG7xXCrPy
t96IzznNLtX+n7ec3+WzQhPM3z4qCA4=
=l5hK
-----END PGP SIGNATURE-----

--c73vrvulwt5myj34--
