Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C146A265CF3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E296E9AD;
	Fri, 11 Sep 2020 09:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FDF6E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:19:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E0CA85C0F69;
 Thu, 10 Sep 2020 06:19:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 10 Sep 2020 06:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Zu7TfKhL4hRCxegB/ETUEZ6yj0z
 Bu3KgssZEsaTcRXU=; b=KfPdLhmsjCvkceKt/8Y1PpfLB+1yIYJshmmvV96ai58
 UKH9H3wid62LPof4YKioWOAqFFh/nu6xOzVDfhe4Zu95h+HhIiZ6jzYQpYaQPTiO
 CeoP4nxNdiMFr/sG+FDsRsiUCxGYZUztykHyoM5d8pHUy+era8JzyilxjLnw3Bg5
 73NT2qsFXoHq+EYrVcVgbb9gSzCHleHGF3AWovmKuVpuaTeFer9z1GwfC4zHr42h
 FQ6AMPWGZGYtI+FPosOY01ZfADd3qbrUvoM8yyoePHxdIX8m1x+nXmCT+75S4eP1
 67ZQaK6lUrABr3bHRMYOw3ByN1wgAju5xoDb4WOGxeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Zu7TfK
 hL4hRCxegB/ETUEZ6yj0zBu3KgssZEsaTcRXU=; b=ZAl/kI6pDXiTg+TokdPU/N
 js8tYLvb+LCqoSof3IA5gOdex2FvVyZ0HcvC+vClQbRoM+N3TdwU9HoaSLf8WQUz
 maY/5C8CZ/k0w9TjABvXsZxv4nmSKYAEmOVPDP3lyD50z/Efe8bcU7ShjiwCzBz+
 +9+lXxInxRVIZ/Ck/wlcc/uxvK3zArhjo+9LDPVeN/HqZcZrukIVzdtGU/F+1Cc+
 4Y1UGbG999ZcebiJUHM1Jifis/EPnsse0Oh0cdl6/XqPqTjkNYH7fbhlEr0m9crH
 C8G+28aVFiGjoGeki74Ag1RL5Ik19YguOY09HcF/nURyFFBwD837j5xuA0KQXJGw
 ==
X-ME-Sender: <xms:yP1ZXwrEftyLF6DHghocaEss9FiN5x9MXYRO0HcY_YJ48V7cW3-ZbA>
 <xme:yP1ZX2qQSHOKvwb1x5dJgix-9n0A7MXuMpcFG-hHImCbIs4G-ApeEoi_g-HPiDxGt
 8BgQNr211yXChGz-3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yP1ZX1MRvUwfxfjQRhmrvmGaQrhjIHf6Tx-lp9vH-ymE8SPbi9_oVA>
 <xmx:yP1ZX35eeMHUkmvt-W3UT6VStflLvKGvSvAhDzU_HQzVZhhjN4US2A>
 <xmx:yP1ZX_4zkSF1sZQ0udQKiGl1zSmtIhMZg7zzhDiMMi7QgaRn7hlwEA>
 <xmx:yP1ZXy0wbhg5dtvmpRT76PJnrXECAadfSYTCckyaWoTpfrmfYvfp2g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08D99328005E;
 Thu, 10 Sep 2020 06:19:51 -0400 (EDT)
Date: Thu, 10 Sep 2020 12:19:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Fix off by ones in vc4_hdmi_read/write()
Message-ID: <20200910101950.vgolpbskn64evnyk@gilmour.lan>
References: <20200910100748.GA79916@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200910100748.GA79916@mwanda>
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.duckdns.org>
Content-Type: multipart/mixed; boundary="===============1240390484=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1240390484==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tq5daj5t3ijdco2q"
Content-Disposition: inline


--tq5daj5t3ijdco2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 01:07:48PM +0300, Dan Carpenter wrote:
> The variant->registers[] has ->num_registers elements so the >
> comparison needs to be changes to >=3D to prevent an out of bounds
> access.
>=20
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstract=
ion")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--tq5daj5t3ijdco2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1n9xgAKCRDj7w1vZxhR
xbQTAQDUfacjuhgX28Cj9vVmIezT6QLQoMhITiWlhN7fLiKYFgD9GTqvCdM3B2Nv
TfTH7a+W93y4WcNIvcdtGV78EaNejgA=
=F0K8
-----END PGP SIGNATURE-----

--tq5daj5t3ijdco2q--

--===============1240390484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1240390484==--
