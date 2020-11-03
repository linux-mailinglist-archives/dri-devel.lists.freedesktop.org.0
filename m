Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B12A5F46
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B5189198;
	Wed,  4 Nov 2020 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655236E865;
 Tue,  3 Nov 2020 09:36:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9F2B647B;
 Tue,  3 Nov 2020 04:36:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 04:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JxU4guRP0kokkXgNKXrKatN5k3v
 smVhnFnCYvoqD/QA=; b=CTkd6WvjWIpgaP7CXxIemCJLc9bT8akFL3sq1vB4oiT
 QW7ILahxaxyJ2dhPmQ1JF6bJ/I+e56o23kBcKeT1Pl15ylnJB6yvoWCVQZMctDzG
 CLPNFfP+s3bqzk1B4mWDAlgKl27n+uZNqPqEmVKc2IBZwMkshOG9nzbIi2yaf4Wk
 TVfk57WnuO2RfNMD/DVre2yEf7j8Ojhmq3AhhhYBxfJI5KPLXJ3tQU6GmVy/cAwA
 eeVG77Y+1oBhgUltmV+dfMPjgWNhYOlLhJj+D9mvQXhTzAOT93SSVwSjoPrKCWmi
 fe/GmMRZInwrR9/VW5w2LDLKOCMZnhOSs/RdIGJocCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JxU4gu
 RP0kokkXgNKXrKatN5k3vsmVhnFnCYvoqD/QA=; b=ddJQ9Rb9k3rT2qSgeD+nJQ
 nYOEqWxfs5PqONCgtfnGpsYQDbbyV7SHzngtorMVKDstddeVARRXBzyXNAvf56lv
 QEyWdWXhlxUsssUkdhiGmq8tzJfsHBkraqyo4M48DZ6/rClGI3FlouaLSYx6DVBU
 QzCP89u5660+8kEjgSzzyQG1aHZcQl1GaICpEMPxqivePD+WBIeZrVPieONg60vc
 4oWqDxTUTX0VqCxt6gVCP5IsMZxNZvOSslSiRYHZzDqcnO7U2plo9RFKsBg3ba6E
 mE19IrN+G7h4Uk1icEovu4J3UPCmldQxgJn/lg7gl5ui8VW+kfn7N4Ju6xXXQ4LA
 ==
X-ME-Sender: <xms:hSShX-9JqxH3mzEIKNwd5Wi0aNl4YxGJ7qoDfDLmWNuq5KSvlBD0RA>
 <xme:hSShX-tQpRzQzNjsYVZixEJqtz8dTfEWhW2t5ukaCEJ8HwIc06MyLNvpXus269KBr
 lx5lxU8FFtABR8seCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hSShX0DuGhN4hN75UK9w7o6-RYGaQiGZ5xSDKkRGVpcd_WStCDOtPA>
 <xmx:hSShX2ddaLxlo4K16R5o3m5srECuuEeqbFIDFcwSBelLMA1gXQlv0Q>
 <xmx:hSShXzMTkqWqVhuvg-cM72ck0Tj5cgqtP89OdHgz3nKMBshKRYuGMg>
 <xmx:hiShX8r4L9_4OYfjp2n-brspBy4QnC9A0-bIyJLvUoqgnn7iOF7g4w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F7ED3280065;
 Tue,  3 Nov 2020 04:36:04 -0500 (EST)
Date: Tue, 3 Nov 2020 10:36:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20201103093603.mzmcvbzmna77vh4r@gilmour.lan>
References: <20201103113121.4f1ffe17@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20201103113121.4f1ffe17@canb.auug.org.au>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0467451280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0467451280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gk5a7k24qfabtq46"
Content-Disposition: inline


--gk5a7k24qfabtq46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Nov 03, 2020 at 11:31:21AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/vc4/vc4_drv.c: In function 'vc4_drm_unbind':
> drivers/gpu/drm/vc4/vc4_drv.c:322:18: warning: unused variable 'vc4' [-Wu=
nused-variable]
>   322 |  struct vc4_dev *vc4 =3D to_vc4_dev(drm);
>       |                  ^~~
>=20
> Introduced by commit
>=20
>   dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")

I just pushed a fix for that one, it should be resolved tomorrow

Thanks!
Maxime

--gk5a7k24qfabtq46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EkgwAKCRDj7w1vZxhR
xa7EAP4/4A3YLK6xqMRbgjbgjleRIoIpCAk2DyiaUKp0KsvDhAEApKtHtdCXkKBK
6850n4kdukU0vDfZRT+HksVQqxlitAo=
=5/0a
-----END PGP SIGNATURE-----

--gk5a7k24qfabtq46--

--===============0467451280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0467451280==--
