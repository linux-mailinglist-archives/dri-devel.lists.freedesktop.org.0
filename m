Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B912FACE0CD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E17010E143;
	Wed,  4 Jun 2025 14:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SWsXAzwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCBA10E727
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:55:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so30351045e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749048928; x=1749653728;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bFeYFxjl/DBtEkZai5cqMvrzK0TXtdhp23IyffLatWY=;
 b=SWsXAzwROnBz6j8YRM8PNwkhJhy2EVreGUShkG4HZFdcxbiq5AagEo79chGjZpGgLS
 11dboQE0+wpRwJtxCIy2fJZK86OqluOlePSixSXex6QYoqyBfcdzPwXAprmVsy5VNJed
 xw+KQ7dTYd/vrBUjetCV4eFmVv857OSUjJUGpWwVRdhBWO/RGkT5vN7AfgA6T9lVooL2
 aQXqH58p9HYuqC9pwgMJenLDAAyGuvt8gQLfxy/LbgIipmI8xmyHI9aQwVmEDU4SLGA4
 o/zGRC3h6zE4tyMKfJDNPJsS5X5n/3TWiAP/oMljcRMV0gSetqeqo8DFhloKDECRTThb
 h15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749048928; x=1749653728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFeYFxjl/DBtEkZai5cqMvrzK0TXtdhp23IyffLatWY=;
 b=FCI26aRHJY/vpE0/o9cASnYZNI35RYyGjoy4diPJ0g5lRUA5KVby2vDfb6nmd7WvBR
 L5fYacvMlOkxdceutDNBdrnpKXL4KM/RMa+NgJVcOMSez/c4YH3xT9I2aSDWqzLQ8Xp9
 S09GAMwL/ly29KMXrFHa8uiuGZPFBP4ZPfSGcnX8oQGb03kTpko2492FNPfwhkQ1iVe/
 JKFI1zugcB/6jlKuUdysgWwjTCDe5AY43zB0leq/HRogWOpx2MjSVk/RmEYl/JQdm7U8
 FG/Dg+ecmS+t17FGOMynVKCPavaHrk1nO/mmoz9X6RNClc+nuxb3g1Tb3+qDJcm36/8o
 FqCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3K1vcwlA3ZRzEpRfAFja4kyWEi8rPrTbXEWOUixttIp/nGtFwTUpwU+D4o5pf3Q+HzJtJ7IBnRRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Kqnok/W5LH1q8iK/M3Gv32OfjkgSO/+2HF5OLiOVf1HdfP1f
 roZWNk7pOOOBOcbv/n8dOto5r+gxD0xG8LkmbK0I/ibhxfJ0xGu27Ec1QYVm6M4QZdo=
X-Gm-Gg: ASbGncuC3rJF4BB90yeAgaX5a/jCQe6g3vzPY2kGTg8fx1t6AjCxxLMseLjN03h9cba
 wAOZy2FVyxRmu0JgVkMjVsUM2KxoRtkIAPUGuFLfWIgiGja3DBpjyl17B7Ndf0oOgdoPHmT8Snz
 xwbg4gYYI5WUHJ9I49vn3+JvLGLyQF4yHc5vbBgXc1EdehaPXzYnsuyTDcYzxO/ihiBHjpbd74W
 BYZhFu0YS51f4yOu31fUtnaJoyAWclSdLyYOAnYmYQoGeh3g5JhDsYjXE2cGnNr9SARJUFl/c27
 7I4QtsP6qVoZ2zik1Th5rN3PoFqbs99Sa2a62WalWWZ6G+rwedQHpZemhU0ZeDxz1HrWeDQy9pr
 IPPMRHLu9ReKDhVnqLg==
X-Google-Smtp-Source: AGHT+IHSxvzit4N1aBhjtuAEWmHARXYthRvFMKFDYBEwzs5x1pAkTMnA5Q6rw7l+Tyg1a3QZL/RlSA==
X-Received: by 2002:a05:600c:3b91:b0:450:cfcb:5c83 with SMTP id
 5b1f17b1804b1-451f51249ffmr21389665e9.30.1749048928519; 
 Wed, 04 Jun 2025 07:55:28 -0700 (PDT)
Received: from localhost
 (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f13:c804::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451e58c348asm43012505e9.3.2025.06.04.07.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:55:27 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
Message-ID: <od2jpxazsa6ee6fqom7owcgh53lz3wjjjk4scoe2mxjzrytl7f@jwwwxfuo4pkj>
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
 <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
 <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
 <2025060410-skinning-unguided-a3de@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4676vzu23k66bjlv"
Content-Disposition: inline
In-Reply-To: <2025060410-skinning-unguided-a3de@gregkh>
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


--4676vzu23k66bjlv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
MIME-Version: 1.0

Hello Alex,

On Wed, Jun 04, 2025 at 03:29:58PM +0200, Greg KH wrote:
> On Wed, Jun 04, 2025 at 09:15:14AM -0400, Alex Deucher wrote:
> > On Wed, Jun 4, 2025 at 5:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> > > > Already included in my -fixes PR for this week:
> > > > https://lists.freedesktop.org/archives/amd-gfx/2025-May/125350.html
> > >
> > > Note the way this was done isn't maximally friendly to our stable
> > > maintainers though.
> > >
> > > The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce02) is=
 a
> > > tad better than the patch that Aurabindo sent as it has:
> > >
> > >         This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d =
=2E..
> > >
> > > which at least is a known commit and has Cc: stable.
> > >
> > > However this is still a bit confusing as commit cfb2d41831ee has no C=
c:
> > > stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: stable.
> > >
> > > So f1c6be3999d2 was backported to 6.14.7 (commit
> > > 4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
> > > 468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
> > > c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be obvious
> > > that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting to tr=
ees
> > > that don't contain cfb2d41831ee (or a backport of it).
> > >
> > > Please keep an eye on that change that it gets properly backported.

I'm not sure if my mail was already enough to ensure that
1b824eef269db44d068bbc0de74c94a8e8f9ce02 will be backported to stable,
so that request still stands.

> > DRM patches land in -next first since that is where the developers
> > work and then bug fixes get cherry-picked to -fixes.  When a patch is
> > cherry-picked to -fixes, we use cherry-pick -x to keep the reference
> > to the original commit and then add stable CC's as needed.  See this
> > thread for background:
> > https://lore.kernel.org/dri-devel/871px5iwbx.fsf@intel.com/T/#t

Yeah I thought so. The problem isn't per se that there are duplicates,
but that they are not handled with the needed care. I don't know about
Greg's tooling, but my confusion would have been greatly reduced if you
reverted f1c6be3999d2 instead of cfb2d41831ee. That is the older commit
(with POV =3D mainline) and the one that has the relevant information (Cc:
stable and the link to cfb2d41831ee).

Getting this wrong is just a big waste of time and patience (or if the
backport is missed results in systems breaking for problems that are
already known and fixed).

Best regards
Uwe

--4676vzu23k66bjlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhAXlsACgkQj4D7WH0S
/k5tSgf+IT+JU+iWWruPiKMIZvDjrGgIiyUzCYKZ4zhwS6OiRR+0Ct7BNHmvfyz3
BQGIVanJELGBUIJ7vT2wIXTaO5NSoZPD74vA3CZwf96QCehGEMsdj3TPTNPQdp2J
cJn0EFo0GpoAQHM4NRycogPsKTNSRhLUqmBqeqq6j8jA0z5eefctPMdf3gtU27+n
7guSJwQ8bbOl3BT36Oa+0ZcGrtNncIMovoYnGZY+9jI3dA4SZtT6rnf8i502K+eT
odcn+CgkEVBY805MDH+LM2G3h2WHAVFWBKe9u9to0lfSmw6XMcJj+t/h1ZFFpfEE
UPHXmTn9BePLuYCI/JXa+aGWx56BYA==
=OblD
-----END PGP SIGNATURE-----

--4676vzu23k66bjlv--
