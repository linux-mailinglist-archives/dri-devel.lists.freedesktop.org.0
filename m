Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AF411EBF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4A56E5AB;
	Mon, 20 Sep 2021 17:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320E86E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 17:32:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 569965C00E3;
 Mon, 20 Sep 2021 13:32:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 Sep 2021 13:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GVsPVVSzsuHgKdtpzInsgDCriSp
 1U+Ja0geimb6WOh4=; b=IAc5+Am//GuBBLpkODnb1sJ45AZlTLjKNi7yvirOonF
 sZL9bzNYJBGnDUk2XNRz/GUKxHATj+/cWYBxOOcbPRuF3kI6VD/GwJY6uQdE+N9G
 IVHRNEFXFqMHKSGGID4/zYgTac6vthrE0pY4Rc/ptc01CXJn4cK28ibqLa0bDsuz
 W08N4g56kb5cuKLsnWR7pWN7k2FSP2DB14N81ATzs/wh2Lj5E8LdB/29gnAF5UMP
 MgnVpSy8WjBDBNR+L9hcQQ4+FUguEZgClhZOhwFi7B9lcWoEbJbknEnN2s17FYbt
 VgPFjcNJLkPnnW/B/9jpztvmuFqi29KnSFSZnTphrmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GVsPVV
 SzsuHgKdtpzInsgDCriSp1U+Ja0geimb6WOh4=; b=UL7kd/qLw0bM/pPu0gx6MI
 llTd1qSSxkw4THx56NYpwkEYVS/QKDCH6j21RDrD5Qk7luMvg95tFzhCGSEXexNk
 OrFyk5f1UZRDs+Q6L2aaLNGs8t+cBwif85YTdU+YVfjAKDzA/mEyXA1y+fKvnEBF
 M/QaYI7m8cqQ74a0ZXQ/Im3bOk/uteVvflcdz70lHJBnfrRUSXV5iypX+aPDC6Ss
 qP3EQz/TU/irGurFZQegG07mBaaPVuNwrgyMCwJzFPFCq6IRIf1aXxpA7EuUmk1B
 h8oE0bfmaSpKrWzvCEJP3JO43bhnwAO93cceN+d9aClJtNW+scGMjwQf9EdS/eUw
 ==
X-ME-Sender: <xms:ycVIYV5eTIHSSdBdj1YYz3FNkWMxsZ6ER4HhwE4kJyu2iqdOt4pcyw>
 <xme:ycVIYS6-6nTYZL3--u4_EsAHJJwwEDcFOvozr28fbdseomdOrwfTq-0ejuSK8WdOt
 zMBCI12Tl8PWY3UACQ>
X-ME-Received: <xmr:ycVIYcelmNx1FMn5Nuaz5hMjOD5a4sAT2IrKVnKluXehmnhXr_EuozBVhwz4N58tckRE3CyDUPCwQiwV_1NofnFN2ycjhYrIbu-P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ycVIYeLLRrwl1_qLHn2EB2fKPlXsUkAIo2BLFDdpOBvk9WuLbPJO9g>
 <xmx:ycVIYZKf7fETGkXJpJMdUoVKY5XPhd3lhO7ie7aZn9R9kD2z0bK09w>
 <xmx:ycVIYXy5CLeuM-RS03sLOM4z-rSxL-V7sGMgr9DyLf0rA_KPZk_pdg>
 <xmx:ysVIYXgXPJKns-hIFbBkiiUAyfdqA_zlR2bse4_YhE2kJAXCm15l3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 13:32:57 -0400 (EDT)
Date: Mon, 20 Sep 2021 19:32:55 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Michael Stapelberg <michael@stapelberg.ch>, Emma Anholt <emma@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <20210920173255.pp5dyaxqy4x2eo65@gilmour>
References: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
 <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
 <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
 <20210920121725.37es5k3t2p2bg4ml@gilmour>
 <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wkweyrvsjqpxi4rx"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
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


--wkweyrvsjqpxi4rx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 10:10:57AM -0700, Linus Torvalds wrote:
> On Mon, Sep 20, 2021 at 5:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > I'm sorry, but I find that situation to be a bit ridiculous.
>=20
> Honestly, the original report about the pulseaudio problem came in
> over two weeks ago, and all you seemed to do was to ignore everything
> that Sudip said and reported.
>=20
> THAT is the ridiculous part.
>=20
> The rules for the kernel are very clear: regressions get fixed or they
> get reverted. And I saw absolutely _zero_ indication that you took
> that pulseaudio oops at all seriously.

I wasn't questioning the revert itself though, I can see how you took
that decision for the audio patch.

What I was interested in was more about the context itself, and I'd
still like an answer on whether it's ok to wait for a review for 5
months though, or if it's an expectation from now on that we are
supposed to fix bugs over the week-end.

Maxime

--wkweyrvsjqpxi4rx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUjFxwAKCRDj7w1vZxhR
xc9SAP4tQyivDQXuOTD8jf9nqrm0tq+VXufmW/KZUIbajmjB2gD/SNUJbksPYEKR
CXa2cnrEBWujyelcOX7Xdl/1p1Ph0wA=
=8nSB
-----END PGP SIGNATURE-----

--wkweyrvsjqpxi4rx--
