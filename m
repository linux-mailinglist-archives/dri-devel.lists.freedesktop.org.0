Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911F411426
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC9E6E4BB;
	Mon, 20 Sep 2021 12:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB726E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:17:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AD4615C0140;
 Mon, 20 Sep 2021 08:17:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 20 Sep 2021 08:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=MQKkEM9yQ5058O0ZJZihhAzZIjt
 b1KCA3Q74CrXeAn4=; b=hV7B2yecPExNGPQNdj5aRjjzeCZ9h+IAAiTLIE11heB
 Vvt92E9O2gg7l7Q5kkgm94YaeqMTVnQcr5bRL6apxvGna8pWQmROapg93HjfB7Fe
 WwDUsHktnzd8cGNrgVQvI7+iDVYzvLiyDWh9FFihcfl4IKqekEEkccIh+VAV+iTt
 /PRVTSa1gOEN30agk0glc4Gqm4dNx/k/x493DsiCY+/jjO/zriAFRtX4iP466M6u
 MjP7sbXk1zWxUb7aqNQ/x7C0JGcVafDnB8wD2RDmJi3qQtFsUm+z1NIyGExvkKCT
 26+EHYm1OhcCVq/UXqzkOsi+qXOBu9MMUUrAVKhMplA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=MQKkEM
 9yQ5058O0ZJZihhAzZIjtb1KCA3Q74CrXeAn4=; b=LPzYng/yQjCTBn/JseNPb8
 PEGw+YUvHjv28skvVnAG4yx5jhV7LMe20jhQW2v2xqyaANbhGv4yHICzs7n2IUBY
 JA4qmvtwrbFK4PaKts4AxSXKn/E/u+GIcdcozHxd+CkRPFeIayS+OsKh3JnsJcEU
 SLxMqATDuD7IvihyNB+ANpJClXU3XK276erw7OGv/DADnnjGJrcpAn/ZvLxZsg1F
 tsp2AUV99VcAT0fIM6SknOp84bI1MDHYuyYQh5KmS67g0lpJH3PIamUTSZxlmge3
 3y8tsTa5CkI/BLlu2+xYi1PeLEk0iih9bOvyzOcCyG7xyHwudrggxqaP9u4E86MA
 ==
X-ME-Sender: <xms:2HtIYXENMHZrkneIsM82kr9wf1WHpY7omTPf-HermiC-20p-TzoBTQ>
 <xme:2HtIYUVbqyimhqoHpJWy1jxVh4kPbWBrNKhVvZSwL-cuADRiur4cj8wLFJKe83zjh
 P0Ik1waBX2abXCZPc0>
X-ME-Received: <xmr:2HtIYZIy8jWaIE5cAk8kEVriWTcPYcx1U26tI6Bdc0aATADjwvTLVBgxkrXw8ih516f5X7ZzZwN4pb3GM_XE_O_Xr8ssnUN5n8qf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2HtIYVEgChFM9595xagAgkTKpwZcQX-9zj9UL7yxugfapnEGaoWdIg>
 <xmx:2HtIYdVMSJ8CHi-Awz-Z-RaqDf_wBpnJ101Y_Au2KOlK4eNPulhgrg>
 <xmx:2HtIYQOxEtLat1pbqFVzQZYtsBc2fgkso060w9fO2SbGO4WyUyGvLg>
 <xmx:2XtIYbdwgUAXyizh-ueJk_xDwElUeLCbRtyO9HnQZPPFJVHnzBJNrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 08:17:28 -0400 (EDT)
Date: Mon, 20 Sep 2021 14:17:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Michael Stapelberg <michael@stapelberg.ch>, Emma Anholt <emma@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <20210920121725.37es5k3t2p2bg4ml@gilmour>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
 <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
 <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wgbt45e7hil5cvkv"
Content-Disposition: inline
In-Reply-To: <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
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


--wgbt45e7hil5cvkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 19, 2021 at 10:19:35AM -0700, Linus Torvalds wrote:
> On Sun, Sep 19, 2021 at 4:05 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > And indeed, reverting 27da370e0fb3 ("drm/vc4: hdmi: Remove
> > drm_encoder->crtc usage") on top of d4d016caa4b8 ("alpha: move
> > __udiv_qrnnd library function to arch/alpha/lib/")
> > has fixed the error.
>=20
> Ok, since your pulseaudio problem was reported already over two weeks
> ago with no apparent movement, I've done that revert in my tree.
>=20
> I reverted the two runtime PM changes that cause problems for Michael too.

I'm sorry, but I find that situation to be a bit ridiculous. In order to
be properly addressed, Michael's issue needs some patches that have been
unreviewed for 5 monthes now.

However, if one reports an issue to you, without cc'ing the author, on a
week-end, the revert is done in a single day.

Even that audio bug only got a proper report yesterday, after you asked
for it.

Do you really expect us to work during the week end too?

Maxime

--wgbt45e7hil5cvkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUh71QAKCRDj7w1vZxhR
xfWSAQDao2rgbIqjoo9Ip2A42JH8X4wsZ5Qz3teh1W9CykhuBQEAu8gT71e31vSa
Iwva+ZjatJLCt+OSzAgZNg1bsFYW2AI=
=1tmG
-----END PGP SIGNATURE-----

--wgbt45e7hil5cvkv--
