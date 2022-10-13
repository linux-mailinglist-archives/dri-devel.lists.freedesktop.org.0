Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD59E5FD646
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC1310E200;
	Thu, 13 Oct 2022 08:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D05B10E200;
 Thu, 13 Oct 2022 08:36:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6EFA258035B;
 Thu, 13 Oct 2022 04:36:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 04:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665650201; x=1665657401; bh=ysquayv/A7
 PcL91ZGvk9c45xdKAQrAqStjB+DbTAf4Y=; b=fGvAjI49FOoCVdB2M5Hcd/j++r
 uN93U9tVW2glfFC3Ec4uivVmTIoUp9RyKrzQj9rqlvHgmCRd7k7w6Zlt1tuABskA
 4x3SkxmWIavMHV3/kZm+xfhpEHwy8/Bio04nFnSxKdrm0yErAGR6KB8Kh1QknV9g
 /hsVp0Dz5H6wV2W4I17ytz/klpxpmFO8+cH1fM0WhfOsjz0OA8mR5Kb3zEkefAHZ
 lzhcX8ym5wGpXcZ98qntF0EqOua/rZpPGqGBrtWSMJzRnXfGoiQqogs8dGIXN3KZ
 POWt7SZMSJK5HM8Evv5ZvRkqNIQbekuYrO4DwcYMr4in2nAKyq/JfTXedpEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665650201; x=1665657401; bh=ysquayv/A7PcL91ZGvk9c45xdKAQ
 rAqStjB+DbTAf4Y=; b=UIna1zpHZ1vH/wEBK0RE1zIRyKk8c7mWVVtYYnm5tgxC
 n4RYdAVYlpupi30CudvozDGzmCYDPpPtmH9D0eWIXLCajpR7omgKafbsYcZH4YLs
 QdsQqYKofIf6uCaX34V6KBjRd/ezHyACFVwO6NzcdD8rb2mW+XJHwJ9Gm0fMxw6+
 402X5BgJ539CgC0DQsbLocznUiImNqOlCFkL3QQodiJ5PX+FkQapOroNBr3T64p6
 o69aovrHr/bGBmokirOWWOmlqAvvDus+HBfPAtwgFCCVGmYNHEhB35+kdlOCXu/E
 uEAVTNdLUmbnG7m9JflUeeeLe6B3/VHckfUgBS4FBw==
X-ME-Sender: <xms:GM5HY57zldkiHq5DHxAIqMV4ri47KWkn6Le_F7uS085pkYYDXfyqow>
 <xme:GM5HY27KVj_mt2XtG7EP7IB6svmVpDO7LonsYm2ujyBE-nlqEoCchoGmKL89ClIlJ
 N8O7_mxpduYCJnfNQA>
X-ME-Received: <xmr:GM5HYwddm-oPwfORmFSjtwNqA0b18uKjC3Ob64gsDEeq1Mj9tg99JPrXa83w4ymyDD0jE72JF_rvEhhly1eyvqDZbAx-FGco9Gb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeljeeugfegveetleevkeetffegudevieetieeugeeugeeivddtjeejvdef
 feetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:GM5HYyJSEpM6YUHDJ03U9cB9w9_g4vqlvanymVLGPphkerK5JsVKoA>
 <xmx:GM5HY9JIM4TAqtjnia8joUvmM5SPGvCpFzPqoNzuSEa5ukp3Wbwb4w>
 <xmx:GM5HY7xJwRvkDe2E2lR2wHgOFMQGNv9JMT0AVe08Jz4EeBoP0wBzXg>
 <xmx:Gc5HY3oXqNmr3oRXKiMt81wFysmXGv5MzjjahHsr3YO7T93tVZbvkQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 04:36:39 -0400 (EDT)
Date: Thu, 13 Oct 2022 10:36:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 11/30] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20221013083638.kloiaxervnhii7ew@houat>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-11-60d38873f782@cerno.tech>
 <0aa690b8-988a-878f-4d4f-d391295bc591@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l3aewuzyqmtjebmf"
Content-Disposition: inline
In-Reply-To: <0aa690b8-988a-878f-4d4f-d391295bc591@tronnes.org>
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


--l3aewuzyqmtjebmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Sat, Oct 01, 2022 at 02:52:06PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.09.2022 18.31, skrev Maxime Ripard:
> > Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> > 625-lines modes in their drivers.
> >=20
> > Since those modes are fairly standard, and that we'll need to use them
> > in more places in the future, it makes sense to move their definition
> > into the core framework.
> >=20
> > However, analog display usually have fairly loose timings requirements,
> > the only discrete parameters being the total number of lines and pixel
> > clock frequency. Thus, we created a function that will create a display
> > mode from the standard, the pixel frequency and the active area.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > Changes in v4:
> > - Reworded the line length check comment
> > - Switch to HZ_PER_KHZ in tests
> > - Use previous timing to fill our mode
> > - Move the number of lines check earlier
> > ---
> >  drivers/gpu/drm/drm_modes.c            | 474 +++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/tests/Makefile         |   1 +
> >  drivers/gpu/drm/tests/drm_modes_test.c | 144 ++++++++++
> >  include/drm/drm_modes.h                |  17 ++
> >  4 files changed, 636 insertions(+)
> >=20
>=20
> I haven't followed the discussion on this patch, but it seems rather
> excessive to add over 600 lines of code (including tests) to add 2 fixed
> modes. And it's very difficult to see from the code what the actual
> display mode timings really are, which would be useful for other
> developers down the road wanting to use them.
>=20
> Why not just hardcode the modes?

Yeah, I have kind of the same feeling tbh, but it was asked back on the
v1 to ease the transition of old fbdev drivers, since they will need
such a function:
https://lore.kernel.org/dri-devel/CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzR=
YyWDuNm5=3Dg@mail.gmail.com/

Maxime

--l3aewuzyqmtjebmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0fOFgAKCRDj7w1vZxhR
xRPTAPsHbpjwggNPU38hdpfJ1NG62HfnGiMtgUpIeY78VLwdvAD+ID6+idT6/neO
8RrFdtowwtZdPyNPHMeV6f3x0uD7BgM=
=iymO
-----END PGP SIGNATURE-----

--l3aewuzyqmtjebmf--
