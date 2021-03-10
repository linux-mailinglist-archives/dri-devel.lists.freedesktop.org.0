Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600033369A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 08:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8826E9CF;
	Wed, 10 Mar 2021 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708A36E9CF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 07:48:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F0695C00C2;
 Wed, 10 Mar 2021 02:48:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 10 Mar 2021 02:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vq+u0B2+khT75u4bfsn8j7xpmyr
 8FuvsZ6cgP7pmbb8=; b=tI0bDS9nui1ZhWY9i9WhST/sdCymJkZU8NP5/Wk5+8E
 EdOPgkktvk2uS4gG8TXnqYvaoZGbRRluEaeXrt81YJwV9v76XvE/aoBn8WlZbD4w
 ngNa2ReloMMRc7VKIPjtOjF8QE6aTO1KlKjtm12i5FRAPQs/IcjZGHc6Tjh+bXUo
 F05dakekNHTPyZYt0VDi9/vt9AFaSNcxutPwdMfLx4jYOqDwB0RQWxM2hG3OOEDF
 t/oAgGP1HXJVD/MB3r+TkMFKz89wOR5C1SKioXDAH97tipaREbcsWLWTxz6U2I+U
 jD4sNMwLLkg5KTeg556f8mT5ZoBWzeF6nxfN3mn5aDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vq+u0B
 2+khT75u4bfsn8j7xpmyr8FuvsZ6cgP7pmbb8=; b=R5iw7RPNjTxpNjI//vX0pM
 Dmyr6gPs0hYKLNOLBn/VCGgfp8tVIMbnrEwpsUKiruUhxe/AaRVt/gGYAJdW7tEI
 EWEeW2HmlRAUk+avQIbYQml9DgPjIHs/5XGvASWllFFd54reZqMmeF11oKHYEdnt
 iCpF1dznKjBM1EviDJSeWjYAz/eXlWnHN1i18HuEr1JuOisvS/XCV8GL6b5mNEFu
 tdBgzTC6ZtHoJgI5lq319Xfx/+29OgJqjFPC2NDwcQ+wOoZ7/XVxA2S+30/awhOP
 HSMXZwQCqOcJ71DpQIt1J9XGtVPYAFAqXVfGXsvSgBh+XTMLNLxhv7VrZL4neuPQ
 ==
X-ME-Sender: <xms:5nlIYP7WnR4Z0WNkn8oaY-W_pMtjs3d-2UrxUKn-b5n6mehSXlaTNw>
 <xme:5nlIYE7aepZNpAE4riQoxJ6qCdceXVf8GR1LPWRjnDR6tKoe5B6BPHJLi4GIpF69r
 QvsWDUA4vjoHNp7Y_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddujedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5nlIYGdfuU2au3_71TjbBRQA56swR55YlBg2D_V27Om8mwZG2iSedA>
 <xmx:5nlIYAKVey102aJSjdXDH1Yq7kFOberV9We_MCB_XNfabaV5nUfy6A>
 <xmx:5nlIYDICmrsjGV06CEb7SnJca4Lf8LNJc5qoRatopevz-0Msf2lAzw>
 <xmx:53lIYKVjPPIhbp-lo5gFJ6ch67lhXW5XjANRJXo3R5fSIN1m-5Z8_g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4F181080064;
 Wed, 10 Mar 2021 02:48:53 -0500 (EST)
Date: Wed, 10 Mar 2021 08:48:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: don't base trees on 5.12-rc1
Message-ID: <20210310074851.x4lo4ymkq25e2iw2@gilmour>
References: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1512451840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1512451840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ioau4ormz3fmfkcu"
Content-Disposition: inline


--ioau4ormz3fmfkcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Mar 10, 2021 at 09:50:29AM +1000, Dave Airlie wrote:
> I'm mostly sending this to the -misc maintainers because
> drm-misc-fixes is based on rc1 at present.
>=20
> This needs to be *rebased* not merged up to 5.12-rc2. Merging will
> still have the bad landmine commits in the bisect history. This is a
> very special case.

I'm sorry, I'm not entirely sure I get this. -rc1 is still in the -rc2
history, so how would that change anything in the bisect history?

Thanks!
Maxime

--ioau4ormz3fmfkcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYEh54wAKCRDj7w1vZxhR
xS7vAQCPQCXhpZXKlpnC4GJjJzUuXrHKal4Gskj3tLWnkyhgswD+PUblt4c636+8
xDmfrf0fzN+oHWyjRYp50ayG/aZyIAw=
=IEUZ
-----END PGP SIGNATURE-----

--ioau4ormz3fmfkcu--

--===============1512451840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1512451840==--
