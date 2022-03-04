Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D624CD6B1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 15:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85310FD8C;
	Fri,  4 Mar 2022 14:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46910FD89;
 Fri,  4 Mar 2022 14:46:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A021F5C01C1;
 Fri,  4 Mar 2022 09:46:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 09:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; bh=Q
 S5516DKEBiGB8NpqE0iuOp43VBs+iZclbImS32U9HM=; b=qJU7+v192iJWy3iAG
 w91sjmGQLuGg1w2Qz5IsvvM6zMaNzeDIOk32rpJR66wYPVe6CnHLOGjCaLQHrCQW
 UCTw4vvAu9Z6PDlBHuXkrfgHwaHXoSyDwEwsNYRHTXJ1HELBe/ycDw1qr1luWs2r
 J9j3kNav84XiDRJqiG/dgn4gQvrPkk1fcisoXvSb7lsgX3N/wBpZ1z0KRtHvsFrB
 jN6molDQ7oQXQ6voNG+Q8BBhTRJMSJWd5nonfcRuRFkOyCpB8OgQ0h4O6fqJz6PT
 YMVIhcW2Ldu8JrrsJjGfxaB6XQi89dFwAhFJCwcgW8dnyrR01ONzcLTLBeMtMZdi
 T/Dog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=QS5516DKEBiGB8NpqE0iuOp43VBs+iZclbImS32U9
 HM=; b=kyPQXeBLXdHmv8vzamC36ESYCZJo/KKxF6knRRqINl7ZfL0KZE1DvGm2j
 OTJs/ZUOmjFzsd0KnbsQe3oJTWztahw+6xVLH8/eXEvtACcN2pom/Q/3fci8/s3B
 TQAz1RC+xwP28XgFKJyiM/uv4jqRtj9T0v9JTDwbhPgUQIzV0KVaUHXcYieUnEHa
 GE4ym9nItYXKuEsdwkFjm5FUYWuTnG1GKvmQRgG7fvspyTwSb8Mk8c11Dy667pAx
 DK3P1xBsjOV0FdVJlQRqu9lF6ONeQNWmFk0yI25l3Kj6eW0ouLzV2yoSE0dAYBvY
 /4YCbN5u7n8t5E3BUWMyXqMcnfJvg==
X-ME-Sender: <xms:MSYiYkm3P1rdJ230n7Xp4Hqo4KA_fcObFB7PBbmc36nhwLDJsauVng>
 <xme:MSYiYj28DjmL8nA8BLhdP9XsHGgPjUDAF6BI2i7GQZqNCEz4RrqHNp46kd_wHTSQ3
 micke_0hiSIecVaQTo>
X-ME-Received: <xmr:MSYiYipMAe7x_4FCnsCxv-MUaMwd2XjX9i04iRIQYagIRSui1Osk--wgdKaNpmW2Kg-oyl0Cg-j__9XQIQD6OQbqhLvsD92Upf-nJNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeehvddvffelveeiuefggfeiueduvdfhfeeuhffgleejleeghfdvgedtveegleek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MiYiYgmWlmhoCzqleo_P-MI_jDVhkyXkpUBtg8X3XoROU7AgCQXrMw>
 <xmx:MiYiYi28eS0BxXvp7ndohA96ze6Eyuna4NW850oV8EotaN54KH926g>
 <xmx:MiYiYnspSLyALhY9ZV-QFOEeVIjYIFvveayTKneZewpxc_S3zIPCBg>
 <xmx:MiYiYsqAHYJfwMcaecdhTPc7uQK-HU2FABw28fejyqkQ3J7lOP64vA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 09:46:09 -0500 (EST)
Date: Fri, 4 Mar 2022 15:46:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Writeback Assumptions for XRGB
Message-ID: <20220304144607.3pwfwhxf4zsckan7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tyvx4fbzag6vl4aq"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tyvx4fbzag6vl4aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The writeback-check-output is currently broken on vc4.

It's in part due to a bug in the kernel driver that results in a page
flip timeout, but once that's fixed the test is still broken, and I'm
not sure how to solve this one.

Indeed, the frame comparison is done between the (XRGB8888) buffer we
assign to a plane, and then the buffer we get from the writeback
connector. We then run a hashing function on both buffers, and compare
the hash, and those hashes won't match.

Indeed, while the input buffer uses 0xff for the X component, we'll get
back 0x00 from the hardware, and thus the hashes are not identical. We
can force the hardware to always set it to 0xff, but that doesn't seem
right. It would make more sense to ignore the X component entirely in
that case.

What do you think?

--tyvx4fbzag6vl4aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiImLwAKCRDj7w1vZxhR
xfqDAQCHe/LJ6cysCJ/xhHmCFWNFAFn2x7dku1A4EmRNN4fznwD9FhqUWIBaCQe1
oCSOZfWhdamXjAen8Iafi2fqn8a0cgQ=
=oKRg
-----END PGP SIGNATURE-----

--tyvx4fbzag6vl4aq--
