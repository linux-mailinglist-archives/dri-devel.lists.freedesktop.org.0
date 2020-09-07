Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CC260BAA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17826E3F0;
	Tue,  8 Sep 2020 07:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4576E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 16:14:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 64344938;
 Mon,  7 Sep 2020 12:14:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Sep 2020 12:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=y3uHfRZw+5Gz3Ka30vws1hOsu/J
 Ass4/0jIBLDK53qQ=; b=Y3LRXGdaQBcC+WaeQYBB4hZG1dgAxEAMZ0FKTZlUSx/
 wV0UYUmA8yvx5g3zwZ4ZBC1/OGNaqE4tpT6dvpcRKahUYY23GoLqNoaWYwVPgaEQ
 BfxsobOB2FIXX2LWpNYi/zwcUZ1el+uOh2FaB5LfY+BBFn0hfVJK84MGwYrQMTrw
 l8cQURRtOcxeRUGf+23vBMSs9iG1mSgY2+1ItTtJN2Ky3/3j1rkY5aSDnHFzJyHC
 ce2FO8NyBnlqH75Yag2Z8AMsuJDgUmRL3aF3kspJgPg8tNbEbtTaDqKLRDSVcUqs
 cvyCm92kNkW6B17YlMSanl5dL9VC+vDs0yN8HLQQfJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y3uHfR
 Zw+5Gz3Ka30vws1hOsu/JAss4/0jIBLDK53qQ=; b=MlQ2NHj9l0Z+IZ+t/rJhZ9
 WN3kRbULikovTJ44vc+PZdL3LjAiZSlaRefGxNkRKY5QF8ytDCn1t9I0yH1cnsgt
 Yi/bXSGTWBIcJ3xFCJgOidh2MI3rWjY+4QpXIPY+fO6k/fG2Mtnc3TeYiqRn8fBu
 uJU0hZI5FAM+tmi/A7W+vm6nC+ct/wIxOHTQ+FRdV3AjY/f12ZohUdI8119zhk2X
 /a73B6y0739qET3zb2Sg5f9RRHzkfa1gjYqhApHgprYcvUjoZLv3J8IGzfMKUnHF
 nPBJ81VZ8zEEjJ+q0ZFxiKR6WaWGpoofNATf/UaEG9dQ6tzlQWB71PU2ru78GI9w
 ==
X-ME-Sender: <xms:YlxWXzhbrnt0ovKIFbGGLrgfZP-LJg9Cm6_RWPHDGBgk3UYtmav-Nw>
 <xme:YlxWXwBDxz6cMgC29ilBWG90hBNK2WlB--juAFPA8f5ODz2AaXFhAXyVluiuiH3dZ
 h1d7anF-QDkAIzBSGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YlxWXzHfaXxsd-TiiNtBi_pjR41MMNHY29tK4II7EwKAG8-Kxmz4Kw>
 <xmx:YlxWXwR6qZvXaylD48hKMqHqxsPf07RKwCTrCTd2M6jtAxVvEw1nyA>
 <xmx:YlxWXwxQvLpLz-pAiWwfYjpLsjmthYS4oEi6bFxUcgGs3xUBL7a63A>
 <xmx:ZFxWX1LcZVCiJ8FUqi-3B1RJ5S0BPFahr3rsoNpLr_ogjgqFN9G6nlorR4Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A21A3280066;
 Mon,  7 Sep 2020 12:14:26 -0400 (EDT)
Date: Mon, 7 Sep 2020 18:14:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jian-hong@endlessm.com>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20200907161424.okjolk5v7pdiyoqu@gilmour.lan>
References: <CAPpJ_efY2=qmaAtuYVfWhZNBhzTAtAxm9CS5jb_sTpca97jkpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPpJ_efY2=qmaAtuYVfWhZNBhzTAtAxm9CS5jb_sTpca97jkpA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, nsaenzjulienne@suse.de, dave.stevenson@raspberrypi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>, phil@raspberrypi.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0260911983=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0260911983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jipczgpyckh77ast"
Content-Disposition: inline


--jipczgpyckh77ast
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, Sep 04, 2020 at 06:16:16PM +0800, Jian-Hong Pan wrote:
> Thanks for version 5 patch series!
>=20
> I applied it based on linux-next tag next-20200828 and build it with
> the config [1] to test on RPi 4
> However, It fails to get HDMI state machine clock and pixel bcb clock.
> Then, vc4-drm probes failed. Full dmseg [2]:
>=20
> [    2.552675] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
> HDMI state machine clock
> [    2.557974] raspberrypi-firmware soc:firmware: Attached to firmware
> from 2020-06-01T13:23:40
> [    2.567612] of_clk_hw_onecell_get: invalid index 14
> [    2.567636] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
> pixel bvb clock
> [    2.567664] vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_op=
s): -2
> [    2.567731] vc4-drm gpu: master bind failed: -2
> [    2.567755] vc4-drm: probe of gpu failed with error -2

Sorry, I should have mentionned it in the cover letter. This series
depends on that patch from Hoegeun:
https://lore.kernel.org/dri-devel/20200901040759.29992-2-hoegeun.kwon@samsu=
ng.com/

Maxime

--jipczgpyckh77ast
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1ZcYAAKCRDj7w1vZxhR
xYwCAQDm6F6h2pwNs7Q8EP9XiO/LnXQS0wkHQt2icHMNkTpDBQEAxZclGsOEUXAz
POMH62A+x8HcwntZ9CRAtQ42hIa3zw8=
=Mzu7
-----END PGP SIGNATURE-----

--jipczgpyckh77ast--

--===============0260911983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0260911983==--
