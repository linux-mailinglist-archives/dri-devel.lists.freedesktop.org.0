Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4B675CC8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E772010EAC5;
	Fri, 20 Jan 2023 18:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5A10EAC5;
 Fri, 20 Jan 2023 18:33:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 45AC95C00C2;
 Fri, 20 Jan 2023 13:33:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 20 Jan 2023 13:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
 cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1674239634; x=1674326034; bh=W08S6DHatK9lWztDyFsVOGr9jQVa+AwVteL
 XmXnBnNw=; b=hTwS30U5eI3c5tMNYjIN37+/3Z+IO2iqMUSNQX/1G6jI5ipaKa5
 ZiJy/u/su8VnB+8pZ9kR9ZzOqoT5RQDa73hsJ+RAoDcNZUF5zfksSQqyC9qjWROS
 oDVA1fVTP23BxGLCpp5GC07tTnBlZWtMvaJhyQUUxcjBh9GSoDUAExMCkDJK5vqI
 fzEo+mbl2HP0QVLq7wJSz3NpUmN8gK6EJXMOjZRtAAFSDdv25x8TwAosOUarv0s3
 WaNLSf+QRT7MqEX4kEjWxMc4oQUrqvIUiYGvCYwuypVy8NE6mPAnUvqf6eqEfQdH
 BD551+0aAyiYQAtxIienWBxuWVjRoyEHWVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674239634; x=
 1674326034; bh=W08S6DHatK9lWztDyFsVOGr9jQVa+AwVteLXmXnBnNw=; b=N
 yx9692cGfxuCdVoq8Zd4SMEswTA5dCTK7buHOpvpCOdVpCx7OZskmxx1LDpTmuBT
 OXpRb/XYRvMgUAXQvgcINI4op9lko6tBpeSwp7hTb9IPshucYftqk+Xo1jQqms9i
 aYLjucSTJ2EHGsOPN9221v/wfCmx1uVxMITQnQS9b0yUK797NbFEaeKQrb25pBWp
 8Wf6T8F9O7s2tyS863ELQxCBjkrpZKjZsnQCXD6ZmimFgKXklDpxFIaE/BYOzo0V
 Lr41ix+SCZrF3qwp8LcetAKfMh75ky4qAzXBUoL6usIT6UxzEvtxQh7xAzM+3gIp
 CmuqGgI3yeh29iV4v2/dg==
X-ME-Sender: <xms:kd7KYwJn9wW3nt-oa1I_g1J6uIowI25FAh-CbIZLct1YNSeFy_VeaA>
 <xme:kd7KYwLEsMozhhrTvcnC6BIi2H-8h1JtSuqsKLbxf4G0LW85RjDQoKhKJVudM37-q
 76-5IYFZZWvNyNBnoA>
X-ME-Received: <xmr:kd7KYwuZlYLQc6CIN2V1qwvmFlgUSG-2sXvllKahsL7AGufOFj4JctYMIzvZREGNwOEyQAqr7cFcJmg_66VYwU5AuTPN1mU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesghdtre
 ertddtjeenucfhrhhomhepgfhrihgtucfgnhhgvghsthhrohhmuceovghrihgtsegvnhhg
 vghsthhrohhmrdgthheqnecuggftrfgrthhtvghrnheptdfhfffgjeduleeffeffgefhge
 evffejteehgeehvdffheefgefgjeekieeulefgnecuffhomhgrihhnpehgihhthhhusgdr
 tghomhdpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepvghrihgtsegvnhhgvghsthhrohhmrdgthh
X-ME-Proxy: <xmx:kt7KY9Z3OeaxujP_Sgp0HSPgcqW6SYc-R5U_hqt_6icAzML9SJRYZg>
 <xmx:kt7KY3YOrvFn2tXx5TCH8mraG63tXXqGTR_9oapcBUMurFcdBXuUmw>
 <xmx:kt7KY5DIyHFqdMsFJLj_mKJLDLeUF2kfnk2ed_4vd9TiymhP_F9snA>
 <xmx:kt7KY2k0RGBun_GkIQwBMwnTQXvgZWszohCENxOwIwFtiEbATsSw7w>
Feedback-ID: ieaa94438:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 13:33:53 -0500 (EST)
Date: Fri, 20 Jan 2023 18:33:51 +0000
From: Eric Engestrom <eric@engestrom.ch>
To: freedesktop@lists.freedesktop.org
Subject: Retiring the GitHub mirrors
Message-ID: <20230120183351.nl2ddcvmfz3aptwg@engestrom.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6t3merv2kptv55cr"
Content-Disposition: inline
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6t3merv2kptv55cr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello everyone,

For many years now, we have maintained mirrors of numerous FDo projects
on GitHub, under the following organisations:
https://github.com/freedesktop
https://github.com/mesa3d
https://github.com/wayland-project

A bit over a month ago, a new security feature in git started preventing
our script from updating these repos, which wasn't noticed right away
due to people being on holiday. The question that has come up as
a result is whether there is any need to keep working on these mirrors,
or whether they should be deleted instead.

Among the people present in this discussion, the consensus was that we
should delete them.

If you need to keep the mirror for your repo alive, you can set up
push mirroring from GitLab [1], and let us know by *February 20th*
that we should not delete your repo.

Cheers,
  Eric, on behalf of the FDo admins

[1] https://docs.gitlab.com/ee/user/project/repository/mirror/push.html

--6t3merv2kptv55cr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEV1Ud4VuWj2NBwkj2jY4xr8MkKKYFAmPK3osACgkQjY4xr8Mk
KKbMlgf/bvq7qrqnlHK8IHANtT4IyO5o7bJ2UnJkp2tSP1FnoQSA4lxWE+U7Q0yf
8PaHgjBGpW0co8A3hi798ihCw+T9AxkOFlGnPt/brIgomEP+6kPnYHOeMPEwGcJM
i/rXeOxcD/IahJ8jY3Z8C7B1TocHtKmSBsnm/mJ/XXYcww4BsfgMrEDt7LsllNKu
Rb1djU2/rQ3KieY/DSnRm3IaYVp7Bmy0cWHDyjeMgsYdpu3ZBRB/Dq4DBGY2Sg50
k+Ji1Knb9B6t56EyjEA4UqHlvOsNfrbBsgvr9CyL3IdWPlOI2XZrgMbZLizEfXPp
G1FHB2De5hhegVAKXcPq/wgZZw+A8w==
=8u8B
-----END PGP SIGNATURE-----

--6t3merv2kptv55cr--
