Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993D14384A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B49B6EBE4;
	Tue, 21 Jan 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2020 18:18:32 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEE16EABE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:18:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A4A521D25;
 Mon, 20 Jan 2020 13:11:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 20 Jan 2020 13:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3eLX0e
 f+TjguMEDNQ4OqQg1MbtOe1MZnC7yyN6gjokc=; b=J7JuvkDQay6+NBdblOPewo
 RfJhDS3JUf0TWtuMcX/K5jGwDS+DYQXZbSyfL7aLx3XJVHJc86kle0a0PQoWy0zb
 uRrXXyN+/XIX2kMU68B40hIjoq0pIjb3qUD6wBPFjfPgyYbgk+24BnVniW4cXVwk
 cM5+3hKCLbGB2R0Q/szbK95h6NXXBihjkAlaF6sDuSQHFkW7fIVcCyGS9wDW/ArG
 M80xbcpEbNLO81Wla/bfKr59DUUfKx36SudmTR/bX4Awzg9zi4losnWMUlxfgobV
 8v/9sSkmkqu4hGGegfoz2YYGFPSViNbJZGWRVI7OdYeNvCMBx34gHEHGIMnBT/LQ
 ==
X-ME-Sender: <xms:Zu0lXslUU6-MGtXpdNaemRY51oWdb94kEKtoBTL76xtyU7Pg50dm1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeigdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpehlihhnuhigfhho
 uhhnuggrthhiohhnrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Zu0lXnoaJbkd_uCCkRJHVs_Qtq_KtTQ5GoLG4AUtHooRQGdGxzAetg>
 <xmx:Zu0lXmAbXycj-ZHg1cCg2yo_pH2uZnhA0aA3LsppuUu2sjMbEawh8g>
 <xmx:Zu0lXiElReVvpHFvWUg6rn9c3T1GOB1MGEp5OFSvKmPuSKe37bD3Ow>
 <xmx:aO0lXkT8fumM0nUUeav2lWoz3rCOwjsGNqmDoUQFvyuhGJvG4rGAGg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7280306099E;
 Mon, 20 Jan 2020 13:11:49 -0500 (EST)
Date: Mon, 20 Jan 2020 19:11:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: wait for references go away
Message-ID: <20200120181146.GL1314@mail-itl>
References: <CGME20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c@eucas1p2.samsung.com>
 <20200120100014.23488-1-kraxel@redhat.com>
 <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
MIME-Version: 1.0
In-Reply-To: <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0395089813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0395089813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p0HNO2YbtFeVXwJ3"
Content-Disposition: inline


--p0HNO2YbtFeVXwJ3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fbdev: wait for references go away

On Mon, Jan 20, 2020 at 06:51:17PM +0100, Bartlomiej Zolnierkiewicz wrote:
> I guess that a problem is happening during DRM driver load while fbdev
> driver is loaded? I assume do_unregister_framebuffer() is called inside
> do_remove_conflicting_framebuffers()?

Yes, exactly. More details here:
https://lists.linuxfoundation.org/pipermail/virtualization/2020-January/045=
026.html

> At first glance it seems to be an user-space issue as it should not be
> holding references on /dev/fb0 while DRM driver is being loaded.

How plymouth would know when exactly it needs to release /dev/fb0?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--p0HNO2YbtFeVXwJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4l7WIACgkQ24/THMrX
1ywYwQgAimDeFDny3c/ar866L78Bc5TRyJynEGGbFlnb9BR/gCc9gpS1tNCyemPC
keqTV3PxXHMFaTPnrJi2ebuUP+Lmj/YOK+tCXB8+ipwMs3Z1HZv1DR7D4s3gDDzk
To8b4e0RnxpCdQJ4xpOoWL+XcueHy+RB8FtEXqXyVJTW/bJWGYGnuyQVSubBKQxL
TyEp6ASDocGLFX0QsSrdVEkuVF/PMdfbyu6Th9MwQMtMmd0s2BuepAfJhDP3js1f
JlMnL3N1wscxFOWn1TSAGywTMbAjwRctGwrCcULMDME2STVryuH0VNWpapKIMQpj
PUlDFH5CMVOKGjXo2OkywONz4gP7kQ==
=2hqv
-----END PGP SIGNATURE-----

--p0HNO2YbtFeVXwJ3--

--===============0395089813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0395089813==--
