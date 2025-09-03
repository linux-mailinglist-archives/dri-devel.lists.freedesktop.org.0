Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E12B4264C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ACD10E8EB;
	Wed,  3 Sep 2025 16:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MycRYfM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3310E8ED
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:12:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3d2564399a5so66263f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756915943; x=1757520743; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mSH3Zacp/f+cickpwsilQ+TYRotewL36J8+/+EeU+iA=;
 b=MycRYfM8p7k41EaoOrVBNDXNqzSkYYKsxBQOqtNvmR7Us7Qmty7gc80pCLRpIq2n7B
 w+/dqHZfENUlcdEh+NyxwCJ0JenQ29KUBgepTtInejhpBVuJlloOV4oMMsvxbXXAPr+6
 iJX6QXUhnZz5wBFZgFlnKuH6Ra+o8TqvS3idZbgpTs0IWGmVqKuuAl7B/BBE+XvrXV/I
 KW8lQIzwnGd2WUiNwtbHwKZgy/uQTy8Qww0DBq2bCfNuYDwfWNhZ1ARoFlUvAx/+5qxN
 mGurNJYsd1VKUWmjzBhw5atssLtLGU9W80ASUee7kGQsa4JvUxJTrEjRsqjerKeGcR8k
 I9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756915943; x=1757520743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSH3Zacp/f+cickpwsilQ+TYRotewL36J8+/+EeU+iA=;
 b=MvxM0CwrBBUeHKAyhKTsrFlgnjE2petiJUGCKKJXJZYehAw0eFWQYpBA2TUH79Fi19
 yp9NfTJX9DGxcyPuVl/BhV1QGyqZ5BUD3Rcturf2NXypa7vT3yUxrv6aWFeXuKtQSRtR
 mT6mxqRDA7U0kZbgftaIl6NfkBPvhvMQxz0QHbelx95CZB8rVPXkzEKy5dcbFYcPPwg0
 QOUU0VzPlRZAS8VblvvBn//dUVdXE0UxAlZIIIQh1yIjMXFnBMYlq/+TSNCh8bIsoVA6
 ad2qvp4XIVdWsqTfbkn8kJsE97r0IBIv2I3UPf38iFhoZ4ZnffxC43IViSSlb4t2b63P
 0w/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbN3kYjtRI4qJG3qOHVaeOTcWdjH7M0rR9lqscyjhyyGeQCFqBj7TnTjrZuQ2TCTeW1Gx/m/W8rQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4XZXLEOtxXpTzp6nM4DvRzFNy4GHAppi6rCGmHUrtAHahX8rc
 zH2W9Cns8e9SkvKQa4wHmjRBmcA5R+/v2eyM2AcxljlVNAy1MOlX+Cro
X-Gm-Gg: ASbGncvf7ck7mvzEFiHwfUzb1Xh6DDhBk2a8hktWp1La8KCRj+/Av5Ne8OLVDykowzL
 sUqe3OTw2w03cAuUJ/flzeZhR0C1ajnPIHgGlMFydQWvCKOfA/OYDqbaiZSgnoIuxjkvt8wu9ld
 HxuAaqv8kL4mqu0/035Z0ZSqDAX6ybhOJ9aDu9VF0XEdAt0aHWAkym5qh+k7p5zNyCRaDp3qGd6
 xNVNnt36SCVsZl1LyDhndNXnr4+ozfcDNCe6DJhJCulIrVzYq0iHJaM/Txt0AcS8/LVIXteGv4C
 HzpRFrPBwtSXUtLOVyOnVKkCOlZrKFjXMY11fg4w22FrWqw5kzaV2mRMKLiFpafESl97+J2Kh18
 3IQCfkFyqzRPg0G+5KWZFIefFdwpZcv1aEN+RJNkHJ6gGanu6jUaBfrAhaXMv9lyG29bGNLwta5
 Tlv3zPj1RIecU6630PrPY=
X-Google-Smtp-Source: AGHT+IHY1b3uufepgZb7f9ysqZmKK+/Hd8xA7Sv2qwFfaxBcYfbZY2Np9JxcRK+tnTw30ZuHhEZrcA==
X-Received: by 2002:a05:6000:2410:b0:3d8:e1de:7e4f with SMTP id
 ffacd0b85a97d-3d8e1edc849mr6275167f8f.21.1756915943185; 
 Wed, 03 Sep 2025 09:12:23 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34494776sm23960790f8f.61.2025.09.03.09.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:12:22 -0700 (PDT)
Date: Wed, 3 Sep 2025 18:12:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Frank van der Linden <fvdl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Message-ID: <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfbiwxgfuwekt25w"
Content-Disposition: inline
In-Reply-To: <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>
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


--nfbiwxgfuwekt25w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 09:04:24PM +0200, David Hildenbrand wrote:
>=20
> > > +>> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
> > > +                             unsigned int order_per_bit, const char =
*name)
> > > +{
> > > +       struct cma *cma;
> > > +       int ret;
> > > +
> > > +       ret =3D cma_check_memory(base, size);
> > > +       if (ret < 0)
> > > +               return ERR_PTR(ret);
> > > +
> > > +       cma =3D kzalloc(sizeof(*cma), GFP_KERNEL);
> > > +       if (!cma)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       cma_init_area(cma, name, size, order_per_bit);
> > > +       cma->ranges[0].base_pfn =3D PFN_DOWN(base);
> > > +       cma->ranges[0].early_pfn =3D PFN_DOWN(base);
> > > +       cma->ranges[0].count =3D cma->count;
> > > +       cma->nranges =3D 1;
> > > +
> > > +       cma_activate_area(cma);
> > > +
> > > +       return cma;
> > > +}
> > > +
> > > +void cma_free(struct cma *cma)
> > > +{
> > > +       kfree(cma);
> > > +}
> > > --
> > > 2.50.0
> >=20
> >=20
> > I agree that supporting dynamic CMA areas would be good. However, by
> > doing it like this, these CMA areas are invisible to the rest of the
> > system. E.g. cma_for_each_area() does not know about them. It seems a
> > bit inconsistent that there will now be some areas that are globally
> > known, and some that are not.
>=20
> Yeah, I'm not a fan of that.
>=20
> What is the big problem we are trying to solve here? Why do they have to =
be
> dynamic, why do they even have to support freeing?

Freeing isn't necessarily something that I've needed. It just seemed
like there wasn't really a good reason not to support it. The current
implementation here is not sufficient, though, because we'd need to
properly undo everything that cma_activate_area() does. I think the
cleanup: block in cma_activate_area() is probably sufficient.

The problem that I'm trying to solve is that currently, depending on the
use-case the kernel configuration needs to be changed and the kernel
rebuilt in order to support it. However there doesn't seem to be a good
technical reason for that limitation. The only reason it is this way
seems to be that, well, it's always been this way.

Thierry

--nfbiwxgfuwekt25w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi4aOMACgkQ3SOs138+
s6EWag//TG8GKL8D+KtYbrfxxwO/AEt7PxS9tKNaQ4uX/W4JVPtJSVqumPpLlATz
kSWcKAk8uyNWVRifoC26e2FU+eTup+VsLHQK/3g6/EEv0rt/jn5mJWu91ckJuH+N
nWHOeXCqeuGYN01d2wYby1PZ6Mtvbe6PlBifyLpvoAsUpN1n4HvE1CWu45gZIR5d
2WqzOWqLtDf4dyhpPKzu3xwXMgms8SyLEY64ulTMjg02QvIFPhJ/EN3VMs20tuX7
1UBiq4yw7ylaSoKAUdFEB9sOq4tpnoi9YY9fgoMhnCvwP5wZFwKbqYIhfGqzEGWo
Yad3Oba0P1qxdCFeOabbitgjRtZQO8pJNfGuJImpP4fE8Bz547KcSbcORfZvu16h
lJENGR4OXALHeSbgAELkUWTBnxAEHs356KGRoIxOarNda5xvFHp9joOODPz5s/j8
kIeQjrt23Vl4uqqlzr2n8ZwIQY6Whc2OuPnY/1/sKenSXKrqnfTudaRnsPMFQXPQ
ae+Iq9kecL40EJmZx03IkKwsxZ1dqfr4h0K9cQRa+mj5Xg+1TXfTXfcsaDLiqZeg
a1sQbf3ZbKYz88yJmRp2UrbJMGkqjnuwvvD2MkLtxqTS2pIl/sUGx/ltZDu592uU
dfOddTVrqV/MBj0YtLFpU4cFY/4pdIkqP01sN61Bbn+jvYFcceA=
=8yPm
-----END PGP SIGNATURE-----

--nfbiwxgfuwekt25w--
