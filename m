Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6AA0B13C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BA610E5AB;
	Mon, 13 Jan 2025 08:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cerno.tech header.i=@cerno.tech header.b="bTsUY1Gu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gQNGfOpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 08:36:13 UTC
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF5610E5AB;
 Mon, 13 Jan 2025 08:36:13 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 39B8C1140114;
 Mon, 13 Jan 2025 03:28:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 13 Jan 2025 03:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1736756920; x=1736843320; bh=aANzRSa1gX
 9XEj7t8jNDcx7FMiv+IXThzChVsMpMENs=; b=bTsUY1Gui1djb7MmL9m8begVMe
 u3fkqewDupGakd6pGCw/7vbyZ3fJRORRKHhnovqWJrOcEbaYGSMuCNAYWny+ZY9B
 CnBg7LfUTOGL7hAc7ItLWjlnYt584Pm6HVU0FEo8RAB9eY1S1gsjOTRQtacF/cIt
 BPyKYqS2W28gIVPVPEyJS34wKBdw5vQ9gGZI6Z8dX4InJ8GCycUWcG3yMlPYSs4P
 whKnKpFsIGj9IrXwAuyIP6M8+F3LYdV+6v82cKIf7F9w4REpiDu58HkfEwcziBtU
 5KxyIeo8k5vOpDoVF+vd4Nc7mnxxR3O4fe/kwYBvHB14a/TVzbCAKdL7GsjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1736756920; x=1736843320; bh=aANzRSa1gX9XEj7t8jNDcx7FMiv+IXThzCh
 VsMpMENs=; b=gQNGfOpPNiEwk4aMhD8uepdVfDpfPMRD1aJkFMH0gEfy8zv8+Mh
 HQEVRw1Sbos81rc6lalW+R+eaS+Cm9QOAcFV/MT+TxLCt5atyjB5jA1VBaUL3iob
 u/htHcQ4OyS/F/7yux40/9rJeQNPngcCd7sClHSnKnLCWTbzhkCJc6t/yspg9XFx
 aL9b6zoTu05wpAZPe7Id2r+farzDK7AHDN5pHIZqVFowJBfLX/9oLLnWgm4vMz9E
 qPft0duqhOhLBtH5yE9JndLRLxz/9zpjcGjg1oCSugAQaxNOQxfJFGY/QGfUsc3u
 W8iBcNa3f/58IzKeh2B7atPEJLtFKhKBQ1Q==
X-ME-Sender: <xms:t86EZ48YF0YGeE6mHQPIC2_WIc0rS8qWBVR08_B_dLytB9K7ASZv6A>
 <xme:t86EZwsLsIX21oAg9T_I10AyXyYHGl8W_EtHwdYeTSDmyDVnm3PAaONa1tQxmqKkU
 8zRSiJJglsRgm0pJ_s>
X-ME-Received: <xmr:t86EZ-DtZMXK4sWZzRT4g4987jstJz9FcYVu4lbYzw5QIo7j7dKQqS2iTLPz4_KVSvrbWajNPmz6I8PiivA9ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeen
 ucfhrhhomhepfdhmrgigihhmvgestggvrhhnohdrthgvtghhfdcuoehmrgigihhmvgestg
 gvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpedvveetvdefveefgeetvdefheeh
 leeuieevgeffveeggfekjeehhfeukeetveffleenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhpdhn
 sggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmih
 htrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopehjrghs
 ohhnqdhjhhdrlhhinhesmhgvughirghtvghkrdgtohhmpdhrtghpthhtoheplhhinhhugi
 dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
 htohepmhhitghhvghlsegurggvnhiivghrrdhnvghtpdhrtghpthhtohepihhnthgvlhdq
 ghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegthh
 hunhhkuhgrnhhgrdhhuheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
 rghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhkih
 htrgdrlhhiphhskhhisegrmhgurdgtohhm
X-ME-Proxy: <xmx:t86EZ4f0E4lU_s6PK14VVo7HTmA_PXrJthS42OOtgCma2HvcQn3oqg>
 <xmx:t86EZ9Mr6AWfGT-_UlTWIvg6PdeMENMyi_Mp7MhclybWssdWVOiWuw>
 <xmx:t86EZynXpPx39ibkCic5KltVNs9YgvOe7x0doRHHPrIbYwsWy93kVQ>
 <xmx:t86EZ_sD6AUFCHLe02dGR9w9zSgDhg_IkL3xtV_tM6sjQMYGyG5uPA>
 <xmx:uM6EZ_VJg7fxfu7F7ghi-5BgpzfQ8k21lr1gB6FXaWCuPLTLhG_tkN5R>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 03:28:38 -0500 (EST)
Date: Mon, 13 Jan 2025 09:28:36 +0100
From: "maxime@cerno.tech" <maxime@cerno.tech>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20250113-melodic-cuckoo-of-experience-bb6ac7@houat>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
 <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
 <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uney3rx23pf46kpm"
Content-Disposition: inline
In-Reply-To: <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
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


--uney3rx23pf46kpm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
MIME-Version: 1.0

Hi Dmitry,

On Wed, Jan 31, 2024 at 12:28:59PM +0100, Daniel Vetter wrote:
> On Wed, Jan 31, 2024 at 12:26:45PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
> > > > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > > > >
> > > > > External email : Please do not click links or open attachments un=
til
> > > > > you have verified the sender or the content.
> > > > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=
=97=E7=9D=BF=E7=A5=A5) wrote:
> > > > > > Hi Maxime, Daniel,
> > > > > >
> > > > > > We encountered similar issue with mediatek SoCs.
> > > > > >
> > > > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > > disabling
> > > > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > > > drm_atomic_wait_for_vblank() is set to true.
> > > > > > As the result, we are not actually waiting for a vlbank to wait=
 for
> > > > > our
> > > > > > hardware to close the cursor plane. Subsequently, the execution
> > > > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cur=
sor
> > > > > > buffer. This can lead to use-after-free issues with our hardwar=
e.
> > > > > >
> > > > > > Could you please apply this patch to fix our problem?
> > > > > > Or are there any considerations for not applying this patch?
> > > > >
> > > > > Mostly it needs someone to collect a pile of acks/tested-by and t=
hen
> > > > > land
> > > > > it.
> > > > >
> > > >
> > > > Got it. I would add tested-by tag for mediatek SoC.
> > > >
> > > > > I'd be _very_ happy if someone else can take care of that ...
> > > > >
> > > > > There's also the potential issue that it might slow down some of =
the
> > > > > legacy X11 use-cases that really needed a non-blocking cursor, bu=
t I
> > > > > think
> > > > > all the drivers where this matters have switched over to the async
> > > > > plane
> > > > > update stuff meanwhile. So hopefully that's good.
> > > > >
> > > >
> > > > I think all the drivers should have switched to async plane update.
> > > >
> > > > Can we add the checking condition to see if atomic_async_update/che=
ck
> > > > function are implemented?
> > >
> > > Pretty sure not all have done that, so really it boils down to whethe=
r we
> > > break a real user's use-case. Which pretty much can only be checked by
> > > merging the patch (hence the requirement to get as many acks as possi=
ble
> > > from display drivers) and then being willing to handle any fallout th=
at's
> > > reported as regressions for a specific driver.
> > >
> > > It's a pile of work, at least when it goes south, that's why I'm look=
ing
> > > for volunteers.
> >=20
> > I can check this on all sensible msm generations, including mdp4, but
> > it will be next week, after the FOSDEM.
> >=20
> > BTW, for technical reasons one of the msm platforms still has the
> > legacy cursor implementation might it be related?
>=20
> Yeah, msm is one of the drivers I had to change with some hacks to avoid
> really bad fallout. It should still work like before, but that's one that
> definitely needs testing.

Since it looks like you're in a mood to deal with kms reworks vs msm, we
still have this one to address too :)

--uney3rx23pf46kpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4TOrwAKCRAnX84Zoj2+
dsAVAYC8pHWQz2czV4686DhvtRrJmCjLANp86lch3QErs+eCuC08+UO285lxTUzA
LgN7dy8BegIvk2rXS9LI1zU3Oo//xG8xjzA6Gng81eVVkMy4XdvfBGNPIb3NpStK
FzcanXqbrw==
=2RnY
-----END PGP SIGNATURE-----

--uney3rx23pf46kpm--
