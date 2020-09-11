Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D9A26854B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA866E1B4;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E76E995
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:31:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 37F135C010D;
 Fri, 11 Sep 2020 05:31:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 11 Sep 2020 05:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ZwdqKhGGpnOv01iu/ZFbhMuvlS1
 d50CA8GNjVwdf/1M=; b=AhubxJJTr7lxYqvjNd+hGbwoHjzixaHje+qG/uDYaP5
 8qFFOzYUEuUHmavON4etWbQXxgknzgCiIb+gMEem1rFduefNGAQE+DY+lEdUrA6e
 OFKf5rAg6xQgAgxCVA3WtvCgeLnOpc1AvqziJKAiOETnJtt4lgpnc1hmqNqU+PMa
 XFzKox39XU9jWgoBkgO/qJWFAct+og9Odk/JhSnnDCLbwP7UT76oK/QU3ENuBs9K
 FPQJE0SPrYpW05OPal6+jrDxbQSDjqOsX6vvtvOzJl+TDsgoc7ag86Ge/qISVGTh
 dvbymeRR3ufMeQtn0SuvJVDK6y9YBfKXVwbAKC0vgQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZwdqKh
 GGpnOv01iu/ZFbhMuvlS1d50CA8GNjVwdf/1M=; b=OM3FsQOXjQ4W/cq0S9C1Hq
 ItQEqojBKmqFvRBr/eL8X4+6KyKls2q6TUh0HPogNzp+FIaWSEVMaoGiLJlRnLrX
 c8Zemd8Af/VpoAwhjDioc+D2Icw0keNsvD8tLDK08CZ3Qs8Z6h9gs0rk2uZTAy0m
 f5nPyAxAreVCEsIFzdDs9Gu66TkG7tvCtA+b7+Ew0ujtfcn23vGImBrsvRx64Nyg
 DxgbwvmqUA3cz0ylrY4VFY8EWXr7S4R5uZFr2cQmgPFCFqNfgwxHxx5p5pIQQDs9
 DbLBIYfONNYlTvIQ+K/mYJvOgYHBuoMJ+wiUDP+a/Ns/DmlPt58Rc43blQ3ULUKg
 ==
X-ME-Sender: <xms:1ENbX2QFNIJTqT3Hn-cL4HEVs0d5RxEISiHHzWzL2zgdAxfnmOQyQw>
 <xme:1ENbX7w_JCUd-oW8BJy0-hCgib14b9B090jqZp8lfFbjKY2y8V4v3VM00d5XEThja
 Oym6Yqw_v0lGKKaVbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1UNbXz1jYiJJWUhQ6Ownjb1CV_JvcGaWJvpOhwRSWBo11yTyNRTprw>
 <xmx:1UNbXyB7LLBWEUNfkc-WQaWT2XI01tkuqguyD0giHHKJC70DGgCjrw>
 <xmx:1UNbX_jwUndZBPhpMljWvgpxpuIWtIDQzYQmXwxMDMCQ20tEmMGymg>
 <xmx:1UNbXysl_n15gmh8uFTiDi6_jut6NsTXQXc48BbJI743IVIiHgWMvw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6BFD3064685;
 Fri, 11 Sep 2020 05:31:00 -0400 (EDT)
Date: Fri, 11 Sep 2020 11:30:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] drm/vc4: Update type of reg parameter in
 vc4_hdmi_{read,write}
Message-ID: <20200911093059.seyflq66mbvyhsb4@gilmour.lan>
References: <20200910170401.3857250-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200910170401.3857250-1-natechancellor@gmail.com>
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com
Content-Type: multipart/mixed; boundary="===============0229787874=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0229787874==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nivno6pymk5epqhf"
Content-Disposition: inline


--nivno6pymk5epqhf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 10:04:02AM -0700, Nathan Chancellor wrote:
> Clang warns 100+ times in the vc4 driver along the lines of:
>=20
> drivers/gpu/drm/vc4/vc4_hdmi_phy.c:518:13: warning: implicit conversion
> from enumeration type 'enum vc4_hdmi_field' to different enumeration
> type 'enum vc4_hdmi_regs' [-Wenum-conversion]
>         HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL,
>         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> The HDMI_READ and HDMI_WRITE macros pass in enumerators of type
> vc4_hdmi_field but vc4_hdmi_write and vc4_hdmi_read expect a enumerator
> of type vc4_hdmi_regs, causing a warning for every instance of this.
> Update the parameter type so there is no more mismatch.
>=20
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstract=
ion")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1149
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied, thanks!
Maxime

--nivno6pymk5epqhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1tD0wAKCRDj7w1vZxhR
xSMEAQCO33V9mqU3u9rBqhRNWajN4iqpvngIcDpnvW4MIldO7gEAqQSnWKYHs8I9
BUH19iF7iojqi5m2AoKIPCbJIyzAvgg=
=YcrL
-----END PGP SIGNATURE-----

--nivno6pymk5epqhf--

--===============0229787874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0229787874==--
