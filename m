Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE063A1E3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B210E1D6;
	Mon, 28 Nov 2022 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6FA10E19B;
 Sun, 27 Nov 2022 09:54:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6A9FF320055E;
 Sun, 27 Nov 2022 04:54:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 27 Nov 2022 04:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1669542868; x=1669629268; bh=/nyVVkXYpc
 LUQ3I1Vv0EYGMVOOMOKOiSTDK26qoDx+E=; b=BaMQ/i9NyAg/HE+XcH5mwJlt6n
 ySmD4gLeNolVe+8M756wKMTpi1Ds9BxwkV3PctX+RBnKdVFTmK6V94j68ZE9JKRP
 G5aBsxYGBRcVl61aFPMJYiFqDe0ncncQfhQASB9H0r59KgThV4/Vd0RZhPFrVqP+
 miYlfBa+/f7jw/Ct77t7HlKXTiXEAGJLuwKhxUdVyzgZSxQB7gO4hXPFltINQPHQ
 j2vsvqvD8OqrAKi02/bHiQtwMoJP6EBQ1L7cgR4RrIWUnvMf9MhSC0+tsdjJ+e1Y
 B90K0qFmvC5wAymY+3DN9Cu/mGCJoJ9za+u77eptfAwgKIrOOKcxHnf37f9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669542868; x=
 1669629268; bh=/nyVVkXYpcLUQ3I1Vv0EYGMVOOMOKOiSTDK26qoDx+E=; b=X
 vP9zqvZXecROyVCg+SvYg2zYzBp7ysZx+B0LE7fv77lyaP/quIzwrnfQ42QLCrWA
 IOf8aJVQgNHQHtPGv+4UHlMqX2pE1xDYg2pjdYiOudBlluTe2A6VIyRVUe9l+rN/
 6cS66NH2qBlP6v3pZDbQDFyiIrARTpsqOJigI3gNFGOmZdAba/3FXvbMXY+4i8nA
 GHowoAGjOYbTOZvfwKlDstpC6MWK5jhtfpmdTXg5h7aOYoD6Dqh1GTST/CDy9vTA
 xrDHXtxg45xfujYf0Zt7N0RvY+cFQHd+YG/9AN/GPUIvRK2vRDdxnxTF26CB8sDR
 dqT5jYLfa5gHBcVhj1XnA==
X-ME-Sender: <xms:1DODY6kv8Bb7iwy1hgyjykDH5PhNvZ2NYJM1fEQgwenRJ5HOywXudg>
 <xme:1DODYx092FTFaymHqWBuQg7TFKflfMJtvPRzv0njf5o_gIMuPElwp4zKDbZrOVFu3
 WDcwFhv8Fh_5MQ>
X-ME-Received: <xmr:1DODY4prFttelp4OIb0Cgd5GKBkqcYgmWvzgG80gVJHBC_Ho0xzkVGqYVCQe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedtgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
 rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhmqeenucggtffrrghtthgvrhhnpeevleelvdekteelfeehhfelvdehuedtjefh
 hffgiefhteefvdejieefieekiedvveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
 hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1DODY-kxRYGerVn_8cpc-Sebxdqa16IMm5b0hTmkHrC-PvZuVrqYPA>
 <xmx:1DODY41aXYJjQTKFjbCi4NBW5vDtD3K-gFaTfe_64hcwXC3BOA2EXg>
 <xmx:1DODY1vY_KF_jzLKc3t8i9FxL2W_h-4ztjoZQr6sVjws79bxr3KQjQ>
 <xmx:1DODY2BMci_ghf0Om6u4T4WAXNfZuSCSJjNO1fWdm6QiC9J5q8Gj7g>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Nov 2022 04:54:28 -0500 (EST)
Date: Sun, 27 Nov 2022 04:54:21 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: christian.koenig@amd.com
Subject: AMD GPU problems under Xen
Message-ID: <Y4Mz0glMNwDPaFPO@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/dOlGWuXhLnYEtzK"
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 28 Nov 2022 07:18:16 +0000
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
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/dOlGWuXhLnYEtzK
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Nov 2022 04:54:21 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: AMD GPU problems under Xen

Dear Christian:

What is the status of the AMDGPU work for Xen dom0?  That was mentioned in
https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.=
com/
and there have been bug reports to Qubes OS about problems with AMDGPU
under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7648).
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--/dOlGWuXhLnYEtzK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmODM9IACgkQsoi1X/+c
IsFyBA//fSTtWGG9syzbN2dIq6XysSBSQgk/WUqfRDUHzHfCgceUchls8HEAy8wG
nc95JrlwBPclJbepOWEpJBBD3OlMJqwga4XhIH/h9RP93hnPzEBpNNNP7zDiBqHX
zi4+zE5ZepVJKbGMF0Yo5TNJIbbZp7XuGgmXwGCNf78eogUUjmqPcsAzR5FgqM0B
UqDZwWy3yp8R/jxNgi5NAruZ+8p+1o3bKLVaAIzs6lKonGXqH1umqsEZuuKoL8K1
+TiOLlamCi+LwInsYPjwTYGYC8cvcrQ6ZIeaK4SslC96EXI/Z5SulTVkpxblw/br
NYnvcDBSSpbI85b316UBFoLXiP6jlsznnV5VydqEJm8LHV1oGPLeqJ54DE7rFZQe
AzrOSVgJKAPy4uB6JuzDZAWjhgYjHUbagwByuqujlijkqP7VN8F4CI4fEmseP1/a
s2zes6k9h1hBKgNzHlGG8Sh/u5dZz6sMnvyPHFBNpvm1mXRTuTTmi3C4G5wZ3oID
mPCoBd/SJHMPj9EW9wOEqV2AVCltxeEMgCqO1EYUkANhtVIShtvRwIZ26En1zYjv
t/HykGEHYQuSGW+tInJ2Xbt449hSNtvy7TMQcp/2qKDXYFYPUgNcQtzBiTribJBH
yoDKfepvU7ojv1cRs34/GHC3g2CV7mSEk4habNVv++rkr+Ip4Ac=
=/WPx
-----END PGP SIGNATURE-----

--/dOlGWuXhLnYEtzK--
