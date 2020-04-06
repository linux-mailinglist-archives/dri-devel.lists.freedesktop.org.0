Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B41A0900
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844606E5A5;
	Tue,  7 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169C06E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:19:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 216F65C0185;
 Mon,  6 Apr 2020 04:19:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 04:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wvTAY1mSJtdwdZNb7GGd9/3Iuv4
 S6eSRHy8ZndtxRXA=; b=DCBWd0G3K+Posw3LBukUYObJE+20LKVDGdpU1Lx0f3Z
 dcRwVFJKO+/ePpuSzgdG7qFDwddkwtK9MUKFXjd1ZONrZRqEGlC7ewjOMEOW2XRE
 ASxRjLE6ORNXqtobo6VAS68z1C4Ym0urqTeuPpcMMizINRg6K7uTsi9Syx1BmFVM
 /CpWpv0nEwxEJCGB5M5PynFBK49My2n0jNyhCclbfv/pn83pripeX7u0hmruL9sC
 0WqX6MiZS6/H4WTv+tafQn1vs7PCE46+JLmbgyPBL3FuelOYMcme8IkOhrScR+12
 rS+3qUx7gUysFluSxWGDLEObCARfUfUOi7JWKjRz3Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wvTAY1
 mSJtdwdZNb7GGd9/3Iuv4S6eSRHy8ZndtxRXA=; b=U2MrMu41nXxJKr6X9/ftsp
 5ZQTwpAdqdiGlXMa0oCHJ3nKYrk5H/L3qXzFSP9t7cSgzZXN42XTryqXUga1dLeD
 BSAYZoEKjLc1loes0xXM7+maWw2fz0g5QqP6S/3cgc7OZNw0JPm5EKYvgt+fE1Ro
 bx3Ko9d+EV/g+hW1Y2U5o3f6tGwVIpNWI0SS4ZS0l6yBrbGfsJprXlvha4/Mg+R1
 mO+BPEZXU3CQFcMV/b+fI71a6BbNmbsXXEJBMlh6xpQnsSeuVzGLlnelpASz39eg
 jcVQ9hRQZoROO3VFReeEOY4Ox4//1QKlD0vSmKwnauY7BnHzqxl5PFWBZcZtMFSA
 ==
X-ME-Sender: <xms:IOaKXp2uhVufQ5k3U3wmYk0QyRKlxDo1ziCj1Y-fQOlFIfOeHabZmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IOaKXkUDg_9Kr4O6EwIHAtnWo1D_BU6a5RVJQrydnx1YNFkN4m1SDg>
 <xmx:IOaKXtdVpVvGkRyGh1MvZq3-fCNY986eC6nN_bqkMysdmUn5UYrsKg>
 <xmx:IOaKXl_H5HxRW_4cxBsYz2SA0L8jmObuU-X33Cg5hxe3F0xCsudGlg>
 <xmx:JOaKXlnlmyLso9lN1qP0VCETdRXBw9ChJaAT-ySNOaX5gIMpcEY5eg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BE41328006A;
 Mon,  6 Apr 2020 04:19:43 -0400 (EDT)
Date: Mon, 6 Apr 2020 10:19:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/sun4i: tcon: Delete an error message in
 sun4i_tcon_init_irq()
Message-ID: <20200406081943.hwjohk63lfpgrdvf@gilmour.lan>
References: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
MIME-Version: 1.0
In-Reply-To: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1327230431=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1327230431==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2o2zzt4r53mxdgxh"
Content-Disposition: inline


--2o2zzt4r53mxdgxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 05, 2020 at 01:53:05PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 13:45:53 +0200
>
> The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks

Maxime

--2o2zzt4r53mxdgxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXormHgAKCRDj7w1vZxhR
xcHuAP0WjOHzG00wGwXrC/L73opxmCYhJn2ZOmAfjN2ZfVnbHQEArryLB/dfTFEh
yOQICYvOYcUiHRoH6LIRW07gu19BxQU=
=YqNo
-----END PGP SIGNATURE-----

--2o2zzt4r53mxdgxh--

--===============1327230431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1327230431==--
