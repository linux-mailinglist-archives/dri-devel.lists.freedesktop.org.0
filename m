Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC156025D7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F21410EEB2;
	Tue, 18 Oct 2022 07:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD2910E1DB;
 Tue, 18 Oct 2022 07:34:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id AFA6D2B06898;
 Tue, 18 Oct 2022 03:34:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 18 Oct 2022 03:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666078459; x=
 1666085659; bh=O28Ra42je2l6WzDm/ZO6o7rlbUD0f6okc6FR7gCx5gY=; b=c
 D7GfdBBYv+RNoIJNHU7ZMe6/6FlTZtIgN1EVcdn7q+/E/tX8MUYD6cWK70SP+095
 HIysOx6U4hzAzd9Oxr1+lfRNMsdTrBALP5TJwpaKAdsT441k54XiJefZoNwksmDX
 epJn3K0Zl1gXfWdEG3WyJCO0Gf4YYQgf2AUQhy43zcRtbq4ZG8vbW4fHpJJY6cl7
 0Q+/7raGCos6wWg5jQEYEg7BQqlsDeJTfOy8H9hEmeU6/YEQZPzEpuEl/LaL/Vj9
 qkVpo76vgbxd82LnIZMcIfpuQG5kuH7S0M4AfuBlXTCRA+4FgLH2GFv3vIhwBUIm
 g/6L/exJNRAJueyn9q0Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666078459; x=
 1666085659; bh=O28Ra42je2l6WzDm/ZO6o7rlbUD0f6okc6FR7gCx5gY=; b=K
 AziRhUbnFvkdSTAUOgSQwizWhJotp/ejPbOhWNRWwnOuNmPW89LQCRyji9fSEqPD
 1U1Vltxi+zQuJhVmX9ufaEWhogLUTRpo42yYA/2OigiBIqfDHRcy99ab9ABS3u1S
 MWPxl+1+f28ZICrHoxJAhEBL+J94+rIw7nBuIcHb7v1ooKaC4Zbinx62GNjEEy6V
 PxLrPZ0nYSx4mS0ZC0abfrisiOcnTxgGTGK+K0Yj2Xqn9Mat/rJmJALyGyi19B1/
 6whf2Y9wu8Z/7EdAVzlj462ybn51hI35XvXMYfbn7EOh8dHJRLKXFejvqm6ySDRi
 xJDOsXQ3TH3VGqeNPNL0Q==
X-ME-Sender: <xms:-lZOY2ANOVo_-VHFDC2BsVOUuyO5VW3WiDQ9xO5aOvTmwO6WQXYQxw>
 <xme:-lZOYwgOxYjEsZMPGEguSQiviJKiwhs1S-50MRE0pJCGpMKsWo2PBRIunN_pl-rN5
 35xj_K3svuXb7EjHnQ>
X-ME-Received: <xmr:-lZOY5mBQh0qtc_Bbrc-pAUe2L5T5LPNYiTMFtT2v7i-3fhzSAW_G6rXN08f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeltddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeejvefftdehvedvfeevffffjeektdfgkedviefgfefhfefgtefhjeej
 ieegieeugeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:-lZOY0wQsKHOedSZNpvC-ut337YUuHIfSe8ADCh2G9hhIAUJz6Ho5A>
 <xmx:-lZOY7T87jDiXPJk9cTa2Wcnzym12ZRSxOTme6T_ESJE1jBCmh6aNw>
 <xmx:-lZOY_bsoRtzVSwxTgox0TAERmVOBddBaC3ItH-FBFBaC2V_L2o1mA>
 <xmx:-1ZOYzzDVwXhCAG5OpWMTYanWa3VUWo4DwXwhLLxzzu4VZfUqiNMi22WE54>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 03:34:17 -0400 (EDT)
Date: Tue, 18 Oct 2022 09:34:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 11/30] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20221018073416.7tttm6mnbt2pdrpk@houat>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-11-60d38873f782@cerno.tech>
 <0aa690b8-988a-878f-4d4f-d391295bc591@tronnes.org>
 <20221013083638.kloiaxervnhii7ew@houat>
 <71e53906-ae9b-55b9-7a93-7bb04a891423@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <71e53906-ae9b-55b9-7a93-7bb04a891423@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Oct 15, 2022 at 05:04:50PM +0200, Noralf Tr=F8nnes wrote:
> Den 13.10.2022 10.36, skrev Maxime Ripard:
> > On Sat, Oct 01, 2022 at 02:52:06PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 29.09.2022 18.31, skrev Maxime Ripard:
> >>> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> >>> 625-lines modes in their drivers.
> >>>
> >>> Since those modes are fairly standard, and that we'll need to use them
> >>> in more places in the future, it makes sense to move their definition
> >>> into the core framework.
> >>>
> >>> However, analog display usually have fairly loose timings requirement=
s,
> >>> the only discrete parameters being the total number of lines and pixel
> >>> clock frequency. Thus, we created a function that will create a displ=
ay
> >>> mode from the standard, the pixel frequency and the active area.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>
> >>> ---
> >>>
> >>> Changes in v4:
> >>> - Reworded the line length check comment
> >>> - Switch to HZ_PER_KHZ in tests
> >>> - Use previous timing to fill our mode
> >>> - Move the number of lines check earlier
> >>> ---
> >>>  drivers/gpu/drm/drm_modes.c            | 474 +++++++++++++++++++++++=
++++++++++
> >>>  drivers/gpu/drm/tests/Makefile         |   1 +
> >>>  drivers/gpu/drm/tests/drm_modes_test.c | 144 ++++++++++
> >>>  include/drm/drm_modes.h                |  17 ++
> >>>  4 files changed, 636 insertions(+)
> >>>
> >>
> >> I haven't followed the discussion on this patch, but it seems rather
> >> excessive to add over 600 lines of code (including tests) to add 2 fix=
ed
> >> modes. And it's very difficult to see from the code what the actual
> >> display mode timings really are, which would be useful for other
> >> developers down the road wanting to use them.
> >>
> >> Why not just hardcode the modes?
> >=20
> > Yeah, I have kind of the same feeling tbh, but it was asked back on the
> > v1 to ease the transition of old fbdev drivers, since they will need
> > such a function:
> > https://lore.kernel.org/dri-devel/CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8f=
BYzRYyWDuNm5=3Dg@mail.gmail.com/
> >=20
>=20
> If that's the case I suggest you just hardcode them for now and leave
> the complexity to the developer doing the actual conversion of the fbdev
> driver. Who knows when that will happen, but that person will have your
> well documented and discussed work to fall back on.

I'd rather not, tbh. We've collectively spent weeks figuring this out,
reviewing it and so on, I very much want to avoid doing this all over
again if it's going to be useful at some point.

Jani also wanted to expose a function and not a raw mode, so this patch
also addresses that:
https://lore.kernel.org/dri-devel/8735eeg31e.fsf@intel.com/

Maxime
