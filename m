Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AAACE820
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 04:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E6410E226;
	Thu,  5 Jun 2025 02:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GDcJYXVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F2510E226
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 02:01:19 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b2f0faeb994so480301a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 19:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749088879; x=1749693679; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B4XY4QyVzfpslN+lSr0r9kDuHIIiF3VbHDAvnPwfeec=;
 b=GDcJYXVhuFTiPreaalLhCIvKu77HpZU6GIhsV5hNlh7VmEzZX3/YnesWfmHsoMdTNt
 aQHSoNfE6pwOAjospX3UgEw4INl91CV55qk8wkN8FW34t7MtdCRMZikkl51eJQzd/H86
 858+fMPT98gNyiZ2SkVR0mIBlx5bSg4XUmI72uSAVA20iSsId7JUa3ijD3lkBF1zwhPa
 3imZ3dj0xYmpyB4LwuubhHqUUeVC86z8H10x7Qw91tRDg/9eYJZhJFMaAwCJhTB/BvPV
 ILdjQAvl2CoypDlFL1rAzyD4hKcutHsoiUYITI56UJ1By7KHsOKsmOX3F7f+1Lg7JTcY
 oG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749088879; x=1749693679;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4XY4QyVzfpslN+lSr0r9kDuHIIiF3VbHDAvnPwfeec=;
 b=WlHuziQnt5o+d+JogJzK/7iOIl6EmpOcBeu/l26OU9vVk2uC28IgFnDH8oJvRkB6KD
 HVTIji3/6+WjmtHXVHMoTEQx7Ap9zp9NsQAhAgkkDWs8oG8NrdQ/qcPIsFdN91Lu3xwQ
 NbPKKEv3p50iNwIq5pUz5m1Gde7pfzUWR+A4aN687X7OqWBZoini6Marc5kTkSU2z5Ex
 T3po5rdBpsU14lRexyouZMaA+YMs3eV+uaRGoS9526vg8FJseDSVSWLgufuAUe2vQodq
 FMZSbC/8YcV+GBQHdpPx74AgKcEw2jj4EGfQAPtDPdPYH/FAgfT1vrvJHsmODqhjwj4R
 WGUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjL6dt+IpFWWNx/DmZGmKGMjP2+D5tvc6qbyav0L0sEeWpfgbFGpdlovQPNPhFpTkdYLfEbcgJrXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpBAq4FP0tHhnRuMO7lBmGo32DVR7ppQmi+TM79FVeUDP7R/ZM
 cWIAuOTwhhSmFibu630hbDxRTvu3ja6KtQeZ2+hvkePYMxa6h0fFQSx0
X-Gm-Gg: ASbGncs+ahAEALaVREZ6FNTBFx8k6eRoFpZcQ3kCcdtWVfSgEh8sFy2P7P8AZmrZd4O
 Q06zwCLW+JJc1bl1BL5nivfzgWjUjaig4P8WeHjZD2xuJM6URovmS25ApZPSkm0/NneOWhqaxrq
 zpq/I01K5v/od7EcwYg5pPV0oERaYj6cjB3KbkE3VuAs/8HcwwV7fwOssSlBr3Nu31xtx2zR79f
 Q1k9tYyu6wARjGv86nDLPHe98qsgzIIVs6jevCS827Q4tm24jCzOAvW0kMaGFmh5VxKfLELyKoA
 FF5jWZWfT3kigePDkZ0Wd59US7bFB4zOBWauaj8hWHxHV+ZaIys=
X-Google-Smtp-Source: AGHT+IGyZy18YKprGlTzoo34XE4Q33oI40JvIwcZGv4ymlfnzos5D3EVaruPWivmKI3pyBJL2DdAxQ==
X-Received: by 2002:a17:902:cecf:b0:234:8ec1:4aea with SMTP id
 d9443c01a7336-235e1200863mr66986925ad.52.1749088879071; 
 Wed, 04 Jun 2025 19:01:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb297c8sm9365315a12.26.2025.06.04.19.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 19:01:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id ABA104209E8C; Thu, 05 Jun 2025 09:01:14 +0700 (WIB)
Date: Thu, 5 Jun 2025 09:01:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aED6ahMoKjO11JVv@archie.me>
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me> <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="esmnYBZSXAl4HZ/C"
Content-Disposition: inline
In-Reply-To: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
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


--esmnYBZSXAl4HZ/C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 04:37:27PM +0200, Simona Vetter wrote:
> On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> > On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > > Add an overview diagram of Linux DRM architecture for
> > > graphics and compute to introduction.rst
> > >=20
> > > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > > ---
> > > <snipped>...
> > > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/i=
ntroduction.rst
> > > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec=
52a45d0f3f4561424e0 100644
> > > --- a/Documentation/gpu/introduction.rst
> > > +++ b/Documentation/gpu/introduction.rst
> > > @@ -14,7 +14,45 @@ including the TTM memory manager, output configura=
tion and mode setting,
> > >  and the new vblank internals, in addition to all the regular features
> > >  found in current kernels.
> > > =20
> > > -[Insert diagram of typical DRM stack here]
> > > +Overview of the Linux DRM Architecture
> > > +--------------------------------------
> > > +::
> > > +
> > > +        +-----------------------------+
> > > +        |     User-space Apps         |
> > > +        | (Games, Browsers, ML, etc.) |
> > > +        +-----------------------------+
> > > +                      |
> > > +                      v
> > > +        +---------------------------------------+
> > > +        |    Graphics APIs   |   Compute APIs   |
> > > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > > +        +---------------------------------------+
> > > +                |                   |
> > > +                v                   v
> > > +        +---------------------+  +-----------------------+
> > > +        |  User-space Driver  |  |    Compute Runtime    |
> > > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > > +        +---------------------+  +-----------------------+
> > > +                |                   |
> > > +                +--------+----------+
> > > +                         |
> > > +                         v
> > > +                +-----------------------+
> > > +                |   libdrm (DRM API)    |
> > > +                +-----------------------+
> > > +                          |
> > > +                          v
> > > +        +-------------------------------------------+
> > > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > > +        |     nouveau, etc.)                        |
> > > +        +-------------------------------------------+
> > > +                |                       |
> > > +                v                       v
> > > +        +----------------+     +-------------------+
> > > +        | GPU Display HW |     | GPU Compute Units |
> > > +        +----------------+     +-------------------+
> > > +
>=20
> I'm a bit late to the party, apologies. I'm not sure how much use there is
> in an extremely simplified diagram like this, least because it's really
> incomplete and leaves out the entire display and compositor side.
>=20
> My idea was that we'd instead link to the large pile of introductory and
> overview talks further down in this file, if people want to get an
> overview over what drm does.

So the stub that's being patched here can be removed, right?

>=20
> If you want I guess you could add some links to the relevant wikipedia
> pages, I think they also do a fairly decent job of explaining the big
> picture.

What articles?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--esmnYBZSXAl4HZ/C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaED6agAKCRD2uYlJVVFO
o+P/AP46+k76LZr5ysuDahlolJMYUhTpQvrwrM4YWtWsu9yU8QEA9v9QEfg1I8Ew
mwig43hchoMKvLYr3f/QQu4dFHZ1fQ0=
=capg
-----END PGP SIGNATURE-----

--esmnYBZSXAl4HZ/C--
