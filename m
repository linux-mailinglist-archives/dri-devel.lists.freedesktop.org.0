Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133D4CB9C9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37110EBD6;
	Thu,  3 Mar 2022 09:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7CA10EBD6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 09:05:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 289AA32003F4;
 Thu,  3 Mar 2022 04:05:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Mar 2022 04:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; bh=j
 d/D3eXjGYTd37iCGQN3di1Q9aNYeSKu4Z8w+Pavvxs=; b=svcSzFeuHBjys+R+f
 D5Pl2JrUERkOfhbQBZiTX1AnkJzKVU8/LJD26H/TdJ0agxDIVIMgbBaD0yRswsz6
 2tQj2DL7hOc4lbSttQWX0gZwveYvWBvcj+nF/OdoVG6KQM18iymHmuD0ZSYAfw1J
 nNnBUxuJ1B02xLhER4xiimnedTT5vzwrr+wQzSnSNfJ9pnBAVNqZeYlCtMuwKohw
 E+2BbFEARKsAHpOffsdYphaKBGju/++VQzc30m8zwIiaGeKxVxXzkzWQ3BPqyjSx
 UXsTMBINOKvWYMU6gXZn872vEfJNsrlxFh1WHiDJIxqbnHtGH5ZhI1jgJWf2z+cl
 pVSMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=jd/D3eXjGYTd37iCGQN3di1Q9aNYeSKu4Z8w+Pavv
 xs=; b=lsIvkPabUasLDw7DEBSYPAu7/gFS6H8Q75LhnD0bdsCwm8Q7I6OQnY6Zs
 ud9i/LSaxEGXhfEQQEtHy0I2fMb+epnoHhZJNZJbsalvrE5Zy3sXeKgzHeuTjqpQ
 DkSMFjFcFsHX3Lm8keZtlT6xmSW0jaOonUgZvZnOv4zJq2i84dhZolh1qkLL2nyf
 jLyjFpI1dIwHn7fp44M7NoFdMpLlGSDkrPKxZLU2iNg7lJQ8wmRiEaqu681xXRsh
 8uaDyxKogBuyxHdsmUiaIQ4u2kb88Gl8yRuIfh/+eVOVCUNDX7uUF9wAgxcXqhb5
 dy30xIejRgRz6j2uGZeil1c3nUgmA==
X-ME-Sender: <xms:xoQgYq3FBAcZPgI6Zn4CQ_Adj_3rdrGw8Xj2Hgp8guN8DYTkxFeHuw>
 <xme:xoQgYtG0E9A_-p3d-nucf7eab8TmcWh1e4TVddvcLHBxhFaTR_UtGnoipCA2LpI9B
 ewCYe8UVJmoIx3tIdw>
X-ME-Received: <xmr:xoQgYi4b5DJPS5vmep26Ff1n5WH5Jn9cPCOlgYxy3UE-uhq4jfELhCPzt2_tHxXlP3K5IIruVz78DqXAKpXnNAKSy_TxYrcbbsN_kXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddthedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderre
 dttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
 nhhordhtvggthheqnecuggftrfgrthhtvghrnhepgeehvddvffelveeiuefggfeiueduvd
 fhfeeuhffgleejleeghfdvgedtveegleeknecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xoQgYr1S1tIOkEJjRNFdkljFJtkVKvx8w9KY2yZyP6kTfXXtlbFhdg>
 <xmx:xoQgYtHMFryfJ1UkRKFkUSKykdiIKEtTLrQoAaBE-WblsgoFGr7CPw>
 <xmx:xoQgYk-XSyECY90NcVXar7UhSQpX3F9xFyYffjt151kW8VnGZxiieg>
 <xmx:xoQgYgMwPOTk3ViDpzcvsd2SFGCkkO-YrOL5Nr6BO7ImiXMBFLsQ4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Mar 2022 04:05:09 -0500 (EST)
Date: Thu, 3 Mar 2022 10:05:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Mandatory Test Suite for KMS Drivers?
Message-ID: <20220303090507.grenwdro7u4fzmoe@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gjbp5kld2r3vrbfj"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gjbp5kld2r3vrbfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Back at XDC we floated the idea of creating a test suite for IGT that we
expect any KMS driver to pass, similar to what v4l2-compliance and
cec-compliance provide for v4l2 and CEC respectively.

I was looking at the list of tests, and it's fairly massive, so it's not
clear to me what tests we could start this suite with. I can only assume
all the KMS (but the chamelium ones) and fbdev related ones would be a
good start?

What do you think?
Maxime

--gjbp5kld2r3vrbfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiCEwwAKCRDj7w1vZxhR
xYEPAP4wWX/UvJPJGzZxQArnd78Hzt17r5fwycxoIW4ED+mWdgD/R1LIodCabRyO
+6j6QSNqtNS3m5ahq9W2890Dq7WoxAE=
=wmlu
-----END PGP SIGNATURE-----

--gjbp5kld2r3vrbfj--
