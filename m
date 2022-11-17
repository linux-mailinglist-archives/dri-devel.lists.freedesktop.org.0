Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8F62DE41
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC70891AA;
	Thu, 17 Nov 2022 14:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E2891AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:34:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id F16782B0685E;
 Thu, 17 Nov 2022 09:34:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 09:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668695655; x=1668702855; bh=nUJ/68XYQc
 hyC85sPsTZstrCF4bOW8LM93JLafCDBQg=; b=DmqfMboiHJ9zfijU528f52cu4T
 p6jcmpe6l7IAsB8XykvqqOv/7ygXYfajc11t1M/3xXsqC7LCziboFJDEdYCXM8nW
 QpT0Q7HubQiqpzS28dZ5z6mzaaX4Vb13Bcq8FHtSCBc8HFMALUMv62kw2ADtIbxT
 ehTEL682yCtHj8Zv79UHYspKSBzRiahOI68QSSuNMnUliKxizOMqA5LT0yr+TSne
 wCbO0vO5X5Kr5O1tsKbZasG8qPCIz1Ll/cWgC3rdmHKXWqc2YzbV9rjyibCL6/ap
 OHzAmjb88IzKiNO59Et2WkRcNRQdCQR1p2u7e0BGhvz3BE22wIKpX3mlX1ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668695655; x=1668702855; bh=nUJ/68XYQchyC85sPsTZstrCF4bO
 W8LM93JLafCDBQg=; b=grRAN3ZIEToypimLQqUb6UCC7FlgECzNmEQTkg6SXD72
 W6q2T2XW9HTqkOd1j0t52A96M/UqPKG/AzZLgO2cVe8903nQW09dBM38emyuQkew
 aW7H3TxJ14C9rq7WI7e5AmJhn0IZDxIU7lV6zZY3zBCQlZWtMyZuXKFAU+HJufOa
 WM+UZngFpaGlH40o+gYgU0K15XAYRgDa6jQ+ycYHPIMtYiQk7shO06hiQOb0y1FB
 oWSYPH+xfGNCmoTsmP0YP9SezUGFNecs3xNPnV3FztacBOvPMVuyF7FclBiESeU7
 DNsv2JHlcQ26f+GshpLCNvAwfFIMUlUOisTO5u5/Hw==
X-ME-Sender: <xms:ZUZ2Y2cI-RBYE-0rm6ELwo5UameNzRK52XLu0k0w8PgBTBwEE1XOKg>
 <xme:ZUZ2YwM6f1C8AgXAcAZp9fRjJNHDyXmminFh6PGOLtscOi3zg84T7xI78et1T0l2s
 KgKpLZcTraT3zwPCE4>
X-ME-Received: <xmr:ZUZ2Y3i9bqCyoaT0vhe6d0SLtfPmbIrFditcb-E53C_AP0d_LVOt9dgbOVePR1nf40Q-aeuUK-byHgsmj1NLidTEM_KHRo1FAi7qj7q_PGa35Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeuuedtfefgveevheejfeeghedvjeejfeehkeffudetuedtgfeiieeiffeu
 tdffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:ZUZ2Yz_o48xk-OdbKP5QG3LOy2O2xabEoE7bLmKOorwUri-gBLdkWg>
 <xmx:ZUZ2YytBCvjYcMUCwHvuEH_gK1HVeapJyutNOZJkOKcWYZPMJX8PQg>
 <xmx:ZUZ2Y6H9dLEVzDltgmEo5E-ICjQE_LKUw9mMmeLQzFxh3fPpP6oV7w>
 <xmx:Z0Z2Y-v3S35dRuGErOr41IdaqLevbM_JHbrjqnWgAY5ABdC6ljyeAzBytDE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 09:34:13 -0500 (EST)
Date: Thu, 17 Nov 2022 15:34:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Message-ID: <20221117143411.5sdyrx6v2nunql5n@houat>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <YtXIEg0rRZLLYS75@ravnborg.org>
 <CAPY8ntCfXuZ6nPcJ77FLP5bgdcbXOeh-7rieb5PS-7oPFg7xnQ@mail.gmail.com>
 <0c472bfe-8faa-32b4-fe6e-c52a4cb74681@linaro.org>
 <CAPY8ntCN1YA6cRB80M_Dx9ZyxdRPhpdxZVPnkXmtzQG-gLyq7Q@mail.gmail.com>
 <b2115a41-c8cc-7b06-b9c8-95e5cc3545a3@linaro.org>
 <CAPY8ntB8d6VsgjBw7fQwf3gmQboS7tHCjLsofMwKAfUECgi08Q@mail.gmail.com>
 <30d38d02-29e2-f953-4202-9cea54327e98@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nsqxph43nnb6aln6"
Content-Disposition: inline
In-Reply-To: <30d38d02-29e2-f953-4202-9cea54327e98@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, andrzej.hajda@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nsqxph43nnb6aln6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 03:24:07PM +0200, Dmitry Baryshkov wrote:
> On 15/11/2022 17:38, Dave Stevenson wrote:
> > Hi Dmitry
> >=20
> > On Tue, 15 Nov 2022 at 14:21, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >=20
> > > On 15/11/2022 17:14, Dave Stevenson wrote:
> > > > Hi Dmitry
> > > >=20
> > > > On Sun, 13 Nov 2022 at 13:06, Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >=20
> > > > > Hi Dave,
> > > > >=20
> > > > > On 19/07/2022 16:45, Dave Stevenson wrote:
> > > > > > Hi Sam
> > > > > >=20
> > > > > > On Mon, 18 Jul 2022 at 21:52, Sam Ravnborg <sam@ravnborg.org> w=
rote:
> > > > > > >=20
> > > > > > > Hi Dave,
> > > > > > >=20
> > > > > > > a long overdue reply on this series.
> > > > > > >=20
> > > > > > > On Fri, Mar 04, 2022 at 03:17:55PM +0000, Dave Stevenson wrot=
e:
> > > > > > > > Hi All
> > > > > > > >=20
> > > > > > > > Changes from v1:
> > > > > > > > - New patch to refactor drm_bridge_chain_post_disable and d=
rm_bridge_chain_pre_enable
> > > > > > > >      to reuse drm_atomic_bridge_chain_post_disable / drm_at=
omic_bridge_chain_pre_enable
> > > > > > > >      but with a NULL state.
> > > > > > > > - New patch that adds a pre_enable_upstream_first to drm_pa=
nel.
> > > > > > > > - changed from an OPS flag to a bool "pre_enable_upstream_f=
irst" in drm_bridge.
> > > > > > > > - Followed Andrzej's suggestion of using continue in the ma=
in loop to avoid
> > > > > > > >      needing 2 additional loops (one forward to find the la=
st bridge wanting
> > > > > > > >      upstream first, and the second backwards again).
> > > > > > > > - Actioned Laurent's review comments on docs patch.
> > > > > > > >=20
> > > > > > > > Original cover letter:
> > > > > > > >=20
> > > > > > > > Hopefully I've cc'ed all those that have bashed this proble=
m around previously,
> > > > > > > > or are otherwise linked to DRM bridges.
> > > > > > > >=20
> > > > > > > > There have been numerous discussions around how DSI support=
 is currently broken
> > > > > > > > as it doesn't support initialising the PHY to LP-11 and pot=
entially the clock
> > > > > > > > lane to HS prior to configuring the DSI peripheral. There i=
s no op where the
> > > > > > > > interface is initialised but HS video isn't also being sent.
> > > > > > > > Currently you have:
> > > > > > > > - peripheral pre_enable (host not initialised yet)
> > > > > > > > - host pre_enable
> > > > > > > > - encoder enable
> > > > > > > > - host enable
> > > > > > > > - peripheral enable (video already running)
> > > > > > > >=20
> > > > > > > > vc4 and exynos currently implement the DSI host as an encod=
er, and split the
> > > > > > > > bridge_chain. This fails if you want to switch to being a b=
ridge and/or use
> > > > > > > > atomic calls as the state of all the elements split off are=
 not added by
> > > > > > > > drm_atomic_add_encoder_bridges.
> > > > > > >=20
> > > > > > > A typically chain looks like this:
> > > > > > >=20
> > > > > > > CRTC =3D> Encoder =3D> Bridge A =3D> Bridge B
> > > > > > >=20
> > > > > > > We have in DRM bridges established what is the "next" bridge =
- indicated
> > > > > > > with the direction of the arrows in the drawing.
> > > > > > >=20
> > > > > > > This set of patches introduces the concept of "upstream" brid=
ges.
> > > > > > >=20
> > > > > > > pre_enable_prev_bridge_first would be easier to understand as=
 it uses
> > > > > > > the current terminology.
> > > > > > > I get that "upstream" is used in the DSI specification - but =
we are
> > > > > > > dealing with bridges that happens to support DSI and more, an=
d mixing
> > > > > > > the two terminologies is not good.
> > > > > > >=20
> > > > > > > Note: Upstream is also used in a bridge doc section - here it=
 should
> > > > > > >          most likely be updated too.
> > > > > >=20
> > > > > > Sure, I have no issues with switching to prev/next from upstrea=
m/downstream.
> > > > > > To the outsider it can be confusing - in pre_enable and disable=
, the
> > > > > > next bridge to be called is the previous one. At least it is
> > > > > > documented.
> > > > > >=20
> > > > > > > The current approach set a flag that magically makes the core=
 do something
> > > > > > > else. Have you considered a much more explicit approach?
> > > > > > >=20
> > > > > > > A few helpers like:
> > > > > > >=20
> > > > > > >            drm_bridge_pre_enable_prev_bridge()
> > > > > > >            drm_bridge_enable_prev_bridge()
> > > > > > >            drm_bridge_disable_prev_bridge()
> > > > > > >            drm_bridge_post_disable_prev_bridge()
> > > > > >=20
> > > > > > No point in drm_bridge_enable_prev_bridge() and
> > > > > > drm_bridge_post_disable_prev_bridge() as the call order down th=
e chain
> > > > > > will mean that they have already been called.
> > > > > > drm_bridge_enable_next_bridge() and
> > > > > > drm_bridge_post_disable_next_bridge() possibly.
> > > > > >=20
> > > > > > > And then update the core so the relevant function is only cal=
led once
> > > > > > > for a bridge.
> > > > > > > Then the need for DSI lanes in LP-11 can be archived by a cal=
l to
> > > > > > >=20
> > > > > > >            drm_bridge_pre_enable_prev_bridge()
> > > > > >=20
> > > > > > Unfortunately it gets ugly with post_disable.
> > > > > > The DSI host controller post_disable will have been called befo=
re the
> > > > > > DSI peripheral's post_disable, and there are conditions where t=
he
> > > > > > peripheral needs to send DSI commands in post_disable (eg
> > > > > > panel-asus-z00t-tm5p5-n35596 [1]). Changing all DSI hosts to ca=
ll
> > > > > > drm_bridge_post_disable_next_bridge feels like the wrong thing =
to do.
> > > > > > There are currently hacks in dw-mipi-dsi that do call the next
> > > > > > panel/bridge post_disable [2] and it would be nice to get rid o=
f them.
> > > > > > Currently the calls aren't tracked for state, so you end up with
> > > > > > post_disable being called twice, and panels having to track sta=
te (eg
> > > > > > jdi_lt070me050000 [3]).
> > > > > >=20
> > > > > > [1] tm5p5_nt35596_unprepare() calls tm5p5_nt35596_off()
> > > > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/=
panel/panel-asus-z00t-tm5p5-n35596.c#L107
> > > > > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c#L889
> > > > > > [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/=
drm/panel/panel-jdi-lt070me05000.c#L44
> > > > > >=20
> > > > > > > This is more explicit than a flag that triggers some magic be=
haviour.
> > > > > > > It may even see uses we have not realised yet.
> > > > > >=20
> > > > > > Personally it feels like more boilerplate in almost all DSI dri=
vers,
> > > > > > and generally I see a push to remove boilerplate.
> > > > > >=20
> > > > > > > It is late here - so maybe the above is not a good idea tomor=
row - but
> > > > > > > right now I like the simplicity of it.
> > > > > > >=20
> > > > > > > Other than the above I read that a mipi_dsi_host_init() is pl=
anned,
> > > > > > > which is also explicit and simple - good.
> > > > > >=20
> > > > > > It's been raised, but the justification for most use cases hasn=
't been
> > > > > > made. The Exynos conversion looks to be doing the wrong thing in
> > > > > > checking state, and that's why it is currently needing it.
> > > > > > Again it's also more boilerplate.
> > > > > >=20
> > > > > > TC358767 is an odd one as it wants the DSI interface enabled ve=
ry
> > > > > > early in order to have a clock for the DP aux channel well befo=
re
> > > > > > video is running. I had a thought on that, but It looks like I =
haven't
> > > > > > hit send on a reply to Lucas on that one - too many distraction=
s.
> > > > > >=20
> > > > > > > Have we seen a new revision of some of these?
> > > > > > > Chances are high that I have missed it then.
> > > > > >=20
> > > > > > No, still on V2. Other than Dmitry's comment over updating
> > > > > > parade-ps8640 and dropping drm_bridge_chain_*, no real comments=
 had
> > > > > > been made.
> > > > >=20
> > > > > It's been a while now. Do you still plan to pursue this patchset?
> > > >=20
> > > > If there was anything that could actually be worked on, then I'm ha=
ppy
> > > > to respin it, but if the approach is generally being rejected then I
> > > > don't want to waste the effort.
> > > >=20
> > > > I'm not totally clear who the maintainers are that the final arbite=
rs
> > > > and need to sign off on this.
> > > > drm_bridge.c falls to Maarten, Maxime, and Thomas for "DRM DRIVERS =
AND
> > > > MISC GPU PATCHES"
> > > > drm_panel.c falls to Thierry and Sam for "DRM PANEL DRIVERS", and t=
hen
> > > > Maarten, Maxime, and Thomas.
> > > > Only Sam has responded publicly. I have had discussions with Maxime,
> > > > but it's not directly his area of knowledge.
> > > >=20
> > > > Looking at the patch series:
> > > > Patch 1: Your comment "update parade-ps8640 to use
> > > > drm_atomic_bridge_chain_". It looks like patchset [1] by Sam does
> > > > this, but the patchset went wrong and is missing patches 8-11 and
> > > > therefore hasn't been merged.
> > > > Patch 2: Comment from Jagan that it's like an old patch. It has
> > > > similarities, but isn't the same.
> > > > Patch 3: R-b by you (thank you), but concerns from Jagan which I st=
ill
> > > > don't understand. Without clarification on the issue and whether my
> > > > suggested alternative place for the hook solves the issue, IMHO it's
> > > > not worth respinning.
> > > > Patch 4: R-b Laurent.
> > > >=20
> > > > This cover note got totally subverted with Exynos issues.
> > > > Sam did request use of prev / next instead of upstream / downstream,
> > > > which can be done and perhaps warrants a respin now.
> > > >=20
> > > > > [personal notice: I'd prefer something less strange, e.g. an expl=
icit
> > > > > calls to mipi_dsi_host, but as this patchset seems to fix the iss=
ues,
> > > > > I'm fine with it].
> > > >=20
> > > > That can fix the power up sequence, but how do you propose telling =
the
> > > > DSI controller NOT to power down in post_disable before the DSI
> > > > peripheral post_disable has potentially sent DCS commands - i.e. the
> > > > case you were discussing on Friday in [2].
> > >=20
> > > I thought that the same 'call the parent beforehand' switch applied to
> > > the deinit paths, didn't it?
> >=20
> > My proposed flag does indeed swap the order of post_disable as well.
> >=20
> > Perhaps I was misunderstanding your personal preference.
> > I was taking it as an explicit mipi_dsi_host call to initialise the
> > DSI link, which then also needs an explicit mipi_dsi_host call to tear
> > it down as well. In that situation there is a need to rework the
> > bridge chain post_disable to allow for the panel post_disable to send
> > DCS commands before the DSI host is disabled.
> >=20
> > > > If a panel/bridge driver doesn't call mipi_dsi_host_init then the
> > > > expectation must be that it will be called by the DSI controller's
> > > > pre_enable, and deinit from post_disable. Likewise init & deinit wo=
uld
> > > > be called if host_transfer is used when the host isn't initialised.
> > > >=20
> > > > If the panel/bridge driver explicitly calls mipi_dsi_host_init, then
> > > > does that mandate that it must also call mipi_dsi_host_deinint. The
> > > > controller post_disable is then effectively a no-op. This can be
> > > > covered in documentation, but also leaves the potential for strange
> > > > behaviour if the requirement is not followed, and I can't think of a
> > > > nice place to drop a WARN to flag the issue in the driver.
> > > >=20
> > > >=20
> > > > TBH The lack of interest in solving the issues almost makes me want=
 to
> > > > just document the total brokenness of it and throw in the towel.
> > > > Seeing as we as Raspberry Pi run a vendor kernel, we can run with
> > > > downstream patches until those who care finally make a decision for
> > > > mainline. I'd prefer to solve it properly, but it requires some
> > > > engagement from the community.
> > >=20
> > > I see. I can probably try spinning a patchset doing explicit mipi_dsi
> > > calls. Let's see if it gains more attention.
> >=20
> > Is it better to have 2 competing patchsets floating around, or try and
> > get responses on one first? I'll try and get an updated set out today.
>=20
> I'm a bit in a tough position here. I can't say that I like this approach,
> but it seems to fix all the issues that we have with DSI hosts, so it's
> better than the current state.

I'd say the bridge support in general is under-maintained. Historically,
Boris and Laurent did most of the architecture work, but are either
completely drowning under patches or have moved on.

I can't really speak for Thomas and Maarten, but I don't really have
such a good knowledge about the bridge infrastructure and haven't been
very involved. I have the same impression from Maarten and Thomas
though.

Which means that it's pretty much a blindspot for us :)

I'm sorry if it's taking a while, but I'd say that if you two have a
good comprehension of the issue (and I know Dave has), if you can reach
a reasonable solution for both of you, and if there is proper
documentation for the new work, I'd consider this a net improvement.

And as far as I know from that discussion, we're pretty much there
already. So yeah, go ahead with a new version and we'll merge it.

Maxime

--nsqxph43nnb6aln6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3ZGUgAKCRDj7w1vZxhR
xW5AAP0ecJBgSmywXEJSEh14mwhRb7WXaYfDB2QxUxspOePI9QEA1wyTm++Q3FOv
fTXFMM1Yuh0cJFPZf1Wj30W2g5WEvAY=
=Y3We
-----END PGP SIGNATURE-----

--nsqxph43nnb6aln6--
