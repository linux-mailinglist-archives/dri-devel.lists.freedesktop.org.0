Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFE8674E9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEA610E584;
	Mon, 26 Feb 2024 12:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kYR60E33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3564F10E584
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708950576;
 bh=FdayiuUa0lPM16SkkBcVAS345PVinGNRNV8BhjB+2Z8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kYR60E339+DP4Z9qcK/T9Tj7OP2p7wKAx7rRTqae8QUNhCA8BPYrkIGvrbRIFY6AS
 tTHw3LdBnnrCxZobHWzkIt5n7rJNQ1dhPXZDe1f3tEIYHsJnLFhSzgWV+G7ejNvVTk
 hA/L8+aH4VQnnPEZ4Lh6ojzo3OeGi0cSoveU9HaMRiJfMr0d5aMh95bk3a4VFy6mFA
 Wz21zZM9bMEzxpnPJOTq4zO+XVkpBsCZZvLO2q6RQDjFcydB/MH+v95F6tt8BOwIug
 C2j4UfEK0sWlyFfT111iU5cQ73M5soi+3PCg5GCrqH0FjUEMUQ0sXxfSEc5HAuuoYZ
 B1xaezf3MJdDA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D5EE137803EE;
 Mon, 26 Feb 2024 12:29:34 +0000 (UTC)
Date: Mon, 26 Feb 2024 14:29:33 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v3 0/9] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Message-ID: <20240226142933.56a60970.pekka.paalanen@collabora.com>
In-Reply-To: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dkfPYvU.MIx4fUuMxdI2u57";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/dkfPYvU.MIx4fUuMxdI2u57
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 09:46:30 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> This patchset is the second version of [1]. It is almost a complete=20
> rewrite to use a line-by-line algorithm for the composition.
> It can be divided in three parts:
> - PATCH 1 to 4: no functional change is intended, only some formatting an=
d=20
> documenting
> (PATCH 2 is taken from [2])
> - PATCH 5: main patch for this series, it reintroduce the=20
> line-by-line algorithm
> - PATCH 6 to 9: taken from Arthur's series [2], with sometimes adaptation=
=20
> to use the pixel-by-pixel algorithm.

Hi Louis,

I'll skip v3 because I was still reviewing v2 while you posted this.
I'm done on v2 now.


Thanks,
pq

--Sig_/dkfPYvU.MIx4fUuMxdI2u57
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXchC0ACgkQI1/ltBGq
qqfAhQ/9HtmiTswygFvd34aYrcwIZL4tkNAGO1m9GO/tg0PCt3/rF9fDdJBJgaFq
lg+gSqQ1hlNNcCYnveRE1n+Py/JleVrBBVWMKZAGyNeS0MX7w+7rCZvY9Ekn3lB2
/sJrdXkIVz3egqaamewzgxaYcUyefSpscdoWwMg/peXOQ3O4HgfCtQoQ31GYBbFT
qwgOzunbnSNaxMQJyzxx6tbTwuLyAagjnnPD1nsH9PX2M/1bElefVyvKee/VNQVy
CDBkdJ+M3kMNbEpJflXTxNJj3NEZvoMZrvZ5yBIL9N1pv9jHo62iDoIyWxfxz+JR
YtDktw06mdBO1qACV7RMoye32q72h0bC93vixoUFpUdoi5jJhscMZI8EXZIpeoYQ
3oTYC5JDWWL/QaoE/1KhxBtEX9MBY1pOh65XE4eaXnEMZVpIVBdThQE042K/BHPe
0nJBbXHWK7VOx9UoeQJtXZViwgEIepVdAqaLVkF7XOW8ki5EJaQ8ePjq2RVN0oEc
w1yeuOibpiQ7PutqhmrYEJ+/5yQZnzeJjveyriQt2ZAJHRz4fD0P8nnTMmfYQ4pp
i7R/LI6f75XHmgyM+cavrak7YB7kQCqour0xqYrF2VHCsXbzVR7UK4qfJJafQYKx
tfq/SuEiQVmnHd311S5ZPTRugJHXdEAr796UWEn6hC7nwb50sWI=
=2siJ
-----END PGP SIGNATURE-----

--Sig_/dkfPYvU.MIx4fUuMxdI2u57--
