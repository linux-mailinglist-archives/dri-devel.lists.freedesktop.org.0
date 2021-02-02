Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02330D4D0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE2C6E9E0;
	Wed,  3 Feb 2021 08:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914076E94E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 16:03:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1E9779EB;
 Tue,  2 Feb 2021 11:03:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 02 Feb 2021 11:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+29NRQnq0r2ASZudoLupX6fjqkC
 EV51ImWFqltBWllU=; b=cyz2KDoUZadyYws2P9t+4d911FKVX4yySu5UbZhBjtv
 3xym2FZ3YHeqShQE+uuYWQb8GYjYnSINlwSm9QcdpYLdade8LphzA0WYsS4sx5av
 ItZrgroGCERskJHNTSpp0G+lKwN3jkvNccDAhZI9M4RpvGmsLchNxkrZ6945WxJg
 wONXPhiU5UN+f4Lf3yvrMWn5j6XwtzjnBgvsvtALp4KrdApP0pIl39fV7kDHBAuO
 BW79CvJOYIfCD8OpnD6XXaEk8gJ0qQYHYMiV1pRbroUYpVxCoaEuI5y6pIYGi6g5
 rIYnF5MXYFdjucZwMG2vYlkw5kEUAk9HxZEx6ZLeQhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+29NRQ
 nq0r2ASZudoLupX6fjqkCEV51ImWFqltBWllU=; b=Nc8J1duTh9H+UU5d/ZxTTI
 /TBdeCVP5FkpIsE9TCkBkglB312Dli4Yqij9CoSBjI0i4aClBcDDgy5yTb1cEhBA
 nlA4+fmtCMwGpf3REDyEMFM9GqSPx1T2gTwyatgQbwZjnhq7MYx20P73RN1bXEsd
 yx+bbGyHQ0t94fjoHK6jzMzzd5sn/nZvVeLj/TntpQXPa0xzCRHxhVn8V9i5ehmi
 v+x5KNuQk5U+ivpHhI5cPRPBJ5/ywdAqdFGOv408nKtUp+9wT043ms6TbKEboEXJ
 cKZVZXubdBsFL/cztW5XDj6XFmVVczy7r9naaguPTP6eaXT2IKzXaWvK8KAlfNjw
 ==
X-ME-Sender: <xms:53cZYNQLf2P-vngoXb6EGG4qiDxOU_--TH84zGu_fHD0ZTkre8hCyA>
 <xme:53cZYAY0vRxL0h-vk1O3UcC1YiF3bE2ZCWcWTeLbOxO5ls1IH-y9HNEzoshU0RTHq
 6LAdv7ojrQ6Z_ETF4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedtgdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:53cZYC2CphQGHxE7CWfQwxn4jciwqf0TEgXWJKAeom428OZ2Z9DCyw>
 <xmx:53cZYIXj05-85BGEyhrE3rC9_3b_dqvFqUH-w22i4YzCyhnJ48VidA>
 <xmx:53cZYEXhB2lLgZGrRJejz73K-nmIKI-JzOWH5nQOYwvfHiptZP483w>
 <xmx:6HcZYNtNJSFkJddHbdNzcJaj7INUu3IF8yWN9vGBeLov-7Bw14hQvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E40B51080069;
 Tue,  2 Feb 2021 11:03:50 -0500 (EST)
Date: Tue, 2 Feb 2021 17:03:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/vc4: remove unneeded variable: "ret"
Message-ID: <20210202160348.f5o4u3rjxmdthcaw@gilmour>
References: <20210202122338.15351-1-bernard@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20210202122338.15351-1-bernard@vivo.com>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1933960109=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1933960109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tfvfkvldb3whuaz7"
Content-Disposition: inline


--tfvfkvldb3whuaz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 04:23:38AM -0800, Bernard Zhao wrote:
> remove unneeded variable: "ret".
>=20
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied, thanks

maxime

--tfvfkvldb3whuaz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBl35AAKCRDj7w1vZxhR
xXGVAP4uItJCaat7ORpOhaBwYMwOVXzdywv2rIZ33uXDN62cRgD/dHGp+LeHC1+B
vCVfk4z/nG0vCN9M9n5/RtLxoZpSYwU=
=AYjU
-----END PGP SIGNATURE-----

--tfvfkvldb3whuaz7--

--===============1933960109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1933960109==--
