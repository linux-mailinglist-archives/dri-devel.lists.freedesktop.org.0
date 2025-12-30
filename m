Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F7CE8AE8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 05:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19510E67F;
	Tue, 30 Dec 2025 04:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SSa3dxvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E910E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:37:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a099233e8dso79702685ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767069471; x=1767674271; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f+WzwNYNhRdBeULGjK+If30c9dR6hyS9om5xAgt9QlM=;
 b=SSa3dxvOqP5g2vVBoiQZqs/bTc+xOGk3jAvj+dtFReNfW+G/PwrJHbnrqyMMKux/6a
 j1iH0n62s7U+iQFMVrV/tRG2NsGZgRH0Ef0kvCq88f07ChwdU/Ag1D0xM/Saugw0QO/Y
 FvZ/EFIPeVQiVSSio+gmRD72Q+fhqRO+0PAciBE+XWDrZypIAVI0nOek/RIl+/TT5Liy
 Mh6MonAa2Dc4G8Xj+8gIveDAkOSIeyrcCXmTJPUKUvRWqgtYNd4gqVV1Q7SygoqYGGSS
 hn6I1pYpUCctEDs4MXIIGovCb8M0w/XwXsSxyfx/oGUK5sCIL5WsYBL5a/qG10CnwhoG
 yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767069471; x=1767674271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+WzwNYNhRdBeULGjK+If30c9dR6hyS9om5xAgt9QlM=;
 b=HfC2Jx/4mHuhRT0+CEKqU6Ot6vWYK4o2PeY0pG/UdLmCAPhwvuDqRVpKGGqAJyDreS
 NffkCuOEsK3XSYeX8fiEvT5F7OMq15Uq1+VLLMrMEkIlZPc0Lnq+bo9ZrErCeJxfIyNE
 qiPE/n2TLiEwRGzzFmkiqa8aUZcAastGrjOJdi16Of0wD7QcYc8HnuElNOjqohpIxX0c
 hE12LQSCicV7SOGQLSp/GejtvoMBzg6Dsep4EPt2stAvWtDNe/bPhIgPuh3TRXD4REb4
 9La6KjxOwwFGzCnsvWFVvVucLOjbP57Av5VJQ7Ig2SHgf1xz9erFtyFcCNyfeLQmnyeA
 Exfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCunEXnyJS/d0G2eogAM7IjF/t9ucha5n484yhK4CYnVjuuj067Z0ycwMl6Bt685Erl4kyBPcJBHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkX/sxcfvgL+vtbGaDWyAKjftgkL4Q21zhjOyH9TarkVLNGJ1N
 f7bsLnm0O6tNoWP4oVRcHuoQ75H2dj8Rz4FXlofVFXyIHppSGg6JlleS
X-Gm-Gg: AY/fxX6gM3DZJhvtc/ydgF1UWD3FT6Jkt2AOs8q+xj7yHv3lN9HUu97Ql50HpgibLLe
 duSftHnhM83a9y1pSwbGQ1uNeEJ0eAgkcpg389zNwzSulM76e4UndP1p72dbS5V4hS70VgiDPWn
 h+SJ6n7LIFY+e1Z3RYXT86P9+onvrRo4SYdE/F7g6Oom4UNKTvikdv1FygnkC5yCE+/h0zBgQ7x
 PnO09j6IvwSt+CLO7sunWtzlP4YDyDz3xc8bS1cd8nVl52UK6sMb/bkSD+RCyLhbqsV3T4Wnbfp
 cshL5mSDras/k2tPZAkrMdPZV6Ya7HM4DDLpztyzYYTAqIE3Edax/MdkWcjDUrohZZqhsItgzib
 QMtVJuDaixO/YvYotNKoEYkLj1An+zXpnjmDFUeMvM1353LIFR67qc+HECCj1hv4H2iouL0YbcO
 R8zEDxjS/z0wg=
X-Google-Smtp-Source: AGHT+IEKeUoWYu2GFVgDFphydhGZMiQ90h/N0eJheHWd5u/8DmEeLaYgUO7ghOlfSva0c6ncPwEjiQ==
X-Received: by 2002:a17:902:cece:b0:295:6c26:933b with SMTP id
 d9443c01a7336-2a2f2205155mr305888615ad.1.1767069470488; 
 Mon, 29 Dec 2025 20:37:50 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d7754asm285954025ad.100.2025.12.29.20.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 20:37:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id EC9BF419B84C; Tue, 30 Dec 2025 11:37:46 +0700 (WIB)
Date: Tue, 30 Dec 2025 11:37:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aVNXGrqgNJsnyMsw@archie.me>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
 <aUyMiJvJX1KhffVb@archie.me>
 <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/cvQIoAKPEfuZFWr"
Content-Disposition: inline
In-Reply-To: <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>
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


--/cvQIoAKPEfuZFWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 04:33:47PM +0100, Louis Chauvet wrote:
> > @@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
> >   Description:
> >           List of supported formats for this plane. To add a new
> >           item, write its fourcc code prefixed with '+'. To remove,
> > -        use '-' prefix. Use '+*' to add all formats, '-*' to
> > +        use '-' prefix. Use '+*' to add all formats, '-\*' to
>=20
> Hi, thanks for the fix!
>=20
> I only have to escape the second wildcard? Not the `+*`?

Yup. Try make htmldocs without the patch and see.

--=20
An old man doll... just what I always wanted! - Clara

--/cvQIoAKPEfuZFWr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVNXFQAKCRD2uYlJVVFO
o7xDAP4oC24X/814znpE6C9oS8vLeRm3x+JFWHtZczhWkK9uigD9GiLsaigPdyYr
VIPUugXHtCVB3MOHE4qqkFF+7PCK6wc=
=AfbL
-----END PGP SIGNATURE-----

--/cvQIoAKPEfuZFWr--
